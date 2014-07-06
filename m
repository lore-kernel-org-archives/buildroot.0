From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 6 Jul 2014 16:41:47 +0200
Subject: [Buildroot] [PATCH] infra: fix autotools .la fixing when no .la
 files are present
In-Reply-To: <297a83abd0584662acb7.1404656584@localhost>
References: <297a83abd0584662acb7.1404656584@localhost>
Message-ID: <20140706144147.GB3684@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-07-06 16:23 +0200, Thomas De Schampheleire spake thusly:
> Commit 6f638ea9c9c7bacc646430a74ad3dd2740eae676 ("infra: /usr support:
> STAGING_DIR can be outside BASE_DIR") changed a for-construct around 'sed
> -i' in a 'find | xargs sed -i'. However, if the find returns no results,
> sed complains with:
>     '/bin/sed: no input files'
> 
> Since a for construct is not very nice to handle this case, this commit
> changes the 'find | xargs sed -i' into 'find -exec sed -i'.

Why not use: 'xargs -r' instead?

    --no-run-if-empty
    -r     If the standard input does not contain any nonblanks, do
           not run the command.  Normally, the command is run once
           even if there is no input. This option is a GNU extension.

Using 'find -exec' is OK, but it spawns a process for each result. I
doubt we end up in a case with trillions of results, so the overhead
should not be noticeable.

Note that it is possible to have 'find' behave like xargs, with a
construct like:
    find DIR PREDICATES -exec command {} +

    -exec command {} +
           This  variant  of the -exec action runs the specified command on
           the selected files, but the command line is built  by  appending
           each  selected file name at the end; the total number of invoca?
           tions of the command will  be  much  less  than  the  number  of
           matched  files.   The command line is built in much the same way
           that xargs builds its command lines.  Only one instance of  `{}'
           is  allowed  within the command.  The command is executed in the
           starting directory.

Regards,
Yann E. MORIN.

> Reported-by: Rohit Kumar <rkthebest@gmail.com>
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> ---
>  package/pkg-autotools.mk |  8 ++++++--
>  1 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff -r c8ed6565ea09 -r 297a83abd058 package/pkg-autotools.mk
> --- a/package/pkg-autotools.mk	Thu Jul 03 12:35:57 2014 +0300
> +++ b/package/pkg-autotools.mk	Sun Jul 06 16:19:04 2014 +0200
> @@ -277,16 +277,20 @@
>  # of these directories as @BASE_DIR@ and @STAGING_DIR at . Note that
>  # STAGING_DIR can be outside BASE_DIR when the user sets BR2_HOST_DIR
>  # to a custom value.
> +# We use 'find ... -exec sed' instead of 'find ... | xargs sed' because
> +# find may return no results and 'sed -i' requires at least one input
> +# file.
>  #
>  ifndef $(2)_INSTALL_STAGING_CMDS
>  define $(2)_INSTALL_STAGING_CMDS
>  	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_INSTALL_STAGING_OPT) -C $$($$(PKG)_SRCDIR)
> -	find $$(STAGING_DIR)/usr/lib* -name "*.la" | xargs \
> +	find $$(STAGING_DIR)/usr/lib* -name "*.la" -exec \
>  		$$(SED) "s:$$(BASE_DIR):@BASE_DIR@:g" \
>  			-e "s:$$(STAGING_DIR):@STAGING_DIR@:g" \
>  			-e "s:\(['= ]\)/usr:\\1 at STAGING_DIR@/usr:g" \
>  			-e "s:@STAGING_DIR@:$$(STAGING_DIR):g" \
> -			-e "s:@BASE_DIR@:$$(BASE_DIR):g"
> +			-e "s:@BASE_DIR@:$$(BASE_DIR):g" \
> +		{} \;
>  endef
>  endif
>  
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

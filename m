From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 1 May 2020 22:57:58 +0200
Subject: [Buildroot] [PATCH 06/11] package/pkg-generic.mk: exclude the
 staging sub-directory
In-Reply-To: <20200430095249.782597-7-thomas.petazzoni@bootlin.com>
References: <20200430095249.782597-1-thomas.petazzoni@bootlin.com>
 <20200430095249.782597-7-thomas.petazzoni@bootlin.com>
Message-ID: <20200501205758.GB15673@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2020-04-30 11:52 +0200, Thomas Petazzoni spake thusly:
> Now that we are checking the host directory changes throughout all
> installation steps and not just during the "host installation step",
> it means that changes done within the staging directory (which is a
> subdir of the host directory) are also visible in the
> .files-list-host.txt file.
> 
> Note that this problem already potentially occurs if a host package is
> installing files in the staging directory: they would be listed in
> .files-list-host.txt even without the changes in this series.
> 
> To fix this up, we simply exclude files that are beneath the
> $(STAGING_SUBDIR). Note that we do that in all cases, so when
> searching $(HOST_DIR), $(HOST_DIR)/$(STAGING_SUBDIR) is excluded, but
> when searching $(TARGET_DIR), $(TARGET_DIR)/$(STAGING_SUBDIR) is
> excluded, and when search $(STAGING_DIR),
> $(STAGING_DIR)/$(STAGING_SUBDIR) is excluded. This is not a problem in
> practice since $(TARGET_DIR)/$(STAGING_SUBDIR) and
> $(STAGING_DIR)/$(STAGING_SUBDIR) don't exist, but it's not very
> nice. However, it allows to keep the code simple.

I think this might be an error, as we would be missing the detection of
files installed in $(DESTDIR)/$(PREFIX) or such...

However, I think we can do a bit better, see below...

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/pkg-generic.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 3fb1e5f8c3..2ae269bb3d 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -61,7 +61,7 @@ GLOBAL_INSTRUMENTATION_HOOKS += step_time
>  # $(2): suffix of file (optional)
>  define pkg_size_before
>  	cd $(1); \
> -	LC_ALL=C find . \( -type f -o -type l \) -printf '%T@:%i:%#m:%y:%s,%p\n' \
> +	LC_ALL=C find . -not -path './$(STAGING_SUBDIR)/*' \( -type f -o -type l \) -printf '%T@:%i:%#m:%y:%s,%p\n' \
>  		| LC_ALL=C sort > $($(PKG)_DIR)/.files-list$(2).before

Without the 'cd', and only ever ignoring staging:

    find $(1) -not -path '$(1)/$(STAGING_SUBDIR)/*' \( -type f -o -type l \) -printf '%T@:%i:%#m:%y:%s,%P\n' \

Notice the %P format specifier (upper-case 'P') instead of the previous
one (lower-case 'p').

Of course, totally untested (but would have the nice side-effect of
getting rid of the leadin ./ on all file names...

Regards,
Yann E. MORIN.

>  endef
>  
> @@ -69,7 +69,7 @@ endef
>  # $(2): suffix of file (optional)
>  define pkg_size_after
>  	cd $(1); \
> -	LC_ALL=C find . \( -type f -o -type l \) -printf '%T@:%i:%#m:%y:%s,%p\n' \
> +	LC_ALL=C find . -not -path './$(STAGING_SUBDIR)/*' \( -type f -o -type l \) -printf '%T@:%i:%#m:%y:%s,%p\n' \
>  		| LC_ALL=C sort > $($(PKG)_DIR)/.files-list$(2).after
>  	LC_ALL=C comm -13 \
>  		$($(PKG)_DIR)/.files-list$(2).before \
> -- 
> 2.25.4
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 4 Feb 2015 17:19:07 +0100
Subject: [Buildroot] [PATCH] Export BR2_EXTERNAL for post-build/support
 scripts
In-Reply-To: <1423064097-1151-1-git-send-email-julian@jusst.de>
References: <1423064097-1151-1-git-send-email-julian@jusst.de>
Message-ID: <20150204161907.GB4586@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Julian, All,

On 2015-02-04 16:34 +0100, Julian Scheel spake thusly:
> Especially post-build scripts might want to make use of BR2_EXTERNAL variable,
> so export it.

As discussed on IRC, there is another solution to export BR2_EXTERNAL,
which is to add it to EXTRA_ENV, like so:

    br2-external: make it available to post-{build,image} scripts
    
    Currently, BR2_EXTERNAL is not always exported to sub-processes that we
    spawn, like post-build or post-image scripts. This all depends on how
    the user passes BR2_EXTERNAL; consider the following:
    
      - make BR2_EXTERNAL=/path/to/br2-ext
      - BR2_EXTERNAL=/path/to/br2-ext make
    
    In the first case, it is just a make variable, not an environment
    variable, and thus not exported, while in the second case it is an
    environment variable and gets exported to all sub-processes make may
    spawn.
    
    Explicitly export it using EXTRA_ENV.
    
    Reported-by: Julian Scheel <julian@jusst.de>
    Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
    ---
     package/Makefile.in | 3 ++-
     1 file changed, 2 insertions(+), 1 deletion(-)
    
    diff --git a/package/Makefile.in b/package/Makefile.in
    index 70529f8..803b162 100644
    --- a/package/Makefile.in
    +++ b/package/Makefile.in
    @@ -326,7 +326,8 @@ HOST_MAKE_ENV = \
     EXTRA_ENV = \
        PATH=$(BR_PATH) \
        BR2_DL_DIR=$(BR2_DL_DIR) \
    -BUILD_DIR=$(BUILD_DIR)
    +BUILD_DIR=$(BUILD_DIR) \       
    +BR2_EXTERNAL=$(BR2_EXTERNAL)
     
     ################################################################################
     # settings we need to pass to configure

Regards,
Yann E. MORIN.

> Signed-off-by: Julian Scheel <julian@jusst.de>
> ---
>  Makefile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Makefile b/Makefile
> index e554a30..92ae3fa 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -349,6 +349,7 @@ endif
>  # Scripts in support/ or post-build scripts may need to reference
>  # these locations, so export them so it is easier to use
>  export BR2_CONFIG
> +export BR2_EXTERNAL
>  export TARGET_DIR
>  export STAGING_DIR
>  export HOST_DIR
> -- 
> 2.2.1
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

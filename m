From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 5 Sep 2020 14:50:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/apparmor: fix per-package build
 with apache
In-Reply-To: <20200901201046.2757475-1-fontaine.fabrice@gmail.com>
References: <20200901201046.2757475-1-fontaine.fabrice@gmail.com>
Message-ID: <20200905125058.GV14354@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

+Thomas, +Peter, +Arnout: please read in full, then there is a question
for you toward the end...

On 2020-09-01 22:10 +0200, Fabrice Fontaine spake thusly:
> Per-package build of apparmor with apache fails on:
> 
> /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/per-package/apparmor/host/x86_64-buildroot-linux-musl/sysroot/usr/bin/apxs  -c mod_apparmor.c -L/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/per-package/apparmor/host/bin/../x86_64-buildroot-linux-musl/sysroot/usr/lib -lapparmor
> 
> /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/per-package/apache/host/x86_64-buildroot-linux-musl/sysroot/usr/bin/../../usr/build-1/libtool --silent --mode=compile /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/per-package/apache/host/bin/x86_64-linux-gcc -prefer-pic -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -g2    -I/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/per-package/apache/host/x86_64-buildroot-linux-musl/sysroot/usr/include  -I/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/per-package/apache/host/x86_64-buildroot-linux-musl/sysroot/usr/bin/../../usr/include/apr-1   -I/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/per-package/apache/host/x86_64-buildroot-linux-musl/sysroot/usr/bin/../../usr/include/apr-1 -I/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/per-package/apache/host/x86_64-buildroot-linux-musl/sysroot/usr/bin/../../../../x86_64-buildroot-lin
>  ux-musl/sysroot/usr/include  -c -o mod_apparmor.lo mod_apparmor.c && touch mod_apparmor.slo
> mod_apparmor.c:28:10: fatal error: sys/apparmor.h: No such file or directory
>  #include <sys/apparmor.h>
>           ^~~~~~~~~~~~~~~~
> 
> The issue is that sys/appamor.h is not installed in the apache
> per-package directory which is mangled by
> APACHE_FIX_STAGING_APACHE_CONFIG, i.e.
> /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/per-package/apache/host/x86_64-buildroot-linux-musl/sysroot/usr/include
> 
> So help apxs to find sys/apparmor.h by passing
> -I$(STAGING_DIR)/usr/include

For a short time, I was a bit puzzled as to why adding the current
sysroot explicitly would fix the issue. That's in fact because
sys/apparmor.h comes from the libapparmor package, not from the apparmor
pacakge itself.

So, indeed, this technically fixes the issue.

However, see below, I think there is a more fundamental issue with apxs
and how we "fix" and use it.

> Fixes:
>  - http://autobuild.buildroot.org/results/ef1fcd57e0c09a2806bf2272bb21df6d3300b45b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/apparmor/apparmor.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/apparmor/apparmor.mk b/package/apparmor/apparmor.mk
> index f667966082..d5794b9585 100644
> --- a/package/apparmor/apparmor.mk
> +++ b/package/apparmor/apparmor.mk
> @@ -52,7 +52,8 @@ endif
>  ifeq ($(BR2_PACKAGE_APACHE),y)
>  APPARMOR_DEPENDENCIES += apache
>  APPARMOR_TOOLS += changehat/mod_apparmor
> -APPARMOR_MAKE_OPTS += APXS=$(STAGING_DIR)/usr/bin/apxs
> +APPARMOR_MAKE_OPTS += \
> +	APXS="$(STAGING_DIR)/usr/bin/apxs -I$(STAGING_DIR)/usr/include"

So, APXS contains hard-coded path to the apache's sysroot, but also host
directory. This can be seen in the traces you included in your commit
log (lines manually splitted for (relative) readability):

    /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/per-package/apparmor/host/x86_64-buildroot-linux-musl/sysroot/usr/bin/apxs \
        -c mod_apparmor.c \
        -L/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/per-package/apparmor/host/bin/../x86_64-buildroot-linux-musl/sysroot/usr/lib \
        -lapparmor
    /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/per-package/apache/host/x86_64-buildroot-linux-musl/sysroot/usr/bin/../../usr/build-1/libtool \
        --silent --mode=compile \
        /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/per-package/apache/host/bin/x86_64-linux-gcc \
        -prefer-pic -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -g2 \
        -I/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/per-package/apache/host/x86_64-buildroot-linux-musl/sysroot/usr/include \
        -I/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/per-package/apache/host/x86_64-buildroot-linux-musl/sysroot/usr/bin/../../usr/include/apr-1 \
        -I/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/per-package/apache/host/x86_64-buildroot-linux-musl/sysroot/usr/bin/../../usr/include/apr-1 \
        -I/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/per-package/apache/host/x86_64-buildroot-linux-musl/sysroot/usr/bin/../../../../x86_64-buildroot-linux-musl/sysroot/usr/include \
        -c -o mod_apparmor.lo mod_apparmor.c && touch mod_apparmor.slo

So, it is calling libtool from apache's host dir, and consequently, it
is calling gcc from apache's host dir, and uses include paths that point
to apache's sysroot.

This is no good.

In theory, we would want to fix apxs so we can only use path to the
current package's sysroot. This could probably be achievable, because:

  - apxs is a perl script, so we could either sed it to replace paths,
    but this is not noce, or we could fix it to introduce a variable
    that contains the base directory to look from;

  - there is a config_vars.mk file that contains hard-coded paths, which
    we could probably modify to also include a base directory to look
    from. For example, we could introduce "APXS_BASE_DIR = blabla", and
    then, right before the condifure step of dependant packages, fixup
    that file to inject the correct PPD base directory.

This would not be very different from the fixups we apply to the meson's
cross-compilation.conf configuration file, but there we do have an edge,
in that this is done by an infra.

However, for this apxs configs_var.mk, it is not so trivial, because
this is not part of an infra, and we do not have a way for packages to
export a hook that other packages would have to run automatically.

We could probably have the apache package provide this as a set of
macros:

    define APACHE_APXS_FIXUPS
        $(SED) blablaba $(STAGING_DIR)/usr/build/config_vars.mk
    endef

and then packages would do something like:

    APPARMOR_PRE_CONFIGURE_HOOKS += APACHE_APXS_FIXUPS

But:

 1. this is not so clean, because of the cross-package reference,

 2. we so far have only two packages using apxs, and that is probably
    too-big a hammer to introduce this generic tweaking...

So, I am still a bit undecided whether to apply this quick workaround
your patch is, or to require a full-blown, complete and correct fix...

Thomas, Peter, Arnout, thoughts?

Regards,
Yann E. MORIN.

>  endif
>  
>  define APPARMOR_BUILD_CMDS
> -- 
> 2.28.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

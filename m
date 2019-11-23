From: Carlos Santos <unixmania@gmail.com>
Date: Sat, 23 Nov 2019 08:17:23 -0300
Subject: [Buildroot] [git commit branch/next] glibc: install glibc utils
 to target
In-Reply-To: <20191123104533.B93648F470@busybox.osuosl.org>
References: <20191123104533.B93648F470@busybox.osuosl.org>
Message-ID: <CAJ4jsaf_Oi35Md=sKwP1u+OWf=a8J2wSeMJxA=NJejtsMONo5w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Nov 23, 2019 at 7:53 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> commit: https://git.buildroot.net/buildroot/commit/?id=c6cd512fe2e954b2ccc0412717c1c3380bc5f69b
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next
>
> With this patch we introduce an option for glibc, which
> installs getconf, ldconfig and ldd utilities on target, that
> may be useful in debugging. By default these utilities are
> built, but not installed to the target.
> ldd is a bash script, so it has bash dependency.
>
> Signed-off-by: Nikita Sobolev <Nikita.Sobolev@synopsys.com>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  package/glibc/Config.in | 10 ++++++++++
>  package/glibc/glibc.mk  |  7 +++++++
>  2 files changed, 17 insertions(+)
>
> diff --git a/package/glibc/Config.in b/package/glibc/Config.in
> index 7821251087..323767fc8a 100644
> --- a/package/glibc/Config.in
> +++ b/package/glibc/Config.in
> @@ -8,3 +8,13 @@ config BR2_PACKAGE_GLIBC
>         help
>           https://www.gnu.org/software/libc/
>  endif
> +
> +config BR2_PACKAGE_GLIBC_UTILS
> +       bool "Install glibc utilities"
> +       depends on BR2_PACKAGE_BASH
> +       help
> +         Enabling this option will compile and install the getconf,
> +         ldconfig and ldd glibc utilities for the target.
> +
> +comment "glibc utilities need bash"
> +       depends on !BR2_PACKAGE_BASH
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index c6acc43ff5..5cb19aabb9 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -143,10 +143,17 @@ ifeq ($(BR2_PACKAGE_GDB),y)
>  GLIBC_LIBS_LIB += libthread_db.so.*
>  endif
>
> +ifeq ($(BR2_PACKAGE_GLIBC_UTILS),y)
> +GLIBC_TARGET_UTILS_BIN = posix/getconf elf/ldconfig elf/ldd
> +endif
> +
>  define GLIBC_INSTALL_TARGET_CMDS
>         for libpattern in $(GLIBC_LIBS_LIB); do \
>                 $(call copy_toolchain_lib_root,$$libpattern) ; \
>         done
> +       $(foreach util,$(GLIBC_TARGET_UTILS_BIN), \
> +               $(INSTALL) -D -m 0755 $(@D)/build/$(util) $(TARGET_DIR)/bin/$(notdir $(util))

The usual path of these utilities on non-merged-usr systems (e.g. RHEL-6) is:

     [root at rhel-6-1 ~]# which getconf ldconfig ldd
    /usr/bin/getconf
    /sbin/ldconfig
    /usr/bin/ldd

> +       )
>  endef
>
>  $(eval $(autotools-package))
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Carlos Santos <unixmania@gmail.com>

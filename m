From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Jul 2018 22:11:02 +0200
Subject: [Buildroot] [PATCH 1/3] package/libva: bump version to 2.2.0
In-Reply-To: <20180714105513.16687-1-bernd.kuhls@t-online.de>
References: <20180714105513.16687-1-bernd.kuhls@t-online.de>
Message-ID: <20180714221102.3f88c992@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 14 Jul 2018 12:55:11 +0200, Bernd Kuhls wrote:

> +define LIBVA_DISABLE_STACK_PROTECTOR
> +	$(SED) 's%-fstack-protector%%' $(@D)/va/Makefile
> +endef
> +
> +ifeq ($(BR2_TOOLCHAIN_HAS_SSP),)
> +LIBVA_POST_CONFIGURE_HOOKS += LIBVA_DISABLE_STACK_PROTECTOR
> +endif

Please fix this properly, by adding an autoconf check testing if
-fstack-protector is available and/or making sure CFLAGS passed in the
environment are properly taken into account.

Here is an example that tests the availability of -fstack-protector in
autoconf (taken from the rpm package) :

if test "$GCC" = yes; then
    cflags_to_try="-fno-strict-aliasing -fstack-protector -Wempty-body"
    AC_MSG_CHECKING([supported compiler flags])
    old_cflags=$CFLAGS
    echo
    for flag in $cflags_to_try; do
        CFLAGS="$CFLAGS $flag -Werror"
        AC_LINK_IFELSE([AC_LANG_PROGRAM([[]], [[alloca(100);]])],[
                echo "   $flag"
                RPMCFLAGS="$RPMCFLAGS $flag"
        ],[])
        CFLAGS=$old_cflags
    done
    CFLAGS="$CFLAGS -fPIC -DPIC -D_REENTRANT -Wall -Wpointer-arith -Wmissing-prototypes -Wstrict-prototypes $RPMCFLAGS"
fi

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

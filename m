From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 22 Jul 2012 21:59:33 +0200
Subject: [Buildroot] [PATCH 5/5] gettext: convert to autotools-package
In-Reply-To: <66a7689f733357af7bb277467bc2198817fc9b69.1342732829.git.thomas.petazzoni@free-electrons.com>
References: <cover.1342732829.git.thomas.petazzoni@free-electrons.com>
 <66a7689f733357af7bb277467bc2198817fc9b69.1342732829.git.thomas.petazzoni@free-electrons.com>
Message-ID: <CAHXCMMK6B_qmuTS0z9agEWY05zz+GqgvsJuw0qF0Gf=mFx32XQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Maxime,

2012/7/19 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
[...]
> diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
> index 4dff941..35c0bd2 100644
> --- a/package/gettext/gettext.mk
> +++ b/package/gettext/gettext.mk
> @@ -3,147 +3,26 @@
>  # gettext
>  #
>  #############################################################
[...]
> +GETTEXT_VERSION = 0.16.1
> +GETTEXT_SITE = $(BR2_GNU_MIRROR)/gettext
> +GETTEXT_INSTALL_STAGING = YES
> +
> +GETTEXT_CONF_OPT += \
> +       --disable-libasprintf \
> +       --disable-openmp \
> +       --disable-rpath \
> +       --disable-java \
> +       --disable-native-java \
> +       --disable-csharp \
> +       --disable-relocatable \
> +       --without-emacs
> +
> +# When the gettext tools are not enabled in the configuration, we only
> +# install libintl to the target.
> +ifeq ($(BR2_PACKAGE_GETTEXT_TOOLS),)
> +define GETTEXT_INSTALL_TARGET_CMDS
> +       cp -dpf $(STAGING_DIR)/usr/lib/libintl*.so* $(TARGET_DIR)/usr/lib/
> +endef
>  endif
>
I would do:

ifeq ($(BR2_PACKAGE_GETTEXT_TOOLS),)
ifeq ($(BR2_ENABLE_LOCALE)\
$(BR2_TOOLCHAIN_BUILDROOT)$(BR2_TOOLCHAIN_CTNG_uClibc)\
$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC)$(BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC),yy)
# When the gettext tools are not enabled in the configuration, we only
# install libintl to the target if nls support is enabled and the libc
# does not provide it.
define GETTEXT_INSTALL_TARGET_CMDS
	cp -dpf $(STAGING_DIR)/usr/lib/libintl*.so* $(TARGET_DIR)/usr/lib/
endef
else
# Otherwise, when nls support is disabled or the libc provide libintl,
# just do nothing.
define GETTEXT_INSTALL_TARGET_CMDS
	:
endef
endif
endif

This way, the install-target command won't fail trying to install
libintl if nls is disabled (see log hereafter), and libintl won't be
installed if the libc already provide
i18n/l10n support.

--- snip ---
cp -dpf /home/samuel/data/workspace/src/buildroot/gettext-without-nls/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib/libintl*.so*
/home/samuel/data/workspace/src/buildroot/gettext-without-nls/output/target/usr/lib/
cp: cannot stat
?/home/samuel/data/workspace/src/buildroot/gettext-without-nls/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib/libintl*.so*?:
No such file or directory
make: *** [/home/samuel/data/workspace/src/buildroot/gettext-without-nls/output/build/gettext-0.16.1/.stamp_target_installed]
Error 1


> +$(eval $(autotools-package))
> --
> 1.7.9.5

Otherwise, the whole serie looks good to me!
So, for the whole serie + this change:
Acked-by: Samuel Martin <s.martin49@gmail.com>


-- 
Sam

From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 16 Sep 2012 12:16:24 +0200
Subject: [Buildroot] [PATCH 05/11] gettext: convert to autotools-package
In-Reply-To: <1346709781-18158-6-git-send-email-yann.morin.1998@free.fr>
References: <1346709781-18158-1-git-send-email-yann.morin.1998@free.fr>
 <1346709781-18158-6-git-send-email-yann.morin.1998@free.fr>
Message-ID: <CAHXCMMKnAqLPTJj9R4mdV0c9NJJGA19+aOX4HyDPE3=LKMTf+Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, Thomas, Maxime, all,

Comments inlined.

2012/9/4 Yann E. MORIN <yann.morin.1998@free.fr>:
> From: Maxime Ripard <maxime.ripard@free-electrons.com>
>
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> [yann.morin.1998 at free.fr: add license info]
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> CC: Samuel Martin <s.martin49@gmail.com>
> ---
>  package/gettext/Config.in  |   10 +++-
>  package/gettext/gettext.mk |  165 ++++++-------------------------------------
>  2 files changed, 32 insertions(+), 143 deletions(-)
>
[...]
> diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
> index 4dff941..1de8c3b 100644
> --- a/package/gettext/gettext.mk
> +++ b/package/gettext/gettext.mk
> @@ -3,147 +3,28 @@
>  # gettext
>  #
>  #############################################################
> -GETTEXT_VERSION:=0.16.1
> -GETTEXT_SOURCE:=gettext-$(GETTEXT_VERSION).tar.gz
> -GETTEXT_SITE:=$(BR2_GNU_MIRROR)/gettext
> -GETTEXT_DIR:=$(BUILD_DIR)/gettext-$(GETTEXT_VERSION)
> -GETTEXT_CAT:=$(ZCAT)
> -GETTEXT_BINARY:=gettext-runtime/src/gettext
> -GETTEXT_TARGET_BINARY:=usr/bin/gettext
> -
> -LIBINTL_TARGET_BINARY:=usr/lib/libintl.so
> -
> -$(DL_DIR)/$(GETTEXT_SOURCE):
> -        $(call DOWNLOAD,$(GETTEXT_SITE)/$(GETTEXT_SOURCE))
> -
> -gettext-source: $(DL_DIR)/$(GETTEXT_SOURCE)
> -
> -$(GETTEXT_DIR)/.unpacked: $(DL_DIR)/$(GETTEXT_SOURCE)
> -       $(GETTEXT_CAT) $(DL_DIR)/$(GETTEXT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
> -       support/scripts/apply-patches.sh $(GETTEXT_DIR) package/gettext/ gettext\*.patch
> -       $(call CONFIG_UPDATE,$(@D))
> -       touch $@
> -
> -ifneq ($(BR2_TOOLCHAIN_BUILDROOT),y)
> -IGNORE_EXTERNAL_GETTEXT:=--with-included-gettext
> +GETTEXT_VERSION = 0.16.1
> +GETTEXT_SITE = $(BR2_GNU_MIRROR)/gettext
> +GETTEXT_INSTALL_STAGING = YES
> +GETTEXT_LICENSE = GPLv2+
> +GETTEXT_LICENSE_FILES = COPYING
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

Since libintl is only built when the toolchain has locale/i18n support
enabled, this should be:

ifeq ($(BR2_PACKAGE_GETTEXT_TOOLS),)
ifeq ($(BR2_ENABLE_LOCALE),y)
define GETTEXT_INSTALL_TARGET_CMDS
       cp -dpf $(STAGING_DIR)/usr/lib/libintl*.so* $(TARGET_DIR)/usr/lib/
endef
endif
endif

BTW, I'm wondering what is the behavior if one uses a libc which
provides i18n/l10n support + install gettext, so libintl, on its
target.
A binary which has been linked against libintl, would it call
i18n/l10n functions from the libc or from libintl?
To make it shorter, shall we install libintl only if the libc also
provides i18n/l10n support?
Shall we allow to install gettext if the libc provides i18n/l10n support?


-- 
Sam

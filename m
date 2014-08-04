From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Aug 2014 22:23:45 +0200
Subject: [Buildroot] [PATCH 1/3] ladspa-sdk: new package
In-Reply-To: <1398374384-8814-1-git-send-email-martin@barkynet.com>
References: <1398374384-8814-1-git-send-email-martin@barkynet.com>
Message-ID: <20140804222345.65aacf17@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Martin Bark,

Sorry for the lack of feedback until now on these patches. See below
for a number of comments.

On Thu, 24 Apr 2014 22:19:42 +0100, Martin Bark wrote:
> LADSPA is a standard that allows software audio processors and
> effects to be plugged into a wide range of audio synthesis and
> recording packages.
> 
> Signed-off-by: Martin Bark <martin@barkynet.com>

First, looking at LADSPA, it seems like there has been no releases
since 2007 or so. Is this still actively developed and used? Googling
around, I've seen mentions of a new thing called LV2 which would be a
LADSPA replacement.

> diff --git a/package/Config.in b/package/Config.in
> index 07fd166..5956154 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -493,6 +493,7 @@ source "package/alsa-lib/Config.in"
>  source "package/audiofile/Config.in"
>  source "package/celt051/Config.in"
>  source "package/fdk-aac/Config.in"
> +source "package/ladspa-sdk/Config.in"

This will have to be rebased on top of the latest master.

>  source "package/libao/Config.in"
>  source "package/libcdaudio/Config.in"
>  source "package/libcdio/Config.in"
> diff --git a/package/ladspa-sdk/Config.in b/package/ladspa-sdk/Config.in
> new file mode 100644
> index 0000000..ec3d568
> --- /dev/null
> +++ b/package/ladspa-sdk/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_LADSPA_SDK
> +	bool "ladspa-sdk"

I've at least seen that one of the plugins is developed in C++, so a
dependency on BR2_INSTALL_LIBSDTCPP is needed here. Look at the manual
and other examples on how to add this dependency properly (including
the relevant Config.in comment).

> diff --git a/package/ladspa-sdk/ladspa-sdk-01-no-mkdirhier.patch b/package/ladspa-sdk/ladspa-sdk-01-no-mkdirhier.patch
> new file mode 100644
> index 0000000..d424594
> --- /dev/null
> +++ b/package/ladspa-sdk/ladspa-sdk-01-no-mkdirhier.patch
> @@ -0,0 +1,18 @@
> +Use mkdir -p instead of mkdirhier to avoid build-dep on xutils-dev

There should be a Signed-off-by line in all patches, separated with a
newline from the patch description and patch contents.

> diff --git a/package/ladspa-sdk/ladspa-sdk-04-fix-linkage-C-plugins.diff b/package/ladspa-sdk/ladspa-sdk-04-fix-linkage-C-plugins.diff

This one does not get applied, as it is named ".diff". And is it really
needed?

Also, the sequence number is not consecutive with 02 of the previous
patch.


> diff --git a/package/ladspa-sdk/ladspa-sdk-05-linking-order.patch b/package/ladspa-sdk/ladspa-sdk-05-linking-order.patch
> new file mode 100644
> index 0000000..a66def7
> --- /dev/null
> +++ b/package/ladspa-sdk/ladspa-sdk-05-linking-order.patch
> @@ -0,0 +1,37 @@
> +Description: Correct linking order to prevent FTBFS with GCC4.5 + binutils-gold.
> +Author: Alessio Treglia <quadrispro@ubuntu.com>

Please add your Signed-off-by here as well, in addition to the Author:
information.

That's typically the kind of patch that worries me: gcc 4.5 has been
released years and years ago, and still issues with this compiler have
not been solved upstream.

> diff --git a/package/ladspa-sdk/ladspa-sdk-06-cross-compile-fix.patch b/package/ladspa-sdk/ladspa-sdk-06-cross-compile-fix.patch
> new file mode 100644
> index 0000000..549b6eb
> --- /dev/null
> +++ b/package/ladspa-sdk/ladspa-sdk-06-cross-compile-fix.patch

Missing description + Signed-off-by.


> +################################################################################
> +#
> +# ladspa-sdk
> +#
> +################################################################################
> +
> +LADSPA_SDK_VERSION = 1.13
> +LADSPA_SDK_SOURCE = ladspa_sdk_$(LADSPA_SDK_VERSION).tgz
> +LADSPA_SDK_SITE = http://www.ladspa.org/download/
> +LADSPA_SDK_LICENSE = LGPLv2.1+
> +LADSPA_SDK_LICENSE_FILES = doc/COPYING
> +LADSPA_SDK_INSTALL_STAGING = YES
> +
> +define LADSPA_SDK_BUILD_CMDS
> +	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/src targets
> +endef
> +
> +define LADSPA_SDK_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0644 $(@D)/plugins/*.so $(TARGET_DIR)/usr/lib/ladspa/.

The "." at the end is making the installation fail.

> +	$(INSTALL) -D -m 0755 $(@D)/bin/* $(TARGET_DIR)/usr/bin/.
> +endef
> +
> +define LADSPA_SDK_INSTALL_STAGING_CMDS
> +	$(INSTALL) -D -m 0644 $(@D)/src/ladspa.h $(STAGING_DIR)/usr/include/.

Same here.

Also, what about using "make install" instead? Either by patching the
makefile to add $(DESTDIR) support, or by passing explicitly values for
INSTALL_PLUGINS_DIR, INSTALL_INCLUDE_DIR and INSTALL_BINARY_DIR ?

While waiting for your new version of this patch, I'll mark this patch
as "Changes Requested" in our patch tracking system.

Thanks for your contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

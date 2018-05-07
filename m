From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 May 2018 17:27:40 +0200
Subject: [Buildroot] [mfgtools][PATCH] mfgtools: Allow target build
In-Reply-To: <1525444322-25581-1-git-send-email-vincent.prince.fr@gmail.com>
References: <1525444322-25581-1-git-send-email-vincent.prince.fr@gmail.com>
Message-ID: <20180507172740.129d7641@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Vincent,

Thanks for this contribution!

On Fri,  4 May 2018 16:32:02 +0200, Vincent Prince wrote:

> diff --git a/package/mfgtools/0001-Fix-CXXFLAGS-in-CMakeList.patch b/package/mfgtools/0001-Fix-CXXFLAGS-in-CMakeList.patch
> new file mode 100644
> index 0000000..91933df
> --- /dev/null
> +++ b/package/mfgtools/0001-Fix-CXXFLAGS-in-CMakeList.patch
> @@ -0,0 +1,58 @@
> +--- a/MfgToolLib/CMakeLists.txt
> ++++ b/MfgToolLib/CMakeLists.txt

All patches need a description + Signed-off-by. See
https://buildroot.org/downloads/manual/manual.html#_format_and_licensing_of_the_package_patches.

> diff --git a/package/mfgtools/mfgtools.mk b/package/mfgtools/mfgtools.mk
> index e4663a8..24a9d9f 100644
> --- a/package/mfgtools/mfgtools.mk
> +++ b/package/mfgtools/mfgtools.mk
> @@ -11,19 +11,35 @@ MFGTOOLS_LICENSE = BSD-3-Clause or CPOL
>  MFGTOOLS_LICENSE_FILES = LICENSE README.txt
>  HOST_MFGTOOLS_DEPENDENCIES = host-libusb
>  
> +MFGTOOLS_CFLAGS = \
> +	$(CFLAGS) $(LDFLAGS) -std=c++11 -lpthread \

CFLAGS and LDFLAGS don't have any meaning in Buildroot, you probably
meant TARGET_CFLAGS and TARGET_LDFLAGS.

> +	-L$(@D)/MfgToolLib -lMfgToolLib -I$(@D)/MfgToolLib \
> +	-lusb-1.0 -I$(TARGET_DIR)/usr/include/libusb-1.0 \

You can't use header files from TARGET_DIR, since you have no guarantee
that they are installed here. The headers are in STAGING_DIR instead.

> +define MFGTOOLS_CLI_BUILD
> +	$(CONFIGURE_OPTS) $(MAKE) CC="$(TARGET_CXX)" \

CONFIGURE_OPTS don't exist in Buildroot, it's TARGET_CONFIGURE_OPTS.
THen you don't need to pass CC="$(TARGET_CXX)", because it's part of
TARGET_CONFIGURE_OPTS.

> +define MFGTOOLS_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 755 $(@D)/MfgToolLib/libMfgToolLib.so \
> +		$(TARGET_DIR)/usr/lib/libMfgToolLib.so
> +	$(INSTALL) -D -m 755 $(@D)/TestPrgm/mfgtoolcli \
> +		$(TARGET_DIR)/usr/bin/mfgtoolcli
> +endef

Add a blank line here.

>  define HOST_MFGTOOLS_INSTALL_CMDS
>  	$(INSTALL) -D -m 755 $(@D)/MfgToolLib/libMfgToolLib.so \
>  		$(HOST_DIR)/lib/libMfgToolLib.so
> @@ -31,4 +47,5 @@ define HOST_MFGTOOLS_INSTALL_CMDS
>  		$(HOST_DIR)/bin/mfgtoolcli
>  endef
>  
> +$(eval $(cmake-package))
>  $(eval $(host-cmake-package))

Could you rework your patch according to those comments, and send an
updated version ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

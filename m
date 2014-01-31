From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 31 Jan 2014 09:31:04 +0100
Subject: [Buildroot] [PATCH v3 3/6] *.mk: replace (TARGET|HOST)_PATH by
 BR2_PATH
In-Reply-To: <1391114333-28001-4-git-send-email-s.martin49@gmail.com>
References: <1391114333-28001-1-git-send-email-s.martin49@gmail.com>
 <1391114333-28001-4-git-send-email-s.martin49@gmail.com>
Message-ID: <20140131093104.5afcf411@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Thu, 30 Jan 2014 21:38:50 +0100, Samuel Martin wrote:
> Thanks to the 2 previous patches of the series, BR2_PATH conatins

conatins -> contains

> diff --git a/package/bustle/bustle.mk b/package/bustle/bustle.mk
> index 2330c08..c488dfa 100644
> --- a/package/bustle/bustle.mk
> +++ b/package/bustle/bustle.mk
> @@ -11,7 +11,7 @@ BUSTLE_LICENSE_FILES = LICENSE
>  BUSTLE_DEPENDENCIES = libglib2 libpcap host-pkgconf
>  
>  define BUSTLE_BUILD_CMDS
> -	PATH=$(TARGET_PATH) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
> +	PATH=$(BR2_PATH) $(MAKE) $(TARGET_CONFIGURE_OPTS) \

This should rather be changed to:

	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS)

since TARGET_MAKE_ENV contains the proper definition for PATH. This
change could be done as a preparation commit.

> @@ -11,7 +11,7 @@ LIBHID_INSTALL_STAGING = YES
>  LIBHID_AUTORECONF = YES
>  # configure runs libusb-config for cflags/ldflags. Ensure it picks up
>  # the target version
> -LIBHID_CONF_ENV = PATH=$(STAGING_DIR)/usr/bin:$(TARGET_PATH)
> +LIBHID_CONF_ENV = PATH=$(STAGING_DIR)/usr/bin:$(BR2_PATH)

Having $(STAGING_DIR)/usr/bin in the PATH looks really wrong. Instead
of doing that, we should point libhid configure script to the
libusb-config script by fixing m4/md_check_libusb018b.m4.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

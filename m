From: Hebbar <gururajakr@sanyo.co.in>
Date: Fri, 14 Sep 2007 01:15:13 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  lm-sensors
In-Reply-To: <20070901180109.C927EA5D29@busybox.net>
References: <20070901180109.C927EA5D29@busybox.net>
Message-ID: <12670634.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi aldot,

  make mklibs fails for lm-sensors because of missing lib libsensors.so.3.
When i searched i actually found it in $(LM_SENSORS_DIR)/lib/ folder
symbolically linked to libsensors.so.3.1.4. so i think we need to copy it
from here to root/usr/lib directory as the sensors binary is placed there.

Regards
Gururaja



aldot wrote:
> 
> Author: aldot
> Date: 2007-09-01 11:01:08 -0700 (Sat, 01 Sep 2007)
> New Revision: 19756
> 
> Log:
> - add lm-sensors package
> 
> 
> Added:
>    trunk/buildroot/package/lm-sensors/
>    trunk/buildroot/package/lm-sensors/Config.in
>    trunk/buildroot/package/lm-sensors/lm-sensors.mk
> 
> Modified:
>    trunk/buildroot/package/Config.in
> 
> 
> Changeset:
> Modified: trunk/buildroot/package/Config.in
> ===================================================================
> --- trunk/buildroot/package/Config.in	2007-09-01 17:33:19 UTC (rev 19755)
> +++ trunk/buildroot/package/Config.in	2007-09-01 18:01:08 UTC (rev 19756)
> @@ -221,6 +221,7 @@
>  source "package/libaio/Config.in"
>  source "package/libraw1394/Config.in"
>  source "package/libusb/Config.in"
> +source "package/lm-sensors/Config.in"
>  source "package/lvm2/Config.in"
>  source "package/mdadm/Config.in"
>  source "package/memtester/Config.in"
> 
> Added: trunk/buildroot/package/lm-sensors/Config.in
> ===================================================================
> --- trunk/buildroot/package/lm-sensors/Config.in	                       
> (rev 0)
> +++ trunk/buildroot/package/lm-sensors/Config.in	2007-09-01 18:01:08 UTC
> (rev 19756)
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_LM_SENSORS
> +	bool "lm-sensors"
> +	select BR2_PACKAGE_LIBSYSFS
> +	default n
> +	help
> +	  Lm-sensors is a hardware health monitoring package for
> +	  Linux. It allows you to access information from
> +	  temperature, voltage, and fan speed sensors. It
> +	  works with most newer systems.
> +
> +	  http://www.lm-sensors.org/
> +
> 
> Added: trunk/buildroot/package/lm-sensors/lm-sensors.mk
> ===================================================================
> --- trunk/buildroot/package/lm-sensors/lm-sensors.mk	                       
> (rev 0)
> +++ trunk/buildroot/package/lm-sensors/lm-sensors.mk	2007-09-01 18:01:08
> UTC (rev 19756)
> @@ -0,0 +1,59 @@
> +#############################################################
> +#
> +# lm-sensors
> +#
> +#############################################################
> +LM_SENSORS_VERSION:=2.10.4
> +LM_SENSORS_SOURCE:=lm-sensors_$(LM_SENSORS_VERSION).orig.tar.gz
> +LM_SENSORS_PATCH:=lm-sensors_$(LM_SENSORS_VERSION)-1.diff.gz
> +LM_SENSORS_SITE:=ftp://ftp.debian.org/debian/pool/main/l/lm-sensors/
> +LM_SENSORS_DIR:=$(BUILD_DIR)/lm_sensors-$(LM_SENSORS_VERSION)
> +LM_SENSORS_CAT:=$(ZCAT)
> +LM_SENSORS_BINARY:=prog/sensors/sensors
> +LM_SENSORS_TARGET_BINARY:=usr/bin/sensors
> +
> +$(DL_DIR)/$(LM_SENSORS_SOURCE):
> +	$(WGET) -P $(DL_DIR) $(LM_SENSORS_SITE)/$(LM_SENSORS_SOURCE)
> +
> +$(DL_DIR)/$(LM_SENSORS_PATCH):
> +	$(WGET) -P $(DL_DIR) $(LM_SENSORS_SITE)/$(LM_SENSORS_PATCH)
> +
> +lm-sensors-source: $(DL_DIR)/$(LM_SENSORS_SOURCE)
> $(DL_DIR)/$(LM_SENSORS_PATCH)
> +
> +$(LM_SENSORS_DIR)/.unpacked: $(DL_DIR)/$(LM_SENSORS_SOURCE)
> $(DL_DIR)/$(LM_SENSORS_PATCH)
> +	$(LM_SENSORS_CAT) $(DL_DIR)/$(LM_SENSORS_SOURCE) | tar -C $(BUILD_DIR)
> $(TAR_OPTIONS) -
> +	toolchain/patch-kernel.sh $(LM_SENSORS_DIR) package/lm-sensors/
> lm-sensors\*.patch
> +ifneq ($(LM_SENSORS_PATCH),)
> +	(cd $(LM_SENSORS_DIR) && $(LM_SENSORS_CAT) $(DL_DIR)/$(LM_SENSORS_PATCH)
> | patch -p1)
> +	if [ -d $(LM_SENSORS_DIR)/debian/patches ]; then \
> +		toolchain/patch-kernel.sh $(LM_SENSORS_DIR)
> $(LM_SENSORS_DIR)/debian/patches \*.patch; \
> +	fi
> +endif
> +	touch $@
> +
> +$(LM_SENSORS_DIR)/$(LM_SENSORS_BINARY): $(LM_SENSORS_DIR)/.unpacked
> +	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(LM_SENSORS_DIR) \
> +		LINUX="$(LINUX_DIR)" KERNELVERSION=$(LINUX_HEADERS_VERSION) \
> +		I2C_HEADERS=$(LINUX_DIR)/include \
> +		DESTDIR=$(TARGET_DIR) user
> +
> +$(TARGET_DIR)/$(LM_SENSORS_TARGET_BINARY):
> $(LM_SENSORS_DIR)/$(LM_SENSORS_BINARY)
> +	cp -dpf $(LM_SENSORS_DIR)/$(LM_SENSORS_BINARY) $@
> +	$(STRIP) $(STRIP_STRIP_ALL) $@
> +
> +lm-sensors: uclibc libsysfs $(TARGET_DIR)/$(LM_SENSORS_TARGET_BINARY)
> +
> +lm-sensors-clean:
> +	-$(MAKE) -C $(LM_SENSORS_DIR) clean
> +	rm -f $(TARGET_DIR)/$(LM_SENSORS_TARGET_BINARY)
> +
> +lm-sensors-dirclean:
> +	rm -rf $(LM_SENSORS_DIR)
> +#############################################################
> +#
> +# Toplevel Makefile options
> +#
> +#############################################################
> +ifeq ($(strip $(BR2_PACKAGE_LM_SENSORS)),y)
> +TARGETS+=lm-sensors
> +endif
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
> 
> 

-- 
View this message in context: http://www.nabble.com/svn-commit%3A-trunk-buildroot-package%3A--lm-sensors-tf4365242.html#a12670634
Sent from the BuildRoot mailing list archive at Nabble.com.

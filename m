From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 09 Aug 2011 13:28:54 +0200
Subject: [Buildroot] [PATCH] ti-utils: bump version and clean up
In-Reply-To: <4E3F8BE5.1030607@visionsystems.de> (Yegor Yefremov's message of
 "Mon, 08 Aug 2011 09:10:29 +0200")
References: <4E3F8BE5.1030607@visionsystems.de>
Message-ID: <87liv2kemh.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yegor" == Yegor Yefremov <yegor_sub1@visionsystems.de> writes:

 Yegor> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Thanks, committed with some fixes (see below)

 Yegor> -TI_UTILS_VERSION = fbceab8f228cff80fd29b830bb85a188c69def08
 Yegor> +TI_UTILS_VERSION = 06dbdb2727354b5f3ad7c723897f40051fddee49
 Yegor>  TI_UTILS_SITE = git://github.com/gxk/ti-utils.git
 Yegor>  TI_UTILS_DEPENDENCIES = libnl
 Yegor> -
 Yegor> +

You have a lot of whitespace damage where you have added a space at the
beginning of each line.

 Yegor>  define TI_UTILS_BUILD_CMDS
 Yegor> -	$(MAKE1) NFSROOT="$(STAGING_DIR)" CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS)" \
 Yegor> -		-C $(@D) all
 Yegor> + 	$(MAKE1) NFSROOT="$(STAGING_DIR)"	\
 Yegor> + 	CC="$(TARGET_CC) $(TARGET_CFLAGS)	\
 Yegor> + 	$(TARGET_LDFLAGS)" -C $(@D) all

I prefer to indent the followup lines (like you do below) to make it
clear that it is part of the previous statement.

 Yegor>  endef
 Yegor> -
 Yegor> +
 Yegor>  define TI_UTILS_INSTALL_TARGET_CMDS
 Yegor> -	$(INSTALL) -m 0755 $(@D)/calibrator \
 Yegor> -		$(TARGET_DIR)/usr/bin/calibrator
 Yegor> -	$(INSTALL) -m 0755 $(@D)/scripts/go.sh \
 Yegor> -		$(TARGET_DIR)/usr/bin/go.sh
 Yegor> + 	mkdir -p $(TARGET_DIR)/usr/share/ti-utils/
 Yegor> + 	mkdir -p $(TARGET_DIR)/usr/share/ti-utils/scripts
 Yegor> + 	mkdir -p $(TARGET_DIR)/usr/share/ti-utils/ini_files
 Yegor> + 	mkdir -p $(TARGET_DIR)/usr/share/ti-utils/ini_files/127x
 Yegor> + 	mkdir -p $(TARGET_DIR)/usr/share/ti-utils/ini_files/128x

You can use install -D instead of these explicit mkdirs.

 Yegor> +
 Yegor> + 	$(INSTALL) -m 0755 $(@D)/calibrator					\
 Yegor> + 		$(TARGET_DIR)/usr/bin/calibrator
 Yegor> + 	$(INSTALL) -m 0755 $(@D)/scripts/go.sh					\
 Yegor> +		$(TARGET_DIR)/usr/share/ti-utils/scripts/go.sh
 Yegor> +

Please keep lines < 80 chars.

 Yegor> + 	$(INSTALL) -m 0644 $(@D)/ini_files/127x/RFMD_S_3.5.ini			\
 Yegor> + 		$(TARGET_DIR)/usr/share/ti-utils/ini_files/127x/RFMD_S_3.5.ini
 Yegor> + 	$(INSTALL) -m 0644 $(@D)/ini_files/127x/TQS_D_1.0.ini			\
 Yegor> + 		$(TARGET_DIR)/usr/share/ti-utils/ini_files/127x/TQS_D_1.0.ini
 Yegor> + 	$(INSTALL) -m 0644 $(@D)/ini_files/127x/TQS_D_1.7.ini			\
 Yegor> + 		$(TARGET_DIR)/usr/share/ti-utils/ini_files/127x/TQS_D_1.7.ini
 Yegor> + 	$(INSTALL) -m 0644 $(@D)/ini_files/127x/TQS_S_2.5.ini			\
 Yegor> + 		$(TARGET_DIR)/usr/share/ti-utils/ini_files/127x/TQS_S_2.5.ini
 Yegor> + 	$(INSTALL) -m 0644 $(@D)/ini_files/127x/TQS_S_2.6.ini			\
 Yegor> + 		$(TARGET_DIR)/usr/share/ti-utils/ini_files/127x/TQS_S_2.6.ini
 Yegor> +
 Yegor> + 	$(INSTALL) -m 0644 $(@D)/ini_files/128x/RFMD_S_3.5.ini			\
 Yegor> + 		$(TARGET_DIR)/usr/share/ti-utils/ini_files/128x/RFMD_S_3.5.ini
 Yegor> + 	$(INSTALL) -m 0644 $(@D)/ini_files/128x/TQS_D_1.0.ini			\
 Yegor> + 		$(TARGET_DIR)/usr/share/ti-utils/ini_files/128x/TQS_D_1.0.ini
 Yegor> + 	$(INSTALL) -m 0644 $(@D)/ini_files/128x/TQS_D_1.7.ini			\
 Yegor> + 		$(TARGET_DIR)/usr/share/ti-utils/ini_files/128x/TQS_D_1.7.ini
 Yegor> + 	$(INSTALL) -m 0644 $(@D)/ini_files/128x/TQS_S_2.6.ini			\
 Yegor> + 		$(TARGET_DIR)/usr/share/ti-utils/ini_files/128x/TQS_S_2.6.ini

Instead of all this we can just do:
        cp -r $(@D)/ini_files $(TARGET_DIR)/usr/share/ti-utils

-- 
Bye, Peter Korsgaard

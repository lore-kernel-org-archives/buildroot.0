From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 26 Jan 2012 13:43:03 +0100
Subject: [Buildroot] [PATCH v3] New package: linux-firmware
In-Reply-To: <ad47d31d76e74e891bacdf8b9470a643@zacarias.com.ar> (Gustavo
 Zacarias's message of "Thu, 26 Jan 2012 09:00:47 -0300")
References: <1327577414-11374-1-git-send-email-yegorslists@googlemail.com>
 <ad47d31d76e74e891bacdf8b9470a643@zacarias.com.ar>
Message-ID: <8762fy4otk.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

Hi,

 Gustavo> These constructs can get too long too fast, why not something
 Gustavo> like...

 Gustavo> ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT2XXX),y)
 Gustavo>     LINUX_FIRMWARE_FILES += rt2860.bin rt2870.bin rt30*.bin
 Gustavo> LICENCE.ralink-firmware.txt
 Gustavo> endif

 Gustavo> define LINUX_FIRMWARE_INSTALL_TARGET_CMDS
 Gustavo>     cp -af $(addprefix $(@D)/, $(LINUX_FIRMWARE_FILES))
 Gustavo> $(TARGET_DIR)/lib/firmware
 Gustavo> endef

Agreed, except you should use a loop and install -D, so subdirs are
supported.

E.G.

        for i in $(LINUX_FIRMWARE_FILES); do \
          $i(INSTALL) -m 0644 -D $(@D)/$$i $(TARGET_DIR)/lib/firmware/$$i; \
        done

-- 
Bye, Peter Korsgaard

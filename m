From: Jeff Gray <jeff.gray@sato-global.com>
Date: Mon, 5 Sep 2016 18:39:25 +1000
Subject: [Buildroot] Error with OVERRIDE_SRCDIR in 2016.08
Message-ID: <CAHb0ztmgZ9sMB0OxF5D7DYmZaU4vekUDcyxp96Ws+w84ZM_R+Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm having a problem after upgrading from 2016.05 to 2016.08. I have a
number of local applications that I install from BR2_EXTERNAL. This used to
work fine in 2016.05, but now I get messages like this when making
buildroot (showing one example and using the macro for clarity):
$(BR2_EXTERNAL)/package/svp/gpio/gpio.mk:18: *** GPIO_SITE cannot be empty
when GPIO_SOURCE is not.  Stop.

I have placed the package files at $(BR2_EXTERNAL)/package/svp/gpio/ and
the source files at $(BR2_EXTERNAL)/src/gpio

My gpio.mk file is:
--------------
GPIO_VERSION = 1.0
GPIO_OVERRIDE_SRCDIR = $(BR2_EXTERNAL)/src/gpio/
define GPIO_BUILD_CMDS
$(MAKE) CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS)" -C $(@D)
endef
define GPIO_INSTALL_TARGET_CMDS
$(INSTALL) -m 0755 -D $(@D)/gpio $(TARGET_DIR)/usr/bin/gpio
endef
$(eval $(generic-package))
---------------

I have a $(BR2_EXTERNAL)/Config.in that contains lines like this:
source "$BR2_EXTERNAL/package/svp/gpio/Config.in"
... and a $(BR2_EXTERNAL)/external.mk that contains this:
include $(sort $(wildcard $(BR2_EXTERNAL)/package/svp/*/*.mk))

Can anyone think of a cause for the error message? Has the way this sort of
project is configured changed? I looked through the manual and couldn't see
anything. I checked that the output/.br-external is the same for both
versions.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160905/9550d759/attachment.html>

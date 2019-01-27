From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 27 Jan 2019 16:59:40 -0200
Subject: [Buildroot] [PATCH 5/8] package/usb_modeswitch: avoid overriding
 variables
In-Reply-To: <20190127185943.1136-1-ricardo.martincoski@gmail.com>
References: <20190127185943.1136-1-ricardo.martincoski@gmail.com>
Message-ID: <20190127185943.1136-6-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Overriding variables in packages recipes is an error-prone practice.

Current behavior of installing either only as a script or only as a
binary is intended, as describe in the commit log of "d3e4db4e34
usb_modeswitch: bump to version 1.2.6" from 2013.

Rewrite the code to keep the same behavior while replacing variable
override [1] by conditional assignments [2].

[1]
VAR = ...
if ...
VAR = ...

[2]
if ...
VAR = ...
else
VAR = ...

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
The output for below commands is the same in current master (f6843a75fe)
and after this patch:
$ make -s BR2_HAVE_DOT_CONFIG=y BR2_PACKAGE_TCL_SHLIB_ONLY=y printvars \
  VARS='USB_MODESWITCH_BUILD_TARGETS USB_MODESWITCH_INSTALL_TARGETS'
USB_MODESWITCH_BUILD_TARGETS=script
USB_MODESWITCH_INSTALL_TARGETS=install-script
$ make -s BR2_HAVE_DOT_CONFIG=y printvars \
  VARS='USB_MODESWITCH_BUILD_TARGETS USB_MODESWITCH_INSTALL_TARGETS'
USB_MODESWITCH_BUILD_TARGETS=static
USB_MODESWITCH_INSTALL_TARGETS=install-static
---
 package/usb_modeswitch/usb_modeswitch.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/usb_modeswitch/usb_modeswitch.mk b/package/usb_modeswitch/usb_modeswitch.mk
index 8b93e086e3..9832d3c808 100644
--- a/package/usb_modeswitch/usb_modeswitch.mk
+++ b/package/usb_modeswitch/usb_modeswitch.mk
@@ -1,38 +1,38 @@
 ################################################################################
 #
 # usb_modeswitch
 #
 ################################################################################
 
 USB_MODESWITCH_VERSION = 2.5.2
 USB_MODESWITCH_SOURCE = usb-modeswitch-$(USB_MODESWITCH_VERSION).tar.bz2
 USB_MODESWITCH_SITE = http://www.draisberghof.de/usb_modeswitch
 USB_MODESWITCH_DEPENDENCIES = libusb
 USB_MODESWITCH_LICENSE = GPL-2.0+
 USB_MODESWITCH_LICENSE_FILES = COPYING
 # Package does not build in parallel due to improper make rules
 USB_MODESWITCH_MAKE = $(MAKE1)
 
-USB_MODESWITCH_BUILD_TARGETS = static
-USB_MODESWITCH_INSTALL_TARGETS = install-static
-
 ifeq ($(BR2_PACKAGE_TCL)$(BR2_PACKAGE_TCL_SHLIB_ONLY),y)
 USB_MODESWITCH_DEPENDENCIES += tcl
 USB_MODESWITCH_BUILD_TARGETS = script
 USB_MODESWITCH_INSTALL_TARGETS = install-script
+else
+USB_MODESWITCH_BUILD_TARGETS = static
+USB_MODESWITCH_INSTALL_TARGETS = install-static
 endif
 
 # build system of embedded jimtcl doesn't use autotools, but does use
 # an old version of gnuconfig which doesn't know all the architectures
 # supported by Buildroot, so update config.guess / config.sub like we
 # do in pkg-autotools.mk
 USB_MODESWITCH_POST_PATCH_HOOKS += UPDATE_CONFIG_HOOK
 
 define USB_MODESWITCH_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
 		$(if $(BR2_INSTALL_LIBSTDCPP),,CXX=false) \
 		CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE -Wall -I." \
 		JIM_CONFIGURE_OPTS="--host=$(GNU_TARGET_NAME) --build=$(GNU_HOST_NAME)" \
 		-C $(@D) $(USB_MODESWITCH_BUILD_TARGETS)
 endef
 
-- 
2.17.1

From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Fri, 23 Nov 2012 10:16:36 +0100
Subject: [Buildroot] [PATCH] AVR32: fix libusb build
Message-ID: <1353662196-3350-1-git-send-email-maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The libc of the avr32 toolchains seem to lack the timerfd-associated
functions.

Pass --disable-timerfd to libusb configure script when building for
avr32.

Fixes most of the recent avr32 breakages, such as
http://autobuild.buildroot.org/results/f418b6c0b026891c27467f61444b6eac8c105681
or
http://autobuild.buildroot.org/results/1a9e571998bc0a40822dca84267abbdd969bab5e

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 package/libusb/libusb.mk |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libusb/libusb.mk b/package/libusb/libusb.mk
index 06a1485..fc2f10b 100644
--- a/package/libusb/libusb.mk
+++ b/package/libusb/libusb.mk
@@ -11,5 +11,9 @@ LIBUSB_LICENSE_FILES = COPYING
 LIBUSB_DEPENDENCIES = host-pkgconf
 LIBUSB_INSTALL_STAGING = YES
 
+ifeq ($(BR2_avr32),y)
+LIBUSB_CONF_OPT += --disable-timerfd
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
1.7.9.5

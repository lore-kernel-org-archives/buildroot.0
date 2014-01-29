From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 29 Jan 2014 22:33:07 +0100
Subject: [Buildroot] [PATCH] libusb: do not depend on host-udev for host
	variant
Message-ID: <1391031187-3897-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 25926af5 disabled udev support for the host variant, but forgot to
remove it from the (implicit) host dependencies.

Also reordered things to keep the HOST_* definitions together.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libusb/libusb.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/libusb/libusb.mk b/package/libusb/libusb.mk
index ffb39ba..a8ff74c 100644
--- a/package/libusb/libusb.mk
+++ b/package/libusb/libusb.mk
@@ -8,12 +8,15 @@ LIBUSB_VERSION_MAJOR = 1.0
 LIBUSB_VERSION = $(LIBUSB_VERSION_MAJOR).18
 LIBUSB_SOURCE = libusb-$(LIBUSB_VERSION).tar.bz2
 LIBUSB_SITE = http://downloads.sourceforge.net/project/libusb/libusb-$(LIBUSB_VERSION_MAJOR)/libusb-$(LIBUSB_VERSION)
-HOST_LIBUSB_CONF_OPT = --disable-udev
 LIBUSB_LICENSE = LGPLv2.1+
 LIBUSB_LICENSE_FILES = COPYING
 LIBUSB_DEPENDENCIES = host-pkgconf
 LIBUSB_INSTALL_STAGING = YES
 
+# Avoid the discovery of udev for the host variant
+HOST_LIBUSB_CONF_OPT = --disable-udev
+HOST_LIBUSB_DEPENDENCIES = host-pkgconf
+
 ifeq ($(BR2_avr32),y)
 LIBUSB_CONF_OPT += --disable-timerfd
 endif
-- 
1.8.5.3

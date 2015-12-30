From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Dec 2015 23:18:03 +0100
Subject: [Buildroot] [git commit] acsccid: new package
Message-ID: <20151230221931.B96B782748@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3ea3e93fc910005935ce52c5cd48c897dc4d904c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
 - fix commit title
 - change libusb back to a mandatory dependency, since even though
   there is a --disable-libusb option, it has no effect, and the code
   fails to build due to missing libusb.h
 - add hash file, noticed by Arnout
 - remove host-perl dependency, noticed by Arnout
 - rewrap Config.in help text, noticed by Arnout.]

Signed-off-by: Juha Rantanen <juha@codercoded.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in            |  1 +
 package/acsccid/Config.in    | 15 +++++++++++++++
 package/acsccid/acsccid.hash |  3 +++
 package/acsccid/acsccid.mk   | 15 +++++++++++++++
 4 files changed, 34 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index ef03632..25e574f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -907,6 +907,7 @@ menu "Graphics"
 endmenu
 
 menu "Hardware handling"
+	source "package/acsccid/Config.in"
 	source "package/bcm2835/Config.in"
 	source "package/c-periphery/Config.in"
 	source "package/ccid/Config.in"
diff --git a/package/acsccid/Config.in b/package/acsccid/Config.in
new file mode 100644
index 0000000..165148e
--- /dev/null
+++ b/package/acsccid/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_ACSCCID
+	bool "acsccid"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_PCSC_LITE
+	# Even though there is a --disable-libusb option, it has in
+	# fact no effect, and acsccid really requires libusb.
+	select BR2_PACKAGE_LIBUSB
+	help
+	  acsccid is a PC/SC driver for Linux/Mac OS X and it supports
+	  ACS CCID smart card readers.
+
+	  http://acsccid.sourceforge.net/
+
+comment "acsccid needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/acsccid/acsccid.hash b/package/acsccid/acsccid.hash
new file mode 100644
index 0000000..1bfe9e4
--- /dev/null
+++ b/package/acsccid/acsccid.hash
@@ -0,0 +1,3 @@
+# From https://sourceforge.net/projects/acsccid/files/acsccid/1.1.1/
+sha1 ae340256bbba36032a903c9f89883297a31ca340 acsccid-1.1.1.tar.bz2
+md5 26dc34141188e64fa2b3545032060357 acsccid-1.1.1.tar.bz2
diff --git a/package/acsccid/acsccid.mk b/package/acsccid/acsccid.mk
new file mode 100644
index 0000000..c2e7d21
--- /dev/null
+++ b/package/acsccid/acsccid.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# acsccid
+#
+################################################################################
+
+ACSCCID_VERSION = 1.1.1
+ACSCCID_SOURCE = acsccid-$(ACSCCID_VERSION).tar.bz2
+ACSCCID_SITE = http://downloads.sourceforge.net/acsccid
+ACSCCID_LICENSE = LGPLv2.1+
+ACSCCID_LICENSE_FILES = COPYING
+ACSCCID_INSTALL_STAGING = YES
+ACSCCID_DEPENDENCIES = pcsc-lite host-flex host-pkgconf libusb
+
+$(eval $(autotools-package))

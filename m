From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 16 Jan 2012 10:30:43 +0100
Subject: [Buildroot] [git commit] sane-backends: make libusb optional,
	add optional jpeg, tiff, avahi and snmp deps
Message-ID: <20120116093410.8B8EB90356@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8c7c0ab34469ac7bfe1f5ccb9fc3c74c9ef0b4c7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sane-backends/Config.in        |    1 -
 package/sane-backends/sane-backends.mk |   23 +++++++++++++++++++++++
 2 files changed, 23 insertions(+), 1 deletions(-)

diff --git a/package/sane-backends/Config.in b/package/sane-backends/Config.in
index fb73435..03865d1 100644
--- a/package/sane-backends/Config.in
+++ b/package/sane-backends/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_SANE_BACKENDS
 	bool "sane-backends"
-	select BR2_PACKAGE_LIBUSB
 	help
 	  SANE - Scanner Access Now Easy
 
diff --git a/package/sane-backends/sane-backends.mk b/package/sane-backends/sane-backends.mk
index 1188d18..d9f3690 100644
--- a/package/sane-backends/sane-backends.mk
+++ b/package/sane-backends/sane-backends.mk
@@ -7,7 +7,30 @@ SANE_BACKENDS_VERSION = 1.0.22
 SANE_BACKENDS_SOURCE = sane-backends-$(SANE_BACKENDS_VERSION).tar.gz
 SANE_BACKENDS_SITE = ftp://ftp2.sane-project.org/pub/sane/sane-backends-$(SANE_BACKENDS_VERSION)
 
+ifeq ($(BR2_PACKAGE_LIBUSB),y)
 SANE_BACKENDS_DEPENDENCIES += libusb
 SANE_BACKENDS_CONF_OPT += --enable-libusb_1_0
+else
+SANE_BACKENDS_CONF_OPT += --disable-libusb
+endif
+
+ifeq ($(BR2_PACKAGE_JPEG),y)
+SANE_BACKENDS_DEPENDENCIES += jpeg
+endif
+
+ifeq ($(BR2_PACKAGE_TIFF),y)
+SANE_BACKENDS_DEPENDENCIES += tiff
+endif
+
+ifeq ($(BR2_PACKAGE_AVAHI)$(BR2_PACKAGE_DBUS)$(BR2_PACKAGE_LIBGLIB2),yyy)
+SANE_BACKENDS_DEPENDENCIES += avahi
+SANE_BACKENDS_CONF_OPT += --enable-avahi
+endif
+
+ifeq ($(BR2_PACKAGE_NETSNMP),y)
+SANE_BACKENDS_DEPENDENCIES += netsnmp
+else
+SANE_BACKENDS_CONF_OPT += --without-snmp
+endif
 
 $(eval $(call AUTOTARGETS))

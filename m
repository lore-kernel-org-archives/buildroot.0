From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 30 Apr 2017 22:17:34 +0200
Subject: [Buildroot] [PATCH 1/4] package/libbcg729: new package
Message-ID: <20170430201737.12821-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Quoting http://www.linphone.org/technical-corner/bcg729/downloads
regarding patent information:

"ITU G729 Annex A/B were offically released October/November 1996
(https://www.itu.int/rec/T-REC-G.729), hence all patents covering these
specifications shall have expired in November 2016.

Patent pool administrator confirmed most licensed patents under the
G.729 Consortium have expired (http://www.sipro.com/G729.html)."

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 DEVELOPERS                       |  1 +
 package/Config.in                |  1 +
 package/libbcg729/Config.in      |  7 +++++++
 package/libbcg729/libbcg729.hash |  2 ++
 package/libbcg729/libbcg729.mk   | 24 ++++++++++++++++++++++++
 5 files changed, 35 insertions(+)
 create mode 100644 package/libbcg729/Config.in
 create mode 100644 package/libbcg729/libbcg729.hash
 create mode 100644 package/libbcg729/libbcg729.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index a95e5bacc..28c8bf5da 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -178,6 +178,7 @@ F:	package/leafnode2/
 F:	package/libaacs/
 F:	package/libasplib/
 F:	package/libass/
+F:	package/libbcg729/
 F:	package/libbdplus/
 F:	package/libbluray/
 F:	package/libbroadvoice/
diff --git a/package/Config.in b/package/Config.in
index 4eaa95b1d..3f88582b0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -881,6 +881,7 @@ menu "Audio/Sound"
 	source "package/fdk-aac/Config.in"
 	source "package/libao/Config.in"
 	source "package/libasplib/Config.in"
+	source "package/libbcg729/Config.in"
 	source "package/libbroadvoice/Config.in"
 	source "package/libcdaudio/Config.in"
 	source "package/libcddb/Config.in"
diff --git a/package/libbcg729/Config.in b/package/libbcg729/Config.in
new file mode 100644
index 000000000..82847a0b7
--- /dev/null
+++ b/package/libbcg729/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBBCG729
+	bool "libbcg729"
+	help
+	  Bcg729 is an opensource implementation of both encoder and
+	  decoder of the ITU G729 Annex A/B speech codec.
+
+	  http://www.linphone.org/technical-corner/bcg729/overview
diff --git a/package/libbcg729/libbcg729.hash b/package/libbcg729/libbcg729.hash
new file mode 100644
index 000000000..0172a40ce
--- /dev/null
+++ b/package/libbcg729/libbcg729.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 20f04d1d45c62cb6c06df2177db0701f376940a55744386da3651104251fd5fc  libbcg729-1.0.1.tar.gz
diff --git a/package/libbcg729/libbcg729.mk b/package/libbcg729/libbcg729.mk
new file mode 100644
index 000000000..90ca22bff
--- /dev/null
+++ b/package/libbcg729/libbcg729.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# libbcg729
+#
+################################################################################
+
+# we use version 1.0.1 because freeswitch mod_bcg729 is incompatible
+# with newer versions
+LIBBCG729_VERSION = 1.0.1
+LIBBCG729_SITE = $(call github,BelledonneCommunications,bcg729,$(LIBBCG729_VERSION))
+LIBBCG729_LICENSE = GPL-2.0+
+LIBBCG729_LICENSE_FILES = COPYING
+LIBBCG729_INSTALL_STAGING = YES
+LIBBCG729_AUTORECONF = YES
+LIBBCG729_DEPENDENCIES = host-pkgconf
+
+define LIBBCG729_CREATE_M4_DIR
+	mkdir -p $(@D)/m4
+endef
+LIBBCG729_POST_PATCH_HOOKS += LIBBCG729_CREATE_M4_DIR
+
+LIBBCG729_CONF_OPTS = --disable-msplugin
+
+$(eval $(autotools-package))
-- 
2.11.0

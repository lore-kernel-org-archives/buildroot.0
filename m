From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri,  6 Oct 2017 22:28:27 +0200
Subject: [Buildroot] [PATCH v4 1/3] package/bcg729: new package
Message-ID: <20171006202829.431-1-bernd.kuhls@t-online.de>
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
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v4: renamed package to bcg729 (Arnout), added license hash
v3: bumped to version 1.0.4, switched to cmake
v2: no changes

 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/bcg729/Config.in   |  7 +++++++
 package/bcg729/bcg729.hash |  3 +++
 package/bcg729/bcg729.mk   | 21 +++++++++++++++++++++
 5 files changed, 33 insertions(+)
 create mode 100644 package/bcg729/Config.in
 create mode 100644 package/bcg729/bcg729.hash
 create mode 100644 package/bcg729/bcg729.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 43ad9e5f8a..a031f31ec9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -197,6 +197,7 @@ F:	package/alsa-utils/
 F:	package/apache/
 F:	package/apr/
 F:	package/apr-util/
+F:	package/bcg729/
 F:	package/bluez-tools/
 F:	package/clamav/
 F:	package/dovecot/
diff --git a/package/Config.in b/package/Config.in
index 36b42d24f1..0a3675a566 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -946,6 +946,7 @@ menu "Audio/Sound"
 	source "package/alsa-lib/Config.in"
 	source "package/aubio/Config.in"
 	source "package/audiofile/Config.in"
+	source "package/bcg729/Config.in"
 	source "package/celt051/Config.in"
 	source "package/fdk-aac/Config.in"
 	source "package/libao/Config.in"
diff --git a/package/bcg729/Config.in b/package/bcg729/Config.in
new file mode 100644
index 0000000000..8e9bcfe66b
--- /dev/null
+++ b/package/bcg729/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_BCG729
+	bool "bcg729"
+	help
+	  Bcg729 is an opensource implementation of both encoder and
+	  decoder of the ITU G729 Annex A/B speech codec.
+
+	  http://www.linphone.org/technical-corner/bcg729/overview
diff --git a/package/bcg729/bcg729.hash b/package/bcg729/bcg729.hash
new file mode 100644
index 0000000000..4dbfbbbbb2
--- /dev/null
+++ b/package/bcg729/bcg729.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256 94b3542a06cbd96306efc19f959f9febae62806a22599063f82a8c33e989d48b  bcg729-1.0.4.tar.gz
+sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/bcg729/bcg729.mk b/package/bcg729/bcg729.mk
new file mode 100644
index 0000000000..426cfd90af
--- /dev/null
+++ b/package/bcg729/bcg729.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# bcg729
+#
+################################################################################
+
+BCG729_VERSION = 1.0.4
+BCG729_SITE = $(call github,BelledonneCommunications,bcg729,$(BCG729_VERSION))
+BCG729_LICENSE = GPL-2.0+
+BCG729_LICENSE_FILES = COPYING
+BCG729_INSTALL_STAGING = YES
+
+ifeq ($(BR2_STATIC_LIBS),y)
+BCG729_CONF_OPTS += -DENABLE_SHARED=OFF -DENABLE_STATIC=ON
+else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+BCG729_CONF_OPTS += -DENABLE_SHARED=ON -DENABLE_STATIC=ON
+else ifeq ($(BR2_SHARED_LIBS),y)
+BCG729_CONF_OPTS += -DENABLE_SHARED=ON -DENABLE_STATIC=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.11.0

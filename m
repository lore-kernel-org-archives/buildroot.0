From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Jan 2017 22:28:28 +1300
Subject: [Buildroot] [git commit] bctoolbox: new package
Message-ID: <20170124093016.1F00D817F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=24399f96b338334f677540d5d0b7b041916a4c6b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

bctoolbox is a utilities library used by Belledonne Communications
softwares like belle-sip, mediastreamer2 and linphone.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
[Thomas: add missing dependency on BR2_INSTALL_LIBSTDCPP.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                |  1 +
 package/bctoolbox/Config.in      | 13 +++++++++++++
 package/bctoolbox/bctoolbox.hash |  2 ++
 package/bctoolbox/bctoolbox.mk   | 28 ++++++++++++++++++++++++++++
 4 files changed, 44 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 560a52c..e483b0b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1291,6 +1291,7 @@ menu "Other"
 	source "package/argp-standalone/Config.in"
 	source "package/armadillo/Config.in"
 	source "package/atf/Config.in"
+	source "package/bctoolbox/Config.in"
 	source "package/bdwgc/Config.in"
 	source "package/boost/Config.in"
 	source "package/clapack/Config.in"
diff --git a/package/bctoolbox/Config.in b/package/bctoolbox/Config.in
new file mode 100644
index 0000000..834f6e2
--- /dev/null
+++ b/package/bctoolbox/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_BCTOOLBOX
+	bool "bctoolbox"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_MBEDTLS # mbedtls is preferred over polarssl
+	help
+	  Utilities library used by Belledonne Communications
+	  softwares like belle-sip, mediastreamer2 and linphone.
+
+	  https://github.com/BelledonneCommunications/bctoolbox
+
+comment "bctoolbox needs a toolchain w/ C++, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/bctoolbox/bctoolbox.hash b/package/bctoolbox/bctoolbox.hash
new file mode 100644
index 0000000..70be55c
--- /dev/null
+++ b/package/bctoolbox/bctoolbox.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  da7df7ff359a9829e9e6ef98dfe9fead0cf735b8a4a5da1b1047f467dee1b2a9  bctoolbox-0.4.0.tar.gz
diff --git a/package/bctoolbox/bctoolbox.mk b/package/bctoolbox/bctoolbox.mk
new file mode 100644
index 0000000..64c6779
--- /dev/null
+++ b/package/bctoolbox/bctoolbox.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# bctoolbox
+#
+################################################################################
+
+BCTOOLBOX_VERSION = 0.4.0
+BCTOOLBOX_SITE = $(call github,BelledonneCommunications,bctoolbox,$(BCTOOLBOX_VERSION))
+BCTOOLBOX_LICENSE = GPLv2+
+BCTOOLBOX_LICENSE_FILES = COPYING
+BCTOOLBOX_DEPENDENCIES = mbedtls
+BCTOOLBOX_INSTALL_STAGING = YES
+
+BCTOOLBOX_CONF_OPTS = \
+	-DENABLE_STRICT=OFF \
+	-DENABLE_TESTS_COMPONENT=OFF \
+	-DENABLE_TESTS=OFF \
+	-DGIT_EXECUTABLE=OFF
+
+ifeq ($(BR2_STATIC_LIBS),y)
+BCTOOLBOX_CONF_OPTS += -DENABLE_SHARED=OFF -DENABLE_STATIC=ON
+else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+BCTOOLBOX_CONF_OPTS += -DENABLE_SHARED=ON -DENABLE_STATIC=ON
+else ifeq ($(BR2_SHARED_LIBS),y)
+BCTOOLBOX_CONF_OPTS += -DENABLE_SHARED=ON -DENABLE_STATIC=OFF
+endif
+
+$(eval $(cmake-package))

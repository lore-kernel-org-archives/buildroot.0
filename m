From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Dec 2015 08:39:28 +0100
Subject: [Buildroot] [git commit] trousers: new package
Message-ID: <20151224074124.7B944826E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e2eaf814eb05b7c782dc87c7ef0b8e8cb356b592
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
 - use a 'select' instead of a 'depends on' for openssl
 - select libiconv when locale support is not available, otherwise the
   build fails due to missing iconv.h
 - disable on BR2_STATIC_LIBS configurations as it doesn't build. It
   could be made to build by patching the trousers Makefile.
 - add missing dependency on thread support in the toolchain
 - add Config.in comment about the thread and dynamic library
   dependencies.
 - add missing <pkg>_LICENSE and <pkg>_LICENSE_FILES variables.]

Signed-off-by: Al West <al.west@v-nova.com>
Signed-off-by: No?? Rubinstein <nrubinstein@aldebaran.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in              |  1 +
 package/trousers/Config.in     | 18 ++++++++++++++++++
 package/trousers/trousers.hash |  3 +++
 package/trousers/trousers.mk   | 24 ++++++++++++++++++++++++
 4 files changed, 46 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 09d161b..4621739 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -798,6 +798,7 @@ menu "Crypto"
 	source "package/nettle/Config.in"
 	source "package/openssl/Config.in"
 	source "package/polarssl/Config.in"
+	source "package/trousers/Config.in"
 endmenu
 
 menu "Database"
diff --git a/package/trousers/Config.in b/package/trousers/Config.in
new file mode 100644
index 0000000..6ab74bf
--- /dev/null
+++ b/package/trousers/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_TROUSERS
+	bool "trousers"
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	# doesn't build properly in static only configurations
+	depends on !BR2_STATIC_LIBS
+	help
+	  The open-source TCG Software Stack (TSS).
+
+	  This library enables the use of a Trusted Platform Module that
+	  complies with the TPM specification, version 1.2. It implements the
+	  TSS specification, version 1.2.
+
+	  http://trousers.sourceforge.net/
+
+comment "trousers needs a toolchain w/ threads, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/trousers/trousers.hash b/package/trousers/trousers.hash
new file mode 100644
index 0000000..997cfa9
--- /dev/null
+++ b/package/trousers/trousers.hash
@@ -0,0 +1,3 @@
+# http://sourceforge.net/projects/trousers/files/trousers/0.3.13/
+sha1 d23f1a3df4febffc4174f5cca7d1c54230477bb2 trousers-0.3.13.tar.gz
+md5  ad508f97b406f6e48cd90e85d78e7ca8         trousers-0.3.13.tar.gz
diff --git a/package/trousers/trousers.mk b/package/trousers/trousers.mk
new file mode 100644
index 0000000..5ecab70
--- /dev/null
+++ b/package/trousers/trousers.mk
@@ -0,0 +1,24 @@
+#############################################################
+#
+# trousers
+#
+##############################################################
+
+TROUSERS_VERSION = 0.3.13
+TROUSERS_SOURCE = trousers-$(TROUSERS_VERSION).tar.gz
+TROUSERS_SITE = http://downloads.sourceforge.net/project/trousers/trousers/$(TROUSERS_VERSION)
+TROUSERS_LICENSE = BSD-3c
+TROUSERS_LICENSE_FILES = LICENSE
+TROUSERS_INSTALL_STAGING = YES
+TROUSERS_DEPENDENCIES = openssl
+
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+TROUSERS_DEPENDENCIES += libiconv
+endif
+
+# The TrouSerS build system attempts to create the tss user and group
+# on the host system. Disable the user checking feature as a
+# workaround.
+TROUSERS_CONF_OPTS += --disable-usercheck
+
+$(eval $(autotools-package))

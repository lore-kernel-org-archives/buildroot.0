From: =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>
Date: Wed,  4 Nov 2015 18:47:04 +0100
Subject: [Buildroot] [PATCH v2 1/2] trousers: new package
Message-ID: <1446659225-30438-1-git-send-email-nrubinstein@aldebaran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Al West <al.west@v-nova.com>
Signed-off-by: No? Rubinstein <nrubinstein@aldebaran.com>

---

Previously submitted by Al West <al.west@v-nova.com>

Changes since v1:
* Removed upstreamed patch
* Remove configuration option "--disable-usercheck"
* Use upstream hashes
* More verbose package description
* Cosmetic changes
---
 package/Config.in              |  1 +
 package/trousers/Config.in     | 11 +++++++++++
 package/trousers/trousers.hash |  3 +++
 package/trousers/trousers.mk   | 17 +++++++++++++++++
 4 files changed, 32 insertions(+)
 create mode 100644 package/trousers/Config.in
 create mode 100644 package/trousers/trousers.hash
 create mode 100644 package/trousers/trousers.mk

diff --git a/package/Config.in b/package/Config.in
index f0ddf0c..850cb83 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -765,6 +765,7 @@ menu "Crypto"
 	source "package/nettle/Config.in"
 	source "package/openssl/Config.in"
 	source "package/polarssl/Config.in"
+	source "package/trousers/Config.in"
 endmenu
 
 menu "Database"
diff --git a/package/trousers/Config.in b/package/trousers/Config.in
new file mode 100644
index 0000000..a740c00
--- /dev/null
+++ b/package/trousers/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_TROUSERS
+	bool "trousers"
+	depends on BR2_PACKAGE_OPENSSL
+	help
+	  The open-source TCG Software Stack (TSS).
+
+	  This library enables the use of a Trusted Platform Module that
+	  complies with the TPM specification, version 1.2. It implements the
+	  TSS specification, version 1.2.
+
+	  http://trousers.sourceforge.net/
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
index 0000000..86366e9
--- /dev/null
+++ b/package/trousers/trousers.mk
@@ -0,0 +1,17 @@
+#############################################################
+#
+# trousers
+#
+##############################################################
+
+TROUSERS_VERSION = 0.3.13
+TROUSERS_SOURCE = trousers-$(TROUSERS_VERSION).tar.gz
+TROUSERS_SITE = http://downloads.sourceforge.net/project/trousers/trousers/$(TROUSERS_VERSION)
+TROUSERS_INSTALL_STAGING = YES
+TROUSERS_DEPENDENCIES = openssl
+
+# The TrouSerS build system attempts to create the tss user and group on the
+# host system. Disable the user checking feature as a workaround.
+TROUSERS_CONF_OPTS += --disable-usercheck
+
+$(eval $(autotools-package))
-- 
2.1.4

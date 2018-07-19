From: =?UTF-8?q?Micha=C3=ABl=20Burtin?= <michael.burtin@netgem.com>
Date: Thu, 19 Jul 2018 15:54:08 +0200
Subject: [Buildroot] [PATCH v2 1/2] nghttp2: new package
Message-ID: <20180719135409.8859-1-michael.burtin@netgem.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

nghttp2 is an implementation of HTTP/2 and its header
compression algorithm HPACK in C.

Signed-off-by: Micha?l Burtin <michael.burtin@netgem.com>
Signed-off-by: Anisse Astier <anisse.astier.ext@netgem.com>

---
Changes v1 -> v2 (from Thomas Petazzoni review):
  - rename package to nghttp2 (original software name)
  - fix formatting (checked with check-package)
  - package added to DEVELOPERS file
  - fix LICENSE_FILES (remove LICENCE)
  - add checksum for COPYING file
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/nghttp2/Config.in    |  7 +++++++
 package/nghttp2/nghttp2.hash |  3 +++
 package/nghttp2/nghttp2.mk   | 22 ++++++++++++++++++++++
 5 files changed, 34 insertions(+)
 create mode 100644 package/nghttp2/Config.in
 create mode 100644 package/nghttp2/nghttp2.hash
 create mode 100644 package/nghttp2/nghttp2.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index de09979999..535e2f48ed 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -157,6 +157,7 @@ F:	package/sysdig/
 
 N:	Anisse Astier <anisse@astier.eu>
 F:	package/go/
+F:	package/nghttp2/
 
 N:	Anthony Viallard <viallard@syscom-instruments.com>
 F:	package/gnuplot/
diff --git a/package/Config.in b/package/Config.in
index eedce83616..68c2243f87 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1480,6 +1480,7 @@ menu "Networking"
 	source "package/mongoose/Config.in"
 	source "package/nanomsg/Config.in"
 	source "package/neon/Config.in"
+	source "package/nghttp2/Config.in"
 	source "package/norm/Config.in"
 	source "package/nss-mdns/Config.in"
 	source "package/nss-pam-ldapd/Config.in"
diff --git a/package/nghttp2/Config.in b/package/nghttp2/Config.in
new file mode 100644
index 0000000000..03fe71d097
--- /dev/null
+++ b/package/nghttp2/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_NGHTTP2
+	bool "nghttp2"
+	help
+	  nghttp2 is an implementation of HTTP/2 and its header
+	  compression algorithm HPACK in C.
+
+	  https://nghttp2.org/
diff --git a/package/nghttp2/nghttp2.hash b/package/nghttp2/nghttp2.hash
new file mode 100644
index 0000000000..d000fd56c5
--- /dev/null
+++ b/package/nghttp2/nghttp2.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 f75e8f228217f23aa5eabfbab140e061cda00b7c21e34c891ecfb248d663303f  nghttp2-1.32.0.tar.gz
+sha256 6b94f3abc1aabd0c72a7c7d92a77f79dda7c8a0cb3df839a97890b4116a2de2a  COPYING
diff --git a/package/nghttp2/nghttp2.mk b/package/nghttp2/nghttp2.mk
new file mode 100644
index 0000000000..20bfee75a3
--- /dev/null
+++ b/package/nghttp2/nghttp2.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# nghttp2
+#
+################################################################################
+
+NGHTTP2_VERSION = 1.32.0
+NGHTTP2_SITE = https://github.com/nghttp2/nghttp2/releases/download/v$(NGHTTP2_VERSION)
+NGHTTP2_LICENSE = MIT
+NGHTTP2_LICENSE_FILES = COPYING
+NGHTTP2_INSTALL_STAGING = YES
+NGHTTP2_DEPENDENCIES = host-pkgconf
+NGHTTP2_CONF_OPTS = --enable-lib-only
+
+define NGHTTP2_INSTALL_CLEAN_HOOK
+	# Remove fetch-ocsp-response script unused by library
+	$(Q)$(RM) -rf $(TARGET_DIR)/usr/share/nghttp2
+endef
+
+NGHTTP2_POST_INSTALL_TARGET_HOOKS += NGHTTP2_INSTALL_CLEAN_HOOK
+
+$(eval $(autotools-package))
-- 
2.13.6

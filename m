From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Oct 2014 10:33:35 +0200
Subject: [Buildroot] [PATCHv2] biosdevname: new package
Message-ID: <1413102815-10117-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ryan Wilkins <ryan@deadfrog.net>

Signed-off-by: Ryan Wilkins <ryan@deadfrog.net>
[yann.morin.1998 at free.fr: bump to 0.6.0; fix dependencies (udev+zlib);
 add hashes; fix title]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/Config.in                    |  1 +
 package/biosdevname/Config.in        | 15 +++++++++++++++
 package/biosdevname/biosdevname.hash |  3 +++
 package/biosdevname/biosdevname.mk   | 14 ++++++++++++++
 4 files changed, 33 insertions(+)
 create mode 100644 package/biosdevname/Config.in
 create mode 100644 package/biosdevname/biosdevname.hash
 create mode 100644 package/biosdevname/biosdevname.mk

diff --git a/package/Config.in b/package/Config.in
index ea89c96..b655763 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -283,6 +283,7 @@ endmenu
 	source "package/acpid/Config.in"
 	source "package/avrdude/Config.in"
 	source "package/bcache-tools/Config.in"
+	source "package/biosdevname/Config.in"
 	source "package/cdrkit/Config.in"
 	source "package/cryptsetup/Config.in"
 	source "package/cwiid/Config.in"
diff --git a/package/biosdevname/Config.in b/package/biosdevname/Config.in
new file mode 100644
index 0000000..ea2a7e6
--- /dev/null
+++ b/package/biosdevname/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_BIOSDEVNAME
+	bool "biosdevname"
+	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_PACKAGE_HAS_UDEV
+	select BR2_PACKAGE_PCIUTILS
+	select BR2_PACKAGE_ZLIB
+	help
+	  Biosdevname is a udev helper that looks at various BIOS tables to
+	  figure out what the actual hardware names are for Ethernet ports
+	  and renames the ports accordingly.  This has the advantage of
+	  always referring to the same port regardless of system or
+	  hardware changes that might otherwise alter the typical ethX
+	  naming.
+
+	  http://linux.dell.com/biosdevname/
diff --git a/package/biosdevname/biosdevname.hash b/package/biosdevname/biosdevname.hash
new file mode 100644
index 0000000..a000777
--- /dev/null
+++ b/package/biosdevname/biosdevname.hash
@@ -0,0 +1,3 @@
+# Locally computed hashes, not provided by upstream
+sha1   a926961d6adb673aed062683ab8b80e6418523ea  biosdevname-0.6.0.tar.gz
+sha256 c75bf92d3184f7dd1973af002de152498145021efdd5de46d6bf796acef43914 biosdevname-0.6.0.tar.gz
diff --git a/package/biosdevname/biosdevname.mk b/package/biosdevname/biosdevname.mk
new file mode 100644
index 0000000..82f3338
--- /dev/null
+++ b/package/biosdevname/biosdevname.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# biosdevname
+#
+################################################################################
+
+BIOSDEVNAME_VERSION = 0.6.0
+BIOSDEVNAME_SITE = http://linux.dell.com/biosdevname/biosdevname-$(BIOSDEVNAME_VERSION)
+BIOSDEVNAME_LICENSE = GPL
+BIOSDEVNAME_LICENSE_FILES = COPYING
+BIOSDEVNAME_CONF_OPTS = --exec-prefix=/
+BIOSDEVNAME_DEPENDENCIES = pciutils udev zlib
+
+$(eval $(autotools-package))
-- 
1.9.1

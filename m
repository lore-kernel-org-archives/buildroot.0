From: Chris Frederick <cdf123@cdf123.net>
Date: Wed, 26 Oct 2016 12:22:32 -0500
Subject: [Buildroot] [PATCH 1/1] firejail: new package
Message-ID: <1477502552-4236-1-git-send-email-cdf123@cdf123.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Firejail Security Sandbox
https://firejail.wordpress.com/

Lightweight application sandboxing system using seccomp and kernel
namespaces.

Signed-off-by: Chris Frederick <cdf123@cdf123.net>
---
 DEVELOPERS                     |  3 +++
 package/Config.in              |  1 +
 package/firejail/Config.in     | 17 +++++++++++++++++
 package/firejail/firejail.hash |  2 ++
 package/firejail/firejail.mk   | 27 +++++++++++++++++++++++++++
 5 files changed, 50 insertions(+)
 create mode 100644 package/firejail/Config.in
 create mode 100644 package/firejail/firejail.hash
 create mode 100644 package/firejail/firejail.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 16d9b55..3dcd0e2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -291,6 +291,9 @@ F:	package/libdvbsi/
 F:	package/libsvg/
 F:	package/libsvg-cairo/
 
+N:	Chris Frederick (chrisf at cdf123.net)
+F:	package/firejail/
+
 N:	Chris Packham <judge.packham@gmail.com>
 F:	package/eventlog/
 F:	package/micropython/
diff --git a/package/Config.in b/package/Config.in
index 9399f63..be20478 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1710,6 +1710,7 @@ menu "System tools"
 	source "package/efibootmgr/Config.in"
 	source "package/efivar/Config.in"
 	source "package/emlog/Config.in"
+	source "package/firejail/Config.in"
 	source "package/ftop/Config.in"
 	source "package/getent/Config.in"
 	source "package/htop/Config.in"
diff --git a/package/firejail/Config.in b/package/firejail/Config.in
new file mode 100644
index 0000000..45fc496
--- /dev/null
+++ b/package/firejail/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_FIREJAIL
+	bool "firejail"
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	help
+	  Firejail is a SUID program that reduces the risk of security
+	  breaches by restricting the running environment of untrusted
+	  applications using Linux namespaces and seccomp-bpf. It
+	  allows a process and all its descendants to have their own
+	  private view of the globally shared kernel resources, such
+	  as the network stack, process table, mount table.
+
+	  https://firejail.wordpress.com/
+
+comment "firejail needs a glibc toolchain"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/firejail/firejail.hash b/package/firejail/firejail.hash
new file mode 100644
index 0000000..dc2eb80
--- /dev/null
+++ b/package/firejail/firejail.hash
@@ -0,0 +1,2 @@
+# From http://download.sourceforge.net/firejail/firejail-0.9.42.asc
+sha256 4f3bceee973b84fdf13a5d5ab0060d140ecc8e42c19c945e7fb93f0fd8499b47  firejail-0.9.42.tar.xz
diff --git a/package/firejail/firejail.mk b/package/firejail/firejail.mk
new file mode 100644
index 0000000..3926e8a
--- /dev/null
+++ b/package/firejail/firejail.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# firejail
+#
+################################################################################
+
+FIREJAIL_VERSION = 0.9.42
+FIREJAIL_SITE = http://download.sourceforge.net/firejail
+FIREJAIL_SOURCE = firejail-$(FIREJAIL_VERSION).tar.xz
+FIREJAIL_LICENSE = GPLv2+
+FIREJAIL_LICENSE_FILES = COPYING
+FIREJAIL_MAKE_OPTS = ARCH=$(BR2_ARCH) CC="$(TARGET_CC)" \
+	USERCOMPILE="$(TARGET_CFLAGS)" USERLINK="$(TARGET_LDFLAGS)"
+
+FIREJAIL_CONF_OPTS = \
+	--enable-bind \
+	--enable-busybox-workaround \
+	--enable-file-transfer \
+	--enable-network \
+	--enable-seccomp \
+	--enable-userns
+
+define FIREJAIL_PERMISSIONS
+	/usr/bin/firejail f 4755 0 0 - - - - -
+endef
+
+$(eval $(autotools-package))
-- 
2.7.3

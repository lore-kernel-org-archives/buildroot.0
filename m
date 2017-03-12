From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 12 Mar 2017 12:33:25 +0100
Subject: [Buildroot] [PATCH 2/5] package/libnpth: new package
In-Reply-To: <20170312113328.5745-1-bernd.kuhls@t-online.de>
References: <20170312113328.5745-1-bernd.kuhls@t-online.de>
Message-ID: <20170312113328.5745-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed for gnupg 2.1.x
https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gnupg.git;a=commitdiff;h=001352077cdc7e402421c77328bea1a052005673

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/libnpth/Config.in    | 13 +++++++++++++
 package/libnpth/libnpth.hash |  2 ++
 package/libnpth/libnpth.mk   | 14 ++++++++++++++
 5 files changed, 31 insertions(+)
 create mode 100644 package/libnpth/Config.in
 create mode 100644 package/libnpth/libnpth.hash
 create mode 100644 package/libnpth/libnpth.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 8daf6705f..5380a5f81 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -194,6 +194,7 @@ F:	package/libldns/
 F:	package/libmicrohttpd/
 F:	package/libminiupnpc/
 F:	package/libnatpmp/
+F:	package/libnpth/
 F:	package/libogg/
 F:	package/libopenh264/
 F:	package/libpciaccess/
diff --git a/package/Config.in b/package/Config.in
index 7721727bb..5cc890fbb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1360,6 +1360,7 @@ menu "Other"
 	source "package/libical/Config.in"
 	source "package/libite/Config.in"
 	source "package/liblinear/Config.in"
+	source "package/libnpth/Config.in"
 	source "package/libnspr/Config.in"
 	source "package/libpfm4/Config.in"
 	source "package/libplatform/Config.in"
diff --git a/package/libnpth/Config.in b/package/libnpth/Config.in
new file mode 100644
index 000000000..71f9fcb35
--- /dev/null
+++ b/package/libnpth/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_LIBNPTH
+	bool "libnpth"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # fork()
+	help
+	  nPth is a library to provide the GNU Pth API and thus a
+	  non-preemptive threads implementation.
+
+	  https://www.gnupg.org/related_software/npth/index.html
+
+comment "libnpth needs a toolchain w/ threads support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU
diff --git a/package/libnpth/libnpth.hash b/package/libnpth/libnpth.hash
new file mode 100644
index 000000000..d8d0fbd51
--- /dev/null
+++ b/package/libnpth/libnpth.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 bca81940436aed0734eb8d0ff8b179e04cc8c087f5625204419f5f45d736a82a  npth-1.3.tar.bz2
diff --git a/package/libnpth/libnpth.mk b/package/libnpth/libnpth.mk
new file mode 100644
index 000000000..c97099b02
--- /dev/null
+++ b/package/libnpth/libnpth.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# libnpth
+#
+################################################################################
+
+LIBNPTH_VERSION = 1.3
+LIBNPTH_SOURCE = npth-$(LIBNPTH_VERSION).tar.bz2
+LIBNPTH_SITE = ftp://ftp.gnupg.org/gcrypt/npth
+LIBNPTH_LICENSE = LGPLv3+ or GPLv2+
+LIBNPTH_LICENSE_FILES = COPYING COPYING.LESSER
+LIBNPTH_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
-- 
2.11.0

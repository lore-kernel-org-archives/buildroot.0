From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Jul 2017 09:03:12 +0200
Subject: [Buildroot] [git commit] pixz: new package
Message-ID: <20170704070250.9529B820F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=977063d071e4711d3562e379456736cfef18bbdd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a package for pixz (pronounced pixie), a parallel, indexing version of
xz.

See https://github.com/vasi/pixz

Signed-off-by: Vincent Stehl?? <vincent.stehle@laposte.net>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS             |  3 ++-
 package/Config.in      |  1 +
 package/pixz/Config.in | 13 +++++++++++++
 package/pixz/pixz.hash |  2 ++
 package/pixz/pixz.mk   | 19 +++++++++++++++++++
 5 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7c8d7f1..209491a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1719,9 +1719,10 @@ F:	package/openmpi/
 F:	package/pinentry/
 F:	package/trinity/
 
-N:	Vincent Stehl?? <vincent.stehle@intel.com>
+N:	Vincent Stehl?? <vincent.stehle@laposte.net>
 F:	package/i7z/
 F:	package/msr-tools/
+F:	package/pixz/
 
 N:	Vinicius Tinti <viniciustinti@gmail.com>
 F:	package/python-thrift/
diff --git a/package/Config.in b/package/Config.in
index a811ff6..36747a2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -64,6 +64,7 @@ menu "Compressors and decompressors"
 	source "package/lzip/Config.in"
 	source "package/lzop/Config.in"
 	source "package/p7zip/Config.in"
+	source "package/pixz/Config.in"
 	source "package/unrar/Config.in"
 	source "package/unzip/Config.in"
 	source "package/xz/Config.in"
diff --git a/package/pixz/Config.in b/package/pixz/Config.in
new file mode 100644
index 0000000..f7ca015
--- /dev/null
+++ b/package/pixz/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_PIXZ
+	bool "pixz"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_WCHAR # libarchive
+	select BR2_PACKAGE_LIBARCHIVE
+	select BR2_PACKAGE_XZ
+	help
+	  Pixz (pronounced pixie) is a parallel, indexing version of xz.
+
+	  https://github.com/vasi/pixz
+
+comment "pixz needs a toolchain w/ threads, wchar"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
diff --git a/package/pixz/pixz.hash b/package/pixz/pixz.hash
new file mode 100644
index 0000000..3089bcd
--- /dev/null
+++ b/package/pixz/pixz.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256 02c50746b134fa1b1aae41fcc314d7c6f1919b3d48bcdea01bf11769f83f72e8 pixz-1.0.6.tar.xz
diff --git a/package/pixz/pixz.mk b/package/pixz/pixz.mk
new file mode 100644
index 0000000..8d80f78
--- /dev/null
+++ b/package/pixz/pixz.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# pixz
+#
+################################################################################
+
+PIXZ_VERSION = 1.0.6
+PIXZ_SITE = https://github.com/vasi/pixz/releases/download/v$(PIXZ_VERSION)
+PIXZ_SOURCE = pixz-$(PIXZ_VERSION).tar.xz
+PIXZ_DEPENDENCIES = host-pkgconf libarchive xz
+PIXZ_LICENSE = BSD-2-Clause
+PIXZ_LICENSE_FILES = LICENSE
+
+# pixz.1 is actually present, but AC_CHECK_FILE doesn't detect it when
+# cross-compiling, which causes configure to try to regenerate it. So give it a
+# hint to say that it actually is present.
+PIXZ_CONF_ENV = ac_cv_file_src_pixz_1=yes
+
+$(eval $(autotools-package))

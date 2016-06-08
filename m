From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Jun 2016 14:03:56 +0200
Subject: [Buildroot] [git commit] p7zip: new package
Message-ID: <20160608120428.6997B816A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9bc2ba2169e087770680a0a21be0be267fb3070e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Only enabled on a subset of known-working architectures.
It fails to build on some archs, like blackfin.

Signed-off-by: Andr?? Hentschel <nerv@dawncrow.de>
[Thomas:
 - Add comment about the Blackfin exception.
 - Propagate the Blackfin exception to the Config.in comment.
 - Fix the license, it is the LGPLv2.1+ *with* the unRAR restriction.
 - Use $(INSTALL) -D -m 0755 to install the binary instead of cp.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in        |  1 +
 package/p7zip/Config.in  | 18 ++++++++++++++++++
 package/p7zip/p7zip.hash |  3 +++
 package/p7zip/p7zip.mk   | 27 +++++++++++++++++++++++++++
 4 files changed, 49 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 46d7977..4072d65 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -60,6 +60,7 @@ endif
 	source "package/lz4/Config.in"
 	source "package/lzip/Config.in"
 	source "package/lzop/Config.in"
+	source "package/p7zip/Config.in"
 	source "package/unrar/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/unzip/Config.in"
diff --git a/package/p7zip/Config.in b/package/p7zip/Config.in
new file mode 100644
index 0000000..cd9de7e
--- /dev/null
+++ b/package/p7zip/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_P7ZIP
+	bool "p7zip"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_WCHAR
+	# missing endianness definitions
+	depends on !BR2_bfin
+	help
+	  p7zip is a quick port of the command line version of 7-zip for Unix.
+	  (see http://www.7-zip.org)
+
+	  7-Zip is a file archiver with highest compression ratio.
+
+	  http://sourceforge.net/projects/p7zip
+
+comment "p7zip needs a toolchain w/ threads, wchar, C++"
+	depends on !BR2_bfin
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/p7zip/p7zip.hash b/package/p7zip/p7zip.hash
new file mode 100644
index 0000000..ead6d87
--- /dev/null
+++ b/package/p7zip/p7zip.hash
@@ -0,0 +1,3 @@
+# From https://sourceforge.net/projects/p7zip/files/p7zip/
+md5	92cca093312b5a71a7be7dc7d1d32509	p7zip_15.14.1_src_all.tar.bz2
+sha1	9b15a79f94230fab9b9d4f9f532c723117145c7a	p7zip_15.14.1_src_all.tar.bz2
diff --git a/package/p7zip/p7zip.mk b/package/p7zip/p7zip.mk
new file mode 100644
index 0000000..4bac859
--- /dev/null
+++ b/package/p7zip/p7zip.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# p7zip
+#
+################################################################################
+
+P7ZIP_VERSION = 15.14.1
+P7ZIP_SOURCE = p7zip_$(P7ZIP_VERSION)_src_all.tar.bz2
+P7ZIP_SITE = http://downloads.sourceforge.net/project/p7zip/p7zip/$(P7ZIP_VERSION)
+P7ZIP_LICENSE = LGPLv2.1+ with unRAR restriction
+P7ZIP_LICENSE_FILES = DOC/License.txt
+
+# p7zip buildsystem is a mess: it plays dirty tricks with CFLAGS and
+# CXXFLAGS, so we can't pass them. Instead, it accepts ALLFLAGS_C
+# and ALLFLAGS_CPP as variables to pass the CFLAGS and CXXFLAGS.
+define P7ZIP_BUILD_CMDS
+	$(MAKE) CC="$(TARGET_CC)" ALLFLAGS_C="$(TARGET_CFLAGS)" \
+		CXX="$(TARGET_CXX)" ALLFLAGS_CPP="$(TARGET_CXXFLAGS)" \
+		LDFLAGS="$(TARGET_LDFLAGS)" \
+		-C $(@D) 7zr
+endef
+
+define P7ZIP_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/bin/7zr $(TARGET_DIR)/usr/bin/7zr
+endef
+
+$(eval $(generic-package))

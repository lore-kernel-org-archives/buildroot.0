From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 12 Aug 2017 23:21:42 +0200
Subject: [Buildroot] [git commit branch/next] package/libb64: new package
Message-ID: <20170813154723.3910D817B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=69911ee1e0389ae84b083ec30844fb14676d9551
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This patch adds libb64, a library of ANSI C routines for fast
encoding/decoding data into and from a base64-encoded format.

The package contains a static library, headers, and an executable.
The latter, however, requires C++ and offers no advantages over busybox
or coreutils base64, so it is not installed. Therefore, nothing is
installed to target.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
[Arnout:
- properly wrap Config.in
- move from Crypto to Other menu
- don't install to target
- don't make headers executable
- don't add -D to install with multiple source files
- extend commit log]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Config.in          |  1 +
 package/libb64/Config.in   | 14 ++++++++++++++
 package/libb64/libb64.hash |  3 +++
 package/libb64/libb64.mk   | 30 ++++++++++++++++++++++++++++++
 4 files changed, 48 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 85416af..34ce399 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1413,6 +1413,7 @@ menu "Other"
 	source "package/lapack/Config.in"
 	source "package/libargtable2/Config.in"
 	source "package/libatomic_ops/Config.in"
+	source "package/libb64/Config.in"
 	source "package/libbsd/Config.in"
 	source "package/libcap/Config.in"
 	source "package/libcap-ng/Config.in"
diff --git a/package/libb64/Config.in b/package/libb64/Config.in
new file mode 100644
index 0000000..405d0b8
--- /dev/null
+++ b/package/libb64/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_LIBB64
+	bool "libb64"
+	help
+	  libb64 is a library of ANSI C routines for fast encoding
+	  and decoding of data into and from a base64-encoded format.
+	  C++ wrappers are included, as well as the source code for
+	  standalone encoding and decoding executables.
+
+	  Base64 uses a subset of displayable ASCII characters, and is
+	  therefore a useful encoding for storing binary data in a text
+	  file, such as XML, or sending binary data over text-only
+	  email.
+
+	  http://libb64.sourceforge.net
diff --git a/package/libb64/libb64.hash b/package/libb64/libb64.hash
new file mode 100644
index 0000000..012a7b0
--- /dev/null
+++ b/package/libb64/libb64.hash
@@ -0,0 +1,3 @@
+# sha1 from sourceforge, sha256 locally computed
+sha1  04b3e21b8c951d27f02fe91249ca3474554af0b9  libb64-1.2.1.zip
+sha256  20106f0ba95cfd9c35a13c71206643e3fb3e46512df3e2efb2fdbf87116314b2  libb64-1.2.1.zip
diff --git a/package/libb64/libb64.mk b/package/libb64/libb64.mk
new file mode 100644
index 0000000..4dea959
--- /dev/null
+++ b/package/libb64/libb64.mk
@@ -0,0 +1,30 @@
+################################################################################
+#
+# libb64
+#
+################################################################################
+
+LIBB64_VERSION = 1.2.1
+LIBB64_SOURCE = libb64-$(LIBB64_VERSION).zip
+LIBB64_SITE = https://downloads.sourceforge.net/project/libb64/libb64/libb64
+LIBB64_LICENSE = Public Domain
+LIBB64_LICENSE_FILES = LICENSE
+LIBB64_INSTALL_STAGING = YES
+# Only static lib and headers
+LIBB64_INSTALL_TARGET = NO
+
+define LIBB64_EXTRACT_CMDS
+	unzip $(DL_DIR)/$(LIBB64_SOURCE) -d $(BUILD_DIR)
+endef
+
+define LIBB64_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" CCFLAGS="$(TARGET_CFLAGS)" -C $(@D) all_src
+endef
+
+define LIBB64_INSTALL_STAGING_CMDS
+	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include/b64
+	$(INSTALL) -m 0644 $(@D)/include/b64/* $(STAGING_DIR)/usr/include/b64
+	$(INSTALL) -D -m 0755 $(@D)/src/libb64.a $(STAGING_DIR)/usr/lib
+endef
+
+$(eval $(generic-package))

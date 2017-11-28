From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Wed, 29 Nov 2017 01:29:36 +0200
Subject: [Buildroot] [PATCH 3/3 v3] zlib-ng: make zlib a virtual package
In-Reply-To: <20171128232936.23067-1-stefan.froberg@petroprogram.com>
References: <20171128232936.23067-1-stefan.froberg@petroprogram.com>
Message-ID: <20171128232936.23067-3-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>

- Convert zlib to virtual package

---
 package/zlib/Config.in | 42 ++++++++++++++++++++++++++++++++++++++++++
 package/zlib/zlib.mk   |  7 +++++++
 2 files changed, 49 insertions(+)
 create mode 100644 package/zlib/Config.in
 create mode 100644 package/zlib/zlib.mk

diff --git a/package/zlib/Config.in b/package/zlib/Config.in
new file mode 100644
index 0000000000..877916594a
--- /dev/null
+++ b/package/zlib/Config.in
@@ -0,0 +1,42 @@
+config BR2_PACKAGE_ZLIB
+	bool "zlib support"
+	help
+	  Select the desired Zlib library provider.
+
+if BR2_PACKAGE_ZLIB
+
+choice
+	prompt "zlib variant"
+	default BR2_PACKAGE_LIBZLIB
+	help
+	  Select the normal zlib or zlib-ng.
+
+config BR2_PACKAGE_LIBZLIB
+	bool "zlib"
+	select BR2_PACKAGE_HAS_ZLIB
+	help
+	  Standard (de)compression library. Used by things like
+	  gzip and libpng.
+
+	  http://www.zlib.net
+
+config BR2_PACKAGE_ZLIB_NG
+	bool "zlib-ng"
+	select BR2_PACKAGE_HAS_ZLIB
+	help
+	  zlib replacement with optimizations for
+	  "next generation" systems.
+
+	  https://github.com/Dead2/zlib-ng
+
+endchoice
+
+config BR2_PACKAGE_HAS_ZLIB
+	bool
+
+config BR2_PACKAGE_PROVIDES_ZLIB
+	string
+	default "libzlib" if BR2_PACKAGE_LIBZLIB
+	default "zlib-ng" if BR2_PACKAGE_ZLIB_NG
+
+endif
diff --git a/package/zlib/zlib.mk b/package/zlib/zlib.mk
new file mode 100644
index 0000000000..48f6e20ecd
--- /dev/null
+++ b/package/zlib/zlib.mk
@@ -0,0 +1,7 @@
+################################################################################
+#
+# zlib
+#
+################################################################################
+
+$(eval $(virtual-package))
-- 
2.13.6

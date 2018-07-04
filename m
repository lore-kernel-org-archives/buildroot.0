From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Date: Wed,  4 Jul 2018 09:07:37 +0200
Subject: [Buildroot] [PATCH 3/5] host zstd: additionally build binary and
 make selectable
In-Reply-To: <20180704070739.7259-1-thomas.de_schampheleire@nokia.com>
References: <20180704070739.7259-1-thomas.de_schampheleire@nokia.com>
Message-ID: <20180704070739.7259-4-thomas.de_schampheleire@nokia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The zstd (de)compression tool may be used in post-image scripts to compress
certain elements of the final image.

In order to allow that, make host-zstd selectable in the 'Host utilities'
menu, and build the binary in addition to the library.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 package/Config.in.host      | 1 +
 package/zstd/Config.in.host | 8 ++++++++
 package/zstd/zstd.mk        | 4 ++++
 3 files changed, 13 insertions(+)
 create mode 100644 package/zstd/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index 38543e7390..7838ffc219 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -62,5 +62,6 @@ menu "Host utilities"
 	source "package/vboot-utils/Config.in.host"
 	source "package/xorriso/Config.in.host"
 	source "package/zip/Config.in.host"
+	source "package/zstd/Config.in.host"
 
 endmenu
diff --git a/package/zstd/Config.in.host b/package/zstd/Config.in.host
new file mode 100644
index 0000000000..05751f8fbf
--- /dev/null
+++ b/package/zstd/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_ZSTD
+	bool "host zstd"
+	help
+	  Zstandard, or zstd as short version, is a fast lossless
+	  compression algorithm, targeting real-time compression
+	  scenarios at zlib-level and better compression ratios
+
+	  https://facebook.github.io/zstd
diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index 4915cee07d..0b613a6da4 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -72,11 +72,15 @@ endef
 define HOST_ZSTD_BUILD_CMDS
 	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) \
 		-C $(@D)/lib
+	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) \
+		-C $(@D) zstd
 endef
 
 define HOST_ZSTD_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) \
 		DESTDIR=$(HOST_DIR) PREFIX=/usr -C $(@D)/lib install
+	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) \
+		DESTDIR=$(HOST_DIR) PREFIX=/usr -C $(@D)/programs install
 endef
 
 $(eval $(generic-package))
-- 
2.16.4

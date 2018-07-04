From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 4 Jul 2018 21:53:37 +0200
Subject: [Buildroot] [git commit] zstd: build program and add menuconfig
 entry for host variant
Message-ID: <20180704195533.D4902870B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c76380dd7c5d7c7a0827ea9619413664fd5c9773
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The zstd (de)compression tool may be used in post-image scripts to
compress certain elements of the final image.

In order to allow that, make host-zstd selectable in the 'Host
utilities' menu, and build the binary in addition to the library.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in.host      | 1 +
 package/zstd/Config.in.host | 8 ++++++++
 package/zstd/zstd.mk        | 4 ++++
 3 files changed, 13 insertions(+)

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

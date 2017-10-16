From: Chris Packham <judge.packham@gmail.com>
Date: Tue, 17 Oct 2017 10:59:03 +1300
Subject: [Buildroot] [PATCH 2/3] zstd: build for host
In-Reply-To: <20171016215904.3380-1-judge.packham@gmail.com>
References: <20171016215904.3380-1-judge.packham@gmail.com>
Message-ID: <20171016215904.3380-3-judge.packham@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Chris Packham <judge.packham@gmail.com>
---
 package/zstd/zstd.mk | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index f149ad2f91..01fec7bb76 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -37,6 +37,26 @@ else
 ZSTD_OPTS += HAVE_LZ4=0
 endif
 
+HOST_ZSTD_DEPENDENCIES = host-zlib host-lz4 host-xz
+
+HOST_ZSTD_OPTS = \
+	HAVE_THREAD=1 \
+	HAVE_ZLIB=1 \
+	HAVE_LZMA=1 \
+	HAVE_LZ4=1
+
+define HOST_ZSTD_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) $(HOST_ZSTD_OPTS) \
+		-C $(@D) zstd
+endef
+
+define HOST_ZSTD_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) $(HOST_ZSTD_OPTS) \
+		DESTDIR=$(HOST_DIR) PREFIX=/usr -C $(@D)/programs install
+	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) $(HOST_ZSTD_OPTS) \
+		DESTDIR=$(HOST_DIR) PREFIX=/usr -C $(@D)/lib install
+endef
+
 define ZSTD_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
 		-C $(@D) zstd
@@ -53,3 +73,4 @@ define ZSTD_INSTALL_STAGING_CMDS
 endef
 
 $(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
2.14.2

From: Norbert Lange <nolange79@gmail.com>
Date: Tue, 25 May 2021 19:26:48 +0200
Subject: [Buildroot] [PATCH v2 2/5] package/zstd: Simplify host-build
In-Reply-To: <20210525172652.821351-1-nolange79@gmail.com>
References: <20210525172652.821351-1-nolange79@gmail.com>
Message-ID: <20210525172652.821351-2-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

1.5.0 uses Threads by default for cli tool and DSO,
should not be necessary to do anything special.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/zstd/zstd.mk | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index 194974147c..2a876376a2 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -78,21 +78,16 @@ define ZSTD_INSTALL_TARGET_CMDS
 		DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(@D)/lib $(ZSTD_INSTALL_LIBS)
 endef
 
-# note: only limited 'HAVE_...' options for host library build only
-HOST_ZSTD_OPTS = HAVE_THREAD=1
+HOST_ZSTD_OPTS += PREFIX=$(HOST_DIR)
 
 define HOST_ZSTD_BUILD_CMDS
 	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) $(HOST_ZSTD_OPTS) \
-		-C $(@D)/lib libzstd.a-mt libzstd-mt
-	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) $(HOST_ZSTD_OPTS) \
-		-C $(@D) zstd
+		-C $(@D) zstd-release lib-release
 endef
 
 define HOST_ZSTD_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) $(HOST_ZSTD_OPTS) \
-		DESTDIR=$(HOST_DIR) PREFIX=/usr -C $(@D)/lib install
-	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) $(HOST_ZSTD_OPTS) \
-		DESTDIR=$(HOST_DIR) PREFIX=/usr -C $(@D)/programs install
+		-C $(@D) install
 endef
 
 $(eval $(generic-package))
-- 
2.30.2

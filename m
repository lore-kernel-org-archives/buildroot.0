From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Tue, 21 May 2019 15:39:24 +0200
Subject: [Buildroot] [PATCH v2 04/12] package/ddrescue: fix BUG_85180 build
 timeout
In-Reply-To: <20190521133932.81841-1-giulio.benetti@micronovasrl.com>
References: <20190521133932.81841-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190521133932.81841-5-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With Microblaze Gcc version < 8.x build hangs on compiling first files.
This is due to bug 85180:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180
Bug shows up building ddrescue with optimization but not when building
with -O0.

If BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y force using -O0 passing it to
CXXFLAGS.

Fixes:
http://autobuild.buildroot.net/results/2af/2af69401acb76be3d3fd427d1c58fed3af33bf9b/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 package/ddrescue/ddrescue.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/ddrescue/ddrescue.mk b/package/ddrescue/ddrescue.mk
index 9432e7a16d..b746e4a416 100644
--- a/package/ddrescue/ddrescue.mk
+++ b/package/ddrescue/ddrescue.mk
@@ -18,8 +18,12 @@ define DDRESCUE_CONFIGURE_CMDS
 	)
 endef
 
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
+DDRESCUE_CXXFLAGS += $(TARGET_CXXFLAGS) -O0
+endif
+
 define DDRESCUE_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) CXXFLAGS="$(DDRESCUE_CXXFLAGS)" -C $(@D)
 endef
 
 define DDRESCUE_INSTALL_TARGET_CMDS
-- 
2.17.1

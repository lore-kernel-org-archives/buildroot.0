From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 24 May 2019 21:41:47 +0200
Subject: [Buildroot] [git commit] package/ddrescue: work around gcc bug 85180
Message-ID: <20190524194250.C943288C6F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2f5d554f4d24e374015e92cd1e75f748d615647f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With Microblaze Gcc version < 8.x the build hangs due to gcc bug
85180: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180. The bug
shows up when building ddrescue with optimization but not when
building with -O0. To work around this, if
BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y we force using -O0.

Fixes:

  http://autobuild.buildroot.net/results/2af69401acb76be3d3fd427d1c58fed3af33bf9b/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
[Thomas: tweak CFLAGS logic, improve commit log]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ddrescue/ddrescue.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/ddrescue/ddrescue.mk b/package/ddrescue/ddrescue.mk
index 9432e7a16d..b7564d5971 100644
--- a/package/ddrescue/ddrescue.mk
+++ b/package/ddrescue/ddrescue.mk
@@ -18,8 +18,14 @@ define DDRESCUE_CONFIGURE_CMDS
 	)
 endef
 
+DDRESCUE_CXXFLAGS = $(TARGET_CXXFLAGS)
+
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
+DDRESCUE_CXXFLAGS += -O0
+endif
+
 define DDRESCUE_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) CXXFLAGS="$(DDRESCUE_CXXFLAGS)" -C $(@D)
 endef
 
 define DDRESCUE_INSTALL_TARGET_CMDS

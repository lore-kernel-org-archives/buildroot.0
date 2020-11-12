From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 12 Nov 2020 20:34:45 +0200
Subject: [Buildroot] [PATCH v2] package/luajit: drop static build handling
Message-ID: <790909caf28e2610e07b358113168deee7ff87c3.1605206085.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Static build of luajit is disabled since commit b2e8f28efac
("package/luajit: disable for static build"). Remove the related
BUILDMODE handling as well.

Cc: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
v2: fix commit title
---
 package/luajit/luajit.mk | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index 68e6af4f5e7c..defa21dd3ffd 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -17,12 +17,6 @@ ifeq ($(BR2_PACKAGE_LUAJIT_COMPAT52),y)
 LUAJIT_XCFLAGS += -DLUAJIT_ENABLE_LUA52COMPAT
 endif
 
-ifeq ($(BR2_STATIC_LIBS),y)
-LUAJIT_BUILDMODE = static
-else
-LUAJIT_BUILDMODE = dynamic
-endif
-
 # The luajit build procedure requires the host compiler to have the
 # same bitness as the target compiler. Therefore, on a x86 build
 # machine, we can't build luajit for x86_64, which is checked in
@@ -50,7 +44,7 @@ define LUAJIT_BUILD_CMDS
 		HOST_CC="$(LUAJIT_HOST_CC)" \
 		HOST_CFLAGS="$(HOST_CFLAGS)" \
 		HOST_LDFLAGS="$(HOST_LDFLAGS)" \
-		BUILDMODE=$(LUAJIT_BUILDMODE) \
+		BUILDMODE=dynamic \
 		XCFLAGS=$(LUAJIT_XCFLAGS) \
 		-C $(@D) amalg
 endef
-- 
2.28.0

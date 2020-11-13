From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Nov 2020 19:14:09 +0100
Subject: [Buildroot] [git commit branch/next] package/luajit: drop static
 build handling
Message-ID: <20201113180318.F38F3814A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2310d3588cd75f9f503e4e219da2b85762ed3247
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Static build of luajit is disabled since commit b2e8f28efac
("package/luajit: disable for static build"). Remove the related
BUILDMODE handling as well.

Cc: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/luajit/luajit.mk | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index 68e6af4f5e..defa21dd3f 100644
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

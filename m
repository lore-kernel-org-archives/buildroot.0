From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  1 Mar 2014 18:23:04 +0100
Subject: [Buildroot] [lua V3 3/8] luajit: handles BR2_PREFER_STATIC_LIB
In-Reply-To: <1393694590-29945-1-git-send-email-francois.perrad@gadz.org>
References: <1393694590-29945-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1393694590-29945-4-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luajit/luajit.mk |    8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index 32596a1..859425a 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -16,6 +16,12 @@ ifneq ($(BR2_LARGEFILE),y)
 LUAJIT_NO_LARGEFILE = TARGET_LFSFLAGS=
 endif
 
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+LUAJIT_BUILDMODE = static
+else
+LUAJIT_BUILDMODE = dynamic
+endif
+
 # The luajit build procedure requires the host compiler to have the
 # same bitness as the target compiler. Therefore, on a x86 build
 # machine, we can't build luajit for x86_64, which is checked in
@@ -44,7 +50,7 @@ define LUAJIT_BUILD_CMDS
 		HOST_CFLAGS="$(HOST_CFLAGS)" \
 		HOST_LDFLAGS="$(HOST_LDFLAGS)" \
 		$(LUAJIT_NO_LARGEFILE) \
-		BUILDMODE=dynamic \
+		BUILDMODE=$(LUAJIT_BUILDMODE) \
 		-C $(@D) amalg
 endef
 
-- 
1.7.9.5

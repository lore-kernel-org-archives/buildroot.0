From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Mar 2014 23:10:07 +0100
Subject: [Buildroot] [git commit] luajit: handles BR2_PREFER_STATIC_LIB
Message-ID: <20140303221045.552BD9BC6F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5412b62d196445b3ae842d993571ef7799adbd7a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/luajit/luajit.mk |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

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
 

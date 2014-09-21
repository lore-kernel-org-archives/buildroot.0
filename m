From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 22:07:02 +0200
Subject: [Buildroot] [git commit] portmap: fix static linking
Message-ID: <20140921200726.C52E49BEA1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=48713e430d5e86d4996af27752e48bea7859c45f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Portmap builds and links, however, does not get built correctly when
BR2_PREFER_STATIC_LIB is selected.  There are no dynamic libraries in
rootfs.tar, however, portmap gets linked dynamically without regards to
the PREFER_STATIC_LIB tags.  LDFLAGS was not being passed into the build of
portmap.

Signed-off-by:  Andy Kennedy <andy.kennedy@adtran.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/portmap/portmap.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/portmap/portmap.mk b/package/portmap/portmap.mk
index 8203555..0189597 100644
--- a/package/portmap/portmap.mk
+++ b/package/portmap/portmap.mk
@@ -17,8 +17,7 @@ PORTMAP_FLAGS += NO_FORK=1
 endif
 
 define PORTMAP_BUILD_CMDS
-	CFLAGS="$(TARGET_CFLAGS)" \
-	$(MAKE) CC="$(TARGET_CC)" -C $(@D) $(PORTMAP_FLAGS)
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) $(PORTMAP_FLAGS)
 endef
 
 define PORTMAP_INSTALL_TARGET_CMDS

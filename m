From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Aug 2015 12:20:39 +0200
Subject: [Buildroot] [git commit] guile: fix static-only build
Message-ID: <20150807102447.AA56781EE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=49593aba5a56c9c297c31c12fc4dc3de5679e7b1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

guile uses bdwgc, which is already compiled with GC_NO_DLOPEN in
static-only scenarios. However, the bdwgc headers continue to include
<dlfcn.h> if used with GC_NO_DLOPEN undefined.

Therefore, to make guile link properly in a static-only scenario, we
have to build it with GC_NO_DLOPEN defined.

Fixes:

  http://autobuild.buildroot.net/results/1bf/1bf73dd4c28d6607e8c24d3abf259b8032712a02/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/guile/guile.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/guile/guile.mk b/package/guile/guile.mk
index fed79a6..2bd7198 100644
--- a/package/guile/guile.mk
+++ b/package/guile/guile.mk
@@ -28,6 +28,10 @@ GUILE_CFLAGS = \
 	-DHAVE_GC_GET_FREE_SPACE_DIVISOR \
 	-DHAVE_GC_SET_FINALIZE_ON_DEMAND
 
+ifeq ($(BR2_STATIC_LIBS),y)
+GUILE_CFLAGS += -DGC_NO_DLOPEN
+endif
+
 GUILE_CONF_ENV += GUILE_FOR_BUILD=$(HOST_DIR)/usr/bin/guile \
 	CFLAGS="$(TARGET_CFLAGS) $(GUILE_CFLAGS)"
 

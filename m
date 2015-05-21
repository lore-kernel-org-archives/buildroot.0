From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 May 2015 23:22:52 +0200
Subject: [Buildroot] [git commit] iproute2: ensure TARGET_LDFLAGS are used
Message-ID: <20150521212656.CA70F800F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dc587bf92c238e7d497bc1d4d9658923ada5c7be
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise we can end up with various linker issues (E.G. linking shared
against libc for a static build, ..).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iproute2/iproute2.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index ab374e1..49b1fdc 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -58,7 +58,7 @@ endef
 
 define IPROUTE2_BUILD_CMDS
 	$(SED) 's/$$(CCOPTS)//' $(@D)/netem/Makefile
-	$(TARGET_MAKE_ENV) $(MAKE) \
+	$(TARGET_MAKE_ENV) LDFLAGS="$(TARGET_LDFLAGS)" $(MAKE) \
 		DBM_INCLUDE="$(STAGING_DIR)/usr/include" \
 		CCOPTS="$(TARGET_CFLAGS) -D_GNU_SOURCE" \
 		SHARED_LIBS="$(if $(BR2_STATIC_LIBS),n,y)" -C $(@D)

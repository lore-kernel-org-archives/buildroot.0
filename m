From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Jul 2012 23:52:22 +0200
Subject: [Buildroot] [git commit] libnss: fix 64-bit build
Message-ID: <20120717221541.023D390B5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=adbe85c752651bc147bc4deb6419d162b2c6417e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On some architectures (found on x86_64, but probably others too),
libnss builds with -m32 unless it is configured for 64-bit build.  So
force 64-bit build on 64-bit architectures.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libnss/libnss.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 2e28c75..f7fd682 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -28,6 +28,10 @@ LIBNSS_BUILD_VARS = MOZILLA_CLIENT=1 \
 		OS_RELEASE="2.6" \
 		OS_TEST="$(ARCH)"
 
+ifeq ($(BR2_ARCH_IS_64),y)
+LIBNSS_BUILD_VARS += USE_64=1
+endif
+
 
 define LIBNSS_BUILD_CMDS
 	$(MAKE1) -C $(@D)/$(LIBNSS_SUBDIR)/nss build_coreconf build_dbm all \

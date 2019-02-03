From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 3 Feb 2019 21:27:20 +0100
Subject: [Buildroot] [git commit] package/netsurf: use TMP_PREFIX inside the
 build directory
Message-ID: <20190203203001.BC04981560@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=122089adf699ebe879d55466fe34f1ccabfe4808
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The netsurf build system creates a stamp file inside TMP_PREFIX to
know if the build was done, and if the stamp file exists, it doesn't
do any build. Therefore, having this stamp file in STAGING_DIR
prevents from rebuilding netsurf, even after removing its entire build
directory: the stamp file exists in STAGING_DIR, and netsurf doesn't
build anything, causing the installation to fail.

We fix this by putting this temporary directory inside the netsurf
build directory. We must mkdir this directory manually, otherwise the
build fails with:

COMPILE: src/stylesheet.c
In file included from src/stylesheet.c:12:0:
src/stylesheet.h:14:10: fatal error: libwapcaplet/libwapcaplet.h: No such file or directory
^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[Arnout: mkdir it first]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/netsurf/netsurf.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/netsurf/netsurf.mk b/package/netsurf/netsurf.mk
index 2e17c5768f..d1efd66f34 100644
--- a/package/netsurf/netsurf.mk
+++ b/package/netsurf/netsurf.mk
@@ -78,11 +78,12 @@ NETSURF_MAKE_OPTS = \
 	BUILD_CC="$(HOSTCC)" \
 	CC="$(TARGET_CC)" \
 	AR="$(TARGET_AR)" \
-	TMP_PREFIX=$(STAGING_DIR)/usr \
+	TMP_PREFIX=$(@D)/tmpusr \
 	NETSURF_CONFIG="$(NETSURF_CONFIG)" \
 	PREFIX=/usr
 
 define NETSURF_BUILD_CMDS
+	mkdir -p $(@D)/tmpusr
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(NETSURF_MAKE_OPTS) \
 		build
 endef

From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Sep 2014 10:54:18 +0200
Subject: [Buildroot] [git commit] mtdev2tuio: fix static linking
Message-ID: <20140901085539.A64459D2FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c86439678bc0db90ef5cbb59ada599a741ffffef
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Liblo uses log(3), so we need to link with -lm when linking statically.

Fixes http://autobuild.buildroot.net/results/bec/becda4756c577ec158536408aba59797fbed938a/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mtdev2tuio/mtdev2tuio.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/mtdev2tuio/mtdev2tuio.mk b/package/mtdev2tuio/mtdev2tuio.mk
index b4aab52..7b00221 100644
--- a/package/mtdev2tuio/mtdev2tuio.mk
+++ b/package/mtdev2tuio/mtdev2tuio.mk
@@ -11,11 +11,12 @@ MTDEV2TUIO_LICENSE = GPLv3+
 MTDEV2TUIO_LICENSE_FILES = COPYING
 
 # mtdev2tuio Makefile misuses $(LD) as gcc, so we need to override LD
-# here.
+# here. Liblo uses log(3), so we need to link with -lm
 define MTDEV2TUIO_BUILD_CMDS
 	$(MAKE) \
 		$(TARGET_CONFIGURE_OPTS) \
 		LD="$(TARGET_CC)" \
+		LIBS="-lmtdev -llo -lm" \
 		-C $(@D)
 endef
 

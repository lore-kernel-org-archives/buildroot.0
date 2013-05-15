From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 15 May 2013 15:00:26 +0200
Subject: [Buildroot] [git commit] aircrack-ng: fix statically linked build
Message-ID: <20130515140651.682AC9A1B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bed1490d0f58dc963d2144f2fe6b705f9f36d848
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixe the build failure visible at
http://autobuild.buildroot.net/results/2441d8b62323a00f32f2edb7cb781dda71ff7f68

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/aircrack-ng/aircrack-ng.mk |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/aircrack-ng/aircrack-ng.mk b/package/aircrack-ng/aircrack-ng.mk
index c6574f1..a36cf34 100644
--- a/package/aircrack-ng/aircrack-ng.mk
+++ b/package/aircrack-ng/aircrack-ng.mk
@@ -20,9 +20,12 @@ else
 	AIRCRACK_NG_MAKE_OPTS = sqlite=false
 endif
 
+AIRCRACK_NG_LDFLAGS = -lz \
+	$(if $(BR2_PREFER_STATIC_LIB),-ldl -lpthread)
+
 define AIRCRACK_NG_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE1) CC="$(TARGET_CC)" LD="$(TARGET_LD)" \
-		LDFLAGS="$(TARGET_LDFLAGS) -lz" \
+		LDFLAGS="$(AIRCRACK_NG_LDFLAGS)" \
 		-C $(@D) $(AIRCRACK_NG_MAKE_OPTS) all
 endef
 

From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 15 May 2013 10:26:50 +0200
Subject: [Buildroot] [PATCH 2/2] aircrack-ng: fix statically linked build
In-Reply-To: <1368606410-24783-1-git-send-email-s.martin49@gmail.com>
References: <1368606410-24783-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1368606410-24783-2-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixe the build failure visible at
http://autobuild.buildroot.net/results/2441d8b62323a00f32f2edb7cb781dda71ff7f68

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/aircrack-ng/aircrack-ng.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

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
 
-- 
1.8.2.3

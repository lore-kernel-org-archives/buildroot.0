From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  5 Aug 2016 20:05:01 +0200
Subject: [Buildroot] [PATCH 2/2] package/kmsxx: fix static install
In-Reply-To: <cover.1470420184.git.yann.morin.1998@free.fr>
References: <cover.1470420184.git.yann.morin.1998@free.fr>
Message-ID: <f79ac35d1809e53962c3241c6483f3f7f1613603.1470420184.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, we only try to install the shared libraries.

However, when doing a static build, only the static libs are built,
obviously.

Fix this by only installing relevant libraries.

Fixes:
    http://autobuild.buildroot.org/results/82c/82cfb7451f933b222abe30b5d35d23e409a4af79/
    http://autobuild.buildroot.org/results/bb3/bb3840f14382b6ed77d5947eb3ac5c229286681e/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kmsxx/kmsxx.mk | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/package/kmsxx/kmsxx.mk b/package/kmsxx/kmsxx.mk
index 84c860c..df0ab23 100644
--- a/package/kmsxx/kmsxx.mk
+++ b/package/kmsxx/kmsxx.mk
@@ -29,17 +29,23 @@ endif
 KMSXX_LIBS = kms++ kms++util
 
 define KMSXX_INSTALL_TARGET_CMDS
-	$(foreach l,$(KMSXX_LIBS),\
-		$(INSTALL) -D -m 0755 $(@D)/lib/lib$(l).so \
-			$(TARGET_DIR)/usr/lib/lib$(l).so
+	$(if $(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),
+		$(foreach l,$(KMSXX_LIBS),\
+			$(INSTALL) -D -m 0755 $(@D)/lib/lib$(l).so \
+				$(TARGET_DIR)/usr/lib/lib$(l).so
+		)
 	)
 	$(KMSXX_INSTALL_TARGET_TESTS)
 endef
 
 define KMSXX_INSTALL_STAGING_CMDS
 	$(foreach l,$(KMSXX_LIBS),\
-		$(INSTALL) -D -m 0755 $(@D)/lib/lib$(l).so \
-			$(STAGING_DIR)/usr/lib/lib$(l).so
+		$(if $(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),
+			$(INSTALL) -D -m 0755 $(@D)/lib/lib$(l).so \
+				$(STAGING_DIR)/usr/lib/lib$(l).so)
+		$(if $(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),
+			$(INSTALL) -D -m 0755 $(@D)/lib/lib$(l).a \
+				$(STAGING_DIR)/usr/lib/lib$(l).a)
 		mkdir -p $(STAGING_DIR)/usr/include/$(l)
 		cp -dpfr $(@D)/$(l)/inc/$(l)/* $(STAGING_DIR)/usr/include/$(l)/
 	)
-- 
2.7.4

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 22 Aug 2015 23:34:50 +0200
Subject: [Buildroot] [PATCH] package/canfestival: don't build in parallel
Message-ID: <1440279290-18408-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Makefiles for canfestival are not correctly written, which leads to
multiple warnings such as:

    make[4]: warning: jobserver unavailable: using -j1. Add `+' to parent make rule.

Since canfestival is relatively small, it builds in less than 6s here
when not in parallell, while a parallel build takes 5s.

Just disable parallel build to avoid future surprises.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/canfestival/canfestival.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/canfestival/canfestival.mk b/package/canfestival/canfestival.mk
index e929c5e..61578d3 100644
--- a/package/canfestival/canfestival.mk
+++ b/package/canfestival/canfestival.mk
@@ -36,13 +36,13 @@ define CANFESTIVAL_CONFIGURE_CMDS
 endef
 
 define CANFESTIVAL_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) all \
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) all \
 		PYTHON=$(HOST_DIR)/usr/bin/python2
 endef
 
 define CANFESTIVAL_INSTALL_TARGET_CMDS
 	for d in $(CANFESTIVAL_INSTALLED-y) ; do \
-		$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/$$d install \
+		$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D)/$$d install \
 			PYTHON=$(HOST_DIR)/usr/bin/python2 \
 			DESTDIR=$(TARGET_DIR) || exit 1 ; \
 	done
@@ -50,7 +50,7 @@ endef
 
 define CANFESTIVAL_INSTALL_STAGING_CMDS
 	for d in $(CANFESTIVAL_INSTALLED-y) ; do \
-		$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/$$d install \
+		$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D)/$$d install \
 			PYTHON=$(HOST_DIR)/usr/bin/python2 \
 			DESTDIR=$(STAGING_DIR) || exit 1 ; \
 	done
-- 
1.9.1

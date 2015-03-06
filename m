From: Jens Zettelmeyer <zettelmeyerj@gmail.com>
Date: Fri,  6 Mar 2015 20:15:48 +0000
Subject: [Buildroot] [PATCH 1/1] Fix batctl for static builds
Message-ID: <1425672948-1668-1-git-send-email-zettelmeyerj@goooglemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jens Zettelmeyer <zettelmeyerj@goooglemail.com>
---
 package/batctl/batctl.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/batctl/batctl.mk b/package/batctl/batctl.mk
index c458752..d99239f 100644
--- a/package/batctl/batctl.mk
+++ b/package/batctl/batctl.mk
@@ -9,8 +9,12 @@ BATCTL_SITE = http://downloads.open-mesh.org/batman/releases/batman-adv-$(BATCTL
 BATCTL_LICENSE = GPLv2
 BATCTL_DEPENDENCIES = libnl host-pkgconf
 
+ifeq ($(BR2_STATIC_LIBS),y)
+BATCTL_LIBS += -lnl-3 -lm -lpthread
+endif
+
 define BATCTL_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) all
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) LDLIBS="$(TARGET_LIBS) $(BATCTL_LIBS)" $(MAKE) -C $(@D) all
 endef
 
 define BATCTL_INSTALL_TARGET_CMDS
-- 
2.0.5

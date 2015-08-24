From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 24 Aug 2015 09:59:05 +0100
Subject: [Buildroot] [PATCH] zyre: fix static builds
Message-ID: <1440406745-16062-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

zyre package fails to build statically, so we pass the needed libs
directly in order to fix this problem.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/zyre/zyre.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/zyre/zyre.mk b/package/zyre/zyre.mk
index 661dddc..87ed427 100644
--- a/package/zyre/zyre.mk
+++ b/package/zyre/zyre.mk
@@ -12,6 +12,10 @@ ZYRE_INSTALL_STAGING = YES
 ZYRE_DEPENDENCIES = czmq zeromq
 ZYRE_AUTORECONF = YES
 
+ifeq ($(BR2_STATIC_LIBS),y)
+ZYRE_CONF_ENV += LIBS="-lzmq -lstdc++ -lczmq -pthread"
+endif
+
 define ZYRE_CREATE_CONFIG_DIR
 	mkdir -p $(@D)/config
 endef
-- 
1.7.1

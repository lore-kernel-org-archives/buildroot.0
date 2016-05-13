From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Fri, 13 May 2016 12:00:24 +0200
Subject: [Buildroot] [PATCH] package/turbolua: Fix optional openssl
	dependency
Message-ID: <1463133624-25458-1-git-send-email-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

turbolua fails to build when we have openssl selected, because it didn't
mention openssl in the dependency list.

Fix build failure by specifying openssl in dependency list when it is
selected.

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 package/turbolua/turbolua.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/turbolua/turbolua.mk b/package/turbolua/turbolua.mk
index cf66e70..fe6db31 100644
--- a/package/turbolua/turbolua.mk
+++ b/package/turbolua/turbolua.mk
@@ -12,9 +12,15 @@ TURBOLUA_LICENSE_FILES = LICENSE
 
 TURBOLUA_MAKE_OPTS = \
 	$(TARGET_CONFIGURE_OPTS) \
-	SSL=$(if $(BR2_PACKAGE_OPENSSL),openssl,none) \
 	LUAJIT_VERSION="$(LUAJIT_VERSION)"
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+TURBOLUA_MAKE_OPTS += SSL=openssl
+TURBOLUA_DEPENDENCIES += openssl
+else
+TURBOLUA_MAKE_OPTS += SSL=none
+endif
+
 define TURBOLUA_BUILD_CMDS
 	$(MAKE) $(TURBOLUA_MAKE_OPTS) -C $(@D) all
 endef
-- 
2.8.2

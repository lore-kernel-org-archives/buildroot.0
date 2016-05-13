From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 May 2016 22:09:52 +0200
Subject: [Buildroot] [git commit] package/turbolua: Fix optional openssl
	dependency
Message-ID: <20160513201922.0A0A181F9A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=84c700c8d9ec09ad2477e42c933ec091c9085dd8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

turbolua fails to build when we have openssl selected, because it didn't
mention openssl in the dependency list.

Fix build failure by specifying openssl in dependency list when it is
selected.

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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

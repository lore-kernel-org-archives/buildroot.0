From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  4 Dec 2018 22:15:36 +0100
Subject: [Buildroot] [PATCH 1/1] civetweb: fix build without sync
Message-ID: <20181204211536.17178-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If BR2_TOOLCHAIN_HAS_SYNC_4 is not set, define -DNO_ATOMICS=1 to
fallback on lock

Fixes:
 - http://autobuild.buildroot.org/results/7b3bc71d64aedf617dde35798099e16d7ae46713

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/civetweb/civetweb.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/civetweb/civetweb.mk b/package/civetweb/civetweb.mk
index 4c3c443db7..73706b03a6 100644
--- a/package/civetweb/civetweb.mk
+++ b/package/civetweb/civetweb.mk
@@ -21,6 +21,10 @@ CIVETWEB_INSTALL_OPTS = \
 	HTMLDIR="$(TARGET_DIR)$(CIVETWEB_HTMLDIR)" \
 	SYSCONFDIR="$(TARGET_DIR)$(CIVETWEB_SYSCONFDIR)"
 
+ifneq ($(BR2_TOOLCHAIN_HAS_SYNC_4),y)
+CIVETWEB_COPT += -DNO_ATOMICS=1
+endif
+
 ifeq ($(BR2_PACKAGE_CIVETWEB_WITH_LUA),y)
 CIVETWEB_CONF_OPTS += WITH_LUA=1
 CIVETWEB_LIBS += -ldl
-- 
2.14.1

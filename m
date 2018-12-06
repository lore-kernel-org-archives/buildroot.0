From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Dec 2018 21:44:43 +0100
Subject: [Buildroot] [git commit] package/civetweb: fix build without sync
Message-ID: <20181206204105.8E0F3870BA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bd2dc67cb939c611ebf0ddfa63a014fe32e8ed06
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If BR2_TOOLCHAIN_HAS_SYNC_4 is not set, define -DNO_ATOMICS=1 to
fallback on lock

Fixes:
 - http://autobuild.buildroot.org/results/7b3bc71d64aedf617dde35798099e16d7ae46713

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Thomas: invert condition.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/civetweb/civetweb.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/civetweb/civetweb.mk b/package/civetweb/civetweb.mk
index 4c3c443db7..fe1cdd5675 100644
--- a/package/civetweb/civetweb.mk
+++ b/package/civetweb/civetweb.mk
@@ -21,6 +21,10 @@ CIVETWEB_INSTALL_OPTS = \
 	HTMLDIR="$(TARGET_DIR)$(CIVETWEB_HTMLDIR)" \
 	SYSCONFDIR="$(TARGET_DIR)$(CIVETWEB_SYSCONFDIR)"
 
+ifeq ($(BR2_TOOLCHAIN_HAS_SYNC_4),)
+CIVETWEB_COPT += -DNO_ATOMICS=1
+endif
+
 ifeq ($(BR2_PACKAGE_CIVETWEB_WITH_LUA),y)
 CIVETWEB_CONF_OPTS += WITH_LUA=1
 CIVETWEB_LIBS += -ldl

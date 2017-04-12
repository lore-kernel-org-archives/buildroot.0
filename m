From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 12 Apr 2017 15:39:21 -0500
Subject: [Buildroot] [PATCH 1/1] ncurses: fix python,
	busybox circular dependency
Message-ID: <1492029561-57916-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This resolves a build failure where the following
circular dependency is created.

busybox which is a dependency of: ncurses
which is a dependency of: python
which is a dependency of: libselinux
which is a dependency of: busybox

Resolves:
http://autobuild.buildroot.net/results/db1/db1e6f3054092fc5576ccab8e04a3b9d74ca9a8c/

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/ncurses/ncurses.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 68c77ac..7b35015 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -30,9 +30,19 @@ NCURSES_CONF_OPTS = \
 	--without-manpages
 
 # Install after busybox for the full-blown versions
+# However if python is enabled, this causes a circular
+# dependency, for that case, use python as the dependency.
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
+ifeq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),y)
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+NCURSES_DEPENDENCIES += python3
+else
+NCURSES_DEPENDENCIES += python
+endif
+else
 NCURSES_DEPENDENCIES += busybox
 endif
+endif
 
 ifeq ($(BR2_STATIC_LIBS),y)
 NCURSES_CONF_OPTS += --without-shared --with-normal
-- 
1.9.1

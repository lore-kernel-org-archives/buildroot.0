From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Sep 2020 21:18:26 +0200
Subject: [Buildroot] [git commit] package/mc: bump to version 4.8.25
Message-ID: <20200919193043.E5ABF81125@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5e0a64e58dc3b98e8855173ee9aa379c71cf8ae1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The patch was merged upstream, so we drop it, and consequently drop
AUTORECONF = YES.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...misc-Makefile-am-install-mc-lib-only-once.patch | 60 ----------------------
 package/mc/mc.hash                                 |  4 +-
 package/mc/mc.mk                                   |  4 +-
 3 files changed, 3 insertions(+), 65 deletions(-)

diff --git a/package/mc/0001-Ticket-4070-misc-Makefile-am-install-mc-lib-only-once.patch b/package/mc/0001-Ticket-4070-misc-Makefile-am-install-mc-lib-only-once.patch
deleted file mode 100644
index be9bf7a402..0000000000
--- a/package/mc/0001-Ticket-4070-misc-Makefile-am-install-mc-lib-only-once.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From afb09f7cd7024484845ade25e15b8b93d6cf2d2c Mon Sep 17 00:00:00 2001
-From: Sergei Trofimovich <slyfox@gentoo.org>
-Date: Tue, 3 Mar 2020 09:26:12 +0000
-Subject: [PATCH] Ticket #4070: misc/Makefile.am: install mc.lib only once.
-
-Before the change mc.lib was installed twice due to being
-in two _DATA variables:
-
-dist_pkgdata_DATA = \
-        mc.lib
-
-pkgdata_DATA = \
-        $(dist_pkgdata_DATA) \
-        $(PKGDATA_OUT)
-
-This causes occasional install failures when two parallel
-`/usr/bin/install` calls race in installing the file:
-
-$ make -j20 DESTDIR=/var/tmp/portage/app-misc/mc-4.8.24/image install
-...
- /usr/lib/portage/python3.6/ebuild-helpers/xattr/install \
-    -c -m 644 mc.lib '/var/tmp/portage/app-misc/mc-4.8.24/image/usr/share/mc'
- /usr/lib/portage/python3.6/ebuild-helpers/xattr/install \
-    -c -m 644 mc.lib mc.charsets '/var/tmp/portage/app-misc/mc-4.8.24/image/usr/share/mc'
-...
- /usr/bin/install: cannot create regular file
-   '/var/tmp/portage/app-misc/mc-4.8.24/image/usr/share/mc/mc.lib': File exists
-
-After the change mc.lib is present only in dist_pkgdata_DATA.
-
-Signed-off-by: Sergei Trofimovich <slyfox@gentoo.org>
-Signed-off-by: Andrew Borodin <aborodin@vmail.ru>
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/MidnightCommander/mc/commit/afb09f7cd7024484845ade25e15b8b93d6cf2d2c]
----
- misc/Makefile.am | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/misc/Makefile.am b/misc/Makefile.am
-index 8ed1826136..24f4a0e1ad 100644
---- a/misc/Makefile.am
-+++ b/misc/Makefile.am
-@@ -17,7 +17,6 @@ dist_pkgdata_DATA = \
- 	mc.lib
- 
- pkgdata_DATA = \
--	$(dist_pkgdata_DATA) \
- 	$(PKGDATA_OUT)
- 
- SCRIPTS_IN = \
-@@ -54,7 +53,6 @@ EXTRA_DIST = \
- 	$(LIBFILES_SCRIPT) \
- 	$(SCRIPTS_IN) \
- 	$(noinst_DATA) \
--	$(dist_pkgdata_DATA) \
- 	$(PKGDATA_IN)
- 
- install-data-hook:
diff --git a/package/mc/mc.hash b/package/mc/mc.hash
index 687c356ef2..208d0beda4 100644
--- a/package/mc/mc.hash
+++ b/package/mc/mc.hash
@@ -1,4 +1,4 @@
-# Hash from http://ftp.midnight-commander.org/mc-4.8.24.sha256
-sha256  859f1cc070450bf6eb4d319ffcb6a5ac29deb0ac0d81559fb2e71242b1176d46  mc-4.8.24.tar.xz
+# Hash from http://ftp.midnight-commander.org/mc-4.8.25.sha256
+sha256  ffc19617f20ebb23330acd3998b7fd559a042d172fa55746d53d246697b2548a  mc-4.8.25.tar.xz
 # sha256 locally computed:
 sha256  5576bbec76296e1c8e081f7037ebd01bdada388635f58d844a2f20d37bbe4284  COPYING
diff --git a/package/mc/mc.mk b/package/mc/mc.mk
index b689e50e73..00f34f81cc 100644
--- a/package/mc/mc.mk
+++ b/package/mc/mc.mk
@@ -4,15 +4,13 @@
 #
 ################################################################################
 
-MC_VERSION = 4.8.24
+MC_VERSION = 4.8.25
 MC_SOURCE = mc-$(MC_VERSION).tar.xz
 MC_SITE = http://ftp.midnight-commander.org
 MC_LICENSE = GPL-3.0+
 MC_LICENSE_FILES = COPYING
 MC_DEPENDENCIES = libglib2 host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 MC_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
-# We're patching misc/Makefile.am
-MC_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_GPM),y)
 MC_CONF_OPTS += --with-gpm-mouse

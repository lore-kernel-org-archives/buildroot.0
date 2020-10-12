From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 12 Oct 2020 22:18:49 +0200
Subject: [Buildroot] [PATCH 2/2] package/sslh: bump to version 1.21c
In-Reply-To: <20201012201849.3040707-1-fontaine.fabrice@gmail.com>
References: <20201012201849.3040707-1-fontaine.fabrice@gmail.com>
Message-ID: <20201012201849.3040707-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Drop patch (already in version)
- libbsd is an optional dependency since version 1.21b and
  https://github.com/yrutschle/sslh/commit/0380a4309f826062a4ab772e65077c0566d8fbd4
- libconfig is optional since version 1.21c and
  https://github.com/yrutschle/sslh/commit/2c93a015ea1d261a934df00285691522e6a6d211
- Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...hile-building-sslh-in-a-larger-git-t.patch | 45 -------------------
 package/sslh/Config.in                        |  1 -
 package/sslh/sslh.hash                        |  4 +-
 package/sslh/sslh.mk                          | 18 ++++++--
 4 files changed, 17 insertions(+), 51 deletions(-)
 delete mode 100644 package/sslh/0001-secure-version-while-building-sslh-in-a-larger-git-t.patch

diff --git a/package/sslh/0001-secure-version-while-building-sslh-in-a-larger-git-t.patch b/package/sslh/0001-secure-version-while-building-sslh-in-a-larger-git-t.patch
deleted file mode 100644
index d23bc9fae6..0000000000
--- a/package/sslh/0001-secure-version-while-building-sslh-in-a-larger-git-t.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 0c39699da9a3d6534b6d26e7c9686ee76d81b64a Mon Sep 17 00:00:00 2001
-From: David Bachelart <david.bachelart@bbright.com>
-Date: Thu, 26 Jan 2017 10:07:47 +0100
-Subject: [PATCH] fix version extraction when building in a larger git tree
-
-sslh uses host git to extract its own version number. In buildroot, this
-is an issue since extracted information is conflicting with buildroot git
-status if we use git as VCS for buildroot.
-
-Since these git calls are legitimate only if git is used for the sslh
-subtree only, this patch adds a check : a .git directory has to exist at
-the root of the project to enable git-extracted version string.
-
-Signed-off-by: David Bachelart <david.bachelart@bbright.com>
-[yann.morin.1998 at free.fr: fix troll character U+c2a0]
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
----
- genver.sh | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/genver.sh b/genver.sh
-index 79fd0a0..051e57b 100755
---- a/genver.sh
-+++ b/genver.sh
-@@ -7,7 +7,7 @@ else
- 	QUIET=0
- fi
- 
--if ! `(git status | grep -q "On branch") 2> /dev/null`; then
-+if [ ! -d .git ] || ! `(git status | grep -q "On branch") 2> /dev/null`; then
-         # If we don't have git, we can't work out what
-         # version this is. It must have been downloaded as a
-         # zip file. 
-@@ -25,7 +25,7 @@ if ! `(git status | grep -q "On branch") 2> /dev/null`; then
-         fi
- fi
- 
--if head=`git rev-parse --verify HEAD 2>/dev/null`; then
-+if [ -d .git ] && head=`git rev-parse --verify HEAD 2>/dev/null`; then
- 	# generate the version info based on the tag
- 	release=`(git describe --tags || git --describe || git describe --all --long) \
- 		2>/dev/null | tr -d '\n'`
--- 
-2.1.4
-
diff --git a/package/sslh/Config.in b/package/sslh/Config.in
index e490c8c837..e608586c27 100644
--- a/package/sslh/Config.in
+++ b/package/sslh/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_SSLH
 	bool "sslh"
 	# uses fork()
 	depends on BR2_USE_MMU
-	select BR2_PACKAGE_LIBCONFIG
 	help
 	  Applicative protocol multiplexer
 
diff --git a/package/sslh/sslh.hash b/package/sslh/sslh.hash
index c25b37b8ab..00e5c12d77 100644
--- a/package/sslh/sslh.hash
+++ b/package/sslh/sslh.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a7f49b0a1cfcb7bb9d97f5ffa932bff11c5f65d9a9bd8fe1812481dee5855116    sslh-v1.20.tar.gz
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643    COPYING
+sha256  3bfe783726f82c1f5a4be630ddc494ebb08dbb69980662cd7ffdeb7bc9e1e706  sslh-v1.21c.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/sslh/sslh.mk b/package/sslh/sslh.mk
index ba91f8c4d6..4bde143cd8 100644
--- a/package/sslh/sslh.mk
+++ b/package/sslh/sslh.mk
@@ -4,16 +4,21 @@
 #
 ################################################################################
 
-SSLH_VERSION = 1.20
+SSLH_VERSION = 1.21c
 SSLH_SOURCE = sslh-v$(SSLH_VERSION).tar.gz
 SSLH_SITE = http://www.rutschle.net/tech/sslh
 SSLH_LICENSE = GPL-2.0+
 SSLH_LICENSE_FILES = COPYING
 
-SSLH_DEPENDENCIES = libconfig
-
 SSLH_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS)
 
+ifeq ($(BR2_PACKAGE_LIBBSD),y)
+SSLH_DEPENDENCIES += libbsd
+SSLH_MAKE_OPTS += USELIBBSD=1
+else
+SSLH_MAKE_OPTS += USELIBBSD=
+endif
+
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
 SSLH_DEPENDENCIES += libcap
 SSLH_MAKE_OPTS += USELIBCAP=1
@@ -21,6 +26,13 @@ else
 SSLH_MAKE_OPTS += USELIBCAP=
 endif
 
+ifeq ($(BR2_PACKAGE_LIBCONFIG),y)
+SSLH_DEPENDENCIES += libconfig
+SSLH_MAKE_OPTS += USELIBCONFIG=1
+else
+SSLH_MAKE_OPTS += USELIBCONFIG=
+endif
+
 ifeq ($(BR2_PACKAGE_PCRE),y)
 SSLH_DEPENDENCIES += pcre
 SSLH_MAKE_OPTS += USELIBPCRE=1
-- 
2.28.0

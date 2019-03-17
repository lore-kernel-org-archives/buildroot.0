From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Mar 2019 17:28:41 +0100
Subject: [Buildroot] [git commit] package/wpan-tools: bump to version 0.9
Message-ID: <20190317162559.67B018EC9C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=617749e9eb2b5ff95ed82980f2a626ebadc45fcd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Switch site to github
- Remove patch (already in version)
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...tras.h-fix-compatibility-with-libnl-3.3.0.patch | 49 ----------------------
 package/wpan-tools/wpan-tools.hash                 |  7 ++--
 package/wpan-tools/wpan-tools.mk                   |  7 ++--
 3 files changed, 7 insertions(+), 56 deletions(-)

diff --git a/package/wpan-tools/0001-src-nl_extras.h-fix-compatibility-with-libnl-3.3.0.patch b/package/wpan-tools/0001-src-nl_extras.h-fix-compatibility-with-libnl-3.3.0.patch
deleted file mode 100644
index 8b881ad3ae..0000000000
--- a/package/wpan-tools/0001-src-nl_extras.h-fix-compatibility-with-libnl-3.3.0.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From bb522bd584f05e6658d5dba97f48ca018f46394c Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sat, 6 May 2017 14:36:08 +0200
-Subject: [PATCH] src/nl_extras.h: fix compatibility with libnl 3.3.0
-
-nl_extras.h defines a set of nla_set_s*() functions if not provided by
-libnl. They are provided by libnl since version 3.2.26. The test
-(LIBNL_VER_MIC <= 26) was working fine while libnl was in the 3.2.x
-series, but now that they have incremented the minor version, the
-micro version was reset to 0, with the latest libnl version being
-3.3.0.
-
-Due to this, the condition (LIBNL_VER_MIC <= 26) is true, and we get
-redefinition errors because nl_extras.h redefines functions already
-provided by libnl.
-
-This commit improves the condition so that nl_extras.h provides the
-missing functions only if the minor version is < 2, or if minor is 2
-and micro is < 26.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- src/nl_extras.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/nl_extras.h b/src/nl_extras.h
-index c4d1d14..37844f9 100644
---- a/src/nl_extras.h
-+++ b/src/nl_extras.h
-@@ -1,7 +1,7 @@
- #ifndef __NL_EXTRAS_H
- #define __NL_EXTRAS_H
- 
--#if LIBNL_VER_MIC <= 26
-+#if (LIBNL_VER_MIN < 2) || (LIBNL_VER_MIN == 2) && (LIBNL_VER_MIC <= 26)
- 
- #ifndef NLA_S8
- 
-@@ -45,6 +45,6 @@ static inline int32_t nla_get_s32(struct nlattr *nla)
- 
- #endif /* NLA_S64 */
- 
--#endif /* LIBNL_VER_MIC */
-+#endif /* LIBNL_VER_* */
- 
- #endif /* __NL_EXTRAS_H */
--- 
-2.7.4
-
diff --git a/package/wpan-tools/wpan-tools.hash b/package/wpan-tools/wpan-tools.hash
index cfad89aa00..c9f0df2c1b 100644
--- a/package/wpan-tools/wpan-tools.hash
+++ b/package/wpan-tools/wpan-tools.hash
@@ -1,4 +1,3 @@
-# From http://wpan.cakelab.org/releases/md5sum
-md5	91f0b640ff66910e977fab6525625624	wpan-tools-0.7.tar.xz
-# Calculated based on the hash above
-sha256	c16de9d7861c2d9b6a4436a0fac730f9f545ee290b92bc770c538ec6a3f22309	wpan-tools-0.7.tar.xz
+# Locally calculated
+sha256	3e509d9ed838df1247cc9a0c6ca483cb356ae778851817bd7410044687b655e2	wpan-tools-0.9.tar.gz
+sha256	fe8e595c24d821a60885eb259619df5e5e3976c48465fde0be29fcd78530798f	COPYING
diff --git a/package/wpan-tools/wpan-tools.mk b/package/wpan-tools/wpan-tools.mk
index d5e43a92c8..d8898a7299 100644
--- a/package/wpan-tools/wpan-tools.mk
+++ b/package/wpan-tools/wpan-tools.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-WPAN_TOOLS_VERSION = 0.7
-WPAN_TOOLS_SOURCE = wpan-tools-$(WPAN_TOOLS_VERSION).tar.xz
-WPAN_TOOLS_SITE = http://wpan.cakelab.org/releases
+WPAN_TOOLS_VERSION = 0.9
+WPAN_TOOLS_SITE = $(call github,linux-wpan,wpan-tools,wpan-tools-$(WPAN_TOOLS_VERSION))
 WPAN_TOOLS_DEPENDENCIES = host-pkgconf libnl
 WPAN_TOOLS_LICENSE = ISC
 WPAN_TOOLS_LICENSE_FILES = COPYING
+# From git
+WPAN_TOOLS_AUTORECONF = YES
 
 $(eval $(autotools-package))

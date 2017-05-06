From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 May 2017 14:40:26 +0200
Subject: [Buildroot] [git commit] wpan-tools: add patch to fix build with
	libnl 3.3.0
Message-ID: <20170506124058.375DF827C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5d80e1c9263bbc142052da4b0612a4558b2b1aff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/4680e17c3b9bc6714bd511d5beccccdfb976b6f9/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...tras.h-fix-compatibility-with-libnl-3.3.0.patch | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/package/wpan-tools/0001-src-nl_extras.h-fix-compatibility-with-libnl-3.3.0.patch b/package/wpan-tools/0001-src-nl_extras.h-fix-compatibility-with-libnl-3.3.0.patch
new file mode 100644
index 0000000..8b881ad
--- /dev/null
+++ b/package/wpan-tools/0001-src-nl_extras.h-fix-compatibility-with-libnl-3.3.0.patch
@@ -0,0 +1,49 @@
+From bb522bd584f05e6658d5dba97f48ca018f46394c Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sat, 6 May 2017 14:36:08 +0200
+Subject: [PATCH] src/nl_extras.h: fix compatibility with libnl 3.3.0
+
+nl_extras.h defines a set of nla_set_s*() functions if not provided by
+libnl. They are provided by libnl since version 3.2.26. The test
+(LIBNL_VER_MIC <= 26) was working fine while libnl was in the 3.2.x
+series, but now that they have incremented the minor version, the
+micro version was reset to 0, with the latest libnl version being
+3.3.0.
+
+Due to this, the condition (LIBNL_VER_MIC <= 26) is true, and we get
+redefinition errors because nl_extras.h redefines functions already
+provided by libnl.
+
+This commit improves the condition so that nl_extras.h provides the
+missing functions only if the minor version is < 2, or if minor is 2
+and micro is < 26.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ src/nl_extras.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/nl_extras.h b/src/nl_extras.h
+index c4d1d14..37844f9 100644
+--- a/src/nl_extras.h
++++ b/src/nl_extras.h
+@@ -1,7 +1,7 @@
+ #ifndef __NL_EXTRAS_H
+ #define __NL_EXTRAS_H
+ 
+-#if LIBNL_VER_MIC <= 26
++#if (LIBNL_VER_MIN < 2) || (LIBNL_VER_MIN == 2) && (LIBNL_VER_MIC <= 26)
+ 
+ #ifndef NLA_S8
+ 
+@@ -45,6 +45,6 @@ static inline int32_t nla_get_s32(struct nlattr *nla)
+ 
+ #endif /* NLA_S64 */
+ 
+-#endif /* LIBNL_VER_MIC */
++#endif /* LIBNL_VER_* */
+ 
+ #endif /* __NL_EXTRAS_H */
+-- 
+2.7.4
+

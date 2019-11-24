From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 Nov 2019 22:48:31 +0100
Subject: [Buildroot] [git commit branch/next] package/libkcapi: bump version
 to 1.1.5
Message-ID: <20191124214108.5FDCB8FBE5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7b3895bca5637a72a098b9986cf171e35ea835a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Removed patch applied upstream:
https://github.com/smuellerDD/libkcapi/commit/52620ec798a580b2053d16a42362e9926729eb30

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...s-kcapi-hasher.c-fix-build-with-gcc-8.2.x.patch | 54 ----------------------
 package/libkcapi/libkcapi.hash                     |  2 +-
 package/libkcapi/libkcapi.mk                       |  2 +-
 3 files changed, 2 insertions(+), 56 deletions(-)

diff --git a/package/libkcapi/0001-apps-kcapi-hasher.c-fix-build-with-gcc-8.2.x.patch b/package/libkcapi/0001-apps-kcapi-hasher.c-fix-build-with-gcc-8.2.x.patch
deleted file mode 100644
index a4c352d30c..0000000000
--- a/package/libkcapi/0001-apps-kcapi-hasher.c-fix-build-with-gcc-8.2.x.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From dcb02c1639c2ff05938c01eaa41286a2e2f8d698 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 20 Jan 2019 20:04:13 +0100
-Subject: [PATCH] apps/kcapi-hasher.c: fix build with gcc 8.2.x
-
-Fixes:
- - http://autobuild.buildroot.org/results/8355bc42238e885f7f11ed3d9d37fc55ebdead2b
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/smuellerDD/libkcapi/pull/76]
----
- apps/kcapi-hasher.c | 12 ++++++++----
- 1 file changed, 8 insertions(+), 4 deletions(-)
-
-diff --git a/apps/kcapi-hasher.c b/apps/kcapi-hasher.c
-index d6be685..7172b12 100644
---- a/apps/kcapi-hasher.c
-+++ b/apps/kcapi-hasher.c
-@@ -357,16 +357,20 @@ out:
- }
- 
- /*
-- * GCC v8.1.0 introduced -Wstringop-truncation but it is not smart enough to
-- * find that cursor string will be NULL-terminated after all paste() calls and
-- * warns with:
-+ * GCC v8.1.0 introduced -Wstringop-truncation and GCC v8.2.0 introduced
-+ * -Wstringop-overflow but it is not smart enough to find that cursor string
-+ * will be NULL-terminated after all paste() calls and warns with:
-  * error: 'strncpy' destination unchanged after copying no bytes [-Werror=stringop-truncation]
-  * error: 'strncpy' output truncated before terminating nul copying 5 bytes from a string of the same length [-Werror=stringop-truncation]
-+ * error: 'strncpy' specified bound depends on the length of the source argument [-Werror=stringop-overflow=]
-  */
- #pragma GCC diagnostic push
- #if GCC_VERSION >= 80100
- #pragma GCC diagnostic ignored "-Wstringop-truncation"
- #endif
-+#if GCC_VERSION >= 80200
-+#pragma GCC diagnostic ignored "-Wstringop-overflow"
-+#endif
- static char *paste(char *dst, const char *src, size_t size)
- {
- 	strncpy(dst, src, size);
-@@ -417,7 +421,7 @@ static char *get_hmac_file(const char *filename, const char *checkdir)
- 	strncpy(cursor, "\0", 1);
- 	return checkfile;
- }
--#pragma GCC diagnostic pop /* -Wstringop-truncation */
-+#pragma GCC diagnostic pop /* -Wstringop-truncation -Wstringop-overflow */
- 
- static int hash_files(const struct hash_params *params,
- 		      char *filenames[], uint32_t files,
--- 
-2.14.1
-
diff --git a/package/libkcapi/libkcapi.hash b/package/libkcapi/libkcapi.hash
index a9b42bf6e2..b3c2c749c3 100644
--- a/package/libkcapi/libkcapi.hash
+++ b/package/libkcapi/libkcapi.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256 9197f35aca270f97c544fe94dab379b44a2879a07eb78acd5d02c55924902763	libkcapi-1.1.4.tar.xz
+sha256 8a08dcbb4d05ede4357cdc9d61c7f2a7f2cd96b7ce2eb41b28e45b2e378267ad	libkcapi-1.1.5.tar.xz
 sha256 c6b8402a68999b0f84560ab43cdf60f9ff33c4a9a8ced6a40db9d3b787ba5b4a	COPYING
 sha256 e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4	COPYING.gplv2
 sha256 13aa749a5b0a454917a944ed8fffc530b784f5ead522b1aacaf4ec8aa55a6239	COPYING.bsd
diff --git a/package/libkcapi/libkcapi.mk b/package/libkcapi/libkcapi.mk
index dceacc0016..60b3f94388 100644
--- a/package/libkcapi/libkcapi.mk
+++ b/package/libkcapi/libkcapi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBKCAPI_VERSION = 1.1.4
+LIBKCAPI_VERSION = 1.1.5
 LIBKCAPI_SOURCE = libkcapi-$(LIBKCAPI_VERSION).tar.xz
 LIBKCAPI_SITE = http://www.chronox.de/libkcapi
 LIBKCAPI_AUTORECONF = YES

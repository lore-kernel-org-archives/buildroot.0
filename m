From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 18 Aug 2016 23:50:17 +0200
Subject: [Buildroot] [PATCH 5/9 v2] package/bcusdk: drop a
	musl-compatibility patch
In-Reply-To: <cover.1471556612.git.yann.morin.1998@free.fr>
References: <cover.1471556612.git.yann.morin.1998@free.fr>
Message-ID: <4f563595df89ccfd348b543c04d5d4f87f1b2d3c.1471556612.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We now always have a sys/cdefs.h, so we can drop this patch.

Renumber remaining patch.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
Changes v1 -> v2:
  - commit log states remaining patch was renumbered  (Arnout)

---
Note that the patch was sent upstream, but it seems never acted upon.
---
 ...t-use-the-non-standard-sys-cdefs.h-header.patch | 48 ----------------------
 ...d_set-requires-inclusion-of-sys-select.h.patch} |  0
 2 files changed, 48 deletions(-)
 delete mode 100644 package/bcusdk/0001-Do-not-use-the-non-standard-sys-cdefs.h-header.patch
 rename package/bcusdk/{0002-fd_set-requires-inclusion-of-sys-select.h.patch => 0001-fd_set-requires-inclusion-of-sys-select.h.patch} (100%)

diff --git a/package/bcusdk/0001-Do-not-use-the-non-standard-sys-cdefs.h-header.patch b/package/bcusdk/0001-Do-not-use-the-non-standard-sys-cdefs.h-header.patch
deleted file mode 100644
index fc64386..0000000
--- a/package/bcusdk/0001-Do-not-use-the-non-standard-sys-cdefs.h-header.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From c36db3f798bf576f42d81a0c51198b17d7112e8c Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sat, 8 Aug 2015 17:43:28 +0200
-Subject: [PATCH] Do not use the non-standard <sys/cdefs.h> header
-
-<sys/cdefs.h> is glibc-specific, and should be used only internally by
-glibc, not by external libraries/programs. It is not available in all
-standard C libraries.
-
-Submitted upstream: https://sourceforge.net/p/bcusdk/patches/3/
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- eibd/include/eibclient.h | 11 ++++++++---
- 1 file changed, 8 insertions(+), 3 deletions(-)
-
-diff --git a/eibd/include/eibclient.h b/eibd/include/eibclient.h
-index 2781878..b095a1c 100644
---- a/eibd/include/eibclient.h
-+++ b/eibd/include/eibclient.h
-@@ -27,10 +27,11 @@
- #ifndef EIBCLIENT_H
- #define EIBCLIENT_H
- 
--#include <sys/cdefs.h>
- #include <stdint.h>
- 
--__BEGIN_DECLS;
-+#ifdef	__cplusplus
-+extern "C" {
-+#endif
- 
- #include "eibloadresult.h"
- 
-@@ -889,5 +890,9 @@ int EIB_Cache_LastUpdates_async (EIBConnection * con, uint16_t start,
- 				 uint16_t * end);
- 
- 
--__END_DECLS
-+
-+#ifdef	__cplusplus
-+}
-+#endif
-+
- #endif
--- 
-2.5.0
-
diff --git a/package/bcusdk/0002-fd_set-requires-inclusion-of-sys-select.h.patch b/package/bcusdk/0001-fd_set-requires-inclusion-of-sys-select.h.patch
similarity index 100%
rename from package/bcusdk/0002-fd_set-requires-inclusion-of-sys-select.h.patch
rename to package/bcusdk/0001-fd_set-requires-inclusion-of-sys-select.h.patch
-- 
2.7.4

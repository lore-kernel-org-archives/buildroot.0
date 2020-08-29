From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 29 Aug 2020 17:48:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/haproxy: bump to version 2.2.2
Message-ID: <20200829154845.2214590-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop patch (already in version)

http://www.haproxy.org/download/2.2/src/CHANGELOG

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-fix-build-with-static-only-toolchai.patch | 84 -------------------
 package/haproxy/haproxy.hash                  |  4 +-
 package/haproxy/haproxy.mk                    |  2 +-
 3 files changed, 3 insertions(+), 87 deletions(-)
 delete mode 100644 package/haproxy/0001-BUG-MEDIUM-tools-fix-build-with-static-only-toolchai.patch

diff --git a/package/haproxy/0001-BUG-MEDIUM-tools-fix-build-with-static-only-toolchai.patch b/package/haproxy/0001-BUG-MEDIUM-tools-fix-build-with-static-only-toolchai.patch
deleted file mode 100644
index 7ae7a6cbfd..0000000000
--- a/package/haproxy/0001-BUG-MEDIUM-tools-fix-build-with-static-only-toolchai.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-From 311df83437c4d578e35e5faca30c10da28c30323 Mon Sep 17 00:00:00 2001
-Message-Id: <311df83437c4d578e35e5faca30c10da28c30323.1595566447.git.baruch@tkos.co.il>
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Fri, 24 Jul 2020 07:44:59 +0300
-Subject: [PATCH] BUG/MEDIUM: tools: fix build with static only toolchains
-
-uClibc toolchains built with no dynamic library support don't provide
-the dlfcn.h header. That leads to build failure:
-
-  CC      src/tools.o
-src/tools.c:15:10: fatal error: dlfcn.h: No such file or directory
- #include <dlfcn.h>
-          ^~~~~~~~~
-Enable dladdr only when USE_DL is defined.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status:
-https://www.mail-archive.com/haproxy at formilux.org/msg37986.html
-
- src/tools.c | 12 ++++++------
- 1 file changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/src/tools.c b/src/tools.c
-index 1c664852ad73..0bd80f846d05 100644
---- a/src/tools.c
-+++ b/src/tools.c
-@@ -10,7 +10,7 @@
-  *
-  */
- 
--#ifdef __ELF__
-+#if defined(__ELF__) && defined(USE_DL)
- #define _GNU_SOURCE
- #include <dlfcn.h>
- #include <link.h>
-@@ -4410,7 +4410,7 @@ const char *get_exec_path()
- 	return ret;
- }
- 
--#ifdef __ELF__
-+#if defined(__ELF__) && defined(USE_DL)
- /* calls dladdr() or dladdr1() on <addr> and <dli>. If dladdr1 is available,
-  * also returns the symbol size in <size>, otherwise returns 0 there.
-  */
-@@ -4444,7 +4444,7 @@ static int dladdr_and_size(const void *addr, Dl_info *dli, size_t *size)
-  * The file name (lib or executable) is limited to what lies between the last
-  * '/' and the first following '.'. An optional prefix <pfx> is prepended before
-  * the output if not null. The file is not dumped when it's the same as the one
-- * that contains the "main" symbol, or when __ELF__ is not set.
-+ * that contains the "main" symbol, or when __ELF__ && USE_DL are not set.
-  *
-  * The symbol's base address is returned, or NULL when unresolved, in order to
-  * allow the caller to match it against known ones.
-@@ -4472,7 +4472,7 @@ const void *resolve_sym_name(struct buffer *buf, const char *pfx, void *addr)
- #endif
- 	};
- 
--#ifdef __ELF__
-+#if defined(__ELF__) && defined(USE_DL)
- 	Dl_info dli, dli_main;
- 	size_t size;
- 	const char *fname, *p;
-@@ -4489,7 +4489,7 @@ const void *resolve_sym_name(struct buffer *buf, const char *pfx, void *addr)
- 		}
- 	}
- 
--#ifdef __ELF__
-+#if defined(__ELF__) && defined(USE_DL)
- 	/* Now let's try to be smarter */
- 	if (!dladdr_and_size(addr, &dli, &size))
- 		goto unknown;
-@@ -4529,7 +4529,7 @@ const void *resolve_sym_name(struct buffer *buf, const char *pfx, void *addr)
- 		chunk_appendf(buf, "+%#lx", (long)(addr - dli.dli_fbase));
- 		return NULL;
- 	}
--#endif /* __ELF__ */
-+#endif /* __ELF__ && USE_DL */
-  unknown:
- 	/* unresolved symbol from the main file, report relative offset to main */
- 	if ((void*)addr < (void*)main)
--- 
-2.27.0
-
diff --git a/package/haproxy/haproxy.hash b/package/haproxy/haproxy.hash
index 4d880ef653..a1da516b0b 100644
--- a/package/haproxy/haproxy.hash
+++ b/package/haproxy/haproxy.hash
@@ -1,5 +1,5 @@
-# From: http://www.haproxy.org/download/2.2/src/haproxy-2.2.0.tar.gz.sha256
-sha256  3c1a87160eea40e067f1e2813bfe692280a10c455beb17a8ee7fae11e4223274  haproxy-2.2.0.tar.gz
+# From: http://www.haproxy.org/download/2.2/src/haproxy-2.2.2.tar.gz.sha256
+sha256  391c705a46c6208a63a67ea842c6600146ca24618531570c89c7915b0c6a54d6  haproxy-2.2.2.tar.gz
 # Locally computed:
 sha256  0717ca51fceaa25ac9e5ccc62e0c727dcf27796057201fb5fded56a25ff6ca28  LICENSE
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  doc/lgpl.txt
diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index e11abe7845..3ceb761c94 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 HAPROXY_VERSION_MAJOR = 2.2
-HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).0
+HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).2
 HAPROXY_SITE = http://www.haproxy.org/download/$(HAPROXY_VERSION_MAJOR)/src
 HAPROXY_LICENSE = GPL-2.0+ and LGPL-2.1+ with exceptions
 HAPROXY_LICENSE_FILES = LICENSE doc/lgpl.txt doc/gpl.txt
-- 
2.28.0

From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Apr 2016 20:38:03 +0200
Subject: [Buildroot] [git commit] package/nodejs: bump version to 6.0.0
Message-ID: <20160428193042.5D7897FB93@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=692005ae90c5b483ca9daa38b0723e4b2b002b31
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See https://nodejs.org/en/blog/release/v6.0.0/

The patches from 5.11.0 have been copied to 6.0.0 with the following
changes:

 - Removed 0001-Remove-dependency-on-Python-bz2-module.patch,
   0003-Fix-va_list-not-declared.patch and
   0004-Fix-support-for-uClibc-ng.patch as all 3 have been fixed upstream
 - Renamed 0002-gyp-force-link-command-to-use-CXX.patch to
   0001-gyp-force-link-command-to-use-CXX.patch

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...01-Remove-dependency-on-Python-bz2-module.patch | 31 -----------------
 .../5.11.0/0003-Fix-va_list-not-declared.patch     | 39 ----------------------
 .../5.11.0/0004-Fix-support-for-uClibc-ng.patch    | 33 ------------------
 .../0001-gyp-force-link-command-to-use-CXX.patch}  |  0
 package/nodejs/Config.in                           |  2 +-
 package/nodejs/nodejs.hash                         |  4 +--
 6 files changed, 3 insertions(+), 106 deletions(-)

diff --git a/package/nodejs/5.11.0/0001-Remove-dependency-on-Python-bz2-module.patch b/package/nodejs/5.11.0/0001-Remove-dependency-on-Python-bz2-module.patch
deleted file mode 100644
index 65bceef..0000000
--- a/package/nodejs/5.11.0/0001-Remove-dependency-on-Python-bz2-module.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 3d4817c152d6f3afddcc699949c4d1664da91e2b Mon Sep 17 00:00:00 2001
-From: Martin Bark <martin@barkynet.com>
-Date: Tue, 30 Jun 2015 09:43:11 +0100
-Subject: [PATCH 1/4] Remove dependency on Python bz2 module
-
-Do not import the bz2 module, it is not used.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-[Martin: adapt to 0.12.5]
-Signed-off-by: Martin Bark <martin@barkynet.com>
-[yann.morin.1998 at free.fr: adapt to 4.1.2]
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
----
- deps/v8/tools/js2c.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/deps/v8/tools/js2c.py b/deps/v8/tools/js2c.py
-index 77485f6..371caf5 100755
---- a/deps/v8/tools/js2c.py
-+++ b/deps/v8/tools/js2c.py
-@@ -34,7 +34,6 @@
- import os, re, sys, string
- import optparse
- import jsmin
--import bz2
- import textwrap
- 
- 
--- 
-2.1.4
-
diff --git a/package/nodejs/5.11.0/0003-Fix-va_list-not-declared.patch b/package/nodejs/5.11.0/0003-Fix-va_list-not-declared.patch
deleted file mode 100644
index aec8e12..0000000
--- a/package/nodejs/5.11.0/0003-Fix-va_list-not-declared.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 5b3dd2599ebde1846750aaf7c79576ad45246ffa Mon Sep 17 00:00:00 2001
-From: Martin Bark <martin@barkynet.com>
-Date: Tue, 8 Dec 2015 11:41:08 +0000
-Subject: [PATCH] Fix va_list not declared
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-When compiling with uClibc-ng the following error is seen.
-
-In file included from ../deps/v8/src/log-utils.cc:5:0:
-../deps/v8/src/log-utils.h:64:39: error: ???va_list??? has not been declared
-     void AppendVA(const char* format, va_list args);
-
-This patch fixes the issue by adding the missing #include <cstdarg>.  Note
-that this fix has already be included upstream, see
-https://github.com/nodejs/node/blob/8a43a3d/deps/v8/src/log-utils.h
-
-Signed-off-by: Martin Bark <martin@barkynet.com>
----
- deps/v8/src/log-utils.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/deps/v8/src/log-utils.h b/deps/v8/src/log-utils.h
-index 87dab52..6714307 100644
---- a/deps/v8/src/log-utils.h
-+++ b/deps/v8/src/log-utils.h
-@@ -5,6 +5,8 @@
- #ifndef V8_LOG_UTILS_H_
- #define V8_LOG_UTILS_H_
- 
-+#include <cstdarg>
-+
- #include "src/allocation.h"
- #include "src/base/platform/mutex.h"
- #include "src/flags.h"
--- 
-2.5.0
-
diff --git a/package/nodejs/5.11.0/0004-Fix-support-for-uClibc-ng.patch b/package/nodejs/5.11.0/0004-Fix-support-for-uClibc-ng.patch
deleted file mode 100644
index 59b9d50..0000000
--- a/package/nodejs/5.11.0/0004-Fix-support-for-uClibc-ng.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 1cc08f6ceacbb0e5ba1f4638ca3a97ac002d7792 Mon Sep 17 00:00:00 2001
-From: "Bark, Martin" <martin.bark@te.com>
-Date: Mon, 14 Dec 2015 13:26:10 +0000
-Subject: [PATCH 2/2] Fix support for uClibc-ng
-
-uClibc-ng is currently at v1.0.9.  The patch corrects the uClibc
-version test so that HAVE_IFADDRS_H is defined for uClibc versions
-after v0.9.32.
-
-Submitted upstream to libuv and accepted, see
-https://github.com/libuv/libuv/pull/653 and
-https://github.com/libuv/libuv/commit/c861972
-
-Signed-off-by: Bark, Martin <martin.bark@te.com>
----
- deps/uv/src/unix/linux-core.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/deps/uv/src/unix/linux-core.c b/deps/uv/src/unix/linux-core.c
-index e6e6828..6cbbb71 100644
---- a/deps/uv/src/unix/linux-core.c
-+++ b/deps/uv/src/unix/linux-core.c
-@@ -39,7 +39,7 @@
- #define HAVE_IFADDRS_H 1
-
- #ifdef __UCLIBC__
--# if __UCLIBC_MAJOR__ < 0 || __UCLIBC_MINOR__ < 9 || __UCLIBC_SUBLEVEL__ < 32
-+# if __UCLIBC_MAJOR__ < 0 && __UCLIBC_MINOR__ < 9 && __UCLIBC_SUBLEVEL__ < 32
- #  undef HAVE_IFADDRS_H
- # endif
- #endif
---
-2.6.2
diff --git a/package/nodejs/5.11.0/0002-gyp-force-link-command-to-use-CXX.patch b/package/nodejs/6.0.0/0001-gyp-force-link-command-to-use-CXX.patch
similarity index 100%
rename from package/nodejs/5.11.0/0002-gyp-force-link-command-to-use-CXX.patch
rename to package/nodejs/6.0.0/0001-gyp-force-link-command-to-use-CXX.patch
diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index c1d8331..850f9b8 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -43,7 +43,7 @@ config BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
 
 config BR2_PACKAGE_NODEJS_VERSION_STRING
 	string
-	default "5.11.0"	if BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
+	default "6.0.0"		if BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
 	default "0.10.44"
 
 menu "Module Selection"
diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 9e7fd30..4b15fd7 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
 # From upstream URL: http://nodejs.org/dist/v0.10.44/SHASUMS256.txt
 sha256  25b2cd910822723e972a3990d5687b7ff48581ad2f77aa1942d99a1b024f434a  node-v0.10.44.tar.xz
 
-# From upstream URL: http://nodejs.org/dist/v5.11.0/SHASUMS256.txt
-sha256  083766aff72fc5c78f6999dd0d00bc0340a052ab270fd60d6928b719ca2b3fd1  node-v5.11.0.tar.xz
+# From upstream URL: http://nodejs.org/dist/v6.0.0/SHASUMS256.txt
+sha256  f0e5bdc3cf4af85b8a24bdbebed81e1a9f7fda91cab8a9475737940aa90da617  node-v6.0.0.tar.xz

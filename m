From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Feb 2021 10:24:49 +0100
Subject: [Buildroot] [git commit] package/{apparmor,
 libapparmor}: bump version to 3.0.1
Message-ID: <20210207091615.9A0CB807E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2cacda25914bfcc48810e3cdd290b9b00acb7b86
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://gitlab.com/apparmor/apparmor/-/wikis/Release_Notes_3.0.1

Removed patches which were applied upstream, updated _SITE.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/apparmor/3.0.0                             |  1 -
 package/apparmor/apparmor.hash                     |  2 +-
 package/apparmor/apparmor.mk                       |  4 +--
 ...pparmor-add-missing-include-for-socklen_t.patch | 35 --------------------
 ...ont-force-host-cpp-to-detect-reallocarray.patch | 37 ----------------------
 .../0003-aa_status-Fix-build-issue-with-musl.patch | 33 -------------------
 package/libapparmor/libapparmor.hash               |  2 +-
 package/libapparmor/libapparmor.mk                 |  4 +--
 8 files changed, 6 insertions(+), 112 deletions(-)

diff --git a/package/apparmor/3.0.0 b/package/apparmor/3.0.0
deleted file mode 120000
index eb1e43a572..0000000000
--- a/package/apparmor/3.0.0
+++ /dev/null
@@ -1 +0,0 @@
-../libapparmor/3.0.0/
\ No newline at end of file
diff --git a/package/apparmor/apparmor.hash b/package/apparmor/apparmor.hash
index 394bfb81a8..ddbe87c569 100644
--- a/package/apparmor/apparmor.hash
+++ b/package/apparmor/apparmor.hash
@@ -1,5 +1,5 @@
 # From: https://gitlab.com/apparmor/apparmor/-/wikis/home#userspace
-sha256  66fd751fe51eb427d2aa864ee035b12d01d212fd595579275219b0148c43755e  apparmor-3.0.0.tar.gz
+sha256  8fada772d9a60989525594346d9aa22af938daafc1781adce9a1acb3c75bdf24  apparmor-3.0.1.tar.gz
 
 # locally computed
 sha256  a7e0cdcbea5c14927cedfc600d46526bdcbb1eb0a4d951e2ea53c2a6de159cb4  LICENSE
diff --git a/package/apparmor/apparmor.mk b/package/apparmor/apparmor.mk
index 7819d0b7af..6c23e1bb89 100644
--- a/package/apparmor/apparmor.mk
+++ b/package/apparmor/apparmor.mk
@@ -6,8 +6,8 @@
 
 # When updating the version here, please also update the libapparmor package
 APPARMOR_VERSION_MAJOR = 3.0
-APPARMOR_VERSION = $(APPARMOR_VERSION_MAJOR).0
-APPARMOR_SITE = https://launchpad.net/apparmor/$(APPARMOR_VERSION_MAJOR)/$(APPARMOR_VERSION_MAJOR)/+download
+APPARMOR_VERSION = $(APPARMOR_VERSION_MAJOR).1
+APPARMOR_SITE = https://launchpad.net/apparmor/$(APPARMOR_VERSION_MAJOR)/$(APPARMOR_VERSION)/+download
 APPARMOR_DL_SUBDIR = libapparmor
 APPARMOR_LICENSE = GPL-2.0
 APPARMOR_LICENSE_FILES = LICENSE parser/COPYING.GPL
diff --git a/package/libapparmor/3.0.0/0001-libapparmor-add-missing-include-for-socklen_t.patch b/package/libapparmor/3.0.0/0001-libapparmor-add-missing-include-for-socklen_t.patch
deleted file mode 100644
index 2d5114337e..0000000000
--- a/package/libapparmor/3.0.0/0001-libapparmor-add-missing-include-for-socklen_t.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 47263a3a74d7973e7a54b17db6aa903701468ffd Mon Sep 17 00:00:00 2001
-From: Patrick Steinhardt <ps@pks.im>
-Date: Sat, 3 Oct 2020 20:37:55 +0200
-Subject: [PATCH] libapparmor: add missing include for `socklen_t`
-
-While `include/sys/apparmor.h` makes use of `socklen_t`, it doesn't
-include the `<sys/socket.h>` header to make its declaration available.
-While this works on systems using glibc via transitive includes, it
-breaks compilation on musl libc.
-
-Fix the issue by including the header.
-
-Signed-off-by: Patrick Steinhardt <ps@pks.im>
-[Retrieved from:
-https://gitlab.com/apparmor/apparmor/-/commit/47263a3a74d7973e7a54b17db6aa903701468ffd]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- libraries/libapparmor/include/sys/apparmor.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/libraries/libapparmor/include/sys/apparmor.h b/libraries/libapparmor/include/sys/apparmor.h
-index 32892d065..d70eff947 100644
---- a/libraries/libapparmor/include/sys/apparmor.h
-+++ b/libraries/libapparmor/include/sys/apparmor.h
-@@ -21,6 +21,7 @@
- #include <stdbool.h>
- #include <stdint.h>
- #include <unistd.h>
-+#include <sys/socket.h>
- #include <sys/types.h>
- 
- #ifdef __cplusplus
--- 
-GitLab
-
diff --git a/package/libapparmor/3.0.0/0002-parser-Makefile-dont-force-host-cpp-to-detect-reallocarray.patch b/package/libapparmor/3.0.0/0002-parser-Makefile-dont-force-host-cpp-to-detect-reallocarray.patch
deleted file mode 100644
index 0510489d55..0000000000
--- a/package/libapparmor/3.0.0/0002-parser-Makefile-dont-force-host-cpp-to-detect-reallocarray.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 0dbcbee70097ecde66708064ec1dedfa64e581e8 Mon Sep 17 00:00:00 2001
-From: Armin Kuster <akuster@mvista.com>
-Date: Wed, 7 Oct 2020 20:50:38 -0700
-Subject: [PATCH] parser/Makefile: dont force host cpp to detect reallocarray
-
-In cross build environments, using the hosts cpp gives incorrect
-detection of reallocarray. Change cpp to a variable.
-
-fixes:
-parser_misc.c: In function 'int capable_add_cap(const char*, int, unsigned int, capability_flags)':
-| parser_misc.c:297:37: error: 'reallocarray' was not declared in this scope
-|   297 |   tmp = (struct capability_table *) reallocarray(cap_table, sizeof(struct capability_table), cap_table_size+1);
-
-Signed-off-by: Armin Kuster <akuster808@gmail.com>
-[Retrieved from:
-https://gitlab.com/ffontaine/apparmor/-/commit/0dbcbee70097ecde66708064ec1dedfa64e581e8]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- parser/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/parser/Makefile b/parser/Makefile
-index acef3d77a..8250ac451 100644
---- a/parser/Makefile
-+++ b/parser/Makefile
-@@ -54,7 +54,7 @@ endif
- CPPFLAGS += -D_GNU_SOURCE
- 
- STDLIB_INCLUDE:="\#include <stdlib.h>"
--HAVE_REALLOCARRAY:=$(shell echo $(STDLIB_INCLUDE) | cpp ${CPPFLAGS} | grep -q reallocarray && echo true)
-+HAVE_REALLOCARRAY:=$(shell echo $(STDLIB_INCLUDE) | ${CPP} ${CPPFLAGS} | grep -q reallocarray && echo true)
- 
- WARNINGS = -Wall
- CXX_WARNINGS = ${WARNINGS} ${EXTRA_WARNINGS}
--- 
-GitLab
-
diff --git a/package/libapparmor/3.0.0/0003-aa_status-Fix-build-issue-with-musl.patch b/package/libapparmor/3.0.0/0003-aa_status-Fix-build-issue-with-musl.patch
deleted file mode 100644
index 83981bfecc..0000000000
--- a/package/libapparmor/3.0.0/0003-aa_status-Fix-build-issue-with-musl.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From a2a0d14b9c5046b76124c828a53b0e9cbc1bc5c8 Mon Sep 17 00:00:00 2001
-From: Armin Kuster <akuster808@gmail.com>
-Date: Wed, 7 Oct 2020 08:27:11 -0700
-Subject: [PATCH] aa_status: Fix build issue with musl
-
-add limits.h
-
-aa_status.c:269:22: error: 'PATH_MAX' undeclared (first use in this function); did you mean 'AF_MAX'?
-|   269 |    real_exe = calloc(PATH_MAX + 1, sizeof(char));
-
-Signed-off-by: Armin Kuster <akuster808@gmail.com>
-[Retrieved from:
-https://gitlab.com/apparmor/apparmor/-/commit/a2a0d14b9c5046b76124c828a53b0e9cbc1bc5c8]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- binutils/aa_status.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/binutils/aa_status.c b/binutils/aa_status.c
-index 78b034090..41f1954e9 100644
---- a/binutils/aa_status.c
-+++ b/binutils/aa_status.c
-@@ -10,6 +10,7 @@
- #include <stdio.h>
- #include <stdlib.h>
- #include <string.h>
-+#include <limits.h>
- #include <sys/types.h>
- #include <sys/stat.h>
- #include <sys/wait.h>
--- 
-GitLab
-
diff --git a/package/libapparmor/libapparmor.hash b/package/libapparmor/libapparmor.hash
index 0550a18466..37e1ff5228 100644
--- a/package/libapparmor/libapparmor.hash
+++ b/package/libapparmor/libapparmor.hash
@@ -1,5 +1,5 @@
 # From: https://gitlab.com/apparmor/apparmor/-/wikis/home#userspace
-sha256  66fd751fe51eb427d2aa864ee035b12d01d212fd595579275219b0148c43755e  apparmor-3.0.0.tar.gz
+sha256  8fada772d9a60989525594346d9aa22af938daafc1781adce9a1acb3c75bdf24  apparmor-3.0.1.tar.gz
 
 # locally computed
 sha256  a7e0cdcbea5c14927cedfc600d46526bdcbb1eb0a4d951e2ea53c2a6de159cb4  LICENSE
diff --git a/package/libapparmor/libapparmor.mk b/package/libapparmor/libapparmor.mk
index 5ece89b08a..255432e455 100644
--- a/package/libapparmor/libapparmor.mk
+++ b/package/libapparmor/libapparmor.mk
@@ -6,9 +6,9 @@
 
 # When updating the version here, please also update the apparmor package
 LIBAPPARMOR_VERSION_MAJOR = 3.0
-LIBAPPARMOR_VERSION = $(LIBAPPARMOR_VERSION_MAJOR).0
+LIBAPPARMOR_VERSION = $(LIBAPPARMOR_VERSION_MAJOR).1
 LIBAPPARMOR_SOURCE = apparmor-$(LIBAPPARMOR_VERSION).tar.gz
-LIBAPPARMOR_SITE = https://launchpad.net/apparmor/$(LIBAPPARMOR_VERSION_MAJOR)/$(LIBAPPARMOR_VERSION_MAJOR)/+download
+LIBAPPARMOR_SITE = https://launchpad.net/apparmor/$(LIBAPPARMOR_VERSION_MAJOR)/$(LIBAPPARMOR_VERSION)/+download
 LIBAPPARMOR_LICENSE = LGPL-2.1
 LIBAPPARMOR_LICENSE_FILES = LICENSE libraries/libapparmor/COPYING.LGPL
 

From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Aug 2019 14:28:16 +0200
Subject: [Buildroot] [git commit] package/faketime: bump to version 0.9.8
Message-ID: <20190903133622.9A2B681413@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=14044441f05e2fff0439dab9e4af0b45e4ad086f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Remove first patch (already in version)
- Remove second patch (not needed since merge of
  https://github.com/wolfcw/libfaketime/pull/161)
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...isable-the-non-null-compare-warning-error.patch | 32 ----------------------
 .../0002-src-Makefile-disable-Werror.patch         | 32 ----------------------
 package/faketime/faketime.hash                     |  3 +-
 package/faketime/faketime.mk                       |  2 +-
 4 files changed, 3 insertions(+), 66 deletions(-)

diff --git a/package/faketime/0001-Disable-the-non-null-compare-warning-error.patch b/package/faketime/0001-Disable-the-non-null-compare-warning-error.patch
deleted file mode 100644
index f8c7484452..0000000000
--- a/package/faketime/0001-Disable-the-non-null-compare-warning-error.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From e85a157b51b1276c91c736d8624d9f3e876e9189 Mon Sep 17 00:00:00 2001
-From: Andreas Rammhold <andreas@rammhold.de>
-Date: Tue, 20 Dec 2016 19:25:32 +0100
-Subject: [PATCH] Disable the non-null compare warning/error.
-
-We rely on the provided local library definitions for the hooked
-functions which in some cases (GCC >6) carry a non-null-attribute flag
-which causes compile errors on `!= NULL` checks.
-
-[Romain: rebase on 0.9.6]
-(cherry picked from commit 47e958b753fc15098a2b7d0e9ef26b83ee255874)
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- src/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/Makefile b/src/Makefile
-index 51634b0..bbbd476 100644
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -67,7 +67,7 @@ INSTALL ?= install
- PREFIX ?= /usr/local
- LIBDIRNAME ?= /lib/faketime
- 
--CFLAGS += -std=gnu99 -Wall -Wextra -Werror -DFAKE_STAT -DFAKE_SLEEP -DFAKE_TIMERS -DFAKE_INTERNAL_CALLS -fPIC -DPREFIX='"'$(PREFIX)'"' -DLIBDIRNAME='"'$(LIBDIRNAME)'"'
-+CFLAGS += -std=gnu99 -Wall -Wextra -Werror -Wno-nonnull-compare -DFAKE_STAT -DFAKE_SLEEP -DFAKE_TIMERS -DFAKE_INTERNAL_CALLS -fPIC -DPREFIX='"'$(PREFIX)'"' -DLIBDIRNAME='"'$(LIBDIRNAME)'"'
- LIB_LDFLAGS += -shared
- LDFLAGS += -Wl,--version-script=libfaketime.map -lpthread
- LDADD += -ldl -lm -lrt
--- 
-2.9.3
-
diff --git a/package/faketime/0002-src-Makefile-disable-Werror.patch b/package/faketime/0002-src-Makefile-disable-Werror.patch
deleted file mode 100644
index e1e3b321b8..0000000000
--- a/package/faketime/0002-src-Makefile-disable-Werror.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From bcde6e6f34c3cf78a254315c5caa530db91802fb Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Thu, 17 May 2018 23:41:03 +0200
-Subject: [PATCH] src/Makefile: disable -Werror
-
-gcc 8.x has enabled additional warnings that break the build due to
--Werror, so let's drop -Werror for now. A set of patches has been
-submitted upstream (https://github.com/wolfcw/libfaketime/pull/161) to
-properly fix the gcc 8.x issues, but in the mean time, disabling
--Werror is a simpler option.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- src/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/Makefile b/src/Makefile
-index bbbd476..6b0d2cd 100644
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -67,7 +67,7 @@ INSTALL ?= install
- PREFIX ?= /usr/local
- LIBDIRNAME ?= /lib/faketime
- 
--CFLAGS += -std=gnu99 -Wall -Wextra -Werror -Wno-nonnull-compare -DFAKE_STAT -DFAKE_SLEEP -DFAKE_TIMERS -DFAKE_INTERNAL_CALLS -fPIC -DPREFIX='"'$(PREFIX)'"' -DLIBDIRNAME='"'$(LIBDIRNAME)'"'
-+CFLAGS += -std=gnu99 -Wall -Wextra -Wno-nonnull-compare -DFAKE_STAT -DFAKE_SLEEP -DFAKE_TIMERS -DFAKE_INTERNAL_CALLS -fPIC -DPREFIX='"'$(PREFIX)'"' -DLIBDIRNAME='"'$(LIBDIRNAME)'"'
- LIB_LDFLAGS += -shared
- LDFLAGS += -Wl,--version-script=libfaketime.map -lpthread
- LDADD += -ldl -lm -lrt
--- 
-2.14.3
-
diff --git a/package/faketime/faketime.hash b/package/faketime/faketime.hash
index 5203fdb12a..bdb003aa69 100644
--- a/package/faketime/faketime.hash
+++ b/package/faketime/faketime.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 56bc32006f4c5b021ff648cc1fd458c5316f40aadfd2031879229a234189b031 faketime-0.9.6.tar.gz
+sha256 06288237cd5890eca148489e5b904ed852ed0ffa8424bfb479342f4daa8442a3 faketime-0.9.8.tar.gz
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 COPYING
diff --git a/package/faketime/faketime.mk b/package/faketime/faketime.mk
index 0a72feb866..85ce9a90d8 100644
--- a/package/faketime/faketime.mk
+++ b/package/faketime/faketime.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FAKETIME_VERSION = 0.9.6
+FAKETIME_VERSION = 0.9.8
 FAKETIME_SITE = $(call github,wolfcw,libfaketime,v$(FAKETIME_VERSION))
 FAKETIME_LICENSE = GPL-2.0
 FAKETIME_LICENSE_FILES = COPYING

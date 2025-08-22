Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DF7ECA0FE1
	for <buildroot@archiver.kernel.org>; Fri, 22 Aug 2025 10:33:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D22A60B42;
	Fri, 22 Aug 2025 10:33:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mmw1U8uFDT0o; Fri, 22 Aug 2025 10:33:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD37560B43
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD37560B43;
	Fri, 22 Aug 2025 10:33:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 565261C8
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 10:33:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 47D8660B4E
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 10:33:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0iUZfYvuZlQc for <buildroot@buildroot.org>;
 Fri, 22 Aug 2025 10:33:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 290BB60B34
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 290BB60B34
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 10:33:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 10D658775B; Fri, 22 Aug 2025 10:33:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 22 Aug 2025 12:32:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2c6a292b93855f40544e10b4b364455dfcd68fd9
X-Git-Newrev: 13e778fcf14949a45c64803d5fd5ee8061a518d4
X-Patchwork-Hint: ignore
Message-Id: <20250822103307.10D658775B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lrzsz: fix build with gcc 15
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1458412177446170800=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1458412177446170800==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=13e778fcf14949a45c64803d5fd5ee8061a518d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Import upstream pull request https://github.com/UweOhse/lrzsz/pull/8
to fix GCC 15.x build issues. This pull request also replaces our
patch 0002, which is dropped by this commit.

Fixes:

  https://autobuild.buildroot.net/results/a1a5aad2ccc69aeff586d7a83620f10d51ccfdb6/

Signed-off-by: Frank Chung <uuidxx@163.com>
[Thomas:
- Added two more backports needed to fix the build
- Used the actual patch submitted in the pull request, rendering our
  0002 patch useless
- Defined ac_cv_type_signal as a workaround to a configure script issue]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../lrzsz/0001-configure-fix-main-prototype.patch  |  4 +-
 ...> 0002-include-stdio.h-to-remove-warning.patch} |  4 +-
 .../0002-lib-long-options.c-include-stdlib.h.patch | 40 ----------
 ...patch => 0003-FTBFS-fix-missing-includes.patch} |  6 +-
 package/lrzsz/0004-Fix-build-with-GCC-15.patch     | 93 ++++++++++++++++++++++
 package/lrzsz/0005-remove-old-prototypes.patch     | 38 +++++++++
 package/lrzsz/0006-remove-old-prototypes.patch     | 31 ++++++++
 package/lrzsz/lrzsz.mk                             |  4 +-
 8 files changed, 172 insertions(+), 48 deletions(-)

diff --git a/package/lrzsz/0001-configure-fix-main-prototype.patch b/package/lrzsz/0001-configure-fix-main-prototype.patch
index dfe4385a1c..f5752814a5 100644
--- a/package/lrzsz/0001-configure-fix-main-prototype.patch
+++ b/package/lrzsz/0001-configure-fix-main-prototype.patch
@@ -1,4 +1,4 @@
-From c2758812867a52a6bb56b87d52c35ebff797e777 Mon Sep 17 00:00:00 2001
+From 4c264d704357220b91a070862e0490c641b3f560 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Date: Sun, 15 Sep 2024 15:12:07 +0200
 Subject: [PATCH] configure: fix main() prototype
@@ -30,5 +30,5 @@ index cc586d5..16a259a 100755
  if { (eval echo configure:1059: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
    ac_cv_prog_cc_works=yes
 -- 
-2.45.2
+2.50.1
 
diff --git a/package/lrzsz/0003-include-stdio.h-to-remove-warning.patch b/package/lrzsz/0002-include-stdio.h-to-remove-warning.patch
similarity index 89%
rename from package/lrzsz/0003-include-stdio.h-to-remove-warning.patch
rename to package/lrzsz/0002-include-stdio.h-to-remove-warning.patch
index e4a958cdfa..12d9a0ae5f 100644
--- a/package/lrzsz/0003-include-stdio.h-to-remove-warning.patch
+++ b/package/lrzsz/0002-include-stdio.h-to-remove-warning.patch
@@ -1,4 +1,4 @@
-From e164c9cd3207321e162f054357fcd37b06cb0b8a Mon Sep 17 00:00:00 2001
+From bbbaccd80c69a705f27e9236808d42088cf1f1cb Mon Sep 17 00:00:00 2001
 From: Uwe Ohse <uwe@ohse.de>
 Date: Mon, 2 Mar 2020 22:38:16 +0000
 Subject: [PATCH] include stdio.h to remove warning
@@ -22,5 +22,5 @@ index 6baf4a2..d21ab35 100644
  
  #if __STDC__
 -- 
-2.46.0
+2.50.1
 
diff --git a/package/lrzsz/0002-lib-long-options.c-include-stdlib.h.patch b/package/lrzsz/0002-lib-long-options.c-include-stdlib.h.patch
deleted file mode 100644
index f0532bd036..0000000000
--- a/package/lrzsz/0002-lib-long-options.c-include-stdlib.h.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From aa6779c2846f13bf58575486b374ef06b2844fe8 Mon Sep 17 00:00:00 2001
-From: Yegor Yefremov <yegorslists@googlemail.com>
-Date: Tue, 21 May 2024 11:13:17 +0200
-Subject: [PATCH] lib/long-options.c: include stdlib.h
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Fixes the following error (compiled with GCC 14.x):
-
-long-options.c:70:11: error: implicit declaration of function ‘exit’
-[-Wimplicit-function-declaration]
-   70 |           exit (0);
-      |           ^~~~
-
-Upstream: https://github.com/UweOhse/lrzsz/pull/4
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-[Fiona: remove conditional on __GNU_LIBRARY__ to fix build with musl]
-Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
----
- lib/long-options.c | 9 +++++++++
- 1 file changed, 9 insertions(+)
-
-diff --git a/lib/long-options.c b/lib/long-options.c
-index 76b9796..19c84e0 100644
---- a/lib/long-options.c
-+++ b/lib/long-options.c
-@@ -22,6 +22,9 @@
- #endif
- 
- #include <stdio.h>
-+
-+#include <stdlib.h>
-+
- #include <getopt.h>
- #include "long-options.h"
- 
--- 
-2.46.0
-
diff --git a/package/lrzsz/0004-FTBFS-fix-missing-includes.patch b/package/lrzsz/0003-FTBFS-fix-missing-includes.patch
similarity index 94%
rename from package/lrzsz/0004-FTBFS-fix-missing-includes.patch
rename to package/lrzsz/0003-FTBFS-fix-missing-includes.patch
index 51b5f09c26..19c60bd022 100644
--- a/package/lrzsz/0004-FTBFS-fix-missing-includes.patch
+++ b/package/lrzsz/0003-FTBFS-fix-missing-includes.patch
@@ -1,9 +1,9 @@
-From a9faaf7f02811e7409074362700e963609885ba6 Mon Sep 17 00:00:00 2001
+From b526a62d5992d838ee34fb992defdeb8ee0ed594 Mon Sep 17 00:00:00 2001
 From: Wolfram Sang <wsa+renesas@sang-engineering.com>
 Date: Fri, 29 Nov 2024 14:14:25 +0100
 Subject: [PATCH] FTBFS fix missing includes
 
-From: https://sources.debian.org/data/main/l/lrzsz/0.12.21rc-0.1/debian/patches/include.diff
+Taken from: https://sources.debian.org/data/main/l/lrzsz/0.12.21rc-0.1/debian/patches/include.diff
 
 Description: Fixes FTBFS (missing includes)
 Author: Martin A. Godisch <godisch@debian.org>
@@ -120,5 +120,5 @@ index dd9736b..7bc3736 100644
  #include <ctype.h>
  #include <errno.h>
 -- 
-2.45.2
+2.50.1
 
diff --git a/package/lrzsz/0004-Fix-build-with-GCC-15.patch b/package/lrzsz/0004-Fix-build-with-GCC-15.patch
new file mode 100644
index 0000000000..53c7c5ab02
--- /dev/null
+++ b/package/lrzsz/0004-Fix-build-with-GCC-15.patch
@@ -0,0 +1,93 @@
+From 01a8cdf3f8e64b80ff219c250c899605c50312f5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 22 Mar 2025 23:06:54 -0700
+Subject: [PATCH] Fix build with GCC 15
+
+This is collection of changes needed to get compiling with gcc-15
+which switched to use C23 as default std.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream: https://github.com/UweOhse/lrzsz/pull/8
+Signed-off-by: Frank Chung <uuidxx@163.com>
+---
+ lib/error.c        | 2 +-
+ lib/getopt.h       | 2 +-
+ lib/long-options.c | 3 ++-
+ lib/long-options.h | 2 +-
+ lib/xstrtol.c      | 2 --
+ 5 files changed, 5 insertions(+), 6 deletions(-)
+
+diff --git a/lib/error.c b/lib/error.c
+index 3861578..2a2f1ff 100644
+--- a/lib/error.c
++++ b/lib/error.c
+@@ -74,7 +74,7 @@ extern char *program_name;
+ 
+ # if HAVE_STRERROR
+ #  ifndef strerror		/* On some systems, strerror is a macro */
+-char *strerror ();
++char *strerror (int);
+ #  endif
+ # else
+ static char *
+diff --git a/lib/getopt.h b/lib/getopt.h
+index 4ac33b7..46971cb 100644
+--- a/lib/getopt.h
++++ b/lib/getopt.h
+@@ -101,7 +101,7 @@ struct option
+    errors, only prototype getopt for the GNU C library.  */
+ extern int getopt (int argc, char *const *argv, const char *shortopts);
+ #else /* not __GNU_LIBRARY__ */
+-extern int getopt ();
++extern int getopt (int, char * const [], const char *);
+ #endif /* __GNU_LIBRARY__ */
+ extern int getopt_long (int argc, char *const *argv, const char *shortopts,
+ 		        const struct option *longopts, int *longind);
+diff --git a/lib/long-options.c b/lib/long-options.c
+index fe069fd..4db5cea 100644
+--- a/lib/long-options.c
++++ b/lib/long-options.c
+@@ -22,6 +22,7 @@
+ #endif
+ 
+ #include <stdio.h>
++#include <stdlib.h>
+ #include <getopt.h>
+ #include "long-options.h"
+ 
+@@ -43,7 +44,7 @@ parse_long_options (argc, argv,version, usage)
+      int argc;
+      char **argv;
+      void (*version)();
+-     void (*usage)();
++     void (*usage)(int);
+ #endif
+ {
+   int c;
+diff --git a/lib/long-options.h b/lib/long-options.h
+index 14459cd..3fb8fa6 100644
+--- a/lib/long-options.h
++++ b/lib/long-options.h
+@@ -6,5 +6,5 @@
+ #endif
+ 
+ void parse_long_options __P ((int _argc, char **_argv, 
+-							  void (*_version) (void), 
++							  void (*_version) (), 
+ 							  void (*_usage) (int)));
+diff --git a/lib/xstrtol.c b/lib/xstrtol.c
+index d7b4b56..7d0737d 100644
+--- a/lib/xstrtol.c
++++ b/lib/xstrtol.c
+@@ -65,8 +65,6 @@ extern int errno;
+ 	}								\
+       while (0)
+ 
+-__unsigned long int __strtol ();
+-
+ /* FIXME: comment.  */
+ 
+ strtol_error
+-- 
+2.50.1
+
diff --git a/package/lrzsz/0005-remove-old-prototypes.patch b/package/lrzsz/0005-remove-old-prototypes.patch
new file mode 100644
index 0000000000..8b93ba1f1c
--- /dev/null
+++ b/package/lrzsz/0005-remove-old-prototypes.patch
@@ -0,0 +1,38 @@
+From 8d91782ae404c59f42029b3af394fbccb2d43856 Mon Sep 17 00:00:00 2001
+From: Uwe Ohse <uwe@ohse.de>
+Date: Mon, 2 Mar 2020 21:24:45 +0000
+Subject: [PATCH] remove old prototypes
+
+Upstream: 34f9527076276aace5fc2e31388e09aaaf1773eb
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/lrz.c | 6 +-----
+ 1 file changed, 1 insertion(+), 5 deletions(-)
+
+diff --git a/src/lrz.c b/src/lrz.c
+index 63e1326..a31e82d 100644
+--- a/src/lrz.c
++++ b/src/lrz.c
+@@ -32,6 +32,7 @@
+ #include <ctype.h>
+ #include <errno.h>
+ #include <getopt.h>
++#include <time.h>
+ 
+ #ifdef HAVE_UTIME_H
+ #include <utime.h>
+@@ -42,11 +43,6 @@
+ #include "xstrtoul.h"
+ #include "error.h"
+ 
+-#ifndef STRICT_PROTOTYPES
+-extern time_t time();
+-extern char *strerror();
+-extern char *strstr();
+-#endif
+ 
+ #ifndef HAVE_ERRNO_DECLARATION
+ extern int errno;
+-- 
+2.50.1
+
diff --git a/package/lrzsz/0006-remove-old-prototypes.patch b/package/lrzsz/0006-remove-old-prototypes.patch
new file mode 100644
index 0000000000..fd947c63cd
--- /dev/null
+++ b/package/lrzsz/0006-remove-old-prototypes.patch
@@ -0,0 +1,31 @@
+From 755da0781a2b20674f183cbf8cddf28ac56f7bad Mon Sep 17 00:00:00 2001
+From: Uwe Ohse <uwe@ohse.de>
+Date: Mon, 2 Mar 2020 21:26:21 +0000
+Subject: [PATCH] remove old prototypes
+
+Upstream: 7cdaef47634d2d8944a4192bb87c6e57dd24c41f
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/lsz.c | 6 ------
+ 1 file changed, 6 deletions(-)
+
+diff --git a/src/lsz.c b/src/lsz.c
+index 1598150..b8041b2 100644
+--- a/src/lsz.c
++++ b/src/lsz.c
+@@ -51,12 +51,6 @@ void *mm_addr=NULL;
+ #include "xstrtoul.h"
+ #include "error.h"
+ 
+-#ifndef STRICT_PROTOTYPES
+-extern time_t time();
+-extern char *strerror();
+-extern char *strstr();
+-#endif
+-
+ #ifndef HAVE_ERRNO_DECLARATION
+ extern int errno;
+ #endif
+-- 
+2.50.1
+
diff --git a/package/lrzsz/lrzsz.mk b/package/lrzsz/lrzsz.mk
index 12d52b8ebd..c0bb13fdda 100644
--- a/package/lrzsz/lrzsz.mk
+++ b/package/lrzsz/lrzsz.mk
@@ -11,7 +11,9 @@ LRZSZ_LICENSE = GPL-2.0+
 LRZSZ_LICENSE_FILES = COPYING
 LRZSZ_CPE_ID_VALID = YES
 LRZSZ_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
-LRZSZ_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
+LRZSZ_CONF_ENV = \
+	ac_cv_type_signal=void \
+	LIBS=$(TARGET_NLS_LIBS)
 
 define LRZSZ_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/src/lrz $(TARGET_DIR)/usr/bin/rz

--===============1458412177446170800==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1458412177446170800==--

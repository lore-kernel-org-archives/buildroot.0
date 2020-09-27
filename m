From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 27 Sep 2020 14:54:58 +0200
Subject: [Buildroot] [PATCH 1/2] Revert "support/gnuconfig: bump version"
Message-ID: <20200927125459.1872474-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit a2830f0dad7acbc91e742a7135eb3861600d9770 which was
wrong due to uncommited local changes.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 support/gnuconfig/README.buildroot |  2 +-
 support/gnuconfig/config.guess     | 14 ++++++++------
 support/gnuconfig/config.sub       |  4 +---
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/support/gnuconfig/README.buildroot b/support/gnuconfig/README.buildroot
index 952eea8b10..979edf32d9 100644
--- a/support/gnuconfig/README.buildroot
+++ b/support/gnuconfig/README.buildroot
@@ -18,4 +18,4 @@ Run the script 'update' in this directory, and commit the result.
 The current Buildroot version is based on this commit of the config.git
 repository (leave alone on its own line, the script updates it):
 
-d7a4dee7cc25e332b990d0a6d9f0ddd42cb33cf5
+e072cc210e5d0584396f6c13ba34cb9c7bd8538d
diff --git a/support/gnuconfig/config.guess b/support/gnuconfig/config.guess
index 8d70ec2b26..9aff91cfd0 100755
--- a/support/gnuconfig/config.guess
+++ b/support/gnuconfig/config.guess
@@ -2,7 +2,7 @@
 # Attempt to guess a canonical system name.
 #   Copyright 1992-2020 Free Software Foundation, Inc.
 
-timestamp='2020-09-19'
+timestamp='2020-08-17'
 
 # This file is free software; you can redistribute it and/or modify it
 # under the terms of the GNU General Public License as published by
@@ -150,15 +150,17 @@ Linux|GNU|GNU/*)
 	#elif defined(__dietlibc__)
 	LIBC=dietlibc
 	#else
-	#include <stdarg.h>
-	#ifdef __DEFINED_va_list
-	LIBC=musl
-	#else
 	LIBC=gnu
 	#endif
-	#endif
 	EOF
 	eval "`$CC_FOR_BUILD -E "$dummy.c" 2>/dev/null | grep '^LIBC' | sed 's, ,,g'`"
+
+	# If ldd exists, use it to detect musl libc.
+	if command -v ldd >/dev/null && \
+		ldd --version 2>&1 | grep -q ^musl
+	then
+	    LIBC=musl
+	fi
 	;;
 esac
 
diff --git a/support/gnuconfig/config.sub b/support/gnuconfig/config.sub
index 2df66beeb0..780c2bbaa0 100755
--- a/support/gnuconfig/config.sub
+++ b/support/gnuconfig/config.sub
@@ -1733,9 +1733,7 @@ esac
 # As a final step for OS-related things, validate the OS-kernel combination
 # (given a valid OS), if there is a kernel.
 case $kernel-$os in
-	linux-gnu* | linux-dietlibc* | linux-android* | linux-newlib* | linux-musl* | linux-uclibc* | uclinux-gnu* |?uclinux-uclibc* )
-		;;
-	uclinux-uclibc* )
+	linux-gnu* | linux-dietlibc* | linux-android* | linux-newlib* | linux-musl* | linux-uclibc* )
 		;;
 	-dietlibc* | -newlib* | -musl* | -uclibc* )
 		# These are just libc implementations, not actual OSes, and thus
-- 
2.28.0

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 23:44:04 +0100
Subject: [Buildroot] [git commit] uclibc: Fix getopt implementations
	conditional compilation
Message-ID: <20150320224445.CC9CA81885@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1919d3c287fda2eab4373c5b4ef26f0ea3dc4f8a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There's no way to disable getsubopt in uClibc 0.9.33.2: either GNU or
SUSv3 getsubopt is always built.

Properly exclude SUSv3 getsubopt implementation when GNU getopt is
selected.
Exclude GNU getsubopt when SUSv3 getopt is selected. Honor getopt_long
configuration.

This brings UCLIBC_HAS_GNU_GETOPT, UCLIBC_HAS_GNU_GETSUBOPT and
UCLIBC_HAS_GETOPT_LONG handling in sync with uClibc and uClibc-ng tips.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...t-implementations-conditional-compilation.patch |   58 ++++++++++++++++++++
 1 files changed, 58 insertions(+), 0 deletions(-)

diff --git a/package/uclibc/0.9.33.2/0068-Fix-getopt-implementations-conditional-compilation.patch b/package/uclibc/0.9.33.2/0068-Fix-getopt-implementations-conditional-compilation.patch
new file mode 100644
index 0000000..18f6a9f
--- /dev/null
+++ b/package/uclibc/0.9.33.2/0068-Fix-getopt-implementations-conditional-compilation.patch
@@ -0,0 +1,58 @@
+From 5184289b9f453b1e160fbfd2f0922e5ed586d910 Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Tue, 17 Mar 2015 02:06:52 +0300
+Subject: [PATCH] Fix getopt implementations conditional compilation
+
+Currently there's no way to disable getsubopt: either GNU or SUSv3
+getsubopt is always built.
+
+Properly exclude SUSv3 getsubopt implementation when GNU getopt is
+selected.
+Exclude GNU getsubopt when SUSv3 getopt is selected. Honor getopt_long
+configuration.
+
+This brings UCLIBC_HAS_GNU_GETOPT, UCLIBC_HAS_GNU_GETSUBOPT and
+UCLIBC_HAS_GETOPT_LONG handling in sync with uClibc and uClibc-ng tips.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+ libc/unistd/Makefile.in | 22 +++++++++++-----------
+ 1 file changed, 11 insertions(+), 11 deletions(-)
+
+diff --git a/libc/unistd/Makefile.in b/libc/unistd/Makefile.in
+index 2704177..ec51631 100644
+--- a/libc/unistd/Makefile.in
++++ b/libc/unistd/Makefile.in
+@@ -19,18 +19,18 @@ CSRC := $(filter-out __exec_alloc.c,$(CSRC))
+ endif
+ 
+ ifeq ($(UCLIBC_HAS_GNU_GETOPT),y)
+-CSRC := $(filter-out getopt-susv3.c getopt_long-simple.c,$(CSRC))
++  CSRC := $(filter-out getopt-susv3.c getsubopt-susv3.c getopt_long-simple.c,$(CSRC))
++  ifneq ($(UCLIBC_HAS_GNU_GETSUBOPT),y)
++    CSRC := $(filter-out getsubopt.c,$(CSRC))
++  endif
+ else
+-CSRC := $(filter-out getopt.c,$(CSRC))
+-ifneq ($(UCLIBC_HAS_GETOPT_LONG),y)
+-CSRC := $(filter-out getopt_long-simple.c,$(CSRC))
+-endif
+-endif
+-
+-ifeq ($(UCLIBC_HAS_GNU_GETSUBOPT),y)
+-CSRC := $(filter-out getsubopt-susv3.c,$(CSRC))
+-else
+-CSRC := $(filter-out getsubopt.c,$(CSRC))
++  CSRC := $(filter-out getopt.c getsubopt.c,$(CSRC))
++  ifneq ($(UCLIBC_HAS_GETOPT_LONG),y)
++    CSRC := $(filter-out getopt_long-simple.c,$(CSRC))
++  endif
++  ifneq ($(UCLIBC_HAS_GNU_GETSUBOPT),y)
++    CSRC := $(filter-out getsubopt-susv3.c,$(CSRC))
++  endif
+ endif
+ 
+ ifneq ($(UCLIBC_SUSV3_LEGACY),y)
+-- 
+1.8.1.4
+

From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue,  9 Jan 2018 22:15:34 -0600
Subject: [Buildroot] [PATCH v3 3/8] valgrind: correct linker flag seq
In-Reply-To: <1515557739-6027-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1515557739-6027-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1515557739-6027-3-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch will correct the sequence of -pie and -shared options.
When used together, -pie should be provided to the linker before
-shared.

Upstream: https://sourceforge.net/p/valgrind/mailman/message/36114834/

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 ...ind-patch-to-correct-linker-flag-sequence.patch | 160 +++++++++++++++++++++
 1 file changed, 160 insertions(+)
 create mode 100644 package/valgrind/0005-valgrind-patch-to-correct-linker-flag-sequence.patch

diff --git a/package/valgrind/0005-valgrind-patch-to-correct-linker-flag-sequence.patch b/package/valgrind/0005-valgrind-patch-to-correct-linker-flag-sequence.patch
new file mode 100644
index 0000000..34da655
--- /dev/null
+++ b/package/valgrind/0005-valgrind-patch-to-correct-linker-flag-sequence.patch
@@ -0,0 +1,160 @@
+From b845cb1d2e0f0d91dae056237e00cba2e6f8377d Mon Sep 17 00:00:00 2001
+From: Yogesh Prasad <yogesh.prasad@rockwellcollins.com>
+Date: Wed, 11 Oct 2017 09:14:10 -0500
+Subject: [PATCH 1/1] valgrind: patch to correct linker flag sequence
+
+Description
+ This patch will correct the sequence of -pie and -shared options.
+ When used together, -pie should be provided to the linker before
+ -shared. If -pie is provided after -shared, the linker throws an
+ error shown below as example.
+
+-------------------------------------------------------------------------
+/build/valgrind-3.12.0/coregrind/vg_preloaded.c:124:
+ undefined reference to `_restgpr_27_x'
+/host/lib/gcc/powerpc-buildroot-linux-gnu/6.4.0/../../../..
+/powerpc-buildroot-linux-gnu/bin/ld: BFD (GNU Binutils) 2.28.1
+ assertion fail elf32-ppc.c:8923
+collect2: error: ld returned 1 exit status
+make[5]: *** [vgpreload_core-ppc32-linux.so] Error 1
+make[4]: *** [all] Error 2
+make[3]: *** [all-recursive] Error 1
+make[2]: *** [all] Error 2
+make[1]: *** [/build/valgrind-3.12.0/.stamp_built] Error 2
+make: *** [_all] Error 2
+-------------------------------------------------------------------------
+
+Signed-off-by: Yogesh Prasad <yogesh.prasad@rockwellcollins.com>
+---
+ coregrind/Makefile.am   | 6 ++++++
+ drd/Makefile.am         | 6 ++++++
+ exp-dhat/Makefile.am    | 6 ++++++
+ exp-sgcheck/Makefile.am | 6 ++++++
+ helgrind/Makefile.am    | 6 ++++++
+ massif/Makefile.am      | 6 ++++++
+ memcheck/Makefile.am    | 7 ++++++-
+ 7 files changed, 42 insertions(+), 1 deletion(-)
+
+diff --git a/coregrind/Makefile.am b/coregrind/Makefile.am
+index d798015..ce7acad 100644
+--- a/coregrind/Makefile.am
++++ b/coregrind/Makefile.am
+@@ -541,6 +541,12 @@ vgpreload_core_ at VGCONF_ARCH_PRI@_ at VGCONF_OS@_so_CFLAGS = \
+ 	$(AM_CFLAGS_PSO_ at VGCONF_PLATFORM_PRI_CAPS@)
+ vgpreload_core_ at VGCONF_ARCH_PRI@_ at VGCONF_OS@_so_LDFLAGS = \
+ 	$(PRELOAD_LDFLAGS_ at VGCONF_PLATFORM_PRI_CAPS@)
++vgpreload_core_ at VGCONF_ARCH_PRI@_ at VGCONF_OS@_so_LINK = $(CCLD) \
++        $(vgpreload_core_ at VGCONF_ARCH_PRI@_ at VGCONF_OS@_so_CFLAGS) \
++        $(CFLAGS) \
++        $(LDFLAGS) \
++        $(vgpreload_core_ at VGCONF_ARCH_PRI@_ at VGCONF_OS@_so_LDFLAGS) \
++        -o $@
+ if VGCONF_HAVE_PLATFORM_SEC
+ vgpreload_core_ at VGCONF_ARCH_SEC@_ at VGCONF_OS@_so_SOURCES = vg_preloaded.c
+ vgpreload_core_ at VGCONF_ARCH_SEC@_ at VGCONF_OS@_so_CPPFLAGS = \
+diff --git a/drd/Makefile.am b/drd/Makefile.am
+index 9ba4c58..bf32229 100644
+--- a/drd/Makefile.am
++++ b/drd/Makefile.am
+@@ -143,6 +143,12 @@ vgpreload_drd_ at VGCONF_ARCH_PRI@_ at VGCONF_OS@_so_DEPENDENCIES = \
+ vgpreload_drd_ at VGCONF_ARCH_PRI@_ at VGCONF_OS@_so_LDFLAGS      = \
+ 	$(PRELOAD_LDFLAGS_ at VGCONF_PLATFORM_PRI_CAPS@) \
+ 	$(LIBREPLACEMALLOC_LDFLAGS_ at VGCONF_PLATFORM_PRI_CAPS@)
++vgpreload_drd_ at VGCONF_ARCH_PRI@_ at VGCONF_OS@_so_LINK = $(CCLD) \
++        $(vgpreload_drd_ at VGCONF_ARCH_PRI@_ at VGCONF_OS@_so_CFLAGS) \
++        $(CFLAGS) \
++        $(LDFLAGS) \
++        $(vgpreload_drd_ at VGCONF_ARCH_PRI@_ at VGCONF_OS@_so_LDFLAGS) \
++        -o $@
+ 
+ if VGCONF_HAVE_PLATFORM_SEC
+ vgpreload_drd_ at VGCONF_ARCH_SEC@_ at VGCONF_OS@_so_SOURCES      = \
+diff --git a/exp-dhat/Makefile.am b/exp-dhat/Makefile.am
+index 647b72b..29619cf 100644
+--- a/exp-dhat/Makefile.am
++++ b/exp-dhat/Makefile.am
+@@ -84,6 +84,12 @@ vgpreload_exp_dhat_ at VGCONF_ARCH_PRI@_ at VGCONF_OS@_so_DEPENDENCIES = \
+ vgpreload_exp_dhat_ at VGCONF_ARCH_PRI@_ at VGCONF_OS@_so_LDFLAGS      = \
+ 	$(PRELOAD_LDFLAGS_ at VGCONF_PLATFORM_PRI_CAPS@) \
+ 	$(LIBREPLACEMALLOC_LDFLAGS_ at VGCONF_PLATFORM_PRI_CAPS@)
++vgpreload_exp_dhat_ at VGCONF_ARCH_PRI@_ at VGCONF_OS@_so_LINK = $(CCLD) \
++        $(vgpreload_exp_dhat_ at VGCONF_ARCH_PRI@_ at VGCONF_OS@_so_CFLAGS) \
++        $(CFLAGS) \
++        $(LDFLAGS) \
++        $(vgpreload_exp_dhat_ at VGCONF_ARCH_PRI@_ at VGCONF_OS@_so_LDFLAGS) \
++        -o $@
+ 
+ if VGCONF_HAVE_PLATFORM_SEC
+ vgpreload_exp_dhat_ at VGCONF_ARCH_SEC@_ at VGCONF_OS@_so_SOURCES      = 
+diff --git a/exp-sgcheck/Makefile.am b/exp-sgcheck/Makefile.am
+index 211a5ff..ecbe89b 100644
+--- a/exp-sgcheck/Makefile.am
++++ b/exp-sgcheck/Makefile.am
+@@ -92,6 +92,12 @@ vgpreload_exp_sgcheck_ at VGCONF_ARCH_PRI@_ at VGCONF_OS@_so_DEPENDENCIES = \
+ vgpreload_exp_sgcheck_ at VGCONF_ARCH_PRI@_ at VGCONF_OS@_so_LDFLAGS      = \
+ 	$(PRELOAD_LDFLAGS_ at VGCONF_PLATFORM_PRI_CAPS@) \
+ 	$(LIBREPLACEMALLOC_LDFLAGS_ at VGCONF_PLATFORM_PRI_CAPS@)
++vgpreload_exp_sgcheck_ at VGCONF_ARCH_PRI@_ at VGCONF_OS@_so_LINK = $(CCLD) \
++        $(vgpreload_exp_sgcheck_ at VGCONF_ARCH_PRI@_ at VGCONF_OS@_so_CFLAGS) \
++        $(CFLAGS) \
++        $(LDFLAGS) \
++        $(vgpreload_exp_sgcheck_ at VGCONF_ARCH_PRI@_ at VGCONF_OS@_so_LDFLAGS) \
++        -o $@
+ 
+ if VGCONF_HAVE_PLATFORM_SEC
+ vgpreload_exp_sgcheck_ at VGCONF_ARCH_SEC@_ at VGCONF_OS@_so_SOURCES      = \
+diff --git a/helgrind/Makefile.am b/helgrind/Makefile.am
+index b6f1b89..a9b7ef3 100644
+--- a/helgrind/Makefile.am
++++ b/helgrind/Makefile.am
+@@ -103,6 +103,12 @@ vgpreload_helgrind_ at VGCONF_ARCH_PRI@_ at VGCONF_OS@_so_DEPENDENCIES = \
+ vgpreload_helgrind_ at VGCONF_ARCH_PRI@_ at VGCONF_OS@_so_LDFLAGS      = \
+ 	$(PRELOAD_LDFLAGS_ at VGCONF_PLATFORM_PRI_CAPS@) \
+ 	$(LIBREPLACEMALLOC_LDFLAGS_ at VGCONF_PLATFORM_PRI_CAPS@)
++vgpreload_helgrind_ at VGCONF_ARCH_PRI@_ at VGCONF_OS@_so_LINK = $(CCLD) \
++        $(vgpreload_helgrind_ at VGCONF_ARCH_PRI@_ at VGCONF_OS@_so_CFLAGS) \
++        $(CFLAGS) \
++        $(LDFLAGS) \
++        $(vgpreload_helgrind_ at VGCONF_ARCH_PRI@_ at VGCONF_OS@_so_LDFLAGS) \
++        -o $@
+ 
+ if VGCONF_HAVE_PLATFORM_SEC
+ vgpreload_helgrind_ at VGCONF_ARCH_SEC@_ at VGCONF_OS@_so_SOURCES      = \
+diff --git a/massif/Makefile.am b/massif/Makefile.am
+index 2933403..6ccb973 100644
+--- a/massif/Makefile.am
++++ b/massif/Makefile.am
+@@ -84,6 +84,12 @@ vgpreload_massif_ at VGCONF_ARCH_PRI@_ at VGCONF_OS@_so_DEPENDENCIES = \
+ vgpreload_massif_ at VGCONF_ARCH_PRI@_ at VGCONF_OS@_so_LDFLAGS      = \
+ 	$(PRELOAD_LDFLAGS_ at VGCONF_PLATFORM_PRI_CAPS@) \
+ 	$(LIBREPLACEMALLOC_LDFLAGS_ at VGCONF_PLATFORM_PRI_CAPS@)
++vgpreload_massif_ at VGCONF_ARCH_PRI@_ at VGCONF_OS@_so_LINK = $(CCLD) \
++        $(vgpreload_massif_ at VGCONF_ARCH_PRI@_ at VGCONF_OS@_so_CFLAGS) \
++        $(CFLAGS) \
++        $(LDFLAGS) \
++        $(vgpreload_massif_ at VGCONF_ARCH_PRI@_ at VGCONF_OS@_so_LDFLAGS) \
++        -o $@
+ 
+ if VGCONF_HAVE_PLATFORM_SEC
+ vgpreload_massif_ at VGCONF_ARCH_SEC@_ at VGCONF_OS@_so_SOURCES      = 
+diff --git a/memcheck/Makefile.am b/memcheck/Makefile.am
+index 476bc70..ca51c64 100644
+--- a/memcheck/Makefile.am
++++ b/memcheck/Makefile.am
+@@ -100,7 +100,12 @@ vgpreload_memcheck_ at VGCONF_ARCH_PRI@_ at VGCONF_OS@_so_DEPENDENCIES = \
+ vgpreload_memcheck_ at VGCONF_ARCH_PRI@_ at VGCONF_OS@_so_LDFLAGS      = \
+ 	$(PRELOAD_LDFLAGS_ at VGCONF_PLATFORM_PRI_CAPS@) \
+ 	$(LIBREPLACEMALLOC_LDFLAGS_ at VGCONF_PLATFORM_PRI_CAPS@)
+-
++vgpreload_memcheck_ at VGCONF_ARCH_PRI@_ at VGCONF_OS@_so_LINK = $(CCLD) \
++        $(vgpreload_memcheck_ at VGCONF_ARCH_PRI@_ at VGCONF_OS@_so_CFLAGS) \
++        $(CFLAGS) \
++        $(LDFLAGS) \
++        $(vgpreload_memcheck_ at VGCONF_ARCH_PRI@_ at VGCONF_OS@_so_LDFLAGS) \
++        -o $@
+ if VGCONF_HAVE_PLATFORM_SEC
+ vgpreload_memcheck_ at VGCONF_ARCH_SEC@_ at VGCONF_OS@_so_SOURCES      = \
+ 	$(VGPRELOAD_MEMCHECK_SOURCES_COMMON)
+-- 
+1.9.1
+
-- 
1.9.1

From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 23 Jan 2018 22:09:52 -0600
Subject: [Buildroot] [PATCH v4 13/13] libcap: corrected linker flag sequence
In-Reply-To: <1516766992-48428-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1516766992-48428-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1516766992-48428-13-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patches
  0001 - added upstream note as we had to submit it upstream along
         with 0004
  0004 - corrects the sequence of -pie and -shared options. When
         used together, -pie should be provided to the linker before
         -shared.

Upstream: (Emailed to morgan at kernel.org)

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
CC: "Yann E. MORIN" <yann.morin.1998@free.fr>
--
Changes
v3 -> v4
 - New
---
 ...-build-system-fixes-for-cross-compilation.patch |  2 +
 ...cap-patch-to-correct-linker-flag-sequence.patch | 76 ++++++++++++++++++++++
 2 files changed, 78 insertions(+)
 create mode 100644 package/libcap/0004-libcap-patch-to-correct-linker-flag-sequence.patch

diff --git a/package/libcap/0001-build-system-fixes-for-cross-compilation.patch b/package/libcap/0001-build-system-fixes-for-cross-compilation.patch
index de24090..58217b5 100644
--- a/package/libcap/0001-build-system-fixes-for-cross-compilation.patch
+++ b/package/libcap/0001-build-system-fixes-for-cross-compilation.patch
@@ -5,6 +5,8 @@ Subject: [PATCH] build-system: fixes for cross-compilation
 
 Avoid the libcap buildsys forcing CC/CFLAGS/LDFLAGS/AR/RANLIB
 
+Upstream: (Emailed to morgan at kernel.org)
+
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 [yann.morin.1998 at free.fr: dont chmod +x the shared lib]
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
diff --git a/package/libcap/0004-libcap-patch-to-correct-linker-flag-sequence.patch b/package/libcap/0004-libcap-patch-to-correct-linker-flag-sequence.patch
new file mode 100644
index 0000000..173325f
--- /dev/null
+++ b/package/libcap/0004-libcap-patch-to-correct-linker-flag-sequence.patch
@@ -0,0 +1,76 @@
+From 147ad6b4c6b5035061196473c2b3d129fa650392 Mon Sep 17 00:00:00 2001
+From: Yogesh Prasad <yogesh.prasad@rockwellcollins.com>
+Date: Tue, 26 Sep 2017 13:47:05 -0500
+Subject: [PATCH 1/1] libcap: patch to correct linker flag sequence.
+
+Description
+ This patch will correct the sequence of -pie and -shared options.
+ When used together, -pie should be provided to the linker before
+ -shared. If -pie is provided after -shared, the linker throws
+ below error.
+-------------------------------------------------------------------------
+/host/powerpc-buildroot-linux-gnu/sysroot/usr/lib/Scrt1.o:(.data+0x4):
+ undefined reference to `main'
+ /host/lib/gcc/powerpc-buildroot-linux-gnu/6.4.0/../../../../
+ powerpc-buildroot-linux-gnu/bin/ld: BFD (GNU Binutils) 2.28.1
+ assertion fail elf32-ppc.c:8923
+collect2: error: ld returned 1 exit status
+make[2]: *** [libcap.so.2.25] Error 1
+---------------------------------------------------------------------------
+
+Upstream: (Emailed to morgan at kernel.org)
+
+Signed-off-by: Yogesh Prasad <yogesh.prasad@rockwellcollins.com>
+--
+Changes
+v3 -> v4
+ - New
+
+---
+ Make.Rules       | 2 +-
+ libcap/Makefile  | 2 +-
+ pam_cap/Makefile | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/Make.Rules b/Make.Rules
+index 8a07a3f..03b3680 100644
+--- a/Make.Rules
++++ b/Make.Rules
+@@ -59,7 +59,7 @@ WARNINGS=-Wall -Wwrite-strings \
+         -Wpointer-arith -Wcast-qual -Wcast-align \
+         -Wstrict-prototypes -Wmissing-prototypes \
+         -Wnested-externs -Winline -Wshadow
+-LD=$(CC) -Wl,-x -shared
++LDOPTS= -Wl,-x -shared
+ LDFLAGS ?= #-g
+ BUILD_GPERF := $(shell which gperf >/dev/null 2>/dev/null && echo yes)
+ 
+diff --git a/libcap/Makefile b/libcap/Makefile
+index 44ddb27..c80a5e6 100644
+--- a/libcap/Makefile
++++ b/libcap/Makefile
+@@ -52,7 +52,7 @@ $(STALIBNAME): $(OBJS)
+ 	$(RANLIB) $@
+ 
+ $(MINLIBNAME): $(OBJS)
+-	$(LD) $(CFLAGS) $(LDFLAGS) -Wl,-soname,$(MAJLIBNAME) -o $@ $^
++	$(CC) $(CFLAGS) $(LDFLAGS) $(LDOPTS) -Wl,-soname,$(MAJLIBNAME) -o $@ $^
+ 	ln -sf $(MINLIBNAME) $(MAJLIBNAME)
+ 	ln -sf $(MAJLIBNAME) $(LIBNAME)
+ 
+diff --git a/pam_cap/Makefile b/pam_cap/Makefile
+index cc32fb6..6772075 100644
+--- a/pam_cap/Makefile
++++ b/pam_cap/Makefile
+@@ -17,7 +17,7 @@ install: all
+ 	install -m 0755 pam_cap.so $(FAKEROOT)$(LIBDIR)/security
+ 
+ pam_cap.so: pam_cap.o
+-	$(LD) $(LDFLAGS) -o pam_cap.so $< $(LDLIBS)
++	$(CC) $(LDFLAGS) $(LDOPTS) -o pam_cap.so $< $(LDLIBS)
+ 
+ pam_cap.o: pam_cap.c
+ 	$(CC) $(CFLAGS) $(IPATH) -c $< -o $@
+-- 
+1.9.1
+
-- 
1.9.1

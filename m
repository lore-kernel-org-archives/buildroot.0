From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 23 Jan 2018 22:09:51 -0600
Subject: [Buildroot] [PATCH v4 12/13] readline: correct linker flag sequence
In-Reply-To: <1516766992-48428-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1516766992-48428-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1516766992-48428-12-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch will correct the sequence of -pie and -shared options.
When used together, -pie should be provided to the linker before
-shared.

Upstream: https://www.mail-archive.com/bug-readline at gnu.org/msg01114.html

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
--
Changes
v3 -> v4
 - New
---
 ...ine-patch-to-correct-linker-flag-sequence.patch | 58 ++++++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 package/readline/0001-readline-patch-to-correct-linker-flag-sequence.patch

diff --git a/package/readline/0001-readline-patch-to-correct-linker-flag-sequence.patch b/package/readline/0001-readline-patch-to-correct-linker-flag-sequence.patch
new file mode 100644
index 0000000..10383f6
--- /dev/null
+++ b/package/readline/0001-readline-patch-to-correct-linker-flag-sequence.patch
@@ -0,0 +1,58 @@
+From 25713f017b1501c39f474367b93c7948a1efee0d Mon Sep 17 00:00:00 2001
+From: Yogesh Prasad <yogesh.prasad@rockwellcollins.com>
+Date: Thu, 28 Sep 2017 15:37:43 -0500
+Subject: [PATCH 1/1] readline: patch to correct linker flag sequence
+
+Description
+ This patch will correct the sequence of -pie and -shared options.
+ When used together, -pie should be provided to the linker before
+ -shared. If -pie is provided after -shared, the linker throws an
+ error shown below as example.
+
+The patch fixes Makefile.am for below libs within setools:
+ - libhistory.so.7.0
+ - libreadline.so.7.0
+-------------------------------------------------------------------------
+/host/powerpc-buildroot-linux-gnu/sysroot/usr/lib/Scrt1.o:(.data+0x4):
+ undefined reference to `main'
+/host/lib/gcc/powerpc-buildroot-linux-gnu/6.4.0/../../../..
+/powerpc-buildroot-linux-gnu/bin/ld: BFD (GNU Binutils) 2.28.1
+ assertion fail elf32-ppc.c:8923
+collect2: error: ld returned 1 exit status
+make[3]: *** [libhistory.so.7.0] Error 1
+make[3]: *** Waiting for unfinished jobs....
+mv vi_mode.o vi_mode.so
+mv complete.o complete.so
+mv bind.o bind.so
+mv display.o display.so
+make[2]: *** [shared] Error 2
+make[1]: *** [/build/readline-7.0/.stamp_built] Error 2
+make: *** [_all] Error 2
+-------------------------------------------------------------------------
+
+Signed-off-by: Yogesh Prasad <yogesh.prasad@rockwellcollins.com>
+---
+ shlib/Makefile.in | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/shlib/Makefile.in b/shlib/Makefile.in
+index f2ec3e4..7c01859 100644
+--- a/shlib/Makefile.in
++++ b/shlib/Makefile.in
+@@ -174,11 +174,11 @@ unsupported:
+ 
+ $(SHARED_READLINE):	$(SHARED_OBJ)
+ 	$(RM) $@
+-	$(SHOBJ_LD) ${SHOBJ_LDFLAGS} ${SHLIB_XLDFLAGS} -o $@ $(SHARED_OBJ) $(SHLIB_LIBS)
++	$(SHOBJ_LD) ${SHLIB_XLDFLAGS} ${SHOBJ_LDFLAGS} -o $@ $(SHARED_OBJ) $(SHLIB_LIBS)
+ 
+ $(SHARED_HISTORY):	$(SHARED_HISTOBJ) xmalloc.so xfree.so
+ 	$(RM) $@
+-	$(SHOBJ_LD) ${SHOBJ_LDFLAGS} ${SHLIB_XLDFLAGS} -o $@ $(SHARED_HISTOBJ) xmalloc.so xfree.so $(SHLIB_LIBS)
++	$(SHOBJ_LD) ${SHLIB_XLDFLAGS} ${SHOBJ_LDFLAGS} -o $@ $(SHARED_HISTOBJ) xmalloc.so xfree.so $(SHLIB_LIBS)
+ 
+ # Since tilde.c is shared between readline and bash, make sure we compile 
+ # it with the right flags when it's built as part of readline
+-- 
+1.9.1
+
-- 
1.9.1

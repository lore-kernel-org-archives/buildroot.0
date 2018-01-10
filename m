From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue,  9 Jan 2018 22:15:38 -0600
Subject: [Buildroot] [PATCH v3 7/8] libpcap: correct linker flag seq
In-Reply-To: <1515557739-6027-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1515557739-6027-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1515557739-6027-7-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch will correct the sequence of -pie and -shared options.
When used together, -pie should be provided to the linker before
-shared.

Upstream:
https://github.com/the-tcpdump-group/libpcap/commit/800fff521b3a90300d03af880b4626ede13c57bd

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 ...cap-patch-to-correct-linker-flag-sequence.patch | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 package/libpcap/0001-libpcap-patch-to-correct-linker-flag-sequence.patch

diff --git a/package/libpcap/0001-libpcap-patch-to-correct-linker-flag-sequence.patch b/package/libpcap/0001-libpcap-patch-to-correct-linker-flag-sequence.patch
new file mode 100644
index 0000000..5b1c133
--- /dev/null
+++ b/package/libpcap/0001-libpcap-patch-to-correct-linker-flag-sequence.patch
@@ -0,0 +1,52 @@
+From eb4806e2a4f4575889ff8ecf7eb4a473a654ec02 Mon Sep 17 00:00:00 2001
+From: Yogesh Prasad <yogesh.prasad@rockwellcollins.com>
+Date: Tue, 26 Sep 2017 15:03:52 -0500
+Subject: [PATCH 1/1] libpcap: patch to correct linker flag sequence
+
+Description
+ This patch will correct the sequence of -pie and -shared options.
+ When used together, -pie should be provided to the linker before
+ -shared. If -pie is provided after -shared, the linker throws
+ below error.
+-------------------------------------------------------------------------
+/host/powerpc-buildroot-linux-gnu/sysroot/usr/lib/Scrt1.o:(.data+0x4):
+ undefined reference to `main'
+/host/lib/gcc/powerpc-buildroot-linux-gnu/6.4.0/../../../../
+powerpc-buildroot-linux-gnu/bin/ld: BFD (GNU Binutils) 2.28.1 assertion
+fail elf32-ppc.c:8923
+collect2: error: ld returned 1 exit status
+make[2]: *** [libpcap.so] Error 1
+make[1]: *** [/build/libpcap-1.8.1/.stamp_built] Error 2
+make: *** [_all] Error 2
+-------------------------------------------------------------------------
+
+Signed-off-by: Yogesh Prasad <yogesh.prasad@rockwellcollins.com>
+---
+ Makefile.in | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index e71d973..34b1097 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -371,7 +371,7 @@ libpcap.so: $(OBJ)
+ 	@rm -f $@
+ 	VER=`cat $(srcdir)/VERSION`; \
+ 	MAJOR_VER=`sed 's/\([0-9][0-9]*\)\..*/\1/' $(srcdir)/VERSION`; \
+-	@V_SHLIB_CMD@ @V_SHLIB_OPT@ @V_SONAME_OPT@$@.$$MAJOR_VER $(LDFLAGS) \
++	@V_SHLIB_CMD@ $(LDFLAGS) @V_SHLIB_OPT@ @V_SONAME_OPT@$@.$$MAJOR_VER \
+ 	    -o $@.$$VER $(OBJ) $(ADDLOBJS) $(LIBS)
+ 
+ #
+@@ -434,7 +434,7 @@ libpcap.sl: $(OBJ)
+ #
+ libpcap.shareda: $(OBJ)
+ 	@rm -f $@ shr.o
+-	$(CC) @V_SHLIB_OPT@ -o shr.o $(OBJ) $(ADDLOBJS) $(LDFLAGS) $(LIBS)
++	$(CC) $(LDFLAGS) @V_SHLIB_OPT@ -o shr.o $(OBJ) $(ADDLOBJS) $(LIBS)
+ 	$(AR) rc $@ shr.o
+ 
+ #
+-- 
+1.9.1
+
-- 
1.9.1

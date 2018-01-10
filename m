From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue,  9 Jan 2018 22:15:39 -0600
Subject: [Buildroot] [PATCH v3 8/8] iptables: correct linker flag seq
In-Reply-To: <1515557739-6027-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1515557739-6027-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1515557739-6027-8-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch will correct the sequence of -pie and -shared options.
When used together, -pie should be provided to the linker before
-shared.

Upstream: https://marc.info/?l=netfilter-devel&m=151193652302080&w=2

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 ...les-patch-to-correct-linker-flag-sequence.patch | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 package/iptables/0002-iptables-patch-to-correct-linker-flag-sequence.patch

diff --git a/package/iptables/0002-iptables-patch-to-correct-linker-flag-sequence.patch b/package/iptables/0002-iptables-patch-to-correct-linker-flag-sequence.patch
new file mode 100644
index 0000000..b65c138
--- /dev/null
+++ b/package/iptables/0002-iptables-patch-to-correct-linker-flag-sequence.patch
@@ -0,0 +1,48 @@
+From 83a8109fa92c8c3a5969df6dae6cc75746ec6380 Mon Sep 17 00:00:00 2001
+From: Yogesh Prasad <yogesh.prasad@rockwellcollins.com>
+Date: Mon, 2 Oct 2017 14:34:14 -0500
+Subject: [PATCH 1/1] iptables: patch to correct linker flag sequence
+
+Description
+This patch will correct the sequence of -pie and -shared options.
+ When used together, -pie should be provided to the linker before
+ -shared. If -pie is provided after -shared, the linker throws an
+ error shown below as example.
+
+-------------------------------------------------------------------------
+/host/lib/gcc/powerpc-buildroot-linux-gnu/6.4.0/../../../..
+/powerpc-buildroot-linux-gnu/bin/ld: BFD (GNU Binutils) 2.28.1
+ assertion fail elf32-ppc.c:8923
+collect2: error: ld returned 1 exit status
+        + ./libxt_SYNPROXY.man
+make[4]: *** [libxt_TCPOPTSTRIP.so] Error 1
+        + ./libip6t_mh.man
+/host/powerpc-buildroot-linux-gnu/sysroot/usr/lib/Scrt1.o:(.data+0x4):
+ undefined reference to `main'
+/host/lib/gcc/powerpc-buildroot-linux-gnu      + ./libxt_TCPMSS.man
+/6.4.0/../../../../powerpc-buildroot-linux-gnu/bin/ld:
+ BFD (GNU Binutils) 2.28.1 assertion fail elf32-ppc.c:8923
+collect2: error: ld returned 1 exit status
+-------------------------------------------------------------------------
+
+Signed-off-by: Yogesh Prasad <yogesh.prasad@rockwellcollins.com>
+---
+ extensions/GNUmakefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/extensions/GNUmakefile.in b/extensions/GNUmakefile.in
+index b7a8a83..bee666e 100644
+--- a/extensions/GNUmakefile.in
++++ b/extensions/GNUmakefile.in
+@@ -101,7 +101,7 @@ init%.o: init%.c
+ #	Shared libraries
+ #
+ lib%.so: lib%.oo
+-	${AM_VERBOSE_CCLD} ${CCLD} ${AM_LDFLAGS} -shared ${LDFLAGS} -o $@ $< -L../libxtables/.libs -lxtables ${$*_LIBADD};
++	${AM_VERBOSE_CCLD} ${CCLD} ${AM_LDFLAGS} ${LDFLAGS} -shared -o $@ $< -L../libxtables/.libs -lxtables ${$*_LIBADD};
+ 
+ lib%.oo: ${srcdir}/lib%.c
+ 	${AM_VERBOSE_CC} ${CC} ${AM_CPPFLAGS} ${AM_DEPFLAGS} ${AM_CFLAGS} -D_INIT=lib$*_init -DPIC -fPIC ${CFLAGS} -o $@ -c $<;
+-- 
+1.9.1
+
-- 
1.9.1

From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 14 Dec 2020 23:24:07 +0100
Subject: [Buildroot] [PATCH v2] package/bind: fix compile/linking failure
Message-ID: <20201214222407.23104-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  - http://autobuild.buildroot.net/results/966a3de94aa97fa8e9895eede29c9cbfb4bd7301

  .../host/lib/gcc/arm-buildroot-linux-musleabihf/9.3.0/../../../../arm-buildroot-linux-musleabihf/bin/ld: warning: libisccfg.so.163, needed by ../../lib/bind9/.libs/libbind9.so, not found (try using -rpath or -rpath-link)
  .../host/lib/gcc/arm-buildroot-linux-musleabihf/9.3.0/../../../../arm-buildroot-linux-musleabihf/bin/ld: ../../lib/bind9/.libs/libbind9.so: undefined reference to `cfg_obj_line'

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - ISCCFGDEPLIBS vs. ISCCFGLIBS
---
 ...s-mdig-add-missing-isccfg-dependency.patch | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/bind/0002-bin-tools-mdig-add-missing-isccfg-dependency.patch

diff --git a/package/bind/0002-bin-tools-mdig-add-missing-isccfg-dependency.patch b/package/bind/0002-bin-tools-mdig-add-missing-isccfg-dependency.patch
new file mode 100644
index 0000000000..8d3de0a035
--- /dev/null
+++ b/package/bind/0002-bin-tools-mdig-add-missing-isccfg-dependency.patch
@@ -0,0 +1,40 @@
+From 30c234ce88f4ad09d159f2665ed8a67b739074e1 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Mon, 14 Dec 2020 20:52:43 +0100
+Subject: [PATCH] bin/tools/mdig: add missing isccfg dependency
+
+Fixes:
+
+  .../host/lib/gcc/arm-buildroot-linux-musleabihf/9.3.0/../../../../arm-buildroot-linux-musleabihf/bin/ld: warning: libisccfg.so.163, needed by ../../lib/bind9/.libs/libbind9.so, not found (try using -rpath or -rpath-link)
+  .../host/lib/gcc/arm-buildroot-linux-musleabihf/9.3.0/../../../../arm-buildroot-linux-musleabihf/bin/ld: ../../lib/bind9/.libs/libbind9.so: undefined reference to `cfg_obj_line'
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+Notes:
+  - this dependency seems only be needed on first compile, when the
+    libs are once installed in sysroot (independently from compile from
+    an earlyier version or from an up-to-date one with patch applied)
+    the dependency is not longer needed, even with the patch removed
+---
+ bin/tools/Makefile.in | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/bin/tools/Makefile.in b/bin/tools/Makefile.in
+index b12f80a..58c4837 100644
+--- a/bin/tools/Makefile.in
++++ b/bin/tools/Makefile.in
+@@ -94,9 +94,9 @@ genrandom at EXEEXT@: genrandom. at O@
+ 	${LIBTOOL_MODE_LINK} ${PURIFY} ${CC} ${CFLAGS} ${LDFLAGS} \
+ 		-o $@ genrandom. at O@ @GENRANDOMLIB@ ${LIBS}
+ 
+-mdig at EXEEXT@: mdig. at O@ ${ISCDEPLIBS} ${DNSDEPLIBS} ${BIND9DEPLIBS}
++mdig at EXEEXT@: mdig. at O@ ${ISCDEPLIBS} ${ISCCFGDEPLIBS} ${DNSDEPLIBS} ${BIND9DEPLIBS}
+ 	export BASEOBJS="mdig. at O@"; \
+-	export LIBS0="${DNSLIBS} ${BIND9LIBS}"; \
++	export LIBS0="${ISCCFGLIBS} ${DNSLIBS} ${BIND9LIBS}"; \
+ 	${FINALBUILDCMD}
+ 
+ dnstap-read at EXEEXT@: dnstap-read. at O@ ${ISCDEPLIBS} ${DNSDEPLIBS}
+-- 
+2.29.2
+
-- 
2.29.2

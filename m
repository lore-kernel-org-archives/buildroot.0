From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Feb 2021 19:29:04 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/bind: fix
 compile/linking failure
Message-ID: <20210227182008.1C26E814CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=07c2270cee88a884e0ac88ef97edb71b7a8df8ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Fixes:

  - http://autobuild.buildroot.net/results/966a3de94aa97fa8e9895eede29c9cbfb4bd7301

  .../host/lib/gcc/arm-buildroot-linux-musleabihf/9.3.0/../../../../arm-buildroot-linux-musleabihf/bin/ld: warning: libisccfg.so.163, needed by ../../lib/bind9/.libs/libbind9.so, not found (try using -rpath or -rpath-link)
  .../host/lib/gcc/arm-buildroot-linux-musleabihf/9.3.0/../../../../arm-buildroot-linux-musleabihf/bin/ld: ../../lib/bind9/.libs/libbind9.so: undefined reference to `cfg_obj_line'

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
[Peter: replace by upstream patches]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e4af234d3caa39e34fde68a39150c7fac0363a63)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../bind/0002-update-link-order-of-libbind9.patch  | 26 +++++++++++++++
 ...LIB0-for-isc-hmac-fixup-and-named-nzd2nzf.patch | 38 ++++++++++++++++++++++
 ...ed-library-platforms-that-don-t-support-i.patch | 30 +++++++++++++++++
 3 files changed, 94 insertions(+)

diff --git a/package/bind/0002-update-link-order-of-libbind9.patch b/package/bind/0002-update-link-order-of-libbind9.patch
new file mode 100644
index 0000000000..32c0776eec
--- /dev/null
+++ b/package/bind/0002-update-link-order-of-libbind9.patch
@@ -0,0 +1,26 @@
+From f63b2d8fbd010d60f2a07f4f69b11d7a10c48ae5 Mon Sep 17 00:00:00 2001
+From: Mark Andrews <marka@isc.org>
+Date: Tue, 15 Dec 2020 12:07:03 +1100
+Subject: [PATCH] update link order of libbind9
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ lib/bind9/Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/bind9/Makefile.in b/lib/bind9/Makefile.in
+index 2634451b15..704259dde1 100644
+--- a/lib/bind9/Makefile.in
++++ b/lib/bind9/Makefile.in
+@@ -61,7 +61,7 @@ libbind9.la: ${OBJS} ${ISCCFGDEPLIBS} ${ISCDEPLIBS} ${DNSDEPLIBS}
+ 	${LIBTOOL_MODE_LINK} \
+ 		${CC} ${ALL_CFLAGS} ${LDFLAGS} -o libbind9.la -rpath ${libdir} \
+ 		-version-info ${LIBINTERFACE}:${LIBREVISION}:${LIBAGE} \
+-		${OBJS} ${DNSLIBS} ${ISCCFGLIBS} ${ISCLIBS} @DNS_CRYPTO_LIBS@ \
++		${OBJS} ${ISCCFGLIBS} ${DNSLIBS} ${ISCLIBS} @DNS_CRYPTO_LIBS@ \
+ 		${LIBS}
+ 
+ timestamp: libbind9. at A@
+-- 
+2.20.1
+
diff --git a/package/bind/0003-fix-LIB0-for-isc-hmac-fixup-and-named-nzd2nzf.patch b/package/bind/0003-fix-LIB0-for-isc-hmac-fixup-and-named-nzd2nzf.patch
new file mode 100644
index 0000000000..92573f1255
--- /dev/null
+++ b/package/bind/0003-fix-LIB0-for-isc-hmac-fixup-and-named-nzd2nzf.patch
@@ -0,0 +1,38 @@
+From d744db22f3f0b1fa604517e4414c54531d98eb87 Mon Sep 17 00:00:00 2001
+From: Mark Andrews <marka@isc.org>
+Date: Tue, 15 Dec 2020 12:16:37 +1100
+Subject: [PATCH] fix LIB0 for isc-hmac-fixup and named-nzd2nzf
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ bin/tools/Makefile.in | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/bin/tools/Makefile.in b/bin/tools/Makefile.in
+index b12f80a334..6f984f121a 100644
+--- a/bin/tools/Makefile.in
++++ b/bin/tools/Makefile.in
+@@ -87,7 +87,7 @@ nsec3hash at EXEEXT@: nsec3hash. at O@ ${ISCDEPLIBS} ${DNSDEPLIBS}
+ 
+ isc-hmac-fixup at EXEEXT@: isc-hmac-fixup. at O@ ${ISCDEPLIBS}
+ 	export BASEOBJS="isc-hmac-fixup. at O@"; \
+-	export LIBS0="${ISCLIBS}"; \
++	export LIBS0=""; \
+ 	${FINALBUILDCMD}
+ 
+ genrandom at EXEEXT@: genrandom. at O@
+@@ -104,9 +104,9 @@ dnstap-read at EXEEXT@: dnstap-read. at O@ ${ISCDEPLIBS} ${DNSDEPLIBS}
+ 	export LIBS0="${DNSLIBS}"; \
+ 	${FINALBUILDCMD}
+ 
+-named-nzd2nzf at EXEEXT@: named-nzd2nzf. at O@ ${NZDDEPLIBS}
++named-nzd2nzf at EXEEXT@: named-nzd2nzf. at O@ ${ISCDEPLIBS}
+ 	export BASEOBJS="named-nzd2nzf. at O@"; \
+-	export LIBS0="${ISCCFGLIBS} ${ISCCCLIBS} ${BIND9LIBS} ${DNSLIBS}"; \
++	export LIBS0=""; \
+ 	${FINALBUILDCMD}
+ 
+ doc man:: ${MANOBJS}
+-- 
+2.20.1
+
diff --git a/package/bind/0004-Handle-shared-library-platforms-that-don-t-support-i.patch b/package/bind/0004-Handle-shared-library-platforms-that-don-t-support-i.patch
new file mode 100644
index 0000000000..3e00e41d65
--- /dev/null
+++ b/package/bind/0004-Handle-shared-library-platforms-that-don-t-support-i.patch
@@ -0,0 +1,30 @@
+From 5cec1ba2fa2f18e9d9e926eab923e0b1b7b8d226 Mon Sep 17 00:00:00 2001
+From: Mark Andrews <marka@isc.org>
+Date: Tue, 15 Dec 2020 19:18:41 +1100
+Subject: [PATCH] Handle shared library platforms that don't support inter
+ library dependancies
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ bin/tools/Makefile.in | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/bin/tools/Makefile.in b/bin/tools/Makefile.in
+index 6f984f121a..d34bac1192 100644
+--- a/bin/tools/Makefile.in
++++ b/bin/tools/Makefile.in
+@@ -94,9 +94,9 @@ genrandom at EXEEXT@: genrandom. at O@
+ 	${LIBTOOL_MODE_LINK} ${PURIFY} ${CC} ${CFLAGS} ${LDFLAGS} \
+ 		-o $@ genrandom. at O@ @GENRANDOMLIB@ ${LIBS}
+ 
+-mdig at EXEEXT@: mdig. at O@ ${ISCDEPLIBS} ${DNSDEPLIBS} ${BIND9DEPLIBS}
++mdig at EXEEXT@: mdig. at O@ ${ISCDEPLIBS} ${DNSDEPLIBS} ${BIND9DEPLIBS} ${ISCCFGDEPLIBS}
+ 	export BASEOBJS="mdig. at O@"; \
+-	export LIBS0="${DNSLIBS} ${BIND9LIBS}"; \
++	export LIBS0="${BIND9LIBS} ${ISCCFGLIBS} ${DNSLIBS}"; \
+ 	${FINALBUILDCMD}
+ 
+ dnstap-read at EXEEXT@: dnstap-read. at O@ ${ISCDEPLIBS} ${DNSDEPLIBS}
+-- 
+2.20.1
+

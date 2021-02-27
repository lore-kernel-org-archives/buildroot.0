From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Feb 2021 19:41:08 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/bind: security
 bump to version 9.11.28
Message-ID: <20210227181918.63863844F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4f55b56463f92684c5bd988169654ab84489d399
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fixes the following security issue:

- CVE-2020-8625: When tkey-gssapi-keytab or tkey-gssapi-credential was
  configured, a specially crafted GSS-TSIG query could cause a buffer
  overflow in the ISC implementation of SPNEGO (a protocol enabling
  negotiation of the security mechanism to use for GSSAPI authentication).
  This flaw could be exploited to crash named.  Theoretically, it also
  enabled remote code execution, but achieving the latter is very difficult
  in real-world conditions

For details, see the advisory:
https://kb.isc.org/docs/cve-2020-8625

In addition, 9.11.26-27 fixed a number of issues, see the release notes for
details:
https://downloads.isc.org/isc/bind9/9.11.28/RELEASE-NOTES-bind-9.11.28.html

Drop now upstreamed patches, update the GPG key for the 2021-2022 variant
and update the COPYRIGHT hash for a change of year:

-Copyright (C) 1996-2020  Internet Systems Consortium, Inc. ("ISC")
+Copyright (C) 1996-2021  Internet Systems Consortium, Inc. ("ISC")

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 6376decbda3b1373dfaa5a67ff5cb37f0276a7dc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../bind/0002-update-link-order-of-libbind9.patch  | 26 ---------------
 ...LIB0-for-isc-hmac-fixup-and-named-nzd2nzf.patch | 38 ----------------------
 ...ed-library-platforms-that-don-t-support-i.patch | 30 -----------------
 package/bind/bind.hash                             |  8 ++---
 package/bind/bind.mk                               |  2 +-
 5 files changed, 5 insertions(+), 99 deletions(-)

diff --git a/package/bind/0002-update-link-order-of-libbind9.patch b/package/bind/0002-update-link-order-of-libbind9.patch
deleted file mode 100644
index 32c0776eec..0000000000
--- a/package/bind/0002-update-link-order-of-libbind9.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From f63b2d8fbd010d60f2a07f4f69b11d7a10c48ae5 Mon Sep 17 00:00:00 2001
-From: Mark Andrews <marka@isc.org>
-Date: Tue, 15 Dec 2020 12:07:03 +1100
-Subject: [PATCH] update link order of libbind9
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- lib/bind9/Makefile.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/bind9/Makefile.in b/lib/bind9/Makefile.in
-index 2634451b15..704259dde1 100644
---- a/lib/bind9/Makefile.in
-+++ b/lib/bind9/Makefile.in
-@@ -61,7 +61,7 @@ libbind9.la: ${OBJS} ${ISCCFGDEPLIBS} ${ISCDEPLIBS} ${DNSDEPLIBS}
- 	${LIBTOOL_MODE_LINK} \
- 		${CC} ${ALL_CFLAGS} ${LDFLAGS} -o libbind9.la -rpath ${libdir} \
- 		-version-info ${LIBINTERFACE}:${LIBREVISION}:${LIBAGE} \
--		${OBJS} ${DNSLIBS} ${ISCCFGLIBS} ${ISCLIBS} @DNS_CRYPTO_LIBS@ \
-+		${OBJS} ${ISCCFGLIBS} ${DNSLIBS} ${ISCLIBS} @DNS_CRYPTO_LIBS@ \
- 		${LIBS}
- 
- timestamp: libbind9. at A@
--- 
-2.20.1
-
diff --git a/package/bind/0003-fix-LIB0-for-isc-hmac-fixup-and-named-nzd2nzf.patch b/package/bind/0003-fix-LIB0-for-isc-hmac-fixup-and-named-nzd2nzf.patch
deleted file mode 100644
index 92573f1255..0000000000
--- a/package/bind/0003-fix-LIB0-for-isc-hmac-fixup-and-named-nzd2nzf.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From d744db22f3f0b1fa604517e4414c54531d98eb87 Mon Sep 17 00:00:00 2001
-From: Mark Andrews <marka@isc.org>
-Date: Tue, 15 Dec 2020 12:16:37 +1100
-Subject: [PATCH] fix LIB0 for isc-hmac-fixup and named-nzd2nzf
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- bin/tools/Makefile.in | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/bin/tools/Makefile.in b/bin/tools/Makefile.in
-index b12f80a334..6f984f121a 100644
---- a/bin/tools/Makefile.in
-+++ b/bin/tools/Makefile.in
-@@ -87,7 +87,7 @@ nsec3hash at EXEEXT@: nsec3hash. at O@ ${ISCDEPLIBS} ${DNSDEPLIBS}
- 
- isc-hmac-fixup at EXEEXT@: isc-hmac-fixup. at O@ ${ISCDEPLIBS}
- 	export BASEOBJS="isc-hmac-fixup. at O@"; \
--	export LIBS0="${ISCLIBS}"; \
-+	export LIBS0=""; \
- 	${FINALBUILDCMD}
- 
- genrandom at EXEEXT@: genrandom. at O@
-@@ -104,9 +104,9 @@ dnstap-read at EXEEXT@: dnstap-read. at O@ ${ISCDEPLIBS} ${DNSDEPLIBS}
- 	export LIBS0="${DNSLIBS}"; \
- 	${FINALBUILDCMD}
- 
--named-nzd2nzf at EXEEXT@: named-nzd2nzf. at O@ ${NZDDEPLIBS}
-+named-nzd2nzf at EXEEXT@: named-nzd2nzf. at O@ ${ISCDEPLIBS}
- 	export BASEOBJS="named-nzd2nzf. at O@"; \
--	export LIBS0="${ISCCFGLIBS} ${ISCCCLIBS} ${BIND9LIBS} ${DNSLIBS}"; \
-+	export LIBS0=""; \
- 	${FINALBUILDCMD}
- 
- doc man:: ${MANOBJS}
--- 
-2.20.1
-
diff --git a/package/bind/0004-Handle-shared-library-platforms-that-don-t-support-i.patch b/package/bind/0004-Handle-shared-library-platforms-that-don-t-support-i.patch
deleted file mode 100644
index 3e00e41d65..0000000000
--- a/package/bind/0004-Handle-shared-library-platforms-that-don-t-support-i.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 5cec1ba2fa2f18e9d9e926eab923e0b1b7b8d226 Mon Sep 17 00:00:00 2001
-From: Mark Andrews <marka@isc.org>
-Date: Tue, 15 Dec 2020 19:18:41 +1100
-Subject: [PATCH] Handle shared library platforms that don't support inter
- library dependancies
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- bin/tools/Makefile.in | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/bin/tools/Makefile.in b/bin/tools/Makefile.in
-index 6f984f121a..d34bac1192 100644
---- a/bin/tools/Makefile.in
-+++ b/bin/tools/Makefile.in
-@@ -94,9 +94,9 @@ genrandom at EXEEXT@: genrandom. at O@
- 	${LIBTOOL_MODE_LINK} ${PURIFY} ${CC} ${CFLAGS} ${LDFLAGS} \
- 		-o $@ genrandom. at O@ @GENRANDOMLIB@ ${LIBS}
- 
--mdig at EXEEXT@: mdig. at O@ ${ISCDEPLIBS} ${DNSDEPLIBS} ${BIND9DEPLIBS}
-+mdig at EXEEXT@: mdig. at O@ ${ISCDEPLIBS} ${DNSDEPLIBS} ${BIND9DEPLIBS} ${ISCCFGDEPLIBS}
- 	export BASEOBJS="mdig. at O@"; \
--	export LIBS0="${DNSLIBS} ${BIND9LIBS}"; \
-+	export LIBS0="${BIND9LIBS} ${ISCCFGLIBS} ${DNSLIBS}"; \
- 	${FINALBUILDCMD}
- 
- dnstap-read at EXEEXT@: dnstap-read. at O@ ${ISCDEPLIBS} ${DNSDEPLIBS}
--- 
-2.20.1
-
diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index ae196dacd5..369d2f5fb5 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.11.25/bind-9.11.25.tar.gz.asc
-# with key 95CEDA256B1CA0A15F302FB59521A7ED5DACE918
-sha256  8491c24e5a3da68f421d0fcb946602c8d0ff963012fdd176b8026c8890f3a117  bind-9.11.25.tar.gz
-sha256  e316d9d12b3cc3600985d71011d7856f5ff93d28e748155a3a18171b32d98d8b  COPYRIGHT
+# Verified from https://ftp.isc.org/isc/bind9/9.11.28/bind-9.11.28.tar.gz.asc
+# with key 2455774D42FDFE6B9C383EB8FE1002BC5970811F
+sha256  1090cbe6caba37c404d1075887da7e5282ae9a2bc6172d722df15cd480975e74  bind-9.11.28.tar.gz
+sha256  cad49daa42654bc241762cd998630168a2542c8fd6fad3881e2eac1510bb6fcd  COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index ab42762e12..cdf50c5c19 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.11.25
+BIND_VERSION = 9.11.28
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 # bind does not support parallel builds.
 BIND_MAKE = $(MAKE1)

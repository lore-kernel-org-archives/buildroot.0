From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu, 23 Jul 2015 08:38:26 +0200
Subject: [Buildroot] [PATCH v2 3/3] package/libtirpc: Do not build
	unsupported API files
In-Reply-To: <1437633506-3224-1-git-send-email-joerg.krause@embedded.rocks>
References: <1437633506-3224-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <1437633506-3224-3-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Version 0.3.2 re-enables some APIs for backward compatibility with
glibc's SunRPC:
  - key_prot
  - netname
  - rtime

Unfortunalty, this breaks building libtirpc with uClibc and musl:
  getpublickey.c:41:28: fatal error: rpcsvc/yp_prot.h: No such file or directory

We disable those API files as at least yp_prot.h is also NIS related to support
building libtirpc with these two libc's.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
Changes v1 -> v2:
  - fixup 0007-Do-not-build-unsupported-API-files.patch into existing
    0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch as yp_prot.h
    is NIS related (suggested by Thomas Petazzoni)
---
 ...Disable-parts-of-TIRPC-requiring-NIS-support.patch | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/package/libtirpc/0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch b/package/libtirpc/0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch
index 71d4420..ea30fb2 100644
--- a/package/libtirpc/0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch
+++ b/package/libtirpc/0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch
@@ -1,4 +1,4 @@
-From 583ad557faf86c5532e16dafff19bfdcc349752d Mon Sep 17 00:00:00 2001
+From cb2f393afdb444bf97a7327991f8f5a2c2f64082 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
 Date: Mon, 20 Jul 2015 20:30:11 +0200
 Subject: [PATCH 1/1] Disable parts of TIRPC requiring NIS support
@@ -12,11 +12,11 @@ Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 [joerg.krause at embedded.rocks: update for 0.3.2]
 Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
 ---
- src/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ src/Makefile.am | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/src/Makefile.am b/src/Makefile.am
-index 6cc567a..cf8a8ca 100644
+index 6cc567a..2b26a29 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
 @@ -51,7 +51,7 @@ libtirpc_la_SOURCES = auth_none.c auth_unix.c authunix_prot.c bindresvport.c cln
@@ -28,6 +28,17 @@ index 6cc567a..cf8a8ca 100644
  
  ## XDR
  libtirpc_la_SOURCES += xdr.c xdr_rec.c xdr_array.c xdr_float.c xdr_mem.c xdr_reference.c xdr_stdio.c
+@@ -68,8 +68,8 @@ if GSS
+     libtirpc_la_CFLAGS = -DHAVE_RPCSEC_GSS $(GSSAPI_CFLAGS)
+ endif
+ 
+-libtirpc_la_SOURCES += key_call.c key_prot_xdr.c getpublickey.c
+-libtirpc_la_SOURCES += netname.c netnamer.c rtime.c
++#libtirpc_la_SOURCES += key_call.c key_prot_xdr.c getpublickey.c
++#libtirpc_la_SOURCES += netname.c netnamer.c rtime.c
+ 
+ CLEANFILES	       = cscope.* *~
+ DISTCLEANFILES	       = Makefile.in
 -- 
 2.4.6
 
-- 
2.4.6

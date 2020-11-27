From: Petr Vorel <petr.vorel@gmail.com>
Date: Fri, 27 Nov 2020 21:39:07 +0100
Subject: [Buildroot] [PATCH 1/1] libtirpc: Remove NIS patch
Message-ID: <20201127203907.16845-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It was originally added in 6dc861f2a2 ("libtirpc: new package")
for libtirpc 0.2.2 (8 years ago). It might have been fixed in
5f00f8c ("Remove dependency to nis.h"), released in 1.0.2.

Testing with test-pkg shows the only failure for br-riscv32:
RPC support not available in C library, please disable
BR2_TOOLCHAIN_EXTERNAL_INET_RPC

But test fails with the same error even when this patch is kept.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Hi,

IMHO BR2_TOOLCHAIN_EXTERNAL_INET_RPC touches the area, but it's for
glibc 2.32. But the original problem was uclibc and musl related
and hopefully fixed in
5f00f8c "Remove dependency to nis.h" (1.0.2)
or in e45bf42 "Fix struct rpcent for uclibc-ng" (libtirpc 1.0.2) 83b7ac7
"Commit e45bf420983e fixed issue for uclibc-ng, but on uclibc this
depends on __UCLIBC_HAS_RPC__." (1.1.5)

Kind regards,
Petr

 ...parts-of-TIRPC-requiring-NIS-support.patch | 50 -------------------
 1 file changed, 50 deletions(-)
 delete mode 100644 package/libtirpc/0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch

diff --git a/package/libtirpc/0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch b/package/libtirpc/0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch
deleted file mode 100644
index 101a779ade..0000000000
--- a/package/libtirpc/0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From cb30579c9195ae29c82545c934e0bd9677262bce Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
-Date: Fri, 20 Dec 2019 17:58:17 +0100
-Subject: [PATCH] Disable parts of TIRPC requiring NIS support
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-[yann.morin.1998 at free.fr: update for 0.3.1]
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-[joerg.krause at embedded.rocks: update for 0.3.2]
-Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
-[peda at axentia.se: update for 1.0.1]
-Signed-off-by: Peter Rosin <peda@axentia.se>
-[bernd.kuhls at t-online.de: update for 1.0.2]
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[pvorel: update for 1.2.5]
-Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
----
- src/Makefile.am | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/Makefile.am b/src/Makefile.am
-index b2d5436..864f984 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -24,7 +24,7 @@ libtirpc_la_SOURCES = auth_none.c auth_unix.c authunix_prot.c \
-         rpc_callmsg.c rpc_generic.c rpc_soc.c rpcb_clnt.c rpcb_prot.c \
-         rpcb_st_xdr.c svc.c svc_auth.c svc_dg.c svc_auth_unix.c svc_auth_none.c \
-         svc_generic.c svc_raw.c svc_run.c svc_simple.c svc_vc.c getpeereid.c \
--        auth_time.c debug.c 
-+        debug.c
- 
- if AUTHDES
- libtirpc_la_SOURCES += auth_des.c  authdes_prot.c  des_crypt.c  des_impl.c  des_soft.c  svc_auth_des.c
-@@ -45,8 +45,8 @@ if GSS
-     libtirpc_la_CFLAGS = -DHAVE_RPCSEC_GSS $(GSSAPI_CFLAGS)
- endif
- 
--libtirpc_la_SOURCES += key_call.c key_prot_xdr.c getpublickey.c
--libtirpc_la_SOURCES += netname.c netnamer.c rpcdname.c rtime.c
-+#libtirpc_la_SOURCES += key_call.c key_prot_xdr.c getpublickey.c
-+#libtirpc_la_SOURCES += netname.c netnamer.c rpcdname.c rtime.c
- 
- CLEANFILES	       = cscope.* *~
- DISTCLEANFILES	       = Makefile.in
--- 
-2.24.0
-
-- 
2.29.2

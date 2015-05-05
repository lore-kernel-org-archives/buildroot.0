From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Tue,  5 May 2015 18:24:34 +0200
Subject: [Buildroot] [PATCH 2/2] package/libtirpc: Add patches to fix musl
	build
In-Reply-To: <1430843074-30355-1-git-send-email-joerg.krause@embedded.rocks>
References: <1430843074-30355-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <1430843074-30355-2-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add patches to fix several build issues with the musl C library. To distinguish
the musl patches from the other patches start the patchset with a number of 10.

Fixes:
http://autobuild.buildroot.net/results/54b/54b519d67447d02bc3962511c894741172d56a0c/
http://autobuild.buildroot.net/results/b1d/b1d31727a60f1d5a435dd07dacf1e463f0f8ccde/
http://autobuild.buildroot.net/results/a10/a10c9766151916ee9055ee72c44283ceb9401e88/

and more.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 ...not-use-internal-glibc-sys-cdefs.h-header.patch | 1763 ++++++++++++++++++++
 .../0011-Add-missing-define-for-__THROW.patch      |   33 +
 ...place-sys-queue.h-with-a-local-bsdqueue.h.patch |  903 ++++++++++
 .../0013-Add-missing-header-include-netdb.h.patch  |   36 +
 .../0014-Define-struct-rpcent-on-non-glibc.patch   |   33 +
 .../0015-Fix-include-path-for-fcntl.h.patch        |   48 +
 .../0016-Fix-include-path-for-poll.h.patch         |  104 ++
 7 files changed, 2920 insertions(+)
 create mode 100644 package/libtirpc/0010-Do-not-use-internal-glibc-sys-cdefs.h-header.patch
 create mode 100644 package/libtirpc/0011-Add-missing-define-for-__THROW.patch
 create mode 100644 package/libtirpc/0012-Replace-sys-queue.h-with-a-local-bsdqueue.h.patch
 create mode 100644 package/libtirpc/0013-Add-missing-header-include-netdb.h.patch
 create mode 100644 package/libtirpc/0014-Define-struct-rpcent-on-non-glibc.patch
 create mode 100644 package/libtirpc/0015-Fix-include-path-for-fcntl.h.patch
 create mode 100644 package/libtirpc/0016-Fix-include-path-for-poll.h.patch

diff --git a/package/libtirpc/0010-Do-not-use-internal-glibc-sys-cdefs.h-header.patch b/package/libtirpc/0010-Do-not-use-internal-glibc-sys-cdefs.h-header.patch
new file mode 100644
index 0000000..948cc28
--- /dev/null
+++ b/package/libtirpc/0010-Do-not-use-internal-glibc-sys-cdefs.h-header.patch
@@ -0,0 +1,1763 @@
+From f556b22e8c175c0dee7909e9018d3660eda9bc31 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Tue, 5 May 2015 16:42:01 +0200
+Subject: [PATCH 10/16] Do not use internal glibc sys/cdefs.h header
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The musl C library does not and will not have sys/cdefs.h. This header is *not*
+intended to be used by any program [1].
+
+Remove the header inclusion and replace __BEGIN_DECLS and __END_DECLS by their
+equivalents.
+
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+---
+ src/auth_des.c        |  2 --
+ src/auth_none.c       |  1 -
+ src/auth_time.c       |  1 -
+ src/auth_unix.c       |  2 --
+ src/authdes_prot.c    |  1 -
+ src/authunix_prot.c   |  2 --
+ src/bindresvport.c    |  2 --
+ src/clnt_bcast.c      |  1 -
+ src/clnt_perror.c     |  3 --
+ src/clnt_simple.c     |  2 --
+ src/crypt_client.c    |  2 --
+ src/des_crypt.c       |  1 -
+ src/des_soft.c        |  2 --
+ src/getnetconfig.c    |  1 -
+ src/getnetpath.c      |  2 --
+ src/getpeereid.c      |  2 --
+ src/getpublickey.c    |  3 --
+ src/key_call.c        |  2 --
+ src/key_prot_xdr.c    |  2 --
+ src/mt_misc.c         |  1 -
+ src/pmap_clnt.c       |  2 --
+ src/pmap_getmaps.c    |  2 --
+ src/rpc_com.h         | 10 +++---
+ src/rpc_generic.c     |  2 --
+ src/rpcb_st_xdr.c     |  2 --
+ src/rpcdname.c        |  1 -
+ src/svc_dg.c          |  2 --
+ src/svc_simple.c      |  2 --
+ src/svc_vc.c          |  2 --
+ src/xdr.c             |  2 --
+ src/xdr_array.c       |  2 --
+ src/xdr_float.c       |  2 --
+ src/xdr_mem.c         |  2 --
+ src/xdr_rec.c         |  3 --
+ src/xdr_reference.c   |  3 --
+ src/xdr_sizeof.c      |  2 --
+ src/xdr_stdio.c       |  2 --
+ tirpc/netconfig.h     |  8 +++--
+ tirpc/rpc/auth.h      | 89 ++++++++++++++++++++++++++++++++++++++-------------
+ tirpc/rpc/auth_des.h  | 16 ++++++---
+ tirpc/rpc/auth_gss.h  |  8 +++--
+ tirpc/rpc/auth_unix.h |  9 ++++--
+ tirpc/rpc/clnt.h      | 57 ++++++++++++++++++++++++---------
+ tirpc/rpc/clnt_soc.h  | 34 ++++++++++++++------
+ tirpc/rpc/des_crypt.h | 25 +++++++++++----
+ tirpc/rpc/nettype.h   |  8 +++--
+ tirpc/rpc/pmap_clnt.h |  9 ++++--
+ tirpc/rpc/pmap_prot.h |  9 ++++--
+ tirpc/rpc/pmap_rmt.h  |  9 ++++--
+ tirpc/rpc/rpc.h       | 16 ++++++---
+ tirpc/rpc/rpc_com.h   | 10 +++---
+ tirpc/rpc/rpc_msg.h   |  8 +++--
+ tirpc/rpc/rpcb_clnt.h |  8 +++--
+ tirpc/rpc/rpcent.h    |  8 +++--
+ tirpc/rpc/svc.h       | 65 +++++++++++++++++++++++++++----------
+ tirpc/rpc/svc_auth.h  |  8 +++--
+ tirpc/rpc/svc_soc.h   | 49 ++++++++++++++++++++--------
+ tirpc/rpc/xdr.h       | 17 +++++++---
+ tirpc/rpcsvc/crypt.x  |  1 -
+ 59 files changed, 348 insertions(+), 201 deletions(-)
+
+diff --git a/src/auth_des.c b/src/auth_des.c
+index f0c8b8c..74a033d 100644
+--- a/src/auth_des.c
++++ b/src/auth_des.c
+@@ -38,7 +38,6 @@
+ #include <string.h>
+ #include <stdlib.h>
+ #include <unistd.h>
+-#include <sys/cdefs.h>
+ #include <rpc/des_crypt.h>
+ #include <syslog.h>
+ #include <rpc/types.h>
+@@ -52,7 +51,6 @@
+ 
+ #if defined(LIBC_SCCS) && !defined(lint)
+ #endif
+-#include <sys/cdefs.h>
+ 
+ #define USEC_PER_SEC		1000000
+ #define RTIME_TIMEOUT		5	/* seconds to wait for sync */
+diff --git a/src/auth_none.c b/src/auth_none.c
+index affc92b..0b0bbd1 100644
+--- a/src/auth_none.c
++++ b/src/auth_none.c
+@@ -31,7 +31,6 @@
+ static char *sccsid = "@(#)auth_none.c 1.19 87/08/11 Copyr 1984 Sun Micro";
+ static char *sccsid = "@(#)auth_none.c	2.1 88/07/29 4.0 RPCSRC";
+ #endif
+-#include <sys/cdefs.h>
+ __FBSDID("$FreeBSD: src/lib/libc/rpc/auth_none.c,v 1.12 2002/03/22 23:18:35 obrien Exp $");
+ */
+ 
+diff --git a/src/auth_time.c b/src/auth_time.c
+index 7cfbb7e..ace86bf 100644
+--- a/src/auth_time.c
++++ b/src/auth_time.c
+@@ -25,7 +25,6 @@
+  *	needed to deal with TCP connections.
+  */
+ 
+-#include <sys/cdefs.h>
+ #include <stdio.h>
+ #include <syslog.h>
+ #include <string.h>
+diff --git a/src/auth_unix.c b/src/auth_unix.c
+index 4b9b13f..5b57218 100644
+--- a/src/auth_unix.c
++++ b/src/auth_unix.c
+@@ -26,8 +26,6 @@
+  * POSSIBILITY OF SUCH DAMAGE.
+  */
+ 
+-#include <sys/cdefs.h>
+-
+ /*
+  * auth_unix.c, Implements UNIX style authentication parameters.
+  *
+diff --git a/src/authdes_prot.c b/src/authdes_prot.c
+index ed061a5..227d08a 100644
+--- a/src/authdes_prot.c
++++ b/src/authdes_prot.c
+@@ -1,4 +1,3 @@
+-#include <sys/cdefs.h>
+ /*
+  * Copyright (c) 2009, Sun Microsystems, Inc.
+  * All rights reserved.
+diff --git a/src/authunix_prot.c b/src/authunix_prot.c
+index bf76a9d..50133bb 100644
+--- a/src/authunix_prot.c
++++ b/src/authunix_prot.c
+@@ -26,8 +26,6 @@
+  * POSSIBILITY OF SUCH DAMAGE.
+  */
+ 
+-#include <sys/cdefs.h>
+-
+ /*
+  * authunix_prot.c
+  * XDR for UNIX style authentication parameters for RPC
+diff --git a/src/bindresvport.c b/src/bindresvport.c
+index d6d9c14..7378e0e 100644
+--- a/src/bindresvport.c
++++ b/src/bindresvport.c
+@@ -26,8 +26,6 @@
+  * POSSIBILITY OF SUCH DAMAGE.
+  */
+ 
+-#include <sys/cdefs.h>
+-
+ /*
+  * Copyright (c) 1987 by Sun Microsystems, Inc.
+  *
+diff --git a/src/clnt_bcast.c b/src/clnt_bcast.c
+index 1055545..262b2ab 100644
+--- a/src/clnt_bcast.c
++++ b/src/clnt_bcast.c
+@@ -28,7 +28,6 @@
+ /*
+  * Copyright (c) 1986-1991 by Sun Microsystems Inc. 
+  */
+-#include <sys/cdefs.h>
+ 
+ /*
+  * clnt_bcast.c
+diff --git a/src/clnt_perror.c b/src/clnt_perror.c
+index bcd8af8..fb7fb80 100644
+--- a/src/clnt_perror.c
++++ b/src/clnt_perror.c
+@@ -27,9 +27,6 @@
+  */
+ 
+ /*
+-#include <sys/cdefs.h>
+-*/
+-/*
+  * clnt_perror.c
+  *
+  * Copyright (C) 1984, Sun Microsystems, Inc.
+diff --git a/src/clnt_simple.c b/src/clnt_simple.c
+index e66da6a..6187438 100644
+--- a/src/clnt_simple.c
++++ b/src/clnt_simple.c
+@@ -29,8 +29,6 @@
+  * Copyright (c) 1986-1991 by Sun Microsystems Inc. 
+  */
+ 
+-#include <sys/cdefs.h>
+-
+ /*
+  * clnt_simple.c
+  * Simplified front end to client rpc.
+diff --git a/src/crypt_client.c b/src/crypt_client.c
+index 670b253..19d1320 100644
+--- a/src/crypt_client.c
++++ b/src/crypt_client.c
+@@ -30,8 +30,6 @@
+  * SUCH DAMAGE.
+  */
+ 
+-#include <sys/cdefs.h>
+-
+ #include <err.h>
+ #include <sys/types.h>
+ #include <rpc/des_crypt.h>
+diff --git a/src/des_crypt.c b/src/des_crypt.c
+index 37a1022..980a6cb 100644
+--- a/src/des_crypt.c
++++ b/src/des_crypt.c
+@@ -39,7 +39,6 @@
+ static char sccsid[] = "@(#)des_crypt.c	2.2 88/08/10 4.0 RPCSRC; from 1.13 88/02/08 SMI";
+ #endif
+ #endif
+-#include <sys/cdefs.h>
+ 
+ static int common_crypt( char *, char *, unsigned, unsigned, struct desparams * );
+ int (*__des_crypt_LOCAL)() = 0;
+diff --git a/src/des_soft.c b/src/des_soft.c
+index e6fdf20..416357a 100644
+--- a/src/des_soft.c
++++ b/src/des_soft.c
+@@ -1,5 +1,3 @@
+-//#include <sys/cdefs.h>
+-
+ /*
+  * Copyright (c) 2009, Sun Microsystems, Inc.
+  * All rights reserved.
+diff --git a/src/getnetconfig.c b/src/getnetconfig.c
+index 78de0f6..af2bdd8 100644
+--- a/src/getnetconfig.c
++++ b/src/getnetconfig.c
+@@ -32,7 +32,6 @@
+  
+ #include <pthread.h>
+ #include <reentrant.h>
+-#include <sys/cdefs.h>
+ #include <stdio.h>
+ #include <errno.h>
+ #include <netconfig.h>
+diff --git a/src/getnetpath.c b/src/getnetpath.c
+index cd80dca..7c19932 100644
+--- a/src/getnetpath.c
++++ b/src/getnetpath.c
+@@ -25,13 +25,11 @@
+  * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
+  * POSSIBILITY OF SUCH DAMAGE.
+  */
+-#include <sys/cdefs.h>
+ 
+ /*
+  * Copyright (c) 1989 by Sun Microsystems, Inc.
+  */
+ 
+-#include <sys/cdefs.h>
+ #include <stdio.h>
+ #include <errno.h>
+ #include <netconfig.h>
+diff --git a/src/getpeereid.c b/src/getpeereid.c
+index 57ee197..d8a30f7 100644
+--- a/src/getpeereid.c
++++ b/src/getpeereid.c
+@@ -24,8 +24,6 @@
+  * SUCH DAMAGE.
+  */
+ 
+-#include <sys/cdefs.h>
+-
+ #include <sys/param.h>
+ #include <sys/socket.h>
+ #include <sys/un.h>
+diff --git a/src/getpublickey.c b/src/getpublickey.c
+index 332c725..4fc85b4 100644
+--- a/src/getpublickey.c
++++ b/src/getpublickey.c
+@@ -25,9 +25,6 @@
+  * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
+  * POSSIBILITY OF SUCH DAMAGE.
+  */
+-/*
+-#include <sys/cdefs.h>
+-*/
+ 
+ /*
+  * publickey.c
+diff --git a/src/key_call.c b/src/key_call.c
+index 906b2f6..c37e136 100644
+--- a/src/key_call.c
++++ b/src/key_call.c
+@@ -30,8 +30,6 @@
+  */
+ 
+ 
+-#include <sys/cdefs.h>
+-
+ /*
+  * key_call.c, Interface to keyserver
+  *
+diff --git a/src/key_prot_xdr.c b/src/key_prot_xdr.c
+index df2842f..d6a0af8 100644
+--- a/src/key_prot_xdr.c
++++ b/src/key_prot_xdr.c
+@@ -33,8 +33,6 @@
+  */
+ /* Copyright (c)  1990, 1991 Sun Microsystems, Inc. */
+ 
+-#include <sys/cdefs.h>
+-
+ /* 
+  * Compiled from key_prot.x using rpcgen.
+  * DO NOT EDIT THIS FILE!
+diff --git a/src/mt_misc.c b/src/mt_misc.c
+index d459dec..74414f5 100644
+--- a/src/mt_misc.c
++++ b/src/mt_misc.c
+@@ -1,5 +1,4 @@
+ 
+-#include <sys/cdefs.h>
+ #include <pthread.h>
+ #include <reentrant.h>
+ #include <rpc/rpc.h>
+diff --git a/src/pmap_clnt.c b/src/pmap_clnt.c
+index 1d5d153..ff7a0ca 100644
+--- a/src/pmap_clnt.c
++++ b/src/pmap_clnt.c
+@@ -26,8 +26,6 @@
+  * POSSIBILITY OF SUCH DAMAGE.
+  */
+ 
+-#include <sys/cdefs.h>
+-
+ /*
+  * pmap_clnt.c
+  * Client interface to pmap rpc service.
+diff --git a/src/pmap_getmaps.c b/src/pmap_getmaps.c
+index 54338f7..7b96cdc 100644
+--- a/src/pmap_getmaps.c
++++ b/src/pmap_getmaps.c
+@@ -26,8 +26,6 @@
+  * POSSIBILITY OF SUCH DAMAGE.
+  */
+ 
+-#include <sys/cdefs.h>
+-
+ /*
+  * pmap_getmap.c
+  * Client interface to pmap rpc service.
+diff --git a/src/rpc_com.h b/src/rpc_com.h
+index 38c2cfe..bc8fb55 100644
+--- a/src/rpc_com.h
++++ b/src/rpc_com.h
+@@ -40,8 +40,6 @@
+ #ifndef _TIRPC_RPCCOM_H
+ #define	_TIRPC_RPCCOM_H
+ 
+-#include <sys/cdefs.h>
+-
+ /* #pragma ident	"@(#)rpc_com.h	1.11	93/07/05 SMI" */
+ 
+ /*
+@@ -54,7 +52,9 @@
+ #define __RPC_GETXID(now) ((u_int32_t)getpid() ^ (u_int32_t)(now)->tv_sec ^ \
+     (u_int32_t)(now)->tv_usec)
+ 
+-__BEGIN_DECLS
++#ifdef __cplusplus
++}
++#endif
+ extern u_int __rpc_get_a_size(int);
+ extern int __rpc_dtbsize(void);
+ extern struct netconfig * __rpcgettp(int);
+@@ -90,6 +90,8 @@ void __xprt_set_raddr(SVCXPRT *, const struct sockaddr_storage *);
+ SVCXPRT **__svc_xports;
+ int __svc_maxrec;
+ 
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ #endif /* _TIRPC_RPCCOM_H */
+diff --git a/src/rpc_generic.c b/src/rpc_generic.c
+index 2eb91ad..478f69a 100644
+--- a/src/rpc_generic.c
++++ b/src/rpc_generic.c
+@@ -29,8 +29,6 @@
+  * Copyright (c) 1986-1991 by Sun Microsystems Inc. 
+  */
+ 
+-#include <sys/cdefs.h>
+-
+ /*
+  * rpc_generic.c, Miscl routines for RPC.
+  *
+diff --git a/src/rpcb_st_xdr.c b/src/rpcb_st_xdr.c
+index c5d3575..e9071ac 100644
+--- a/src/rpcb_st_xdr.c
++++ b/src/rpcb_st_xdr.c
+@@ -35,8 +35,6 @@
+  * routines used with the rpcbind stats facility.
+  */
+ 
+-#include <sys/cdefs.h>
+-
+ #include <rpc/rpc.h>
+ 
+ /* Link list of all the stats about getport and getaddr */
+diff --git a/src/rpcdname.c b/src/rpcdname.c
+index 094cea3..3e6a988 100644
+--- a/src/rpcdname.c
++++ b/src/rpcdname.c
+@@ -25,7 +25,6 @@
+  * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
+  * POSSIBILITY OF SUCH DAMAGE.
+  */
+-#include <sys/cdefs.h>
+ 
+ /*
+  * rpcdname.c
+diff --git a/src/svc_dg.c b/src/svc_dg.c
+index 6e00191..5bbf683 100644
+--- a/src/svc_dg.c
++++ b/src/svc_dg.c
+@@ -31,8 +31,6 @@
+  * Copyright (c) 1986-1991 by Sun Microsystems Inc.
+  */
+ 
+-#include <sys/cdefs.h>
+-
+ /*
+  * svc_dg.c, Server side for connectionless RPC.
+  *
+diff --git a/src/svc_simple.c b/src/svc_simple.c
+index b6c371e..670bdf1 100644
+--- a/src/svc_simple.c
++++ b/src/svc_simple.c
+@@ -29,8 +29,6 @@
+  * Copyright (c) 1986-1991 by Sun Microsystems Inc. 
+  */
+ 
+-#include <sys/cdefs.h>
+-
+ /*
+  * svc_simple.c
+  * Simplified front end to rpc.
+diff --git a/src/svc_vc.c b/src/svc_vc.c
+index 4c70de8..06a275b 100644
+--- a/src/svc_vc.c
++++ b/src/svc_vc.c
+@@ -27,8 +27,6 @@
+  * POSSIBILITY OF SUCH DAMAGE.
+  */
+ 
+-#include <sys/cdefs.h>
+-
+ /*
+  * svc_vc.c, Server side for Connection Oriented based RPC. 
+  *
+diff --git a/src/xdr.c b/src/xdr.c
+index 1142a88..b19d15d 100644
+--- a/src/xdr.c
++++ b/src/xdr.c
+@@ -26,8 +26,6 @@
+  * POSSIBILITY OF SUCH DAMAGE.
+  */
+ 
+-#include <sys/cdefs.h>
+-
+ /*
+  * xdr.c, Generic XDR routines implementation.
+  *
+diff --git a/src/xdr_array.c b/src/xdr_array.c
+index 216173d..5776368 100644
+--- a/src/xdr_array.c
++++ b/src/xdr_array.c
+@@ -27,8 +27,6 @@
+  * POSSIBILITY OF SUCH DAMAGE.
+  */
+ 
+-#include <sys/cdefs.h>
+-
+ /*
+  * xdr_array.c, Generic XDR routines impelmentation.
+  *
+diff --git a/src/xdr_float.c b/src/xdr_float.c
+index 90daf3f..854a155 100644
+--- a/src/xdr_float.c
++++ b/src/xdr_float.c
+@@ -27,8 +27,6 @@
+  * POSSIBILITY OF SUCH DAMAGE.
+  */
+ 
+-#include <sys/cdefs.h>
+-
+ /*
+  * xdr_float.c, Generic XDR routines implementation.
+  *
+diff --git a/src/xdr_mem.c b/src/xdr_mem.c
+index bd86f00..cec273b 100644
+--- a/src/xdr_mem.c
++++ b/src/xdr_mem.c
+@@ -26,8 +26,6 @@
+  * POSSIBILITY OF SUCH DAMAGE.
+  */
+ 
+-#include <sys/cdefs.h>
+-
+ /*
+  * xdr_mem.h, XDR implementation using memory buffers.
+  *
+diff --git a/src/xdr_rec.c b/src/xdr_rec.c
+index 2aca623..16de7a8 100644
+--- a/src/xdr_rec.c
++++ b/src/xdr_rec.c
+@@ -27,9 +27,6 @@
+  * POSSIBILITY OF SUCH DAMAGE.
+  */
+ 
+-#include <sys/cdefs.h>
+-#include <sys/cdefs.h>
+-
+ /*
+  * xdr_rec.c, Implements TCP/IP based XDR streams with a "record marking"
+  * layer above tcp (for rpc's use).
+diff --git a/src/xdr_reference.c b/src/xdr_reference.c
+index affe19e..df68ca5 100644
+--- a/src/xdr_reference.c
++++ b/src/xdr_reference.c
+@@ -26,9 +26,6 @@
+  * POSSIBILITY OF SUCH DAMAGE.
+  */
+ 
+-#include <sys/cdefs.h>
+-#include <sys/cdefs.h>
+-
+ /*
+  * xdr_reference.c, Generic XDR routines impelmentation.
+  *
+diff --git a/src/xdr_sizeof.c b/src/xdr_sizeof.c
+index a805e31..0d068ce 100644
+--- a/src/xdr_sizeof.c
++++ b/src/xdr_sizeof.c
+@@ -34,8 +34,6 @@
+  * when serialized using XDR.
+  */
+ 
+-#include <sys/cdefs.h>
+-
+ #include <rpc/types.h>
+ #include <rpc/xdr.h>
+ #include <sys/types.h>
+diff --git a/src/xdr_stdio.c b/src/xdr_stdio.c
+index 45b1150..a3aa9f9 100644
+--- a/src/xdr_stdio.c
++++ b/src/xdr_stdio.c
+@@ -26,8 +26,6 @@
+  * POSSIBILITY OF SUCH DAMAGE.
+  */
+ 
+-#include <sys/cdefs.h>
+-
+ /*
+  * xdr_stdio.c, XDR implementation on standard i/o file.
+  *
+diff --git a/tirpc/netconfig.h b/tirpc/netconfig.h
+index 7d6c2bc..b513e98 100644
+--- a/tirpc/netconfig.h
++++ b/tirpc/netconfig.h
+@@ -74,7 +74,9 @@ typedef struct {
+ #define NC_UDP		"udp"
+ #define NC_ICMP		"icmp"
+ 
+-__BEGIN_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ extern void *setnetconfig (void);
+ extern struct netconfig *getnetconfig (void *);
+@@ -89,6 +91,8 @@ extern int endnetpath (void *);
+ extern void nc_perror (const char *);
+ extern char *nc_sperror (void);
+ 
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ #endif /* _NETCONFIG_H_ */
+diff --git a/tirpc/rpc/auth.h b/tirpc/rpc/auth.h
+index b894e44..f449aba 100644
+--- a/tirpc/rpc/auth.h
++++ b/tirpc/rpc/auth.h
+@@ -48,7 +48,6 @@
+ 
+ #include <rpc/xdr.h>
+ #include <rpc/clnt_stat.h>
+-#include <sys/cdefs.h>
+ #include <sys/socket.h>
+ #include <sys/types.h>
+ 
+@@ -164,9 +163,13 @@ union des_block {
+ 	char c[8];
+ };
+ typedef union des_block des_block;
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ extern bool_t xdr_des_block(XDR *, des_block *);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ /*
+  * Authentication info.  Opaque to client.
+@@ -277,9 +280,13 @@ auth_put(AUTH *auth)
+ 		xfunc, xwhere))
+ 
+ 
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ extern struct opaque_auth _null_auth;
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ /*
+  * Any style authentication.  These routines can be used by any
+@@ -300,11 +307,15 @@ int authany_wrap(void), authany_unwrap(void);
+  *	int len;
+  *	int *aup_gids;
+  */
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ extern AUTH *authunix_create(char *, uid_t, uid_t, int, uid_t *);
+ extern AUTH *authunix_create_default(void);	/* takes no parameters */
+ extern AUTH *authnone_create(void);		/* takes no parameters */
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ #if 0
+ /*
+@@ -315,16 +326,24 @@ __END_DECLS
+  * 	const char *timehost;			- optional hostname to sync with
+  * 	des_block *ckey;		- optional conversation key to use
+  */
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ extern AUTH *authdes_create (char *, u_int, struct sockaddr *, des_block *);
+ extern AUTH *authdes_seccreate (const char *, const u_int, const  char *,
+     const  des_block *);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ #endif
+ 
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ extern bool_t xdr_opaque_auth		(XDR *, struct opaque_auth *);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ #define authsys_create(c,i1,i2,i3,ip) authunix_create((c),(i1),(i2),(i3),(ip))
+ #define authsys_create_default() authunix_create_default()
+@@ -332,36 +351,48 @@ __END_DECLS
+ /*
+  * Netname manipulation routines.
+  */
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ extern int getnetname(char *);
+ extern int host2netname(char *, const char *, const char *);
+ extern int user2netname(char *, const uid_t, const char *);
+ extern int netname2user(char *, uid_t *, gid_t *, int *, gid_t *);
+ extern int netname2host(char *, char *, const int);
+ extern void passwd2des ( char *, char * );
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ /*
+  *
+  * These routines interface to the keyserv daemon
+  *
+  */
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ extern int key_decryptsession(const char *, des_block *);
+ extern int key_encryptsession(const char *, des_block *);
+ extern int key_gendes(des_block *);
+ extern int key_setsecret(const char *);
+ extern int key_secretkey_is_set(void);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ /*
+  * Publickey routines.
+  */
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ extern int getpublickey (const char *, char *);
+ extern int getpublicandprivatekey (char *, char *);
+ extern int getsecretkey (char *, char *, char *);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ #ifdef KERBEROS
+ /*
+@@ -374,10 +405,14 @@ __END_DECLS
+  *	const char *timehost;			- optional hostname to sync with
+  *	int *status;				- kerberos status returned
+  */
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ extern AUTH	*authkerb_seccreate(const char *, const char *, const  char *,
+ 		    const u_int, const char *, int *);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ /*
+  * Map a kerberos credential into a unix cred.
+@@ -390,19 +425,27 @@ __END_DECLS
+  *	int *groups;
+  *
+  */
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ extern int	authkerb_getucred(/* struct svc_req *, uid_t *, gid_t *,
+ 		    short *, int * */);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ #endif /* KERBEROS */
+ 
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ struct svc_req;
+ struct rpc_msg;
+ enum auth_stat _svcauth_none (struct svc_req *, struct rpc_msg *);
+ enum auth_stat _svcauth_short (struct svc_req *, struct rpc_msg *);
+ enum auth_stat _svcauth_unix (struct svc_req *, struct rpc_msg *);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ #define AUTH_NONE	0		/* no authentication */
+ #define	AUTH_NULL	0		/* backward compatibility */
+diff --git a/tirpc/rpc/auth_des.h b/tirpc/rpc/auth_des.h
+index 39b5332..2e47a67 100644
+--- a/tirpc/rpc/auth_des.h
++++ b/tirpc/rpc/auth_des.h
+@@ -114,17 +114,25 @@ struct authdes_verf {
+  * Map a des credential into a unix cred.
+  *
+  */
+-__BEGIN_DECLS
++#ifdef __cplusplus
++}
++#endif
+ extern int authdes_getucred( struct authdes_cred *, uid_t *, gid_t *, int *, gid_t * );
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+-__BEGIN_DECLS
++#ifdef __cplusplus
++}
++#endif
+ extern bool_t	xdr_authdes_cred(XDR *, struct authdes_cred *);
+ extern bool_t	xdr_authdes_verf(XDR *, struct authdes_verf *);
+ extern int	rtime(dev_t, struct netbuf *, int, struct timeval *,
+ 		    struct timeval *);
+ extern void	kgetnetname(char *);
+ extern enum auth_stat _svcauth_des(struct svc_req *, struct rpc_msg *);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ #endif /* ndef _TI_AUTH_DES_ */
+diff --git a/tirpc/rpc/auth_gss.h b/tirpc/rpc/auth_gss.h
+index d6f2bbd..c5f5ed5 100644
+--- a/tirpc/rpc/auth_gss.h
++++ b/tirpc/rpc/auth_gss.h
+@@ -104,7 +104,9 @@ struct rpc_gss_init_res {
+ #define MAXSEQ		0x80000000
+ 
+ /* Prototypes. */
+-__BEGIN_DECLS
++#ifdef __cplusplus
++}
++#endif
+ bool_t	xdr_rpc_gss_cred	__P((XDR *xdrs, struct rpc_gss_cred *p));
+ bool_t	xdr_rpc_gss_init_args	__P((XDR *xdrs, gss_buffer_desc *p));
+ bool_t	xdr_rpc_gss_init_res	__P((XDR *xdrs, struct rpc_gss_init_res *p));
+@@ -126,6 +128,8 @@ void	gss_log_status		__P((char *m, OM_uint32 major,
+ 				     OM_uint32 minor));
+ void	gss_log_hexdump		__P((const u_char *buf, int len, int offset));
+ 
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ #endif /* !_TIRPC_AUTH_GSS_H */
+diff --git a/tirpc/rpc/auth_unix.h b/tirpc/rpc/auth_unix.h
+index 602889b..441cbe0 100644
+--- a/tirpc/rpc/auth_unix.h
++++ b/tirpc/rpc/auth_unix.h
+@@ -45,7 +45,6 @@
+ 
+ #ifndef _TIRPC_AUTH_UNIX_H
+ #define _TIRPC_AUTH_UNIX_H
+-#include <sys/cdefs.h>
+ 
+ /* The machine name is part of a credential; it may not exceed 255 bytes */
+ #define MAX_MACHINE_NAME 255
+@@ -67,9 +66,13 @@ struct authunix_parms {
+ 
+ #define authsys_parms authunix_parms
+ 
+-__BEGIN_DECLS
++#ifdef __cplusplus
++}
++#endif
+ extern bool_t xdr_authunix_parms(XDR *, struct authunix_parms *);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ /*
+  * If a response verifier has flavor AUTH_SHORT,
+diff --git a/tirpc/rpc/clnt.h b/tirpc/rpc/clnt.h
+index 9ee619e..4d9c616 100644
+--- a/tirpc/rpc/clnt.h
++++ b/tirpc/rpc/clnt.h
+@@ -42,7 +42,6 @@
+ #include <rpc/clnt_stat.h>
+ #include <rpc/auth.h>
+ 
+-#include <sys/cdefs.h>
+ #include <netconfig.h>
+ #include <sys/un.h>
+ 
+@@ -267,7 +266,9 @@ struct rpc_timers {
+  * Generic client creation routine. Supported protocols are those that
+  * belong to the nettype namespace (/etc/netconfig).
+  */
+-__BEGIN_DECLS
++#ifdef __cplusplus
++}
++#endif
+ extern CLIENT *clnt_create(const char *, const rpcprog_t, const rpcvers_t,
+ 			   const char *);
+ /*
+@@ -414,32 +415,46 @@ extern CLIENT *clnt_dg_create(const int, const struct netbuf *,
+  */
+ extern CLIENT *clnt_raw_create(rpcprog_t, rpcvers_t);
+ 
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ 
+ /*
+  * Print why creation failed
+  */
+-__BEGIN_DECLS
++#ifdef __cplusplus
++}
++#endif
+ extern void clnt_pcreateerror(const char *);			/* stderr */
+ extern char *clnt_spcreateerror(const char *);			/* string */
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ /*
+  * Like clnt_perror(), but is more verbose in its output
+  */
+-__BEGIN_DECLS
++#ifdef __cplusplus
++}
++#endif
+ extern void clnt_perrno(enum clnt_stat);		/* stderr */
+ extern char *clnt_sperrno(enum clnt_stat);		/* string */
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ /*
+  * Print an English error message, given the client error code
+  */
+-__BEGIN_DECLS
++#ifdef __cplusplus
++}
++#endif
+ extern void clnt_perror(CLIENT *, const char *);	 	/* stderr */
+ extern char *clnt_sperror(CLIENT *, const char *);		/* string */
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ 
+ /*
+@@ -450,9 +465,13 @@ struct rpc_createerr {
+ 	struct rpc_err cf_error; /* useful when cf_stat == RPC_PMAPFAILURE */
+ };
+ 
+-__BEGIN_DECLS
++#ifdef __cplusplus
++}
++#endif
+ extern struct rpc_createerr	*__rpc_createerr(void);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ #define get_rpc_createerr()	(*(__rpc_createerr()))
+ #define rpc_createerr		(*(__rpc_createerr()))
+ 
+@@ -469,12 +488,16 @@ __END_DECLS
+  *	char *out;
+  *	const char *nettype;
+  */
+-__BEGIN_DECLS
++#ifdef __cplusplus
++}
++#endif
+ extern enum clnt_stat rpc_call(const char *, const rpcprog_t,
+ 			       const rpcvers_t, const rpcproc_t,
+ 			       const xdrproc_t, const char *,
+ 			       const xdrproc_t, char *, const char *);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ /*
+  * RPC broadcast interface
+@@ -522,7 +545,9 @@ __END_DECLS
+ 
+ typedef bool_t (*resultproc_t)(caddr_t, ...);
+ 
+-__BEGIN_DECLS
++#ifdef __cplusplus
++}
++#endif
+ extern enum clnt_stat rpc_broadcast(const rpcprog_t, const rpcvers_t,
+ 				    const rpcproc_t, const xdrproc_t,
+ 				    caddr_t, const xdrproc_t, caddr_t,
+@@ -532,7 +557,9 @@ extern enum clnt_stat rpc_broadcast_exp(const rpcprog_t, const rpcvers_t,
+ 					caddr_t, const xdrproc_t, caddr_t,
+ 					const resultproc_t, const int,
+ 					const int, const char *);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ /* For backward compatibility */
+ #include <rpc/clnt_soc.h>
+diff --git a/tirpc/rpc/clnt_soc.h b/tirpc/rpc/clnt_soc.h
+index 82330a3..1fe0b54 100644
+--- a/tirpc/rpc/clnt_soc.h
++++ b/tirpc/rpc/clnt_soc.h
+@@ -46,8 +46,6 @@
+  * with TS-RPC.
+  */
+ 
+-#include <sys/cdefs.h>
+-
+ #define UDPMSGSIZE      8800    /* rpc imposed limit on udp msg size */  
+ 
+ /*
+@@ -61,27 +59,39 @@
+  *	u_int sendsz;
+  *	u_int recvsz;
+  */
+-__BEGIN_DECLS
++#ifdef __cplusplus
++}
++#endif
+ extern CLIENT *clnttcp_create(struct sockaddr_in *, u_long, u_long, int *,
+ 			      u_int, u_int);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ /*
+  * Raw (memory) rpc.
+  */
+-__BEGIN_DECLS
++#ifdef __cplusplus
++}
++#endif
+ extern CLIENT *clntraw_create(u_long, u_long);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ 
+ /*
+ IPv6 socket version 
+ */
+ #ifdef INET6
+-__BEGIN_DECLS
++#ifdef __cplusplus
++}
++#endif
+ extern CLIENT *clnttcp6_create(struct sockaddr_in6 *, u_long, u_long, int *,
+ 			      u_int, u_int);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ #endif
+ 
+ /*
+@@ -105,7 +115,9 @@ __END_DECLS
+  *	u_int sendsz;
+  *	u_int recvsz;
+  */
+-__BEGIN_DECLS
++#ifdef __cplusplus
++}
++#endif
+ extern CLIENT *clntudp_create(struct sockaddr_in *, u_long, u_long, 
+ 			      struct timeval, int *);
+ extern CLIENT *clntudp_bufcreate(struct sockaddr_in *, u_long, u_long,
+@@ -116,7 +128,9 @@ extern CLIENT *clntudp6_create(struct sockaddr_in6 *, u_long, u_long,
+ extern CLIENT *clntudp6_bufcreate(struct sockaddr_in6 *, u_long, u_long,
+ 				 struct timeval, int *, u_int, u_int);
+ #endif
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ 
+ #endif /* _RPC_CLNT_SOC_H */
+diff --git a/tirpc/rpc/des_crypt.h b/tirpc/rpc/des_crypt.h
+index 837088c..b56f5c1 100644
+--- a/tirpc/rpc/des_crypt.h
++++ b/tirpc/rpc/des_crypt.h
+@@ -43,7 +43,6 @@
+ #ifndef _DES_DES_CRYPT_H
+ #define _DES_DES_CRYPT_H
+ 
+-#include <sys/cdefs.h>
+ #include <rpc/rpc.h>
+ 
+ #define DES_MAXDATA 8192	/* max bytes encrypted in one call */
+@@ -83,23 +82,35 @@
+ /*
+  * Cipher Block Chaining mode
+  */
+-__BEGIN_DECLS
++#ifdef __cplusplus
++}
++#endif
+ int cbc_crypt( char *, char *, unsigned int, unsigned int, char *);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ /*
+  * Electronic Code Book mode
+  */
+-__BEGIN_DECLS
++#ifdef __cplusplus
++}
++#endif
+ int ecb_crypt( char *, char *, unsigned int, unsigned int );
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ /* 
+  * Set des parity for a key.
+  * DES parity is odd and in the low bit of each byte
+  */
+-__BEGIN_DECLS
++#ifdef __cplusplus
++}
++#endif
+ void des_setparity( char *);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ #endif  /* _DES_DES_CRYPT_H */
+diff --git a/tirpc/rpc/nettype.h b/tirpc/rpc/nettype.h
+index 92063c6..6c5c719 100644
+--- a/tirpc/rpc/nettype.h
++++ b/tirpc/rpc/nettype.h
+@@ -53,11 +53,15 @@
+ #define	_RPC_TCP	7
+ #define	_RPC_UDP	8
+ 
+-__BEGIN_DECLS
++#ifdef __cplusplus
++}
++#endif
+ extern void *__rpc_setconf(const char *);
+ extern void __rpc_endconf(void *);
+ extern struct netconfig *__rpc_getconf(void *);
+ extern struct netconfig *__rpc_getconfip(const char *);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ #endif	/* !_TIRPC_NETTYPE_H */
+diff --git a/tirpc/rpc/pmap_clnt.h b/tirpc/rpc/pmap_clnt.h
+index 0d23908..538f4d5 100644
+--- a/tirpc/rpc/pmap_clnt.h
++++ b/tirpc/rpc/pmap_clnt.h
+@@ -63,9 +63,10 @@
+ 
+ #ifndef _RPC_PMAP_CLNT_H_
+ #define _RPC_PMAP_CLNT_H_
+-#include <sys/cdefs.h>
+ 
+-__BEGIN_DECLS
++#ifdef __cplusplus
++}
++#endif
+ extern bool_t		pmap_set(u_long, u_long, int, int);
+ extern bool_t		pmap_unset(u_long, u_long);
+ extern struct pmaplist	*pmap_getmaps(struct sockaddr_in *);
+@@ -80,6 +81,8 @@ extern enum clnt_stat	clnt_broadcast(u_long, u_long, u_long,
+ 				       resultproc_t);
+ extern u_short		pmap_getport(struct sockaddr_in *,
+ 				     u_long, u_long, u_int);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ #endif /* !_RPC_PMAP_CLNT_H_ */
+diff --git a/tirpc/rpc/pmap_prot.h b/tirpc/rpc/pmap_prot.h
+index c1a2546..a911484 100644
+--- a/tirpc/rpc/pmap_prot.h
++++ b/tirpc/rpc/pmap_prot.h
+@@ -71,7 +71,6 @@
+ 
+ #ifndef _RPC_PMAP_PROT_H
+ #define _RPC_PMAP_PROT_H
+-#include <sys/cdefs.h>
+ 
+ #define PMAPPORT		((u_short)111)
+ #define PMAPPROG		((u_long)100000)
+@@ -97,10 +96,14 @@ struct pmaplist {
+ 	struct pmaplist *pml_next;
+ };
+ 
+-__BEGIN_DECLS
++#ifdef __cplusplus
++}
++#endif
+ extern bool_t xdr_pmap(XDR *, struct pmap *);
+ extern bool_t xdr_pmaplist(XDR *, struct pmaplist **);
+ extern bool_t xdr_pmaplist_ptr(XDR *, struct pmaplist *);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ #endif /* !_RPC_PMAP_PROT_H */
+diff --git a/tirpc/rpc/pmap_rmt.h b/tirpc/rpc/pmap_rmt.h
+index dd59a15..b5b8935 100644
+--- a/tirpc/rpc/pmap_rmt.h
++++ b/tirpc/rpc/pmap_rmt.h
+@@ -41,7 +41,6 @@
+ 
+ #ifndef _RPC_PMAP_RMT_H
+ #define _RPC_PMAP_RMT_H
+-#include <sys/cdefs.h>
+ 
+ struct rmtcallargs {
+ 	u_long prog, vers, proc, arglen;
+@@ -56,9 +55,13 @@ struct rmtcallres {
+ 	xdrproc_t xdr_results;
+ };
+ 
+-__BEGIN_DECLS
++#ifdef __cplusplus
++}
++#endif
+ extern bool_t xdr_rmtcall_args(XDR *, struct rmtcallargs *);
+ extern bool_t xdr_rmtcallres(XDR *, struct rmtcallres *);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ #endif /* !_RPC_PMAP_RMT_H */
+diff --git a/tirpc/rpc/rpc.h b/tirpc/rpc/rpc.h
+index 6c0222e..43cbe40 100644
+--- a/tirpc/rpc/rpc.h
++++ b/tirpc/rpc/rpc.h
+@@ -79,7 +79,9 @@
+ #define UDPMSGSIZE 8800
+ #endif
+ 
+-__BEGIN_DECLS
++#ifdef __cplusplus
++}
++#endif
+ extern int get_myaddress(struct sockaddr_in *);
+ extern int bindresvport(int, struct sockaddr_in *) __THROW;
+ extern int registerrpc(int, int, int, char *(*)(char [UDPMSGSIZE]),
+@@ -93,18 +95,24 @@ struct netbuf *uaddr2taddr(const struct netconfig *, const char *);
+ 
+ struct sockaddr;
+ extern int bindresvport_sa(int, struct sockaddr *);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ /*
+  * The following are not exported interfaces, they are for internal library
+  * and rpcbind use only. Do not use, they may change without notice.
+  */
+-__BEGIN_DECLS
++#ifdef __cplusplus
++}
++#endif
+ int __rpc_nconf2fd(const struct netconfig *);
+ int __rpc_nconf2fd_flags(const struct netconfig *, int);
+ int __rpc_nconf2sockinfo(const struct netconfig *, struct __rpc_sockinfo *);
+ int __rpc_fd2sockinfo(int, struct __rpc_sockinfo *);
+ u_int __rpc_get_t_size(int, int, int);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ #endif /* !_RPC_RPC_H */
+diff --git a/tirpc/rpc/rpc_com.h b/tirpc/rpc/rpc_com.h
+index cb3bbbb..5d35b5b 100644
+--- a/tirpc/rpc/rpc_com.h
++++ b/tirpc/rpc/rpc_com.h
+@@ -41,8 +41,6 @@
+ #ifndef _RPC_RPCCOM_H
+ #define	_RPC_RPCCOM_H
+ 
+-#include <sys/cdefs.h>
+-
+ /* #pragma ident	"@(#)rpc_com.h	1.11	93/07/05 SMI" */
+ 
+ /*
+@@ -55,7 +53,9 @@
+ #define __RPC_GETXID(now) ((u_int32_t)getpid() ^ (u_int32_t)(now)->tv_sec ^ \
+     (u_int32_t)(now)->tv_usec)
+ 
+-__BEGIN_DECLS
++#ifdef __cplusplus
++}
++#endif
+ extern u_int __rpc_get_a_size(int);
+ extern int __rpc_dtbsize(void);
+ extern int _rpc_dtablesize(void);
+@@ -77,6 +77,8 @@ bool_t rpc_control(int,void *);
+ 
+ char *_get_next_token(char *, int);
+ 
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ #endif /* _RPC_RPCCOM_H */
+diff --git a/tirpc/rpc/rpc_msg.h b/tirpc/rpc/rpc_msg.h
+index 16d8eef..b05d3f0 100644
+--- a/tirpc/rpc/rpc_msg.h
++++ b/tirpc/rpc/rpc_msg.h
+@@ -161,7 +161,9 @@ struct rpc_msg {
+ #define	acpted_rply	ru.RM_rmb.ru.RP_ar
+ #define	rjcted_rply	ru.RM_rmb.ru.RP_dr
+ 
+-__BEGIN_DECLS
++#ifdef __cplusplus
++}
++#endif
+ /*
+  * XDR routine to handle a rpc message.
+  * xdr_callmsg(xdrs, cmsg)
+@@ -210,6 +212,8 @@ extern bool_t	xdr_rejected_reply(XDR *, struct rejected_reply *);
+  * 	struct rpc_err *error;
+  */
+ extern void	_seterr_reply(struct rpc_msg *, struct rpc_err *);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ #endif /* !_TIRPC_RPC_MSG_H */
+diff --git a/tirpc/rpc/rpcb_clnt.h b/tirpc/rpc/rpcb_clnt.h
+index 7e64f8f..1d08431 100644
+--- a/tirpc/rpc/rpcb_clnt.h
++++ b/tirpc/rpc/rpcb_clnt.h
+@@ -59,7 +59,9 @@
+ 
+ #include <rpc/types.h>
+ #include <rpc/rpcb_prot.h>
+-__BEGIN_DECLS
++#ifdef __cplusplus
++}
++#endif
+ extern bool_t rpcb_set(const rpcprog_t, const rpcvers_t,
+ 		       const struct netconfig  *, const struct netbuf *);
+ extern bool_t rpcb_unset(const rpcprog_t, const rpcvers_t,
+@@ -78,6 +80,8 @@ extern bool_t rpcb_getaddr(const rpcprog_t, const rpcvers_t,
+ extern bool_t rpcb_gettime(const char *, time_t *);
+ extern char *rpcb_taddr2uaddr(struct netconfig *, struct netbuf *);
+ extern struct netbuf *rpcb_uaddr2taddr(struct netconfig *, char *);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ #endif	/* !_RPC_RPCB_CLNT_H */
+diff --git a/tirpc/rpc/rpcent.h b/tirpc/rpc/rpcent.h
+index 45775ed..0674ec6 100644
+--- a/tirpc/rpc/rpcent.h
++++ b/tirpc/rpc/rpcent.h
+@@ -44,7 +44,9 @@
+ /*	#pragma ident "@(#)rpcent.h   1.13    94/04/25 SMI"	*/
+ /*      @(#)rpcent.h 1.1 88/12/06 SMI   */
+ 
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ 
+ /* These are defined in /usr/include/rpc/netdb.h, unless we are using
+    the C library without RPC support. */
+@@ -63,6 +65,8 @@ extern struct rpcent *getrpcent(void);
+ 
+ extern void setrpcent(int) __THROW;
+ extern void endrpcent(void) __THROW;
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ #endif /* !_RPC_CENT_H */
+diff --git a/tirpc/rpc/svc.h b/tirpc/rpc/svc.h
+index b9691a8..19cda5b 100644
+--- a/tirpc/rpc/svc.h
++++ b/tirpc/rpc/svc.h
+@@ -40,7 +40,6 @@
+ 
+ #ifndef _TIRPC_SVC_H
+ #define _TIRPC_SVC_H
+-#include <sys/cdefs.h>
+ 
+ /*
+  * This interface must manage two items concerning remote procedure calling:
+@@ -200,11 +199,15 @@ struct svc_req {
+  *	const struct netconfig *nconf;
+  */
+ 
+-__BEGIN_DECLS
++#ifdef __cplusplus
++}
++#endif
+ extern bool_t	svc_reg(SVCXPRT *, const rpcprog_t, const rpcvers_t,
+ 			void (*)(struct svc_req *, SVCXPRT *),
+ 			const struct netconfig *);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ /*
+  * Service un-registration
+@@ -214,9 +217,13 @@ __END_DECLS
+  *	const rpcvers_t vers;
+  */
+ 
+-__BEGIN_DECLS
++#ifdef __cplusplus
++}
++#endif
+ extern void	svc_unreg(const rpcprog_t, const rpcvers_t);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ /*
+  * Transport registration.
+@@ -224,9 +231,13 @@ __END_DECLS
+  * xprt_register(xprt)
+  *	SVCXPRT *xprt;
+  */
+-__BEGIN_DECLS
++#ifdef __cplusplus
++}
++#endif
+ extern void	xprt_register(SVCXPRT *);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ /*
+  * Transport un-register
+@@ -234,9 +245,13 @@ __END_DECLS
+  * xprt_unregister(xprt)
+  *	SVCXPRT *xprt;
+  */
+-__BEGIN_DECLS
++#ifdef __cplusplus
++}
++#endif
+ extern void	xprt_unregister(SVCXPRT *);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ 
+ /*
+@@ -265,7 +280,9 @@ __END_DECLS
+  * deadlock the caller and server processes!
+  */
+ 
+-__BEGIN_DECLS
++#ifdef __cplusplus
++}
++#endif
+ extern bool_t	svc_sendreply(SVCXPRT *, xdrproc_t, void *);
+ extern void	svcerr_decode(SVCXPRT *);
+ extern void	svcerr_weakauth(SVCXPRT *);
+@@ -277,7 +294,9 @@ extern void	svcerr_systemerr(SVCXPRT *);
+ extern int	rpc_reg(rpcprog_t, rpcvers_t, rpcproc_t,
+ 			char *(*)(char *), xdrproc_t, xdrproc_t,
+ 			char *);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ /*
+  * Lowest level dispatching -OR- who owns this process anyway.
+@@ -306,11 +325,17 @@ extern int svc_fds;
+  * a small program implemented by the svc_rpc implementation itself;
+  * also see clnt.h for protocol numbers.
+  */
+-__BEGIN_DECLS
++#ifdef __cplusplus
++}
++#endif
+ extern void rpctest_service(void);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+-__BEGIN_DECLS
++#ifdef __cplusplus
++}
++#endif
+ extern void	svc_getreq(int);
+ extern void	svc_getreqset(fd_set *);
+ extern void	svc_getreq_common(int);
+@@ -319,7 +344,9 @@ extern void	svc_getreq_poll(struct pollfd *, int);
+ 
+ extern void	svc_run(void);
+ extern void	svc_exit(void);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ /*
+  * Socket to use on svcxxx_create call to get default socket
+@@ -331,7 +358,9 @@ __END_DECLS
+  * These are the existing service side transport implementations
+  */
+ 
+-__BEGIN_DECLS
++#ifdef __cplusplus
++}
++#endif
+ /*
+  * Transport independent svc_create routine.
+  */
+@@ -427,7 +456,9 @@ int svc_dg_enablecache(SVCXPRT *, const u_int);
+ 
+ int __rpc_get_local_uid(SVCXPRT *_transp, uid_t *_uid);
+ 
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ 
+ /* for backward compatibility */
+diff --git a/tirpc/rpc/svc_auth.h b/tirpc/rpc/svc_auth.h
+index 14269d1..47cf706 100644
+--- a/tirpc/rpc/svc_auth.h
++++ b/tirpc/rpc/svc_auth.h
+@@ -65,11 +65,15 @@ typedef struct SVCAUTH {
+ /*
+  * Server side authenticator
+  */
+-__BEGIN_DECLS
++#ifdef __cplusplus
++}
++#endif
+ extern enum auth_stat _authenticate(struct svc_req *, struct rpc_msg *);
+ extern int svc_auth_reg(int, enum auth_stat (*)(struct svc_req *,
+ 			  struct rpc_msg *));
+ 
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ #endif /* !_RPC_SVC_AUTH_H */
+diff --git a/tirpc/rpc/svc_soc.h b/tirpc/rpc/svc_soc.h
+index 6148d7b..641921d 100644
+--- a/tirpc/rpc/svc_soc.h
++++ b/tirpc/rpc/svc_soc.h
+@@ -38,7 +38,6 @@
+ 
+ #ifndef _RPC_SVC_SOC_H
+ #define _RPC_SVC_SOC_H
+-#include <sys/cdefs.h>
+ 
+ /* #pragma ident   "@(#)svc_soc.h  1.11    94/04/25 SMI" */
+ /*      svc_soc.h 1.8 89/05/01 SMI      */
+@@ -64,10 +63,14 @@
+  *	void (*dispatch)();
+  *	int protocol;    like TCP or UDP, zero means do not register 
+  */
+-__BEGIN_DECLS
++#ifdef __cplusplus
++}
++#endif
+ extern bool_t	svc_register(SVCXPRT *, u_long, u_long,
+ 		    void (*)(struct svc_req *, SVCXPRT *), int);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ /*
+  * Service un-registration
+@@ -76,44 +79,64 @@ __END_DECLS
+  *	u_long prog;
+  *	u_long vers;
+  */
+-__BEGIN_DECLS
++#ifdef __cplusplus
++}
++#endif
+ extern void	svc_unregister(u_long, u_long);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ 
+ /*
+  * Memory based rpc for testing and timing.
+  */
+-__BEGIN_DECLS
++#ifdef __cplusplus
++}
++#endif
+ extern SVCXPRT *svcraw_create(void);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ 
+ /*
+  * Udp based rpc.
+  */
+-__BEGIN_DECLS
++#ifdef __cplusplus
++}
++#endif
+ extern SVCXPRT *svcudp_create(int);
+ extern SVCXPRT *svcudp_bufcreate(int, u_int, u_int);
+ extern int svcudp_enablecache(SVCXPRT *, u_long);
+ extern SVCXPRT *svcudp6_create(int);
+ extern SVCXPRT *svcudp6_bufcreate(int, u_int, u_int);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ 
+ /*
+  * Tcp based rpc.
+  */
+-__BEGIN_DECLS
++#ifdef __cplusplus
++}
++#endif
+ extern SVCXPRT *svctcp_create(int, u_int, u_int);
+ extern SVCXPRT *svctcp6_create(int, u_int, u_int);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ /*
+  * Fd based rpc.
+  */
+-__BEGIN_DECLS
++#ifdef __cplusplus
++}
++#endif
+ extern SVCXPRT *svcfd_create(int, u_int, u_int);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ #endif /* !_RPC_SVC_SOC_H */
+diff --git a/tirpc/rpc/xdr.h b/tirpc/rpc/xdr.h
+index 613fab0..0202cea 100644
+--- a/tirpc/rpc/xdr.h
++++ b/tirpc/rpc/xdr.h
+@@ -40,7 +40,6 @@
+ 
+ #ifndef _TIRPC_XDR_H
+ #define _TIRPC_XDR_H
+-#include <sys/cdefs.h>
+ #include <stdio.h>
+ #include <netinet/in.h>
+ 
+@@ -287,7 +286,9 @@ struct xdr_discrim {
+ /*
+  * These are the "generic" xdr routines.
+  */
+-__BEGIN_DECLS
++#ifdef __cplusplus
++}
++#endif
+ extern bool_t	xdr_void(void);
+ extern bool_t	xdr_int(XDR *, int *);
+ extern bool_t	xdr_u_int(XDR *, u_int *);
+@@ -330,7 +331,9 @@ extern bool_t	xdr_hyper(XDR *, quad_t *);
+ extern bool_t	xdr_u_hyper(XDR *, u_quad_t *);
+ extern bool_t	xdr_longlong_t(XDR *, quad_t *);
+ extern bool_t	xdr_u_longlong_t(XDR *, u_quad_t *);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ /*
+  * Common opaque bytes objects used by many rpc protocols;
+@@ -348,7 +351,9 @@ extern bool_t   xdr_netobj(XDR *, struct netobj *);
+  * These are the public routines for the various implementations of
+  * xdr streams.
+  */
+-__BEGIN_DECLS
++#ifdef __cplusplus
++}
++#endif
+ /* XDR using memory buffers */
+ extern void   xdrmem_create(XDR *, char *, u_int, enum xdr_op);
+ 
+@@ -369,6 +374,8 @@ extern bool_t xdrrec_skiprecord(XDR *);
+ /* true if no more input */
+ extern bool_t xdrrec_eof(XDR *);
+ extern u_int xdrrec_readbytes(XDR *, caddr_t, u_int);
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ #endif /* !_TIRPC_XDR_H */
+diff --git a/tirpc/rpcsvc/crypt.x b/tirpc/rpcsvc/crypt.x
+index b50cf8d..413c17e 100644
+--- a/tirpc/rpcsvc/crypt.x
++++ b/tirpc/rpcsvc/crypt.x
+@@ -31,7 +31,6 @@
+  */
+ 
+ #ifndef RPC_HDR
+-%#include <sys/cdefs.h>
+ %__FBSDID("$FreeBSD: src/include/rpcsvc/crypt.x,v 1.5 2003/05/04 02:51:42 obrien Exp $");
+ #endif
+ 
+-- 
+2.3.7
+
diff --git a/package/libtirpc/0011-Add-missing-define-for-__THROW.patch b/package/libtirpc/0011-Add-missing-define-for-__THROW.patch
new file mode 100644
index 0000000..0ce6f88
--- /dev/null
+++ b/package/libtirpc/0011-Add-missing-define-for-__THROW.patch
@@ -0,0 +1,33 @@
+From 55bb302be4dc91242f7b41e5f878004633d9d7d3 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Tue, 5 May 2015 16:49:04 +0200
+Subject: [PATCH 11/16] Add missing define for __THROW
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The musl C library does not have it.
+
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+---
+ tirpc/rpc/rpcent.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/tirpc/rpc/rpcent.h b/tirpc/rpc/rpcent.h
+index 0674ec6..7bfc035 100644
+--- a/tirpc/rpc/rpcent.h
++++ b/tirpc/rpc/rpcent.h
+@@ -41,6 +41,10 @@
+ #ifndef _RPC_RPCENT_H
+ #define _RPC_RPCENT_H
+ 
++#ifndef __THROW
++#define __THROW
++#endif
++
+ /*	#pragma ident "@(#)rpcent.h   1.13    94/04/25 SMI"	*/
+ /*      @(#)rpcent.h 1.1 88/12/06 SMI   */
+ 
+-- 
+2.3.7
+
diff --git a/package/libtirpc/0012-Replace-sys-queue.h-with-a-local-bsdqueue.h.patch b/package/libtirpc/0012-Replace-sys-queue.h-with-a-local-bsdqueue.h.patch
new file mode 100644
index 0000000..7cdd45d
--- /dev/null
+++ b/package/libtirpc/0012-Replace-sys-queue.h-with-a-local-bsdqueue.h.patch
@@ -0,0 +1,903 @@
+From 7c337ac4f6fa260e3c25820f780d24329d85e027 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Tue, 5 May 2015 17:06:03 +0200
+Subject: [PATCH 12/16] Replace sys/queue.h with a local bsdqueue.h
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Not all systems provide a sys/queue.h implementation. For example the the musl
+C library does not and will not have it [1].
+
+sys/queue.h first appeared in 4.4BSD and is used in all 4.4BSD variants. Note
+that glibc' sys/queue.h is a patched version of this 4.4BDS header (adds
+STAILQ_CONCAT and TAILQ_CONCAT).
+
+There exists several implementations of sys/queue.h. Lets use the version from
+the NetBSD project [2] and provide it as a local header file "bsdqueue.h"
+
+[1] http://wiki.musl-libc.org/wiki/FAQ#Q:_why_is_sys.2Fqueue.h_not_included_.3F
+[2] http://cvsweb.netbsd.org/bsdweb.cgi/src/sys/sys/queue.h?rev=1.68
+
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+---
+ src/clnt_bcast.c |   2 +-
+ tirpc/bsdqueue.h | 846 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 847 insertions(+), 1 deletion(-)
+ create mode 100644 tirpc/bsdqueue.h
+
+diff --git a/src/clnt_bcast.c b/src/clnt_bcast.c
+index 262b2ab..3ed8457 100644
+--- a/src/clnt_bcast.c
++++ b/src/clnt_bcast.c
+@@ -40,7 +40,6 @@
+  */
+ #include <sys/socket.h>
+ #include <sys/types.h>
+-#include <sys/queue.h>
+ 
+ #include <net/if.h>
+ #include <netinet/in.h>
+@@ -64,6 +63,7 @@
+ #include <err.h>
+ #include <string.h>
+ 
++#include "bsdqueue.h"
+ #include "rpc_com.h"
+ 
+ #define	MAXBCAST 20	/* Max no of broadcasting transports */
+diff --git a/tirpc/bsdqueue.h b/tirpc/bsdqueue.h
+new file mode 100644
+index 0000000..99d01a5
+--- /dev/null
++++ b/tirpc/bsdqueue.h
+@@ -0,0 +1,846 @@
++/*	$NetBSD: queue.h,v 1.68 2014/11/19 08:10:01 uebayasi Exp $	*/
++
++/*
++ * Copyright (c) 1991, 1993
++ *	The Regents of the University of California.  All rights reserved.
++ *
++ * Redistribution and use in source and binary forms, with or without
++ * modification, are permitted provided that the following conditions
++ * are met:
++ * 1. Redistributions of source code must retain the above copyright
++ *    notice, this list of conditions and the following disclaimer.
++ * 2. Redistributions in binary form must reproduce the above copyright
++ *    notice, this list of conditions and the following disclaimer in the
++ *    documentation and/or other materials provided with the distribution.
++ * 3. Neither the name of the University nor the names of its contributors
++ *    may be used to endorse or promote products derived from this software
++ *    without specific prior written permission.
++ *
++ * THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND
++ * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
++ * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
++ * ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
++ * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
++ * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
++ * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
++ * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
++ * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
++ * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
++ * SUCH DAMAGE.
++ *
++ *	@(#)queue.h	8.5 (Berkeley) 8/20/94
++ */
++
++#ifndef	_SYS_QUEUE_H_
++#define	_SYS_QUEUE_H_
++
++/*
++ * This file defines five types of data structures: singly-linked lists,
++ * lists, simple queues, tail queues, and circular queues.
++ *
++ * A singly-linked list is headed by a single forward pointer. The
++ * elements are singly linked for minimum space and pointer manipulation
++ * overhead at the expense of O(n) removal for arbitrary elements. New
++ * elements can be added to the list after an existing element or at the
++ * head of the list.  Elements being removed from the head of the list
++ * should use the explicit macro for this purpose for optimum
++ * efficiency. A singly-linked list may only be traversed in the forward
++ * direction.  Singly-linked lists are ideal for applications with large
++ * datasets and few or no removals or for implementing a LIFO queue.
++ *
++ * A list is headed by a single forward pointer (or an array of forward
++ * pointers for a hash table header). The elements are doubly linked
++ * so that an arbitrary element can be removed without a need to
++ * traverse the list. New elements can be added to the list before
++ * or after an existing element or at the head of the list. A list
++ * may only be traversed in the forward direction.
++ *
++ * A simple queue is headed by a pair of pointers, one the head of the
++ * list and the other to the tail of the list. The elements are singly
++ * linked to save space, so elements can only be removed from the
++ * head of the list. New elements can be added to the list after
++ * an existing element, at the head of the list, or at the end of the
++ * list. A simple queue may only be traversed in the forward direction.
++ *
++ * A tail queue is headed by a pair of pointers, one to the head of the
++ * list and the other to the tail of the list. The elements are doubly
++ * linked so that an arbitrary element can be removed without a need to
++ * traverse the list. New elements can be added to the list before or
++ * after an existing element, at the head of the list, or at the end of
++ * the list. A tail queue may be traversed in either direction.
++ *
++ * A circle queue is headed by a pair of pointers, one to the head of the
++ * list and the other to the tail of the list. The elements are doubly
++ * linked so that an arbitrary element can be removed without a need to
++ * traverse the list. New elements can be added to the list before or after
++ * an existing element, at the head of the list, or at the end of the list.
++ * A circle queue may be traversed in either direction, but has a more
++ * complex end of list detection.
++ *
++ * For details on the use of these macros, see the queue(3) manual page.
++ */
++
++/*
++ * Include the definition of NULL only on NetBSD because sys/null.h
++ * is not available elsewhere.  This conditional makes the header
++ * portable and it can simply be dropped verbatim into any system.
++ * The caveat is that on other systems some other header
++ * must provide NULL before the macros can be used.
++ */
++#ifdef __NetBSD__
++#include <sys/null.h>
++#endif
++
++#if defined(QUEUEDEBUG)
++# if defined(_KERNEL)
++#  define QUEUEDEBUG_ABORT(...) panic(__VA_ARGS__)
++# else
++#  include <err.h>
++#  define QUEUEDEBUG_ABORT(...) err(1, __VA_ARGS__)
++# endif
++#endif
++
++/*
++ * Singly-linked List definitions.
++ */
++#define	SLIST_HEAD(name, type)						\
++struct name {								\
++	struct type *slh_first;	/* first element */			\
++}
++
++#define	SLIST_HEAD_INITIALIZER(head)					\
++	{ NULL }
++
++#define	SLIST_ENTRY(type)						\
++struct {								\
++	struct type *sle_next;	/* next element */			\
++}
++
++/*
++ * Singly-linked List access methods.
++ */
++#define	SLIST_FIRST(head)	((head)->slh_first)
++#define	SLIST_END(head)		NULL
++#define	SLIST_EMPTY(head)	((head)->slh_first == NULL)
++#define	SLIST_NEXT(elm, field)	((elm)->field.sle_next)
++
++#define	SLIST_FOREACH(var, head, field)					\
++	for((var) = (head)->slh_first;					\
++	    (var) != SLIST_END(head);					\
++	    (var) = (var)->field.sle_next)
++
++#define	SLIST_FOREACH_SAFE(var, head, field, tvar)			\
++	for ((var) = SLIST_FIRST((head));				\
++	    (var) != SLIST_END(head) &&					\
++	    ((tvar) = SLIST_NEXT((var), field), 1);			\
++	    (var) = (tvar))
++
++/*
++ * Singly-linked List functions.
++ */
++#define	SLIST_INIT(head) do {						\
++	(head)->slh_first = SLIST_END(head);				\
++} while (/*CONSTCOND*/0)
++
++#define	SLIST_INSERT_AFTER(slistelm, elm, field) do {			\
++	(elm)->field.sle_next = (slistelm)->field.sle_next;		\
++	(slistelm)->field.sle_next = (elm);				\
++} while (/*CONSTCOND*/0)
++
++#define	SLIST_INSERT_HEAD(head, elm, field) do {			\
++	(elm)->field.sle_next = (head)->slh_first;			\
++	(head)->slh_first = (elm);					\
++} while (/*CONSTCOND*/0)
++
++#define	SLIST_REMOVE_AFTER(slistelm, field) do {			\
++	(slistelm)->field.sle_next =					\
++	    SLIST_NEXT(SLIST_NEXT((slistelm), field), field);		\
++} while (/*CONSTCOND*/0)
++
++#define	SLIST_REMOVE_HEAD(head, field) do {				\
++	(head)->slh_first = (head)->slh_first->field.sle_next;		\
++} while (/*CONSTCOND*/0)
++
++#define	SLIST_REMOVE(head, elm, type, field) do {			\
++	if ((head)->slh_first == (elm)) {				\
++		SLIST_REMOVE_HEAD((head), field);			\
++	}								\
++	else {								\
++		struct type *curelm = (head)->slh_first;		\
++		while(curelm->field.sle_next != (elm))			\
++			curelm = curelm->field.sle_next;		\
++		curelm->field.sle_next =				\
++		    curelm->field.sle_next->field.sle_next;		\
++	}								\
++} while (/*CONSTCOND*/0)
++
++
++/*
++ * List definitions.
++ */
++#define	LIST_HEAD(name, type)						\
++struct name {								\
++	struct type *lh_first;	/* first element */			\
++}
++
++#define	LIST_HEAD_INITIALIZER(head)					\
++	{ NULL }
++
++#define	LIST_ENTRY(type)						\
++struct {								\
++	struct type *le_next;	/* next element */			\
++	struct type **le_prev;	/* address of previous next element */	\
++}
++
++/*
++ * List access methods.
++ */
++#define	LIST_FIRST(head)		((head)->lh_first)
++#define	LIST_END(head)			NULL
++#define	LIST_EMPTY(head)		((head)->lh_first == LIST_END(head))
++#define	LIST_NEXT(elm, field)		((elm)->field.le_next)
++
++#define	LIST_FOREACH(var, head, field)					\
++	for ((var) = ((head)->lh_first);				\
++	    (var) != LIST_END(head);					\
++	    (var) = ((var)->field.le_next))
++
++#define	LIST_FOREACH_SAFE(var, head, field, tvar)			\
++	for ((var) = LIST_FIRST((head));				\
++	    (var) != LIST_END(head) &&					\
++	    ((tvar) = LIST_NEXT((var), field), 1);			\
++	    (var) = (tvar))
++
++#define	LIST_MOVE(head1, head2) do {					\
++	LIST_INIT((head2));						\
++	if (!LIST_EMPTY((head1))) {					\
++		(head2)->lh_first = (head1)->lh_first;			\
++		LIST_INIT((head1));					\
++	}								\
++} while (/*CONSTCOND*/0)
++
++/*
++ * List functions.
++ */
++#if defined(QUEUEDEBUG)
++#define	QUEUEDEBUG_LIST_INSERT_HEAD(head, elm, field)			\
++	if ((head)->lh_first &&						\
++	    (head)->lh_first->field.le_prev != &(head)->lh_first)	\
++		QUEUEDEBUG_ABORT("LIST_INSERT_HEAD %p %s:%d", (head),	\
++		    __FILE__, __LINE__);
++#define	QUEUEDEBUG_LIST_OP(elm, field)					\
++	if ((elm)->field.le_next &&					\
++	    (elm)->field.le_next->field.le_prev !=			\
++	    &(elm)->field.le_next)					\
++		QUEUEDEBUG_ABORT("LIST_* forw %p %s:%d", (elm),		\
++		    __FILE__, __LINE__);				\
++	if (*(elm)->field.le_prev != (elm))				\
++		QUEUEDEBUG_ABORT("LIST_* back %p %s:%d", (elm),		\
++		    __FILE__, __LINE__);
++#define	QUEUEDEBUG_LIST_POSTREMOVE(elm, field)				\
++	(elm)->field.le_next = (void *)1L;				\
++	(elm)->field.le_prev = (void *)1L;
++#else
++#define	QUEUEDEBUG_LIST_INSERT_HEAD(head, elm, field)
++#define	QUEUEDEBUG_LIST_OP(elm, field)
++#define	QUEUEDEBUG_LIST_POSTREMOVE(elm, field)
++#endif
++
++#define	LIST_INIT(head) do {						\
++	(head)->lh_first = LIST_END(head);				\
++} while (/*CONSTCOND*/0)
++
++#define	LIST_INSERT_AFTER(listelm, elm, field) do {			\
++	QUEUEDEBUG_LIST_OP((listelm), field)				\
++	if (((elm)->field.le_next = (listelm)->field.le_next) != 	\
++	    LIST_END(head))						\
++		(listelm)->field.le_next->field.le_prev =		\
++		    &(elm)->field.le_next;				\
++	(listelm)->field.le_next = (elm);				\
++	(elm)->field.le_prev = &(listelm)->field.le_next;		\
++} while (/*CONSTCOND*/0)
++
++#define	LIST_INSERT_BEFORE(listelm, elm, field) do {			\
++	QUEUEDEBUG_LIST_OP((listelm), field)				\
++	(elm)->field.le_prev = (listelm)->field.le_prev;		\
++	(elm)->field.le_next = (listelm);				\
++	*(listelm)->field.le_prev = (elm);				\
++	(listelm)->field.le_prev = &(elm)->field.le_next;		\
++} while (/*CONSTCOND*/0)
++
++#define	LIST_INSERT_HEAD(head, elm, field) do {				\
++	QUEUEDEBUG_LIST_INSERT_HEAD((head), (elm), field)		\
++	if (((elm)->field.le_next = (head)->lh_first) != LIST_END(head))\
++		(head)->lh_first->field.le_prev = &(elm)->field.le_next;\
++	(head)->lh_first = (elm);					\
++	(elm)->field.le_prev = &(head)->lh_first;			\
++} while (/*CONSTCOND*/0)
++
++#define	LIST_REMOVE(elm, field) do {					\
++	QUEUEDEBUG_LIST_OP((elm), field)				\
++	if ((elm)->field.le_next != NULL)				\
++		(elm)->field.le_next->field.le_prev = 			\
++		    (elm)->field.le_prev;				\
++	*(elm)->field.le_prev = (elm)->field.le_next;			\
++	QUEUEDEBUG_LIST_POSTREMOVE((elm), field)			\
++} while (/*CONSTCOND*/0)
++
++#define LIST_REPLACE(elm, elm2, field) do {				\
++	if (((elm2)->field.le_next = (elm)->field.le_next) != NULL)	\
++		(elm2)->field.le_next->field.le_prev =			\
++		    &(elm2)->field.le_next;				\
++	(elm2)->field.le_prev = (elm)->field.le_prev;			\
++	*(elm2)->field.le_prev = (elm2);				\
++	QUEUEDEBUG_LIST_POSTREMOVE((elm), field)			\
++} while (/*CONSTCOND*/0)
++
++/*
++ * Simple queue definitions.
++ */
++#define	SIMPLEQ_HEAD(name, type)					\
++struct name {								\
++	struct type *sqh_first;	/* first element */			\
++	struct type **sqh_last;	/* addr of last next element */		\
++}
++
++#define	SIMPLEQ_HEAD_INITIALIZER(head)					\
++	{ NULL, &(head).sqh_first }
++
++#define	SIMPLEQ_ENTRY(type)						\
++struct {								\
++	struct type *sqe_next;	/* next element */			\
++}
++
++/*
++ * Simple queue access methods.
++ */
++#define	SIMPLEQ_FIRST(head)		((head)->sqh_first)
++#define	SIMPLEQ_END(head)		NULL
++#define	SIMPLEQ_EMPTY(head)		((head)->sqh_first == SIMPLEQ_END(head))
++#define	SIMPLEQ_NEXT(elm, field)	((elm)->field.sqe_next)
++
++#define	SIMPLEQ_FOREACH(var, head, field)				\
++	for ((var) = ((head)->sqh_first);				\
++	    (var) != SIMPLEQ_END(head);					\
++	    (var) = ((var)->field.sqe_next))
++
++#define	SIMPLEQ_FOREACH_SAFE(var, head, field, next)			\
++	for ((var) = ((head)->sqh_first);				\
++	    (var) != SIMPLEQ_END(head) &&				\
++	    ((next = ((var)->field.sqe_next)), 1);			\
++	    (var) = (next))
++
++/*
++ * Simple queue functions.
++ */
++#define	SIMPLEQ_INIT(head) do {						\
++	(head)->sqh_first = NULL;					\
++	(head)->sqh_last = &(head)->sqh_first;				\
++} while (/*CONSTCOND*/0)
++
++#define	SIMPLEQ_INSERT_HEAD(head, elm, field) do {			\
++	if (((elm)->field.sqe_next = (head)->sqh_first) == NULL)	\
++		(head)->sqh_last = &(elm)->field.sqe_next;		\
++	(head)->sqh_first = (elm);					\
++} while (/*CONSTCOND*/0)
++
++#define	SIMPLEQ_INSERT_TAIL(head, elm, field) do {			\
++	(elm)->field.sqe_next = NULL;					\
++	*(head)->sqh_last = (elm);					\
++	(head)->sqh_last = &(elm)->field.sqe_next;			\
++} while (/*CONSTCOND*/0)
++
++#define	SIMPLEQ_INSERT_AFTER(head, listelm, elm, field) do {		\
++	if (((elm)->field.sqe_next = (listelm)->field.sqe_next) == NULL)\
++		(head)->sqh_last = &(elm)->field.sqe_next;		\
++	(listelm)->field.sqe_next = (elm);				\
++} while (/*CONSTCOND*/0)
++
++#define	SIMPLEQ_REMOVE_HEAD(head, field) do {				\
++	if (((head)->sqh_first = (head)->sqh_first->field.sqe_next) == NULL) \
++		(head)->sqh_last = &(head)->sqh_first;			\
++} while (/*CONSTCOND*/0)
++
++#define SIMPLEQ_REMOVE_AFTER(head, elm, field) do {			\
++	if (((elm)->field.sqe_next = (elm)->field.sqe_next->field.sqe_next) \
++	    == NULL)							\
++		(head)->sqh_last = &(elm)->field.sqe_next;		\
++} while (/*CONSTCOND*/0)
++
++#define	SIMPLEQ_REMOVE(head, elm, type, field) do {			\
++	if ((head)->sqh_first == (elm)) {				\
++		SIMPLEQ_REMOVE_HEAD((head), field);			\
++	} else {							\
++		struct type *curelm = (head)->sqh_first;		\
++		while (curelm->field.sqe_next != (elm))			\
++			curelm = curelm->field.sqe_next;		\
++		if ((curelm->field.sqe_next =				\
++			curelm->field.sqe_next->field.sqe_next) == NULL) \
++			    (head)->sqh_last = &(curelm)->field.sqe_next; \
++	}								\
++} while (/*CONSTCOND*/0)
++
++#define	SIMPLEQ_CONCAT(head1, head2) do {				\
++	if (!SIMPLEQ_EMPTY((head2))) {					\
++		*(head1)->sqh_last = (head2)->sqh_first;		\
++		(head1)->sqh_last = (head2)->sqh_last;		\
++		SIMPLEQ_INIT((head2));					\
++	}								\
++} while (/*CONSTCOND*/0)
++
++#define	SIMPLEQ_LAST(head, type, field)					\
++	(SIMPLEQ_EMPTY((head)) ?						\
++		NULL :							\
++	        ((struct type *)(void *)				\
++		((char *)((head)->sqh_last) - offsetof(struct type, field))))
++
++/*
++ * Tail queue definitions.
++ */
++#define	_TAILQ_HEAD(name, type, qual)					\
++struct name {								\
++	qual type *tqh_first;		/* first element */		\
++	qual type *qual *tqh_last;	/* addr of last next element */	\
++}
++#define TAILQ_HEAD(name, type)	_TAILQ_HEAD(name, struct type,)
++
++#define	TAILQ_HEAD_INITIALIZER(head)					\
++	{ TAILQ_END(head), &(head).tqh_first }
++
++#define	_TAILQ_ENTRY(type, qual)					\
++struct {								\
++	qual type *tqe_next;		/* next element */		\
++	qual type *qual *tqe_prev;	/* address of previous next element */\
++}
++#define TAILQ_ENTRY(type)	_TAILQ_ENTRY(struct type,)
++
++/*
++ * Tail queue access methods.
++ */
++#define	TAILQ_FIRST(head)		((head)->tqh_first)
++#define	TAILQ_END(head)			(NULL)
++#define	TAILQ_NEXT(elm, field)		((elm)->field.tqe_next)
++#define	TAILQ_LAST(head, headname) \
++	(*(((struct headname *)((head)->tqh_last))->tqh_last))
++#define	TAILQ_PREV(elm, headname, field) \
++	(*(((struct headname *)((elm)->field.tqe_prev))->tqh_last))
++#define	TAILQ_EMPTY(head)		(TAILQ_FIRST(head) == TAILQ_END(head))
++
++
++#define	TAILQ_FOREACH(var, head, field)					\
++	for ((var) = ((head)->tqh_first);				\
++	    (var) != TAILQ_END(head);					\
++	    (var) = ((var)->field.tqe_next))
++
++#define	TAILQ_FOREACH_SAFE(var, head, field, next)			\
++	for ((var) = ((head)->tqh_first);				\
++	    (var) != TAILQ_END(head) &&					\
++	    ((next) = TAILQ_NEXT(var, field), 1); (var) = (next))
++
++#define	TAILQ_FOREACH_REVERSE(var, head, headname, field)		\
++	for ((var) = (*(((struct headname *)((head)->tqh_last))->tqh_last));\
++	    (var) != TAILQ_END(head);					\
++	    (var) = (*(((struct headname *)((var)->field.tqe_prev))->tqh_last)))
++
++#define	TAILQ_FOREACH_REVERSE_SAFE(var, head, headname, field, prev)	\
++	for ((var) = TAILQ_LAST((head), headname);			\
++	    (var) != TAILQ_END(head) && 				\
++	    ((prev) = TAILQ_PREV((var), headname, field), 1); (var) = (prev))
++
++/*
++ * Tail queue functions.
++ */
++#if defined(QUEUEDEBUG)
++#define	QUEUEDEBUG_TAILQ_INSERT_HEAD(head, elm, field)			\
++	if ((head)->tqh_first &&					\
++	    (head)->tqh_first->field.tqe_prev != &(head)->tqh_first)	\
++		QUEUEDEBUG_ABORT("TAILQ_INSERT_HEAD %p %s:%d", (head),	\
++		    __FILE__, __LINE__);
++#define	QUEUEDEBUG_TAILQ_INSERT_TAIL(head, elm, field)			\
++	if (*(head)->tqh_last != NULL)					\
++		QUEUEDEBUG_ABORT("TAILQ_INSERT_TAIL %p %s:%d", (head),	\
++		    __FILE__, __LINE__);
++#define	QUEUEDEBUG_TAILQ_OP(elm, field)					\
++	if ((elm)->field.tqe_next &&					\
++	    (elm)->field.tqe_next->field.tqe_prev !=			\
++	    &(elm)->field.tqe_next)					\
++		QUEUEDEBUG_ABORT("TAILQ_* forw %p %s:%d", (elm),	\
++		    __FILE__, __LINE__);				\
++	if (*(elm)->field.tqe_prev != (elm))				\
++		QUEUEDEBUG_ABORT("TAILQ_* back %p %s:%d", (elm),	\
++		    __FILE__, __LINE__);
++#define	QUEUEDEBUG_TAILQ_PREREMOVE(head, elm, field)			\
++	if ((elm)->field.tqe_next == NULL &&				\
++	    (head)->tqh_last != &(elm)->field.tqe_next)			\
++		QUEUEDEBUG_ABORT("TAILQ_PREREMOVE head %p elm %p %s:%d",\
++		    (head), (elm), __FILE__, __LINE__);
++#define	QUEUEDEBUG_TAILQ_POSTREMOVE(elm, field)				\
++	(elm)->field.tqe_next = (void *)1L;				\
++	(elm)->field.tqe_prev = (void *)1L;
++#else
++#define	QUEUEDEBUG_TAILQ_INSERT_HEAD(head, elm, field)
++#define	QUEUEDEBUG_TAILQ_INSERT_TAIL(head, elm, field)
++#define	QUEUEDEBUG_TAILQ_OP(elm, field)
++#define	QUEUEDEBUG_TAILQ_PREREMOVE(head, elm, field)
++#define	QUEUEDEBUG_TAILQ_POSTREMOVE(elm, field)
++#endif
++
++#define	TAILQ_INIT(head) do {						\
++	(head)->tqh_first = TAILQ_END(head);				\
++	(head)->tqh_last = &(head)->tqh_first;				\
++} while (/*CONSTCOND*/0)
++
++#define	TAILQ_INSERT_HEAD(head, elm, field) do {			\
++	QUEUEDEBUG_TAILQ_INSERT_HEAD((head), (elm), field)		\
++	if (((elm)->field.tqe_next = (head)->tqh_first) != TAILQ_END(head))\
++		(head)->tqh_first->field.tqe_prev =			\
++		    &(elm)->field.tqe_next;				\
++	else								\
++		(head)->tqh_last = &(elm)->field.tqe_next;		\
++	(head)->tqh_first = (elm);					\
++	(elm)->field.tqe_prev = &(head)->tqh_first;			\
++} while (/*CONSTCOND*/0)
++
++#define	TAILQ_INSERT_TAIL(head, elm, field) do {			\
++	QUEUEDEBUG_TAILQ_INSERT_TAIL((head), (elm), field)		\
++	(elm)->field.tqe_next = TAILQ_END(head);			\
++	(elm)->field.tqe_prev = (head)->tqh_last;			\
++	*(head)->tqh_last = (elm);					\
++	(head)->tqh_last = &(elm)->field.tqe_next;			\
++} while (/*CONSTCOND*/0)
++
++#define	TAILQ_INSERT_AFTER(head, listelm, elm, field) do {		\
++	QUEUEDEBUG_TAILQ_OP((listelm), field)				\
++	if (((elm)->field.tqe_next = (listelm)->field.tqe_next) != 	\
++	    TAILQ_END(head))						\
++		(elm)->field.tqe_next->field.tqe_prev = 		\
++		    &(elm)->field.tqe_next;				\
++	else								\
++		(head)->tqh_last = &(elm)->field.tqe_next;		\
++	(listelm)->field.tqe_next = (elm);				\
++	(elm)->field.tqe_prev = &(listelm)->field.tqe_next;		\
++} while (/*CONSTCOND*/0)
++
++#define	TAILQ_INSERT_BEFORE(listelm, elm, field) do {			\
++	QUEUEDEBUG_TAILQ_OP((listelm), field)				\
++	(elm)->field.tqe_prev = (listelm)->field.tqe_prev;		\
++	(elm)->field.tqe_next = (listelm);				\
++	*(listelm)->field.tqe_prev = (elm);				\
++	(listelm)->field.tqe_prev = &(elm)->field.tqe_next;		\
++} while (/*CONSTCOND*/0)
++
++#define	TAILQ_REMOVE(head, elm, field) do {				\
++	QUEUEDEBUG_TAILQ_PREREMOVE((head), (elm), field)		\
++	QUEUEDEBUG_TAILQ_OP((elm), field)				\
++	if (((elm)->field.tqe_next) != TAILQ_END(head))			\
++		(elm)->field.tqe_next->field.tqe_prev = 		\
++		    (elm)->field.tqe_prev;				\
++	else								\
++		(head)->tqh_last = (elm)->field.tqe_prev;		\
++	*(elm)->field.tqe_prev = (elm)->field.tqe_next;			\
++	QUEUEDEBUG_TAILQ_POSTREMOVE((elm), field);			\
++} while (/*CONSTCOND*/0)
++
++#define TAILQ_REPLACE(head, elm, elm2, field) do {			\
++        if (((elm2)->field.tqe_next = (elm)->field.tqe_next) != 	\
++	    TAILQ_END(head))   						\
++                (elm2)->field.tqe_next->field.tqe_prev =		\
++                    &(elm2)->field.tqe_next;				\
++        else								\
++                (head)->tqh_last = &(elm2)->field.tqe_next;		\
++        (elm2)->field.tqe_prev = (elm)->field.tqe_prev;			\
++        *(elm2)->field.tqe_prev = (elm2);				\
++	QUEUEDEBUG_TAILQ_POSTREMOVE((elm), field);			\
++} while (/*CONSTCOND*/0)
++
++#define	TAILQ_CONCAT(head1, head2, field) do {				\
++	if (!TAILQ_EMPTY(head2)) {					\
++		*(head1)->tqh_last = (head2)->tqh_first;		\
++		(head2)->tqh_first->field.tqe_prev = (head1)->tqh_last;	\
++		(head1)->tqh_last = (head2)->tqh_last;			\
++		TAILQ_INIT((head2));					\
++	}								\
++} while (/*CONSTCOND*/0)
++
++/*
++ * Singly-linked Tail queue declarations.
++ */
++#define	STAILQ_HEAD(name, type)						\
++struct name {								\
++	struct type *stqh_first;	/* first element */		\
++	struct type **stqh_last;	/* addr of last next element */	\
++}
++
++#define	STAILQ_HEAD_INITIALIZER(head)					\
++	{ NULL, &(head).stqh_first }
++
++#define	STAILQ_ENTRY(type)						\
++struct {								\
++	struct type *stqe_next;	/* next element */			\
++}
++
++/*
++ * Singly-linked Tail queue access methods.
++ */
++#define	STAILQ_FIRST(head)	((head)->stqh_first)
++#define	STAILQ_END(head)	NULL
++#define	STAILQ_NEXT(elm, field)	((elm)->field.stqe_next)
++#define	STAILQ_EMPTY(head)	(STAILQ_FIRST(head) == STAILQ_END(head))
++
++/*
++ * Singly-linked Tail queue functions.
++ */
++#define	STAILQ_INIT(head) do {						\
++	(head)->stqh_first = NULL;					\
++	(head)->stqh_last = &(head)->stqh_first;				\
++} while (/*CONSTCOND*/0)
++
++#define	STAILQ_INSERT_HEAD(head, elm, field) do {			\
++	if (((elm)->field.stqe_next = (head)->stqh_first) == NULL)	\
++		(head)->stqh_last = &(elm)->field.stqe_next;		\
++	(head)->stqh_first = (elm);					\
++} while (/*CONSTCOND*/0)
++
++#define	STAILQ_INSERT_TAIL(head, elm, field) do {			\
++	(elm)->field.stqe_next = NULL;					\
++	*(head)->stqh_last = (elm);					\
++	(head)->stqh_last = &(elm)->field.stqe_next;			\
++} while (/*CONSTCOND*/0)
++
++#define	STAILQ_INSERT_AFTER(head, listelm, elm, field) do {		\
++	if (((elm)->field.stqe_next = (listelm)->field.stqe_next) == NULL)\
++		(head)->stqh_last = &(elm)->field.stqe_next;		\
++	(listelm)->field.stqe_next = (elm);				\
++} while (/*CONSTCOND*/0)
++
++#define	STAILQ_REMOVE_HEAD(head, field) do {				\
++	if (((head)->stqh_first = (head)->stqh_first->field.stqe_next) == NULL) \
++		(head)->stqh_last = &(head)->stqh_first;			\
++} while (/*CONSTCOND*/0)
++
++#define	STAILQ_REMOVE(head, elm, type, field) do {			\
++	if ((head)->stqh_first == (elm)) {				\
++		STAILQ_REMOVE_HEAD((head), field);			\
++	} else {							\
++		struct type *curelm = (head)->stqh_first;		\
++		while (curelm->field.stqe_next != (elm))			\
++			curelm = curelm->field.stqe_next;		\
++		if ((curelm->field.stqe_next =				\
++			curelm->field.stqe_next->field.stqe_next) == NULL) \
++			    (head)->stqh_last = &(curelm)->field.stqe_next; \
++	}								\
++} while (/*CONSTCOND*/0)
++
++#define	STAILQ_FOREACH(var, head, field)				\
++	for ((var) = ((head)->stqh_first);				\
++		(var);							\
++		(var) = ((var)->field.stqe_next))
++
++#define	STAILQ_FOREACH_SAFE(var, head, field, tvar)			\
++	for ((var) = STAILQ_FIRST((head));				\
++	    (var) && ((tvar) = STAILQ_NEXT((var), field), 1);		\
++	    (var) = (tvar))
++
++#define	STAILQ_CONCAT(head1, head2) do {				\
++	if (!STAILQ_EMPTY((head2))) {					\
++		*(head1)->stqh_last = (head2)->stqh_first;		\
++		(head1)->stqh_last = (head2)->stqh_last;		\
++		STAILQ_INIT((head2));					\
++	}								\
++} while (/*CONSTCOND*/0)
++
++#define	STAILQ_LAST(head, type, field)					\
++	(STAILQ_EMPTY((head)) ?						\
++		NULL :							\
++	        ((struct type *)(void *)				\
++		((char *)((head)->stqh_last) - offsetof(struct type, field))))
++
++
++#ifndef _KERNEL
++/*
++ * Circular queue definitions. Do not use. We still keep the macros
++ * for compatibility but because of pointer aliasing issues their use
++ * is discouraged!
++ */
++
++/*
++ * __launder_type():  We use this ugly hack to work around the the compiler
++ * noticing that two types may not alias each other and elide tests in code.
++ * We hit this in the CIRCLEQ macros when comparing 'struct name *' and
++ * 'struct type *' (see CIRCLEQ_HEAD()).  Modern compilers (such as GCC
++ * 4.8) declare these comparisons as always false, causing the code to
++ * not run as designed.
++ *
++ * This hack is only to be used for comparisons and thus can be fully const.
++ * Do not use for assignment.
++ *
++ * If we ever choose to change the ABI of the CIRCLEQ macros, we could fix
++ * this by changing the head/tail sentinal values, but see the note above
++ * this one.
++ */
++static __inline const void * __launder_type(const void *);
++static __inline const void *
++__launder_type(const void *__x)
++{
++	__asm __volatile("" : "+r" (__x));
++	return __x;
++}
++
++#if defined(QUEUEDEBUG)
++#define QUEUEDEBUG_CIRCLEQ_HEAD(head, field)				\
++	if ((head)->cqh_first != CIRCLEQ_ENDC(head) &&			\
++	    (head)->cqh_first->field.cqe_prev != CIRCLEQ_ENDC(head))	\
++		QUEUEDEBUG_ABORT("CIRCLEQ head forw %p %s:%d", (head),	\
++		      __FILE__, __LINE__);				\
++	if ((head)->cqh_last != CIRCLEQ_ENDC(head) &&			\
++	    (head)->cqh_last->field.cqe_next != CIRCLEQ_ENDC(head))	\
++		QUEUEDEBUG_ABORT("CIRCLEQ head back %p %s:%d", (head),	\
++		      __FILE__, __LINE__);
++#define QUEUEDEBUG_CIRCLEQ_ELM(head, elm, field)			\
++	if ((elm)->field.cqe_next == CIRCLEQ_ENDC(head)) {		\
++		if ((head)->cqh_last != (elm))				\
++			QUEUEDEBUG_ABORT("CIRCLEQ elm last %p %s:%d",	\
++			    (elm), __FILE__, __LINE__);			\
++	} else {							\
++		if ((elm)->field.cqe_next->field.cqe_prev != (elm))	\
++			QUEUEDEBUG_ABORT("CIRCLEQ elm forw %p %s:%d",	\
++			    (elm), __FILE__, __LINE__);			\
++	}								\
++	if ((elm)->field.cqe_prev == CIRCLEQ_ENDC(head)) {		\
++		if ((head)->cqh_first != (elm))				\
++			QUEUEDEBUG_ABORT("CIRCLEQ elm first %p %s:%d",	\
++			    (elm), __FILE__, __LINE__);			\
++	} else {							\
++		if ((elm)->field.cqe_prev->field.cqe_next != (elm))	\
++			QUEUEDEBUG_ABORT("CIRCLEQ elm prev %p %s:%d",	\
++			    (elm), __FILE__, __LINE__);			\
++	}
++#define QUEUEDEBUG_CIRCLEQ_POSTREMOVE(elm, field)			\
++	(elm)->field.cqe_next = (void *)1L;				\
++	(elm)->field.cqe_prev = (void *)1L;
++#else
++#define QUEUEDEBUG_CIRCLEQ_HEAD(head, field)
++#define QUEUEDEBUG_CIRCLEQ_ELM(head, elm, field)
++#define QUEUEDEBUG_CIRCLEQ_POSTREMOVE(elm, field)
++#endif
++
++#define	CIRCLEQ_HEAD(name, type)					\
++struct name {								\
++	struct type *cqh_first;		/* first element */		\
++	struct type *cqh_last;		/* last element */		\
++}
++
++#define	CIRCLEQ_HEAD_INITIALIZER(head)					\
++	{ CIRCLEQ_END(&head), CIRCLEQ_END(&head) }
++
++#define	CIRCLEQ_ENTRY(type)						\
++struct {								\
++	struct type *cqe_next;		/* next element */		\
++	struct type *cqe_prev;		/* previous element */		\
++}
++
++/*
++ * Circular queue functions.
++ */
++#define	CIRCLEQ_INIT(head) do {						\
++	(head)->cqh_first = CIRCLEQ_END(head);				\
++	(head)->cqh_last = CIRCLEQ_END(head);				\
++} while (/*CONSTCOND*/0)
++
++#define	CIRCLEQ_INSERT_AFTER(head, listelm, elm, field) do {		\
++	QUEUEDEBUG_CIRCLEQ_HEAD((head), field)				\
++	QUEUEDEBUG_CIRCLEQ_ELM((head), (listelm), field)		\
++	(elm)->field.cqe_next = (listelm)->field.cqe_next;		\
++	(elm)->field.cqe_prev = (listelm);				\
++	if ((listelm)->field.cqe_next == CIRCLEQ_ENDC(head))		\
++		(head)->cqh_last = (elm);				\
++	else								\
++		(listelm)->field.cqe_next->field.cqe_prev = (elm);	\
++	(listelm)->field.cqe_next = (elm);				\
++} while (/*CONSTCOND*/0)
++
++#define	CIRCLEQ_INSERT_BEFORE(head, listelm, elm, field) do {		\
++	QUEUEDEBUG_CIRCLEQ_HEAD((head), field)				\
++	QUEUEDEBUG_CIRCLEQ_ELM((head), (listelm), field)		\
++	(elm)->field.cqe_next = (listelm);				\
++	(elm)->field.cqe_prev = (listelm)->field.cqe_prev;		\
++	if ((listelm)->field.cqe_prev == CIRCLEQ_ENDC(head))		\
++		(head)->cqh_first = (elm);				\
++	else								\
++		(listelm)->field.cqe_prev->field.cqe_next = (elm);	\
++	(listelm)->field.cqe_prev = (elm);				\
++} while (/*CONSTCOND*/0)
++
++#define	CIRCLEQ_INSERT_HEAD(head, elm, field) do {			\
++	QUEUEDEBUG_CIRCLEQ_HEAD((head), field)				\
++	(elm)->field.cqe_next = (head)->cqh_first;			\
++	(elm)->field.cqe_prev = CIRCLEQ_END(head);			\
++	if ((head)->cqh_last == CIRCLEQ_ENDC(head))			\
++		(head)->cqh_last = (elm);				\
++	else								\
++		(head)->cqh_first->field.cqe_prev = (elm);		\
++	(head)->cqh_first = (elm);					\
++} while (/*CONSTCOND*/0)
++
++#define	CIRCLEQ_INSERT_TAIL(head, elm, field) do {			\
++	QUEUEDEBUG_CIRCLEQ_HEAD((head), field)				\
++	(elm)->field.cqe_next = CIRCLEQ_END(head);			\
++	(elm)->field.cqe_prev = (head)->cqh_last;			\
++	if ((head)->cqh_first == CIRCLEQ_ENDC(head))			\
++		(head)->cqh_first = (elm);				\
++	else								\
++		(head)->cqh_last->field.cqe_next = (elm);		\
++	(head)->cqh_last = (elm);					\
++} while (/*CONSTCOND*/0)
++
++#define	CIRCLEQ_REMOVE(head, elm, field) do {				\
++	QUEUEDEBUG_CIRCLEQ_HEAD((head), field)				\
++	QUEUEDEBUG_CIRCLEQ_ELM((head), (elm), field)			\
++	if ((elm)->field.cqe_next == CIRCLEQ_ENDC(head))		\
++		(head)->cqh_last = (elm)->field.cqe_prev;		\
++	else								\
++		(elm)->field.cqe_next->field.cqe_prev =			\
++		    (elm)->field.cqe_prev;				\
++	if ((elm)->field.cqe_prev == CIRCLEQ_ENDC(head))		\
++		(head)->cqh_first = (elm)->field.cqe_next;		\
++	else								\
++		(elm)->field.cqe_prev->field.cqe_next =			\
++		    (elm)->field.cqe_next;				\
++	QUEUEDEBUG_CIRCLEQ_POSTREMOVE((elm), field)			\
++} while (/*CONSTCOND*/0)
++
++#define	CIRCLEQ_FOREACH(var, head, field)				\
++	for ((var) = ((head)->cqh_first);				\
++		(var) != CIRCLEQ_ENDC(head);				\
++		(var) = ((var)->field.cqe_next))
++
++#define	CIRCLEQ_FOREACH_REVERSE(var, head, field)			\
++	for ((var) = ((head)->cqh_last);				\
++		(var) != CIRCLEQ_ENDC(head);				\
++		(var) = ((var)->field.cqe_prev))
++
++/*
++ * Circular queue access methods.
++ */
++#define	CIRCLEQ_FIRST(head)		((head)->cqh_first)
++#define	CIRCLEQ_LAST(head)		((head)->cqh_last)
++/* For comparisons */
++#define	CIRCLEQ_ENDC(head)		(__launder_type(head))
++/* For assignments */
++#define	CIRCLEQ_END(head)		((void *)(head))
++#define	CIRCLEQ_NEXT(elm, field)	((elm)->field.cqe_next)
++#define	CIRCLEQ_PREV(elm, field)	((elm)->field.cqe_prev)
++#define	CIRCLEQ_EMPTY(head)						\
++    (CIRCLEQ_FIRST(head) == CIRCLEQ_ENDC(head))
++
++#define CIRCLEQ_LOOP_NEXT(head, elm, field)				\
++	(((elm)->field.cqe_next == CIRCLEQ_ENDC(head))			\
++	    ? ((head)->cqh_first)					\
++	    : (elm->field.cqe_next))
++#define CIRCLEQ_LOOP_PREV(head, elm, field)				\
++	(((elm)->field.cqe_prev == CIRCLEQ_ENDC(head))			\
++	    ? ((head)->cqh_last)					\
++	    : (elm->field.cqe_prev))
++#endif /* !_KERNEL */
++
++#endif	/* !_SYS_QUEUE_H_ */
+-- 
+2.3.7
+
diff --git a/package/libtirpc/0013-Add-missing-header-include-netdb.h.patch b/package/libtirpc/0013-Add-missing-header-include-netdb.h.patch
new file mode 100644
index 0000000..f6781be
--- /dev/null
+++ b/package/libtirpc/0013-Add-missing-header-include-netdb.h.patch
@@ -0,0 +1,36 @@
+From 253de376aeab521b466aca1977446995e24c72f5 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Tue, 5 May 2015 17:08:44 +0200
+Subject: [PATCH 13/16] Add missing header include netdb.h
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Needed for IPPORT_RESERVED.
+
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+---
+ src/bindresvport.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/bindresvport.c b/src/bindresvport.c
+index 7378e0e..fff4e34 100644
+--- a/src/bindresvport.c
++++ b/src/bindresvport.c
+@@ -35,12 +35,12 @@
+ #include <sys/types.h>
+ #include <sys/socket.h>
+ 
++#include <netdb.h>
+ #include <netinet/in.h>
+ 
+ #include <errno.h>
+ #include <string.h>
+ #include <unistd.h>
+-
+ #include <rpc/rpc.h>
+ 
+ #include <string.h>
+-- 
+2.3.7
+
diff --git a/package/libtirpc/0014-Define-struct-rpcent-on-non-glibc.patch b/package/libtirpc/0014-Define-struct-rpcent-on-non-glibc.patch
new file mode 100644
index 0000000..8668148
--- /dev/null
+++ b/package/libtirpc/0014-Define-struct-rpcent-on-non-glibc.patch
@@ -0,0 +1,33 @@
+From 93d34d4638fc2c45349db769874c6b70b0876620 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Tue, 5 May 2015 17:23:33 +0200
+Subject: [PATCH 14/16] Define struct rpcent on non glibc
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The musl C library does not define struct rpcent. Note that musl does not
+define a __MUSL__ macro so we define the struct here for all non uClibc
+(or uClibc without RPC support) and non glibc libraries.
+
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+---
+ tirpc/rpc/rpcent.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tirpc/rpc/rpcent.h b/tirpc/rpc/rpcent.h
+index 7bfc035..72f86ad 100644
+--- a/tirpc/rpc/rpcent.h
++++ b/tirpc/rpc/rpcent.h
+@@ -54,7 +54,7 @@ extern "C" {
+ 
+ /* These are defined in /usr/include/rpc/netdb.h, unless we are using
+    the C library without RPC support. */
+-#if defined(__UCLIBC__) && !defined(__UCLIBC_HAS_RPC__)
++#if defined(__UCLIBC__) && !defined(__UCLIBC_HAS_RPC__) || !defined(__GLIBC__)
+ struct rpcent {
+ 	char	*r_name;	/* name of server for this rpc program */
+ 	char	**r_aliases;	/* alias list */
+-- 
+2.3.7
+
diff --git a/package/libtirpc/0015-Fix-include-path-for-fcntl.h.patch b/package/libtirpc/0015-Fix-include-path-for-fcntl.h.patch
new file mode 100644
index 0000000..9c24e24
--- /dev/null
+++ b/package/libtirpc/0015-Fix-include-path-for-fcntl.h.patch
@@ -0,0 +1,48 @@
+From a591618b4114a9526d2b8d925f9fe20d755a316e Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Tue, 5 May 2015 17:25:13 +0200
+Subject: [PATCH 15/16] Fix include path for fcntl.h
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The correct path defined in the POSIX.1-2008 Standard is <fcntl.h>.
+
+Removes "redirecting incorrect #include <sys/fcntl.h> to <fcntl.h>" warning
+when building libtirpc with the musl C library.
+
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+---
+ src/clnt_generic.c | 2 +-
+ src/key_call.c     | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/clnt_generic.c b/src/clnt_generic.c
+index b9b07bc..3f3dabf 100644
+--- a/src/clnt_generic.c
++++ b/src/clnt_generic.c
+@@ -29,7 +29,7 @@
+ #include <pthread.h>
+ #include <reentrant.h>
+ #include <sys/types.h>
+-#include <sys/fcntl.h>
++#include <fcntl.h>
+ #include <fcntl.h>
+ #include <sys/socket.h>
+ #include <netinet/in.h>
+diff --git a/src/key_call.c b/src/key_call.c
+index c37e136..be1ed10 100644
+--- a/src/key_call.c
++++ b/src/key_call.c
+@@ -55,7 +55,7 @@
+ #include <stdlib.h>
+ #include <signal.h>
+ #include <sys/wait.h>
+-#include <sys/fcntl.h>
++#include <fcntl.h>
+ 
+ 
+ #define	KEY_TIMEOUT	5	/* per-try timeout in seconds */
+-- 
+2.3.7
+
diff --git a/package/libtirpc/0016-Fix-include-path-for-poll.h.patch b/package/libtirpc/0016-Fix-include-path-for-poll.h.patch
new file mode 100644
index 0000000..2b4904f
--- /dev/null
+++ b/package/libtirpc/0016-Fix-include-path-for-poll.h.patch
@@ -0,0 +1,104 @@
+From c242a11f1a42508378c43363691828774cbf7696 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Tue, 5 May 2015 17:25:35 +0200
+Subject: [PATCH 16/16] Fix include path for poll.h
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The correct path defined in the POSIX.1-2008 Standard is <poll.h>.
+
+Removes "redirecting incorrect #include <sys/poll.h> to <poll.h>" warning
+when building libtirpc with the musl C library.
+
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+---
+ src/clnt_bcast.c | 2 +-
+ src/clnt_dg.c    | 2 +-
+ src/clnt_vc.c    | 2 +-
+ src/pmap_rmt.c   | 2 +-
+ src/svc.c        | 2 +-
+ src/svc_vc.c     | 2 +-
+ 6 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/src/clnt_bcast.c b/src/clnt_bcast.c
+index 3ed8457..6fb5f81 100644
+--- a/src/clnt_bcast.c
++++ b/src/clnt_bcast.c
+@@ -44,7 +44,7 @@
+ #include <net/if.h>
+ #include <netinet/in.h>
+ #include <ifaddrs.h>
+-#include <sys/poll.h>
++#include <poll.h>
+ #include <rpc/rpc.h>
+ #ifdef PORTMAP
+ #include <rpc/pmap_prot.h>
+diff --git a/src/clnt_dg.c b/src/clnt_dg.c
+index dcc621c..248138b 100644
+--- a/src/clnt_dg.c
++++ b/src/clnt_dg.c
+@@ -37,7 +37,7 @@
+ #include <sys/types.h>
+ #include <sys/socket.h>
+ #include <stdint.h>
+-#include <sys/poll.h>
++#include <poll.h>
+ 
+ #include <sys/time.h>
+ 
+diff --git a/src/clnt_vc.c b/src/clnt_vc.c
+index 61264d4..a72f9f7 100644
+--- a/src/clnt_vc.c
++++ b/src/clnt_vc.c
+@@ -48,7 +48,7 @@
+ 
+ #include <reentrant.h>
+ #include <sys/types.h>
+-#include <sys/poll.h>
++#include <poll.h>
+ #include <sys/syslog.h>
+ #include <sys/un.h>
+ #include <sys/uio.h>
+diff --git a/src/pmap_rmt.c b/src/pmap_rmt.c
+index b81d771..1c76114 100644
+--- a/src/pmap_rmt.c
++++ b/src/pmap_rmt.c
+@@ -36,7 +36,7 @@
+ 
+ #include <sys/types.h>
+ #include <sys/ioctl.h>
+-#include <sys/poll.h>
++#include <poll.h>
+ #include <sys/socket.h>
+ 
+ #include <net/if.h>
+diff --git a/src/svc.c b/src/svc.c
+index 08cd6c9..847677d 100644
+--- a/src/svc.c
++++ b/src/svc.c
+@@ -40,7 +40,7 @@
+ 
+ #include <reentrant.h>
+ #include <sys/types.h>
+-#include <sys/poll.h>
++#include <poll.h>
+ #include <assert.h>
+ #include <errno.h>
+ #include <stdlib.h>
+diff --git a/src/svc_vc.c b/src/svc_vc.c
+index 06a275b..d2d805c 100644
+--- a/src/svc_vc.c
++++ b/src/svc_vc.c
+@@ -39,7 +39,7 @@
+ #include <sys/socket.h>
+ #include <sys/types.h>
+ #include <sys/param.h>
+-#include <sys/poll.h>
++#include <poll.h>
+ #include <sys/un.h>
+ #include <sys/time.h>
+ #include <sys/uio.h>
+-- 
+2.3.7
+
-- 
2.3.7

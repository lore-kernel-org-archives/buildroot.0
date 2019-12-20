From: Petr Vorel <petr.vorel@gmail.com>
Date: Fri, 20 Dec 2019 18:45:37 +0100
Subject: [Buildroot] [PATCH 1/1] package/libtirpc: Bump to version 1.2.5
Message-ID: <20191220174537.27562-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rebased 0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch,
dropped 3 patches accepted upstream.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Tested locally (intel on glibc) + via test-pkg:
$ ./utils/test-pkg -p libtirpc
                             br-arm-full [1/6]: OK
                  br-arm-cortex-a9-glibc [2/6]: OK
                   br-arm-cortex-m4-full [3/6]: OK
                          br-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: OK
                            sourcery-arm [6/6]: OK

Kind regards,
Petr

 ...parts-of-TIRPC-requiring-NIS-support.patch |  26 ++--
 ...t-and-musl-does-not-install-rpcent.h.patch |  35 -----
 ...Disable-DES-authentification-support.patch | 142 ------------------
 .../0006-rpc-types.h-fix-musl-build.patch     |  31 ----
 package/libtirpc/libtirpc.hash                |   3 +-
 package/libtirpc/libtirpc.mk                  |   2 +-
 6 files changed, 16 insertions(+), 223 deletions(-)
 delete mode 100644 package/libtirpc/0002-uClibc-without-RPC-support-and-musl-does-not-install-rpcent.h.patch
 delete mode 100644 package/libtirpc/0005-Disable-DES-authentification-support.patch
 delete mode 100644 package/libtirpc/0006-rpc-types.h-fix-musl-build.patch

diff --git a/package/libtirpc/0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch b/package/libtirpc/0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch
index eb1bef3dc1..101a779ade 100644
--- a/package/libtirpc/0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch
+++ b/package/libtirpc/0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch
@@ -1,7 +1,7 @@
-From 15adb318818f5d0ac609ef2b87643dd760487cb6 Mon Sep 17 00:00:00 2001
+From cb30579c9195ae29c82545c934e0bd9677262bce Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
-Date: Mon, 20 Jul 2015 20:30:11 +0200
-Subject: [PATCH 1/1] Disable parts of TIRPC requiring NIS support
+Date: Fri, 20 Dec 2019 17:58:17 +0100
+Subject: [PATCH] Disable parts of TIRPC requiring NIS support
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -15,24 +15,26 @@ Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
 Signed-off-by: Peter Rosin <peda@axentia.se>
 [bernd.kuhls at t-online.de: update for 1.0.2]
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[pvorel: update for 1.2.5]
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
 ---
  src/Makefile.am | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/src/Makefile.am b/src/Makefile.am
-index 6cc567a..9834f9a 100644
+index b2d5436..864f984 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
-@@ -24,7 +24,7 @@ libtirpc_la_SOURCES = auth_none.c auth_unix.c authunix_prot.c bindresvport.c cln
+@@ -24,7 +24,7 @@ libtirpc_la_SOURCES = auth_none.c auth_unix.c authunix_prot.c \
+         rpc_callmsg.c rpc_generic.c rpc_soc.c rpcb_clnt.c rpcb_prot.c \
          rpcb_st_xdr.c svc.c svc_auth.c svc_dg.c svc_auth_unix.c svc_auth_none.c \
- 	svc_auth_des.c \
          svc_generic.c svc_raw.c svc_run.c svc_simple.c svc_vc.c getpeereid.c \
--        auth_time.c auth_des.c authdes_prot.c debug.c des_crypt.c des_impl.c
-+        auth_des.c authdes_prot.c debug.c des_crypt.c des_impl.c
+-        auth_time.c debug.c 
++        debug.c
  
- ## XDR
- libtirpc_la_SOURCES += xdr.c xdr_rec.c xdr_array.c xdr_float.c xdr_mem.c xdr_reference.c xdr_stdio.c xdr_sizeof.c
-@@ -41,8 +41,8 @@ if GSS
+ if AUTHDES
+ libtirpc_la_SOURCES += auth_des.c  authdes_prot.c  des_crypt.c  des_impl.c  des_soft.c  svc_auth_des.c
+@@ -45,8 +45,8 @@ if GSS
      libtirpc_la_CFLAGS = -DHAVE_RPCSEC_GSS $(GSSAPI_CFLAGS)
  endif
  
@@ -44,5 +46,5 @@ index 6cc567a..9834f9a 100644
  CLEANFILES	       = cscope.* *~
  DISTCLEANFILES	       = Makefile.in
 -- 
-2.4.6
+2.24.0
 
diff --git a/package/libtirpc/0002-uClibc-without-RPC-support-and-musl-does-not-install-rpcent.h.patch b/package/libtirpc/0002-uClibc-without-RPC-support-and-musl-does-not-install-rpcent.h.patch
deleted file mode 100644
index 51229a024d..0000000000
--- a/package/libtirpc/0002-uClibc-without-RPC-support-and-musl-does-not-install-rpcent.h.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 7aa1fe6a0f9280571117c30c03c2cc521cd86ec3 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sat, 23 Jun 2012 21:58:07 +0200
-Subject: [PATCH] uClibc without RPC support and musl does not install rpcent.h
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-[yann.morin.1998 at free.fr: update for 0.3.1]
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-[joerg.krause at embedded.rocks: musl fix]
-Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
-[bernd.kuhls at t-online.de: update for 1.0.2]
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- tirpc/rpc/rpcent.h | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/tirpc/rpc/rpcent.h b/tirpc/rpc/rpcent.h
-index 147f909..4a58180 100644
---- a/tirpc/rpc/rpcent.h
-+++ b/tirpc/rpc/rpcent.h
-@@ -48,8 +48,9 @@
- extern "C" {
- #endif
- 
--/* These are defined in /usr/include/rpc/netdb.h */
--#if !defined(__GLIBC__) || defined(__UCLIBC__)
-+/* These are defined in /usr/include/rpc/netdb.h, unless we are using
-+   the C library without RPC support. */
-+#if defined(__UCLIBC__) && !defined(__UCLIBC_HAS_RPC__) || !defined(__GLIBC__)
- struct rpcent {
- 	char	*r_name;	/* name of server for this rpc program */
- 	char	**r_aliases;	/* alias list */
--- 
-1.9.1
-
diff --git a/package/libtirpc/0005-Disable-DES-authentification-support.patch b/package/libtirpc/0005-Disable-DES-authentification-support.patch
deleted file mode 100644
index 0c65472400..0000000000
--- a/package/libtirpc/0005-Disable-DES-authentification-support.patch
+++ /dev/null
@@ -1,142 +0,0 @@
-From 79975eb4104667be85abd06874c258438826b674 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
-Date: Fri, 24 Jul 2015 14:45:52 +0200
-Subject: [PATCH] Disable DES authentification support
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-uClibc and musl does not provide DES authentication.
-
-Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
-[peda at axentia.se: update for 1.0.1]
-Signed-off-by: Peter Rosin <peda@axentia.se>
-[bernd.kuhls at t-online.de: update for 1.0.2]
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- src/Makefile.am |  2 +-
- src/rpc_soc.c   | 32 --------------------------------
- 2 files changed, 1 insertion(+), 33 deletions(-)
-
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 960a522..3a88e31 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -22,9 +22,8 @@ libtirpc_la_SOURCES = auth_none.c auth_unix.c authunix_prot.c bindresvport.c cln
-         pmap_prot.c pmap_prot2.c pmap_rmt.c rpc_prot.c rpc_commondata.c \
-         rpc_callmsg.c rpc_generic.c rpc_soc.c rpcb_clnt.c rpcb_prot.c \
-         rpcb_st_xdr.c svc.c svc_auth.c svc_dg.c svc_auth_unix.c svc_auth_none.c \
--	svc_auth_des.c \
-         svc_generic.c svc_raw.c svc_run.c svc_simple.c svc_vc.c getpeereid.c \
--        auth_des.c authdes_prot.c debug.c des_crypt.c des_impl.c
-+        debug.c
- 
- ## XDR
- libtirpc_la_SOURCES += xdr.c xdr_rec.c xdr_array.c xdr_float.c xdr_mem.c xdr_reference.c xdr_stdio.c xdr_sizeof.c
-diff --git a/src/svc_auth.c b/src/svc_auth.c
---- a/src/svc_auth.c
-+++ b/src/svc_auth.c
-@@ -114,9 +114,6 @@ _gss_authenticate(rqst, msg, no_dispatch)
- 	case AUTH_SHORT:
- 		dummy = _svcauth_short(rqst, msg);
- 		return (dummy);
--	case AUTH_DES:
--		dummy = _svcauth_des(rqst, msg);
--		return (dummy);
- #ifdef HAVE_RPCSEC_GSS
- 	case RPCSEC_GSS:
- 		dummy = _svcauth_gss(rqst, msg, no_dispatch);
-diff --git a/src/rpc_soc.c b/src/rpc_soc.c
-index e146ed4..161a1ec 100644
---- a/src/rpc_soc.c
-+++ b/src/rpc_soc.c
-@@ -522,86 +521,6 @@ clnt_broadcast(prog, vers, proc, xargs, argsp, xresults, resultsp, eachresult)
- }
- 
- /*
-- * Create the client des authentication object. Obsoleted by
-- * authdes_seccreate().
-- */
--AUTH *
--authdes_create(servername, window, syncaddr, ckey)
--	char *servername;		/* network name of server */
--	u_int window;			/* time to live */
--	struct sockaddr *syncaddr;	/* optional hostaddr to sync with */
--	des_block *ckey;		/* optional conversation key to use */
--{
--	AUTH *nauth;
--	char hostname[NI_MAXHOST];
--
--	if (syncaddr) {
--		/*
--		 * Change addr to hostname, because that is the way
--		 * new interface takes it.
--		 */
--	        switch (syncaddr->sa_family) {
--		case AF_INET:
--		  if (getnameinfo(syncaddr, sizeof(struct sockaddr_in), hostname,
--				  sizeof hostname, NULL, 0, 0) != 0)
--		    goto fallback;
--		  break;
--		case AF_INET6:
--		  if (getnameinfo(syncaddr, sizeof(struct sockaddr_in6), hostname,
--				  sizeof hostname, NULL, 0, 0) != 0)
--		    goto fallback;
--		  break;
--		default:
--		  goto fallback;
--		}
--		nauth = authdes_seccreate(servername, window, hostname, ckey);
--		return (nauth);
--	}
--fallback:
--	return authdes_seccreate(servername, window, NULL, ckey);
--}
--
--/*
-- * Create the client des authentication object. Obsoleted by
-- * authdes_pk_seccreate().
-- */
--extern AUTH *authdes_pk_seccreate(const char *, netobj *, u_int, const char *,
--        const des_block *, nis_server *);
--
--AUTH *
--authdes_pk_create(servername, pkey, window, syncaddr, ckey)
--	char *servername;		/* network name of server */
--	netobj *pkey;			/* public key */
--	u_int window;			/* time to live */
--	struct sockaddr *syncaddr;	/* optional hostaddr to sync with */
--	des_block *ckey;		/* optional conversation key to use */
--{
--	AUTH *nauth;
--	char hostname[NI_MAXHOST];
--
--	if (syncaddr) {
--		/*
--		 * Change addr to hostname, because that is the way
--		 * new interface takes it.
--		 */
--	        switch (syncaddr->sa_family) {
--		case AF_INET:
--		  if (getnameinfo(syncaddr, sizeof(struct sockaddr_in), hostname,
--				  sizeof hostname, NULL, 0, 0) != 0)
--		    goto fallback;
--		  break;
--		default:
--		  goto fallback;
--		}
--		nauth = authdes_pk_seccreate(servername, pkey, window, hostname, ckey, NULL);
--		return (nauth);
--	}
--fallback:
--	return authdes_pk_seccreate(servername, pkey, window, NULL, ckey, NULL);
--}
--
--
--/*
-  * Create a client handle for a unix connection. Obsoleted by clnt_vc_create()
-  */
- CLIENT *
--- 
-2.4.6
-
diff --git a/package/libtirpc/0006-rpc-types.h-fix-musl-build.patch b/package/libtirpc/0006-rpc-types.h-fix-musl-build.patch
deleted file mode 100644
index d4bcd80991..0000000000
--- a/package/libtirpc/0006-rpc-types.h-fix-musl-build.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 238f0a870f577e8fffd92820e1c1a88d4fc6d35f Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 10 Jun 2018 19:48:21 +0200
-Subject: [PATCH] rpc/types.h: fix musl build
-
-Don't redefine existing typedef (u_char, u_long, ...) on musl
-
-Fixes:
- - http://autobuild.buildroot.net/results/dbc07e383605a84eb19a2fd1899668612212518a
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- tirpc/rpc/types.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tirpc/rpc/types.h b/tirpc/rpc/types.h
-index f069efa..0153a5c 100644
---- a/tirpc/rpc/types.h
-+++ b/tirpc/rpc/types.h
-@@ -66,7 +66,7 @@ typedef   int32_t rpc_inline_t;
- #define mem_free(ptr, bsize)	free(ptr)
- 
- 
--#if defined __APPLE_CC__ || defined __FreeBSD__
-+#if defined __APPLE_CC__ || defined __FreeBSD__ || !defined (__GLIBC__)
- # define __u_char_defined
- # define __daddr_t_defined
- #endif
--- 
-2.14.1
-
diff --git a/package/libtirpc/libtirpc.hash b/package/libtirpc/libtirpc.hash
index eacc94d1de..84880290f1 100644
--- a/package/libtirpc/libtirpc.hash
+++ b/package/libtirpc/libtirpc.hash
@@ -1,5 +1,4 @@
 # From sourceforge's info on download page:
-sha1 d85717035cb9bd6c45557a1eb1351d3af9a69ff7  libtirpc-1.1.4.tar.bz2
 # Locally computed
-sha256 2ca529f02292e10c158562295a1ffd95d2ce8af97820e3534fe1b0e3aec7561d  libtirpc-1.1.4.tar.bz2
+sha256 f3b6350c7e9c3cd9c58fc7a5e5f8e6be469cc571bb5eb31eb9790b3e675186ca  libtirpc-1.2.5.tar.bz2
 sha256 17cf6098f95bdbb269f0bbc68e76c88fe20487ca7ec53f454923ab4256ecd2e7  COPYING
diff --git a/package/libtirpc/libtirpc.mk b/package/libtirpc/libtirpc.mk
index 1e1905b713..879b21e665 100644
--- a/package/libtirpc/libtirpc.mk
+++ b/package/libtirpc/libtirpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTIRPC_VERSION = 1.1.4
+LIBTIRPC_VERSION = 1.2.5
 LIBTIRPC_SOURCE = libtirpc-$(LIBTIRPC_VERSION).tar.bz2
 LIBTIRPC_SITE = http://downloads.sourceforge.net/project/libtirpc/libtirpc/$(LIBTIRPC_VERSION)
 LIBTIRPC_LICENSE = BSD-3-Clause
-- 
2.24.0

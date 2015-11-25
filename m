From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Nov 2015 12:10:31 +0100
Subject: [Buildroot] [git commit] libtirpc: bump to version 1.0.1
Message-ID: <20151201232122.78E818194A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7c91721dee30dbed4e3909dc3feff3bc46d166f5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adjust patch 0001 to trivial changes.
Adjust patch 0007 to remove new DES things.
Add patch 0008 directly from upstream to fix a late problem in the
1.0.1 release.

Signed-off-by: Peter Rosin <peda@axentia.se>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...able-parts-of-TIRPC-requiring-NIS-support.patch | 14 ++--
 ...0007-Disable-DES-authentification-support.patch | 93 +++++++++++++++++++---
 ...d-missing-rwlock_unlocks-in-xprt_register.patch | 63 +++++++++++++++
 package/libtirpc/libtirpc.hash                     |  4 +-
 package/libtirpc/libtirpc.mk                       |  2 +-
 5 files changed, 157 insertions(+), 19 deletions(-)

diff --git a/package/libtirpc/0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch b/package/libtirpc/0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch
index 7f58ab3..e51c5a4 100644
--- a/package/libtirpc/0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch
+++ b/package/libtirpc/0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch
@@ -11,6 +11,8 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 [joerg.krause at embedded.rocks: update for 0.3.2]
 Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
+[peda at axentia.se: update for 1.0.1]
+Signed-off-by: Peter Rosin <peda@axentia.se>
 ---
  src/Makefile.am | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)
@@ -19,23 +21,23 @@ diff --git a/src/Makefile.am b/src/Makefile.am
 index 6cc567a..9834f9a 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
-@@ -51,7 +51,7 @@ libtirpc_la_SOURCES = auth_none.c auth_unix.c authunix_prot.c bindresvport.c cln
-         rpc_callmsg.c rpc_generic.c rpc_soc.c rpcb_clnt.c rpcb_prot.c \
+@@ -24,7 +24,7 @@ libtirpc_la_SOURCES = auth_none.c auth_unix.c authunix_prot.c bindresvport.c cln
          rpcb_st_xdr.c svc.c svc_auth.c svc_dg.c svc_auth_unix.c svc_auth_none.c \
+ 	svc_auth_des.c \
          svc_generic.c svc_raw.c svc_run.c svc_simple.c svc_vc.c getpeereid.c \
 -        auth_time.c auth_des.c authdes_prot.c debug.c
 +        auth_des.c authdes_prot.c debug.c
  
  ## XDR
- libtirpc_la_SOURCES += xdr.c xdr_rec.c xdr_array.c xdr_float.c xdr_mem.c xdr_reference.c xdr_stdio.c
-@@ -68,8 +68,8 @@ if GSS
+ libtirpc_la_SOURCES += xdr.c xdr_rec.c xdr_array.c xdr_float.c xdr_mem.c xdr_reference.c xdr_stdio.c xdr_sizeof.c
+@@ -41,8 +41,8 @@ if GSS
      libtirpc_la_CFLAGS = -DHAVE_RPCSEC_GSS $(GSSAPI_CFLAGS)
  endif
  
 -libtirpc_la_SOURCES += key_call.c key_prot_xdr.c getpublickey.c
--libtirpc_la_SOURCES += netname.c netnamer.c rtime.c
+-libtirpc_la_SOURCES += netname.c netnamer.c rpcdname.c rtime.c
 +#libtirpc_la_SOURCES += key_call.c key_prot_xdr.c getpublickey.c
-+#libtirpc_la_SOURCES += netname.c netnamer.c rtime.c
++#libtirpc_la_SOURCES += netname.c netnamer.c rpcdname.c rtime.c
  
  CLEANFILES	       = cscope.* *~
  DISTCLEANFILES	       = Makefile.in
diff --git a/package/libtirpc/0007-Disable-DES-authentification-support.patch b/package/libtirpc/0007-Disable-DES-authentification-support.patch
index c251811..59a77ff 100644
--- a/package/libtirpc/0007-Disable-DES-authentification-support.patch
+++ b/package/libtirpc/0007-Disable-DES-authentification-support.patch
@@ -9,6 +9,8 @@ Content-Transfer-Encoding: 8bit
 uClibc and musl does not provide DES authentication.
 
 Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
+[peda at axentia.se: update for 1.0.1]
+Signed-off-by: Peter Rosin <peda@axentia.se>
 ---
  src/Makefile.am |  2 +-
  src/rpc_soc.c   | 32 --------------------------------
@@ -18,20 +20,43 @@ diff --git a/src/Makefile.am b/src/Makefile.am
 index 960a522..3a88e31 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
-@@ -51,7 +51,7 @@ libtirpc_la_SOURCES = auth_none.c auth_unix.c authunix_prot.c bindresvport.c cln
+@@ -22,9 +22,8 @@ libtirpc_la_SOURCES = auth_none.c auth_unix.c authunix_prot.c bindresvport.c cln
+         pmap_prot.c pmap_prot2.c pmap_rmt.c rpc_prot.c rpc_commondata.c \
          rpc_callmsg.c rpc_generic.c rpc_soc.c rpcb_clnt.c rpcb_prot.c \
          rpcb_st_xdr.c svc.c svc_auth.c svc_dg.c svc_auth_unix.c svc_auth_none.c \
+-	svc_auth_des.c \
          svc_generic.c svc_raw.c svc_run.c svc_simple.c svc_vc.c getpeereid.c \
 -        auth_des.c authdes_prot.c debug.c
 +        debug.c
  
  ## XDR
- libtirpc_la_SOURCES += xdr.c xdr_rec.c xdr_array.c xdr_float.c xdr_mem.c xdr_reference.c xdr_stdio.c
+ libtirpc_la_SOURCES += xdr.c xdr_rec.c xdr_array.c xdr_float.c xdr_mem.c xdr_reference.c xdr_stdio.c xdr_sizeof.c
+diff --git a/src/svc_auth.c b/src/svc_auth.c
+--- a/src/svc_auth.c
++++ b/src/svc_auth.c
+@@ -114,9 +114,6 @@ _gss_authenticate(rqst, msg, no_dispatch)
+ 	case AUTH_SHORT:
+ 		dummy = _svcauth_short(rqst, msg);
+ 		return (dummy);
+-	case AUTH_DES:
+-		dummy = _svcauth_des(rqst, msg);
+-		return (dummy);
+ #ifdef HAVE_RPCSEC_GSS
+ 	case RPCSEC_GSS:
+ 		dummy = _svcauth_gss(rqst, msg, no_dispatch);
 diff --git a/src/rpc_soc.c b/src/rpc_soc.c
 index e146ed4..161a1ec 100644
 --- a/src/rpc_soc.c
 +++ b/src/rpc_soc.c
-@@ -521,38 +521,6 @@ clnt_broadcast(prog, vers, proc, xargs, argsp, xresults, resultsp, eachresult)
+@@ -61,7 +61,6 @@ #ifdef PORTMAP
+ #include <string.h>
+ #include <unistd.h>
+ #include <fcntl.h>
+-#include <rpcsvc/nis.h>
+ 
+ #include "rpc_com.h"
+ 
+@@ -522,86 +521,6 @@ clnt_broadcast(prog, vers, proc, xargs, argsp, xresults, resultsp, eachresult)
  }
  
  /*
@@ -45,7 +70,6 @@ index e146ed4..161a1ec 100644
 -	struct sockaddr *syncaddr;	/* optional hostaddr to sync with */
 -	des_block *ckey;		/* optional conversation key to use */
 -{
--	AUTH *dummy;
 -	AUTH *nauth;
 -	char hostname[NI_MAXHOST];
 -
@@ -54,19 +78,68 @@ index e146ed4..161a1ec 100644
 -		 * Change addr to hostname, because that is the way
 -		 * new interface takes it.
 -		 */
--		if (getnameinfo(syncaddr, sizeof(syncaddr), hostname,
--		    sizeof hostname, NULL, 0, 0) != 0)
--			goto fallback;
--
+-	        switch (syncaddr->sa_family) {
+-		case AF_INET:
+-		  if (getnameinfo(syncaddr, sizeof(struct sockaddr_in), hostname,
+-				  sizeof hostname, NULL, 0, 0) != 0)
+-		    goto fallback;
+-		  break;
+-		case AF_INET6:
+-		  if (getnameinfo(syncaddr, sizeof(struct sockaddr_in6), hostname,
+-				  sizeof hostname, NULL, 0, 0) != 0)
+-		    goto fallback;
+-		  break;
+-		default:
+-		  goto fallback;
+-		}
 -		nauth = authdes_seccreate(servername, window, hostname, ckey);
 -		return (nauth);
 -	}
 -fallback:
--	dummy = authdes_seccreate(servername, window, NULL, ckey);
--	return (dummy);
+-	return authdes_seccreate(servername, window, NULL, ckey);
 -}
 -
 -/*
+- * Create the client des authentication object. Obsoleted by
+- * authdes_pk_seccreate().
+- */
+-extern AUTH *authdes_pk_seccreate(const char *, netobj *, u_int, const char *,
+-        const des_block *, nis_server *);
+-
+-AUTH *
+-authdes_pk_create(servername, pkey, window, syncaddr, ckey)
+-	char *servername;		/* network name of server */
+-	netobj *pkey;			/* public key */
+-	u_int window;			/* time to live */
+-	struct sockaddr *syncaddr;	/* optional hostaddr to sync with */
+-	des_block *ckey;		/* optional conversation key to use */
+-{
+-	AUTH *nauth;
+-	char hostname[NI_MAXHOST];
+-
+-	if (syncaddr) {
+-		/*
+-		 * Change addr to hostname, because that is the way
+-		 * new interface takes it.
+-		 */
+-	        switch (syncaddr->sa_family) {
+-		case AF_INET:
+-		  if (getnameinfo(syncaddr, sizeof(struct sockaddr_in), hostname,
+-				  sizeof hostname, NULL, 0, 0) != 0)
+-		    goto fallback;
+-		  break;
+-		default:
+-		  goto fallback;
+-		}
+-		nauth = authdes_pk_seccreate(servername, pkey, window, hostname, ckey, NULL);
+-		return (nauth);
+-	}
+-fallback:
+-	return authdes_pk_seccreate(servername, pkey, window, NULL, ckey, NULL);
+-}
+-
+-
+-/*
   * Create a client handle for a unix connection. Obsoleted by clnt_vc_create()
   */
  CLIENT *
diff --git a/package/libtirpc/0008-Add-missing-rwlock_unlocks-in-xprt_register.patch b/package/libtirpc/0008-Add-missing-rwlock_unlocks-in-xprt_register.patch
new file mode 100644
index 0000000..56b5bf8
--- /dev/null
+++ b/package/libtirpc/0008-Add-missing-rwlock_unlocks-in-xprt_register.patch
@@ -0,0 +1,63 @@
+From 4f1503e84b2f7bd229a097335e52fb8203f5bb0b Mon Sep 17 00:00:00 2001
+From: Michael Forney <mforney@mforney.org>
+Date: Wed, 4 Nov 2015 13:58:06 -0500
+Subject: [PATCH] Add missing rwlock_unlocks in xprt_register
+
+It looks like in b2c9430f46c4ac848957fb8adaac176a3f6ac03f when svc_run
+switched to poll, an early return was added, but the rwlock was not
+unlocked.
+
+I observed that rpcbind built against libtirpc-1.0.1 would handle only
+one request before hanging, and tracked it down to a missing
+rwlock_unlock here.
+
+Fixes: b2c9430f46c4 ('Use poll() instead of select() in svc_run()')
+Signed-off-by: Michael Forney <mforney@mforney.org>
+Signed-off-by: Steve Dickson <steved@redhat.com>
+[peda at axentia.se: backport from upstream]
+Signed-off-by: Peter Rosin <peda@axentia.se>
+---
+ src/svc.c | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/src/svc.c b/src/svc.c
+index 9c41445..b59467b 100644
+--- a/src/svc.c
++++ b/src/svc.c
+@@ -99,7 +99,7 @@ xprt_register (xprt)
+     {
+       __svc_xports = (SVCXPRT **) calloc (_rpc_dtablesize(), sizeof (SVCXPRT *));
+       if (__svc_xports == NULL)
+-	return;
++            goto unlock;
+     }
+   if (sock < _rpc_dtablesize())
+     {
+@@ -120,14 +120,14 @@ xprt_register (xprt)
+             svc_pollfd[i].fd = sock;
+             svc_pollfd[i].events = (POLLIN | POLLPRI |
+                                     POLLRDNORM | POLLRDBAND);
+-            return;
++            goto unlock;
+           }
+ 
+       new_svc_pollfd = (struct pollfd *) realloc (svc_pollfd,
+                                                   sizeof (struct pollfd)
+                                                   * (svc_max_pollfd + 1));
+       if (new_svc_pollfd == NULL) /* Out of memory */
+-        return;
++        goto unlock;
+       svc_pollfd = new_svc_pollfd;
+       ++svc_max_pollfd;
+ 
+@@ -135,6 +135,7 @@ xprt_register (xprt)
+       svc_pollfd[svc_max_pollfd - 1].events = (POLLIN | POLLPRI |
+                                                POLLRDNORM | POLLRDBAND);
+     }
++unlock:
+   rwlock_unlock (&svc_fd_lock);
+ }
+ 
+-- 
+2.5.3
+
diff --git a/package/libtirpc/libtirpc.hash b/package/libtirpc/libtirpc.hash
index f171870..cd65164 100644
--- a/package/libtirpc/libtirpc.hash
+++ b/package/libtirpc/libtirpc.hash
@@ -1,4 +1,4 @@
 # From sourceforge's info on download page:
-sha1   af9b74d0c4d1499a7b1a43e396e5b7d62180ea65  libtirpc-0.3.2.tar.bz2
+sha1   8da1636f98b5909c0d587e7534bc1e91f5c1a970  libtirpc-1.0.1.tar.bz2
 # Locally computed
-sha256 2008a379f37f2c5d5a87a568b06707422cc3e4f5da305f7fb71f3f4c6d473ffc  libtirpc-0.3.2.tar.bz2
+sha256 5156974f31be7ccbc8ab1de37c4739af6d9d42c87b1d5caf4835dda75fcbb89e  libtirpc-1.0.1.tar.bz2
diff --git a/package/libtirpc/libtirpc.mk b/package/libtirpc/libtirpc.mk
index 8f49356..70a31ac 100644
--- a/package/libtirpc/libtirpc.mk
+++ b/package/libtirpc/libtirpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTIRPC_VERSION = 0.3.2
+LIBTIRPC_VERSION = 1.0.1
 LIBTIRPC_SOURCE = libtirpc-$(LIBTIRPC_VERSION).tar.bz2
 LIBTIRPC_SITE = http://downloads.sourceforge.net/project/libtirpc/libtirpc/$(LIBTIRPC_VERSION)
 LIBTIRPC_LICENSE = BSD-3c

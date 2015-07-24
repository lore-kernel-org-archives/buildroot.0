From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Fri, 24 Jul 2015 17:19:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/libtirpc: fix undefined reference
	to _authdes_seccreate
Message-ID: <1437751142-3532-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 1c4767fa9d8c19b52824b1c10e0e25f413111f2d disables the C files auth_des.c
and authdes_prot.c implementing DES authentification but forgets to remove
a function call to authdes_seccreate() in rpc_soc.c.

We add a seperate patch to disable the DES authentification (and not disable it
together with NIS). DES is not provided by uClibc and musl.

Fixes:
http://autobuild.buildroot.org/results/33f/33f1849c6d1441d8565835872281e33a980aba6f/
http://autobuild.buildroot.net/results/02e/02e9321b54d41b4b5c91d93c9942499a20d26919/

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 ...able-parts-of-TIRPC-requiring-NIS-support.patch |  6 +-
 ...0007-Disable-DES-authentification-support.patch | 75 ++++++++++++++++++++++
 2 files changed, 78 insertions(+), 3 deletions(-)
 create mode 100644 package/libtirpc/0007-Disable-DES-authentification-support.patch

diff --git a/package/libtirpc/0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch b/package/libtirpc/0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch
index ea30fb2..7f58ab3 100644
--- a/package/libtirpc/0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch
+++ b/package/libtirpc/0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch
@@ -1,4 +1,4 @@
-From cb2f393afdb444bf97a7327991f8f5a2c2f64082 Mon Sep 17 00:00:00 2001
+From 15adb318818f5d0ac609ef2b87643dd760487cb6 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
 Date: Mon, 20 Jul 2015 20:30:11 +0200
 Subject: [PATCH 1/1] Disable parts of TIRPC requiring NIS support
@@ -16,7 +16,7 @@ Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/src/Makefile.am b/src/Makefile.am
-index 6cc567a..2b26a29 100644
+index 6cc567a..9834f9a 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
 @@ -51,7 +51,7 @@ libtirpc_la_SOURCES = auth_none.c auth_unix.c authunix_prot.c bindresvport.c cln
@@ -24,7 +24,7 @@ index 6cc567a..2b26a29 100644
          rpcb_st_xdr.c svc.c svc_auth.c svc_dg.c svc_auth_unix.c svc_auth_none.c \
          svc_generic.c svc_raw.c svc_run.c svc_simple.c svc_vc.c getpeereid.c \
 -        auth_time.c auth_des.c authdes_prot.c debug.c
-+        debug.c
++        auth_des.c authdes_prot.c debug.c
  
  ## XDR
  libtirpc_la_SOURCES += xdr.c xdr_rec.c xdr_array.c xdr_float.c xdr_mem.c xdr_reference.c xdr_stdio.c
diff --git a/package/libtirpc/0007-Disable-DES-authentification-support.patch b/package/libtirpc/0007-Disable-DES-authentification-support.patch
new file mode 100644
index 0000000..c251811
--- /dev/null
+++ b/package/libtirpc/0007-Disable-DES-authentification-support.patch
@@ -0,0 +1,75 @@
+From 79975eb4104667be85abd06874c258438826b674 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Fri, 24 Jul 2015 14:45:52 +0200
+Subject: [PATCH] Disable DES authentification support
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+uClibc and musl does not provide DES authentication.
+
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+---
+ src/Makefile.am |  2 +-
+ src/rpc_soc.c   | 32 --------------------------------
+ 2 files changed, 1 insertion(+), 33 deletions(-)
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 960a522..3a88e31 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -51,7 +51,7 @@ libtirpc_la_SOURCES = auth_none.c auth_unix.c authunix_prot.c bindresvport.c cln
+         rpc_callmsg.c rpc_generic.c rpc_soc.c rpcb_clnt.c rpcb_prot.c \
+         rpcb_st_xdr.c svc.c svc_auth.c svc_dg.c svc_auth_unix.c svc_auth_none.c \
+         svc_generic.c svc_raw.c svc_run.c svc_simple.c svc_vc.c getpeereid.c \
+-        auth_des.c authdes_prot.c debug.c
++        debug.c
+ 
+ ## XDR
+ libtirpc_la_SOURCES += xdr.c xdr_rec.c xdr_array.c xdr_float.c xdr_mem.c xdr_reference.c xdr_stdio.c
+diff --git a/src/rpc_soc.c b/src/rpc_soc.c
+index e146ed4..161a1ec 100644
+--- a/src/rpc_soc.c
++++ b/src/rpc_soc.c
+@@ -521,38 +521,6 @@ clnt_broadcast(prog, vers, proc, xargs, argsp, xresults, resultsp, eachresult)
+ }
+ 
+ /*
+- * Create the client des authentication object. Obsoleted by
+- * authdes_seccreate().
+- */
+-AUTH *
+-authdes_create(servername, window, syncaddr, ckey)
+-	char *servername;		/* network name of server */
+-	u_int window;			/* time to live */
+-	struct sockaddr *syncaddr;	/* optional hostaddr to sync with */
+-	des_block *ckey;		/* optional conversation key to use */
+-{
+-	AUTH *dummy;
+-	AUTH *nauth;
+-	char hostname[NI_MAXHOST];
+-
+-	if (syncaddr) {
+-		/*
+-		 * Change addr to hostname, because that is the way
+-		 * new interface takes it.
+-		 */
+-		if (getnameinfo(syncaddr, sizeof(syncaddr), hostname,
+-		    sizeof hostname, NULL, 0, 0) != 0)
+-			goto fallback;
+-
+-		nauth = authdes_seccreate(servername, window, hostname, ckey);
+-		return (nauth);
+-	}
+-fallback:
+-	dummy = authdes_seccreate(servername, window, NULL, ckey);
+-	return (dummy);
+-}
+-
+-/*
+  * Create a client handle for a unix connection. Obsoleted by clnt_vc_create()
+  */
+ CLIENT *
+-- 
+2.4.6
+
-- 
2.4.6

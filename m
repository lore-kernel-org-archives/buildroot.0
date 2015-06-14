From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jun 2015 16:29:05 +0200
Subject: [Buildroot] [PATCH 1/2 v2] package/libtirpc: bump version
In-Reply-To: <cover.1434292018.git.yann.morin.1998@free.fr>
References: <cover.1434292018.git.yann.morin.1998@free.fr>
Message-ID: <09555f7a62006a5327be21dc3705ef6547c0a8c7.1434292018.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to version 0.3.1:
  - update our patches
  - rename patches for proper numbering
  - drop patch 0007, applied upstream

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Baruch Siach <baruch@tkos.co.il>

---
Changes v1 -> v2:
  - fix title  (Baruch)

---
Notes:
libtirpc does not build with musl. This is not a regression compared to
the previous version, which did already fail. Thus, no new dependency
has been added to libtirpc in this patch. A separate will be coming,
which adds such additional dependencies (that need to be propagated to
a few packages...).
---
 ...able-parts-of-TIRPC-requiring-NIS-support.patch | 66 ++++------------------
 ...out-RPC-support-does-not-install-rpcent.h.patch | 18 +++---
 ...dd-rpcgen-program-from-nfs-utils-sources.patch} | 19 ++++---
 ...y-generate-XDR-header-files-from-.x-sour.patch} | 53 ++++++++---------
 ...-files-needed-to-build-rpcbind-on-top-of.patch} | 27 +++++----
 ...g-config-needs-pthread-as-private-library.patch | 36 ------------
 package/libtirpc/libtirpc.hash                     |  4 +-
 package/libtirpc/libtirpc.mk                       |  2 +-
 8 files changed, 77 insertions(+), 148 deletions(-)
 rename package/libtirpc/{0004-Add-rpcgen-program-from-nfs-utils-sources.patch => 0003-Add-rpcgen-program-from-nfs-utils-sources.patch} (99%)
 rename package/libtirpc/{0005-Automatically-generate-XDR-header-files-from-.x-sour.patch => 0004-Automatically-generate-XDR-header-files-from-.x-sour.patch} (97%)
 rename package/libtirpc/{0006-Add-more-XDR-files-needed-to-build-rpcbind-on-top-of.patch => 0005-Add-more-XDR-files-needed-to-build-rpcbind-on-top-of.patch} (98%)
 delete mode 100644 package/libtirpc/0007-pkg-config-needs-pthread-as-private-library.patch

diff --git a/package/libtirpc/0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch b/package/libtirpc/0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch
index 9bcca8a..78d363b 100644
--- a/package/libtirpc/0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch
+++ b/package/libtirpc/0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch
@@ -1,70 +1,28 @@
-From 4285205401faeb12b4ed7ebbc4658af9eae73eb4 Mon Sep 17 00:00:00 2001
+From 609d0faa80afb1e391397c1029b67516281d6600 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Sat, 23 Jun 2012 21:57:39 +0200
-Subject: [PATCH] Disable parts of TIRPC requiring NIS support
+Subject: [PATCH 1/5] Disable parts of TIRPC requiring NIS support
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[yann.morin.1998 at free.fr: update for 0.3.1]
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 ---
- src/Makefile.am  | 3 +--
- src/rpc_soc.c    | 2 ++
- tirpc/rpc/auth.h | 3 +++
- 3 files changed, 6 insertions(+), 2 deletions(-)
+ src/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/Makefile.am b/src/Makefile.am
-index 3029b78..b5db263 100644
+index 75bd4bf..7428e92 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
-@@ -50,8 +50,7 @@ libtirpc_la_SOURCES = auth_none.c auth_unix.c authunix_prot.c bindresvport.c cln
-         pmap_prot.c pmap_prot2.c pmap_rmt.c rpc_prot.c rpc_commondata.c \
+@@ -52,7 +52,7 @@ libtirpc_la_SOURCES = auth_none.c auth_unix.c authunix_prot.c bindresvport.c cln
          rpc_callmsg.c rpc_generic.c rpc_soc.c rpcb_clnt.c rpcb_prot.c \
          rpcb_st_xdr.c svc.c svc_auth.c svc_dg.c svc_auth_unix.c svc_auth_none.c \
--        svc_generic.c svc_raw.c svc_run.c svc_simple.c svc_vc.c getpeereid.c \
--        auth_time.c auth_des.c authdes_prot.c
-+        svc_generic.c svc_raw.c svc_run.c svc_simple.c svc_vc.c getpeereid.c
+         svc_generic.c svc_raw.c svc_run.c svc_simple.c svc_vc.c getpeereid.c \
+-        auth_time.c debug.c
++        debug.c
  
  ## XDR
  libtirpc_la_SOURCES += xdr.c xdr_rec.c xdr_array.c xdr_float.c xdr_mem.c xdr_reference.c xdr_stdio.c
-diff --git a/src/rpc_soc.c b/src/rpc_soc.c
-index 4213ca0..2603548 100644
---- a/src/rpc_soc.c
-+++ b/src/rpc_soc.c
-@@ -520,6 +520,7 @@ clnt_broadcast(prog, vers, proc, xargs, argsp, xresults, resultsp, eachresult)
- 	    (resultproc_t) rpc_wrap_bcast, "udp");
- }
- 
-+#if 0
- /*
-  * Create the client des authentication object. Obsoleted by
-  * authdes_seccreate().
-@@ -551,6 +552,7 @@ fallback:
- 	dummy = authdes_seccreate(servername, window, NULL, ckey);
- 	return (dummy);
- }
-+#endif
- 
- /*
-  * Create a client handle for a unix connection. Obsoleted by clnt_vc_create()
-diff --git a/tirpc/rpc/auth.h b/tirpc/rpc/auth.h
-index 4ce11f0..b894e44 100644
---- a/tirpc/rpc/auth.h
-+++ b/tirpc/rpc/auth.h
-@@ -305,6 +305,8 @@ extern AUTH *authunix_create(char *, uid_t, uid_t, int, uid_t *);
- extern AUTH *authunix_create_default(void);	/* takes no parameters */
- extern AUTH *authnone_create(void);		/* takes no parameters */
- __END_DECLS
-+
-+#if 0
- /*
-  * DES style authentication
-  * AUTH *authsecdes_create(servername, window, timehost, ckey)
-@@ -318,6 +320,7 @@ extern AUTH *authdes_create (char *, u_int, struct sockaddr *, des_block *);
- extern AUTH *authdes_seccreate (const char *, const u_int, const  char *,
-     const  des_block *);
- __END_DECLS
-+#endif
- 
- __BEGIN_DECLS
- extern bool_t xdr_opaque_auth		(XDR *, struct opaque_auth *);
 -- 
-2.0.0
+1.9.1
 
diff --git a/package/libtirpc/0002-uClibc-without-RPC-support-does-not-install-rpcent.h.patch b/package/libtirpc/0002-uClibc-without-RPC-support-does-not-install-rpcent.h.patch
index 6ec5d8e..a1df333 100644
--- a/package/libtirpc/0002-uClibc-without-RPC-support-does-not-install-rpcent.h.patch
+++ b/package/libtirpc/0002-uClibc-without-RPC-support-does-not-install-rpcent.h.patch
@@ -1,23 +1,25 @@
-From a20f33ad121fb1e9d1fbc31a0044546450677e7a Mon Sep 17 00:00:00 2001
+From d5a47f89f5bad1ed7292b4ca8dbb7ffb6cb43d22 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Sat, 23 Jun 2012 21:58:07 +0200
-Subject: [PATCH] uClibc without RPC support does not install rpcent.h
+Subject: [PATCH 2/5] uClibc without RPC support does not install rpcent.h
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[yann.morin.1998 at free.fr: update for 0.3.1]
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 ---
  tirpc/rpc/rpcent.h | 5 +++--
  1 file changed, 3 insertions(+), 2 deletions(-)
 
 diff --git a/tirpc/rpc/rpcent.h b/tirpc/rpc/rpcent.h
-index c865e51..45775ed 100644
+index 147f909..39ab41c 100644
 --- a/tirpc/rpc/rpcent.h
 +++ b/tirpc/rpc/rpcent.h
-@@ -46,8 +46,9 @@
- 
- __BEGIN_DECLS
+@@ -48,8 +48,9 @@
+ extern "C" {
+ #endif
  
 -/* These are defined in /usr/include/rpc/netdb.h */
--#if 0
+-#if !defined(__GLIBC__)
 +/* These are defined in /usr/include/rpc/netdb.h, unless we are using
 +   the C library without RPC support. */
 +#if defined(__UCLIBC__) && !defined(__UCLIBC_HAS_RPC__)
@@ -25,5 +27,5 @@ index c865e51..45775ed 100644
  	char	*r_name;	/* name of server for this rpc program */
  	char	**r_aliases;	/* alias list */
 -- 
-2.0.0
+1.9.1
 
diff --git a/package/libtirpc/0004-Add-rpcgen-program-from-nfs-utils-sources.patch b/package/libtirpc/0003-Add-rpcgen-program-from-nfs-utils-sources.patch
similarity index 99%
rename from package/libtirpc/0004-Add-rpcgen-program-from-nfs-utils-sources.patch
rename to package/libtirpc/0003-Add-rpcgen-program-from-nfs-utils-sources.patch
index 195803c..388e036 100644
--- a/package/libtirpc/0004-Add-rpcgen-program-from-nfs-utils-sources.patch
+++ b/package/libtirpc/0003-Add-rpcgen-program-from-nfs-utils-sources.patch
@@ -1,9 +1,11 @@
-From c4c4550dafabda05d78ca4aa9969db8a4f70affe Mon Sep 17 00:00:00 2001
+From 8c8e5ccc7529963ab05c83948d8abe952792bf3f Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Sat, 10 Nov 2012 16:21:01 +0100
-Subject: [PATCH] Add rpcgen program from nfs-utils sources
+Subject: [PATCH 3/5] Add rpcgen program from nfs-utils sources
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[yann.morin.1998 at free.fr: update for 0.3.1]
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 ---
  Makefile.am          |    2 +-
  configure.ac         |   14 +-
@@ -42,7 +44,7 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  create mode 100644 rpcgen/rpcgen.1
 
 diff --git a/Makefile.am b/Makefile.am
-index 9b812eb..6edf029 100644
+index 2bf725c..330ebf9 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -1,4 +1,4 @@
@@ -52,12 +54,12 @@ index 9b812eb..6edf029 100644
  
  noinst_HEADERS	       = tirpc/reentrant.h \
 diff --git a/configure.ac b/configure.ac
-index 11df020..4110225 100644
+index 711b054..225f1c7 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -34,5 +34,17 @@ AC_CHECK_LIB([pthread], [pthread_create])
- AC_CHECK_LIB([nsl], [yp_get_default_domain])
- 
+@@ -49,6 +49,18 @@ AC_CHECK_HEADERS([arpa/inet.h fcntl.h libintl.h limits.h locale.h netdb.h netine
+ AC_CHECK_LIB([pthread], [pthread_create])
+ AC_CHECK_FUNCS([getrpcbyname getrpcbynumber setrpcent endrpcent getrpcent])
  
 -AC_CONFIG_FILES([Makefile src/Makefile man/Makefile doc/Makefile])
 +AM_CONDITIONAL(CROSS_COMPILING, test $cross_compiling = yes)
@@ -74,6 +76,7 @@ index 11df020..4110225 100644
 +AC_CONFIG_FILES([Makefile src/Makefile man/Makefile doc/Makefile rpcgen/Makefile])
 +
  AC_OUTPUT(libtirpc.pc)
+ 
 diff --git a/rpcgen/Makefile.am b/rpcgen/Makefile.am
 new file mode 100644
 index 0000000..2277b6f
@@ -6501,5 +6504,5 @@ index 0000000..89df7ed
 +.%T The rpcgen chapter in the NETP manual
 +.Re
 -- 
-2.0.0
+1.9.1
 
diff --git a/package/libtirpc/0005-Automatically-generate-XDR-header-files-from-.x-sour.patch b/package/libtirpc/0004-Automatically-generate-XDR-header-files-from-.x-sour.patch
similarity index 97%
rename from package/libtirpc/0005-Automatically-generate-XDR-header-files-from-.x-sour.patch
rename to package/libtirpc/0004-Automatically-generate-XDR-header-files-from-.x-sour.patch
index 023abd1..5c2cacb 100644
--- a/package/libtirpc/0005-Automatically-generate-XDR-header-files-from-.x-sour.patch
+++ b/package/libtirpc/0004-Automatically-generate-XDR-header-files-from-.x-sour.patch
@@ -1,36 +1,37 @@
-From 99ecb155efdfcf474c5701ab7e6ad1cbe88f500f Mon Sep 17 00:00:00 2001
+From 6206e9024afc7803b2f28f5706b09ece433059df Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Sat, 10 Nov 2012 17:29:53 +0100
-Subject: [PATCH] Automatically generate XDR header files from .x sources using
- rpcgen
+Subject: [PATCH 4/5] Automatically generate XDR header files from .x sources
+ using rpcgen
 
 [Gustavo: update after dropping non-IPv6 support]
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[yann.morin.1998 at free.fr: update for 0.3.1]
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 ---
- Makefile.am           |  22 +-
+ Makefile.am           |  19 +-
  src/Makefile.am       |   2 +-
  tirpc/rpc/rpcb_prot.h | 797 --------------------------------------------------
  tirpc/rpcsvc/crypt.h  | 109 -------
- 4 files changed, 20 insertions(+), 910 deletions(-)
+ 4 files changed, 17 insertions(+), 910 deletions(-)
  delete mode 100644 tirpc/rpc/rpcb_prot.h
  delete mode 100644 tirpc/rpcsvc/crypt.h
 
 diff --git a/Makefile.am b/Makefile.am
-index 6edf029..4e4dc32 100644
+index 330ebf9..ee5578d 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -1,6 +1,10 @@
+@@ -1,6 +1,9 @@
  SUBDIRS = src man doc rpcgen
  ACLOCAL_AMFLAGS = -I m4
  
-+GENFILES = \
-+			tirpc/rpcsvc/crypt.h \
-+			tirpc/rpc/rpcb_prot.h
++GENFILES	       = tirpc/rpcsvc/crypt.h \
++			 tirpc/rpc/rpcb_prot.h
 +
  noinst_HEADERS	       = tirpc/reentrant.h \
  			 tirpc/getpeereid.h \
  			 tirpc/libc_private.h \
-@@ -8,7 +12,6 @@ noinst_HEADERS	       = tirpc/reentrant.h \
+@@ -8,7 +11,6 @@ noinst_HEADERS	       = tirpc/reentrant.h \
  
  nobase_include_HEADERS = tirpc/netconfig.h \
  			 tirpc/rpcsvc/crypt.x \
@@ -38,7 +39,7 @@ index 6edf029..4e4dc32 100644
  			 tirpc/rpc/xdr.h \
  			 tirpc/rpc/types.h \
  			 tirpc/rpc/svc_soc.h \
-@@ -20,7 +23,6 @@ nobase_include_HEADERS = tirpc/netconfig.h \
+@@ -21,7 +23,6 @@ nobase_include_HEADERS = tirpc/netconfig.h \
  			 tirpc/rpc/rpcent.h \
  			 tirpc/rpc/rpc_com.h \
  			 tirpc/rpc/rpcb_prot.x \
@@ -46,12 +47,11 @@ index 6edf029..4e4dc32 100644
  			 tirpc/rpc/rpcb_clnt.h \
  			 tirpc/rpc/raw.h \
  			 tirpc/rpc/pmap_rmt.h \
-@@ -37,7 +39,21 @@ nobase_include_HEADERS = tirpc/netconfig.h \
- 			 tirpc/rpc/auth.h \
- 			 tirpc/rpc/auth_gss.h \
- 			 tirpc/rpc/auth_des.h
--    
-+
+@@ -46,5 +47,17 @@ endif
+ pkgconfigdir=$(libdir)/pkgconfig
+ pkgconfig_DATA = libtirpc.pc
+ 
+-CLEANFILES	       = cscope.* *~
 +nobase_nodist_include_HEADERS = $(GENFILES)
 +BUILT_SOURCES = $(GENFILES)
 +
@@ -64,20 +64,17 @@ index 6edf029..4e4dc32 100644
 +
 +force:
 +
-+CLEANFILES = $(GENFILES)
-+
- pkgconfigdir=$(libdir)/pkgconfig
- pkgconfig_DATA = libtirpc.pc
- 
++CLEANFILES	       = cscope.* *~ $(GENFILES)
+ DISTCLEANFILES	       = Makefile.in libtirpc*.tar.gz
 diff --git a/src/Makefile.am b/src/Makefile.am
-index f086255..a9db71b 100644
+index 7428e92..0356171 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
 @@ -8,7 +8,7 @@
- noinst_HEADERS = rpc_com.h
+ noinst_HEADERS = rpc_com.h debug.h
  
- AM_CPPFLAGS = -I$(top_srcdir)/tirpc -DPORTMAP -DINET6 \
--		-D_GNU_SOURCE -Wall -pipe  
+ AM_CPPFLAGS = -I$(top_srcdir)/tirpc -include config.h -DPORTMAP -DINET6 \
+-		-D_GNU_SOURCE -Wall -pipe
 +		-D_GNU_SOURCE -Wall -pipe -I$(top_builddir)/tirpc
  
  lib_LTLIBRARIES = libtirpc.la
@@ -1001,5 +998,5 @@ index da1f9cc..0000000
 -
 -#endif /* !_CRYPT_H_RPCGEN */
 -- 
-2.0.0
+1.9.1
 
diff --git a/package/libtirpc/0006-Add-more-XDR-files-needed-to-build-rpcbind-on-top-of.patch b/package/libtirpc/0005-Add-more-XDR-files-needed-to-build-rpcbind-on-top-of.patch
similarity index 98%
rename from package/libtirpc/0006-Add-more-XDR-files-needed-to-build-rpcbind-on-top-of.patch
rename to package/libtirpc/0005-Add-more-XDR-files-needed-to-build-rpcbind-on-top-of.patch
index 638918b..d4627fa 100644
--- a/package/libtirpc/0006-Add-more-XDR-files-needed-to-build-rpcbind-on-top-of.patch
+++ b/package/libtirpc/0005-Add-more-XDR-files-needed-to-build-rpcbind-on-top-of.patch
@@ -1,9 +1,12 @@
-From 008a9c8ac3a84ffcc46a0eedb5b13862b279190c Mon Sep 17 00:00:00 2001
+From 44dca872476b2dc1de097974d3916765296e434b Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Sat, 10 Nov 2012 17:45:03 +0100
-Subject: [PATCH] Add more XDR files needed to build rpcbind on top of libtirpc
+Subject: [PATCH 5/5] Add more XDR files needed to build rpcbind on top of
+ libtirpc
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[yann.morin.1998 at free.fr: update for 0.3.1]
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 ---
  Makefile.am             |    6 +
  tirpc/rpcsvc/mount.x    |  257 ++++++++++
@@ -15,20 +18,20 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  create mode 100644 tirpc/rpcsvc/rquota.x
 
 diff --git a/Makefile.am b/Makefile.am
-index 4e4dc32..b7ae979 100644
+index ee5578d..6803682 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -3,6 +3,9 @@ ACLOCAL_AMFLAGS = -I m4
+@@ -2,6 +2,9 @@ SUBDIRS = src man doc rpcgen
+ ACLOCAL_AMFLAGS = -I m4
  
- GENFILES = \
- 			tirpc/rpcsvc/crypt.h \
-+			tirpc/rpcsvc/mount.h \
-+			tirpc/rpcsvc/nfs_prot.h \
-+			tirpc/rpcsvc/rquota.h \
- 			tirpc/rpc/rpcb_prot.h
+ GENFILES	       = tirpc/rpcsvc/crypt.h \
++			 tirpc/rpcsvc/mount.h \
++			 tirpc/rpcsvc/nfs_prot.h \
++			 tirpc/rpcsvc/rquota.h \
+ 			 tirpc/rpc/rpcb_prot.h
  
  noinst_HEADERS	       = tirpc/reentrant.h \
-@@ -12,6 +15,9 @@ noinst_HEADERS	       = tirpc/reentrant.h \
+@@ -11,6 +14,9 @@ noinst_HEADERS	       = tirpc/reentrant.h \
  
  nobase_include_HEADERS = tirpc/netconfig.h \
  			 tirpc/rpcsvc/crypt.x \
@@ -1647,5 +1650,5 @@ index 0000000..72864d1
 +	} = 1;
 +} = 100011;
 -- 
-2.0.0
+1.9.1
 
diff --git a/package/libtirpc/0007-pkg-config-needs-pthread-as-private-library.patch b/package/libtirpc/0007-pkg-config-needs-pthread-as-private-library.patch
deleted file mode 100644
index f83b9e2..0000000
--- a/package/libtirpc/0007-pkg-config-needs-pthread-as-private-library.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 308705710d40ced3ea2a913d24ab99cc61bef01f Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Sun, 5 Apr 2015 18:11:25 +0200
-Subject: [PATCH] pkg-config: needs pthread as private library
-
-libtirpc needs pthreads. This is automatically pulled in when linking
-with the shared library, thanks to the DT_NEEDED ELF tags.
-
-But for a static library, there is no such mechanism to identify
-required libraries.
-
-Thus, add -pthread to the private libraries in the pkg-config file.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
----
-Patch sent upstream:
-    http://sourceforge.net/p/libtirpc/mailman/message/33072076/
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- libtirpc.pc.in | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/libtirpc.pc.in b/libtirpc.pc.in
-index ec4cf75..1dc85ea 100644
---- a/libtirpc.pc.in
-+++ b/libtirpc.pc.in
-@@ -8,4 +8,5 @@ Description: Transport Independent RPC Library
- Requires:
- Version: @PACKAGE_VERSION@
- Libs: -L at libdir@ -ltirpc
-+Libs.private: -pthread
- Cflags: -I at includedir@/tirpc
--- 
-2.1.0
-
diff --git a/package/libtirpc/libtirpc.hash b/package/libtirpc/libtirpc.hash
index 34fb0af..0a1cc98 100644
--- a/package/libtirpc/libtirpc.hash
+++ b/package/libtirpc/libtirpc.hash
@@ -1,2 +1,4 @@
+# From sourceforge's info on download page:
+sha1   0e0ef9123cf28cd0940148fabd23952476a8fcd6  libtirpc-0.3.1.tar.bz2
 # Locally computed
-sha256 45c3e21dfc23a5ba501f9dfc6671678316fdfdb8355a1ec404ae2aa2f81943a1  libtirpc-0.2.4.tar.bz2
+sha256 a8838fe180deb8a6f6e491ee665325a28dee4100ec6b1f0b86d611dbfe3a2bb8  libtirpc-0.3.1.tar.bz2
diff --git a/package/libtirpc/libtirpc.mk b/package/libtirpc/libtirpc.mk
index 5ad427b..f1ad395 100644
--- a/package/libtirpc/libtirpc.mk
+++ b/package/libtirpc/libtirpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTIRPC_VERSION = 0.2.4
+LIBTIRPC_VERSION = 0.3.1
 LIBTIRPC_SOURCE = libtirpc-$(LIBTIRPC_VERSION).tar.bz2
 LIBTIRPC_SITE = http://downloads.sourceforge.net/project/libtirpc/libtirpc/$(LIBTIRPC_VERSION)
 LIBTIRPC_LICENSE = BSD-3c
-- 
1.9.1

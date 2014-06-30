From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Jun 2014 13:56:08 +0200
Subject: [Buildroot] [PATCH 1/3] libtirpc: bump to 0.2.4
In-Reply-To: <1404129370-3090-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1404129370-3090-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1404129370-3090-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit bumps the version of libtirpc to the latest upstream
version 0.2.4, with the following changes on the patches:

 Updated to take into account minor upstream changes:

 - libtirpc-0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch
 - libtirpc-0002-uClibc-without-RPC-support-does-not-install-rpcent.h.patch
 - libtirpc-0004-Make-IPv6-support-optional.patch
 - libtirpc-0008-Add-rpcgen-program-from-nfs-utils-sources.patch
 - libtirpc-0009-Automatically-generate-XDR-header-files-from-.x-sour.patch
 - libtirpc-0010-Add-more-XDR-files-needed-to-build-rpcbind-on-top-of.patch

 Removed since they were merged upstream:

 - libtirpc-0003-Add-missing-INET6-conditional.patch
 - libtirpc-0005-rpcent-mark-getrpcbyname-name-argument-as-const-char.patch
 - libtirpc-0006-rpcent-remove-prototypes-of-reentrant-variants.patch
 - libtirpc-0007-doc-Makefile.am-fix-out-of-tree-installation.patch

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...able-parts-of-TIRPC-requiring-NIS-support.patch | 34 ++++++------
 ...out-RPC-support-does-not-install-rpcent.h.patch |  8 +--
 ...btirpc-0003-Add-missing-INET6-conditional.patch | 60 ----------------------
 .../libtirpc-0004-Make-IPv6-support-optional.patch | 35 ++++---------
 ...-getrpcbyname-name-argument-as-const-char.patch | 43 ----------------
 ...t-remove-prototypes-of-reentrant-variants.patch | 33 ------------
 ...-Makefile.am-fix-out-of-tree-installation.patch | 24 ---------
 ...Add-rpcgen-program-from-nfs-utils-sources.patch | 27 +++++-----
 ...ly-generate-XDR-header-files-from-.x-sour.patch | 51 +++++++++---------
 ...R-files-needed-to-build-rpcbind-on-top-of.patch | 24 +++++----
 package/libtirpc/libtirpc.mk                       |  4 +-
 11 files changed, 88 insertions(+), 255 deletions(-)
 delete mode 100644 package/libtirpc/libtirpc-0003-Add-missing-INET6-conditional.patch
 delete mode 100644 package/libtirpc/libtirpc-0005-rpcent-mark-getrpcbyname-name-argument-as-const-char.patch
 delete mode 100644 package/libtirpc/libtirpc-0006-rpcent-remove-prototypes-of-reentrant-variants.patch
 delete mode 100644 package/libtirpc/libtirpc-0007-doc-Makefile.am-fix-out-of-tree-installation.patch

diff --git a/package/libtirpc/libtirpc-0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch b/package/libtirpc/libtirpc-0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch
index 7caccc2..9bcca8a 100644
--- a/package/libtirpc/libtirpc-0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch
+++ b/package/libtirpc/libtirpc-0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch
@@ -1,34 +1,34 @@
-From cc4ec3294cb06724c83d4c4e1ea9fc2e38923c98 Mon Sep 17 00:00:00 2001
+From 4285205401faeb12b4ed7ebbc4658af9eae73eb4 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Sat, 23 Jun 2012 21:57:39 +0200
 Subject: [PATCH] Disable parts of TIRPC requiring NIS support
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 ---
- src/Makefile.am  |    3 +--
- src/rpc_soc.c    |    2 ++
- tirpc/rpc/auth.h |    3 +++
+ src/Makefile.am  | 3 +--
+ src/rpc_soc.c    | 2 ++
+ tirpc/rpc/auth.h | 3 +++
  3 files changed, 6 insertions(+), 2 deletions(-)
 
 diff --git a/src/Makefile.am b/src/Makefile.am
-index 7ee8cbc..6d36b93 100644
+index 3029b78..b5db263 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
-@@ -49,8 +49,7 @@ libtirpc_la_SOURCES = auth_none.c auth_unix.c authunix_prot.c bindresvport.c cln
+@@ -50,8 +50,7 @@ libtirpc_la_SOURCES = auth_none.c auth_unix.c authunix_prot.c bindresvport.c cln
          pmap_prot.c pmap_prot2.c pmap_rmt.c rpc_prot.c rpc_commondata.c \
          rpc_callmsg.c rpc_generic.c rpc_soc.c rpcb_clnt.c rpcb_prot.c \
-         rpcb_st_xdr.c svc.c svc_auth.c svc_dg.c svc_auth_unix.c svc_generic.c \
--        svc_raw.c svc_run.c svc_simple.c svc_vc.c getpeereid.c \
--        auth_time.c auth_des.c authdes_prot.c des_crypt.c
-+        svc_raw.c svc_run.c svc_simple.c svc_vc.c getpeereid.c
+         rpcb_st_xdr.c svc.c svc_auth.c svc_dg.c svc_auth_unix.c svc_auth_none.c \
+-        svc_generic.c svc_raw.c svc_run.c svc_simple.c svc_vc.c getpeereid.c \
+-        auth_time.c auth_des.c authdes_prot.c
++        svc_generic.c svc_raw.c svc_run.c svc_simple.c svc_vc.c getpeereid.c
  
  ## XDR
  libtirpc_la_SOURCES += xdr.c xdr_rec.c xdr_array.c xdr_float.c xdr_mem.c xdr_reference.c xdr_stdio.c
 diff --git a/src/rpc_soc.c b/src/rpc_soc.c
-index c678429..27f2136 100644
+index 4213ca0..2603548 100644
 --- a/src/rpc_soc.c
 +++ b/src/rpc_soc.c
-@@ -515,6 +515,7 @@ clnt_broadcast(prog, vers, proc, xargs, argsp, xresults, resultsp, eachresult)
+@@ -520,6 +520,7 @@ clnt_broadcast(prog, vers, proc, xargs, argsp, xresults, resultsp, eachresult)
  	    (resultproc_t) rpc_wrap_bcast, "udp");
  }
  
@@ -36,7 +36,7 @@ index c678429..27f2136 100644
  /*
   * Create the client des authentication object. Obsoleted by
   * authdes_seccreate().
-@@ -546,6 +547,7 @@ fallback:
+@@ -551,6 +552,7 @@ fallback:
  	dummy = authdes_seccreate(servername, window, NULL, ckey);
  	return (dummy);
  }
@@ -45,10 +45,10 @@ index c678429..27f2136 100644
  /*
   * Create a client handle for a unix connection. Obsoleted by clnt_vc_create()
 diff --git a/tirpc/rpc/auth.h b/tirpc/rpc/auth.h
-index 734e6b9..6e7e54e 100644
+index 4ce11f0..b894e44 100644
 --- a/tirpc/rpc/auth.h
 +++ b/tirpc/rpc/auth.h
-@@ -282,6 +282,8 @@ extern AUTH *authunix_create(char *, uid_t, uid_t, int, uid_t *);
+@@ -305,6 +305,8 @@ extern AUTH *authunix_create(char *, uid_t, uid_t, int, uid_t *);
  extern AUTH *authunix_create_default(void);	/* takes no parameters */
  extern AUTH *authnone_create(void);		/* takes no parameters */
  __END_DECLS
@@ -57,7 +57,7 @@ index 734e6b9..6e7e54e 100644
  /*
   * DES style authentication
   * AUTH *authsecdes_create(servername, window, timehost, ckey)
-@@ -295,6 +297,7 @@ extern AUTH *authdes_create (char *, u_int, struct sockaddr *, des_block *);
+@@ -318,6 +320,7 @@ extern AUTH *authdes_create (char *, u_int, struct sockaddr *, des_block *);
  extern AUTH *authdes_seccreate (const char *, const u_int, const  char *,
      const  des_block *);
  __END_DECLS
@@ -66,5 +66,5 @@ index 734e6b9..6e7e54e 100644
  __BEGIN_DECLS
  extern bool_t xdr_opaque_auth		(XDR *, struct opaque_auth *);
 -- 
-1.7.9.5
+2.0.0
 
diff --git a/package/libtirpc/libtirpc-0002-uClibc-without-RPC-support-does-not-install-rpcent.h.patch b/package/libtirpc/libtirpc-0002-uClibc-without-RPC-support-does-not-install-rpcent.h.patch
index 3ad25af..6ec5d8e 100644
--- a/package/libtirpc/libtirpc-0002-uClibc-without-RPC-support-does-not-install-rpcent.h.patch
+++ b/package/libtirpc/libtirpc-0002-uClibc-without-RPC-support-does-not-install-rpcent.h.patch
@@ -1,15 +1,15 @@
-From c2e96bdc453334f10faf8db0eb06e41ab3ca4fe9 Mon Sep 17 00:00:00 2001
+From a20f33ad121fb1e9d1fbc31a0044546450677e7a Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Sat, 23 Jun 2012 21:58:07 +0200
 Subject: [PATCH] uClibc without RPC support does not install rpcent.h
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 ---
- tirpc/rpc/rpcent.h |    5 +++--
+ tirpc/rpc/rpcent.h | 5 +++--
  1 file changed, 3 insertions(+), 2 deletions(-)
 
 diff --git a/tirpc/rpc/rpcent.h b/tirpc/rpc/rpcent.h
-index 7fd93d9..8ce05ed 100644
+index c865e51..45775ed 100644
 --- a/tirpc/rpc/rpcent.h
 +++ b/tirpc/rpc/rpcent.h
 @@ -46,8 +46,9 @@
@@ -25,5 +25,5 @@ index 7fd93d9..8ce05ed 100644
  	char	*r_name;	/* name of server for this rpc program */
  	char	**r_aliases;	/* alias list */
 -- 
-1.7.9.5
+2.0.0
 
diff --git a/package/libtirpc/libtirpc-0003-Add-missing-INET6-conditional.patch b/package/libtirpc/libtirpc-0003-Add-missing-INET6-conditional.patch
deleted file mode 100644
index a05d7ad..0000000
--- a/package/libtirpc/libtirpc-0003-Add-missing-INET6-conditional.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From a40e00a16cf43245953ad6d43a4f260a47e6d198 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sat, 23 Jun 2012 21:58:36 +0200
-Subject: [PATCH] Add missing INET6 conditional
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- src/rpc_generic.c |    2 ++
- src/svc_dg.c      |    4 ++++
- 2 files changed, 6 insertions(+)
-
-diff --git a/src/rpc_generic.c b/src/rpc_generic.c
-index 509fb36..2eb91ad 100644
---- a/src/rpc_generic.c
-+++ b/src/rpc_generic.c
-@@ -535,7 +535,9 @@ __rpc_nconf2fd_flags(const struct netconfig *nconf, int flags)
- 	    si.si_af == AF_INET6) {
- 		int val = 1;
- 
-+#ifdef INET6
- 		setsockopt(fd, SOL_IPV6, IPV6_V6ONLY, &val, sizeof(val));
-+#endif
- 	}
- 	return fd;
- }
-diff --git a/src/svc_dg.c b/src/svc_dg.c
-index 66a56ee..e8faf33 100644
---- a/src/svc_dg.c
-+++ b/src/svc_dg.c
-@@ -627,9 +627,11 @@ svc_dg_enable_pktinfo(int fd, const struct __rpc_sockinfo *si)
- 		(void) setsockopt(fd, SOL_IP, IP_PKTINFO, &val, sizeof(val));
- 		break;
- 
-+#ifdef INET6
- 	case AF_INET6:
- 		(void) setsockopt(fd, SOL_IPV6, IPV6_PKTINFO, &val, sizeof(val));
- 		break;
-+#endif
- 	}
- }
- 
-@@ -667,6 +669,7 @@ svc_dg_valid_pktinfo(struct msghdr *msg)
- 		}
- 		break;
- 
-+#ifdef INET6
- 	case AF_INET6:
- 		if (cmsg->cmsg_level != SOL_IPV6
- 		 || cmsg->cmsg_type != IPV6_PKTINFO
-@@ -679,6 +682,7 @@ svc_dg_valid_pktinfo(struct msghdr *msg)
- 			pkti->ipi6_ifindex = 0;
- 		}
- 		break;
-+#endif
- 
- 	default:
- 		return 0;
--- 
-1.7.9.5
-
diff --git a/package/libtirpc/libtirpc-0004-Make-IPv6-support-optional.patch b/package/libtirpc/libtirpc-0004-Make-IPv6-support-optional.patch
index c93fea2..ad8ce65 100644
--- a/package/libtirpc/libtirpc-0004-Make-IPv6-support-optional.patch
+++ b/package/libtirpc/libtirpc-0004-Make-IPv6-support-optional.patch
@@ -1,43 +1,26 @@
-From 5ce585bed328fafc99800effb5e9d1b07dbac2b7 Mon Sep 17 00:00:00 2001
+From fbe5fccf0e3bdaae3defc66a288176797fd12a17 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Sun, 24 Jun 2012 21:40:21 +0200
 Subject: [PATCH] Make IPv6 support optional
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 ---
- configure.ac    |    5 +++++
- src/Makefile.am |    2 +-
- 2 files changed, 6 insertions(+), 1 deletion(-)
+ src/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/configure.ac b/configure.ac
-index 97c6f2c..487ec83 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -22,6 +22,11 @@ AC_PROG_LIBTOOL
- AC_HEADER_DIRENT
- AC_PREFIX_DEFAULT(/usr)
- AC_CHECK_HEADERS([arpa/inet.h fcntl.h libintl.h limits.h locale.h netdb.h netinet/in.h stddef.h stdint.h stdlib.h string.h sys/ioctl.h sys/param.h sys/socket.h sys/time.h syslog.h unistd.h])
-+
-+AC_CHECK_HEADER(netinet/ip6.h,
-+	AC_DEFINE(INET6, 1, [Define to 1 if IPv6 is available]),
-+	[AC_MSG_WARN([no IPv6])])
-+
- AC_CHECK_LIB([pthread], [pthread_create])
- 
- 
 diff --git a/src/Makefile.am b/src/Makefile.am
-index 6d36b93..6dc259e 100644
+index b5db263..f086255 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
-@@ -6,7 +6,7 @@
- ## anything like that.
+@@ -7,7 +7,7 @@
  
+ noinst_HEADERS = rpc_com.h
  
--INCLUDES = -I$(top_srcdir)/tirpc -DPORTMAP -DINET6 -DVERSION="\"$(VERSION)\"" \
-+INCLUDES = -I$(top_srcdir)/tirpc -DPORTMAP -DVERSION="\"$(VERSION)\"" \
+-AM_CPPFLAGS = -I$(top_srcdir)/tirpc -DPORTMAP -DINET6 \
++AM_CPPFLAGS = -I$(top_srcdir)/tirpc -DPORTMAP \
  		-D_GNU_SOURCE -Wall -pipe  
  
  lib_LTLIBRARIES = libtirpc.la
 -- 
-1.7.9.5
+2.0.0
 
diff --git a/package/libtirpc/libtirpc-0005-rpcent-mark-getrpcbyname-name-argument-as-const-char.patch b/package/libtirpc/libtirpc-0005-rpcent-mark-getrpcbyname-name-argument-as-const-char.patch
deleted file mode 100644
index b1865ae..0000000
--- a/package/libtirpc/libtirpc-0005-rpcent-mark-getrpcbyname-name-argument-as-const-char.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 88147b753b86df7e7505ef8150f1329f7c6951cc Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Fri, 9 Nov 2012 19:37:24 +0100
-Subject: [PATCH] rpcent: mark getrpcbyname name argument as const char *
-
-This allows to match the glibc prototype and avoid compiling error
-when building libtirpc against a C library that has RPC support.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- src/getrpcent.c    |    2 +-
- tirpc/rpc/rpcent.h |    2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/getrpcent.c b/src/getrpcent.c
-index 645f18f..1b54b6d 100644
---- a/src/getrpcent.c
-+++ b/src/getrpcent.c
-@@ -138,7 +138,7 @@ no_yp:
- 
- struct rpcent *
- getrpcbyname(name)
--	char *name;
-+	const char *name;
- {
- 	struct rpcent *rpc = NULL;
- 	char **rp;
-diff --git a/tirpc/rpc/rpcent.h b/tirpc/rpc/rpcent.h
-index 8ce05ed..120801d 100644
---- a/tirpc/rpc/rpcent.h
-+++ b/tirpc/rpc/rpcent.h
-@@ -61,7 +61,7 @@ extern struct rpcent *getrpcbynumber_r(int, struct rpcent *, char *, int);
- extern struct rpcent *getrpcent_r(struct rpcent *, char *, int);
- 
- /* Old interfaces that return a pointer to a static area;  MT-unsafe */
--extern struct rpcent *getrpcbyname(char *);
-+extern struct rpcent *getrpcbyname(const char *);
- extern struct rpcent *getrpcbynumber(int);
- extern struct rpcent *getrpcent(void);
- #endif
--- 
-1.7.9.5
-
diff --git a/package/libtirpc/libtirpc-0006-rpcent-remove-prototypes-of-reentrant-variants.patch b/package/libtirpc/libtirpc-0006-rpcent-remove-prototypes-of-reentrant-variants.patch
deleted file mode 100644
index 1fdc310..0000000
--- a/package/libtirpc/libtirpc-0006-rpcent-remove-prototypes-of-reentrant-variants.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 8e02780905a3e13405a5a1b9f5b2e77655d5c7fb Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sat, 10 Nov 2012 00:05:23 +0100
-Subject: [PATCH] rpcent: remove prototypes of reentrant variants
-
-The reentrant variants of getrpcbynumber() and al. are not implemented
-by libtirpc, so there is no point in advertising them in this header
-file.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- tirpc/rpc/rpcent.h |    5 -----
- 1 file changed, 5 deletions(-)
-
-diff --git a/tirpc/rpc/rpcent.h b/tirpc/rpc/rpcent.h
-index 120801d..45775ed 100644
---- a/tirpc/rpc/rpcent.h
-+++ b/tirpc/rpc/rpcent.h
-@@ -55,11 +55,6 @@ struct rpcent {
- 	int	r_number;	/* rpc program number */
- };
- 
--extern struct rpcent *getrpcbyname_r(const char *, struct rpcent *,
--					char *, int);
--extern struct rpcent *getrpcbynumber_r(int, struct rpcent *, char *, int);
--extern struct rpcent *getrpcent_r(struct rpcent *, char *, int);
--
- /* Old interfaces that return a pointer to a static area;  MT-unsafe */
- extern struct rpcent *getrpcbyname(const char *);
- extern struct rpcent *getrpcbynumber(int);
--- 
-1.7.9.5
-
diff --git a/package/libtirpc/libtirpc-0007-doc-Makefile.am-fix-out-of-tree-installation.patch b/package/libtirpc/libtirpc-0007-doc-Makefile.am-fix-out-of-tree-installation.patch
deleted file mode 100644
index c31992c..0000000
--- a/package/libtirpc/libtirpc-0007-doc-Makefile.am-fix-out-of-tree-installation.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 4cf0371c96abf83483835daf50d3fc3bf793bdc4 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sat, 10 Nov 2012 17:29:12 +0100
-Subject: [PATCH] doc/Makefile.am: fix out-of-tree installation
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- doc/Makefile.am |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/doc/Makefile.am b/doc/Makefile.am
-index cc4fa76..bac7c0f 100644
---- a/doc/Makefile.am
-+++ b/doc/Makefile.am
-@@ -1,5 +1,5 @@
- 
- install: install-am
- 	$(mkinstalldirs) $(DESTDIR)/etc
--	cp -p ./etc_netconfig $(DESTDIR)/etc/netconfig
-+	cp -p $(srcdir)/etc_netconfig $(DESTDIR)/etc/netconfig
- 	chmod 0644 $(DESTDIR)/etc/netconfig
--- 
-1.7.9.5
-
diff --git a/package/libtirpc/libtirpc-0008-Add-rpcgen-program-from-nfs-utils-sources.patch b/package/libtirpc/libtirpc-0008-Add-rpcgen-program-from-nfs-utils-sources.patch
index 27c6064..195803c 100644
--- a/package/libtirpc/libtirpc-0008-Add-rpcgen-program-from-nfs-utils-sources.patch
+++ b/package/libtirpc/libtirpc-0008-Add-rpcgen-program-from-nfs-utils-sources.patch
@@ -1,4 +1,4 @@
-From 8a1ee148ea860c20fa4e076839e5681412a11f7e Mon Sep 17 00:00:00 2001
+From c4c4550dafabda05d78ca4aa9969db8a4f70affe Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Sat, 10 Nov 2012 16:21:01 +0100
 Subject: [PATCH] Add rpcgen program from nfs-utils sources
@@ -6,7 +6,7 @@ Subject: [PATCH] Add rpcgen program from nfs-utils sources
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 ---
  Makefile.am          |    2 +-
- configure.ac         |   12 +-
+ configure.ac         |   14 +-
  rpcgen/Makefile.am   |   22 ++
  rpcgen/rpc_clntout.c |  217 ++++++++++
  rpcgen/rpc_cout.c    |  706 +++++++++++++++++++++++++++++++++
@@ -23,7 +23,7 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  rpcgen/rpc_util.c    |  479 ++++++++++++++++++++++
  rpcgen/rpc_util.h    |  166 ++++++++
  rpcgen/rpcgen.1      |  521 ++++++++++++++++++++++++
- 18 files changed, 6342 insertions(+), 2 deletions(-)
+ 18 files changed, 6344 insertions(+), 2 deletions(-)
  create mode 100644 rpcgen/Makefile.am
  create mode 100644 rpcgen/rpc_clntout.c
  create mode 100644 rpcgen/rpc_cout.c
@@ -42,7 +42,7 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  create mode 100644 rpcgen/rpcgen.1
 
 diff --git a/Makefile.am b/Makefile.am
-index 1a7596b..afb4e38 100644
+index 9b812eb..6edf029 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -1,4 +1,4 @@
@@ -50,28 +50,29 @@ index 1a7596b..afb4e38 100644
 +SUBDIRS = src man doc rpcgen
  ACLOCAL_AMFLAGS = -I m4
  
- nobase_include_HEADERS = tirpc/netconfig.h \
+ noinst_HEADERS	       = tirpc/reentrant.h \
 diff --git a/configure.ac b/configure.ac
-index 487ec83..7f35b48 100644
+index 11df020..4110225 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -29,6 +29,16 @@ AC_CHECK_HEADER(netinet/ip6.h,
+@@ -34,5 +34,17 @@ AC_CHECK_LIB([pthread], [pthread_create])
+ AC_CHECK_LIB([nsl], [yp_get_default_domain])
  
- AC_CHECK_LIB([pthread], [pthread_create])
- 
-+AM_CONDITIONAL(CROSS_COMPILING, test $cross_compiling = yes)
  
 -AC_CONFIG_FILES([Makefile src/Makefile man/Makefile doc/Makefile])
++AM_CONDITIONAL(CROSS_COMPILING, test $cross_compiling = yes)
++
 +AC_MSG_CHECKING([for a C compiler for build tools])
 +if test $cross_compiling = yes; then
-+  AC_CHECK_PROGS(CC_FOR_BUILD, gcc cc)
++   AC_CHECK_PROGS(CC_FOR_BUILD, gcc cc)
 +else
-+  CC_FOR_BUILD=$CC
++   CC_FOR_BUILD=$CC
 +fi
 +AC_MSG_RESULT([$CC_FOR_BUILD])
 +AC_SUBST(CC_FOR_BUILD)
 +
 +AC_CONFIG_FILES([Makefile src/Makefile man/Makefile doc/Makefile rpcgen/Makefile])
++
  AC_OUTPUT(libtirpc.pc)
 diff --git a/rpcgen/Makefile.am b/rpcgen/Makefile.am
 new file mode 100644
@@ -6500,5 +6501,5 @@ index 0000000..89df7ed
 +.%T The rpcgen chapter in the NETP manual
 +.Re
 -- 
-1.7.9.5
+2.0.0
 
diff --git a/package/libtirpc/libtirpc-0009-Automatically-generate-XDR-header-files-from-.x-sour.patch b/package/libtirpc/libtirpc-0009-Automatically-generate-XDR-header-files-from-.x-sour.patch
index 787452a..3c1c82d 100644
--- a/package/libtirpc/libtirpc-0009-Automatically-generate-XDR-header-files-from-.x-sour.patch
+++ b/package/libtirpc/libtirpc-0009-Automatically-generate-XDR-header-files-from-.x-sour.patch
@@ -1,38 +1,43 @@
-From 30fac06891c59a7fb784f6faa4e92921a84c73db Mon Sep 17 00:00:00 2001
+From 99ecb155efdfcf474c5701ab7e6ad1cbe88f500f Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Sat, 10 Nov 2012 17:29:53 +0100
-Subject: [PATCH] Automatically generate XDR header files from .x sources
- using rpcgen
+Subject: [PATCH] Automatically generate XDR header files from .x sources using
+ rpcgen
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 ---
- Makefile.am           |   23 +-
- src/Makefile.am       |    2 +-
- tirpc/rpc/rpcb_prot.h |  797 -------------------------------------------------
- tirpc/rpcsvc/crypt.h  |  109 -------
- 4 files changed, 21 insertions(+), 910 deletions(-)
+ Makefile.am           |  22 +-
+ src/Makefile.am       |   2 +-
+ tirpc/rpc/rpcb_prot.h | 797 --------------------------------------------------
+ tirpc/rpcsvc/crypt.h  | 109 -------
+ 4 files changed, 20 insertions(+), 910 deletions(-)
  delete mode 100644 tirpc/rpc/rpcb_prot.h
  delete mode 100644 tirpc/rpcsvc/crypt.h
 
 diff --git a/Makefile.am b/Makefile.am
-index afb4e38..7e63f78 100644
+index 6edf029..4e4dc32 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -1,9 +1,12 @@
+@@ -1,6 +1,10 @@
  SUBDIRS = src man doc rpcgen
  ACLOCAL_AMFLAGS = -I m4
  
 +GENFILES = \
-+			 tirpc/rpcsvc/crypt.h \
-+			 tirpc/rpc/rpcb_prot.h
++			tirpc/rpcsvc/crypt.h \
++			tirpc/rpc/rpcb_prot.h
 +
+ noinst_HEADERS	       = tirpc/reentrant.h \
+ 			 tirpc/getpeereid.h \
+ 			 tirpc/libc_private.h \
+@@ -8,7 +12,6 @@ noinst_HEADERS	       = tirpc/reentrant.h \
+ 
  nobase_include_HEADERS = tirpc/netconfig.h \
  			 tirpc/rpcsvc/crypt.x \
 -			 tirpc/rpcsvc/crypt.h \
  			 tirpc/rpc/xdr.h \
  			 tirpc/rpc/types.h \
  			 tirpc/rpc/svc_soc.h \
-@@ -15,7 +18,6 @@ nobase_include_HEADERS = tirpc/netconfig.h \
+@@ -20,7 +23,6 @@ nobase_include_HEADERS = tirpc/netconfig.h \
  			 tirpc/rpc/rpcent.h \
  			 tirpc/rpc/rpc_com.h \
  			 tirpc/rpc/rpcb_prot.x \
@@ -40,19 +45,15 @@ index afb4e38..7e63f78 100644
  			 tirpc/rpc/rpcb_clnt.h \
  			 tirpc/rpc/raw.h \
  			 tirpc/rpc/pmap_rmt.h \
-@@ -32,6 +34,21 @@ nobase_include_HEADERS = tirpc/netconfig.h \
+@@ -37,7 +39,21 @@ nobase_include_HEADERS = tirpc/netconfig.h \
  			 tirpc/rpc/auth.h \
  			 tirpc/rpc/auth_gss.h \
  			 tirpc/rpc/auth_des.h
 -    
 +
 +nobase_nodist_include_HEADERS = $(GENFILES)
-+
 +BUILT_SOURCES = $(GENFILES)
 +
- pkgconfigdir=$(libdir)/pkgconfig
- pkgconfig_DATA = libtirpc.pc
-+
 +$(GENFILES): %.h: %.x $(top_builddir)/rpcgen/rpcgen
 +	mkdir -p $(dir $@)
 +	$(top_builddir)/rpcgen/rpcgen -h -o $@ $<
@@ -63,14 +64,18 @@ index afb4e38..7e63f78 100644
 +force:
 +
 +CLEANFILES = $(GENFILES)
++
+ pkgconfigdir=$(libdir)/pkgconfig
+ pkgconfig_DATA = libtirpc.pc
+ 
 diff --git a/src/Makefile.am b/src/Makefile.am
-index 6dc259e..bd276cf 100644
+index f086255..a9db71b 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
-@@ -7,7 +7,7 @@
- 
+@@ -8,7 +8,7 @@
+ noinst_HEADERS = rpc_com.h
  
- INCLUDES = -I$(top_srcdir)/tirpc -DPORTMAP -DVERSION="\"$(VERSION)\"" \
+ AM_CPPFLAGS = -I$(top_srcdir)/tirpc -DPORTMAP \
 -		-D_GNU_SOURCE -Wall -pipe  
 +		-D_GNU_SOURCE -Wall -pipe -I$(top_builddir)/tirpc
  
@@ -995,5 +1000,5 @@ index da1f9cc..0000000
 -
 -#endif /* !_CRYPT_H_RPCGEN */
 -- 
-1.7.9.5
+2.0.0
 
diff --git a/package/libtirpc/libtirpc-0010-Add-more-XDR-files-needed-to-build-rpcbind-on-top-of.patch b/package/libtirpc/libtirpc-0010-Add-more-XDR-files-needed-to-build-rpcbind-on-top-of.patch
index 360a27f..638918b 100644
--- a/package/libtirpc/libtirpc-0010-Add-more-XDR-files-needed-to-build-rpcbind-on-top-of.patch
+++ b/package/libtirpc/libtirpc-0010-Add-more-XDR-files-needed-to-build-rpcbind-on-top-of.patch
@@ -1,8 +1,7 @@
-From 52aecb645b2e45d120a941f42fdbe193e22c27e1 Mon Sep 17 00:00:00 2001
+From 008a9c8ac3a84ffcc46a0eedb5b13862b279190c Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Sat, 10 Nov 2012 17:45:03 +0100
-Subject: [PATCH] Add more XDR files needed to build rpcbind on top of
- libtirpc
+Subject: [PATCH] Add more XDR files needed to build rpcbind on top of libtirpc
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 ---
@@ -16,17 +15,20 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  create mode 100644 tirpc/rpcsvc/rquota.x
 
 diff --git a/Makefile.am b/Makefile.am
-index 7e63f78..351c5df 100644
+index 4e4dc32..b7ae979 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -3,10 +3,16 @@ ACLOCAL_AMFLAGS = -I m4
+@@ -3,6 +3,9 @@ ACLOCAL_AMFLAGS = -I m4
  
  GENFILES = \
- 			 tirpc/rpcsvc/crypt.h \
-+			 tirpc/rpcsvc/mount.h \
-+			 tirpc/rpcsvc/nfs_prot.h \
-+			 tirpc/rpcsvc/rquota.h \
- 			 tirpc/rpc/rpcb_prot.h
+ 			tirpc/rpcsvc/crypt.h \
++			tirpc/rpcsvc/mount.h \
++			tirpc/rpcsvc/nfs_prot.h \
++			tirpc/rpcsvc/rquota.h \
+ 			tirpc/rpc/rpcb_prot.h
+ 
+ noinst_HEADERS	       = tirpc/reentrant.h \
+@@ -12,6 +15,9 @@ noinst_HEADERS	       = tirpc/reentrant.h \
  
  nobase_include_HEADERS = tirpc/netconfig.h \
  			 tirpc/rpcsvc/crypt.x \
@@ -1645,5 +1647,5 @@ index 0000000..72864d1
 +	} = 1;
 +} = 100011;
 -- 
-1.7.9.5
+2.0.0
 
diff --git a/package/libtirpc/libtirpc.mk b/package/libtirpc/libtirpc.mk
index 6b9a3d2..5abd601 100644
--- a/package/libtirpc/libtirpc.mk
+++ b/package/libtirpc/libtirpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTIRPC_VERSION = 0.2.2
+LIBTIRPC_VERSION = 0.2.4
 LIBTIRPC_SOURCE = libtirpc-$(LIBTIRPC_VERSION).tar.bz2
 LIBTIRPC_SITE = http://downloads.sourceforge.net/project/libtirpc/libtirpc/$(LIBTIRPC_VERSION)
 LIBTIRPC_LICENSE = BSD-3c
@@ -16,6 +16,8 @@ LIBTIRPC_AUTORECONF = YES
 # getrpcby{number,name} are only provided if 'GQ' is defined
 LIBTIRPC_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -DGQ"
 
+LIBTIRPC_CONF_OPT = --disable-gssapi
+
 # We need host-pkgconf because the configure.ac contains a
 # PKG_CHECK_MODULES macro call, and since we're autoreconfiguring this
 # package, we need the source for this PKG_CHECK_MODULES macro, which
-- 
2.0.0

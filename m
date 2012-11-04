From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  4 Nov 2012 13:04:03 +0100
Subject: [Buildroot] [PATCH 02/20] libtirpc: new package
In-Reply-To: <cover.1352030430.git.thomas.petazzoni@free-electrons.com>
References: <cover.1352030430.git.thomas.petazzoni@free-electrons.com>
Message-ID: <73efac44cabec682ff9aa6fb1de998dbe0cb307e.1352030430.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    1 +
 package/libtirpc/Config.in                         |    7 ++
 ...able-parts-of-TIRPC-requiring-NIS-support.patch |   70 ++++++++++++++++++++
 ...out-RPC-support-does-not-install-rpcent.h.patch |   26 ++++++++
 ...btirpc-0003-Add-missing-INET6-conditional.patch |   60 +++++++++++++++++
 .../libtirpc-0004-Make-IPv6-support-optional.patch |   43 ++++++++++++
 package/libtirpc/libtirpc.mk                       |   24 +++++++
 7 files changed, 231 insertions(+)
 create mode 100644 package/libtirpc/Config.in
 create mode 100644 package/libtirpc/libtirpc-0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch
 create mode 100644 package/libtirpc/libtirpc-0002-uClibc-without-RPC-support-does-not-install-rpcent.h.patch
 create mode 100644 package/libtirpc/libtirpc-0003-Add-missing-INET6-conditional.patch
 create mode 100644 package/libtirpc/libtirpc-0004-Make-IPv6-support-optional.patch
 create mode 100644 package/libtirpc/libtirpc.mk

diff --git a/package/Config.in b/package/Config.in
index 6125abc..b03cb42 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -468,6 +468,7 @@ source "package/libpcap/Config.in"
 source "package/libosip2/Config.in"
 source "package/librsync/Config.in"
 source "package/libsoup/Config.in"
+source "package/libtirpc/Config.in"
 source "package/libtorrent/Config.in"
 source "package/libupnp/Config.in"
 source "package/libvncserver/Config.in"
diff --git a/package/libtirpc/Config.in b/package/libtirpc/Config.in
new file mode 100644
index 0000000..7e891b4
--- /dev/null
+++ b/package/libtirpc/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBTIRPC
+	bool "libtirpc"
+	help
+	  Libtirpc is a port of Sun's Transport-Independent RPC
+	  library to Linux.
+
+	  http://sourceforge.net/projects/libtirpc/
diff --git a/package/libtirpc/libtirpc-0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch b/package/libtirpc/libtirpc-0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch
new file mode 100644
index 0000000..bdbe021
--- /dev/null
+++ b/package/libtirpc/libtirpc-0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch
@@ -0,0 +1,70 @@
+From f4c022c526ce061dfdd3c46f544a9495a3a3a97e Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sat, 23 Jun 2012 21:57:39 +0200
+Subject: [PATCH 1/4] Disable parts of TIRPC requiring NIS support
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ src/Makefile.am  |    3 +--
+ src/rpc_soc.c    |    2 ++
+ tirpc/rpc/auth.h |    3 +++
+ 3 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 7ee8cbc..6d36b93 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -49,8 +49,7 @@ libtirpc_la_SOURCES = auth_none.c auth_unix.c authunix_prot.c bindresvport.c cln
+         pmap_prot.c pmap_prot2.c pmap_rmt.c rpc_prot.c rpc_commondata.c \
+         rpc_callmsg.c rpc_generic.c rpc_soc.c rpcb_clnt.c rpcb_prot.c \
+         rpcb_st_xdr.c svc.c svc_auth.c svc_dg.c svc_auth_unix.c svc_generic.c \
+-        svc_raw.c svc_run.c svc_simple.c svc_vc.c getpeereid.c \
+-        auth_time.c auth_des.c authdes_prot.c des_crypt.c
++        svc_raw.c svc_run.c svc_simple.c svc_vc.c getpeereid.c
+ 
+ ## XDR
+ libtirpc_la_SOURCES += xdr.c xdr_rec.c xdr_array.c xdr_float.c xdr_mem.c xdr_reference.c xdr_stdio.c
+diff --git a/src/rpc_soc.c b/src/rpc_soc.c
+index c678429..27f2136 100644
+--- a/src/rpc_soc.c
++++ b/src/rpc_soc.c
+@@ -515,6 +515,7 @@ clnt_broadcast(prog, vers, proc, xargs, argsp, xresults, resultsp, eachresult)
+ 	    (resultproc_t) rpc_wrap_bcast, "udp");
+ }
+ 
++#if 0
+ /*
+  * Create the client des authentication object. Obsoleted by
+  * authdes_seccreate().
+@@ -546,6 +547,7 @@ fallback:
+ 	dummy = authdes_seccreate(servername, window, NULL, ckey);
+ 	return (dummy);
+ }
++#endif
+ 
+ /*
+  * Create a client handle for a unix connection. Obsoleted by clnt_vc_create()
+diff --git a/tirpc/rpc/auth.h b/tirpc/rpc/auth.h
+index 734e6b9..6e7e54e 100644
+--- a/tirpc/rpc/auth.h
++++ b/tirpc/rpc/auth.h
+@@ -282,6 +282,8 @@ extern AUTH *authunix_create(char *, uid_t, uid_t, int, uid_t *);
+ extern AUTH *authunix_create_default(void);	/* takes no parameters */
+ extern AUTH *authnone_create(void);		/* takes no parameters */
+ __END_DECLS
++
++#if 0
+ /*
+  * DES style authentication
+  * AUTH *authsecdes_create(servername, window, timehost, ckey)
+@@ -295,6 +297,7 @@ extern AUTH *authdes_create (char *, u_int, struct sockaddr *, des_block *);
+ extern AUTH *authdes_seccreate (const char *, const u_int, const  char *,
+     const  des_block *);
+ __END_DECLS
++#endif
+ 
+ __BEGIN_DECLS
+ extern bool_t xdr_opaque_auth		(XDR *, struct opaque_auth *);
+-- 
+1.7.9.5
+
diff --git a/package/libtirpc/libtirpc-0002-uClibc-without-RPC-support-does-not-install-rpcent.h.patch b/package/libtirpc/libtirpc-0002-uClibc-without-RPC-support-does-not-install-rpcent.h.patch
new file mode 100644
index 0000000..0798c34
--- /dev/null
+++ b/package/libtirpc/libtirpc-0002-uClibc-without-RPC-support-does-not-install-rpcent.h.patch
@@ -0,0 +1,26 @@
+From c91721dc289397dfe38fdae175f4ee37e824667c Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sat, 23 Jun 2012 21:58:07 +0200
+Subject: [PATCH 2/4] uClibc without RPC support does not install rpcent.h
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ tirpc/rpc/rpcent.h |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tirpc/rpc/rpcent.h b/tirpc/rpc/rpcent.h
+index 7fd93d9..df1f5ed 100644
+--- a/tirpc/rpc/rpcent.h
++++ b/tirpc/rpc/rpcent.h
+@@ -47,7 +47,7 @@
+ __BEGIN_DECLS
+ 
+ /* These are defined in /usr/include/rpc/netdb.h */
+-#if 0
++#if __UCLIBC__
+ struct rpcent {
+ 	char	*r_name;	/* name of server for this rpc program */
+ 	char	**r_aliases;	/* alias list */
+-- 
+1.7.9.5
+
diff --git a/package/libtirpc/libtirpc-0003-Add-missing-INET6-conditional.patch b/package/libtirpc/libtirpc-0003-Add-missing-INET6-conditional.patch
new file mode 100644
index 0000000..64d3da8
--- /dev/null
+++ b/package/libtirpc/libtirpc-0003-Add-missing-INET6-conditional.patch
@@ -0,0 +1,60 @@
+From a4852bd653ac917165de1d41b60168cd88dc6672 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sat, 23 Jun 2012 21:58:36 +0200
+Subject: [PATCH 3/4] Add missing INET6 conditional
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ src/rpc_generic.c |    2 ++
+ src/svc_dg.c      |    4 ++++
+ 2 files changed, 6 insertions(+)
+
+diff --git a/src/rpc_generic.c b/src/rpc_generic.c
+index 509fb36..2eb91ad 100644
+--- a/src/rpc_generic.c
++++ b/src/rpc_generic.c
+@@ -535,7 +535,9 @@ __rpc_nconf2fd_flags(const struct netconfig *nconf, int flags)
+ 	    si.si_af == AF_INET6) {
+ 		int val = 1;
+ 
++#ifdef INET6
+ 		setsockopt(fd, SOL_IPV6, IPV6_V6ONLY, &val, sizeof(val));
++#endif
+ 	}
+ 	return fd;
+ }
+diff --git a/src/svc_dg.c b/src/svc_dg.c
+index 66a56ee..e8faf33 100644
+--- a/src/svc_dg.c
++++ b/src/svc_dg.c
+@@ -627,9 +627,11 @@ svc_dg_enable_pktinfo(int fd, const struct __rpc_sockinfo *si)
+ 		(void) setsockopt(fd, SOL_IP, IP_PKTINFO, &val, sizeof(val));
+ 		break;
+ 
++#ifdef INET6
+ 	case AF_INET6:
+ 		(void) setsockopt(fd, SOL_IPV6, IPV6_PKTINFO, &val, sizeof(val));
+ 		break;
++#endif
+ 	}
+ }
+ 
+@@ -667,6 +669,7 @@ svc_dg_valid_pktinfo(struct msghdr *msg)
+ 		}
+ 		break;
+ 
++#ifdef INET6
+ 	case AF_INET6:
+ 		if (cmsg->cmsg_level != SOL_IPV6
+ 		 || cmsg->cmsg_type != IPV6_PKTINFO
+@@ -679,6 +682,7 @@ svc_dg_valid_pktinfo(struct msghdr *msg)
+ 			pkti->ipi6_ifindex = 0;
+ 		}
+ 		break;
++#endif
+ 
+ 	default:
+ 		return 0;
+-- 
+1.7.9.5
+
diff --git a/package/libtirpc/libtirpc-0004-Make-IPv6-support-optional.patch b/package/libtirpc/libtirpc-0004-Make-IPv6-support-optional.patch
new file mode 100644
index 0000000..455ad74
--- /dev/null
+++ b/package/libtirpc/libtirpc-0004-Make-IPv6-support-optional.patch
@@ -0,0 +1,43 @@
+From 1f36736733eac5080f3a4f3abd1c3a04ac42f1dd Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sun, 24 Jun 2012 21:40:21 +0200
+Subject: [PATCH 4/4] Make IPv6 support optional
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ configure.ac    |    5 +++++
+ src/Makefile.am |    2 +-
+ 2 files changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 97c6f2c..487ec83 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -22,6 +22,11 @@ AC_PROG_LIBTOOL
+ AC_HEADER_DIRENT
+ AC_PREFIX_DEFAULT(/usr)
+ AC_CHECK_HEADERS([arpa/inet.h fcntl.h libintl.h limits.h locale.h netdb.h netinet/in.h stddef.h stdint.h stdlib.h string.h sys/ioctl.h sys/param.h sys/socket.h sys/time.h syslog.h unistd.h])
++
++AC_CHECK_HEADER(netinet/ip6.h,
++	AC_DEFINE(INET6, 1, [Define to 1 if IPv6 is available]),
++	[AC_MSG_WARN([no IPv6])])
++
+ AC_CHECK_LIB([pthread], [pthread_create])
+ 
+ 
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 6d36b93..6dc259e 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -6,7 +6,7 @@
+ ## anything like that.
+ 
+ 
+-INCLUDES = -I$(top_srcdir)/tirpc -DPORTMAP -DINET6 -DVERSION="\"$(VERSION)\"" \
++INCLUDES = -I$(top_srcdir)/tirpc -DPORTMAP -DVERSION="\"$(VERSION)\"" \
+ 		-D_GNU_SOURCE -Wall -pipe  
+ 
+ lib_LTLIBRARIES = libtirpc.la
+-- 
+1.7.9.5
+
diff --git a/package/libtirpc/libtirpc.mk b/package/libtirpc/libtirpc.mk
new file mode 100644
index 0000000..02edbe2
--- /dev/null
+++ b/package/libtirpc/libtirpc.mk
@@ -0,0 +1,24 @@
+#############################################################
+#
+# libtirpc
+#
+#############################################################
+
+LIBTIRPC_VERSION = 0.2.2
+LIBTIRPC_SOURCE = libtirpc-$(LIBTIRPC_VERSION).tar.bz2
+LIBTIRPC_SITE = http://downloads.sourceforge.net/project/libtirpc/libtirpc/$(LIBTIRPC_VERSION)
+LIBTIRPC_LICENSE = BSD-3c
+LIBTIRPC_LICENSE_FILES = COPYING
+
+LIBTIRPC_INSTALL_STAGING = YES
+LIBTIRPC_AUTORECONF = YES
+
+# We need host-pkgconf because the configure.ac contains a
+# PKG_CHECK_MODULES macro call, and since we're autoreconfiguring this
+# package, we need the source for this PKG_CHECK_MODULES macro, which
+# comes from host-pkgconf. Other than that, pkgconf is only used to
+# find if there is a gss implementation somewhere, which we don't
+# support in Buildroot yet.
+LIBTIRPC_DEPENDENCIES = host-pkgconf
+
+$(eval $(autotools-package))
-- 
1.7.9.5

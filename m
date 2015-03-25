From: Alex Suykov <alex.suykov@gmail.com>
Date: Thu, 26 Mar 2015 00:15:06 +0200
Subject: [Buildroot] [PATCH v2] aiccu: musl patches
Message-ID: <20150325221506.GA26834@vostro>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/8c666ef11310868097601b6de1dd25779729b878/

if_ether.h issue discussion: http://www.openwall.com/lists/musl/2012/10/11/1

Patch 0001-gnutls-and-uclibc-fixes split into gnutls part (0001) and res_ninit
part (0005) which is not uclibc-specific but happens to affect musl as well.

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
---
v2: uclibc res_ninit changes from 0001 moved into 0005

 package/aiccu/0001-gnutls-and-uclibc-fixes.patch | 104 -----------------------
 package/aiccu/0001-gnutls.patch                  |  73 ++++++++++++++++
 package/aiccu/0004-if-ether-header.patch         |  23 +++++
 package/aiccu/0005-res-ninit.patch               |  33 +++++++
 4 files changed, 129 insertions(+), 104 deletions(-)
 delete mode 100644 package/aiccu/0001-gnutls-and-uclibc-fixes.patch
 create mode 100644 package/aiccu/0001-gnutls.patch
 create mode 100644 package/aiccu/0004-if-ether-header.patch
 create mode 100644 package/aiccu/0005-res-ninit.patch

diff --git a/package/aiccu/0001-gnutls-and-uclibc-fixes.patch b/package/aiccu/0001-gnutls-and-uclibc-fixes.patch
deleted file mode 100644
index d316f8f..0000000
--- a/package/aiccu/0001-gnutls-and-uclibc-fixes.patch
+++ /dev/null
@@ -1,104 +0,0 @@
-aiccu.h, common.c, common.h: fixes for deprecated GNUTLS functions and types
-resolver.c: fixes for selection of wrong resolver function under uclibc
-
-Signed-off-by: Michael Rommel <rommel@layer-7.net>
-
-diff -purN aiccu_20070115.orig/common/aiccu.h aiccu_20070115/common/aiccu.h
---- aiccu_20070115.orig/common/aiccu.h	2007-01-15 13:01:43.000000000 +0100
-+++ aiccu_20070115/common/aiccu.h	2013-08-31 23:50:53.651936146 +0200
-@@ -111,7 +111,7 @@ struct AICCU_conf
- #endif
- 
- #ifdef AICCU_GNUTLS
--	gnutls_certificate_credentials	tls_cred;	/* GNUTLS credentials */
-+	gnutls_certificate_credentials_t tls_cred;	/* GNUTLS credentials */
- #endif
- 
- 	bool		daemonize;		/* Daemonize? */
-diff -purN aiccu_20070115.orig/common/common.c aiccu_20070115/common/common.c
---- aiccu_20070115.orig/common/common.c	2006-12-21 15:08:50.000000000 +0100
-+++ aiccu_20070115/common/common.c	2013-09-01 01:21:36.031396740 +0200
-@@ -271,9 +271,8 @@ TLSSOCKET sock_alloc(void);
- TLSSOCKET sock_alloc(void)
- {
- #ifdef AICCU_GNUTLS
--	/* Allow connections to servers that have OpenPGP keys as well */
--	const int	cert_type_priority[3] = { GNUTLS_CRT_X509, GNUTLS_CRT_OPENPGP, 0 };
- 	int		ret;
-+	const char	*err;
- #endif /* AICCU_GNUTLS*/
- 
- 	TLSSOCKET	sock;	
-@@ -297,11 +296,16 @@ TLSSOCKET sock_alloc(void)
- 	}
- 
- 	/* Use default priorities */
--	gnutls_set_default_priority(sock->session);
--	/* XXX: Return value is not documented in GNUTLS documentation! */
--
--	gnutls_certificate_type_set_priority(sock->session, cert_type_priority);
--	/* XXX: Return value is not documented in GNUTLS documentation! */
-+	ret = gnutls_priority_set_direct(sock->session, "NORMAL", &err); 
-+	if (ret < 0)
-+	{
-+		if (ret == GNUTLS_E_INVALID_REQUEST)
-+		{
-+			dolog( LOG_ERR, "TLS set priority failed, syntax error at: %s\n", err);
-+		}
-+		free(sock);
-+		return NULL;
-+	}
- 
- 	/* Configure the x509 credentials for the current session */
- 	gnutls_credentials_set(sock->session, GNUTLS_CRD_CERTIFICATE, g_aiccu->tls_cred);
-@@ -474,7 +478,7 @@ bool sock_gotls(TLSSOCKET sock)
- 	}
- 
- 	/* Set the transport */
--	gnutls_transport_set_ptr(sock->session, (gnutls_transport_ptr)sock->socket);
-+	gnutls_transport_set_ptr(sock->session, (gnutls_transport_ptr_t) sock->socket);
- 
- 	/* Perform the TLS handshake */
- 	ret = gnutls_handshake(sock->session);
-diff -purN aiccu_20070115.orig/common/common.h aiccu_20070115/common/common.h
---- aiccu_20070115.orig/common/common.h	2007-01-11 15:50:51.000000000 +0100
-+++ aiccu_20070115/common/common.h	2013-08-31 23:26:13.683659455 +0200
-@@ -381,7 +381,7 @@ struct tlssocket
- 	SOCKET			socket;
- #ifdef AICCU_GNUTLS
- 	bool			tls_active;	/* TLS active? */
--	gnutls_session		session;	/* The GnuTLS sesision */
-+	gnutls_session_t	session;	/* The GnuTLS sesision */
- #endif
- };
- 
-diff -purN aiccu_20070115.orig/common/resolver.c aiccu_20070115/common/resolver.c
---- aiccu_20070115.orig/common/resolver.c	2006-07-23 16:55:14.000000000 +0200
-+++ aiccu_20070115/common/resolver.c	2013-08-31 23:44:31.574866862 +0200
-@@ -26,7 +26,7 @@
- 
- int getrrs(const char *label, int rrtype, void gotrec(unsigned int num, int type, const char *record))
- {
--#ifdef _LINUX
-+#if defined(_LINUX) && !defined(__UCLIBC__)
- 	struct __res_state	res;
- #endif
- 	unsigned char		answer[8192];
-@@ -38,7 +38,7 @@ int getrrs(const char *label, int rrtype
- 	uint16_t		type = 0, class = 0;
- 	uint32_t		ttl = 0;
- 
--#ifdef _LINUX
-+#if defined(_LINUX) && !defined(__UCLIBC__)
- 	memset(&res, 0, sizeof(res));
- 	res.options = RES_DEBUG;
- 	res_ninit(&res);
-@@ -47,7 +47,7 @@ int getrrs(const char *label, int rrtype
- #endif
- 
- 	memset(answer, 0, sizeof(answer));
--#ifdef _LINUX
-+#if defined(_LINUX) && !defined(__UCLIBC__)
- 	ret = res_nquery(&res, label, C_IN, rrtype, answer, sizeof(answer));
- #else
- 	ret = res_query(label, C_IN, rrtype, answer, sizeof(answer));
diff --git a/package/aiccu/0001-gnutls.patch b/package/aiccu/0001-gnutls.patch
new file mode 100644
index 0000000..462179e
--- /dev/null
+++ b/package/aiccu/0001-gnutls.patch
@@ -0,0 +1,73 @@
+aiccu.h, common.c, common.h: fixes for deprecated GNUTLS functions and types
+
+Signed-off-by: Michael Rommel <rommel@layer-7.net>
+
+diff -purN aiccu_20070115.orig/common/aiccu.h aiccu_20070115/common/aiccu.h
+--- aiccu_20070115.orig/common/aiccu.h	2007-01-15 13:01:43.000000000 +0100
++++ aiccu_20070115/common/aiccu.h	2013-08-31 23:50:53.651936146 +0200
+@@ -111,7 +111,7 @@ struct AICCU_conf
+ #endif
+ 
+ #ifdef AICCU_GNUTLS
+-	gnutls_certificate_credentials	tls_cred;	/* GNUTLS credentials */
++	gnutls_certificate_credentials_t tls_cred;	/* GNUTLS credentials */
+ #endif
+ 
+ 	bool		daemonize;		/* Daemonize? */
+diff -purN aiccu_20070115.orig/common/common.c aiccu_20070115/common/common.c
+--- aiccu_20070115.orig/common/common.c	2006-12-21 15:08:50.000000000 +0100
++++ aiccu_20070115/common/common.c	2013-09-01 01:21:36.031396740 +0200
+@@ -271,9 +271,8 @@ TLSSOCKET sock_alloc(void);
+ TLSSOCKET sock_alloc(void)
+ {
+ #ifdef AICCU_GNUTLS
+-	/* Allow connections to servers that have OpenPGP keys as well */
+-	const int	cert_type_priority[3] = { GNUTLS_CRT_X509, GNUTLS_CRT_OPENPGP, 0 };
+ 	int		ret;
++	const char	*err;
+ #endif /* AICCU_GNUTLS*/
+ 
+ 	TLSSOCKET	sock;	
+@@ -297,11 +296,16 @@ TLSSOCKET sock_alloc(void)
+ 	}
+ 
+ 	/* Use default priorities */
+-	gnutls_set_default_priority(sock->session);
+-	/* XXX: Return value is not documented in GNUTLS documentation! */
+-
+-	gnutls_certificate_type_set_priority(sock->session, cert_type_priority);
+-	/* XXX: Return value is not documented in GNUTLS documentation! */
++	ret = gnutls_priority_set_direct(sock->session, "NORMAL", &err); 
++	if (ret < 0)
++	{
++		if (ret == GNUTLS_E_INVALID_REQUEST)
++		{
++			dolog( LOG_ERR, "TLS set priority failed, syntax error at: %s\n", err);
++		}
++		free(sock);
++		return NULL;
++	}
+ 
+ 	/* Configure the x509 credentials for the current session */
+ 	gnutls_credentials_set(sock->session, GNUTLS_CRD_CERTIFICATE, g_aiccu->tls_cred);
+@@ -474,7 +478,7 @@ bool sock_gotls(TLSSOCKET sock)
+ 	}
+ 
+ 	/* Set the transport */
+-	gnutls_transport_set_ptr(sock->session, (gnutls_transport_ptr)sock->socket);
++	gnutls_transport_set_ptr(sock->session, (gnutls_transport_ptr_t) sock->socket);
+ 
+ 	/* Perform the TLS handshake */
+ 	ret = gnutls_handshake(sock->session);
+diff -purN aiccu_20070115.orig/common/common.h aiccu_20070115/common/common.h
+--- aiccu_20070115.orig/common/common.h	2007-01-11 15:50:51.000000000 +0100
++++ aiccu_20070115/common/common.h	2013-08-31 23:26:13.683659455 +0200
+@@ -381,7 +381,7 @@ struct tlssocket
+ 	SOCKET			socket;
+ #ifdef AICCU_GNUTLS
+ 	bool			tls_active;	/* TLS active? */
+-	gnutls_session		session;	/* The GnuTLS sesision */
++	gnutls_session_t	session;	/* The GnuTLS sesision */
+ #endif
+ };
+ 
diff --git a/package/aiccu/0004-if-ether-header.patch b/package/aiccu/0004-if-ether-header.patch
new file mode 100644
index 0000000..e0ecd74
--- /dev/null
+++ b/package/aiccu/0004-if-ether-header.patch
@@ -0,0 +1,23 @@
+musl does not allow using <netinet/*> together with <linux/*> headers.
+Since there are both netinet/if_ether.h and linux/if_ether.h providing
+the same definitions, use linux/if_ether.h whenever other linux/*
+headers are included.
+
+Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
+
+--- aiccu/common/common.h
++++ aiccu/common/common.h
+@@ -91,11 +91,12 @@
+ 	#include <sys/select.h>
+ 
+ 	#include <net/if.h>
+-	#include <netinet/if_ether.h>
+ #ifdef linux
+ 	#include <netpacket/packet.h>
++	#include <linux/if_ether.h>
+ 	#include <linux/if_tun.h>
+ #else
++	#include <netinet/if_ether.h>
+ #ifdef _DFBSD
+ 	#include <net/tun/if_tun.h>
+ #else
diff --git a/package/aiccu/0005-res-ninit.patch b/package/aiccu/0005-res-ninit.patch
new file mode 100644
index 0000000..89770fb
--- /dev/null
+++ b/package/aiccu/0005-res-ninit.patch
@@ -0,0 +1,33 @@
+res_ninit is available in glibc but not in uclibc or musl.
+
+Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
+
+--- aiccu/common/resolver.c
++++ aiccu/common/resolver.c
+@@ -26,7 +26,7 @@
+ 
+ int getrrs(const char *label, int rrtype, void gotrec(unsigned int num, int type, const char *record))
+ {
+-#ifdef _LINUX
++#ifdef __GLIBC__
+ 	struct __res_state	res;
+ #endif
+ 	unsigned char		answer[8192];
+@@ -38,7 +38,7 @@ int getrrs(const char *label, int rrtype
+ 	uint16_t		type = 0, class = 0;
+ 	uint32_t		ttl = 0;
+ 
+-#ifdef _LINUX
++#ifdef __GLIBC__
+ 	memset(&res, 0, sizeof(res));
+ 	res.options = RES_DEBUG;
+ 	res_ninit(&res);
+@@ -47,7 +47,7 @@ int getrrs(const char *label, int rrtype
+ #endif
+ 
+ 	memset(answer, 0, sizeof(answer));
+-#ifdef _LINUX
++#ifdef __GLIBC__
+ 	ret = res_nquery(&res, label, C_IN, rrtype, answer, sizeof(answer));
+ #else
+ 	ret = res_query(label, C_IN, rrtype, answer, sizeof(answer));
-- 
2.0.3

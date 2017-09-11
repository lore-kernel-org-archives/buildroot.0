From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Sep 2017 11:27:11 +0200
Subject: [Buildroot] [git commit] aiccu: remove package
Message-ID: <20170911092002.905AA81000@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fca70389f29eb9ef532039bf2c702c07a92db4ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As the SixXS project has ceased its operation on 2017-06-06,
the aiccu utility has been removed.

Signed-off-by: Alexander Mukhin <alexander.i.mukhin@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                                   |  9 +++
 DEVELOPERS                                         |  1 -
 package/Config.in                                  |  1 -
 package/aiccu/0001-gnutls.patch                    | 73 ----------------------
 .../0002-makefile-reorder-linked-libraries.patch   | 15 -----
 package/aiccu/0003-if-ether-header.patch           | 23 -------
 package/aiccu/0005-res-ninit.patch                 | 33 ----------
 package/aiccu/Config.in                            | 25 --------
 package/aiccu/aiccu.hash                           |  2 -
 package/aiccu/aiccu.mk                             | 40 ------------
 10 files changed, 9 insertions(+), 213 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 44303a4..73c0121 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,15 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2017.11"
 
+config BR2_PACKAGE_AICCU
+	bool "aiccu utility removed"
+	select BR2_LEGACY
+	help
+	  As the SixXS project has ceased its operation on 2017-06-06,
+	  the AICCU utility has no use anymore and has been removed.
+
+	  https://www.sixxs.net/sunset/
+
 config BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS
 	bool "util-linux login utilities option removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 2bd3aca..b28faab 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1241,7 +1241,6 @@ N:	Maxime Ripard <maxime.ripard@free-electrons.com>
 F:	package/kmsxx/
 
 N:	Michael Rommel <rommel@layer-7.net>
-F:	package/aiccu/
 F:	package/knock/
 F:	package/python-crc16/
 F:	package/python-pyzmq/
diff --git a/package/Config.in b/package/Config.in
index d926f7e..7a277d7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1562,7 +1562,6 @@ menu "Miscellaneous"
 endmenu
 
 menu "Networking applications"
-	source "package/aiccu/Config.in"
 	source "package/aircrack-ng/Config.in"
 	source "package/apache/Config.in"
 	source "package/argus/Config.in"
diff --git a/package/aiccu/0001-gnutls.patch b/package/aiccu/0001-gnutls.patch
deleted file mode 100644
index 462179e..0000000
--- a/package/aiccu/0001-gnutls.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-aiccu.h, common.c, common.h: fixes for deprecated GNUTLS functions and types
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
diff --git a/package/aiccu/0002-makefile-reorder-linked-libraries.patch b/package/aiccu/0002-makefile-reorder-linked-libraries.patch
deleted file mode 100644
index 22f04a9..0000000
--- a/package/aiccu/0002-makefile-reorder-linked-libraries.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Makefile: change LDFLAGS order on the compile line for --static
-
-Signed-off-by: Michael Rommel <rommel@layer-7.net>
-
---- aiccu_20070115.orig/unix-console/Makefile	2007-01-15 12:04:27.000000000 +0100
-+++ aiccu_20070115/unix-console/Makefile	2013-09-29 22:54:42.742963861 +0200
-@@ -144,7 +144,7 @@ endif
- all: aiccu
- 
- aiccu:	$(OBJS) ${SRCS} ${INCS}
--	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $(OBJS)
-+	$(CC) $(CFLAGS) -o $@ $(OBJS) $(LDFLAGS)
- ifeq ($(shell echo $(CFLAGS) | grep -c "DEBUG"),0)
- ifeq ($(shell echo "$(RPM_OPT_FLAGS)" | wc -c),1)
- 	strip $@
diff --git a/package/aiccu/0003-if-ether-header.patch b/package/aiccu/0003-if-ether-header.patch
deleted file mode 100644
index 48e8ceb..0000000
--- a/package/aiccu/0003-if-ether-header.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-musl does not allow using <netinet/*> together with <linux/*> headers.
-Since there are both netinet/if_ether.h and linux/if_ether.h providing
-the same definitions, use linux/if_ether.h whenever other linux/*
-headers are included.
-
-Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
-
---- aiccu/common/common.h
-+++ aiccu/common/common.h
-@@ -91,11 +91,12 @@
- 	#include <sys/select.h>
- 
- 	#include <net/if.h>
--	#include <netinet/if_ether.h>
- #ifdef linux
- 	#include <netpacket/packet.h>
-+	#include <linux/if_ether.h>
- 	#include <linux/if_tun.h>
- #else
-+	#include <netinet/if_ether.h>
- #ifdef _DFBSD
- 	#include <net/tun/if_tun.h>
- #else
diff --git a/package/aiccu/0005-res-ninit.patch b/package/aiccu/0005-res-ninit.patch
deleted file mode 100644
index faf38df..0000000
--- a/package/aiccu/0005-res-ninit.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-res_ninit is available in glibc but not in uclibc or musl.
-
-Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
-
---- aiccu/common/resolver.c
-+++ aiccu/common/resolver.c
-@@ -26,7 +26,7 @@
- 
- int getrrs(const char *label, int rrtype, void gotrec(unsigned int num, int type, const char *record))
- {
--#ifdef _LINUX
-+#if defined(__GLIBC__) && !defined(__UCLIBC__)
- 	struct __res_state	res;
- #endif
- 	unsigned char		answer[8192];
-@@ -38,7 +38,7 @@ int getrrs(const char *label, int rrtype
- 	uint16_t		type = 0, class = 0;
- 	uint32_t		ttl = 0;
- 
--#ifdef _LINUX
-+#if defined(__GLIBC__) && !defined(__UCLIBC__)
- 	memset(&res, 0, sizeof(res));
- 	res.options = RES_DEBUG;
- 	res_ninit(&res);
-@@ -47,7 +47,7 @@ int getrrs(const char *label, int rrtype
- #endif
- 
- 	memset(answer, 0, sizeof(answer));
--#ifdef _LINUX
-+#if defined(__GLIBC__) && !defined(__UCLIBC__)
- 	ret = res_nquery(&res, label, C_IN, rrtype, answer, sizeof(answer));
- #else
- 	ret = res_query(label, C_IN, rrtype, answer, sizeof(answer));
diff --git a/package/aiccu/Config.in b/package/aiccu/Config.in
deleted file mode 100644
index a2d6100..0000000
--- a/package/aiccu/Config.in
+++ /dev/null
@@ -1,25 +0,0 @@
-config BR2_PACKAGE_AICCU
-	bool "aiccu"
-	depends on !BR2_STATIC_LIBS # gnutls
-	depends on BR2_USE_WCHAR
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_GNUTLS
-	help
-	  SixXS Automatic IPv6 Connectivity Client Utility
-
-	  AICCU (Automatic IPv6 Connectivity Client Utility) makes it
-	  easy for users to get IPv6 connectivity. After having
-	  requested an account, tunnel and optionally a subnet, AICCU
-	  can be used to automatically configure the tunnel. AICCU
-	  supports TIC (Tunnel Information & Control protocol), which it
-	  uses for retrieving the tunnel configuration information,
-	  AYIYA, which allows tunnels to be created even behind
-	  firewalls and NAT's.
-
-	  http://www.sixxs.net/tools/aiccu/
-
-comment "aiccu needs a toolchain w/ wchar, threads, dynamic library"
-	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| BR2_STATIC_LIBS
diff --git a/package/aiccu/aiccu.hash b/package/aiccu/aiccu.hash
deleted file mode 100644
index 26c4081..0000000
--- a/package/aiccu/aiccu.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# From https://www.sixxs.net/archive/sixxs/aiccu/unix/
-md5	c9bcc83644ed788e22a7c3f3d4021350  aiccu_20070115.tar.gz
diff --git a/package/aiccu/aiccu.mk b/package/aiccu/aiccu.mk
deleted file mode 100644
index 60d65dd..0000000
--- a/package/aiccu/aiccu.mk
+++ /dev/null
@@ -1,40 +0,0 @@
-################################################################################
-#
-# aiccu
-#
-################################################################################
-
-AICCU_VERSION = 20070115
-AICCU_SOURCE = aiccu_$(AICCU_VERSION).tar.gz
-AICCU_SITE = http://www.sixxs.net/archive/sixxs/aiccu/unix
-AICCU_LICENSE = SixXS License, concise redistribution license
-AICCU_LICENSE_FILES = doc/LICENSE
-AICCU_DEPENDENCIES = gnutls
-
-AICCU_LFDLAGS = $(TARGET_LDFLAGS)
-
-# aiccu forgets to link with gnutls' dependencies breaking the build when
-# linking statically
-ifeq ($(BR2_STATIC_LIBS),y)
-AICCU_LDFLAGS += `$(PKG_CONFIG_HOST_BINARY) --libs gnutls`
-endif
-
-# dummy RPM_OPT_FLAGS to disable stripping
-define AICCU_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) LDFLAGS="$(AICCU_LDFLAGS)" $(MAKE) \
-		CC="$(TARGET_CC)" RPM_OPT_FLAGS=1 -C $(@D)/unix-console all
-endef
-
-define AICCU_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/unix-console/aiccu \
-		$(TARGET_DIR)/usr/sbin/aiccu
-	$(INSTALL) -D -m 0644 $(@D)/doc/aiccu.conf \
-		$(TARGET_DIR)/etc/aiccu.conf
-endef
-
-define AICCU_INSTALL_INIT_SYSV
-	$(INSTALL) -D -m 0755 $(@D)/doc/aiccu.init \
-		$(TARGET_DIR)/etc/init.d/S50aiccu
-endef
-
-$(eval $(generic-package))

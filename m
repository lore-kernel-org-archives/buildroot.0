From: Michael Rommel <rommel@layer-7.net>
Date: Sun,  8 Sep 2013 23:58:03 +0200
Subject: [Buildroot] [PATCH 1/1] aiccu: new package
Message-ID: <1378677483-2424-1-git-send-email-rommel@layer-7.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Automatic IPv6 Connectivity Configuration Utility for users of a
IPv6 tunnel broker, developed by sixxs.net

Signed-off-by: Michael Rommel <rommel@layer-7.net>
---
 package/Config.in                                  |    1 +
 package/aiccu/Config.in                            |   21 ++++
 .../aiccu/aiccu-0001-gnutls-and-uclibc-fixes.patch |  104 ++++++++++++++++++++
 .../aiccu/aiccu-0002-makefile-target-strip.patch   |   23 +++++
 package/aiccu/aiccu.mk                             |   32 ++++++
 5 files changed, 181 insertions(+)
 create mode 100644 package/aiccu/Config.in
 create mode 100644 package/aiccu/aiccu-0001-gnutls-and-uclibc-fixes.patch
 create mode 100644 package/aiccu/aiccu-0002-makefile-target-strip.patch
 create mode 100644 package/aiccu/aiccu.mk

diff --git a/package/Config.in b/package/Config.in
index 7a0ef68..c1e5da0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -716,6 +716,7 @@ source "package/sound-theme-freedesktop/Config.in"
 endmenu
 
 menu "Networking applications"
+source "package/aiccu/Config.in"
 source "package/aircrack-ng/Config.in"
 source "package/argus/Config.in"
 source "package/arptables/Config.in"
diff --git a/package/aiccu/Config.in b/package/aiccu/Config.in
new file mode 100644
index 0000000..1c6f554
--- /dev/null
+++ b/package/aiccu/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_AICCU
+	bool "aiccu"
+	depends on BR2_INET_IPV6
+	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_GNUTLS
+	help
+	  SixXS Automatic IPv6 Connectivity Client Utility
+
+	  AICCU (Automatic IPv6 Connectivity Client Utility) makes it
+	  easy for users to get IPv6 connectivity. After having
+	  requested an account, tunnel and optionally a subnet, AICCU
+	  can be used to automatically configure the tunnel. AICCU
+	  supports TIC (Tunnel Information & Control protocol), which it
+	  uses for retrieving the tunnel configuration information,
+	  AYIYA, which allows tunnels to be created even behind
+	  firewalls and NAT's.
+
+	  http://www.sixxs.net/tools/aiccu/
+
+comment "aiccu requires a toolchain with IPv6 and WCHAR support"
+	depends on !(BR2_INET_IPV6 && BR2_USE_WCHAR)
diff --git a/package/aiccu/aiccu-0001-gnutls-and-uclibc-fixes.patch b/package/aiccu/aiccu-0001-gnutls-and-uclibc-fixes.patch
new file mode 100644
index 0000000..d316f8f
--- /dev/null
+++ b/package/aiccu/aiccu-0001-gnutls-and-uclibc-fixes.patch
@@ -0,0 +1,104 @@
+aiccu.h, common.c, common.h: fixes for deprecated GNUTLS functions and types
+resolver.c: fixes for selection of wrong resolver function under uclibc
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
+diff -purN aiccu_20070115.orig/common/resolver.c aiccu_20070115/common/resolver.c
+--- aiccu_20070115.orig/common/resolver.c	2006-07-23 16:55:14.000000000 +0200
++++ aiccu_20070115/common/resolver.c	2013-08-31 23:44:31.574866862 +0200
+@@ -26,7 +26,7 @@
+ 
+ int getrrs(const char *label, int rrtype, void gotrec(unsigned int num, int type, const char *record))
+ {
+-#ifdef _LINUX
++#if defined(_LINUX) && !defined(__UCLIBC__)
+ 	struct __res_state	res;
+ #endif
+ 	unsigned char		answer[8192];
+@@ -38,7 +38,7 @@ int getrrs(const char *label, int rrtype
+ 	uint16_t		type = 0, class = 0;
+ 	uint32_t		ttl = 0;
+ 
+-#ifdef _LINUX
++#if defined(_LINUX) && !defined(__UCLIBC__)
+ 	memset(&res, 0, sizeof(res));
+ 	res.options = RES_DEBUG;
+ 	res_ninit(&res);
+@@ -47,7 +47,7 @@ int getrrs(const char *label, int rrtype
+ #endif
+ 
+ 	memset(answer, 0, sizeof(answer));
+-#ifdef _LINUX
++#if defined(_LINUX) && !defined(__UCLIBC__)
+ 	ret = res_nquery(&res, label, C_IN, rrtype, answer, sizeof(answer));
+ #else
+ 	ret = res_query(label, C_IN, rrtype, answer, sizeof(answer));
diff --git a/package/aiccu/aiccu-0002-makefile-target-strip.patch b/package/aiccu/aiccu-0002-makefile-target-strip.patch
new file mode 100644
index 0000000..49183e4
--- /dev/null
+++ b/package/aiccu/aiccu-0002-makefile-target-strip.patch
@@ -0,0 +1,23 @@
+Makefile: exchanged the hardcoded strip command with a variable based one
+
+Signed-off-by: Michael Rommel <rommel@layer-7.net>
+
+--- aiccu_20070115.orig/unix-console/Makefile	2007-01-15 12:04:27.000000000 +0100
++++ aiccu_20070115/unix-console/Makefile	2013-09-08 17:00:33.004727305 +0200
+@@ -28,6 +28,7 @@ CWARNS += -W -Wall -Wshadow -Wpointer-ar
+ CFLAGS	+= $(CWARNS) -D_GNU_SOURCE
+ CC      = @gcc
+ RM      = rm
++STRIP   = strip
+ 
+ # Add -O3 when nothing is specified yet
+ ifeq ($(shell echo $(CFLAGS) | grep -c "\-O"),0)
+@@ -147,7 +148,7 @@ aiccu:	$(OBJS) ${SRCS} ${INCS}
+ 	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $(OBJS)
+ ifeq ($(shell echo $(CFLAGS) | grep -c "DEBUG"),0)
+ ifeq ($(shell echo "$(RPM_OPT_FLAGS)" | wc -c),1)
+-	strip $@
++	$(STRIP) $@
+ endif
+ endif
+ 
diff --git a/package/aiccu/aiccu.mk b/package/aiccu/aiccu.mk
new file mode 100644
index 0000000..c9862c1
--- /dev/null
+++ b/package/aiccu/aiccu.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# aiccu
+#
+################################################################################
+
+AICCU_VERSION = 20070115
+AICCU_SOURCE = aiccu_$(AICCU_VERSION).tar.gz
+AICCU_SITE = http://www.sixxs.net/archive/sixxs/aiccu/unix/
+AICCU_LICENSE = SixXS License, concise redistribution license
+AICCU_LICENSE_FILES = doc/LICENSE
+AICCU_DEPENDENCIES = gnutls
+
+define AICCU_BUILD_CMDS
+	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" STRIP="$(TARGET_STRIP)" -C $(@D) all
+endef
+
+define AICCU_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/unix-console/aiccu \
+		$(TARGET_DIR)/usr/sbin/aiccu
+	[ -f $(TARGET_DIR)/etc/aiccu.conf ] || \
+		$(INSTALL) -D -m 0644 $(@D)/doc/aiccu.conf \
+		$(TARGET_DIR)/etc/aiccu.conf
+endef
+
+define AICCU_INSTALL_INIT_SYSV
+	[ -f $(TARGET_DIR)/etc/init.d/S50aiccu ] || \
+		$(INSTALL) -D -m 0755 $(@D)/doc/aiccu.init \
+		$(TARGET_DIR)/etc/init.d/S50aiccu
+endef
+
+$(eval $(generic-package))
-- 
1.7.9.5

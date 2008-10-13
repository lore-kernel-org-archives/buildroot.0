From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Mon, 13 Oct 2008 01:10:36 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/openssl
Message-ID: <20081013081036.2CF4A3C84C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2008-10-13 01:10:35 -0700 (Mon, 13 Oct 2008)
New Revision: 23663

Log:
openssl: fix architecture specified when configuring openssl

This patch will default to linux-generic32, unless a known optimized
architecture is selected.

As of today it will select optimized config for; avr32, ia64, powerpc and
x86_64.

This fixes bug #5344.

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>



Modified:
   trunk/buildroot/package/openssl/openssl.mk


Changeset:
Modified: trunk/buildroot/package/openssl/openssl.mk
===================================================================
--- trunk/buildroot/package/openssl/openssl.mk	2008-10-12 11:20:08 UTC (rev 23662)
+++ trunk/buildroot/package/openssl/openssl.mk	2008-10-13 08:10:35 UTC (rev 23663)
@@ -6,13 +6,21 @@
 OPENSSL_VERSION:=0.9.8g
 OPENSSL_SITE:=http://www.openssl.org/source
 
-OPENSSL_TARGET_ARCH:=
-ifeq ($(BR2_i386),y)
-OPENSSL_TARGET_ARCH:=generic32
+OPENSSL_TARGET_ARCH=generic32
+
+# Some architectures are optimized in OpenSSL
+ifeq ($(BR2_ARCH),avr32)
+OPENSSL_TARGET_ARCH=avr32
 endif
-ifeq ($(OPENSSL_TARGET_ARCH),)
-OPENSSL_TARGET_ARCH:=$(ARCH)
+ifeq ($(BR2_ARCH),ia64)
+OPENSSL_TARGET_ARCH=ia64
 endif
+ifeq ($(BR2_ARCH),powerpc)
+OPENSSL_TARGET_ARCH=ppc
+endif
+ifeq ($(BR2_ARCH),x86_64)
+OPENSSL_TARGET_ARCH=x86_64
+endif
 
 OPENSSL_INSTALL_STAGING = YES
 OPENSSL_INSTALL_STAGING_OPT = INSTALL_PREFIX=$(STAGING_DIR) install

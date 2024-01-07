Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F2EC47073
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 17:47:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39693415D4;
	Sun,  7 Jan 2024 17:47:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39693415D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dye5bdgYEaZ3; Sun,  7 Jan 2024 17:47:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 563B4415E3;
	Sun,  7 Jan 2024 17:47:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 563B4415E3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 736291BF3C0
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 17:47:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B8A460B9E
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 17:47:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B8A460B9E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yhcZ9hyzOw1S for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 17:47:00 +0000 (UTC)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7E826607C0
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 17:47:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E826607C0
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3374e332124so1121407f8f.2
 for <buildroot@buildroot.org>; Sun, 07 Jan 2024 09:47:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704649618; x=1705254418;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PuCOWT9jFfdnwcWPQqbau6aPVxFAKzyHmLAqfJlYBpc=;
 b=qvIGski/AMwgqbWtWkeHvRYC9bI3dcwNtLwIT3r6JOmy1ymSf0vuIalvZVxQvRdWXB
 bJEJ+kq8pHZuLaeQl0E5DuUaYRk16NU6KP8x4lB01nP3Q9c3/ZHorj+/qvfgyKuE+Fxz
 GWo3FrVSfP5uyvigZDFEgc5hcJ2Y8GNxdRcDCDzmiERnODixd96ersgm+0iLGCNhOR6h
 VB4YDAxxBeLIMGb3W2lMVS0947o3Z1dXVIUeqGz+0BHgi0HPCPV/32R/XwBzeMX/kVi1
 C41LtQZ44c2Kvy5Y5x/e/WkMP/6p6gOOwr2YsUEjFynEErB9N+FcYG6Pf5jIjmae7/0b
 lPhg==
X-Gm-Message-State: AOJu0YwfzXHvqtMT1vUWuQwiLVFua7Dy/0nKDwsfN+V4Q7vIn6fbiXgX
 Kta1/6KRV+2CxRiaaebEoBon2E8Mwmo=
X-Google-Smtp-Source: AGHT+IFYOmpilk1uWmLruTsc3j9VrraxJNGF3IhUCWDf17dTYO+lGmN4C3CB98vHM5toqHnuC1AKaw==
X-Received: by 2002:adf:f54e:0:b0:336:8767:2e41 with SMTP id
 j14-20020adff54e000000b0033687672e41mr1223484wrp.30.1704649617527; 
 Sun, 07 Jan 2024 09:46:57 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 f11-20020a5d50cb000000b00336ebf27d59sm5790804wrt.78.2024.01.07.09.46.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jan 2024 09:46:57 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Jan 2024 18:46:55 +0100
Message-ID: <20240107174655.910522-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704649618; x=1705254418; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PuCOWT9jFfdnwcWPQqbau6aPVxFAKzyHmLAqfJlYBpc=;
 b=cL3y5tpdUtUx5Bq0HRJl/Rykterk4vUeSydj+QtZ34GqGvgtKRImK/kmYlnLCZJhVn
 elvDXMGpq6LVcRNQYOb1udeAqr4/XcTS4buMg+guiwhcNTYpZLiiWH4f7GQ8+T6F9Msb
 o9K2kcJp6iuSh3OY62mJ1bZLm6BvncU0lLWE0bWsHthPhjLB4QqFn0abWHxdls1SZBQJ
 dkuHCpaMCGodLslOPSbAY0y7enxXCoxD1ILqd1m3fhX84k17uCB0oSb9qRi9Bq9Nw5PH
 Lz/Wl8SS8h1Y9ZMQ6x0HjYO6pupTbp8gZBKxFMjbTKK0C9MoBn77gVD6D9/c9oUIGPp2
 Wd3Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cL3y5tpd
Subject: [Buildroot] [PATCH 1/1] package/sudo: security bump to version
 1.9.15p5
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Drop patch (already in version) and so also drop autoreconf
- The sudoers plugin has been modified to make it more resilient to
  ROWHAMMER attacks on authentication and policy matching. This
  addresses CVE-2023-42465.

https://www.sudo.ws/releases/stable/#1.9.15p5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .checkpackageignore                           |  1 -
 ...onfigure.ac-fix-openssl-static-build.patch | 47 -------------------
 package/sudo/sudo.hash                        |  2 +-
 package/sudo/sudo.mk                          |  6 +--
 4 files changed, 3 insertions(+), 53 deletions(-)
 delete mode 100644 package/sudo/0001-configure.ac-fix-openssl-static-build.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 1ddd13111a..6f67b4ba61 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1273,7 +1273,6 @@ package/start-stop-daemon/0001-add-uclibc-alias-and-musl.patch Upstream
 package/start-stop-daemon/0002-just-warn-on-missing-arch.patch Upstream
 package/statserial/0001-ncurses-link.patch Upstream
 package/stunnel/S50stunnel Indent Shellcheck Variables
-package/sudo/0001-configure.ac-fix-openssl-static-build.patch Upstream
 package/supervisor/S99supervisord Variables
 package/suricata/0001-configure.ac-allow-the-user-to-override-RUST_TARGET.patch Upstream
 package/suricata/S99suricata Shellcheck
diff --git a/package/sudo/0001-configure.ac-fix-openssl-static-build.patch b/package/sudo/0001-configure.ac-fix-openssl-static-build.patch
deleted file mode 100644
index dc91af6119..0000000000
--- a/package/sudo/0001-configure.ac-fix-openssl-static-build.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 1fed5adc166d5f2190a6b6ad048ec2d803316327 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 22 Feb 2023 10:13:30 +0100
-Subject: [PATCH] configure.ac: fix openssl static build
-
-Do not use AX_APPEND_FLAG as it will break static builds by removing
-duplicates such as -lz or -latomic which are needed by -lssl and
--lcrypto. This will fix the following build failure with sparc which
-needs -latomic:
-
-Checking for X509_STORE_CTX_get0_cert
-configure:21215: /home/thomas/autobuild/instance-3/output-1/host/bin/sparc-buildroot-linux-uclibc-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -static -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DZLIB_CONST  -static conftest.c   -L/home/thomas/autobuild/instance-3/output-1/host/bin/../sparc-buildroot-linux-uclibc/sysroot/usr/lib -lssl -lz -pthread -latomic -lcrypto >&5
-/home/thomas/autobuild/instance-3/output-1/host/lib/gcc/sparc-buildroot-linux-uclibc/10.4.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /home/thomas/autobuild/instance-3/output-1/host/bin/../sparc-buildroot-linux-uclibc/sysroot/usr/lib/libcrypto.a(x509cset.o): in function `X509_CRL_up_ref':
-x509cset.c:(.text+0x108): undefined reference to `__atomic_fetch_add_4'
-
-[...]
-
-In file included from ./hostcheck.c:38:
-../../include/sudo_compat.h:342:41: error: conflicting types for 'ASN1_STRING_data'
-  342 | #  define ASN1_STRING_get0_data(x)      ASN1_STRING_data(x)
-      |                                         ^~~~~~~~~~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/8be59dd94e4916f9457cb435104e36e62a28373b
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/sudo-project/sudo/commit/1fed5adc166d5f2190a6b6ad048ec2d803316327]
----
- m4/openssl.m4 | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/m4/openssl.m4 b/m4/openssl.m4
-index a2e4941ae8..b4cbd821db 100644
---- a/m4/openssl.m4
-+++ b/m4/openssl.m4
-@@ -44,7 +44,9 @@ AC_DEFUN([SUDO_CHECK_OPENSSL], [
- 			SUDO_APPEND_LIBPATH([LIBTLS], [$f])
- 			;;
- 		    *)
--			AX_APPEND_FLAG([$f], [LIBTLS])
-+			# Do not use AX_APPEND_FLAG as it will break static builds by removing
-+			# duplicates such as -lz or -latomic which are needed by -lssl and -lcrypto
-+		        LIBTLS="$LIBTLS $f"
- 			;;
- 		esac
- 	    done
diff --git a/package/sudo/sudo.hash b/package/sudo/sudo.hash
index 720b21d849..066d3b9de6 100644
--- a/package/sudo/sudo.hash
+++ b/package/sudo/sudo.hash
@@ -1,4 +1,4 @@
 # From: https://www.sudo.ws/getting/download/
-sha256  92334a12bb93e0c056b09f53e255ccb7d6f67c6350e2813cd9593ceeca78560b  sudo-1.9.13p3.tar.gz
+sha256  558d10b9a1991fb3b9fa7fa7b07ec4405b7aefb5b3cb0b0871dbc81e3a88e558  sudo-1.9.15p5.tar.gz
 # Locally calculated
 sha256  ea33b3971e8e4d9657cd6794a952aaa71b22bd16745f1645455b6ead010e0a28  LICENSE.md
diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index 73b3503e6a..c173781304 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SUDO_VERSION_MAJOR = 1.9.13
-SUDO_VERSION_MINOR = p3
+SUDO_VERSION_MAJOR = 1.9.15
+SUDO_VERSION_MINOR = p5
 SUDO_VERSION = $(SUDO_VERSION_MAJOR)$(SUDO_VERSION_MINOR)
 SUDO_SITE = https://www.sudo.ws/sudo/dist
 SUDO_LICENSE = ISC, BSD-3-Clause
@@ -13,8 +13,6 @@ SUDO_LICENSE_FILES = LICENSE.md
 SUDO_CPE_ID_VERSION = $(SUDO_VERSION_MAJOR)
 SUDO_CPE_ID_UPDATE = $(SUDO_VERSION_MINOR)
 SUDO_SELINUX_MODULES = sudo
-# We're patching m4/openssl.m4
-SUDO_AUTORECONF = YES
 # This is to avoid sudo's make install from chown()ing files which fails
 SUDO_INSTALL_TARGET_OPTS = INSTALL_OWNER="" DESTDIR="$(TARGET_DIR)" install
 SUDO_CONF_OPTS = \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

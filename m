Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B93C54E68
	for <buildroot@archiver.kernel.org>; Sat, 16 Mar 2024 22:02:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A03E415A4;
	Sat, 16 Mar 2024 22:02:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id owlb4okCB23C; Sat, 16 Mar 2024 22:02:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F40C415E0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F40C415E0;
	Sat, 16 Mar 2024 22:02:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1B0B71BF83A
 for <buildroot@lists.busybox.net>; Sat, 16 Mar 2024 22:01:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 35AF24084E
 for <buildroot@lists.busybox.net>; Sat, 16 Mar 2024 22:01:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AXppdGtEG1lh for <buildroot@lists.busybox.net>;
 Sat, 16 Mar 2024 22:01:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D051840995
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D051840995
 for <buildroot@buildroot.org>; Sat, 16 Mar 2024 22:01:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C6BA38027B; Sat, 16 Mar 2024 22:01:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 16 Mar 2024 22:20:31 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 996f86ef999598ff3375ef845263f27a7564510c
X-Git-Newrev: e1291e7dd715d12925623f19aa45553436d6920b
X-Patchwork-Hint: ignore
Message-Id: <20240316220156.C6BA38027B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/sudo: security
 bump to version 1.9.15p5
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e1291e7dd715d12925623f19aa45553436d6920b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

- Drop patch (already in version) and so also drop autoreconf
- The sudoers plugin has been modified to make it more resilient to
  ROWHAMMER attacks on authentication and policy matching. This
  addresses CVE-2023-42465.

https://www.sudo.ws/releases/stable/#1.9.15p5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit c87746afefe7b4f86460cef17edef5eded19da62)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...001-configure.ac-fix-openssl-static-build.patch | 47 ----------------------
 package/sudo/sudo.hash                             |  2 +-
 package/sudo/sudo.mk                               |  6 +--
 3 files changed, 3 insertions(+), 52 deletions(-)

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
index e70e8bd31f..a4e838dd94 100644
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF512CA0FF9
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 13:13:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A747484211;
	Fri, 29 Aug 2025 13:13:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qgw4rV9s_AON; Fri, 29 Aug 2025 13:13:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82E8984224
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82E8984224;
	Fri, 29 Aug 2025 13:13:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DAD90D2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 13:13:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CCE4D41724
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 13:13:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QDViq2bxyhVw for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 13:13:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5866A412EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5866A412EB
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5866A412EB
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 13:13:18 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 0FD3BC8F1C9;
 Fri, 29 Aug 2025 13:13:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8EB7C606B9;
 Fri, 29 Aug 2025 13:13:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 805741C22D393; 
 Fri, 29 Aug 2025 15:13:13 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Fri, 29 Aug 2025 15:13:02 +0200
Message-ID: <20250829131304.1845147-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829131304.1845147-1-thomas.petazzoni@bootlin.com>
References: <20250829131304.1845147-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1756473194; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=OjJ4hKj6S7rJ1oQ5ZoMLvge+a3t6kqzYNdIhDYjScTo=;
 b=SZjUgLZLXR17RCPp4klOsDFl6cqDHtFSxoeMcD4wCEO4NLTV5x8Tq167NAAyo/Nm93ZkCy
 Pq2c2GcXjhiERkSuf8Xh2WBICKDZLU/+eY6Pz54GZvks8QAP/4OV2iANwbWu3QWHrr388k
 BxA2jDzm1Km1cWbZL7gwhQ/PSGRN2p5P5z7JYnY1PDHjImpLH5JtSLmJ85esy1E4hXk9Ic
 VHKiSsDgoTezOBBCSKQ/tcvJtYBKyALa/xffrJB9UCJJ3APk0ZAFw6a4J6JxxGnIJ2c3JV
 XZAeLLmeyDawoV0Bema5tW34X8+TxDoKIsc/PElCyJsu3EUmL9r55gGlQbJTtQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=SZjUgLZL
Subject: [Buildroot] [PATCH 2/2] package/apitrace: bump to version 13
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We're bumping from version 10 to 13.

Version 11 doesn't really have release notes.

Version 12: https://github.com/apitrace/apitrace/releases/tag/12.0

Version 13: https://github.com/apitrace/apitrace/releases/tag/13.0

Patch 0001-thirdparty-libbacktrace-backtrace-h-include-config.h.patch
no longer makes sense: config.h no longer exists, and building with
musl works fine without it.

Both patches 0002 and 0003 were backport from upstream, so they can be
dropped.

We must switch from downloaded the auto-generated Github tarball to
fetching using Git, as fetching submodules is now mandatory to get
some bundled thirdparty libraries (yerk).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                           |  2 -
 ...cktrace-backtrace-h-include-config.h.patch | 40 ------------------
 ...and-__libc_dlopen_mode-on-GLIBC-2-34.patch | 34 ---------------
 .../0003-Explicit-header-stdint.patch         | 42 -------------------
 package/apitrace/apitrace.hash                |  2 +-
 package/apitrace/apitrace.mk                  |  9 +++-
 6 files changed, 8 insertions(+), 121 deletions(-)
 delete mode 100644 package/apitrace/0001-thirdparty-libbacktrace-backtrace-h-include-config.h.patch
 delete mode 100644 package/apitrace/0002-gltrace-Avoid-__libc_dlsym-and-__libc_dlopen_mode-on-GLIBC-2-34.patch
 delete mode 100644 package/apitrace/0003-Explicit-header-stdint.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 6f8f1eb1a5..4146ae8af3 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -228,8 +228,6 @@ package/android-tools/0010-adb-added-patch-for-openssl-1.1.0-compatibility.patch
 package/aoetools/0001-Change-shell-script-interpreter-from-bin-bash-to-bin.patch lib_patch.Upstream
 package/apache/0001-cross-compile.patch lib_patch.Upstream
 package/apache/S50apache Shellcheck lib_sysv.Indent lib_sysv.Variables
-package/apitrace/0001-thirdparty-libbacktrace-backtrace-h-include-config.h.patch lib_patch.Upstream
-package/apitrace/0002-gltrace-Avoid-__libc_dlsym-and-__libc_dlopen_mode-on-GLIBC-2-34.patch lib_patch.Upstream
 package/apr-util/0001-remove-checkapr.patch lib_patch.Upstream
 package/apr/0001-sys-param-h.patch lib_patch.Upstream
 package/apr/0002-Revert-Backport-r1872164.-Fix-the-name-of-libtool-wh.patch lib_patch.Upstream
diff --git a/package/apitrace/0001-thirdparty-libbacktrace-backtrace-h-include-config.h.patch b/package/apitrace/0001-thirdparty-libbacktrace-backtrace-h-include-config.h.patch
deleted file mode 100644
index bc76e5e26b..0000000000
--- a/package/apitrace/0001-thirdparty-libbacktrace-backtrace-h-include-config.h.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 36ff87a927092b4d62c587736d7684dea9c82e63 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 19 Jul 2021 08:27:48 +0200
-Subject: [PATCH] thirdparty/libbacktrace/backtrace/h: include config.h
-
-Build on musl is broken since version 10.0 because the include on
-config.h was removed by
-https://github.com/apitrace/apitrace/commit/1544abf59d68d74977b8b692bea4d7468d65547b:
-
-In file included from /home/buildroot/autobuild/instance-3/output-1/build/apitrace-10.0/thirdparty/libbacktrace/testlib.c:40:
-/home/buildroot/autobuild/instance-3/output-1/build/apitrace-10.0/thirdparty/libbacktrace/backtrace.h:53:10: fatal error: gstdint.h: No such file or directory
-   53 | #include "gstdint.h"
-      |          ^~~~~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/a10793d01efa3a1533ba37aa845b9ac2bb1dfb6b
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: not needed
-(https://github.com/apitrace/apitrace/issues/755)]
----
- thirdparty/libbacktrace/backtrace.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/thirdparty/libbacktrace/backtrace.h b/thirdparty/libbacktrace/backtrace.h
-index 2814763f..ab7679a0 100644
---- a/thirdparty/libbacktrace/backtrace.h
-+++ b/thirdparty/libbacktrace/backtrace.h
-@@ -33,6 +33,8 @@ POSSIBILITY OF SUCH DAMAGE.  */
- #ifndef BACKTRACE_H
- #define BACKTRACE_H
- 
-+#include "config.h"
-+
- #include <stddef.h>
- #include <stdio.h>
- 
--- 
-2.30.2
-
diff --git a/package/apitrace/0002-gltrace-Avoid-__libc_dlsym-and-__libc_dlopen_mode-on-GLIBC-2-34.patch b/package/apitrace/0002-gltrace-Avoid-__libc_dlsym-and-__libc_dlopen_mode-on-GLIBC-2-34.patch
deleted file mode 100644
index 57e3ee248b..0000000000
--- a/package/apitrace/0002-gltrace-Avoid-__libc_dlsym-and-__libc_dlopen_mode-on-GLIBC-2-34.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From d28a980802ad48568c87da02d630c8babfe163bb Mon Sep 17 00:00:00 2001
-From: Jose Fonseca <jfonseca@vmware.com>
-Date: Wed, 1 Sep 2021 16:34:54 +0100
-Subject: [PATCH] gltrace: Avoid __libc_dlsym and __libc_dlopen_mode on GLIBC
- 2.34.
-
-These GLIBC_PRIVATE symbols are gone from GLIBC 2.34 due to the merge of
-libdl.so onto libc.so.
-
-This means apitrace can't defend against infinite recursion when
-used with Steam Overlay, but at least it should work otherwise.
-
-Fixes https://github.com/apitrace/apitrace/issues/756
-
-[Retrieved from:
-https://github.com/apitrace/apitrace/commit/d28a980802ad48568c87da02d630c8babfe163bb]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- wrappers/dlsym.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/wrappers/dlsym.cpp b/wrappers/dlsym.cpp
-index 5ab8465b0..5369af35a 100644
---- a/wrappers/dlsym.cpp
-+++ b/wrappers/dlsym.cpp
-@@ -34,7 +34,7 @@
- #include "os.hpp"
- 
- 
--#if defined(__GLIBC__) && !defined(__UCLIBC__)
-+#if defined(__GLIBC__) && !defined(__UCLIBC__) && __GLIBC__ == 2 && __GLIBC_MINOR__ < 34
- 
- 
- #include <dlfcn.h>
diff --git a/package/apitrace/0003-Explicit-header-stdint.patch b/package/apitrace/0003-Explicit-header-stdint.patch
deleted file mode 100644
index efd7522314..0000000000
--- a/package/apitrace/0003-Explicit-header-stdint.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 3cc8956995d6d702a2c3ef0d7f91500c6accbfad Mon Sep 17 00:00:00 2001
-From: Nicolas PARLANT <nicolas.parlant@parhuet.fr>
-Date: Fri, 21 Mar 2025 05:02:23 +0000
-Subject: [PATCH] Explicit header: stdint
-
-Fix building with GCC-15. It no longer includes it by default.
-
-Signed-off-by: Nicolas PARLANT <nicolas.parlant@parhuet.fr>
-Upstream: 952bad1469ea747012bdc48c48993bd5f13eec04
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- frametrim/ft_dependecyobject.hpp | 1 +
- retrace/metric_writer.cpp        | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/frametrim/ft_dependecyobject.hpp b/frametrim/ft_dependecyobject.hpp
-index cf1885f1..53b910d0 100644
---- a/frametrim/ft_dependecyobject.hpp
-+++ b/frametrim/ft_dependecyobject.hpp
-@@ -28,6 +28,7 @@
- #pragma once
- 
- #include "ft_tracecall.hpp"
-+#include <stdint.h>
- 
- namespace frametrim {
- 
-diff --git a/retrace/metric_writer.cpp b/retrace/metric_writer.cpp
-index e923ed1d..4e4ce748 100644
---- a/retrace/metric_writer.cpp
-+++ b/retrace/metric_writer.cpp
-@@ -24,6 +24,7 @@
-  **************************************************************************/
- 
- #include <iostream>
-+#include <stdint.h>
- 
- #include "metric_writer.hpp"
- 
--- 
-2.50.1
-
diff --git a/package/apitrace/apitrace.hash b/package/apitrace/apitrace.hash
index 7ccf6cfbe1..262968e0f0 100644
--- a/package/apitrace/apitrace.hash
+++ b/package/apitrace/apitrace.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2e57d37af39369d7ce78666acb8afb1a49ec758f683a21077ec39eb0befae4ad  apitrace-10.0.tar.gz
+sha256  68d0e0600e36adc49b2d8abd8eb9a91971463049509f5405b9e75e18a84afd98  apitrace-13.0-git4.tar.gz
 sha256  7066bb1b787519c42f8278b77757c21de522cd97755cb30a22759ac401c62260  LICENSE
diff --git a/package/apitrace/apitrace.mk b/package/apitrace/apitrace.mk
index c47562233b..bb9c0aa6fd 100644
--- a/package/apitrace/apitrace.mk
+++ b/package/apitrace/apitrace.mk
@@ -4,10 +4,15 @@
 #
 ################################################################################
 
-APITRACE_VERSION = 10.0
-APITRACE_SITE = $(call github,apitrace,apitrace,$(APITRACE_VERSION))
+APITRACE_VERSION = 13.0
+APITRACE_SITE = https://github.com/apitrace/apitrace.git
+APITRACE_SITE_METHOD = git
+APITRACE_GIT_SUBMODULES = YES
 APITRACE_LICENSE = MIT
 APITRACE_LICENSE_FILES = LICENSE
+APITRACE_CONF_OPTS = \
+	-DBUILD_TESTING=OFF \
+	-DENABLE_TESTS=OFF
 
 APITRACE_DEPENDENCIES = host-python3 libpng
 
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

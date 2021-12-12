Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A09FC433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 14:22:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C15942A13;
	Sun, 12 Dec 2021 14:22:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QLe9FIFf5Rnv; Sun, 12 Dec 2021 14:22:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EF22429FB;
	Sun, 12 Dec 2021 14:22:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A95481BF33B
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:20:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B1C960A8D
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:20:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t2MQ-mpiNEeU for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 14:20:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3BDED60D69
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 14:20:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 562F082DFB; Sun, 12 Dec 2021 14:15:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 14:28:20 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 1005fcfc597a41ad00a90b9a649b8e1365f4a6b8
X-Git-Newrev: 49989c87245bb8cbfec786184d2efe1bbcb8f989
X-Patchwork-Hint: ignore
Message-Id: <20211212141522.562F082DFB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/pkcs11-helper:
 fix build with libnss
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

commit: https://git.buildroot.net/buildroot/commit/?id=49989c87245bb8cbfec786184d2efe1bbcb8f989
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Build is broken since bump of libnss to version 3.68 in commit
0a73b9b962421ce7a72c88e5f5bbd8849f21b041

Fixes:
 - http://autobuild.buildroot.org/results/1e8113d638fcb73538329511eeac9f5e7cb04d6a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6b78d020851a3bf74a825db09d39e215bf54e5c3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../pkcs11-helper/0001-nss-use-nss-pkcs11-h.patch  | 62 ++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/package/pkcs11-helper/0001-nss-use-nss-pkcs11-h.patch b/package/pkcs11-helper/0001-nss-use-nss-pkcs11-h.patch
new file mode 100644
index 0000000000..d0b573446f
--- /dev/null
+++ b/package/pkcs11-helper/0001-nss-use-nss-pkcs11-h.patch
@@ -0,0 +1,62 @@
+From d159a5c59c80552c3e8ea75d9bcf29b3a8e8289d Mon Sep 17 00:00:00 2001
+From: Alon Bar-Lev <alon.barlev@gmail.com>
+Date: Fri, 30 Jul 2021 20:06:36 +0300
+Subject: [PATCH] nss: use nss pkcs11.h
+
+make nss happy with its own extensions and non-standard behavior.
+[Retrieved (and updated to remove ChangeLog update) from:
+https://github.com/OpenSC/pkcs11-helper/pull/39]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ ChangeLog                 |  1 +
+ lib/_pkcs11h-crypto-nss.c | 14 ++++++++++----
+ lib/common.h              |  7 +++++++
+ 3 files changed, 18 insertions(+), 4 deletions(-)
+
+diff --git a/lib/_pkcs11h-crypto-nss.c b/lib/_pkcs11h-crypto-nss.c
+index 4b70e826..f57f9e6b 100644
+--- a/lib/_pkcs11h-crypto-nss.c
++++ b/lib/_pkcs11h-crypto-nss.c
+@@ -48,15 +48,21 @@
+  * POSSIBILITY OF SUCH DAMAGE.
+  */
+ 
+-#include "common.h"
+-
+-#include "_pkcs11h-crypto.h"
++#ifdef HAVE_CONFIG_H
++#include <config.h>
++#endif
+ 
+ #if defined(ENABLE_PKCS11H_ENGINE_NSS)
+-#define _PKCS11T_H_ /* required so no conflict with ours */
+ #include <nss.h>
+ #include <cert.h>
+ 
++/* Use PKCS#11 of nss to avoid conflicts and make nss happy with its own extensions */
++#define PKCS11_H 1
++
++#include "common.h"
++
++#include "_pkcs11h-crypto.h"
++
+ static
+ int
+ __pkcs11h_crypto_nss_initialize (
+diff --git a/lib/common.h b/lib/common.h
+index 61a958af..2499e9c5 100644
+--- a/lib/common.h
++++ b/lib/common.h
+@@ -72,5 +72,12 @@
+ 
+ #define _PKCS11H_ASSERT		assert
+ 
++#ifndef FALSE
++#define FALSE 0
++#endif
++#ifndef TRUE
++#define TRUE 1
++#endif
++
+ #endif
+ 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

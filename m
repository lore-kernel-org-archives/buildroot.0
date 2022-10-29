Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88E24C433FE
	for <buildroot@archiver.kernel.org>; Sat, 29 Oct 2022 16:09:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39B10605E0;
	Sat, 29 Oct 2022 16:09:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39B10605E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g83oFTvIoeUo; Sat, 29 Oct 2022 16:09:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27F6E60B29;
	Sat, 29 Oct 2022 16:09:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27F6E60B29
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A4BED1BF5DC
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 16:09:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E5A1408AE
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 16:09:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E5A1408AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6I_Fbwjb7F0b for <buildroot@lists.busybox.net>;
 Sat, 29 Oct 2022 16:09:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61C98408A2
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 16:09:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61C98408A2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4CA9586FBA; Sat, 29 Oct 2022 16:09:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 29 Oct 2022 18:05:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8941d02bf1da1574b8db65a104566a080e85308b
X-Git-Newrev: 18b5d6205db7547d633d6ac4ea8ba4fdd81ecc35
X-Patchwork-Hint: ignore
Message-Id: <20221029160920.4CA9586FBA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wolfssl: security bump to version
 5.5.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=18b5d6205db7547d633d6ac4ea8ba4fdd81ecc35
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In the case that the WOLFSSL_CALLBACKS macro is set when building
wolfSSL, there is a potential heap over read of 5 bytes when handling
TLS 1.3 client connections. This heap over read is limited to wolfSSL
builds explicitly setting the macro WOLFSSL_CALLBACKS, the feature does
not get turned on by any other build options. The macro
WOLFSSL_CALLBACKS is intended for debug use only, but if having it
enabled in production, users are recommended to disable
WOLFSSL_CALLBACKS. Users enabling WOLFSSL_CALLBACKS are recommended to
update their version of wolfSSL. CVE 2022-42905

https://github.com/wolfSSL/wolfssl/releases/tag/v5.5.2-stable

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wolfssl/wolfssl.hash | 2 +-
 package/wolfssl/wolfssl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wolfssl/wolfssl.hash b/package/wolfssl/wolfssl.hash
index 3849ffb9fc..65d77ca659 100644
--- a/package/wolfssl/wolfssl.hash
+++ b/package/wolfssl/wolfssl.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  97339e6956c90e7c881ba5c748dd04f7c30e5dbe0c06da765418c51375a6dee3  wolfssl-5.5.1.tar.gz
+sha256  49c6195462cae034efe6c86268824ba515682508a5f5199358d56a4168a82cf0  wolfssl-5.5.2.tar.gz
 
 # Hash for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wolfssl/wolfssl.mk b/package/wolfssl/wolfssl.mk
index 95d4f47952..d9fa72ccf4 100644
--- a/package/wolfssl/wolfssl.mk
+++ b/package/wolfssl/wolfssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WOLFSSL_VERSION = 5.5.1
+WOLFSSL_VERSION = 5.5.2
 WOLFSSL_SITE = $(call github,wolfSSL,wolfssl,v$(WOLFSSL_VERSION)-stable)
 WOLFSSL_INSTALL_STAGING = YES
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

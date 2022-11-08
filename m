Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 211F9C4332F
	for <buildroot@archiver.kernel.org>; Tue,  8 Nov 2022 20:02:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAA3F41744;
	Tue,  8 Nov 2022 20:02:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AAA3F41744
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6SSza_SkA3G9; Tue,  8 Nov 2022 20:02:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8912E4173B;
	Tue,  8 Nov 2022 20:02:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8912E4173B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 451C61BF422
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 20:02:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 210FD404ED
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 20:02:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 210FD404ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uSowzs0QHDr2 for <buildroot@lists.busybox.net>;
 Tue,  8 Nov 2022 20:02:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 623074048D
 for <buildroot@buildroot.org>; Tue,  8 Nov 2022 20:02:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 623074048D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 50D4E8072D; Tue,  8 Nov 2022 20:02:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 8 Nov 2022 21:00:05 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: faddef26a9d12701e872d32b18263227f9246f0b
X-Git-Newrev: 0eb111baae3046103cf7058e49762342ddc873fb
X-Patchwork-Hint: ignore
Message-Id: <20221108200212.50D4E8072D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/wolfssl: security
 bump to version 5.5.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=0eb111baae3046103cf7058e49762342ddc873fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
(cherry picked from commit 18b5d6205db7547d633d6ac4ea8ba4fdd81ecc35)
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

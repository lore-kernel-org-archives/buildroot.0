Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 368C6C83F12
	for <buildroot@archiver.kernel.org>; Mon, 28 Aug 2023 21:22:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A6F5F404F0;
	Mon, 28 Aug 2023 21:22:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6F5F404F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FGIrge4SWSG4; Mon, 28 Aug 2023 21:22:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E0ECD40436;
	Mon, 28 Aug 2023 21:22:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0ECD40436
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8D31D1BF319
 for <buildroot@lists.busybox.net>; Mon, 28 Aug 2023 21:22:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 62F8C60ADC
 for <buildroot@lists.busybox.net>; Mon, 28 Aug 2023 21:22:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62F8C60ADC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hw8aO0MVjs8z for <buildroot@lists.busybox.net>;
 Mon, 28 Aug 2023 21:22:31 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1351C6077D
 for <buildroot@buildroot.org>; Mon, 28 Aug 2023 21:22:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1351C6077D
Received: by mail.gandi.net (Postfix) with ESMTPA id 4749A20003;
 Mon, 28 Aug 2023 21:22:29 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Date: Mon, 28 Aug 2023 23:22:20 +0200
Message-ID: <20230828212221.2328358-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230828212221.2328358-1-thomas.petazzoni@bootlin.com>
References: <20230828212221.2328358-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693257749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8wMH48fdKibmM+nISiCIqk4o0N1ONMf+04nIC3JyGZQ=;
 b=dQ3mhLLVA6/GqESXdLFctYuzdU9Cy227DObvHMOHHS9FOyyUC8kjxGh2g+TXPjXrgJ5CdL
 nFKD5bEpgo8FLzazF2/AXZ4CrwnZ8Dkg4S7bRvDggM73f0PwphDDF7WdOE8A/j2BMKHj61
 KOzwiW4NNc40Q1+ZKI57X6TU+CRLITK22sgJiZK5kdRXISRX7RyKAlo5zP5T8scwb6fxiH
 OSB2SVZxhChftc6NVw7URv2czS16JojOZXmoqJM9ywie5KVGid6B5xYpf8hsRIaVicb4/A
 TawY2De/c61fbMCt5bV0KLJdHHgVfGCVkL02qeoH2184dt9yFLNduLdl5vztLA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dQ3mhLLV
Subject: [Buildroot] [PATCH 2/2] package/heirloom-mailx: ignore CVE-2004-2771
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The CVE-2004-2771 is already fixed by the Debian patch
0014-globname-Invoke-wordexp-with-WRDE_NOCMD.patch. The Debian patch
description is:

Subject: [PATCH 4/4] globname: Invoke wordexp with WRDE_NOCMD (CVE-2004-2771)

See also https://marc.info/?l=oss-security&m=141875285203183&w=2 for
more details.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/heirloom-mailx/heirloom-mailx.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/heirloom-mailx/heirloom-mailx.mk b/package/heirloom-mailx/heirloom-mailx.mk
index bb2e1f48de..6e0f2c31ab 100644
--- a/package/heirloom-mailx/heirloom-mailx.mk
+++ b/package/heirloom-mailx/heirloom-mailx.mk
@@ -14,6 +14,8 @@ HEIRLOOM_MAILX_CPE_ID_VENDOR = heirloom
 HEIRLOOM_MAILX_CPE_ID_PRODUCT = mailx
 # 0011-outof-Introduce-expandaddr-flag.patch in the Debian patches
 HEIRLOOM_MAILX_IGNORE_CVES += CVE-2014-7844
+# 0014-globname-Invoke-wordexp-with-WRDE_NOCMD.patch
+HEIRLOOM_MAILX_IGNORE_CVES += CVE-2004-2771
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 HEIRLOOM_MAILX_DEPENDENCIES += openssl
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

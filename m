Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D12C5DF6A
	for <buildroot@archiver.kernel.org>; Sat, 15 Aug 2026 14:47:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AF596065F;
	Sat, 15 Aug 2026 14:47:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MbPOlAcMcunQ; Sat, 15 Aug 2026 14:47:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A588A60661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786805269;
	bh=l5/aH2jyQ8NNfYwPx6MAao9KF0PKsfbOvoRhTCRMHD0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZMloyh4ecl/EI5VpIs3Nvj82bxYOATRwA41FrVf2M9MK3DQwz11DROKgUxYqmmPBu
	 NibmVYyx9RtIEHaV6guFVvW4yd9xE/zimbwJE7uPZybDbluA6iD8L46CAO5ZAJFDzs
	 lvWUHe752fVlydm6WnJlGYJbB0VqG2HYj9WA/FMy91uoXDefOpR8BiS2EX72PgrmLa
	 JtQqVkB0OGimXNOcOi0/H1PwlHHWz3H3TKypp5YReIixsWvhwsBnny8dHzPPCMHGTP
	 VahhpQO/R80cog+BFq9FOvB2Bf+Dui53yuurqLtoWfQ/KxvI4MaG8cvNqpybpj7qPB
	 HhhzEsGegPcyg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A588A60661;
	Sat, 15 Aug 2026 14:47:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1895C2BB
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 14:47:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F2E294064D
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 14:47:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 079zJjYEwKb9 for <buildroot@buildroot.org>;
 Sat, 15 Aug 2026 14:47:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B99D7405E7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B99D7405E7
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 14:47:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 387EE8D6A8; Sat, 15 Aug 2026 14:46:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 15 Aug 2026 16:41:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e43fb3491a52d2df14fae4873b170799125200a7
X-Git-Newrev: d2ceab1c154aeab278f50f4f1451afdacda630f4
X-Patchwork-Hint: ignore
Message-Id: <20260815144654.387EE8D6A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mbedtls: fix CPE
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d2ceab1c154aeab278f50f4f1451afdacda630f4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

A new (and hopefully definitive) CPE is to be used for mbedtls:

cpe:2.3:a:trustedfirmware:mbed_tls:

CVEs for projects under the TrustedFirmware umbrella are now seemingly
handled under the CPE vendor "trustedfirmware"[1].

NVD correctly reports[2] the new CPE deprecates the "old" one Buildroot
was using.

[1] https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/49486/comment/2fd93ed7_df27998e/ before last comment from Sandrine
[2] https://nvd.nist.gov/products/cpe/detail/453A781D-74D5-4FB5-9BB6-8C1F7F281A7A
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mbedtls/mbedtls.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index e8bb0a71b9..9def876808 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -15,7 +15,7 @@ MBEDTLS_CONF_OPTS = \
 MBEDTLS_INSTALL_STAGING = YES
 MBEDTLS_LICENSE = Apache-2.0 or GPL-2.0+
 MBEDTLS_LICENSE_FILES = LICENSE
-MBEDTLS_CPE_ID_VENDOR = arm
+MBEDTLS_CPE_ID_VENDOR = trustedfirmware
 MBEDTLS_CPE_ID_PRODUCT = mbed_tls
 
 # This is mandatory for hiawatha
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

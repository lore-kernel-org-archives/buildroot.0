Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB595C5DF94
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 15:12:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61FF781D46;
	Fri, 21 Aug 2026 15:12:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2xffokWjfbth; Fri, 21 Aug 2026 15:12:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787325120;
	bh=eC5hADA9iyMISB4YKvv+Ikzrowh74KPZJcRRST0XSy0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MGiR8aS5BHjURLsSBZY54EaXzUjqupfyF3OWT9uQ88qv0AVjhc8GrH9fMdoaZJyf5
	 29C+AC70fESqI4JdYIbunfMiZpKNRc4Q6BKXwjcbqP5fI57diibr6K3YKxtC3uqfU5
	 kF8GWRSYo5BCm2pOWNRKjFdWd6rj9tF/VMfisrTtLWDRuWt7D51eUZdyy+0CzLYFK4
	 MakBiaCwVJzxnaxig4so/zp3RRummwaQrGWPvEmk55PQiRYxV5uoLo8tz/YdxVtFqS
	 zovNYXZXZITXo1lrEb4h86mYEcqTl774YfxNNC9E2Pgd/PBVD+YxZ+daJ8k5xt6bRE
	 apy9enwXJOnvQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2A4981C19;
	Fri, 21 Aug 2026 15:11:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C8C431CF2
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B914C60A7D
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JYuazO7R0ezX for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 15:11:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14661606A6
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 86A298DE49; Fri, 21 Aug 2026 15:10:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 20 Aug 2026 14:20:50 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 59df6105d0268fb491b44c6fe99d31252e930561
X-Git-Newrev: 0916cf0a64b7e5b95f8b99ddb303b6c6d07ca609
X-Patchwork-Hint: ignore
Message-Id: <20260821151017.86A298DE49@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/mbedtls: fix CPE
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0916cf0a64b7e5b95f8b99ddb303b6c6d07ca609
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

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
(cherry picked from commit d2ceab1c154aeab278f50f4f1451afdacda630f4)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
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

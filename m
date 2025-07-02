Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C708C83013
	for <buildroot@archiver.kernel.org>; Wed,  2 Jul 2025 10:07:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CB0D84618;
	Wed,  2 Jul 2025 10:07:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2KQngPkIhuBi; Wed,  2 Jul 2025 10:07:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42038811D3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42038811D3;
	Wed,  2 Jul 2025 10:07:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 67828196
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 10:07:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5900441442
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 10:07:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LKbDded7RHUL for <buildroot@buildroot.org>;
 Wed,  2 Jul 2025 10:07:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2689F4144E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2689F4144E
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2689F4144E
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 10:07:14 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -489302082; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 02 Jul 2025 10:07:12 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1uWuMx-009C0Q-1M;
 Wed, 02 Jul 2025 12:07:11 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed,  2 Jul 2025 12:07:10 +0200
Message-Id: <20250702100710.2191088-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=oAKU9bUq5sl6/kYjLNDG/WxebAjjuonLKyC/Xw5npeuyzDFDi3cPWAQl2KIy4PPJnP1OSO2xNP1jkzLLk2gxjeAkkMvfpeMaZ1vTiW7XgNOwJFGxPwLD3p4wolYBiF5XFyIvahdK7+FqeRw/0XOPn+gKhldo0Bjud64EU6GQUsbNVVTIlxOgS6OAzwYdDT33OuuKhDvxV7Jjn9itS1aoCo/Rib6rYEQKW9uVyo3f95ck415sV3QaOwZGaO3JtvBIsnuIngb8tPV5+btneHs0ZiOWdLYQ4bLAhH2TdOA/rbwv9Ojx5jaRHdNfQSVO9vc1M5k3v/eujCKQ27W8aBZotg==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=6wzxcm5YiPvyxAMO2s40DHK94o22yxAkSJdvw6GTFjo=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=oAKU9bUq
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] package/jose: add CPE identifier
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:latchset:jose:14:*:*:*:*:*:*:* is a valid CPE ID.

See:
https://nvd.nist.gov/products/cpe/detail/7E6A7E16-E8B0-47BA-B7C7-0D4102933031

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jose/jose.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/jose/jose.mk b/package/jose/jose.mk
index 9fd9d1dcaa..88050be5ed 100644
--- a/package/jose/jose.mk
+++ b/package/jose/jose.mk
@@ -12,5 +12,6 @@ JOSE_LICENSE_FILES = COPYING
 JOSE_INSTALL_STAGING = YES
 JOSE_DEPENDENCIES = host-pkgconf zlib jansson openssl
 JOSE_CONF_OPTS = -Ddocs=disabled
+JOSE_CPE_ID_VENDOR = latchset
 
 $(eval $(meson-package))
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

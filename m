Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C79A9CCFA03
	for <buildroot@archiver.kernel.org>; Mon,  3 Nov 2025 08:29:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81D7860E74;
	Mon,  3 Nov 2025 08:29:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iyeVwbOEyJvC; Mon,  3 Nov 2025 08:29:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACF0F60E66
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACF0F60E66;
	Mon,  3 Nov 2025 08:29:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 16C06222
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 08:29:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 08C684215A
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 08:29:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8gfnNFxQasTG for <buildroot@buildroot.org>;
 Mon,  3 Nov 2025 08:29:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 80B864192E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80B864192E
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 80B864192E
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 08:29:43 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 2035031866; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 03 Nov 2025 08:29:39 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1vFpwX-001XDD-1T;
 Mon, 03 Nov 2025 09:29:37 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon,  3 Nov 2025 09:29:29 +0100
Message-Id: <20251103082930.365967-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=dU+eeIA68YMqDC8YwaKs1asCjqRsT3p/VTh5TO39n8DZAkSlXEdWZtGtjGavOKRLMYTbQ1HkA8uc2S+oIIy1tpSih9w629FTlA5bkXJsYNISftlOPx215HfY7/hxZmmrCh8gXqpd03Bn2lNvJ988MMzsNUYQhoqiAUV7qfjSefkqSGcHoAX/7RntXBzqXl2lpIAr2BqIRDjxxcvNOW5CUq4/HRfsAe5RdvuLL4LomwkT9P7YuqJsyc0bANEAYkK95zQd0nfmWVQ1oxJrXyNzB5HC8GzEc+PYbtkbfjyoNdZqa8wETl/K2XpMiSrhEElG47vrjN+TFYN0PqSTD/afwA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=zhg5EOR5aRmnxfcngAvInc16qsrU6l3M4E4RQsV70nc=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=dU+eeIA6
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] package/pkg-download.mk: fix 'dereferencing'
 typo
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

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-download.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index fa1e06537e..ef268f5c83 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -27,7 +27,7 @@ else
 BR2_DL_DIR = $(DL_DIR)
 endif
 
-# ensure it exists and a absolute path, derefrecing symlinks
+# ensure it exists and a absolute path, dereferencing symlinks
 DL_DIR := $(shell mkdir -p $(DL_DIR) && cd $(DL_DIR) >/dev/null && pwd -P)
 
 #
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

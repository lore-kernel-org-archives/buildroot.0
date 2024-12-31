Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 151E7E77188
	for <buildroot@archiver.kernel.org>; Tue, 31 Dec 2024 10:35:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9125A404DF;
	Tue, 31 Dec 2024 10:35:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rSqACuNnJBhz; Tue, 31 Dec 2024 10:35:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5714C40620
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5714C40620;
	Tue, 31 Dec 2024 10:35:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D37B968
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 10:35:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A3FF408C7
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 10:35:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lJPd1ZvXiJlZ for <buildroot@buildroot.org>;
 Tue, 31 Dec 2024 10:35:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 46440403EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46440403EA
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 46440403EA
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 10:35:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id E194640006;
 Tue, 31 Dec 2024 10:35:24 +0000 (UTC)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Buildroot List <buildroot@buildroot.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jesse Van Gavere <jesseevg@gmail.com>
Date: Tue, 31 Dec 2024 11:35:17 +0100
Message-ID: <20241231103518.1681479-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735641325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=TPMOzigz88L8z6eYQhyqEZEwX5Rt4Tg917PNxPbTVKw=;
 b=EtxlAz6b3eF61LSVFhZR7yo7b/pMzy8d6ZzUjRf0rNZVcDWCSR4n1VfGQ21VZfOF68V/no
 6G2eKE0GgxsllQCsFH4QiHsov36NdcdtVC0tu2FoWJ1wgLKGPS3rjWaIpeor3RdSCFNk/Y
 N/XqXLmKfeZQquT852F64Fja+5VTayUmPpS6iDQvjfTf9gJIcaxQfZhtZ4JMyv5yRjQECr
 bt2QAA90u5V173rSTqH9amoGCgPCbS2E/gnJcs6y+zuDjx2mW9A02XE5ZCZdmZNV271EIy
 yvD0CBbiqnM0vPL4mxK/WU8foYcI42p/QV4iG8tHbfLNV6wNjp1Z/VY7AypNlA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EtxlAz6b
Subject: [Buildroot] [2024.02.x] package/qt6/qt6base: fix
 QT6BASE_IGNORE_CVES for CVE-2023-51714
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

Commit 4009842cba631b1061bcdea799e0802c40ea549c ("package/qt6/qt6base:
backport fix for CVE-2023-51714") brought in a fix for CVE-2023-51714,
but got the QT6BASE_IGNORE_CVES update wrong, due to a copy/paste
error with the previous QT6BASE_IGNORE_CVES entry. Due to this
CVE-2023-51714 is still reported as affecting qt6base, while the
security fix is already there.

Fixes: 4009842cba631b1061bcdea799e0802c40ea549c ("package/qt6/qt6base: backport fix for CVE-2023-51714")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt6/qt6base/qt6base.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 3c5747db36..ab6764cbbe 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -18,7 +18,7 @@ QT6BASE_IGNORE_CVES += CVE-2023-32763
 # 0009-QXmlStreamReader-Raise-error-on-unexpected-tokens.patch
 QT6BASE_IGNORE_CVES += CVE-2023-38197
 # 0011-HPack-fix-incorrect-integer-overflow-check.patch
-QT6BASE_IGNORE_CVES += CVE-2023-38197
+QT6BASE_IGNORE_CVES += CVE-2023-51714
 # 0013-QXmlStreamReader-make-fastScanName-indicate-parsing-.patch
 QT6BASE_IGNORE_CVES += CVE-2023-37369
 # 0014-Schannel-Reject-certificate-not-signed-by-a-configur.patch
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

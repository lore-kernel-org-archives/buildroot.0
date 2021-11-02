Return-Path: <SRS0=drHZ=PV=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92B82C433F5
	for <buildroot@archiver.kernel.org>; Tue,  2 Nov 2021 00:37:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1CEB60FD9
	for <buildroot@archiver.kernel.org>; Tue,  2 Nov 2021 00:37:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B1CEB60FD9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 437AB80C94;
	Tue,  2 Nov 2021 00:37:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uFV7OlFT6eui; Tue,  2 Nov 2021 00:37:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1FF980C90;
	Tue,  2 Nov 2021 00:37:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A38E71BF32A
 for <buildroot@lists.busybox.net>; Tue,  2 Nov 2021 00:37:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C42E402A7
 for <buildroot@lists.busybox.net>; Tue,  2 Nov 2021 00:37:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7uUftOnrAe6T for <buildroot@lists.busybox.net>;
 Tue,  2 Nov 2021 00:37:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
 by smtp4.osuosl.org (Postfix) with ESMTP id 33EDD402A6
 for <buildroot@buildroot.org>; Tue,  2 Nov 2021 00:37:16 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id hhndmJddNsU3thhnemowNz; Tue, 02 Nov 2021 01:37:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1635813434; bh=Zd+75ABxNtm3IePBsOfHqj7Pw6ya7x55U2lbP1WUrV4=;
 h=From:To:Subject:Date:MIME-Version;
 b=XSjJzn+Fu59b1QgWJQdoZoozjTckKdMxMTy7xNQaLIHj/DRDBVH8Tek/wn0DOXv16
 GgPof8Ak0NiWal4KPrxtBTb/0Bw0Zp+vT8JNtk6j/b/Lwq2SHpwpQz5aIGXv0dZ1U5
 GHrfDAKngKzQmWm1WbHh4ZrBioLwufoXcRyMPExOKuKN5UxjFGQ2IAePw4wkNAIpby
 CG+A/6Upm0mfxYniMatUsPJHQFuIrEAYjjWQ1N1VQn0dq3l5btw10vUntOgkGi6yvl
 WrZIEAdRwrgqKJMh4+yt53H6JvAB6OFf4dEsYFw6Pdo0o24eFAL+2gtZN+mxxrPlr/
 RjbaJqJXqXsnA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue,  2 Nov 2021 01:37:13 +0100
Message-Id: <20211102003713.2441861-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfJ6sX2UszeBZITjs0WnIdCcG9yrLM4bdGmm6ZpjeQe4U8jcq5sD5Z5sOM2mKc2844FwbW0SyM19wlTfwNhKXuxfPCQK6pWD0Ugro4STP2n/XLa+JX64Q
 XeY+uy1gSUqH+0PasYM97MmXUeKruqTCthKb/fB3F5InA/kmoP26h9BSZ74rWY3fhmfm1rjPGsK/RukQ9Zveft7H9erylchtt/iolMf3ZEeo7idWtvjLFpcY
 Vl61YXYCFDSjUfe0nlfN1RD8FnCGhalryqvl7uHqiBY=
Subject: [Buildroot] [PATCH] DEVELOPERS: add Giulio Benetti to all Olimex
 Allwinner boards' defconfigs
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add Giulio Benetti to all Olimex Allwinner boards' defconfigs since I've
recently updated and tested them all and I'd like to receive possible
build failure related to this topic from gitlab CI/CD.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 65240615b0..a2f29881ec 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1052,6 +1052,7 @@ F:	package/xapian/
 N:	Giulio Benetti <giulio.benetti@benettiengineering.com>
 F:	configs/amarula_vyasa_rk3288_defconfig
 F:	configs/asus_tinker_rk3288_defconfig
+F:	configs/olimex_a*
 F:	package/at/
 F:	package/binutils/
 F:	package/erlang-jiffy/
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

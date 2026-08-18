Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A10C5DF81
	for <buildroot@archiver.kernel.org>; Tue, 18 Aug 2026 22:14:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 194CB60612;
	Tue, 18 Aug 2026 22:14:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B_N0I9PEylzU; Tue, 18 Aug 2026 22:14:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787091254;
	bh=SSlP0lyCpjU1rFC5+c6dVgk+7nALAll4P3oSW7/TeLo=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jDm5av0PHKm9pKZJXtvRj4xeuJmraTiNiENzJpIg9nPS3liZ9vudWgCz7WkZ+Fvp2
	 +CdStqNLESUsTB9/OLRlMDEwAVFHk3Hi9J64ZJtIaa78f95S52il8QtAnQnXlT7pBc
	 GF6Pj6nbtfwG4k+sdhIPsb2lGm1X2//W7wp/2iVXVG/8KE3sj+LQSWT5D/MIsCqye1
	 TXIi3P3SQyVRJtdrPzpd7/mtX4mWXA+E7HF6T2sI4akAS1CPRYtI0wSvBKtGx8ex60
	 m7bHwP6pzzqM4y3nvu8StOHu57yflhSMl+YMl3oCM0Ktkq8tPc+zs7dc7mvpM57TFY
	 tAyE9IrMvR1eA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A6266065A;
	Tue, 18 Aug 2026 22:14:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E79825B
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 22:14:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 80A0D400AF
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 22:14:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x-cZdlzaL2yV for <buildroot@buildroot.org>;
 Tue, 18 Aug 2026 22:14:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.158;
 helo=smtpweb158.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=LX6MoiJx
Received: from smtpweb158.aruba.it (smtpweb158.aruba.it [62.149.158.158])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 893CB40077
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 22:14:08 +0000 (UTC)
Received: from localhost.localdomain ([93.136.29.121])
 by Aruba SMTP with ESMTPSA
 id wS4Jwrjm0rbJKwS4MwTn2v; Wed, 19 Aug 2026 00:14:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1787091246; bh=l7NC79/3pMX6+edx3O+J2kyC6zNXkdmS4cu0pFAVeCc=;
 h=From:To:Subject:Date:MIME-Version;
 b=LX6MoiJxeb1S6gac0GUvvkck3DUHFZ9AoSb2I7Q/VL15Hz51X3nRwbQlbFyTqwD+2
 W3xdduWSY/dKpxAfeujMUnpXvYx/3bQc79g8qlQVbLFMyAPbndvihZ9L3d4i2MdoTu
 z6tQssW4wDE9SRNpnNxdMJF5S21ptvzbV22+Bk6Vp7urMZwgp36bf4ZqxargQ0k1zi
 eqaBLrj6ve85ERE+P2izQgSRqghEqlMGDUlZD5tt4RLsGmzDPNI/onwW6A8EbRqcOK
 zLSojgXxb3WaN4BpAn1YtBWoxMeWEg7oXuZAwiNfvW6Q6CHhDjFzajPaKixvc0BPFH
 jfL+xgXJeRpdQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Marek Belisko <marek.belisko@open-nandra.com>
Date: Wed, 19 Aug 2026 00:10:58 +0200
Message-ID: <20260818221058.2704747-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260818221058.2704747-1-giulio.benetti@benettiengineering.com>
References: <20260818221058.2704747-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfIRdzsYoSYPeBcDrF3kPXUVLRO/9C8mlEdmQ0GTzzVat6Momu75ZzkypXeoIFheG532S6QgxH8KZY2ZDgbwjjOQZwziw5ulG/TB4T6rEpvHHIH7699Vd
 QaCUs5+BAh3gvbiA4yhaB8rno0J4FuKPm8xc7yJfFg5SCVEmUD8WiMkQXm37AUaUZTDJb9D3Xkh45yY3V9HaemkWAflOtciJR81xk1fInpuJx3hmHcY2fet0
 BfNvetldw4rWrKId7Gs1lb4dErGclmp8DbK16ega3hR2a7p6+22vX+CSIfY9N0Qo/WJpcMnYNwSi+zjjRRtNaKceZY7vFlszd83Bu/tqIRU=
Subject: [Buildroot] [PATCH] package/wireshark: security bump to v4.4.18
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

For more information on the version bump, see:
  - https://www.wireshark.org/docs/relnotes/wireshark-4.4.18.html

At the moment this version fixes a CVE called CVE-2026-xxx that is only
a placeholder as stated here:
https://gitlab.com/wireshark/wireshark/-/work_items/21469#note_3696467312

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 917ac47471..3d8fdb6131 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.4.17.txt
-sha1  d46443d5bbca3580f944f3effcdfcc59e24eb7f4  wireshark-4.4.17.tar.xz
-sha256  b89a8c60b9282f29be4db91437a6e969e61bc17e8c92ddd980cc38c7304dd772  wireshark-4.4.17.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.4.18.txt
+sha1  482fecbe21a876f53a26bf5beaa5b0ee0ad16e50  wireshark-4.4.18.tar.xz
+sha256  f77a7939983758383797fed0a34a491f785e541cca397a7a44e9cdd7c6f847c6  wireshark-4.4.18.tar.xz
 
 # Locally calculated
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 1fd81515c1..c500a49336 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 4.4.17
+WIRESHARK_VERSION = 4.4.18
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

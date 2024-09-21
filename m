Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE1EDCF9C5B
	for <buildroot@archiver.kernel.org>; Sat, 21 Sep 2024 18:56:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FC28401E8;
	Sat, 21 Sep 2024 18:56:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NR0NqxNWPMNS; Sat, 21 Sep 2024 18:56:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 882A8406C3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 882A8406C3;
	Sat, 21 Sep 2024 18:56:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AF8241BF59E
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 18:56:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D08881D02
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 18:56:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iPnwAb3STU92 for <buildroot@lists.busybox.net>;
 Sat, 21 Sep 2024 18:56:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 74B5E81CAD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74B5E81CAD
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 74B5E81CAD
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 18:56:02 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cae1.dip0.t-ipconnect.de [79.214.202.225])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 83093A4C0E03;
 Sat, 21 Sep 2024 20:55:59 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36328)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1ss5Gw-000000004jH-3LYv;
 Sat, 21 Sep 2024 18:55:59 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 20:55:57 +0200
Message-Id: <20240921185558.3647651-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1726944959;
 bh=As17J0aQY8jp7Z+P1vflm4aV8mSZJaIQOE/CNhVFwYM=;
 h=From:To:Cc:Subject:Date:From;
 b=p+27jDkbDmA4zuSPRyUOqX5uSnbSXM6q3yh+YVEIyqH3ZpwsLlcKSx3FvVtDDEc3V
 DmJPQjGqEui5OImRTc04gIpFXuswTVlKeOv1glW+esMoBQQslTxjuFJj92Zp0LjF3s
 lCz4iClfk0GP8brHk4f9jQMniEk1C7JUX2u6Km6u5sAKG/rweqsSvJmho6hIC8Pd1Y
 qvaoQ0DXQEnGPeNEIcm0mo2Xg0UcX88PCmsmoPYeF9F68l1XVL+oIjZM8Adkrd95jf
 94wr8Kvai3e1wdvDEdPiFTxGOIntErr85UEZsXxx97gQLk3eM8BMeyxfAVWywccZ8u
 j037OTjrL8FOg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=p+27jDkb
Subject: [Buildroot] [PATCH 1/2] package/python-pyasyncore: enable host
 package
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
Cc: Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Needed for python-emailproxy.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-pyasyncore/python-pyasyncore.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-pyasyncore/python-pyasyncore.mk b/package/python-pyasyncore/python-pyasyncore.mk
index 4b1e3c98b6..5a178c37b8 100644
--- a/package/python-pyasyncore/python-pyasyncore.mk
+++ b/package/python-pyasyncore/python-pyasyncore.mk
@@ -12,3 +12,4 @@ PYTHON_PYASYNCORE_LICENSE = PSF-2.0
 PYTHON_PYASYNCORE_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

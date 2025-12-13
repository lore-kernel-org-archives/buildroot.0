Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A3FD5B169
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 20:40:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 286E9608A5;
	Sat, 13 Dec 2025 20:40:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FzYySijqnCAi; Sat, 13 Dec 2025 20:40:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FF02607ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765658429;
	bh=n8UjUUuDQcKyXByh+5jePBliOIIjhuWU7bPVLh2c+m4=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=X7pbfDeVocCJwBCAk3f3IAFmVl/ZKcbfLNd5WZZjgHU1DZ58/H6J5k+Py1WynAEJ4
	 uCJmJaVOysTh3Y4sHfZqF+IZF6Fyqvn6hA87ZI5lgD9KQsV1OaVqSAOuXPw1/NJn8f
	 YoZfo0h7ItksZO0rUqD9UiCjhnKDkB3lAxpz67ZX+izMhHl259rieTjyYMpRdBN75H
	 hh/zognQv1dTvpQhpkqHmcJQtNFMyitqthEUcKmm/eQ2KbUjv21Y3wNSWDAihqRtIg
	 mNEsyK1eu1VvDSIIyjlll+4AcrremhReg/j2MdYwb2NMXF536HxFSkMXQAZg7+u7tu
	 jLU7mJ9a2ZC7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FF02607ED;
	Sat, 13 Dec 2025 20:40:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 397702C1
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 20:40:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B01E40208
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 20:40:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tj5nBvpKSNZB for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 20:40:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.147;
 helo=smtpweb147.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3BFFF400A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3BFFF400A0
Received: from smtpweb147.aruba.it (smtpweb147.aruba.it [62.149.158.147])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3BFFF400A0
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 20:40:24 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id UWPdvpoar3rWiUWPevHmb0; Sat, 13 Dec 2025 21:40:22 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sat, 13 Dec 2025 21:40:21 +0100
Message-ID: <20251213204021.1811227-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfNwW7Rb3ShpmAWyotUN9ySOtb+sUSM8CBjZqpXGA1HjrwO/8fnPoloaDLkYqGw68cpWNXQEDruRLjrKM86hoYVPOXYuXWRTzr6RKnx5oMKeLuhMxuXfR
 BR4ITCTKexYIdhNYZO7E3aSZSUyYyEoLXbRAnpehWoJBMnVkY35Jg3msP6EPfeE5rk8AQKA1v78Nf3xrGCkhqsdoaovt087JMNVa2jmux6JxSuH/bkf+Rx+W
 aADfees0CrGQyEdtBRyU+SXyn1CUojttrGx1W96TkaMDaxz+ZXb30Kx1QiOS3UQai9UaY5jH74RBp6ZBBI2HAQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1765658422; bh=O8by0NDxKwOFbYlCZ+VQoWqBZ1QvT2TL3Pszc83XKAg=;
 h=From:To:Subject:Date:MIME-Version;
 b=ebmLvAWPhL3V8Oa2brcjwLzU23gTw72oxCGWWJvRPS66oL2bKl5/g4lhydHtguvv2
 8UtqcmOcwn2QlxdGKT0+XZB4mdzc/m9akv70acqghA+vhIEB9kLNNZjdUEJdY/CAVR
 iBr3s6YGlA158edKR4D9C0zNYWZa458g1PGAIV47pLNWLHeXjSgKX3L5HYstl/IXRW
 KRiT5RGUNGiYmo5xwE+G0ycjNRqUsNz9rJHZ+/lbi1jsfnbheYXYEodH57dd575CyA
 AtgVG54vdSQR1mFGgo2hsyf/hqLPZ/OTQlK/07hNe6llstt4onABUuZNv19Gj3wcSE
 LqsVWt9yZBMEw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=ebmLvAWP
Subject: [Buildroot] [PATCH] package/rtl8821au: bump to version 2025-12-13
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

This allows to build with Linux 6.18

Fixes:
https://autobuild.buildroot.org/results/bc0ec5fe3acb37740b54eb1af1fe5d9284c87cf2/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8821au/rtl8821au.hash | 2 +-
 package/rtl8821au/rtl8821au.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8821au/rtl8821au.hash b/package/rtl8821au/rtl8821au.hash
index 29b4d46f8e..ca5f9f15df 100644
--- a/package/rtl8821au/rtl8821au.hash
+++ b/package/rtl8821au/rtl8821au.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  fe9840003e9481cf9fce3a5ed3f5b985615f862abc1b8d51fe6de7da9e4943c9  rtl8821au-dfe6801adb9b3a5572260ab308d3b69522992814.tar.gz
+sha256  1d9f87c7a30d54f67cb09e98a436565ba9c64a28feca95205f66212d8833836c  rtl8821au-bb26b6b06c47b79c17426ef186f44a608dbed7a0.tar.gz
 sha256  640d90f6ee401241ff62834d0d1b33f83049e99b8bfdfa04ed1b0a1635dde3e7  LICENSE
diff --git a/package/rtl8821au/rtl8821au.mk b/package/rtl8821au/rtl8821au.mk
index 734b427019..4e7aee4204 100644
--- a/package/rtl8821au/rtl8821au.mk
+++ b/package/rtl8821au/rtl8821au.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8821AU_VERSION = dfe6801adb9b3a5572260ab308d3b69522992814
+RTL8821AU_VERSION = bb26b6b06c47b79c17426ef186f44a608dbed7a0
 RTL8821AU_SITE = $(call github,benetti-engineering,rtl8821au,$(RTL8821AU_VERSION))
 RTL8821AU_LICENSE = GPL-2.0
 RTL8821AU_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

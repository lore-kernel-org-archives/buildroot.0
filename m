Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA6FCD4F3D
	for <buildroot@archiver.kernel.org>; Sun, 17 May 2026 20:38:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7F7884AB6;
	Sun, 17 May 2026 20:38:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qDUq331SVwV7; Sun, 17 May 2026 20:38:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C911E855F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779050305;
	bh=6HRIiaclgiTKNLtehf3CrtBhNThkV1DQhwQ/ODnLFPM=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=O6LOI5zxvj65i4Xncz/6wu9Kj2jkVvv3/i9hjpUlFYx3hwsv4/Xg+4jmuXtYGn8zG
	 KAP1fi8Iz+zxR36QBPFxZy3t9SN0Yo2R58QuPCoe6EmrADRYBSJnYV+L9gBPuTdKfa
	 7hPngHejcLMjlVq3XCMHAVJQV0ASCf/DAsYqPVH3VgZiwgsHT7upHm1M+qvVBwb9yo
	 58g2YKgenAw61Rhi0yIaWa2rwYqo8ti7rWYtZaMZfKwIQpRCo934pB8TlZoer9/NeN
	 cPN2tnSFYcuxhoXmPb/GByoqDB1LtFCKiix+AFxhGPF2QDiQ5+clKF+h99D/q6GiQ6
	 vRGveW0qwjntQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C911E855F2;
	Sun, 17 May 2026 20:38:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 67710265
 for <buildroot@buildroot.org>; Sun, 17 May 2026 20:38:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D4C640095
 for <buildroot@buildroot.org>; Sun, 17 May 2026 20:38:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dCW_F605BUXo for <buildroot@buildroot.org>;
 Sun, 17 May 2026 20:38:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 515DA42018
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 515DA42018
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 515DA42018
 for <buildroot@buildroot.org>; Sun, 17 May 2026 20:38:23 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 6A0E05FFA3;
 Sun, 17 May 2026 22:38:16 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Martin Bark <martin@barkynet.com>, Richard Braun <rbraun@sceen.net>,
 Julien Olivain <ju.o@free.fr>
Date: Sun, 17 May 2026 22:38:05 +0200
Message-ID: <20260517203806.375813-1-ju.o@free.fr>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1779050300;
 bh=3OUrR5AUeK84IeNBZcEaQLGoW8nKhefFMgaJnHATSBo=;
 h=From:To:Cc:Subject:Date:From;
 b=i8Lj599aOmGG5bl15CWFzYpEnJloVFjmwUYFp87NG9lG5e5vABnziDSW7Hp5mb3Qr
 jv48CSdszbpJnC16EQTJErY0vp9JlcT2sXaNd39nCG4tc/d9AxAr09SlbqUxL14F4q
 mS6gqhsTYgPm0d2p5FEznTzpcQUNWaIwIDqgYyGqmR47I267KVIT/zdtueQfbFoY0t
 tWhz2OUo5z+J+zOqENalaUN+hPHY29RKjpjx0CrrRvuirkl1Y63AufwQZfkX91WszC
 EwnY2pJuT/2OB6uLTYv94g72AKb+tKSGq2uSUtoIpS8lHV9VFQPQqgrm8ZtCDysS26
 eLOtxb2XkFmIA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=i8Lj599a
Subject: [Buildroot] [PATCH next 1/2] package/zic: bump to 2026b
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For release notes, see:
https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/VX2Z3CBO6KHTYZNBBKFFWM7ZCI6TVCXP/

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/zic/zic.hash | 4 ++--
 package/zic/zic.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/zic/zic.hash b/package/zic/zic.hash
index 7fe7582f10..75242a306f 100644
--- a/package/zic/zic.hash
+++ b/package/zic/zic.hash
@@ -1,4 +1,4 @@
-# https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/TAGXKYLMAQRZRFTERQ33CEKOW7KRJVAK/
-sha512  d14bc0680b9cb33d6526a2c0e483f2abafc2593cfe5fbfe7dcab940aafdc1baaec065dbaa1bb58b03586a8631ffdf43ebb22ff5a70503298b6ea2cf061d82c16  tzcode2025c.tar.gz
+# https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/VX2Z3CBO6KHTYZNBBKFFWM7ZCI6TVCXP/
+sha512  55b44d52a83c9db151be32c3d78376ea7f9d4311ef15ed6fe34b855b08fc546531e51309d178d9c175a6d5d7d0b058440e45a55d200ca8925e3798dac9bc739f  tzcode2026b.tar.gz
 # Locally computed:
 sha256  0613408568889f5739e5ae252b722a2659c02002839ad970a63dc5e9174b27cf  LICENSE
diff --git a/package/zic/zic.mk b/package/zic/zic.mk
index 06d8ebaf15..43e74e64c8 100644
--- a/package/zic/zic.mk
+++ b/package/zic/zic.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZIC_VERSION = 2025c
+ZIC_VERSION = 2026b
 ZIC_SOURCE = tzcode$(ZIC_VERSION).tar.gz
 ZIC_SITE = https://www.iana.org/time-zones/repository/releases
 ZIC_STRIP_COMPONENTS = 0
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

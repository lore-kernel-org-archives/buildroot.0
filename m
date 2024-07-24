Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20441C3DA61
	for <buildroot@archiver.kernel.org>; Wed, 24 Jul 2024 11:14:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C021880A65;
	Wed, 24 Jul 2024 11:14:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z3FRqjL4K4Js; Wed, 24 Jul 2024 11:14:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0FA880F78
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0FA880F78;
	Wed, 24 Jul 2024 11:14:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 68F5F1BF2B3
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 11:14:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 56437606E3
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 11:14:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T0StfUxsRI8t for <buildroot@lists.busybox.net>;
 Wed, 24 Jul 2024 11:14:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F0E71608AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0E71608AA
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F0E71608AA
 for <buildroot@buildroot.org>; Wed, 24 Jul 2024 11:14:04 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2eecd2c6432so96019791fa.3
 for <buildroot@buildroot.org>; Wed, 24 Jul 2024 04:14:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721819641; x=1722424441;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0F2tpyUR2J0X/oCT2evZ48TCyOzA0pPKt2HwwpZ9ZM0=;
 b=BCQr7hucRoxC5a3anFYYllB0Y8EBgtUJamWp0/J+ibYRO1IAd2PLW/iDjNnpexhCmX
 xiR5ygXdr38xHif5cR8Rm7LljAirpBlCOn8hKziUgE3o9r2GyGYhCOStzKpUVZxb6/uw
 9/nkztbiRvRTyCExi3vn6QhjTksVkwG5/wipmyulBlLg76XWW2mxlGLEjjuXvYso+L9C
 w0DHTY7F7004lWzTwc4rx4fY/2+XDBOf/GdbkB7WmAq6+uYGiY7jgum4QrQ22D5gxAM0
 pGf6HeTziQ7XLD5YUQYszmrpTmzGWOTvGXoyOVNMnkBzS1VX8sVIKVUHAmOLn9I2W36S
 yxzw==
X-Gm-Message-State: AOJu0YyyiDTUssZte0sg3QmKKKM2bxQhSXS/ZxxcAaBjfi8vjjUHSVAc
 igRux5F/WaDJBmRnh/xcqWIChR5Q8oNESNmc2wEfIegpfgOzx5TGuPuzWA==
X-Google-Smtp-Source: AGHT+IFMhti6bdxp5a3FXS/tCEVdXpzHr6ncGp2DCXKTS3GkKB8Iq0ygauVT5W+QDhDWGhM2NFB3PQ==
X-Received: by 2002:a2e:9b12:0:b0:2ef:32bb:5368 with SMTP id
 38308e7fff4ca-2f02b71e90bmr23704421fa.11.1721819640905; 
 Wed, 24 Jul 2024 04:14:00 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427f93d211bsm24382185e9.47.2024.07.24.04.14.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jul 2024 04:14:00 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 24 Jul 2024 13:13:58 +0200
Message-ID: <20240724111358.2142860-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721819641; x=1722424441; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0F2tpyUR2J0X/oCT2evZ48TCyOzA0pPKt2HwwpZ9ZM0=;
 b=CZ2db5ydbY5cNfF/mIlVcNwqEKhcm5rTxVvFYbjCv2zX9w0i3h7z6fbG7YMXe1G2hP
 3OB5AFQJ6RBFJJIlVmH7RXEwqYBBYmXfPgoj+5h0je9vDsrmxSFmtZPZ1lRnZMb5q1cE
 yEAA7h6gAUGCcgutejp0hMmVYYDHaawgtD+p9x/ZHi2j/PcFwGH43SW6lfdVTkC6WC3t
 GX8BblJHKtC6zqjMeeVkunqnM6ATmgaYCIsHC+UvoGhby+M7MR2GcC5nDVy4vIXv4Odq
 9R+V8JkCqlqLV91pMZYhaA9vOYBQAQ5dI3e8xYubsSqov1GopNemXUftBPStWljwYaZb
 rvFQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CZ2db5yd
Subject: [Buildroot] [PATCH 1/1] package/wireless-regdb: fix crda build
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
Cc: Dimitrios Siganos <dimitris@siganos.org>, Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump to version 2024.07.04
in commit 213c5c0191be022671aa726902dd7dfef5899c6e and
https://git.kernel.org/pub/scm/linux/kernel/git/wens/wireless-regdb.git/commit/?id=37dcea0e6e5effb4228fe385e906edba3cbee389:

/usr/bin/install -m 644 -D -T /home/buildroot/autobuild/instance-3/output-1/build/wireless-regdb-2024.07.04/sforshee.key.pub.pem /home/buildroot/autobuild/instance-3/output-1/target/etc/wireless-regdb/pubkeys/sforshee.key.pub.pem
/usr/bin/install: cannot stat '/home/buildroot/autobuild/instance-3/output-1/build/wireless-regdb-2024.07.04/sforshee.key.pub.pem': No such file or directory

Fixes: 213c5c0191be022671aa726902dd7dfef5899c6e
 - http://autobuild.buildroot.org/results/9ace181735305cf8e29e0bbace1aec3796c32978

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wireless-regdb/wireless-regdb.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wireless-regdb/wireless-regdb.mk b/package/wireless-regdb/wireless-regdb.mk
index b1ec4cb97e..fae21687de 100644
--- a/package/wireless-regdb/wireless-regdb.mk
+++ b/package/wireless-regdb/wireless-regdb.mk
@@ -14,8 +14,8 @@ ifeq ($(BR2_PACKAGE_CRDA),y)
 define WIRELESS_REGDB_INSTALL_CRDA_TARGET_CMDS
 	$(INSTALL) -m 644 -D -T $(@D)/regulatory.bin \
 		$(TARGET_DIR)/usr/lib/crda/regulatory.bin
-	$(INSTALL) -m 644 -D -T $(@D)/sforshee.key.pub.pem \
-		$(TARGET_DIR)/etc/wireless-regdb/pubkeys/sforshee.key.pub.pem
+	$(INSTALL) -m 644 -D -T $(@D)/wens.key.pub.pem \
+		$(TARGET_DIR)/etc/wireless-regdb/pubkeys/wens.key.pub.pem
 endef
 endif
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

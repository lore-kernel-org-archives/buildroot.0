Return-Path: <SRS0=GWv0=PZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3736BC433EF
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 15:28:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B72B960F9D
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 15:28:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B72B960F9D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 653C660717;
	Sat,  6 Nov 2021 15:28:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SnJkLrAFdAQS; Sat,  6 Nov 2021 15:28:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA8CF6067F;
	Sat,  6 Nov 2021 15:28:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 53DBF1BF2A1
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 15:28:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 43E8D80DBF
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 15:28:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yOnNz2K-ED71 for <buildroot@lists.busybox.net>;
 Sat,  6 Nov 2021 15:28:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 91C7080DAC
 for <buildroot@buildroot.org>; Sat,  6 Nov 2021 15:28:52 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id u18so18518447wrg.5
 for <buildroot@buildroot.org>; Sat, 06 Nov 2021 08:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UwgJ7ELZyxeUMFNZgygy6HtrjvWqB6QHER30MyJzfe0=;
 b=dbO4YT16maw9AYlfZ7pTPaE+UoT55Ws6ucqOEDQ+uL1r7LbQj0FxvSwpUGwV13U6LV
 WABE8TqBP+Es533JMnuAsyZS4JJ9K5/QWIU15YRJvqLZP343NuaQbuqBS7ld+TNR3Rtf
 s8SO5ICkmpOEQyEZLsWmKMT+55e2AK/V25Rf8DomaD/sZe5KrEaw6dv2erGgihuY90oI
 W+Dwm4L8ASnuEiIekmQjeiRmqQh5K6smPR0sNlO39njknhpM7+1Qdnn9/Wy/SHA3oCHd
 emzYy4oxVxevD1RXHt2v2oI7mUGUR61vcZF1gnhBWdSdfI6RG/SlswJuyCsnStcSYLQC
 HfEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UwgJ7ELZyxeUMFNZgygy6HtrjvWqB6QHER30MyJzfe0=;
 b=LR1LLNypftzkyTQbPEv+gJmDL1PGMixFtTjS6vLdTL7Y2TjImUBxGBUg7ClqMAFR+C
 RvltMQV7K3VYq+lSDCtHxzvCCLEmPu5Vf0H6EHvfnZgIbs7M+rOnF/ejEflK1NoNLn/q
 iVVSLl3jgkVuJvrg2RPVl1Dm6Il6vJkRWqx0wklhNSJiLaAjdmrwsBMda/GO44NgVnL9
 oiEtvFRSJm/AvzSO5uuC64IhQdz34bPFP62FY5efn9xeYA7Du8zd63mM8p7D15u8rJBA
 LxAm5RIJyQawXok37m9zW5ks8Epk4AhLy3KIvXAqy/d/GryvbbVQG5RtGqEX2RPro0YX
 28qw==
X-Gm-Message-State: AOAM532e7utl1RNdwpoALVqs3ag+ZNSYC6f9iX7rvLTE0jviKEFP2nSX
 i8PGdfD/F2lA+xJPKXP7ZD85RTmFaww=
X-Google-Smtp-Source: ABdhPJyIkm0gmGaxSP1qjNS3eOLUQ9aj2XwopSwIBYgWZzjdhdDe1lg3J6XNYRFca2ZlzC2/gBNJsg==
X-Received: by 2002:a05:6000:1b8f:: with SMTP id
 r15mr83773833wru.27.1636212530730; 
 Sat, 06 Nov 2021 08:28:50 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id j19sm10841873wra.5.2021.11.06.08.28.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Nov 2021 08:28:50 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  6 Nov 2021 16:27:02 +0100
Message-Id: <20211106152702.3187036-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/dvb-apps: don't override
 dependencies
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Don't override DVB_APPS_DEPENDENCIES in a conditional

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dvb-apps/dvb-apps.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dvb-apps/dvb-apps.mk b/package/dvb-apps/dvb-apps.mk
index ffab0db682..161c1f8495 100644
--- a/package/dvb-apps/dvb-apps.mk
+++ b/package/dvb-apps/dvb-apps.mk
@@ -11,7 +11,7 @@ DVB_APPS_LICENSE = GPL-2.0, GPL-2.0+, LGPL-2.1+
 DVB_APPS_LICENSE_FILES = COPYING COPYING.LGPL
 
 ifeq ($(BR2_ENABLE_LOCALE),)
-DVB_APPS_DEPENDENCIES = libiconv
+DVB_APPS_DEPENDENCIES += libiconv
 DVB_APPS_LDLIBS += -liconv
 endif
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

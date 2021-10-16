Return-Path: <SRS0=a1j9=PE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 654AEC433EF
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 14:14:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5F346115C
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 14:14:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A5F346115C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4589C60731;
	Sat, 16 Oct 2021 14:14:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6FSc1oSY2S55; Sat, 16 Oct 2021 14:14:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8B526065D;
	Sat, 16 Oct 2021 14:14:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 390801BF30B
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 14:14:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 347924021A
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 14:14:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ayPoQKq2mXLP for <buildroot@lists.busybox.net>;
 Sat, 16 Oct 2021 14:14:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2238740163
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 14:14:47 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id r18so31598223wrg.6
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 07:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9qqPdfnWtRxPMfGqSnImYu0tz8qoXKblad7YIWdbtzk=;
 b=KC6+wjXph9rAQOKayupPKCCetYGnLcGmiy7T3uwkRMJYAzvKk/rFJyYASUjQ3KX8cI
 JsMzT0WSutc//uOSuFugyLrAtl2DJjB9ukqHr6Fd7dPXrmpjaBY+Mg7OmZ0Qts150SSI
 EknQtdTjn4kp1iN52gYwLMUJCt/J1FUoiNYrQ6b2sZ6ba4E6Fjp8dk0QCDcupQbtJ5Mc
 9ETQxa7HnbhrSCdLuyUdmq18sXwqFwpyN8U/fsZIJEnq2WeYLVshdXdjhZ2iXDkFKSs2
 S8Xcizi3/3tKqs1wIgPXKjmD8wcI2P1OopYoo6gDLp8/PkWXKVHXZ1Uo1eXG3KeVPD00
 gz1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9qqPdfnWtRxPMfGqSnImYu0tz8qoXKblad7YIWdbtzk=;
 b=rrawZLHwo/dUanb8FPu7ZVUwMK5J4LQIM7WlfIWI0TMducCZlPWCOVS4yhiDH6iDkx
 n5hi2CKYjMls4Pu9FSFaTMAte3e8jFvhWvc8fb7S7pvjOz9uk/TEWHm6ksWxq7SYZCg0
 StOUjM4VGL5GrqB3iUxu1fLUkt//nwJ8iItNzhLTCcHAAtTAht4JVqr8nbxZEgd6VYuf
 IZ7Dqk1S1Arai+oUH+VxFk3e7Tf91R4ezkmEw4Dr0Pr9Pb4DfojUd9Ha4TjmeNm0Zz5p
 IPXrPf++IDAZpdgjYSeh7Fdc7ds/8QmFv52bCIFVsZZyYj+BO0+PGDtkdHdRUfQ+QAN/
 tzTg==
X-Gm-Message-State: AOAM531rsDkvMVEQ79mwhx+o0jW/iXP4FgZ2PvOHtYGzu5Tq7+z5Ptvr
 5OK9Id919jM8jC7Nhc1+Cy6vfDOvgAk=
X-Google-Smtp-Source: ABdhPJzX68obrWuPVDCCCYcGeZGZHVUl0wRnDu8PyKxw9AFNRyACC6gfg9A+qZdd/nY1e9f5sYz/3Q==
X-Received: by 2002:a05:6000:1446:: with SMTP id
 v6mr22556298wrx.54.1634393685109; 
 Sat, 16 Oct 2021 07:14:45 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id u15sm1722526wmq.12.2021.10.16.07.14.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 07:14:44 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 16 Oct 2021 16:13:25 +0200
Message-Id: <20211016141326.3198988-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/libphidget: bump to version
 2.1.9.20190409
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libphidget/libphidget.hash | 2 +-
 package/libphidget/libphidget.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libphidget/libphidget.hash b/package/libphidget/libphidget.hash
index 120d6373e1..9789f78646 100644
--- a/package/libphidget/libphidget.hash
+++ b/package/libphidget/libphidget.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  f6da13dc0db057c1a87e0a831e3f5507cd26a32f3ced40f2c0ad783fc244bcd5  libphidget_2.1.8.20170607.tar.gz
+sha256  0e789912700228808519cf5c41e19f9b761da635c6bb676b147897936b23851f  libphidget_2.1.9.20190409.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/libphidget/libphidget.mk b/package/libphidget/libphidget.mk
index d84a8b911d..f7d471f99a 100644
--- a/package/libphidget/libphidget.mk
+++ b/package/libphidget/libphidget.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPHIDGET_VERSION = 2.1.8.20170607
+LIBPHIDGET_VERSION = 2.1.9.20190409
 LIBPHIDGET_SOURCE = libphidget_$(LIBPHIDGET_VERSION).tar.gz
 LIBPHIDGET_SITE = https://www.phidgets.com/downloads/phidget21/libraries/linux/libphidget
 LIBPHIDGET_DEPENDENCIES = libusb
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

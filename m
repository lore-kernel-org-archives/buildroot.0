Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1D77C25B76
	for <buildroot@archiver.kernel.org>; Sun,  9 Jun 2024 03:25:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1213960743;
	Sun,  9 Jun 2024 03:25:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2eAaX5NZzVQh; Sun,  9 Jun 2024 03:25:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C8C860724
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C8C860724;
	Sun,  9 Jun 2024 03:25:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 06A411BF86D
 for <buildroot@lists.busybox.net>; Sun,  9 Jun 2024 03:25:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E817C60724
 for <buildroot@lists.busybox.net>; Sun,  9 Jun 2024 03:25:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rCBvsy_-IYCZ for <buildroot@lists.busybox.net>;
 Sun,  9 Jun 2024 03:25:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::72f; helo=mail-qk1-x72f.google.com;
 envelope-from=vfazio@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 12AD36059D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12AD36059D
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 12AD36059D
 for <buildroot@buildroot.org>; Sun,  9 Jun 2024 03:25:17 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id
 af79cd13be357-79543e08eecso138563385a.1
 for <buildroot@buildroot.org>; Sat, 08 Jun 2024 20:25:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717903516; x=1718508316;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t2UhQeFKMF4JHkxMqnWqznofgUim94fATjS8lyjBizY=;
 b=itDbewEgOQiIACIPMeoHm9AflZE0MjLXeTni/FPUMnVuT+HIPpalpzOXwnU9E/Jm94
 ADpNAIKltp8FqlnNmLEhDdfBPW5yRGJEM9eekv4uvnK8Uk5e/jxDRoBSClshFa6rbFoD
 8DZjHIEojzJZl4Ui1IgibMr4aA5WhLBW8oNLUvwYTCP6XVRbE+7qREFuXJwtyDXDyTTl
 wLoNhzABWXZiLtx6JrtWMcDvN4bKmeaWLOm4PHKbNeUCO2Pv33hR1DkI0VM678zDIcRV
 lJEKFfUuEubknXJJibXgrrMHmVEwni2blnp69U/9Z5bnzxpuxkLyXILob1x55PPkLTU6
 LvFA==
X-Gm-Message-State: AOJu0YyTPH8Vt2Ry480OvQz1uIKzpo4f6QL+3wdiE6ARF0qnbhk+yCce
 uTUquY++zVKH3Q7N2zvtpC8uwKRoQ2PBPX9/6MT/hvIAUpnbGJ+NdicyIxtC
X-Google-Smtp-Source: AGHT+IEAalUdJb/9LW8muKm/A4MMLI/xQPTg3e9vd7ZPrtp8DGGfkmGoACPA9n7uc4Vfd1LV9V5mOw==
X-Received: by 2002:a05:620a:1183:b0:790:f482:3a69 with SMTP id
 af79cd13be357-7953c43c40fmr558735885a.20.1717903516438; 
 Sat, 08 Jun 2024 20:25:16 -0700 (PDT)
Received: from localhost.localdomain (syn-131-093-209-211.res.spectrum.com.
 [131.93.209.211]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-795331c9320sm306998885a.120.2024.06.08.20.25.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jun 2024 20:25:16 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  8 Jun 2024 22:25:09 -0500
Message-Id: <20240609032509.8939-1-vfazio@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717903516; x=1718508316; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=t2UhQeFKMF4JHkxMqnWqznofgUim94fATjS8lyjBizY=;
 b=TQzZ0h82nE09SJUS1Kfb1yqUnuEiPzP6karUwQ9QL9lDDL9IXkni4kFoMUAPzoLbX8
 aOulcRwBLpoJHe3vlxyhV+OMfQZcA0IXhIxYs/eJbxJ3LwCv/vHpTVs+K0m5OJMGtqVW
 WGBXvo6BaaIEAReASzJhbB06RayNjk+yUo6db1VZaKBCMV2sMG0rFIS3+xbhrAYPjchl
 Qe0GC8ekKsVWoIrnd1l/Wcc0XY7TR1ibWzVeneS55E769+X0lWRQnLzWkRRpL6HRYMJl
 LzQuIqZjs9GqkUaKc5nYYHd5EWEnHdg7wsn0KWKvLMPfBCEG8w2WqSNy3bh2Num2QigW
 qM2w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=TQzZ0h82
Subject: [Buildroot] [PATCH 1/1] package/python3: fix config directory
 pattern
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Vincent Fazio <vfazio@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

If a platform triplet is not detected during the configure stage, the
config directory (LIBPL) defaults to `config-$LDVERSION`.

In this scenario, the `PYTHON3_REMOVE_USELESS_FILES` hook would fail due
to `find` incorrectly expecting a second dash and then the triplet.

Now, we glob anything after the version which will match in both cases.

Fixes: 54d48c8cad ("package/python3: miscellaneous fixups")

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 package/python3/python3.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index a0b9ed4437..a82bc47a57 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -204,7 +204,7 @@ PYTHON3_CONF_OPTS += \
 define PYTHON3_REMOVE_USELESS_FILES
 	rm -f $(TARGET_DIR)/usr/bin/python$(PYTHON3_VERSION_MAJOR)-config
 	rm -f $(TARGET_DIR)/usr/bin/python3-config
-	find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/config-$(PYTHON3_VERSION_MAJOR)-*/ \
+	find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/config-$(PYTHON3_VERSION_MAJOR)*/ \
 		-type f -not -name Makefile -exec rm -rf {} \;
 	find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/ -type d \
 		-name __pycache__ -exec rm -rf {} \;
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

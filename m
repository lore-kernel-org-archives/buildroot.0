Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49789ECAAD4
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 12:54:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E426683EEC;
	Fri, 26 Aug 2022 12:54:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E426683EEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zgIlTO4kbt7u; Fri, 26 Aug 2022 12:54:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17C1D81297;
	Fri, 26 Aug 2022 12:54:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17C1D81297
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 380AF1BF27E
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 12:53:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 142EC83EEC
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 12:53:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 142EC83EEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZM2XVvy2zk3A for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 12:53:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49BFE83EE9
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 49BFE83EE9
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 12:53:07 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id lx1so2949654ejb.12
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 05:53:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=T2NFDypWFV2wy1Gt3lyqjuwtTLWuJfHxjqhk7VdUZAM=;
 b=wXzB/CnwROR6ExcAZHuH+h7EDCWbZEbCt0H7UQYoS8DUQ4uZ2z9cifc7u/riYn2zK9
 rRkJzGGeZtf8lQtNLWFwfsQ11rlNSvTsO9YK487ZwlqlorgZmzcgKYkXLY5PeDtqMCCS
 MMFdoPcv7aUbjaxf9XrcrrT/1gfFmsXceYfw5zp2yNFT8lYNQ2xfQ4GFbkTP6+kEulSV
 I2DgaSu0HWsCY8g3quGaIi5ek5xf7BvE5DxrQFoZiBhv4WI1sGgQHgdxK2kBLWSaciLg
 AyWFYLKM0RXhcZgI9ivX7Zm6HLu0I8V8NhRXUidwB/jJQv1BzxiAss6ZIo3aFC4XjV8e
 H5Nw==
X-Gm-Message-State: ACgBeo0ImC4b59zBAN5QWQsEyTXW6KVRe9Bn9uK5MIyEImdPfjM8WSUf
 hlo8uZongLo06tUhLUfqiuR7M3w0P73FFrkl
X-Google-Smtp-Source: AA6agR7j8lqGUJxSVgXYU5PiuH1ePktYFQdg8DPXYZyS7z7kQ6J3pDHRf+t7eNkoBZHixYIK6ok27g==
X-Received: by 2002:a17:907:80d:b0:73d:a576:dfbd with SMTP id
 wv13-20020a170907080d00b0073da576dfbdmr5395020ejb.402.1661518386397; 
 Fri, 26 Aug 2022 05:53:06 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a1709064d8200b0073923a68974sm829573eju.206.2022.08.26.05.53.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 05:53:05 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 14:52:33 +0200
Message-Id: <20220826125252.16782-11-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826125252.16782-1-jesseevg@gmail.com>
References: <20220826125252.16782-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=T2NFDypWFV2wy1Gt3lyqjuwtTLWuJfHxjqhk7VdUZAM=;
 b=BL90Hgxk5PKkWWxSY6cX95dscBZb7rI1YlkR3PUoT1e9VuVR9g10A2khmE8Iz+ODAF
 9kZFpyrSBNY4FNoiaKOH5rQYP9eWlxT40Jfdn8uyrleIKz7af9vSqiVYBMh/RO4GISqs
 hecROEJfMQkWuYxGwaY7qMccVB9XO2apbiqbicKTtSX7m7zu0v/uc748hs3f4Kl/RdHY
 P6kAG0J77fM7CCsCFGU1uHqCVBkg9ls8MOTidBdoQo0IrTaggcu9DysGyPCQYOotm6Lh
 QrN2+CFNMztpUMBmZ0GSfn2mUPzyUPfQcEB32dXioJA/zTARcfFXvQfGdTCrmMkYY4ib
 9QoA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=BL90Hgxk
Subject: [Buildroot] [PATCH v3 10/29] package/qt6/qt6base: add qt support
 for zstd when using the package
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
---
 package/qt6/qt6base/qt6base.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 31912f9462..21c15607d6 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -119,6 +119,13 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_journald=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_ZSTD),y)
+QT6BASE_CONF_OPTS += -DFEATURE_zstd=ON
+QT6BASE_DEPENDENCIES += zstd
+else
+QT6BASE_CONF_OPTS += -DFEATURE_zstd=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_QT6BASE_SYSLOG),y)
 QT6BASE_CONF_OPTS += -DFEATURE_syslog=ON
 else
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

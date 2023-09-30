Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49566E732D6
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 19:06:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED32741BBC;
	Sat, 30 Sep 2023 19:06:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED32741BBC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DWBB_vz6HsNc; Sat, 30 Sep 2023 19:06:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C2B641DE6;
	Sat, 30 Sep 2023 19:06:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C2B641DE6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EA30A1BF37C
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 19:06:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE79E41DE6
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 19:06:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE79E41DE6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a2BKoaCDReeK for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 19:06:14 +0000 (UTC)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AA62841BBC
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 19:06:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA62841BBC
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1c3cbfa40d6so137235575ad.1
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 12:06:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696100774; x=1696705574;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+9s2vswn7J4vnO2Yn3bnlKuu6ss3TLqJenCNYvRMERQ=;
 b=G+uZTSCupeQcIeLU2Al6FeUQyJwdgCUJh/zqZL/alpqXotFb1DyxyrTP/yoG77B9OK
 9RHbruwvjp+Z0r44lCsJNfka3MFekToFYK/y7wosZkyrFPh7lVooFv1R+DH0f2DW2b2M
 oczb3Z33FI2YX+oenlui+/J46v43RURHEkFXAAr1zHMoLPinvx8LjKldPVQwCU9pGTsT
 YXw9kz78/vcbZ4EKWHjWtFgdCxxngySoaA9wncS77/Mrb61LJfAfkVJ4T8d+zKs++h5y
 NU6djsI3oAL8AhN3Xwl5Cyr8aa2CLoehxQ9ISgj24ob5nDslLQ9vDqCJK+Knx7wYr0JN
 tu3Q==
X-Gm-Message-State: AOJu0YzmE+3VHf3jjm4wyxFlj9a+kkrw83h/2reEdHR0kas4u9kdTro3
 QxmPSdspXyXG1wyPnGEkzRtd86IJOmHHpQ==
X-Google-Smtp-Source: AGHT+IGJ/UtIpsihQAOMG4HU7PpWC+50g1K67benr27T24MaVRRFPXGU8YD30IbDvjrj6WRxAfC25A==
X-Received: by 2002:a17:903:1247:b0:1bf:8779:e045 with SMTP id
 u7-20020a170903124700b001bf8779e045mr8804501plh.50.1696100773974; 
 Sat, 30 Sep 2023 12:06:13 -0700 (PDT)
Received: from localhost ([2400:4051:e000:9e00:ff94:191c:6a3d:8b35])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a170902c18500b001b8a00d4f7asm5534071pld.9.2023.09.30.12.06.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Sep 2023 12:06:13 -0700 (PDT)
From: Takumi Takahashi <takumiiinn@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Oct 2023 04:06:10 +0900
Message-ID: <20230930190610.752987-1-takumiiinn@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696100774; x=1696705574; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+9s2vswn7J4vnO2Yn3bnlKuu6ss3TLqJenCNYvRMERQ=;
 b=Th9AAXIC8NrwuHAsj+zBS54IzJrlgXwSWDWdv/W/7rCjqeWSinsUPDF2K311xgxiYZ
 ZGxidj+EmPlUSFflRoXjf0mI9vQKY1oWremaNJTvImNMk2I1SvmwdtBhTQg6R0l2EEEv
 UcuPQ44KVAipXdoqbIzOEafq3jZ/uXwuwnK/uXyJ/LZb0YbQtttr1HT7TBRgF27KEOg1
 EdhIyZhQoqHcrVm8q/22MjWaBqk++4pNYBMEKDBNPDtmvMKN8JTAtxZuOF59HVAyBhkQ
 AHMh8avRNmGfEskYGfLtZHdejX4Ih1c0QIUWQLo5mK2dtNHBL1Q2xr0KwX+x8y9gY2PE
 Fs+g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Th9AAXIC
Subject: [Buildroot] [PATCH] package/python-pygments: support host package
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mauro Condarelli <mc5686@mclink.it>, Takumi Takahashi <takumiiinn@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

---
 package/python-pygments/python-pygments.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-pygments/python-pygments.mk b/package/python-pygments/python-pygments.mk
index f151f0061b..e6d5ba25f5 100644
--- a/package/python-pygments/python-pygments.mk
+++ b/package/python-pygments/python-pygments.mk
@@ -14,3 +14,4 @@ PYTHON_PYGMENTS_CPE_ID_PRODUCT = pygments
 PYTHON_PYGMENTS_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

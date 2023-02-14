Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F41BCC05027
	for <buildroot@archiver.kernel.org>; Tue, 14 Feb 2023 09:04:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38672610A5;
	Tue, 14 Feb 2023 09:04:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38672610A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kLj18ax96q6x; Tue, 14 Feb 2023 09:04:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C26A6107C;
	Tue, 14 Feb 2023 09:04:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C26A6107C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 656401BF2EA
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 09:04:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 37C716107C
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 09:04:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37C716107C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BWRpDoc6Zw_z for <buildroot@lists.busybox.net>;
 Tue, 14 Feb 2023 09:04:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2848C60FDD
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2848C60FDD
 for <buildroot@buildroot.org>; Tue, 14 Feb 2023 09:04:35 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id u21so16358388edv.3
 for <buildroot@buildroot.org>; Tue, 14 Feb 2023 01:04:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dtdI5tXUp4k711GLNAj8HpDHuNhEXGrYu/9jM/7UHiY=;
 b=wsqMMRqUjuzBjZ3zJADlkma4KjqIVJYqXuRqhEo2HA96fDcZNfNcvv5Gr3cR6cWPOt
 +MtvvJOY2u5GRfSYw0My48eiaEVB/Y4kfjUCxZ2yOn7VC3G5P9jzLZV933Wdddtq4VxR
 nglfi22QzDhsDVVv00FUf6cr00BXJCFjbBcPKO7mTYs5OMKAwFXCe/CAxSKelSP0vFnm
 +H+sikDFBV1+bBg9Nkyeli97FsvaFXf58Eo9gXZXIwkJKNdeIZ4TCKhtAn4j2Y82iYx3
 9aoFhoxfU8NAoc8eijmI3TOe7u4HCilFQCnsn0S3Uhnhb4gUSRA49t8cy6uHOPTPfdHX
 F1CA==
X-Gm-Message-State: AO0yUKVsSm+2vwSRdUUrtxRKwbfaDU0uGcOBcmlkFeyOOGJrbjbnGWjG
 M3IsPBkspmU04VMTmlP8cfqvIV7+hdbnlg==
X-Google-Smtp-Source: AK7set/b0WW+rpvoi7fNdhSSimQSnbAIL+B/o1PhG4GCIJ0+pd/3V+1KAMrlz4O/fxOd3zdCpaXJcw==
X-Received: by 2002:a50:bb66:0:b0:4ab:f03:8cbc with SMTP id
 y93-20020a50bb66000000b004ab0f038cbcmr2057793ede.13.1676365472562; 
 Tue, 14 Feb 2023 01:04:32 -0800 (PST)
Received: from t450s.fritz.box (ip4d15a215.dynamic.kabel-deutschland.de.
 [77.21.162.21]) by smtp.gmail.com with ESMTPSA id
 q24-20020a50cc98000000b004acc7202074sm2648200edi.16.2023.02.14.01.04.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 01:04:31 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 14 Feb 2023 10:04:25 +0100
Message-Id: <20230214090424.9335-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dtdI5tXUp4k711GLNAj8HpDHuNhEXGrYu/9jM/7UHiY=;
 b=KS65+61Wjq7aGe/INSUyVLDog+p5Z3ri/ZoMIuEVJrFigDw8nJ1vdqdopdunpcrWDz
 i9fPwl6aIPHPkr1nMVAbgxhQhxxP/2muupIKzMskrG+Z6KSdVMCedJ5LCl1ehY/WZ85z
 Xc51JejavPBPlvWkGkak1zUSUKJZQY/4tWZDUAoJqvqeFzgJ7dBE/2T49KTWIJ99Bp0T
 AYS127bU5++9f8dW5njZxaS0icuxKBuGZS1c1MnkcJSeEiPq+sHp/lpsfHhF9a5i3t0I
 Ltu+Q7F+GNeQFe2dYn5L+FqER3BMOUKlxFFzM0pRpBJ2tR93iMvzSkuDUfoMYXCvrQvl
 hXdg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=KS65+61W
Subject: [Buildroot] [PATCH] package/dnsmasq: bump version to 2.89
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/dnsmasq/dnsmasq.hash | 4 ++--
 package/dnsmasq/dnsmasq.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dnsmasq/dnsmasq.hash b/package/dnsmasq/dnsmasq.hash
index fd015d38ac..02ffb2656b 100644
--- a/package/dnsmasq/dnsmasq.hash
+++ b/package/dnsmasq/dnsmasq.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://www.thekelleys.org.uk/dnsmasq/dnsmasq-2.88.tar.xz.asc
-sha256  23544deda10340c053bea6f15a93fed6ea7f5aaa85316bfc671ffa6d22fbc1b3  dnsmasq-2.88.tar.xz
+# https://www.thekelleys.org.uk/dnsmasq/dnsmasq-2.89.tar.xz.asc
+sha256  02bd230346cf0b9d5909f5e151df168b2707103785eb616b56685855adebb609  dnsmasq-2.89.tar.xz
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING-v3
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index 3945e4256a..58c5390433 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DNSMASQ_VERSION = 2.88
+DNSMASQ_VERSION = 2.89
 DNSMASQ_SOURCE = dnsmasq-$(DNSMASQ_VERSION).tar.xz
 DNSMASQ_SITE = http://thekelleys.org.uk/dnsmasq
 DNSMASQ_MAKE_ENV = $(TARGET_MAKE_ENV) CC="$(TARGET_CC)"
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

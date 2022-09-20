Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 823C5C6FA82
	for <buildroot@archiver.kernel.org>; Tue, 20 Sep 2022 19:03:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F59A40C81;
	Tue, 20 Sep 2022 19:03:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F59A40C81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jfmf9pPRp0XA; Tue, 20 Sep 2022 19:03:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 05BFA40C72;
	Tue, 20 Sep 2022 19:03:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05BFA40C72
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CF4F01BF2C6
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 19:03:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA640812D1
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 19:03:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA640812D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aSTBlOQ0SL2W for <buildroot@lists.busybox.net>;
 Tue, 20 Sep 2022 19:03:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9051B812C8
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9051B812C8
 for <buildroot@busybox.net>; Tue, 20 Sep 2022 19:03:36 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id 13so8498064ejn.3
 for <buildroot@busybox.net>; Tue, 20 Sep 2022 12:03:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=KJpnEUPqBIUb6qu3m0DTUMyLflFUsI/5lWDUmnA6o6Y=;
 b=ZVT7UYUg6i4/avkcOIP1dTGl/gFUK95c789HpT5Mi75FJZM2l/r+EXCI51pLFLWyd1
 0TEG8vzhq5zkVbujI5woCh11oqEDk3Vn0+6e7SP6NxVhHzLxTJj25qP8SVUPsvBTQYhb
 Yj0vOUK1k2Eg+AVUtwzjb9X2/x1/9mA5VAbUCW+vWtNHG869MubsapY3gaXflPrcub7p
 +Hr+7HLAjFehV0xNltLvZ2Bl8KqkNj0I1IKwzZByrE3xEq5+06E1SLFIOPMq3eGIpQSJ
 h+nLCUDIKJwF74dsFWHYqjoUXnmlK9MRuxeVkxLB0gqsmdaoHmUtgn07S+z+4U/zcHC0
 V1GQ==
X-Gm-Message-State: ACrzQf3nHMIPrU5gcE8E7XtZ7p5sxwUR3Y59CKldxGj2HDZyEg/KhQ5U
 x4PfM9FhQu16V7h7cjbCIqCNd7kNWuo=
X-Google-Smtp-Source: AMsMyM5YVlQeeJtCkgzt+xSzHNFwWB0hM40186iCAImfyH0XT7trLCpIHxA9VvV/XcpCaJQUQxgJrQ==
X-Received: by 2002:a17:907:3f0b:b0:781:e783:2773 with SMTP id
 hq11-20020a1709073f0b00b00781e7832773mr1811750ejc.610.1663700614785; 
 Tue, 20 Sep 2022 12:03:34 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 18-20020a170906309200b0073dc5bb7c32sm294128ejv.64.2022.09.20.12.03.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 12:03:34 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue, 20 Sep 2022 21:03:31 +0200
Message-Id: <20220920190331.3688710-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=KJpnEUPqBIUb6qu3m0DTUMyLflFUsI/5lWDUmnA6o6Y=;
 b=oQd+063rfbOu7Lwww9HI4YKYvAKpNC6TsUtkxToPRjftw1Z3NDRlu0fS7+3ra8y/Xq
 zNi5n0o6SlFj66lNj9gwaVcoI35ZhYNVgTdFz/+0v76JToEF4nYhNP5monSndk97oW2z
 +K9bB/AtjnheLVCRZzFZdPdTC9L2xFsxInCl2tuNMC1T7vwrKxnP8Ete1w2/V+7dN8Rf
 dA0uCxxrqzGn4AvDX8560AuoIFkUHpp14Asglb0RLjC9J1n5O5Rhtj3ADh350VTvhet9
 SMxGGQjYNynPM03EvJz/6wQZcx5E7Kp8FJnycnyQGo5ZFMZ1P8jCfAat7WpHmn6nBtOM
 qN/g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=oQd+063r
Subject: [Buildroot] [PATCH] package/lighttpd: bump to version 1.4.67
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lighttpd/lighttpd.hash | 4 ++--
 package/lighttpd/lighttpd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lighttpd/lighttpd.hash b/package/lighttpd/lighttpd.hash
index b45fecc60..8353857ad 100644
--- a/package/lighttpd/lighttpd.hash
+++ b/package/lighttpd/lighttpd.hash
@@ -1,4 +1,4 @@
-# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.66.sha512sum
-sha512  6d4ae1faa0ebc3115b7ad4fc84ccdd476ca71ee701d115c1a320f525c6c3ce884b48af38f65e4f1c012b4d0936755925b16f8d37aad810a286b2349c27f47567  lighttpd-1.4.66.tar.xz
+# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.67.sha512sum
+sha512  acfde71675d1c54b4e805998d1dabaa291437181bdbca0d6a3a069584c4576d7585d2401f57f8691f23aaf6283a95ac61156789a055a2a7236fd305c1f248627  lighttpd-1.4.67.tar.xz
 # Locally calculated
 sha256  5c98cad2fbaf5c5e2562bcbab401a7c557c1bb1bac9914ecc63730925052fb13  COPYING
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 0905b0ae1..d3440040f 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIGHTTPD_VERSION_MAJOR = 1.4
-LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).66
+LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).67
 LIGHTTPD_SOURCE = lighttpd-$(LIGHTTPD_VERSION).tar.xz
 LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-$(LIGHTTPD_VERSION_MAJOR).x
 LIGHTTPD_LICENSE = BSD-3-Clause
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

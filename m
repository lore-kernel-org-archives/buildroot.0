Return-Path: <SRS0=JV6j=MP=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,PDS_BTC_ID,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E33E6C4338F
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 20:33:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A061E60BD3
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 20:33:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A061E60BD3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 755ED40609;
	Fri, 23 Jul 2021 20:33:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dRC7VxwKfqlK; Fri, 23 Jul 2021 20:33:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD5F2405FD;
	Fri, 23 Jul 2021 20:33:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6E78B1BF3FF
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 20:32:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C83583B5E
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 20:32:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CA7Al0lJ6UBQ for <buildroot@lists.busybox.net>;
 Fri, 23 Jul 2021 20:32:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6A51683B5D
 for <buildroot@busybox.net>; Fri, 23 Jul 2021 20:32:57 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id q3so3678718wrx.0
 for <buildroot@busybox.net>; Fri, 23 Jul 2021 13:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I+FIxDuHvmopx9Ra9CGmWTA87tSLhO6s2tEF7cdelfI=;
 b=vRoP0L6Ql+r5z9Q/otDgl2TFtf0ED10bIXcY0Ztcj+BSQqrhR4Iut1h+gEwkp4ky/s
 pY9ti4TY5pR1ZTi+PcI2tCYCfBlML+M3LZsugviBmEr7B42j7kL29FTy+Oqb+aCe0lgK
 jn7EV+xvIVUoTkX+9el7M3WE8zU+9uJhE3+8GkIbvwneYQRsaYUjAR68dE9eziYvTw8p
 sole7uG8H19wXYu3wSGNyq9E8GNyui/dHbGEvrZQcC3i6wE7n737vOk6t35Km84AcWrA
 Pk2vv0Oz0hPLz8gr8yy/58VIzOZlQ0rN5wK5oGPiRLjgVu8gg4E4Tw4irj8C+BmIrysS
 Omwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I+FIxDuHvmopx9Ra9CGmWTA87tSLhO6s2tEF7cdelfI=;
 b=aoKXN74O4jMmAX4ukvSf8CferMK80dTuRLTp7u3YXZIoQg0yU+4qpm5CJBvU8/m3bM
 0GYqQXlLhs0Gww59z+ako3wESn7xSK1uRSFxvV2mEhaYyL6alYx3Xp4szCJpwdvxOGhs
 j5MS9/+ACDW/j/z7l1Cu/UR0le7nZgT9T05pEFrkVscqHNcuHOUHXBJZ7eKX1iRTQBC4
 R4n3PokbLSB/1tTJP/IwuZQEFoPYHKsPX3aHzgcTaTxTWOlIk7a5gxLS9L63+c5+XrTZ
 XUT/YstKGy9VcAYxBGypk3T3RO+WeyOia1VYJTNxeUWUG7nK2HDe1LQx4SK3LQk9IcXY
 jE7w==
X-Gm-Message-State: AOAM532vGh+zxVSt9ljLvPYIIqUyMTC6hLkWzVN4RWExDeElSXzQolEU
 iz8a6CDIElvwxY+Kb2S4+WsxDcKAFfM=
X-Google-Smtp-Source: ABdhPJxzWXPjv9Ra358aGiYksTg1cfJQWapK2oVildLwSKZW9e2uCBlvmKkSAhXIm8ptHODW7BLmpQ==
X-Received: by 2002:a5d:4812:: with SMTP id l18mr7187473wrq.68.1627072375803; 
 Fri, 23 Jul 2021 13:32:55 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id n17sm2128422wmo.18.2021.07.23.13.32.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 13:32:55 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 23 Jul 2021 22:32:35 +0200
Message-Id: <20210723203242.2531909-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210723203242.2531909-1-francois.perrad@gadz.org>
References: <20210723203242.2531909-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/9] package/perl-data-optlist: bump to version
 0.112
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

LICENSE was reformated.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-data-optlist/perl-data-optlist.hash | 6 +++---
 package/perl-data-optlist/perl-data-optlist.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-data-optlist/perl-data-optlist.hash b/package/perl-data-optlist/perl-data-optlist.hash
index 93df00648..1c805acef 100644
--- a/package/perl-data-optlist/perl-data-optlist.hash
+++ b/package/perl-data-optlist/perl-data-optlist.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    f9236c9ea5607134ad8a2b3dc901c4c5 Data-OptList-0.110.tar.gz
-sha256 366117cb2966473f2559f2f4575ff6ae69e84c69a0f30a0773e1b51a457ef5c3 Data-OptList-0.110.tar.gz
+md5  3b2cdb7846391f9acaf4e948a9a6b21b  Data-OptList-0.112.tar.gz
+sha256  62c60ccaae88d5339ae36bcc8940b03388cf84adbf27828b1f8b300307103bab  Data-OptList-0.112.tar.gz
 
 # computed by scancpan
-sha256 73c7bd4c8e4adc474f9dae32b9aa08f6ce27327940751dd6e8373404beabdffa LICENSE
+sha256  712f3e40537810ba3046533fd71d877f69ab446d5e8e8a1135771804494b8b42  LICENSE
diff --git a/package/perl-data-optlist/perl-data-optlist.mk b/package/perl-data-optlist/perl-data-optlist.mk
index 49aeb820e..8e089245f 100644
--- a/package/perl-data-optlist/perl-data-optlist.mk
+++ b/package/perl-data-optlist/perl-data-optlist.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_DATA_OPTLIST_VERSION = 0.110
+PERL_DATA_OPTLIST_VERSION = 0.112
 PERL_DATA_OPTLIST_SOURCE = Data-OptList-$(PERL_DATA_OPTLIST_VERSION).tar.gz
 PERL_DATA_OPTLIST_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RJ/RJBS
 PERL_DATA_OPTLIST_LICENSE = Artistic or GPL-1.0+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

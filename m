Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F00E0C25B50
	for <buildroot@archiver.kernel.org>; Sat, 21 Jan 2023 16:36:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5695041B46;
	Sat, 21 Jan 2023 16:36:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5695041B46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V4XpSIe31Rue; Sat, 21 Jan 2023 16:36:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 480B541A6D;
	Sat, 21 Jan 2023 16:36:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 480B541A6D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 675EE1BF41C
 for <buildroot@lists.busybox.net>; Sat, 21 Jan 2023 16:36:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 430F681836
 for <buildroot@lists.busybox.net>; Sat, 21 Jan 2023 16:36:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 430F681836
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O1aXn57asWIO for <buildroot@lists.busybox.net>;
 Sat, 21 Jan 2023 16:36:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4489C81D9F
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4489C81D9F
 for <buildroot@busybox.net>; Sat, 21 Jan 2023 16:36:00 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id k16so6162123wms.2
 for <buildroot@busybox.net>; Sat, 21 Jan 2023 08:36:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aosH9XYO4bfUM3FwEwUN+yU8OAn3V4XWzWJLxic38vw=;
 b=6JMWwGZCEHoLkKOCK/e4rxrhD/yIWt45fTUz6kFMZGKDTKNIjHxkwLmQaBJaVjaxOV
 1doXrMg645iAlYbp7/3OzdBGkh0eUyErlKvMNJstO3pEIs3kbEQc1n3ZfMx38y3yRqN5
 RQfqqH7rQYzkSwN5I9ZFpu5di2bFPAn9U27i06xHsBkUj82ugf/2YPt9wnsV0W9E5f1O
 9e+3ciKoT0dlXAZA5SpQ9q7GKFMEVtaDSoTK2Iw306+xIl6gmiNuFGo1I704d5DuILFx
 jO4BivgGDV9icGngZFKf2o7EZSN020VULQcJQyWx3ub6K0gwuJa9zg+khJPNSnOEDJFM
 BRew==
X-Gm-Message-State: AFqh2krljbGVdM/p9guVKVIXD98ULeIWOrfd4uG8mP0M7yINo6mu0wLt
 e288r7Vcrm+UIYNweKeGtXirtjDNDt8=
X-Google-Smtp-Source: AMrXdXt0IN0Fi4TcaBcDn0h3bYGmCzEpJsjC36vh4Moqb4Hh73ldvc5pJcONSh+gLW1lidbUf5IIyQ==
X-Received: by 2002:a05:600c:1c1f:b0:3db:2d7e:1204 with SMTP id
 j31-20020a05600c1c1f00b003db2d7e1204mr7894438wms.27.1674318958552; 
 Sat, 21 Jan 2023 08:35:58 -0800 (PST)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 bi16-20020a05600c3d9000b003daf89e01d3sm5648794wmb.11.2023.01.21.08.35.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Jan 2023 08:35:58 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 21 Jan 2023 17:35:33 +0100
Message-Id: <20230121163537.147981-3-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230121163537.147981-1-francois.perrad@gadz.org>
References: <20230121163537.147981-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aosH9XYO4bfUM3FwEwUN+yU8OAn3V4XWzWJLxic38vw=;
 b=K+NfgbSuyb+qvAVLjIK+awve7a5WJ7DNa/NTEx5kiusYTUZoIzQU7+QHpDkealbWVR
 aiVKwl/PV+WonD1HlN1cKxKvMNg5/fI82ySCnLHWcg2QbkwJEFgMbIUU8hoIn6Ugq4nO
 XV9W9Lriwj/RkO1Bk+pYTrJWHVusOPD+xqj/rN9yXYLih6uLsKtqCNiaDqL6+O3vJ7MJ
 ZK2JVLHinyH/G8M56FV2LaTrNE77ZpCePV1SjC5Mg8gEcPQBrdMsTdjIzr4Bak6Kk0xI
 SfsMraUr7AMS07jmW7GfKHnzWVgA0ZYah3e1cp/m5u4FdaZb8OxlqWVD1Lnin1d7Ardc
 9H6g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=K+NfgbSu
Subject: [Buildroot] [PATCH 3/7] package/perl-io-socket-ssl: bump to version
 2.080
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
 package/perl-io-socket-ssl/perl-io-socket-ssl.hash | 4 ++--
 package/perl-io-socket-ssl/perl-io-socket-ssl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-io-socket-ssl/perl-io-socket-ssl.hash b/package/perl-io-socket-ssl/perl-io-socket-ssl.hash
index 8c6bb3052..a4abcc33c 100644
--- a/package/perl-io-socket-ssl/perl-io-socket-ssl.hash
+++ b/package/perl-io-socket-ssl/perl-io-socket-ssl.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  8f0f6bff4db5e4be6e848aa49fd29380  IO-Socket-SSL-2.075.tar.gz
-sha256  c30ee2220b1e181a968ebbc81861d0cadf334b001377a44105ae5a8637ddae8c  IO-Socket-SSL-2.075.tar.gz
+md5  eaea5b17592ccbd925aff47747f41dde  IO-Socket-SSL-2.080.tar.gz
+sha256  cd0ed303b08a72c5c256a9ec3bbb6ff61360be3a2ff6d775e4f6e25375fa8d1f  IO-Socket-SSL-2.080.tar.gz
 
 # computed by scancpan
 sha256  090aff5421fd55a9dceeaf6c612c36360402e8d29c1284aef88c87be565ce032  README
diff --git a/package/perl-io-socket-ssl/perl-io-socket-ssl.mk b/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
index daa46acf9..d5c09d908 100644
--- a/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
+++ b/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_IO_SOCKET_SSL_VERSION = 2.075
+PERL_IO_SOCKET_SSL_VERSION = 2.080
 PERL_IO_SOCKET_SSL_SOURCE = IO-Socket-SSL-$(PERL_IO_SOCKET_SSL_VERSION).tar.gz
 PERL_IO_SOCKET_SSL_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SU/SULLR
 PERL_IO_SOCKET_SSL_LICENSE = Artistic or GPL-1.0+
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

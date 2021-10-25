Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2E6DC433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 19:01:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0A986103C
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 19:01:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A0A986103C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7369040462;
	Mon, 25 Oct 2021 19:01:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tkx-GNplA6G4; Mon, 25 Oct 2021 19:01:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C54144041F;
	Mon, 25 Oct 2021 19:01:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 129201BF3F7
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 19:01:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8963580F24
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 19:01:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fn0z8YgC4roX for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 19:01:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3E3F680F25
 for <buildroot@busybox.net>; Mon, 25 Oct 2021 19:01:44 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id a26so3460899edy.11
 for <buildroot@busybox.net>; Mon, 25 Oct 2021 12:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TS5zZtn/FeSS/nxnw5Lus6sLUAqkEd2GEQB2um2wF10=;
 b=YgtJVJO0MpfazX6uT/k0qhwWF3Zk1Ioq+kvCDVIpjH4654akp6PUt254JVPNlkdHQi
 ozv6ERmMimK92zEyEas3x16qjpVKdCys4OZv/UYik3xGrAGXoqarEBgQxYOAgtFnnnwO
 AMWHe725WlUlPEV8gwZb0f4IOUKgI0BgS3yVKD+hDsqFI7gfNgVDhPgClm+IdIZrGood
 bEbWaw6L69ecbWaI/TLrqzU+88GEZsAHH1NsNeIhPC0YA+Ghevn/O9TdnstxMA+dcYJ0
 wBCRhEWXyrrDYCZKmC9Dj9tPqGV7gmG/F2Dvu4c6cbK/Wf+nyMGJE8AQeDnYDmDb88hM
 Jz8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TS5zZtn/FeSS/nxnw5Lus6sLUAqkEd2GEQB2um2wF10=;
 b=bkjTWDfYT2XoWIu6wIjy63wJhjspWm/++iX0TV1K5noATX4FsKxRDAziM73ztiRCZR
 Rac7OlcldBAuJ4eaNsF7liDHtRAJsikJVjGeRUAXkL7V7QSCAmKq1T7GgGraZVESlk6g
 u5CBfzyp8jWlOu/XUEQCgFdLICTHym0XkzuRGxCoFts+duS95vJWUtti7YNBtRxqkm1h
 KnBWKzdqUMBb3r3RQchWpoQYYjcnJUZQf6ZK6CpZ9rduuZzLbUmczmljcU0PtdLN0R7T
 vYWb4Q6D2tGRSmBFEwSSjJjuORQHmN/Myxng6Hc92aUjuX/ABdyHifsASLf5n7PHaWnk
 +Lvg==
X-Gm-Message-State: AOAM530B34/63VZR/6I/9JBZje6mACmba8Xx3b8e9xtf755JiQggKaZE
 MII4nCghaGAfmXyJ/Jkb2HIDWwkNQho=
X-Google-Smtp-Source: ABdhPJxDACGDdkn6Pv8YjTyzH2ss0fcc4bfmjYGyVkxIT1fiXaKyxqU8MkjNp3o10mLvWwRJ7oDJpg==
X-Received: by 2002:a17:906:248f:: with SMTP id
 e15mr23478055ejb.541.1635188501475; 
 Mon, 25 Oct 2021 12:01:41 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id g9sm7890584ejo.60.2021.10.25.12.01.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 12:01:41 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 25 Oct 2021 21:01:30 +0200
Message-Id: <20211025190134.1273703-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/5] package/perl-convert-asn1: bump to version
 0.33
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

diff LICENSE: remove trailing spaces

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-convert-asn1/perl-convert-asn1.hash | 6 +++---
 package/perl-convert-asn1/perl-convert-asn1.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-convert-asn1/perl-convert-asn1.hash b/package/perl-convert-asn1/perl-convert-asn1.hash
index eb7973c31..644517af5 100644
--- a/package/perl-convert-asn1/perl-convert-asn1.hash
+++ b/package/perl-convert-asn1/perl-convert-asn1.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  1e12b263a5042804bb1c59ddce899876  Convert-ASN1-0.31.tar.gz
-sha256  6fe4c1ba744c3a8212bf2c9b2703d93530acc153435cf2f93633540b439fbbeb  Convert-ASN1-0.31.tar.gz
+md5  80425835020da77c48c05a40e25bbf7e  Convert-ASN1-0.33.tar.gz
+sha256  1fdf004520c79e3a244cf9688616293516c11793d746c761f367496eb3d06076  Convert-ASN1-0.33.tar.gz
 
 # computed by scancpan
-sha256  db9e46a932b02253c8bddc05a44a0c1c6979627190afb2251dd76462dd370d79  LICENSE
+sha256  70884b19a3537bf179538c3b7d7896a56ade509dafe6b8d545c5999a9c05f8a9  LICENSE
diff --git a/package/perl-convert-asn1/perl-convert-asn1.mk b/package/perl-convert-asn1/perl-convert-asn1.mk
index c39fe3412..affe775ac 100644
--- a/package/perl-convert-asn1/perl-convert-asn1.mk
+++ b/package/perl-convert-asn1/perl-convert-asn1.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_CONVERT_ASN1_VERSION = 0.31
+PERL_CONVERT_ASN1_VERSION = 0.33
 PERL_CONVERT_ASN1_SOURCE = Convert-ASN1-$(PERL_CONVERT_ASN1_VERSION).tar.gz
 PERL_CONVERT_ASN1_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TI/TIMLEGGE
 PERL_CONVERT_ASN1_LICENSE = Artistic or GPL-1.0+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

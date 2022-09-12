Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA8C6ECAAA1
	for <buildroot@archiver.kernel.org>; Mon, 12 Sep 2022 03:36:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64CA38475B;
	Mon, 12 Sep 2022 03:36:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64CA38475B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KBAAJzVpez7f; Mon, 12 Sep 2022 03:36:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57CA68429F;
	Mon, 12 Sep 2022 03:36:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57CA68429F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 867161BF9AD
 for <buildroot@lists.busybox.net>; Mon, 12 Sep 2022 03:34:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D150C84012
 for <buildroot@lists.busybox.net>; Mon, 12 Sep 2022 03:34:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D150C84012
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oJCyRO3XrgUq for <buildroot@lists.busybox.net>;
 Mon, 12 Sep 2022 03:34:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4271A841C2
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4271A841C2
 for <buildroot@busybox.net>; Mon, 12 Sep 2022 03:34:40 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id b5so13270993wrr.5
 for <buildroot@busybox.net>; Sun, 11 Sep 2022 20:34:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=DHxU7vjNEAg8GbxG8A2uWaETy3AkoTUCNhQw04ZdOFE=;
 b=iJJHOf4IonCJhW5TqVkfTcNVqrZDd4ICbSXbX4PoqlMxjfYedotIjbekFkGfD4G2M+
 2jUv0klLycuCuc1e4MVE0ma0YuVr+U+huFbj0xhtyngeUeItovjpt9LdtMM3qzg/O3pj
 J2HoT3Iy1eh9F6mX6t8cIqtFanzC/12US4QXkdSJHFYmKoxRMYvewzPGelBCqP1F6u6a
 4sVeYsEU/FP+SHs7KJjYc3679m1APjDiw9M5Kh1ZjLw1ST23/9yzgmDliz6jNLCMzNlG
 UxLKWFYwufMDF5avCwt8OfJNaU9Vzr0Sw9+T8mqwcbVWjtpCT3jAfes+32owgxL9LZVn
 Yy8g==
X-Gm-Message-State: ACgBeo25rB/dukn0mdLT6nI+/u+/OCp+EuzqyXVYnGkxraHsMDJdVqDk
 8jaXbRGfHU4g9HyeZjsinlpaDGT134w=
X-Google-Smtp-Source: AA6agR7Dqh0e5lEARizXhdLKSN7CERljeJ/1tQyG6FqiXCTvVuoyMrgXcOZD0Y0Y6FSKzh+Q9Hb9sA==
X-Received: by 2002:a5d:598c:0:b0:22a:47d1:4fa with SMTP id
 n12-20020a5d598c000000b0022a47d104famr5092801wri.24.1662953674873; 
 Sun, 11 Sep 2022 20:34:34 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 x14-20020a5d60ce000000b0022862fd933asm6009588wrt.96.2022.09.11.20.34.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 20:34:34 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 12 Sep 2022 05:34:17 +0200
Message-Id: <20220912033418.2587016-8-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220912033418.2587016-1-francois.perrad@gadz.org>
References: <20220912033418.2587016-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=DHxU7vjNEAg8GbxG8A2uWaETy3AkoTUCNhQw04ZdOFE=;
 b=Np+uTMc37+tcalclO4FBo4OIy0CtDrHdMZbw4lwsMrEZvYiJ1Spy7JPt/5zgGiiAjU
 qJ99VlKYB2yscEX1xCtgyunFlROIZbn05GA8Q23+w0lMMdzBPKN6UsZiqwTQLfBpMUZU
 6jo99HKNwUUctjzDxjhSAUgAJJpLL1HiZa/erSHpS5t0CgQNVoTHk1FhUl173+lUSxdo
 OaZUr0ZkLtTz4xvvHM7uuESiXDFyF2z6GjSmQ5hHAzkcJzHcakfM1izDU8agdkZoj4U8
 62fED18wvBI7I2/565sHf6gnQFY4V/odataZBTocHs0+MQx5fTmSbXTPDk9RAPByil+r
 36Jg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Np+uTMc3
Subject: [Buildroot] [PATCH 8/9] package/perl-path-tiny: bump to version
 0.124
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
 package/perl-path-tiny/perl-path-tiny.hash | 4 ++--
 package/perl-path-tiny/perl-path-tiny.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-path-tiny/perl-path-tiny.hash b/package/perl-path-tiny/perl-path-tiny.hash
index 16f1a9a22..c6fe8bf92 100644
--- a/package/perl-path-tiny/perl-path-tiny.hash
+++ b/package/perl-path-tiny/perl-path-tiny.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  f746d8da5d049a5523b1880666bb0992  Path-Tiny-0.122.tar.gz
-sha256  4bc6f76d0548ccd8b38cb66291a885bf0de453d0167562c7b82e8861afdcfb7c  Path-Tiny-0.122.tar.gz
+md5  16dd03cded30d00167a03315d0e11e51  Path-Tiny-0.124.tar.gz
+sha256  fa083144781e46817ec39d21962bbbb0533c201f3baf031d2999a785a2a013fd  Path-Tiny-0.124.tar.gz
 
 # computed by scancpan
 sha256  c1a19c0d83f668a784640c0b41e024f37b182ad38011b170f9200123e57f6070  LICENSE
diff --git a/package/perl-path-tiny/perl-path-tiny.mk b/package/perl-path-tiny/perl-path-tiny.mk
index 310feed98..a0575172f 100644
--- a/package/perl-path-tiny/perl-path-tiny.mk
+++ b/package/perl-path-tiny/perl-path-tiny.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_PATH_TINY_VERSION = 0.122
+PERL_PATH_TINY_VERSION = 0.124
 PERL_PATH_TINY_SOURCE = Path-Tiny-$(PERL_PATH_TINY_VERSION).tar.gz
 PERL_PATH_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DA/DAGOLDEN
 PERL_PATH_TINY_LICENSE = Apache-2.0
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

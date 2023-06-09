Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D8E9C7EE2E
	for <buildroot@archiver.kernel.org>; Fri,  9 Jun 2023 16:20:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B602E41A21;
	Fri,  9 Jun 2023 16:20:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B602E41A21
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZEWUE1ObTUjx; Fri,  9 Jun 2023 16:20:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E182F419FC;
	Fri,  9 Jun 2023 16:20:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E182F419FC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8AB081BF2AA
 for <buildroot@lists.busybox.net>; Fri,  9 Jun 2023 16:20:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63A0C83C65
 for <buildroot@lists.busybox.net>; Fri,  9 Jun 2023 16:20:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63A0C83C65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dOHRU3sGCmLS for <buildroot@lists.busybox.net>;
 Fri,  9 Jun 2023 16:20:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 661DD83EBC
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 661DD83EBC
 for <buildroot@busybox.net>; Fri,  9 Jun 2023 16:20:26 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f7ff69824dso12059595e9.1
 for <buildroot@busybox.net>; Fri, 09 Jun 2023 09:20:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686327624; x=1688919624;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OOkCY1/+p0BS/VNmMIDPE+TTHmpg43ZAbo1il8jwgYI=;
 b=hUOKo9z/w996abGde/424GpB6d/5YoCql3Mlxgxiq2y+GKkqoyMZoFopyjQcEl8RUm
 PXEwSZ1Cz+XV0UgiJkRsMJap8DINRLO/b/3SJ4wgsY0yCaLTjfYAuMvwWqyIHQsoV7dn
 yAdbRnLo8fBYL1u8TblJMBSM+qkLAZD3wh8AQ9UyNvu0cFDYTaQVcpE/0FWhVQxh5JTn
 pTdrgXmr4rgbp5JQkgJTFogbPA6oNpCWZ7jTr0j9+ZP2nxLK67h5+8/l3JWC41fpsUhP
 USC6lJCDRftfWs+0HjCG/+W+jdCDkdEqRUgFu88GKylnBJuwppb7wFxrpZ+XqTTf6K4C
 2t/g==
X-Gm-Message-State: AC+VfDySYOIp+So7nP1m1nLtO95ZK9kL0OeEiLQKSY8b7CJS5G/8XqbS
 8v8E3yg4cZ/8WTcCir5ZuYbV5PgR9fU=
X-Google-Smtp-Source: ACHHUZ4hVrX/Qy4LX2dfpx21C9FzHrIX9xUvNGEjEbe1iOQy+/Vl8jWp6CCgel3EcXGF9JKCFuL6TA==
X-Received: by 2002:a1c:6a18:0:b0:3f7:9b05:928e with SMTP id
 f24-20020a1c6a18000000b003f79b05928emr1980707wmc.0.1686327624284; 
 Fri, 09 Jun 2023 09:20:24 -0700 (PDT)
Received: from vm.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 x19-20020a1c7c13000000b003f7aad8c160sm3141044wmc.11.2023.06.09.09.20.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jun 2023 09:20:23 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri,  9 Jun 2023 18:20:12 +0200
Message-Id: <20230609162018.1231615-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230609162018.1231615-1-francois.perrad@gadz.org>
References: <20230609162018.1231615-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686327624; x=1688919624;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OOkCY1/+p0BS/VNmMIDPE+TTHmpg43ZAbo1il8jwgYI=;
 b=PWOAf2qmPd412yaLWDDv/xkrLPUYSQn1EbwJQEDLZdOvVpUT2FovupR/MwOz9tkTtU
 ei0QSR6yyfBw7YX6nABOlcN4HDtQ7hRQkgfYzFZ7O3JcTh8DOa/1qZL3RgJ2lYw6xbNw
 saFDEPuv/n+fKY+dcxBapR5sTjeMUJlWFo+3+iBFZjnksZHLT1EeWBJjxswjjhlsQEi0
 iMpggadML5cMigqBvEOnz8qhefxGIMxI4sr/dkQLGVd0r1FYawYXwuxMOtjdk+WzIr3m
 2XIrmG+ZciHmzYumnZ4t5ydfZg94N5DeefzA7V4eG+CA+UGEtbGWJsSeCjt2A66OxohZ
 lk7A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=PWOAf2qm
Subject: [Buildroot] [PATCH 2/8] package/perl-date-manip: bump to version
 6.92
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
 package/perl-date-manip/perl-date-manip.hash | 6 +++---
 package/perl-date-manip/perl-date-manip.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-date-manip/perl-date-manip.hash b/package/perl-date-manip/perl-date-manip.hash
index 9762e7bc6..72741e413 100644
--- a/package/perl-date-manip/perl-date-manip.hash
+++ b/package/perl-date-manip/perl-date-manip.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  f9fe372c7abaf90e9da2ee7c3a4d32ff  Date-Manip-6.89.tar.gz
-sha256  5caaa9cd1e2b0a1b84124c373e02e89b17c89fdb8fc5bc5f75ac41d304a37617  Date-Manip-6.89.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  3ac4e55802837c396a30860492f33e67  Date-Manip-6.92.tar.gz
+sha256  ab962bd39ca09ec6fcfe7e5a6912af71b0c1f6f03e4ed2bef6e4471c9d367a13  Date-Manip-6.92.tar.gz
 
 # computed by scancpan
 sha256  8ba2a138654f8b59b7e1e3ad0d4c81918b9148ff95078b172ccbb45fa241431d  LICENSE
diff --git a/package/perl-date-manip/perl-date-manip.mk b/package/perl-date-manip/perl-date-manip.mk
index 6eab7790c..8739caefd 100644
--- a/package/perl-date-manip/perl-date-manip.mk
+++ b/package/perl-date-manip/perl-date-manip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_DATE_MANIP_VERSION = 6.89
+PERL_DATE_MANIP_VERSION = 6.92
 PERL_DATE_MANIP_SOURCE = Date-Manip-$(PERL_DATE_MANIP_VERSION).tar.gz
 PERL_DATE_MANIP_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SB/SBECK
 PERL_DATE_MANIP_LICENSE = Artistic or GPL-1.0+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

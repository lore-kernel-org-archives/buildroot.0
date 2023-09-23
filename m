Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F919CE7A88
	for <buildroot@archiver.kernel.org>; Sat, 23 Sep 2023 07:23:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 59C10402E7;
	Sat, 23 Sep 2023 07:23:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59C10402E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NDsoTKmnaBVK; Sat, 23 Sep 2023 07:23:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8988941AC0;
	Sat, 23 Sep 2023 07:23:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8988941AC0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6758A1BF3DF
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 07:22:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D55C82141
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 07:22:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D55C82141
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T70SU7bIoPyc for <buildroot@lists.busybox.net>;
 Sat, 23 Sep 2023 07:21:57 +0000 (UTC)
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 332DC82140
 for <buildroot@busybox.net>; Sat, 23 Sep 2023 07:21:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 332DC82140
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-31fe3426a61so3002776f8f.1
 for <buildroot@busybox.net>; Sat, 23 Sep 2023 00:21:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695453715; x=1696058515;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/rCEpRLAqQ07jz8KQiWv4zoEUOw6knyctDRTGn1QVXM=;
 b=YhImY6qqKpT6jB1y43DO/kZEi0pYmqlS6y2wqqZDmUz/mWbMPtvuLbmwvrDktx+Zi+
 1GLbyhi5DgWzRD6/FifDIxEwZq7HcXTLuvdpwModVlDbyYPkNX2YSNhdCqHclNDeM19z
 k2q3x5uVYoTQs7bVsGKKrjheFhd1LgFffOIFioA25eES+MaMx0hqFVkQLYY8nmtzR7Gm
 auC45KIsNnEYdlcp3xytlapWPJS4tAUZ9UoHh9hJnSvmZ7vy8d/qqU6JsBoC7ozz4K06
 O/n4S1HvJshOH0X3Httd05zulrM2u33+1IDAK6SSWfg9d6O3metT5y5i0lCoK+YsVpGr
 DD7A==
X-Gm-Message-State: AOJu0YwjNuWqO2iMoVSQ0F+K+s5QYXVehTdeYC95zqbMfXiqYIlC58ir
 +nIVRkM7IyhsFAWu2bRywUrQw7gTtQs=
X-Google-Smtp-Source: AGHT+IFuCPTXsblB65wjODW31rrxuT9V80iAa+ui63FiD4qC4/uVfUEV7Ev1Ki7XsQZq9YK3q1iDNw==
X-Received: by 2002:a05:6000:11c6:b0:31c:70b0:426b with SMTP id
 i6-20020a05600011c600b0031c70b0426bmr1297738wrx.63.1695453715297; 
 Sat, 23 Sep 2023 00:21:55 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 d4-20020adffd84000000b0031f34a395e7sm6156999wrr.45.2023.09.23.00.21.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Sep 2023 00:21:55 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 23 Sep 2023 09:21:31 +0200
Message-Id: <20230923072133.3122644-10-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230923072133.3122644-1-francois.perrad@gadz.org>
References: <20230923072133.3122644-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695453715; x=1696058515; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/rCEpRLAqQ07jz8KQiWv4zoEUOw6knyctDRTGn1QVXM=;
 b=TaECi0JCcZ93YTM5yk/EiBWOWaVe6v5R1YpIJWt0aOypSxEi8etx2oL6D5Ebm8CuDp
 9i3dauuRuf8w6Nt0IqqFmLSaLFjAZkk+pOXFH0CNq2xxYZlD36rGptIx/DcmJtg/bMK0
 BJAiAuKw8c871fLaDGE0qSZyp0aquBEeNEDt7GQz+ZbK1vT6Ca4p00HiHphupVDTjYkw
 ZasEiWgJyXjCfLG9gEa6lEc6pHvHahuE6XMzX9hEHzOFxRT20MAzTLl89/RP25QxlXAT
 NhcEXhchcjH6Sv46GQ5GAC4WWokchm81W3bsskmjXivI5Cf8H4d8jFZ7Tm9YkKoUcKUU
 PJgw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TaECi0JC
Subject: [Buildroot] [PATCH v2 10/12] package/perl-sub-install: bump to
 version 0.929
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

LICENSE: remove trailing spaces
see https://metacpan.org/release/RJBS/Sub-Install-0.929/diff/RJBS/Sub-Install-0.928#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-sub-install/perl-sub-install.hash | 8 ++++----
 package/perl-sub-install/perl-sub-install.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-sub-install/perl-sub-install.hash b/package/perl-sub-install/perl-sub-install.hash
index bbac2a637..834e589ee 100644
--- a/package/perl-sub-install/perl-sub-install.hash
+++ b/package/perl-sub-install/perl-sub-install.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  e1ce4f9cb6b2f6b8778b036c31afa5ab  Sub-Install-0.928.tar.gz
-sha256  61e567a7679588887b7b86d427bc476ea6d77fffe7e0d17d640f89007d98ef0f  Sub-Install-0.928.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  81baf186c62c71f0935c3ccf1c5964c8  Sub-Install-0.929.tar.gz
+sha256  80b1e281d8cd3b2b31dac711f5c8a1657a87cd80bbe69af3924bcbeb4e5db077  Sub-Install-0.929.tar.gz
 
 # computed by scancpan
-sha256  ad5fb5c05003488f924c60ead21694d629055c9db2ee2d9dd0cf0041b9fedaca  LICENSE
+sha256  0150501749fc390e1c747739a7c1d7661607f8f1d9a9f2ad279664f12e46104e  LICENSE
diff --git a/package/perl-sub-install/perl-sub-install.mk b/package/perl-sub-install/perl-sub-install.mk
index 85d60caf5..5e02a37eb 100644
--- a/package/perl-sub-install/perl-sub-install.mk
+++ b/package/perl-sub-install/perl-sub-install.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_SUB_INSTALL_VERSION = 0.928
+PERL_SUB_INSTALL_VERSION = 0.929
 PERL_SUB_INSTALL_SOURCE = Sub-Install-$(PERL_SUB_INSTALL_VERSION).tar.gz
 PERL_SUB_INSTALL_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RJ/RJBS
 PERL_SUB_INSTALL_LICENSE = Artistic or GPL-1.0+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

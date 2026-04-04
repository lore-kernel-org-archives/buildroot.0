Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A10AE88D66
	for <buildroot@archiver.kernel.org>; Sat,  4 Apr 2026 11:13:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8C5240C8D;
	Sat,  4 Apr 2026 11:13:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MgZQMLgoNyKy; Sat,  4 Apr 2026 11:13:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADA8240C31
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775301199;
	bh=jdlXkWd/h4PyeHz1uNUJQrqYq996xQ82jos6Rwjtcg4=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=L8YCNnm/S83EIB7c6kheShyWys1jJxjmjB8aRlWU8ZcwUG0Q7hF0pXaNoB18Nx7gw
	 JpX3IWTPRlFN0xDUiaHCTrOSzKKjgocv93nIieZ/QHz16Z5dPyoCxswSqVbh7u5/9S
	 vEaczQhxvKPu1hm9+tSFY3NxFkLDlLHAXQNmyNZl9Mk/1UFKoVhpMxVLVRGRKpr/+R
	 iTzviD75JX1ymUErbir5Xe1ZL+zfG46jHLGD7NjJy7w7puOtGlqJ5pywr1l7PwP9gd
	 e3j27hk/aR6ICCKEsKn1AIRIa64hQmcGPD4DJsreznNLrbhzQCEeS9v/hlcmH4JbEF
	 cEYs1JQjMsQig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADA8240C31;
	Sat,  4 Apr 2026 11:13:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BA958F2
 for <buildroot@buildroot.org>; Sat,  4 Apr 2026 11:13:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2B5881183
 for <buildroot@buildroot.org>; Sat,  4 Apr 2026 11:13:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4-0SxIIsawsF for <buildroot@buildroot.org>;
 Sat,  4 Apr 2026 11:13:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9E22E81180
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E22E81180
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9E22E81180
 for <buildroot@buildroot.org>; Sat,  4 Apr 2026 11:13:16 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-2b24ddb2428so15328555ad.0
 for <buildroot@buildroot.org>; Sat, 04 Apr 2026 04:13:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775301195; x=1775905995;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cuzetxzLYj1AFJMFFwZmZqOckMnLuilK0WkwalLLf+Q=;
 b=pCN5ipPGsV93eaoH3LW4BjO7M4th9q1RKD5NLB6ILOzOgDvYIHUyaivu4mDYW5UFVl
 b5K9571ogNtt0keU1DcWUoDQkQRB7qzTxpol9iFO1iQUtx0GLmSKM5g6x+vO/xTtXyut
 PUbf8WfGM5pDSH1TphkdLEp1ERA2pbqhNCmtSB4mU8OecGtzTpvjYsZeW4S2JM/7p7kz
 FFHcdacsD80cn0YVW0TXsN46ftBcHrzDpTgeImOby9YW/stLptcClu5cCfZcHXuXbHS0
 thZydH2h+IneBFIPGiX8JAkcEsyXrr9tamRVeYYHxBEUQW26YAtU3r3DLCaPXgfuacZN
 x8jQ==
X-Gm-Message-State: AOJu0Yzq6/McxofqDGQHshRcfocFXChT4okGI4vSmbJicL+r0F+n8igr
 msUfXAJi4Eh1NNBaWEqD4o04Piq4A1M0f+wfwSB2gOJfqp2o7Trl9wEBBaYnrw==
X-Gm-Gg: AeBDietwyMUXkNuKoO9NGmm7j/XNEYDXfH7rZtkXDToaeKyC4zKZO7zpOFReu03Jzrj
 YdFt/22Ojj89RINjLn1+1UW2+A33FpRpEqzmbJGC96tueqrND5X7DWOayBKQBgutPnxbQxxlGP6
 T3mKFpCyw9FnMfV0O6cQAfxQPd8DHncxhhVnfm0/oSNRGggkaC6J/YE7AcqwVtUAR1Zsk96SX5m
 l/MdDHZoy80GQNOu3fEg64dOwlIow3vRx/uT9N1524ARsKvaS6BHDQ1rc+co1+6UoxNrVSgSVRE
 bStAx8jUuW7d6Aeb7qOBb29fV6N0gx/sLI892kmwMEuU8LbDIcn03HDFAORwX9aEbj/hseGVhHA
 yzHfLzN/J76gg6kAgG6SM24XQY7VJ+4THJ+ZzjXtoGzo1V/tz7dJ4vVp43SPF2ex92uhLWVYZuX
 SqzEaOTKIpgE4jk7lYnPMfoNGM50BaM0zEeUZjcv9D2oo4+w==
X-Received: by 2002:a17:903:384f:b0:2b2:4194:9521 with SMTP id
 d9443c01a7336-2b28176a5d6mr65583505ad.25.1775301195321; 
 Sat, 04 Apr 2026 04:13:15 -0700 (PDT)
Received: from fedora ([2409:40e5:1126:477b:379d:30fd:d3e2:3b3c])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b2749a34a6sm84675485ad.60.2026.04.04.04.13.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Apr 2026 04:13:14 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Sat,  4 Apr 2026 16:42:49 +0530
Message-ID: <20260404111250.154311-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775301195; x=1775905995; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cuzetxzLYj1AFJMFFwZmZqOckMnLuilK0WkwalLLf+Q=;
 b=T6qbcqzS16DSoPwUF/clqvmfsdLfMndMybhydVMCNA2Xpn4iKKhCEaRrHlw2pQBWHa
 Qr04fRDz6J1zE/ka2BYIZAKiX7wk/cS6NOac+hJ8L7L7uUkLpccN+WkWMPvKENCgtLeY
 EEiIrXVlPzH6zIvakfWkMcVyiCgy4ZThV1VkYknKT5laXfWHbj+KRDDMKwwsIPmPPO/l
 Ez1ZHvtdpi4Q9JqzPpK5XFDN/EFeWhHcg0gQcLsBYM9d1xAo5SkdwNtPctOxl0wejpxu
 ouYDgd8YawZwMqhjd5NHxoGbYzsfgjPFO8LV7OfwTeExailRQ0+gwjIjfPDlCF5Lf/17
 ecZw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=T6qbcqzS
Subject: [Buildroot] [PATCH] package/font-awesome: bump to version 7.2.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Update font-awesome to 7.2.0.

This release updates the upstream icon set and related assets.
Refresh the source hash for the new release.

Add myself as the maintainer for font-awesome in DEVELOPERS.

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 DEVELOPERS                             | 1 +
 package/font-awesome/Config.in         | 4 ++--
 package/font-awesome/font-awesome.hash | 3 ++-
 package/font-awesome/font-awesome.mk   | 9 +++++----
 4 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 15de0a3cb6..ce09c8400a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3061,6 +3061,7 @@ F:	package/wolfssl/
 
 N:	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
 F:	package/ccache/
+F:	package/font-awesome/
 
 N:	Simon Dawson <spdawson@gmail.com>
 F:	boot/at91bootstrap3/
diff --git a/package/font-awesome/Config.in b/package/font-awesome/Config.in
index 694d74e5a8..40cadaf433 100644
--- a/package/font-awesome/Config.in
+++ b/package/font-awesome/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_FONT_AWESOME
 	bool "font-awesome"
 	help
-	  Font Awesome is a full suite of 605 pictographic icons for
-	  easy scalable vector graphics on websites.
+	  Font Awesome is a full suite of thousands of pictographic
+	  icons for easy scalable vector graphics on websites.
 
 	  https://github.com/FortAwesome/Font-Awesome
diff --git a/package/font-awesome/font-awesome.hash b/package/font-awesome/font-awesome.hash
index 89bc411f66..29c64cd40f 100644
--- a/package/font-awesome/font-awesome.hash
+++ b/package/font-awesome/font-awesome.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256  de512ba0e1dead382bbfce372cde74b3f18971d876fffb635ee9333f0db05d43  font-awesome-4.7.0.tar.gz
+sha256  8f433b74d3d4bbba2a6374a0a0ddf53be8e127809341e4c2578719229b43903a  font-awesome-7.2.0.tar.gz
+sha256  20c6f40715a567c97b80f6944beb8bb325835cab47ea7dcab89ee3b8e077eced  LICENSE.txt
diff --git a/package/font-awesome/font-awesome.mk b/package/font-awesome/font-awesome.mk
index 5211ac22a5..2b1de910ce 100644
--- a/package/font-awesome/font-awesome.mk
+++ b/package/font-awesome/font-awesome.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-FONT_AWESOME_VERSION = 4.7.0
-FONT_AWESOME_SITE = $(call github,FortAwesome,Font-Awesome,v$(FONT_AWESOME_VERSION))
-FONT_AWESOME_LICENSE = OFL-1.1 (font), MIT (CSS, LESS and Sass files)
-FONT_AWESOME_DIRECTORIES_LIST = css fonts less scss
+FONT_AWESOME_VERSION = 7.2.0
+FONT_AWESOME_SITE = $(call github,FortAwesome,Font-Awesome,$(FONT_AWESOME_VERSION))
+FONT_AWESOME_LICENSE = OFL-1.1 (fonts), MIT (code), CC-BY-4.0 (icons)
+FONT_AWESOME_LICENSE_FILES = LICENSE.txt
+FONT_AWESOME_DIRECTORIES_LIST = css js scss webfonts sprites svgs
 
 define FONT_AWESOME_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/usr/share/font-awesome/
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

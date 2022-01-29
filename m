Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D103BC433EF
	for <buildroot@archiver.kernel.org>; Sat, 29 Jan 2022 22:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C21840761;
	Sat, 29 Jan 2022 22:47:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NpVdR5Lq_w3x; Sat, 29 Jan 2022 22:47:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B037240893;
	Sat, 29 Jan 2022 22:47:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F181B1BF357
 for <buildroot@lists.busybox.net>; Sat, 29 Jan 2022 22:46:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED30A83134
 for <buildroot@lists.busybox.net>; Sat, 29 Jan 2022 22:46:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PTcQ5iJ4RRSB for <buildroot@lists.busybox.net>;
 Sat, 29 Jan 2022 22:46:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 15E2783131
 for <buildroot@buildroot.org>; Sat, 29 Jan 2022 22:46:59 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id m14so17706999wrg.12
 for <buildroot@buildroot.org>; Sat, 29 Jan 2022 14:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hTrdK/jAi2qX/ZwVnu7Hex9jpbfXVOVHz6avcpSKBmU=;
 b=YDh+13/5VriQBbj67H2vS8IxNKdLWdGaadUCBEamE/pQb70TUEck/XCBV+gKmAjZGx
 CguWfMyq7oPeKlY+dHWDNNiLCHbml41dbquOlnjF2Re2P7xToNHpFfcmL6u2sPr7v0fg
 A2XfJASXsBYr+04qI1/0oQv2/p/wBbwc0i2ovEuW9CvwyvkVb5efrZuXKhH8kNYqQdQW
 Aa+rbhkHGBNxUaWNVQGxRDXrjhgu2jP9RyzvDNvdujc1Piao/JGyI1scBExqMERbZ+7t
 i6h0ZaIuiPlf14eCGdT9FZg8ASvwZ7Lkwrb5lb+hY4EbO9ok57o9siTugk+XTO2xCiR1
 xRrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hTrdK/jAi2qX/ZwVnu7Hex9jpbfXVOVHz6avcpSKBmU=;
 b=4hmanwuM3JSguGzNaV1BHpjG6O4l3Sn9tWPS4sMRRaLTB0WgzaNLC72p6QIswLsOZF
 kOLMxn+NEnfjBODCLGTmUWYL7hfesH2pCzimd0fc7AV6xKsAqzkDLXsScZFmZI/u80Gp
 /13KxtY2xwZDehVm1r6alNGuAw74xoBHHlagvcYHey9ti6CN+1wsTuZ4+GF3BZlmrIZo
 7T0b892o8gPmWvC6yACSQee04snLOeUMfVdSsh6MlNcRG45t2KmHZ8caqGJD1YwI/nHJ
 UlgT5W6m20XMKJ8auOxwgqjqK1K6tPOGNgAoGCBFyLOqGwS/ps0P/DydW1R8GqK8TpZA
 08oA==
X-Gm-Message-State: AOAM532cK7/hCUEBSx0o6yUG/dIli1Ed9Y/kmzxGuoWEhARFCKC2CRV9
 20YQDxLBy2h6+O/NVnzw9twU3x2L41w=
X-Google-Smtp-Source: ABdhPJxa86nH0IMZes/ysOjFTxmLm/QNfVT4pxJr/HBSQazoGX4MqhSo3/hUBC8c/llt0zoPmv+p1Q==
X-Received: by 2002:a5d:6049:: with SMTP id j9mr11891809wrt.562.1643496417313; 
 Sat, 29 Jan 2022 14:46:57 -0800 (PST)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id l24sm5101278wme.17.2022.01.29.14.46.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jan 2022 14:46:56 -0800 (PST)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 29 Jan 2022 23:46:48 +0100
Message-Id: <20220129224651.1282263-2-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220129224651.1282263-1-romain.naour@gmail.com>
References: <20220129224651.1282263-1-romain.naour@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/5] package/enlightenment: bump to version
 0.25.1
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is the a bugfix release.

See:
https://www.enlightenment.org/news/2022-01-03-enlightenment-0.25.1

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/enlightenment/enlightenment.hash | 4 ++--
 package/enlightenment/enlightenment.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/enlightenment/enlightenment.hash b/package/enlightenment/enlightenment.hash
index dd4c4d78c0..2d977b86f7 100644
--- a/package/enlightenment/enlightenment.hash
+++ b/package/enlightenment/enlightenment.hash
@@ -1,4 +1,4 @@
-# From https://www.enlightenment.org/news/2021-12-26-enlightenment-0.25.0
-sha256  7d6e72ceed5aca135b7a49c2a1c1eb9d8fde1318613517401d0418e0e5f6df06  enlightenment-0.25.0.tar.xz
+# From https://www.enlightenment.org/news/2022-01-03-enlightenment-0.25.1
+sha256  2cf05fe3d96ef35e823619dbc0ac513ecabcae2186800ecd804924a637112444  enlightenment-0.25.1.tar.xz
 sha256  8d2fbc393e967cd6f5b8559d1744881a6a1ceb3ec6e1c2368c3916809ffccb8d  COPYING
 sha256  cdc77ee1732455b203610f923fe4196046b3f7509038c48dc0b0c7e3492c23f3  src/modules/wl_weekeyboard/themes/default/fonts/LICENSE.txt
diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
index 24bbd96cd0..95670e800d 100644
--- a/package/enlightenment/enlightenment.mk
+++ b/package/enlightenment/enlightenment.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ENLIGHTENMENT_VERSION = 0.25.0
+ENLIGHTENMENT_VERSION = 0.25.1
 ENLIGHTENMENT_SOURCE = enlightenment-$(ENLIGHTENMENT_VERSION).tar.xz
 ENLIGHTENMENT_SITE = https://download.enlightenment.org/rel/apps/enlightenment
 ENLIGHTENMENT_LICENSE = BSD-2-Clause, OFL-1.1 (font)
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

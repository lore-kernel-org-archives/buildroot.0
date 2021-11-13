Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE4C5C4332F
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 16:53:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1A1560EC0
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 16:53:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F1A1560EC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CEF240200;
	Sat, 13 Nov 2021 16:53:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qiyw5K0XP2Cw; Sat, 13 Nov 2021 16:53:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3DC5401A2;
	Sat, 13 Nov 2021 16:53:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 282371BF20B
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 16:53:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 16CE240142
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 16:53:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oOFFDQpOzsY9 for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 16:53:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 170074010F
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 16:53:16 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id s13so21399690wrb.3
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 08:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2DehGatLpcziKYV4uhyb6pPoFeD2UDzERcTP2KAY7kU=;
 b=Xn0Cwsn4XcaUmElWHuqcm7yTmWO3aXQLV6/CpFk85IgfHAI1zAUbOkvkq/zwqswc+n
 qDUVVT+3K95xKYWMDOrQhphBFw7CHn5JlP5KSMpjE1MyVsvgaJKrinj6H5yfKvWUrTDN
 cW+CgEf2PFQ3IhJsr7J4+2TugdEDRucmdWz0jdGtpPS0GttxLzDcaJUJGuaNUVgfBvs1
 5rn/4Zu3xqV7NrDwPkKmKM6SybfftDG2Rk9thVGMrxEfnyXwAD2frLGfsLJcuGEzfKaw
 u+sbVdEJTjEdVZGwvb349mqN8cA/RG7Sv9dFc4wT2oUZm/1p0xqcFQqaDj21vSnvlPHu
 GhwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2DehGatLpcziKYV4uhyb6pPoFeD2UDzERcTP2KAY7kU=;
 b=ATjvwWK0ouYMdOg1NMTvOK3dKpUzvGK4V++CcoOd3hiBZnD+PJDei5u+9fdcjEYrQT
 v58SquVDKBq260q9L4d92rq7+iYqGB/ewsDgHl1TxEGfUAgrgasyIRm/n/XUZOVW6r5H
 PXvvhQOcJI/rSnYxYU1GpFWxh4O8+7iGL6JhOLQrw9vowhFPENZuQFfvYVzrkD6Q5nVJ
 WYdZwxrl9m5sj2JUao0Dwox3elSu6QLxT7M29RFZKUfdpMp9OMs9f9qvQsKji2BMOlrC
 wRMzDOwTPnEMfAVLlCwcKiv55L1utAGgcg+D7vF9EJrqaCkMpEN4m/XP8o9axkrNCV/5
 wzSw==
X-Gm-Message-State: AOAM532OC0QiLLf7rkzrmmQ6woZoi8UQhVTJGTNfmry+EA3y5rnldMDh
 BtHS+MSTR1CqrkDvXf5p41uwbab0aOo=
X-Google-Smtp-Source: ABdhPJzsMqfdR4oRcDeALJD1yT1fnzCIlek+QE/cG0vHI4F9T+lx6O953hDPPxT9jEV1+m0NBy6LHw==
X-Received: by 2002:a05:6000:1681:: with SMTP id
 y1mr29533630wrd.52.1636822394926; 
 Sat, 13 Nov 2021 08:53:14 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id g13sm8630883wmk.37.2021.11.13.08.53.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Nov 2021 08:53:14 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 13 Nov 2021 17:51:10 +0100
Message-Id: <20211113165110.574060-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libqb: bump to version 2.0.3
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
Cc: Kamel Bouhara <kamel.bouhara@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use official tarball and so drop autoreconf

https://github.com/ClusterLabs/libqb/releases/tag/v2.0.3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libqb/libqb.hash | 4 +++-
 package/libqb/libqb.mk   | 7 ++++---
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/libqb/libqb.hash b/package/libqb/libqb.hash
index 0a01a9bbb5..b2c216f24c 100644
--- a/package/libqb/libqb.hash
+++ b/package/libqb/libqb.hash
@@ -1,3 +1,5 @@
+# From https://github.com/ClusterLabs/libqb/releases/download/v2.0.3/libqb-2.0.3.sha256
+sha256  a74582bc886fa625f5238374c7c8ca98672a2519c8196b91276be55886d84e9c  libqb-2.0.3.tar.xz
+
 # Locally calculated
-sha256  f72769c66479c51ac176b56837637b29d200f9dad40d23c5fdcb10f3a53ab1e4  libqb-2.0.2.tar.gz
 sha256  00a89b0d18aacd4114decf79122db87bf35bddaf2bc50e383c9c9f4c263390b2  COPYING
diff --git a/package/libqb/libqb.mk b/package/libqb/libqb.mk
index a9cf5e3fb9..fb132365f1 100644
--- a/package/libqb/libqb.mk
+++ b/package/libqb/libqb.mk
@@ -4,13 +4,14 @@
 #
 ################################################################################
 
-LIBQB_VERSION = 2.0.2
-LIBQB_SITE = $(call github,ClusterLabs,libqb,v$(LIBQB_VERSION))
+LIBQB_VERSION = 2.0.3
+LIBQB_SOURCE = libqb-$(LIBQB_VERSION).tar.xz
+LIBQB_SITE = \
+	https://github.com/ClusterLabs/libqb/releases/download/v$(LIBQB_VERSION)
 LIBQB_LICENSE = LGPL-2.1+
 LIBQB_LICENSE_FILES = COPYING
 LIBQB_CPE_ID_VENDOR = clusterlabs
 LIBQB_INSTALL_STAGING = YES
-LIBQB_AUTORECONF = YES
 LIBQB_DEPENDENCIES = libxml2
 
 # ac_cv_prog_cc_c99 is required for BR2_USE_WCHAR=n because the C99 test
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

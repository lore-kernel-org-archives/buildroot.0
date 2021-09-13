Return-Path: <SRS0=n+Pr=OD=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69D0AC433F5
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 20:59:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8DE16103B
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 20:59:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E8DE16103B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC9AC40264;
	Mon, 13 Sep 2021 20:59:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hsq_y9pE_y5C; Mon, 13 Sep 2021 20:59:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D477F40252;
	Mon, 13 Sep 2021 20:59:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C410A1BF2B9
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 20:59:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B406240301
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 20:59:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gQUO7In4yIDL for <buildroot@lists.busybox.net>;
 Mon, 13 Sep 2021 20:59:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C83A2402FF
 for <buildroot@buildroot.org>; Mon, 13 Sep 2021 20:59:11 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id s24so7576978wmh.4
 for <buildroot@buildroot.org>; Mon, 13 Sep 2021 13:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WfZCOL5wa6ADnun89N7dUBm7/r+HGJjmYYysmJkGKIY=;
 b=fWL0+benSY3CoESK9vSOZoxcvU38Smh7EG73DnmwQduQii4ZII2eSggdtcGKgYjVwc
 Oku0KqjhkZYARvOsxiPliZDveup4T30ibeYecuT4k6PzdJ0uA7+VqGffhUWX45SthuZ8
 0WKDkxGDuWHfWI8THncWQD3AMd0KhSoCiqc4QW9Gn4FYxBFaMZUSb+xX8z3uyYmvxTmk
 tL2uwdpMtSEceAafUFfcuYy0HFlJKqg2icfWZX9ON/IknA/oML81XC2lIA1uix4gIxsY
 CxVsEbmnv6+4VsTjGHfg9K9R6Q5ArKVne9Tq8iH/WZcH3j91onekiTujatOMZj6Gs27F
 /Wgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WfZCOL5wa6ADnun89N7dUBm7/r+HGJjmYYysmJkGKIY=;
 b=Dn5G7/8N7ldtYEchK4ILFOZo1m9NHamzrCTdA7otVcQJZ9ALS96dJgBK1/+BdDGR01
 rY8d8SEvj/aM2IfNmyNz8EhGiSecAkb6PPa5c/i205zexQ2hb+SMtD20RZGFDrjrCCkr
 Bp+VDjoaqK9QqYZBmurXXukyw+rinPm2aBgCo+rWyJCnATL0ZJ3tPhqmRTYGyBH/ve1/
 OtscvEGSYa0bY0DTde2dWlD3WBaXwfohDTGVH7lHeqFga751Uv7+1z2Vrv8jpR2eMSTb
 XPB14H7CGEK/JAt3o5jH+vbcwZrM21w5zr/yNV1zFw3493xm9oHED5sCq7rkTMdwpWJP
 UvqA==
X-Gm-Message-State: AOAM533AOsK+6dGJP3QJOI6U63C7uFbXl3ypFWIdpFkWYOPxtAOLPqcW
 zCwYnEvFXnZTPDl8uMSvFYKcoMvFmas=
X-Google-Smtp-Source: ABdhPJwyHo2SE18ZuNQb2ke9NmQAxy3qdX1CkSoxQ2gQbACi09q/YJYUC568z7yINXev7Xmc1gCxLA==
X-Received: by 2002:a1c:1fc2:: with SMTP id f185mr13328874wmf.22.1631566749842; 
 Mon, 13 Sep 2021 13:59:09 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id m29sm8946784wrb.89.2021.09.13.13.59.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 13:59:09 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 13 Sep 2021 22:58:19 +0200
Message-Id: <20210913205819.3933415-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/fdk-aac: bump to version 2.0.2
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Gilles Talis <gilles.talis@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Update indentation in hash file (two spaces)

https://github.com/mstorsjo/fdk-aac/releases/tag/v2.0.2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/fdk-aac/fdk-aac.hash | 8 ++++----
 package/fdk-aac/fdk-aac.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/fdk-aac/fdk-aac.hash b/package/fdk-aac/fdk-aac.hash
index 6b41e66a61..b10d5f92b1 100644
--- a/package/fdk-aac/fdk-aac.hash
+++ b/package/fdk-aac/fdk-aac.hash
@@ -1,6 +1,6 @@
 # From https://sourceforge.net/projects/opencore-amr/files/fdk-aac/
-sha1 575e90e85321c5be44dcf743a40ea57ab0835928  fdk-aac-2.0.1.tar.gz
-md5 e8b0b38e837df455b8a1ba75417ff0ad  fdk-aac-2.0.1.tar.gz
+sha1  579b34e8174b4feb21a9c598695f5ff4a7ceef8c  fdk-aac-2.0.2.tar.gz
+md5  b41222194b31f570b3132bd622a9aef6  fdk-aac-2.0.2.tar.gz
 # Locally computed:
-sha256 840133aa9412153894af03b27b03dde1188772442c316a4ce2a24ed70093f271  fdk-aac-2.0.1.tar.gz
-sha256 95ec80da40b4af12ad4c4f3158c9cfb80f2479f3246e4260cb600827cc8c7836  NOTICE
+sha256  c9e8630cf9d433f3cead74906a1520d2223f89bcd3fa9254861017440b8eb22f  fdk-aac-2.0.2.tar.gz
+sha256  95ec80da40b4af12ad4c4f3158c9cfb80f2479f3246e4260cb600827cc8c7836  NOTICE
diff --git a/package/fdk-aac/fdk-aac.mk b/package/fdk-aac/fdk-aac.mk
index 92753b5e08..c66f6df797 100644
--- a/package/fdk-aac/fdk-aac.mk
+++ b/package/fdk-aac/fdk-aac.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FDK_AAC_VERSION = 2.0.1
+FDK_AAC_VERSION = 2.0.2
 FDK_AAC_SITE = http://downloads.sourceforge.net/project/opencore-amr/fdk-aac
 FDK_AAC_LICENSE = fdk-aac license
 FDK_AAC_LICENSE_FILES = NOTICE
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

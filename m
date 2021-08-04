Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A778C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 10:25:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF3A760FC3
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 10:25:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EF3A760FC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B225083B62;
	Wed,  4 Aug 2021 10:25:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k-tCMb7PUAUG; Wed,  4 Aug 2021 10:25:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 282F083B54;
	Wed,  4 Aug 2021 10:25:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CC8D71BF418
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 10:25:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC7B883B54
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 10:25:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n13h4k2DFd69 for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 10:25:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 13B6D83B52
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 10:25:50 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 k38-20020a05600c1ca6b029025af5e0f38bso3534245wms.5
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 03:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=T92baKezNBie0gwB1c8C1hLZmxNpqrDXSjid0jPSf4E=;
 b=MKYqbDa9PHB/T98Np3BV/ECvH4t0hjX2RY/pVpzgn+fOLcDieW1SNpWP8efnLBy+Xh
 fPdV0xehmMA0q/87AhF/DG0gRFJdJ4wFBHNjVVVJ+pAi3Ynk45X0F/cjMkzEvgmL9K2b
 D8O1nL5FJXdxYSrYn6xtXmU1N8THZb4lnwQmuLzP5QgWxfmwVXDfI3R4RnnzjYzZ4DD4
 opk5EmFbIvpLfU7YWfzprloco6XJdOnHPLYLZd1tGTTeoYZ4rcRFql/jlQcCTXdKJ8dP
 1jjhkGUDA1byACNVL/sfX03xVgIS89fsYwHuWg1rcHpgSiQfcd5Nz4AIklJ4OnYqL+4K
 vSIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=T92baKezNBie0gwB1c8C1hLZmxNpqrDXSjid0jPSf4E=;
 b=LEAc2/DtQNsFRo1dOIOrgkk7Xv4x9alI95vD+OZaGJrrxFvUFkUuyU5rKxlqvZn4im
 kf4pKiPdqaSDscmc/1UwQqQCFJ7fti3yJQrzOmpII2G9Xyfdwsd/SsqjXDAXBMv1l6Lb
 2j+a7mGqDuW3QYhOSYB25p6NMR7dbeh2SHYCPkY5HAsYNPm5fuEL5SfZwpQeUBYL8yib
 VT2MN509opoapHAPCxV/+phICdbiiyPeLgos1DP8NsBlBVqnk6fCeCTsyX0wvblFLrqQ
 Sb/cIdjefSPEdoh4+NiTG9OeTaxJCgJR8GxjjcK8p3PMmeYtRSj7oeaRlM/mWc1+5N4I
 nG1A==
X-Gm-Message-State: AOAM531FOtx0rJvuzPEuGm1dy3Zsp70Ygxp9HkN5e7GpQLqL/mi/jyM8
 YLg+PhHaqjsPAE1t7ebJs9fhcha5mfmwyg==
X-Google-Smtp-Source: ABdhPJwjnyhpET7UMaPeaG//wjFm++39kC8BRV2kB5LiZ+scMkwT5WQAE8H8fZ9mww5uGSf4dLwdfA==
X-Received: by 2002:a1c:a945:: with SMTP id s66mr26457202wme.67.1628072748947; 
 Wed, 04 Aug 2021 03:25:48 -0700 (PDT)
Received: from kali.home (pop.92-184-97-247.mobile.abo.orange.fr.
 [92.184.97.247])
 by smtp.gmail.com with ESMTPSA id d8sm2017554wrv.20.2021.08.04.03.25.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 03:25:48 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  4 Aug 2021 12:25:40 +0200
Message-Id: <20210804102540.934195-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/screen: add SELinux module
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Support for screen is added by the apps/screen module in the SELinux
refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/screen/screen.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/screen/screen.mk b/package/screen/screen.mk
index f75f92cb47..843c71fc2a 100644
--- a/package/screen/screen.mk
+++ b/package/screen/screen.mk
@@ -9,6 +9,7 @@ SCREEN_SITE = $(BR2_GNU_MIRROR)/screen
 SCREEN_LICENSE = GPL-3.0+
 SCREEN_LICENSE_FILES = COPYING
 SCREEN_CPE_ID_VENDOR = gnu
+SCREEN_SELINUX_MODULES = screen
 SCREEN_DEPENDENCIES = ncurses
 SCREEN_AUTORECONF = YES
 SCREEN_CONF_ENV = CFLAGS="$(TARGET_CFLAGS)"
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

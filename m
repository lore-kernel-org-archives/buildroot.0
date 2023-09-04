Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A448C83F3E
	for <buildroot@archiver.kernel.org>; Mon,  4 Sep 2023 12:44:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1CFA40922;
	Mon,  4 Sep 2023 12:44:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1CFA40922
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ycvuAQntjyPC; Mon,  4 Sep 2023 12:44:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E58EE408ED;
	Mon,  4 Sep 2023 12:44:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E58EE408ED
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A73D21BF360
 for <buildroot@lists.busybox.net>; Mon,  4 Sep 2023 12:43:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8DE6981337
 for <buildroot@lists.busybox.net>; Mon,  4 Sep 2023 12:43:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DE6981337
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G5Yaj--qgfVs for <buildroot@lists.busybox.net>;
 Mon,  4 Sep 2023 12:43:59 +0000 (UTC)
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CA4D481322
 for <buildroot@buildroot.org>; Mon,  4 Sep 2023 12:43:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA4D481322
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-99357737980so217971866b.2
 for <buildroot@buildroot.org>; Mon, 04 Sep 2023 05:43:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693831437; x=1694436237;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l2Z+W+nFIWjQ1uOyTRHTtaEY5kyFBp3Iecc7mPJkisU=;
 b=Xh1IW/Q2PtxDmD+AB51HQGyXuv3JDUNzJDFVQ8E13fJ+sWyGUFBsVpsa5zKEPJSeJJ
 yks2ALEvxNy3ZYe/IzZBPGui/53GMUFGeRZbI/siTt+7N938c7Q6nICbU0pQtPvnlEOX
 cCRkfTym+ialM3iEpj8GbUC007c6PMqxOhfjP6dAIsjuaD4q1318ggCNVMqX5XMX7m3m
 G4b1+vCO2VekFAu9P+gbgr7xa3I4B5Hq0G4OyQlUWitpy1/8A1+o+TOsxDApd8Xx9Kae
 XD48NNfXFHlzTVZ+sZUh/BiqovbC16ux+lb3pBEBiBezZvg9/2vKQ2fb1xt2Co1/KX0d
 /TEQ==
X-Gm-Message-State: AOJu0Yy9cO1L/fGhy8CXbsCPZm4nkJtX23r0TaviUKpuu4fuAjMVplip
 S/uhNAxGOIC1P2DlYg0didCvNVt8bGg=
X-Google-Smtp-Source: AGHT+IEdWMi0LqQWAT8cA9HiCyqMjUlBlwlVSoHB/NYFR38GBXsOHs15uzqbrVYGhhQ6R5UoxqNaYQ==
X-Received: by 2002:a17:907:2e0d:b0:9a2:200:b68d with SMTP id
 ig13-20020a1709072e0d00b009a20200b68dmr6567638ejc.0.1693831436490; 
 Mon, 04 Sep 2023 05:43:56 -0700 (PDT)
Received: from lano-work.. ([80.120.136.76]) by smtp.gmail.com with ESMTPSA id
 i4-20020a170906264400b0099bcd1fa5b0sm6133745ejc.192.2023.09.04.05.43.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Sep 2023 05:43:56 -0700 (PDT)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  4 Sep 2023 14:43:33 +0200
Message-Id: <20230904124334.94615-1-nolange79@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693831437; x=1694436237; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=l2Z+W+nFIWjQ1uOyTRHTtaEY5kyFBp3Iecc7mPJkisU=;
 b=lJXhi9dkKbRZ9cFm9p63JhReCIm5CLbUDPs3mZGAUUwpwv/OfELexSRXbyxUcnPi3P
 d5UKP82Y8Qsz+EPv6Zl/0eDSijh6RIWetbKpSWgtweMdewdc0jXhECFa+7aZ98NNN8a0
 9zsMfkBgcLJm5UbpFBND0hXELvzjlmcUJs9GUnKuuv72g2dtqTh+IXJxLlwwsYTHT284
 NE1APBHogYeGMamKsXhC+ADa4T+QubmO1WXzOzLTy7pCdXy02wvSQzoxZN/koMtrO9hQ
 7OQ06q0vUYauWUpW+WGdnYDNiBl9KgFw0Z72+MAII5d7btwMeVHOsUNkVePrszHIoMIx
 tapA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=lJXhi9dk
Subject: [Buildroot] [PATCH] package/util-linux: fix detection of ncurses
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
Cc: Norbert Lange <nolange79@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

the configure script seems to use the NCURSES6_CONFIG variable,
however it will still check for a system ncurses6-config and prefer
this script if available.

Change to using ac_cv_prog_NCURSES[W]6_CONFIG override which
works always

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/util-linux/util-linux.mk | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 4a40d5afec..4e866d86c9 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -77,11 +77,9 @@ endif
 ifeq ($(BR2_PACKAGE_NCURSES),y)
 UTIL_LINUX_DEPENDENCIES += ncurses
 ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
-UTIL_LINUX_CONF_OPTS += --with-ncursesw
-UTIL_LINUX_CONF_ENV += NCURSESW6_CONFIG=$(STAGING_DIR)/usr/bin/$(NCURSES_CONFIG_SCRIPTS)
+UTIL_LINUX_CONF_OPTS += --with-ncursesw ac_cv_prog_NCURSESW6_CONFIG=$(STAGING_DIR)/usr/bin/$(NCURSES_CONFIG_SCRIPTS)
 else
-UTIL_LINUX_CONF_OPTS += --without-ncursesw --with-ncurses --disable-widechar
-UTIL_LINUX_CONF_ENV += NCURSES6_CONFIG=$(STAGING_DIR)/usr/bin/$(NCURSES_CONFIG_SCRIPTS)
+UTIL_LINUX_CONF_OPTS += --without-ncursesw --with-ncurses --disable-widechar ac_cv_prog_NCURSES6_CONFIG=$(STAGING_DIR)/usr/bin/$(NCURSES_CONFIG_SCRIPTS)
 endif
 else
 ifeq ($(BR2_USE_WCHAR),y)
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02055C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 13:51:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF18060EE8
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 13:51:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AF18060EE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6381F40470;
	Tue,  3 Aug 2021 13:51:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FDBwv__-VD0G; Tue,  3 Aug 2021 13:50:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6EA6403F7;
	Tue,  3 Aug 2021 13:50:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 41EB31BF84C
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 13:50:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 31CE3606AF
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 13:50:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1l_ZeTAZnIgT for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 13:50:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 20C1760585
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 13:50:52 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 m20-20020a05600c4f54b029024e75a15716so2184180wmq.2
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 06:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4o4SY43CtsOgqSsv0SKYOXztpiHGWporao0WFvz1otE=;
 b=TkSW9oGFNHoFObmG/ij5bMdTC9Omnsl3CECleMG85cR4oJ8ZF3VBZzFycqLwAnM97D
 BbJUSXJAvTiOagno2Yz03rLSNmp9cZOdb2/8/665LL5h99lLhdWucyN6RgyCcIerJ22y
 7dZwUDu31bDJ/6al/A/LbBsbHQZeCNEO6bBXKL273HJ9ce1/Itni4G2v7Dc2KpSE2Cbx
 1kCrvq+AmZSQl1hbf7TXcr1tnisW2OuVpABummOO3AVg+1P1nHtfRfTErwvcmCIlzhWN
 9cuTSxt50ggBgjduZfdWTJT2U+H8xTHSU2hfW2H0YLHn3PDYPstW3GrZeW8DF63xrEE5
 e8Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4o4SY43CtsOgqSsv0SKYOXztpiHGWporao0WFvz1otE=;
 b=gEuyFalGoFK0jCi6Rtk4h/fiRA3W7xSTlP205lLeDKdSPw3OTNliy92CH6fVJkYiHU
 JyTBKvLfaB0F/QEzN1KT+QRYuchKzNz0JeGmSV8fuKGyp+802RcsQK+GegiZ5Z+F6ec5
 wNK66bSEe+veOYYJA4S5gtIVAHr5T7DrGSPqEUO9A3i+rzYikKuCqKZP/ct9LKC0YfHl
 yAUmzM2x2LkzzU/vbxHjznMVGiNDohoHXTEOQbA85VKHMROgXw0GPzKYTTgFMlLmKbVR
 EzyUuY0jLKlxQw+WMCmnC0VXuqVLPJuCu0r9U9tRW9oCsk9440scvqVaOB9w2T8KGS47
 NTzg==
X-Gm-Message-State: AOAM530+YCjYa8/lVvku86wC7Sv2yw8lqoci6VsPXfxjTxB9QjSDAX/F
 yfA6ZeC82+dAotIMamh+KMxZXg75C8SkLw==
X-Google-Smtp-Source: ABdhPJw7uqXySHD1tLJTmhG5Bd0iHoekweJoREAuMpzppGA8Ai82WJXKGF+KpLK/wAdoe6vCAUXicw==
X-Received: by 2002:a1c:f206:: with SMTP id s6mr21696839wmc.102.1627998650102; 
 Tue, 03 Aug 2021 06:50:50 -0700 (PDT)
Received: from kali.home (pop.92-184-97-219.mobile.abo.orange.fr.
 [92.184.97.219])
 by smtp.gmail.com with ESMTPSA id u11sm14274646wrp.26.2021.08.03.06.50.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 06:50:49 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  3 Aug 2021 15:50:41 +0200
Message-Id: <20210803135041.4090636-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libodb-mysql: fix build with gcc 11
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
Cc: Kamel Bouhara <kamel.bouhara@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fixes:
 - No autobuilder failures yet

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libodb-mysql/libodb-mysql.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/libodb-mysql/libodb-mysql.mk b/package/libodb-mysql/libodb-mysql.mk
index a9040c65f8..88b6f4cb31 100644
--- a/package/libodb-mysql/libodb-mysql.mk
+++ b/package/libodb-mysql/libodb-mysql.mk
@@ -12,6 +12,8 @@ LIBODB_MYSQL_INSTALL_STAGING = YES
 LIBODB_MYSQL_LICENSE = GPL-2.0
 LIBODB_MYSQL_LICENSE_FILES = LICENSE
 LIBODB_MYSQL_DEPENDENCIES = libodb mysql
-LIBODB_MYSQL_CONF_ENV = LIBS=`$(STAGING_DIR)/usr/bin/mysql_config --libs`
+LIBODB_MYSQL_CONF_ENV = \
+	CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11" \
+	LIBS=`$(STAGING_DIR)/usr/bin/mysql_config --libs`
 
 $(eval $(autotools-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

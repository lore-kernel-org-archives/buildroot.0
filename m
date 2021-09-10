Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B4AEC433F5
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 06:47:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B2A160F9C
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 06:47:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1B2A160F9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B7F3740181;
	Fri, 10 Sep 2021 06:47:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KxHST0I5j_lQ; Fri, 10 Sep 2021 06:47:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E3C6F40179;
	Fri, 10 Sep 2021 06:47:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 930E21BF352
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 06:47:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 804046063D
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 06:47:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UlQ1wkNV8o_7 for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 06:47:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AFDE160636
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 06:47:28 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id b6so1073925wrh.10
 for <buildroot@buildroot.org>; Thu, 09 Sep 2021 23:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Mg6tFhmxUyE/tAiWVv2fbskdkrAwYpFpGdeCUQYg+mQ=;
 b=lrvOAP+tvjQoSBo/2tzumUjWK758K3MObveK1nEOG/v6RWkCIdjBFA09Y1GdaSOO9Q
 vi4XSG4UntZSsZaOAyxNHOiiLDgEeAnC8AbVnSU4jYig9n1R6JKjo92UHB0YY6ci/ZwB
 +2vfWUZnxks4LY5Z5LeT1srWtX636+VuWVfdBQdtttQLqSm/UCktdQRjYthaNjilqtuf
 KmqvfGIUzWrXkhxC9/je2dGYNK5kBLHixoe5aN8uWVzAL/nEj0jWRe9aBzP2jwYpb/OV
 ltjCO6nFuEVnQJ1sdMNkb0ws5XnePpXa6y7u9PaBAkS89TJsgX0gtov8zD6cVS5Hmvtf
 SK7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Mg6tFhmxUyE/tAiWVv2fbskdkrAwYpFpGdeCUQYg+mQ=;
 b=ic7kSVBIL5GHAINuIfW2BtETiOHDTJ7SwSrh3zxWm1ZiDrMYKQU9VxLlP2HGPVT/Z3
 7Ds0qcJ6RSMBdExhsvJPHW/RAoa63DgRmh+pANgt9M0hdsxbkWmCln1HPBuPnA0o9lSU
 Srt5yXtQ91pBIKkJQ4e8+V3RNj7aqzo+FsjiIFsuY2s6oC95JMfCMqWTzlDfXvBlbB41
 s2KuayRF2E6Q+ONCqsWXy+GaRFUIAQqB00Buv4y6OY6ifUJnwMqE+uaXE45xTJI8YEwA
 rpstDSyCv8mlFzSjqHsdCxpF+urv8gFlmRxsRM+50dTh6b8XuW5myuLMCGr2F505c9Zu
 etTg==
X-Gm-Message-State: AOAM530uYfm89ojtwqnv2vJuur1sL5igNvOrb1v1qe6JIWaTjoSQ7Bz1
 aLreOdfndlb9mbWudn1nbGZ60sWBwaI=
X-Google-Smtp-Source: ABdhPJwtFH7jST2J6xqoRAgtgD79J0J+8H9GUVgVVLt22S8dutpKlqePXoA0RNoAg2RbpYAokCGmvw==
X-Received: by 2002:a5d:6212:: with SMTP id y18mr7856081wru.241.1631256446585; 
 Thu, 09 Sep 2021 23:47:26 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id n66sm3482893wmn.2.2021.09.09.23.47.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 23:47:25 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 10 Sep 2021 08:47:22 +0200
Message-Id: <20210910064722.99806-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] Config.in.legacy: drop 2021.08 entry
 duplicate
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Drop 2021.08 entry duplicate added with commit
531b2a10cda6bae78ecc141c9fe48f2024f71dbc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 Config.in.legacy | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 68c9f3ca49..6f71575f8a 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -224,8 +224,6 @@ config BR2_PACKAGE_PHP_EXT_XMLRPC
 	  The XMLRPC php extension was removed.
 	  See: https://wiki.php.net/rfc/unbundle_xmlprc
 
-comment "Legacy options removed in 2021.08"
-
 config BR2_GCC_VERSION_8_X
 	bool "gcc 8.x support removed"
 	select BR2_LEGACY
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

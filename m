Return-Path: <SRS0=2n7N=M5=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0FAEC4338F
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 10:03:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5998D60ED6
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 10:03:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5998D60ED6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F2C7B402B8;
	Fri,  6 Aug 2021 10:03:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3zsvZ_v7h0bw; Fri,  6 Aug 2021 10:03:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 06F0B40163;
	Fri,  6 Aug 2021 10:03:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3D4411BF3B0
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 10:03:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3998A40433
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 10:03:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QR9PegQM_qfH for <buildroot@lists.busybox.net>;
 Fri,  6 Aug 2021 10:03:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 22C3F40400
 for <buildroot@buildroot.org>; Fri,  6 Aug 2021 10:03:09 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 e25-20020a05600c4b99b0290253418ba0fbso5718772wmp.1
 for <buildroot@buildroot.org>; Fri, 06 Aug 2021 03:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QmGQVulVwOPwe6J93NSt4CMb+AusOWP0s0J2rklSFsg=;
 b=OlVmmESwI+2hCRLATzF7RHjI22a7hJdmewQn2XKMRGKeN7Fs0meGp3VW5PEni2vLFn
 8HvoMeGyAnZlPl72ETTiRp8JYI1DhR8+6FMQ20f8rvXoQJjZcSrAU5akjREbL2Im8CN7
 /7uBHfCafW03JViY/iFvKi+b5lsUlwsDCMCEkdDqGvrWyp72byOqJE3t0nDBLHs/MivM
 zgeTQMBydYGR3zc+WLUgu+hG4pTR5RtOPyFoRMUzdSITXvTMOfBrWs2i3bP1j516nX6T
 vRuHXN8h+ehqU5VYAuZHbeyB9BumjZjlfP3Wz32F0sVBBvbnZ0iKiAxS/mWMQABIqb+B
 SVvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QmGQVulVwOPwe6J93NSt4CMb+AusOWP0s0J2rklSFsg=;
 b=McP+NolEHLlwEIv2o+uxBrdrcesogWAg0lvsw+CZ3BPa49v2od5tbsxbzZRrxL4esO
 vo93215F01LLpFNOFmc8UDelv9fpfAwghAH2IQeAP4c1aLfa7PamTkDE5Nu9+CRs7vVJ
 85qXlIRGyuUlbMLufVICvIwXETBMXYyO8hb8GZLLbBmqLYtB7zi1cX1chUdzLLCY0v4m
 IZLdMVMsihcDrtn4OmTriYrNUduNRab5xb8esZevRdbBTkcZoX37772rdv5GDxsUS7hb
 JwIcQ6++o1gpgB9UlotRD7T9pBkc5NDZ4QUa6COpMGt/o3GLlvox2Pd+07VBV1OYtxBk
 D7WA==
X-Gm-Message-State: AOAM532B25BZi/loKSLN3fuCnkgn4k9WL5DWnT2QfwbrPJmgA12+dZwx
 dkyJ1roKnZJ9g7c0LuVYbmJXrIi78ssZIg==
X-Google-Smtp-Source: ABdhPJxv5qNncDtB6flF+u99bLTTVllWlABzMtonkiL8DIkGgfST1uW25McSO2GJtTsLI0/JENfaTw==
X-Received: by 2002:a05:600c:4f15:: with SMTP id
 l21mr2340161wmq.171.1628244187900; 
 Fri, 06 Aug 2021 03:03:07 -0700 (PDT)
Received: from kali.home (pop.92-184-97-89.mobile.abo.orange.fr.
 [92.184.97.89])
 by smtp.gmail.com with ESMTPSA id z137sm11558373wmc.14.2021.08.06.03.03.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 03:03:07 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Aug 2021 12:02:56 +0200
Message-Id: <20210806100256.3448996-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libesmtp: requires DES support in
 openssl
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

Enable DES in openssl to fix build failure raised since bump to version
1.1.0 in commit b72401692e1ea73a37fcf4c0b421b654e8a2100f

Fixes:
 - http://autobuild.buildroot.org/results/52bce321552d23c10617c4ba4dc5b290e1d43dd5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libesmtp/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libesmtp/Config.in b/package/libesmtp/Config.in
index 5c6a412134..c631d127e0 100644
--- a/package/libesmtp/Config.in
+++ b/package/libesmtp/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBESMTP
 	bool "libesmtp"
 	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_MD4 if BR2_PACKAGE_LIBOPENSSL
 	help
 	  Library for sending emails through SMTP.
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

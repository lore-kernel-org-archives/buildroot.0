Return-Path: <SRS0=yDzA=MT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1583C4338F
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 12:06:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 590F661373
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 12:06:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 590F661373
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 047E440375;
	Tue, 27 Jul 2021 12:06:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mBQXZE44h6F3; Tue, 27 Jul 2021 12:05:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 645D940377;
	Tue, 27 Jul 2021 12:05:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A52671BF42C
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 12:05:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 91C2640397
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 12:05:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VuXG9BlTPY9P for <buildroot@lists.busybox.net>;
 Tue, 27 Jul 2021 12:05:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DB23F40377
 for <buildroot@buildroot.org>; Tue, 27 Jul 2021 12:05:50 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 f14-20020a05600c154eb02902519e4abe10so1677262wmg.4
 for <buildroot@buildroot.org>; Tue, 27 Jul 2021 05:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JZRVt/QH85X+SRyOnlel7huesDC3etYQCzshj9bQeE8=;
 b=f4xerZ2Xz2UJgy8axCWd/zlMUS/IpvLkRWpA37WiuCR8iS4GtxmnBQ4rBZBvQOvcKt
 Un43HnPipI4IIln5w6U4DQ7SUHRI+zYKySpvqGG+V5noARdrE54lFD+M6wsJ7Tq+y7Wr
 YOToymuxOL2G6OvKMIEESeVJJfxNj2mKrf2oUZ5ejrubm3biIcz1JtzZSQRoM6XLjrp6
 xrjfSvD5Sw6IDgfETFRkj1avs/zNc6i7EsxXkYW6VbOMgYOP5DYmhCgIPmkvQm2qDwRf
 qZ3V0N23oHNFLJ/Z1zqTlCWM4zAuER0ixBjsVbFmkOnaU6beXaW1htEjnDCAylZg+YVn
 vFGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JZRVt/QH85X+SRyOnlel7huesDC3etYQCzshj9bQeE8=;
 b=KKnlA26q2oQoxZOn8x5w2cSQ6gAKWazJ9L4vbJULrPh4e9YSndq6VLPhnZ61p1Tuyj
 FHBZi6wZRfIlraSsgdT7m4/dxaBGzPzO7xAeAAJMqHuuRDTcNm1xKn4oIlBtizxAfAP3
 3lib2i6UUvNOTJ2rzpgFv1CgcBx5q929zVm6GHLTZw+kFiE+DpHAsHj7cugYzBc7xk9Q
 egR76fG3ldtXI6X3ldFfqb61eLKvKiUgNtxstCT4N7xmvV15q2UdH/on5s566VhsFiNo
 FAtKUda5TktubtvZAuI7xRCQwW0PfH20gJsbfxApYzB5EE41ur0NYWqvUQroJyS5yTuV
 ocaA==
X-Gm-Message-State: AOAM532ccjq75EKRftrx7Lolh31rujwteQzyrs91dZnSRFvVYTZCrdjR
 m79hteKQY+8ZCX8DSazUgNPUrNZ/RxAYlg==
X-Google-Smtp-Source: ABdhPJwoFVsybtl3zH/t6R6V47MfgbrX+OpvBS517JUwkPc7654CLHv97E1wHSZqwU3/sPBYANH2rg==
X-Received: by 2002:a7b:cb09:: with SMTP id u9mr3711397wmj.63.1627387548653;
 Tue, 27 Jul 2021 05:05:48 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id b12sm3189141wro.1.2021.07.27.05.05.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 05:05:48 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 27 Jul 2021 14:05:35 +0200
Message-Id: <20210727120536.2807777-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/gssdp: bump to version 1.3.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Rahul Bedarkar <rahulbedarkar89@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Update license to LGPL-2.1+:
https://gitlab.gnome.org/GNOME/gssdp/-/commit/b018ff574f482a178f0c8515faf32962da70396a

https://gitlab.gnome.org/GNOME/gssdp/-/blob/gssdp-1.3.0/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gssdp/gssdp.hash | 6 +++---
 package/gssdp/gssdp.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/gssdp/gssdp.hash b/package/gssdp/gssdp.hash
index f31f21942a..2f13c0a847 100644
--- a/package/gssdp/gssdp.hash
+++ b/package/gssdp/gssdp.hash
@@ -1,5 +1,5 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/gssdp/1.2/gssdp-1.2.3.sha256sum:
-sha256  a263dcb6730e3b3dc4bbbff80cf3fab4cd364021981d419db6dd5a8e148aa7e8  gssdp-1.2.3.tar.xz
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/gssdp/1.3/gssdp-1.3.0.sha256sum:
+sha256  e739cf33f813403a53973cd8f2882dcd7208bad9582269f7066fc9e8ea3a52cc  gssdp-1.3.0.tar.xz
 
 # Hash for license file:
-sha256  d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gssdp/gssdp.mk b/package/gssdp/gssdp.mk
index 02b10d961a..03987ff085 100644
--- a/package/gssdp/gssdp.mk
+++ b/package/gssdp/gssdp.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-GSSDP_VERSION_MAJOR = 1.2
-GSSDP_VERSION = $(GSSDP_VERSION_MAJOR).3
+GSSDP_VERSION_MAJOR = 1.3
+GSSDP_VERSION = $(GSSDP_VERSION_MAJOR).0
 GSSDP_SOURCE = gssdp-$(GSSDP_VERSION).tar.xz
 GSSDP_SITE = http://ftp.gnome.org/pub/gnome/sources/gssdp/$(GSSDP_VERSION_MAJOR)
-GSSDP_LICENSE = LGPL-2.0+
+GSSDP_LICENSE = LGPL-2.1+
 GSSDP_LICENSE_FILES = COPYING
 GSSDP_INSTALL_STAGING = YES
 GSSDP_DEPENDENCIES = host-pkgconf libglib2 libsoup
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

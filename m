Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 945E8C433F5
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 08:17:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02E4C610A8
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 08:17:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 02E4C610A8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89E778405E;
	Sun, 19 Sep 2021 08:17:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SPe9KQSyWrLe; Sun, 19 Sep 2021 08:17:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE0E48405B;
	Sun, 19 Sep 2021 08:17:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CDB111BF2AB
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 08:17:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C93D1606AF
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 08:17:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XBCXKdQlLp6z for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 08:17:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D16E7605AF
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 08:17:01 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 c190-20020a1c9ac7000000b0030b459ea869so4365194wme.4
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 01:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nonX3fE0VLVeQIt60/cuO3tmPmJYg7Jo9cjMFa9p9K0=;
 b=UodNVA8uCZGSZcy7lbzd/mbGP4hRrmWQ+kno/rBkEQn+kFogf5NtVcZUkRBvwlZgP/
 SdZt78dV5u7YCMC9HFi6vLaFI79ZZrCWm8PfQP9kub1imdQmOqLpbm6mnsagtJDpmJEN
 sqSgg3/hyssC/37200+rbtULXdb+vPuxpbENkwgo9Q1K5brLCpKBssnNqQo7qWPi5Ibx
 E6GwTtmnED1b2FgnAQIcFnkkX3BnvbCx8TkqkxxnV7cb0hH969w0FEsBl3T2oJZC0ddl
 TeDU9h/D1MNKJBmCI3TbYHbW05D3Q7CUPT+ptP2F+R09qlzZ9CJ9ReTaCeFTMzBLcHB1
 bRDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nonX3fE0VLVeQIt60/cuO3tmPmJYg7Jo9cjMFa9p9K0=;
 b=dMd4NGPMdICeeuV5/qMimXsUktzDod2Ve+rxNE81QjHJsZiTFBbGgZG8LynT9x6JKP
 rSzim+lNN16+r8rgfsi0UhyPSNJKVd6vVJ9OF3wKjZtW9zFUDvaiQwb+bkuqqkrVveEd
 BRYasUiYAndL0yLyHih/hArjoNX5aTnv1/y8Cq++q7mDnUd3H4MVcmIfuwPUXbHm1XKw
 w+GyY8UwqoFUl+8jr8ujbshgLSdPDw+GbTr778XVXfm4AnLGurlYKxP0icgfNIvI7af7
 R7rmzXFDRPQiW9ls+sJKRwrpHr+LpyLLitn7Rq0QiOE71omaHZKelVD0jHRWm/gIxYBg
 1HsQ==
X-Gm-Message-State: AOAM530hxo11p+hvIc6jkFf+cDXyYXc2aREBRqy0vNeA36RbUMCtMwrE
 5b2MnsbHzkZ+4dxIwSORmX+CIY7NeuA=
X-Google-Smtp-Source: ABdhPJx0D/9pcGEwtvDPGX1S0xXv5jU9+1xNfRVSh5M0xj05BO2CQZcKP7w99CmFMrSdgMploIv/5w==
X-Received: by 2002:a7b:cb97:: with SMTP id m23mr17740162wmi.70.1632039419516; 
 Sun, 19 Sep 2021 01:16:59 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id y6sm11649725wrp.46.2021.09.19.01.16.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Sep 2021 01:16:59 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Sep 2021 10:15:52 +0200
Message-Id: <20210919081552.1415522-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/wayland-protocols: add wayland
 dependency
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

wayland is needed to avoid the following build failure raised since bump
to version 1.23 in commit 7eedc9cc1e0c3cce1c18cb150157cb2346075b23:

Build-time dependency wayland-scanner found: NO (tried pkgconfig and cmake)

../output-1/build/wayland-protocols-1.23/meson.build:11:0: ERROR: Dependency "wayland-scanner" not found, tried pkgconfig and cmake

Fixes:
 - http://autobuild.buildroot.org/results/2744e50465a9cd9d3726d23298ad6c943ef49a21

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wayland-protocols/wayland-protocols.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/wayland-protocols/wayland-protocols.mk b/package/wayland-protocols/wayland-protocols.mk
index 41ab1e1c99..845b7e0d5e 100644
--- a/package/wayland-protocols/wayland-protocols.mk
+++ b/package/wayland-protocols/wayland-protocols.mk
@@ -11,6 +11,7 @@ WAYLAND_PROTOCOLS_LICENSE = MIT
 WAYLAND_PROTOCOLS_LICENSE_FILES = COPYING
 WAYLAND_PROTOCOLS_INSTALL_STAGING = YES
 WAYLAND_PROTOCOLS_INSTALL_TARGET = NO
+WAYLAND_PROTOCOLS_DEPENDENCIES = wayland
 
 WAYLAND_PROTOCOLS_CONF_OPTS = -Dtests=false
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

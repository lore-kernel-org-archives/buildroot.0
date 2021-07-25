Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54ECBC4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 12:56:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 070FF60BD3
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 12:56:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 070FF60BD3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7B964025E;
	Sun, 25 Jul 2021 12:56:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id id9FRPpNyMdw; Sun, 25 Jul 2021 12:56:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05E3540233;
	Sun, 25 Jul 2021 12:56:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 87FFA1BF470
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 12:56:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F45E60682
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 12:56:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id elGHbXFN5jkB for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 12:56:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4811460645
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 12:56:29 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id z7so7553668wrn.11
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 05:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ibEDHSzMF/OVR4/mOoosFaSWMdT5Z66WFvSola003Rs=;
 b=nDMbhJraRq1lfHdoZ7nJx8faeaybL4lAo65d4B/ETnxK0gmzBH9GIdVP8xwEVFU0zP
 xS1LpWzwrH5YYXLKI+GnRRxUAfzoQWhgbYIN7fo6Wm69XhBq4Ntr2aJf307yj0fTitdf
 Bd/bdLEYn8mU+jJsOk51Fj2+i7+fvnLCzWu09r9oCl/2HXioXx2HiBeftEHNZqnOFZze
 1ArI8EA9U5Xq44KctCetotZiWCKddGPX8E64vB7+D1bG7Zs9PDcYXuZT7E4uTPUvHpJ7
 k3ODpkycr+nXsfWsWpB8Z1gj/uIbaW8GIWIbpsqS4y7Aj9Bnm8qFHr9cuCA8DSMTtgCx
 d2SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ibEDHSzMF/OVR4/mOoosFaSWMdT5Z66WFvSola003Rs=;
 b=Fj24og4DfGdslRsfRDbvx0WRKWMRzgi/mbE2Bth5luMSYXi5DM2XurOXEwX/hlh7Gh
 GEugE9L1sQO/6ySQs4qXKyqZmXvtrEOAD2ajyCCZ2MOitICjdhkP+ebGpvh4ZaCfRmt1
 uodU2rJSk1ZTiuJ5ujs0Togbiv3krnyRX1IZRcdkgnp+fQAfdIFjevxyxtkSoZylYXbn
 kfID/1rQdxHQ3vNPNoPmDf+RIZ48zDc5vFG8YP9/1u9jNab6eC/Qwvu30qgcZNuqAQH6
 /s4e+0/lMlBNIUJM+oG9m8mamSaplt92scEnApOqU1GREtc2Qr4wKOjaOsxrnFfB2uwf
 z6DA==
X-Gm-Message-State: AOAM532TaQINTPSMEPi2sI+a76zhh+CdKkpjy8YV/YrSj5FLqECIpKSG
 v24KTnCsJUChujILcAUYgBDBtKdk5UIRBg==
X-Google-Smtp-Source: ABdhPJzsOqNIify/k2hM87ZFTg2H/pXh0sWv9Khyo7Lz5kIog+/Aqc4Hk+TmnrCtohhJpkgtqpZU2g==
X-Received: by 2002:a5d:4410:: with SMTP id z16mr962678wrq.173.1627217787238; 
 Sun, 25 Jul 2021 05:56:27 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id n23sm31149831wms.4.2021.07.25.05.56.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 05:56:26 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 25 Jul 2021 14:56:17 +0200
Message-Id: <20210725125617.900041-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/php: needs wchar
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

php depends on wchar since bump to version 8.0.7 in commit
469c11c516959375f6caddde178adbdcdc5d9887 and
https://github.com/php/php-src/commit/457380cae7813a4a34faa1f9a49fa121395fe290

Fixes:
 - http://autobuild.buildroot.org/results/751fea989e4c0136d0bbda0f5487d55d387ee5f3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/php/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/php/Config.in b/package/php/Config.in
index 6fa420428b..226d2d5fd2 100644
--- a/package/php/Config.in
+++ b/package/php/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_PHP
 	# message like "ld.real: section .junk LMA [...,...] overlaps
 	# section .text LMA [...,...]"
 	depends on !BR2_BINFMT_FLAT
+	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_PHP_SAPI_CGI if \
 	       !BR2_PACKAGE_PHP_SAPI_APACHE && \
 	       !BR2_PACKAGE_PHP_SAPI_CLI && \
@@ -49,3 +50,7 @@ config BR2_PACKAGE_PHP_SAPI_FPM
 source "package/php/Config.ext"
 
 endif
+
+comment "php needs a toolchain w/ wchar"
+	depends on !BR2_BINFMT_FLAT
+	depends on !BR2_USE_WCHAR
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

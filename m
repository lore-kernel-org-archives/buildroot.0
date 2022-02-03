Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B2BC433F5
	for <buildroot@archiver.kernel.org>; Thu,  3 Feb 2022 22:49:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C4BD140A5B;
	Thu,  3 Feb 2022 22:49:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8g3B-KAmurL6; Thu,  3 Feb 2022 22:49:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BAFD64048D;
	Thu,  3 Feb 2022 22:49:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 467BE1BF33B
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 22:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 34F36408B7
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 22:49:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kBy1JsQzKvqs for <buildroot@lists.busybox.net>;
 Thu,  3 Feb 2022 22:49:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4D6514088E
 for <buildroot@buildroot.org>; Thu,  3 Feb 2022 22:49:13 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 bg21-20020a05600c3c9500b0035283e7a012so2768956wmb.0
 for <buildroot@buildroot.org>; Thu, 03 Feb 2022 14:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oKwhwrPGFTVV4cdICMldmPE1nZYrbpfDKRXkHEH81Ns=;
 b=pxygRgT4//TEUoIteDbmfKhs8ZOIZWflpywcKOkM/hZo6xhR5ddtDk2Vv1QPL20me4
 RIWeMFxVsOKakPZwqYBOBJ8z9Nsd+NforMPdwLm3DSk0Jjjx3i16RsboCmPP9xoXa40A
 HINBrW2EX+o8hvRqLEPCNq8ln8KlrwPUCFjtjq/z/m+dYg5Vfw1wCSUyYhJMHCOkIsmQ
 3cQSS4VWf8kGcVnBmb8HWa6lcz3MyHUo2QTpYYo9OJwqZR310NthaXWTslXXFqg32BPO
 aBBAq6MXRfoquHpWucavqHYLSIRIKafEHmYO0rr4Z+COJBWDVUsMXNbjoyJztQZNiGM2
 ocwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oKwhwrPGFTVV4cdICMldmPE1nZYrbpfDKRXkHEH81Ns=;
 b=0ghBhXEyCHwlJz0//hsG7G77VFUIhvVQ00C9KzAl7S3Y7wXaIannw0WPBSOy6DFYZG
 7O/FBeV0MOJJaEHngJl80aSDKJRRusy665VuOayWMYFr5j9s4BpFF7jLik5PsZvOFBBm
 592SxHY6oX169fPFTXNX7nh37BtqPj6rJCK+YTLwlNCT02HYbzT+SI/untoT9RzYNEY8
 1jcRSbYOnELftytwyYCsL38hCzAecQYN43moFrl3QgCXFQcUS7K2FGqjrJwfNTc/yiKl
 71cUGXLGzk3KtSSWzoJ4Szb0Obd+kuPuGlErdUsjXaDr2oSwgUqlfIVXaUQ7iPigVSeY
 dPBw==
X-Gm-Message-State: AOAM531FsViqLAg8tfZnZ3ONMLwxdbElVq4/wtNAsM437lZzs13kvkx8
 p2LpQEHyBrM4JDEBLpB+z9V5sAlILGk=
X-Google-Smtp-Source: ABdhPJy7YK/qcL9UWrHZ+hgx5fESfOVTF+nLSu0YreYI25tEYSwlNXshRKgKlzwnntnVweDaTqS0uw==
X-Received: by 2002:a05:600c:38a:: with SMTP id
 w10mr12290897wmd.12.1643928551398; 
 Thu, 03 Feb 2022 14:49:11 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id b11sm8418779wmq.46.2022.02.03.14.49.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 14:49:11 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Feb 2022 23:47:09 +0100
Message-Id: <20220203224709.736830-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/speexdsp: use snapshot tarball
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use snapshot tarball so SPEEXDSP_VERSION will match what is returned by
https://release-monitoring.org

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/speexdsp/speexdsp.hash | 2 +-
 package/speexdsp/speexdsp.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/speexdsp/speexdsp.hash b/package/speexdsp/speexdsp.hash
index fd9870dc58..82e054d4d4 100644
--- a/package/speexdsp/speexdsp.hash
+++ b/package/speexdsp/speexdsp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c92c7e428cb5ca11b4e6f13118ff288332f330b6fefc93cb39bf7b43b13cb1f7  speexdsp-SpeexDSP-1.2.0-br1.tar.gz
+sha256  0fe0e31be215f820bed0f9c913c673997773fce3a03a4555658e7b73a54eed7b  speexdsp-SpeexDSP-1.2.0.tar.bz2
 sha256  671bb5d8fd3c6b05a2e831d90f978ac27965c92bd8ea6d16b3df76e3440c0e9f  COPYING
diff --git a/package/speexdsp/speexdsp.mk b/package/speexdsp/speexdsp.mk
index 35c06dd833..8e886b2b21 100644
--- a/package/speexdsp/speexdsp.mk
+++ b/package/speexdsp/speexdsp.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-SPEEXDSP_VERSION = SpeexDSP-1.2.0
-SPEEXDSP_SITE = https://gitlab.xiph.org/xiph/speexdsp.git
-SPEEXDSP_SITE_METHOD = git
+SPEEXDSP_VERSION = 1.2.0
+SPEEXDSP_SOURCE = speexdsp-SpeexDSP-$(SPEEXDSP_VERSION).tar.bz2
+SPEEXDSP_SITE = https://gitlab.xiph.org/xiph/speexdsp/-/archive/SpeexDSP-$(SPEEXDSP_VERSION)
 SPEEXDSP_LICENSE = BSD-3-Clause
 SPEEXDSP_LICENSE_FILES = COPYING
 SPEEXDSP_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <SRS0=zrjq=MX=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A98AEC4338F
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 20:22:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DE6E60F56
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 20:22:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4DE6E60F56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 103304010B;
	Sat, 31 Jul 2021 20:22:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C7ICCy_lR6Py; Sat, 31 Jul 2021 20:22:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1344140240;
	Sat, 31 Jul 2021 20:22:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4C7E71BF34F
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 20:22:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 48A5040415
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 20:22:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UqZxJhHxDMdF for <buildroot@lists.busybox.net>;
 Sat, 31 Jul 2021 20:22:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4FEBB40411
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 20:22:51 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 k38-20020a05600c1ca6b029025af5e0f38bso214179wms.5
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 13:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4Mjg9R1OQTtvLY114afEbqTmc6xeH55ylegiEoyd1+c=;
 b=Hx0ZYGAEQeaIAR0K0dcN0joR0/vdq3uHKJ7pQ13uIrSloZbnPmOB2fPHwsGGS6yPUQ
 OU2AXdLzEjfScCamULaz2sv+xhbYiGRpyIj0DMPM6ZVh6d7qI860+yeB3eWXe0x/JYvB
 Np4YSOINtXRRJBWYW/TPeshs63XCG70bo3E9E7/wNn7/yPXmqSpLHYWh01/V/DMICHrA
 d96NFhtCYbRoYcUKxbOTj55P0KjxxHpNWinQVzhiU1KkEHOps2sseciDGRFBugqvQGfk
 Vx5YWo2JEN63ZqFbU5LIZ3QgQ6MdPqf+1F62UIGCaBBhoZUzUnA4gbLNKrUYuFb6/L/P
 WDJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4Mjg9R1OQTtvLY114afEbqTmc6xeH55ylegiEoyd1+c=;
 b=fnjRC4sbQ8dW2/1wJTuX7dOj/K/yD5U4reOtOjSZxOBG0+/mxm1q7WgQlUG8trjq+E
 K/PbHDCT/8LjCyApQ30CDN70C0pWUULVEp6gIdtrPRb3qmzBrhWaOcO00ngiTLZaqYEc
 rjSqjnc7C6lSwYir/57XSGbhnsRebMtLUPR77ht+unGPEcSuiKr3pPyQG0P5JH+Gi/q4
 kfwTo8T/A7UxVIej7rEl90qaO5S4iavEDXoabhYMiU4BiquyfnLvrbWj6JsF63PeijJt
 MAME+wZRzhF5BHGGEqSkCrAPnC7KG5dfbW1mIZ9fmenXwWNDeZwTz4eXEkmicS2NN14t
 FkhQ==
X-Gm-Message-State: AOAM533Wdyk5nNopAfGbN5G88ex9xz6fIDpwNvklTF6umzaIXJIip5h/
 m7dOsalV0VPaeqz3g2scbuZVvdhV0n2eGg==
X-Google-Smtp-Source: ABdhPJytAyWbYypD3A17W7YZfMZ7vvQHoJsFPp0h/NxXqBMjWltO0URca+wc21R55SgNWcwskQgZ4g==
X-Received: by 2002:a05:600c:b46:: with SMTP id
 k6mr9415502wmr.134.1627762969085; 
 Sat, 31 Jul 2021 13:22:49 -0700 (PDT)
Received: from kali.home (pop.92-184-116-174.mobile.abo.orange.fr.
 [92.184.116.174])
 by smtp.gmail.com with ESMTPSA id b15sm6079090wrx.73.2021.07.31.13.22.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Jul 2021 13:22:48 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Jul 2021 22:22:39 +0200
Message-Id: <20210731202239.1289121-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pkcs11-helper: bump to version 1.27
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

https://github.com/OpenSC/pkcs11-helper/releases/tag/pkcs11-helper-1.27

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pkcs11-helper/pkcs11-helper.hash | 2 +-
 package/pkcs11-helper/pkcs11-helper.mk   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/pkcs11-helper/pkcs11-helper.hash b/package/pkcs11-helper/pkcs11-helper.hash
index 276ed2e221..d707bcf914 100644
--- a/package/pkcs11-helper/pkcs11-helper.hash
+++ b/package/pkcs11-helper/pkcs11-helper.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  e5e2eefeda6c3db3d8862b42b180a6a5b2f41285f35b0ad0d622c6767683fd84  pkcs11-helper-1.26.tar.gz
+sha256  653730f0c561bbf5941754c0783976113589b2dc64a0661c908dc878bfa4e58b  pkcs11-helper-1.27.0.tar.bz2
 sha256  808705ac1daafe07a76431929575c5712a8693977a39ec9102aed25f030754d9  COPYING
 sha256  865496cf23a6c792739ff2f9ea11e95ac99db89cfe3780a295b4e1495a9c19fe  COPYING.BSD
 sha256  cd2e7d63a11058f19c58b06fb8c759140ce70788369dce6e6e9db40d3475021e  COPYING.GPL
diff --git a/package/pkcs11-helper/pkcs11-helper.mk b/package/pkcs11-helper/pkcs11-helper.mk
index a651be98bb..805e000759 100644
--- a/package/pkcs11-helper/pkcs11-helper.mk
+++ b/package/pkcs11-helper/pkcs11-helper.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-PKCS11_HELPER_VERSION = 1.26
-PKCS11_HELPER_SITE = $(call github,OpenSC,pkcs11-helper,pkcs11-helper-$(PKCS11_HELPER_VERSION))
+PKCS11_HELPER_VERSION = 1.27
+PKCS11_HELPER_SOURCE = pkcs11-helper-$(PKCS11_HELPER_VERSION).0.tar.bz2
+PKCS11_HELPER_SITE = https://github.com/OpenSC/pkcs11-helper/releases/download/pkcs11-helper-$(PKCS11_HELPER_VERSION)
 PKCS11_HELPER_LICENSE = GPL-2.0 or BSD-3-Clause
 PKCS11_HELPER_LICENSE_FILES = COPYING COPYING.BSD COPYING.GPL
 PKCS11_HELPER_DEPENDENCIES = host-pkgconf
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

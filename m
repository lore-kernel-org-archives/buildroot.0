Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F2D1C433F5
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 21:52:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1ABF408C1;
	Fri, 28 Jan 2022 21:52:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xnNcg0cNRhqM; Fri, 28 Jan 2022 21:52:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3870A408BE;
	Fri, 28 Jan 2022 21:52:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ABA7C1BF345
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 21:52:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A2BC60D4B
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 21:52:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TYvfU5n_USc7 for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 21:52:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A3C2C60C24
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 21:52:10 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 i187-20020a1c3bc4000000b0034d2ed1be2aso9106688wma.1
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 13:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=07cPAGuR8+zpwBMao7wKYDUIzsivKEEsdM1CC48r0gk=;
 b=ZYng+Lqe7UWmw5zU2POnZjtPXbElTPwA6EtO+82i9dIP7YXMaUBunAYFDl2lNteDb4
 fNtFClRe7aMSySrBl2C7aiQbc/j9aiwPzvSD13YqquGsNGl3Pm/kKEj1kOtPZYX9Q4YZ
 qfd0qa9t6VB6P+hMqBGkVolGsZs5R/N7ecbgFfzupjKJhhf5ta5SVMVwQ2pmXeltOaIr
 MvDP8XbApeGao0XS+cT52ln3bDknWO8pZzgfr6y4Luip665jvGMliZ5QdQCsPZXcDive
 5/3e3djMs1velwZVu787fio2OimH63W36dpuehsinJ8RAp7mkfVvQvMfRSDLWGT9RTIV
 20kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=07cPAGuR8+zpwBMao7wKYDUIzsivKEEsdM1CC48r0gk=;
 b=DKptKRCfWDBWDfEpnRlm5nd+WRCdMrkybOnZjLF9iHc7XF637bqRuLwVZaXNmKqCNU
 eV6J0cDYF+coBcXs1xSuR63XkuKUuvywMjZkBn9aRQna9UBo2+YCOlyk/UnuML+nAO1t
 +gSF6A5dcBqGRlsw3YobWzn5ESsVrGNmliQEyu3cmANmCJUiIeLuIY7Q7mrofEDv1zD6
 BpRF4/SklXfuQfuYUfKDziXhUYzemXW7Pw3v0jcTfmZeVxGXkEw8KXk2m7mtemxZdrYe
 Ru/TxAxCbVcG3g2022pA4AOKkOiVvInYMCJ4c4jhzWUXhPyin9Q+HeMv8B1QI6jpt2U9
 oT3g==
X-Gm-Message-State: AOAM533WKh+vWgOtCGR5TlPdV8ccTPEnbqWqSwuvjoODFwNOLKfi2ObS
 K6Izy9U+d5o/5LLvhkOEgFDyFjuDB0Y=
X-Google-Smtp-Source: ABdhPJxwXNAwxxg0EbuAfj4f2zeDi/r1avdnxMBNKrJgCyvxr1WwmGwNhq3CAvNk8+30nrPe9oqfCQ==
X-Received: by 2002:a1c:5401:: with SMTP id i1mr11832859wmb.169.1643406728658; 
 Fri, 28 Jan 2022 13:52:08 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id z1sm2783463wmk.32.2022.01.28.13.52.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 13:52:08 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 28 Jan 2022 22:50:12 +0100
Message-Id: <20220128215013.2997212-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/pkcs11-helper: drop autoreconf
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

autoreconf is not needed since commit
dbf8047f64f081ffbc97b67dd891690632377692 as the official tarball already
ships a configure file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pkcs11-helper/pkcs11-helper.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/pkcs11-helper/pkcs11-helper.mk b/package/pkcs11-helper/pkcs11-helper.mk
index 805e000759..90929404be 100644
--- a/package/pkcs11-helper/pkcs11-helper.mk
+++ b/package/pkcs11-helper/pkcs11-helper.mk
@@ -10,7 +10,6 @@ PKCS11_HELPER_SITE = https://github.com/OpenSC/pkcs11-helper/releases/download/p
 PKCS11_HELPER_LICENSE = GPL-2.0 or BSD-3-Clause
 PKCS11_HELPER_LICENSE_FILES = COPYING COPYING.BSD COPYING.GPL
 PKCS11_HELPER_DEPENDENCIES = host-pkgconf
-PKCS11_HELPER_AUTORECONF = YES
 PKCS11_HELPER_INSTALL_STAGING = YES
 
 PKCS11_HELPER_CONF_OPTS = \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

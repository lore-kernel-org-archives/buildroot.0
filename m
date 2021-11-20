Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 063DBC433EF
	for <buildroot@archiver.kernel.org>; Sat, 20 Nov 2021 11:38:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 940E040386;
	Sat, 20 Nov 2021 11:38:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KYZZ3Xy9lalO; Sat, 20 Nov 2021 11:38:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA8D0402EC;
	Sat, 20 Nov 2021 11:38:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 869FA1BF28D
 for <buildroot@lists.busybox.net>; Sat, 20 Nov 2021 11:38:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6784B60706
 for <buildroot@lists.busybox.net>; Sat, 20 Nov 2021 11:38:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kjFluVLe_114 for <buildroot@lists.busybox.net>;
 Sat, 20 Nov 2021 11:38:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7EC516058D
 for <buildroot@buildroot.org>; Sat, 20 Nov 2021 11:38:05 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 g191-20020a1c9dc8000000b0032fbf912885so9496836wme.4
 for <buildroot@buildroot.org>; Sat, 20 Nov 2021 03:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cnUjsDKTdt43sRV73frKGNrXqNxMT2+jwWWINMO3uFQ=;
 b=Hlk/KofaMAJVFwjVRnVaP8LsRgyfacZ3LOjUoW1+pHtZDxTMzrO4BDOQiRqyD/jl1j
 PPCXsDILhojWOKuqCcpDM/WoKzb0alLpreozOVZCOwGm9IZclwvnx90K9VQ4WlEcnZmJ
 //6VwMv2UE8CxEYi8FArVIfPfAWtnB9/TM5cu1I/KbxHWz0IV1R0VrLKHZpH/4CecfyA
 0jpXaY90AwneXZ3yN6g9GJJBAxGEc7lbQ6S8AtvkP47A8pJucvPWw1QzVtdqfyWcMQbh
 V5L4n8uTDBbHYQv6igbe9ctVyzCk96jrxzMu88+EGsHAUWVysUX4SFI71HeppHjmmnTs
 qD8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cnUjsDKTdt43sRV73frKGNrXqNxMT2+jwWWINMO3uFQ=;
 b=XGL9S/QuHn0V7Ryo8MjQa941Fr94uTqutZ87wvTXTlOXWU5YxkkpTmgvgNYga0Vrve
 0x7gaK5ou2MFiRoDIV8j5PdkMfREEFW1ltmCeXFaIfDcrz5Oa87/2Rc8MI4wY8xyZwzm
 mHmMcchv52Eta3yCnruCEg/TU0Qbg+PACvjgq3qgFqNctFxnq0iXNaK2M/Y16wvjdDim
 8DPFFPQlz5AF2Z1OVBGUBW81alQwpGJKcbU3buhgrM4DLAOiRh+32b8nyzV28+Xa8H+V
 1LawCCCNiS9VoCXXHFbj34IyahqprhCigBrik6yUrtQifV2fl1mUbQXlQsbj3J3bYRIs
 xPAg==
X-Gm-Message-State: AOAM532Er/Dqjn2PMCc2qkX865qzRjEO+7D0RENKmuMRICvu1zIGhdC2
 SHNzQeRxHsMOme+StVoVG4v6KFficTM=
X-Google-Smtp-Source: ABdhPJwPoSywanAGhr+vx1Ut662b8eI8jwyPMjHVfYe3CK4ck0kW4DUitI0XMm1HHyixfk1bA23BGg==
X-Received: by 2002:a05:600c:4ed2:: with SMTP id
 g18mr8952905wmq.18.1637408283334; 
 Sat, 20 Nov 2021 03:38:03 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id h1sm2638439wmb.7.2021.11.20.03.38.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Nov 2021 03:38:03 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 20 Nov 2021 12:35:49 +0100
Message-Id: <20211120113549.2887418-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/glorytun: replace BSD-2-clause by
 BSD-2-Clause
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
Cc: =?UTF-8?q?Adrien=20Gallou=C3=ABt?= <adrien@gallouet.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/glorytun/glorytun.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/glorytun/glorytun.mk b/package/glorytun/glorytun.mk
index d128ae835d..389c7a07e4 100644
--- a/package/glorytun/glorytun.mk
+++ b/package/glorytun/glorytun.mk
@@ -7,7 +7,7 @@
 GLORYTUN_VERSION = 0.3.4
 GLORYTUN_SITE = https://github.com/angt/glorytun/releases/download/v$(GLORYTUN_VERSION)
 GLORYTUN_DEPENDENCIES = libsodium host-pkgconf
-GLORYTUN_LICENSE = BSD-2-clause
+GLORYTUN_LICENSE = BSD-2-Clause
 GLORYTUN_LICENSE_FILES = LICENSE
 
 $(eval $(autotools-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

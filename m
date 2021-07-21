Return-Path: <SRS0=q2PD=MN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C85FC6377A
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 22:26:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC0EE61244
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 22:26:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC0EE61244
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9EA60400E1;
	Wed, 21 Jul 2021 22:26:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NLyZRIoDzu5K; Wed, 21 Jul 2021 22:26:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 14EA240146;
	Wed, 21 Jul 2021 22:26:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 53A131BF3D4
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 22:26:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 43A57606E5
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 22:26:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1T-Lfe4TiTWM for <buildroot@lists.busybox.net>;
 Wed, 21 Jul 2021 22:26:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E70166062A
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 22:26:21 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id c12so3771145wrt.3
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 15:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yT8X7TJDH2sqzC5a1qcKVNkhZwmi88x4IFGEbL1wGLU=;
 b=aYGcrggkZNhA8U5L/bZH8NTOdVIHGyN9lJUagNwj+PkONkR7sqppF/fUD+XEN5Rtzm
 AELg4cB24RpYxvkAii1rbwGWv6AxQgmyJJrEWGak8zGMyNvbArZGvmsBH1fCccVfx5PS
 J5SmjrNJDc1g97RU/cLj4PdWDJEJbx0PblDhId/TgztzMVG6t8dyCtb/oCCwJQ4D22eA
 YNFrTdnfpbVrQ4sqrG/mPJ4qvAfqVE+X2MK4px9sm0qYnvZFZW77TXwH1VaijdWfeElN
 a6OkwMPUTxezD31erlloCj1vGf/LJ9+2rLMrJfaQKEmKf/4rsoI565slzyZQ1E7/WgUy
 Cenw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yT8X7TJDH2sqzC5a1qcKVNkhZwmi88x4IFGEbL1wGLU=;
 b=I8dRRJxbOkU2rOvLwhcXRYaaN8ZYPJ7M3GSsh+iQDWCFRtsZEMN7tJkS5zss8362DN
 fUdoGMYoZkb4EKj4SIlUF5IZkWZLEEIjbfeRc/JzU2M3we5dkV8K7QNKC+DqWJXxAegh
 E230MDv5zAEMdYTjbxclP04r84emHIag5QnmWnao2NJCmoC/aQrpsp0gs+g3CvBFQaKi
 ZBoP6R45cpQXabP2M6z4kOy/uRx03ZTha6evV8EW5IYnRkjWbZO9FfwaqR2LEF37RLxw
 kInu4b3/PoeVVaBn2w6CyoE1QT4d207mRzwIfL+ZaNUwl3Dla4EZs0X1JvNAX15tAP17
 AHig==
X-Gm-Message-State: AOAM533O47F0J0dgxpm5sW91TXc20tFQQErXDLYCY3yAnl6+AiZRvh6k
 E2z1sjjetvXZgL2xAaEr1Mby7Eg8OJAPnQ==
X-Google-Smtp-Source: ABdhPJw3LESRWNvOihdeiG8dZtFsX9j61x9SBZxPige0zNEsRnqZp2s57j9x1e1s7/fOky2jH9z3MQ==
X-Received: by 2002:a5d:6d88:: with SMTP id l8mr37042480wrs.301.1626906379970; 
 Wed, 21 Jul 2021 15:26:19 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id m4sm28448173wrs.14.2021.07.21.15.26.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 15:26:19 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 22 Jul 2021 00:26:14 +0200
Message-Id: <20210721222614.1168721-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/minidlna: add SELinux refpolicy
 module
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, Simon Dawson <spdawson@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SELinux support for minidlna is provided by the services/minidlna
refpolicy module.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/minidlna/minidlna.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/minidlna/minidlna.mk b/package/minidlna/minidlna.mk
index 86a2bb368d..adea200f4f 100644
--- a/package/minidlna/minidlna.mk
+++ b/package/minidlna/minidlna.mk
@@ -10,6 +10,7 @@ MINIDLNA_LICENSE = GPL-2.0, BSD-3-Clause
 MINIDLNA_LICENSE_FILES = COPYING LICENCE.miniupnpd
 MINIDLNA_CPE_ID_VENDOR = readymedia_project
 MINIDLNA_CPE_ID_PRODUCT = readymedia
+MINIDLNA_SELINUX_MODULES = minidlna
 
 MINIDLNA_DEPENDENCIES = \
 	$(TARGET_NLS_DEPENDENCIES) \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

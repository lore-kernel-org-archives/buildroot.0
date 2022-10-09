Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B35C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Oct 2022 21:23:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F62D8138D;
	Sun,  9 Oct 2022 21:23:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F62D8138D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9xVY_fNe_Me5; Sun,  9 Oct 2022 21:23:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D5F88136C;
	Sun,  9 Oct 2022 21:23:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D5F88136C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 17E781BF376
 for <buildroot@lists.busybox.net>; Sun,  9 Oct 2022 21:23:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7D7760E24
 for <buildroot@lists.busybox.net>; Sun,  9 Oct 2022 21:23:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7D7760E24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sh6Nm9clXdEb for <buildroot@lists.busybox.net>;
 Sun,  9 Oct 2022 21:23:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2CA560035
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F2CA560035
 for <buildroot@buildroot.org>; Sun,  9 Oct 2022 21:23:46 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id j16so14482461wrh.5
 for <buildroot@buildroot.org>; Sun, 09 Oct 2022 14:23:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xTUTsNpxfrHmp1wVQErWY+Rcvslj9fJJG8W3GeOyzCk=;
 b=R41Ew7zFPHIwx9FSxB7cJN+dO+WjN1McJX1fSylnZ2kk3E7QPZe9d6m2ht8/JYbGFc
 GanxbSuJ6BPJHV2OuxZpL8dG0G7ZkaAXFj0FQqMeGryTmNnlwbvp3uZmvpaTzOmm4Hdm
 ofQywYXhvrJN0xedWARs7pt9XrdLw1e56p5PTU/LWj7vuA7A/y7jc6IETWk2mY7Kibvo
 UQ1ITby2CKLDtZ16+P1FJQZMEFBQS2d31HNC/OxEstVChpU16+pIjaL1o+wRzUjXBWMO
 21mJS0oyh1NuDPpEgNstYFe9IYFN5lVxw1esg6tpm4M6REaEuwpq4ghNiGPtXSNZ6iHS
 PEdQ==
X-Gm-Message-State: ACrzQf3b8ZXRtoC8p8ZBiry67CuhvQAhGPAfR+afnPW9Iy2qnu4Ia8kW
 TLDZ9IedPzIK2VfeITV9+1dRvb+5xMs=
X-Google-Smtp-Source: AMsMyM4C0Azan5qnQCYCtZAevaCr0G9CWGvNQzE1I6onPRUBcu/BPD00KaODKVan13Pzf5GfSYd0tw==
X-Received: by 2002:a05:6000:16c3:b0:22e:c6fd:2676 with SMTP id
 h3-20020a05600016c300b0022ec6fd2676mr7810246wrf.141.1665350624770; 
 Sun, 09 Oct 2022 14:23:44 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 b7-20020a05600c4e0700b003a83ca67f73sm8947030wmq.3.2022.10.09.14.23.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Oct 2022 14:23:44 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  9 Oct 2022 23:23:41 +0200
Message-Id: <20221009212341.86425-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xTUTsNpxfrHmp1wVQErWY+Rcvslj9fJJG8W3GeOyzCk=;
 b=pgXrHemCbqWyA55Wb5OAxAbt6rTkQtgNQYmk6eU070s98wlaiUhvM2KEAR5EFKpozj
 64cXK8wPPbRowpb/F29/HyuDd3TSyaYk5Bv6xqxjHl6tyxGy7KBcRFoGyXKDimCIZCGv
 jAL5VX+eTtzlgoCvTe6Bojz5f57cEddmT7fSeBFa90WCwNzf6IJBgu/G+UNwcQbabl3q
 UOjIVVVqafRBREYqTHzgU1t64aIKuDIGb7aLyQrKxtohP+OYSwaoHSGhHYoL9Ie078cj
 YzPZL6j2cWEDC2pehYuDEk8wEULme7wKfXvWH7Rvfx3Y26dB7F44M1qemJP1/wz84Jnq
 CFJA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=pgXrHemC
Subject: [Buildroot] [PATCH 1/1] package/vim: security bump to version
 9.0.0709
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

- Fix CVE-2022-3234, CVE-2022-3235, CVE-2022-3256, CVE-2022-3278,
  CVE-2022-3296, CVE-2022-3297, CVE-2022-3324 and CVE-2022-3352
- Update hash of README.txt (Windows XP dropped with
  https://github.com/vim/vim/commit/27b53be3a6a340f1858bcd31233fe2efc86f8e15)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/vim/vim.hash | 4 ++--
 package/vim/vim.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/vim/vim.hash b/package/vim/vim.hash
index 0c6b720dd1..ef3bc46cdc 100644
--- a/package/vim/vim.hash
+++ b/package/vim/vim.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  b90063706a2a9ee234275e0dd4b71a11e24867c33203c432fd6e9799fdc3bff9  vim-9.0.0453.tar.gz
+sha256  f50ab9c023e7c276a61a7076c840d36254ce83691dba28af9ac5c513b6ace3b4  vim-9.0.0709.tar.gz
 sha256  0bcab3b635dd39208c42b496568d1e8171dad247cf3da5bab3d750c9d5883499  LICENSE
-sha256  4afae7c984ab1a4ccd0b474a695f316e7435ab6ed46537648af925c18835d853  README.txt
+sha256  de04910387a62ad4f9b36b91457c8d5ef32733ac5d768a128071b93f4821fcd1  README.txt
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index 3f1985f036..22c1eb91a8 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VIM_VERSION = 9.0.0453
+VIM_VERSION = 9.0.0709
 VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
 VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
 VIM_SUBDIR = src
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

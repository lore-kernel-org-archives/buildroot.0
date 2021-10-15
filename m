Return-Path: <SRS0=lKTV=PD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00741C433EF
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 05:58:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77C5E61181
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 05:58:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 77C5E61181
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22E4760823;
	Fri, 15 Oct 2021 05:58:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AGssjzzLN9SK; Fri, 15 Oct 2021 05:58:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76F0960780;
	Fri, 15 Oct 2021 05:58:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B332E1BF2FB
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 05:58:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A356A83B42
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 05:58:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ib0DVc96BWBR for <buildroot@lists.busybox.net>;
 Fri, 15 Oct 2021 05:58:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B74E883B41
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 05:58:06 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id r10so24343731wra.12
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 22:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mIkKjgBrgEHuAF78bEO7j1DmZfyWF2W3wu8pAlIiV4A=;
 b=XtciJ1AdNQFu2mHeVorWz2yixUvnbJQKwBTzUAjG7L+q6V6Rbc9QD9KNTnL26o8c/b
 RPxO3B3xrDwXdPg2adijbOcKG45aKgCbvfet0Eo8PCze6DNYpE8nLjY5UrMUl4otoGLx
 AvUeQhFaV+XslV11wwa+d/8R1BA2t74gO/YtXPIWN7Fj6kvByA/Ho8Ekz4tQeG8Fw0of
 JwTrz2bwavbIrOlIxL1mEQOJRtQ9AuBosL9S75MsfTJvQDoepMJ11rMtyemkDT3SwKuY
 YsAUDUzKKqRDWVSBO2cG8p96VZ48KKEu+4q8uWL/gDfUWt6B4KFuJOrwP/VI/ONulAxf
 tuPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mIkKjgBrgEHuAF78bEO7j1DmZfyWF2W3wu8pAlIiV4A=;
 b=7LEWrNx9pq+09uoy1zzkjaLDnCC4UlB/DP0IYKr9VJQbMUrDTYCUNzv5GHZWhSPS9l
 vc5fuvIF9irmCD81meZu3kT+9hyVaeW6C5qY9EYapxl0pOVU0Ilyg5HTglLIoMYc+S+U
 A5wE8SvswRrL9P0MKTriMSMD59ypiYaCRaiLO/XzMFvHpgEIlGe095y6KlBlVz+vME+J
 l7S6XBnhu9ZawCaFoo0TKWFXse7mMhY90AiAu+aprlR/3mnqINWKhVcmuQDzZWIAZ+m0
 YYpELQj38m9oULgDQv1RWbSs071dv9aJQm/TIZ6n1QKnTxi1/i5T+SdpL0gE+l++vGdw
 jifA==
X-Gm-Message-State: AOAM531bIhabgLmFKoKcYF5XKxcDzXW+OeycOCdjTZWnZH2lQJBSaQlQ
 CPtBvjBsa8rRvnS132nsPtiEg3OaNHk=
X-Google-Smtp-Source: ABdhPJw2yTnkrRuD9kuFWJDLT/mDEjIGrAK3OnNVX+e2v87qX+6FBePqKOwgJZFjeBZNou/lCf8t3g==
X-Received: by 2002:a05:6000:168d:: with SMTP id
 y13mr11897731wrd.172.1634277484748; 
 Thu, 14 Oct 2021 22:58:04 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id t21sm3708304wmi.19.2021.10.14.22.58.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 22:58:04 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 15 Oct 2021 07:56:41 +0200
Message-Id: <20211015055643.158071-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211015055643.158071-1-fontaine.fabrice@gmail.com>
References: <20211015055643.158071-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,
 2/4] package/python3-cryptography: drop package
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

python3-cryptography is not needed anymore now that python-cryptography
has a host variant

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../python-cryptography.mk                    |  1 -
 .../python3-cryptography.hash                 |  1 -
 .../python3-cryptography.mk                   | 24 -------------------
 3 files changed, 26 deletions(-)
 delete mode 120000 package/python3-cryptography/python3-cryptography.hash
 delete mode 100644 package/python3-cryptography/python3-cryptography.mk

diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index 1d903b03e9..e21b9db042 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -4,7 +4,6 @@
 #
 ################################################################################
 
-# Please keep in sync with package/python3-cryptography/python3-cryptography.mk
 PYTHON_CRYPTOGRAPHY_VERSION = 3.3.2
 PYTHON_CRYPTOGRAPHY_SOURCE = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
 PYTHON_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/d4/85/38715448253404186029c575d559879912eb8a1c5d16ad9f25d35f7c4f4c
diff --git a/package/python3-cryptography/python3-cryptography.hash b/package/python3-cryptography/python3-cryptography.hash
deleted file mode 120000
index 73fa25f572..0000000000
--- a/package/python3-cryptography/python3-cryptography.hash
+++ /dev/null
@@ -1 +0,0 @@
-../python-cryptography/python-cryptography.hash
\ No newline at end of file
diff --git a/package/python3-cryptography/python3-cryptography.mk b/package/python3-cryptography/python3-cryptography.mk
deleted file mode 100644
index 516864f315..0000000000
--- a/package/python3-cryptography/python3-cryptography.mk
+++ /dev/null
@@ -1,24 +0,0 @@
-################################################################################
-#
-# python3-cryptography
-#
-################################################################################
-
-# Please keep in sync with package/python-cryptography/python-cryptography.mk
-PYTHON3_CRYPTOGRAPHY_VERSION = 3.3.2
-PYTHON3_CRYPTOGRAPHY_SOURCE = cryptography-$(PYTHON3_CRYPTOGRAPHY_VERSION).tar.gz
-PYTHON3_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/d4/85/38715448253404186029c575d559879912eb8a1c5d16ad9f25d35f7c4f4c
-PYTHON3_CRYPTOGRAPHY_SETUP_TYPE = setuptools
-PYTHON3_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3-Clause
-PYTHON3_CRYPTOGRAPHY_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
-PYTHON3_CRYPTOGRAPHY_CPE_ID_VENDOR = cryptography_project
-PYTHON3_CRYPTOGRAPHY_CPE_ID_PRODUCT = cryptography
-HOST_PYTHON3_CRYPTOGRAPHY_DL_SUBDIR = python-cryptography
-HOST_PYTHON3_CRYPTOGRAPHY_NEEDS_HOST_PYTHON = python3
-HOST_PYTHON3_CRYPTOGRAPHY_DEPENDENCIES = \
-	host-openssl \
-	host-python3-cffi \
-	host-python3-pip \
-	host-python3-six
-
-$(eval $(host-python-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

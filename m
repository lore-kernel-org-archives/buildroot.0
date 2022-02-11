Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F59DC433F5
	for <buildroot@archiver.kernel.org>; Fri, 11 Feb 2022 20:35:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5D264171A;
	Fri, 11 Feb 2022 20:35:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9b7EXUWi1YUl; Fri, 11 Feb 2022 20:35:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45D1741718;
	Fri, 11 Feb 2022 20:35:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CE1071BF215
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 20:35:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BCAE3819D2
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 20:35:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NtAzr_oW8_hH for <buildroot@lists.busybox.net>;
 Fri, 11 Feb 2022 20:35:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A11FA8198A
 for <buildroot@buildroot.org>; Fri, 11 Feb 2022 20:35:19 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 az26-20020a05600c601a00b0037c078db59cso2572991wmb.4
 for <buildroot@buildroot.org>; Fri, 11 Feb 2022 12:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C3ZBc3Y+uNtb/TGaGFTd3coniACVeKKF3xqHJz8kt8I=;
 b=JAsg/XkRxDI2E7kIaFmAKQHqrezXRHhdL7vl6ke+Gbew/2LXPn2rLljY9W1giOWNUH
 6somNDyaWl5sWYN8WIFQ1J3YoxKtEJWKkf2nVcqepSHWvP1my7Wtsh/3WFMHGoy2Oylp
 GfgELymj8mmnlNZh6xTjMJ2ydu/z7GMxQq0W8oGERZYlWVuzoHv0t/uQVo4NzascgRT5
 xq1CD+mKl+viAVYhi6JP4+17u+OcLwNFMSI2rpeqJA8PajZjb2Vd5opuoMfSpCJ5nE6o
 2Ms82NyhyKITfjQONq9VWXcHdFeBWLFeriRwTmEaKzlhoE50AO1rJMG+MnaUVruDm/R2
 HUyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C3ZBc3Y+uNtb/TGaGFTd3coniACVeKKF3xqHJz8kt8I=;
 b=y/3N7RS6nKYnohEZ30vQOzvyn+Vxjalm6QeE4I9VSECXAPbTtg+I+Z14EL+sVKns+s
 hQdPs0EjAjHBSS+qPYaAdVS8kYd5WmLEKDfo/wgR+HbJepcAliNpRTPRbPx20/L9TENq
 7R9NTyNF3j+vkBqu0tJ/PHpIyd2IBTvOwkJM0Yas1JVayTTCyvPPDvLsIci1tQK3Dssb
 AEBSzJ8qp/vwczCv9snRL1fUh3u0n45IyZJ2ivV/quiDONnYDluCcASdc6pr3cPZEQ9q
 /+duw2SNLjBKsdms4/UDDIOEWA8FfblUYX/SmY2Gwh55b5JJExyQsz0lvESKNX7ERs8F
 hGJA==
X-Gm-Message-State: AOAM533pJDDSrwObVG05dZP0T4BUWNtizfbWy0fg/lcuLhRGuPKKcoAa
 OlkUAZ9mp3yNFA++cnmM2ze1OUJ1lXU=
X-Google-Smtp-Source: ABdhPJxzMrvrZCMQC1gcDpdAMmPJ5Zc32qTsb9XuRrxxfQuUoZICFY7QLQNB2c9/81bxMs21wJ7vwA==
X-Received: by 2002:a05:600c:502c:: with SMTP id
 n44mr1753372wmr.152.1644611717623; 
 Fri, 11 Feb 2022 12:35:17 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id d14sm6521905wri.93.2022.02.11.12.35.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 12:35:17 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 11 Feb 2022 21:35:44 +0100
Message-Id: <20220211203544.603682-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-pyrex: drop package
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

Drop package which is not used by anyone and can't be built since drop
of host-python in commit 2743ce00ca61fde1537b64a165a69d497052be58

Fixes:
 - No autobuilder failures (yet)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 DEVELOPERS                             |  1 -
 package/python-pyrex/python-pyrex.hash |  3 ---
 package/python-pyrex/python-pyrex.mk   | 15 ---------------
 3 files changed, 19 deletions(-)
 delete mode 100644 package/python-pyrex/python-pyrex.hash
 delete mode 100644 package/python-pyrex/python-pyrex.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 0e759bc168..eb073c41f1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1934,7 +1934,6 @@ F:	package/python-ipy/
 F:	package/python-iwlib/
 F:	package/python-posix-ipc/
 F:	package/python-pycairo/
-F:	package/python-pyrex/
 F:	package/python-pysftp/
 F:	package/python-tinyrpc/
 F:	package/python-txdbus/
diff --git a/package/python-pyrex/python-pyrex.hash b/package/python-pyrex/python-pyrex.hash
deleted file mode 100644
index e8963558fc..0000000000
--- a/package/python-pyrex/python-pyrex.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  5f87df06831d0b3412eb4bc9d3fc2ee7bfae1b913d7da8c23ab2bf5699fb6b50  Pyrex-0.9.9.tar.gz
-sha256  5c1aec55fc8c399ec23968ddb2117eec8f7a53f002c15472a8b0aa7426790700  LICENSE.txt
diff --git a/package/python-pyrex/python-pyrex.mk b/package/python-pyrex/python-pyrex.mk
deleted file mode 100644
index 6284a5f228..0000000000
--- a/package/python-pyrex/python-pyrex.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# python-pyrex
-#
-################################################################################
-
-PYTHON_PYREX_VERSION = 0.9.9
-PYTHON_PYREX_SOURCE = Pyrex-$(PYTHON_PYREX_VERSION).tar.gz
-PYTHON_PYREX_SITE = http://www.cosc.canterbury.ac.nz/greg.ewing/python/Pyrex
-PYTHON_PYREX_LICENSE = Apache-2.0
-PYTHON_PYREX_LICENSE_FILES = LICENSE.txt
-PYTHON_PYREX_SETUP_TYPE = distutils
-HOST_PYTHON_PYREX_NEEDS_HOST_PYTHON = python2
-
-$(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

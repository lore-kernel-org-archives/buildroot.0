Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 996DFC5DF62
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 20:39:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44F6460FC6;
	Wed, 26 Jan 2022 20:39:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4cyRbncJuy2r; Wed, 26 Jan 2022 20:39:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8ACEC60F9F;
	Wed, 26 Jan 2022 20:39:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 876F41BF5A0
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 20:39:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 75C24404CF
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 20:39:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1jB95SXhxWGe for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 20:39:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B5679400B0
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 20:39:18 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id u15so1080793wrt.3
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 12:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Pm2BLYorLizGI0MlQ+e5P7Dvgy/dIZV7c/JnJ7eJQWg=;
 b=OFahS0ayCQZ9OuKn2UyElj6xmImZnAYCMRjufDYIIxM0T+/Zn4VwuMZAlOz37JknbX
 X8NfYsH85+vUYMTOXQXBqGlS0TOG8xnUvCCcaxVNODTPVuZ8DPh3J4PfRIea8IZZ3BRZ
 Y2szEmiWhFDlFt7YwTnZS68LYtkflry/U6XJ5hLFjoGIQUZNv56WxDhud1W9dIzYrQpR
 57EH1DO3uKCPP0pB98pIPIlgX7tjF159dDisG6pAQm/m0E/Ebm5o1cbp3by8dxjkptMt
 kpfHOjWz7swr8+RBRWovR7exGFTz1amobu0vSFTPqkgGd/5v25Swmw6rzq0DlIojBmQX
 um+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Pm2BLYorLizGI0MlQ+e5P7Dvgy/dIZV7c/JnJ7eJQWg=;
 b=tTZW1Y5T9SvtY995mUq/yMdsmDB+7CzUmigSx2RATGMSZSnEL+9BJ0gEnwAhKO5VVp
 fHCpZjyofyRlWfKDNRQMsGhbWqpgaESjprEfnVVsHoRWarCRjwIlzZT/3yc6d5vLtkJj
 EdAVH6BoNbUJjfGxGvqJ2KW1zKrXneO8Hcrlw43OmS8wJTxxfSfOebb2qcg7o2TIZEmF
 5vl+e7Bre+ovm2eUx4/x4XKUPg6McIPobPJZ6fuI43LiV67VcOzwEnaJSwdmytcJ/s28
 v70bXy065tYfW31hmvkWUX8ralx0sLRPO/ALb43ROyGsjMCHkmouFmxltl4H/mpV/uE4
 adjw==
X-Gm-Message-State: AOAM530KwZP2tlOUcMSQq+EianPYgCErYzmKjy4O/HBEmtprtgP+VnFg
 4K4WxMgAWF4ca3Qx3wjx4SqvyzHMy9k=
X-Google-Smtp-Source: ABdhPJx9rDEWJsxprfdHEwoN11kb86UeWBpAyG7F4P0S7cuYBMX8B52eOrZ4sC8vsQTOiRvDhmAwpA==
X-Received: by 2002:adf:ded0:: with SMTP id i16mr312736wrn.64.1643229556312;
 Wed, 26 Jan 2022 12:39:16 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id l6sm330282wrs.51.2022.01.26.12.39.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 12:39:15 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 26 Jan 2022 21:37:33 +0100
Message-Id: <20220126203733.1531511-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/vim: security bump to version
 8.2.4224
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

Fix CVE-2022-0261: Heap-based Buffer Overflow in GitHub repository
vim/vim prior to 8.2.4120

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/vim/vim.hash | 2 +-
 package/vim/vim.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vim/vim.hash b/package/vim/vim.hash
index fff5072063..49056b31cd 100644
--- a/package/vim/vim.hash
+++ b/package/vim/vim.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  2464110940c3d8d53bfef6d16912653c85187132fc0f87e937a382cafc4c6370  vim-8.2.4092.tar.gz
+sha256  8770c6308a6c0b0f8b93a4d7202451d195b4efad17787c0306f0be60947732c4  vim-8.2.4224.tar.gz
 sha256  0bcab3b635dd39208c42b496568d1e8171dad247cf3da5bab3d750c9d5883499  LICENSE
 sha256  96970b67f9cb38b0e759946cff22562a3c4b11ce78f62f2117d5e7ecded9ab4d  README.txt
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index 408b33a409..74ab1ec584 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VIM_VERSION = 8.2.4092
+VIM_VERSION = 8.2.4224
 VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
 VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
 VIM_SUBDIR = src
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

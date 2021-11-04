Return-Path: <SRS0=01xH=PX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 662BCC433F5
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 09:46:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 038A6610E7
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 09:46:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 038A6610E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83E61400D4;
	Thu,  4 Nov 2021 09:46:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id reVfVSRhTfGI; Thu,  4 Nov 2021 09:46:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C75040105;
	Thu,  4 Nov 2021 09:46:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1D0701BF2FA
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 09:46:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0BC70605E2
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 09:46:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bLjXwrZ1VRHs for <buildroot@lists.busybox.net>;
 Thu,  4 Nov 2021 09:46:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 16A16605DF
 for <buildroot@buildroot.org>; Thu,  4 Nov 2021 09:46:31 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id v127so4031026wme.5
 for <buildroot@buildroot.org>; Thu, 04 Nov 2021 02:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=viZRXHPvzpldhq4BMDpr4mzBJbrcDck38wmcQWNLkmM=;
 b=X8I9tW8HlUeXvqbDE60VIdtF4yugkvBF0Fug+LTTKjXVfr2u54WfhSiKkd4NwDEu0m
 +vfrDWF3MTF5gY2Fh+KqbhVLwJOdvjAsoVZa3SciEn2LUhnLvJaxAMARDmwriafBWJVP
 kRPkRRwMAvPxZIbBqAQMcIHryszcr3XXW9Y+AwJNoCLA9SYRUi8inbKBgSe+b9tHxz++
 uPE6PJc/jStBaO953uAcUkONsg9SJ9weTOFBH0BgnpzgbCgDwaNfSA9fZKqtmKeEG9VB
 KscCaUEaKsRgBDI+wR7LkbaViVWDD8blnpzgZdVh+qr+T+yHN44I/8O0dF3bZeZVN3w2
 JAhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=viZRXHPvzpldhq4BMDpr4mzBJbrcDck38wmcQWNLkmM=;
 b=thgI0jSUOCxwbh8LXFn4OfM3jfroH5LJTnSXj1pPPryszRDhAbAZ73bglMqeFLZ9Wx
 GVME8ixmytv8NmVBUimH/AgtFQPrzoHa7RimaQfs/TYkfAUUfaWFnea64jYmfF/BTqW4
 nrRFyGpB+GoIMzYhKHl9wJO7VCyFuBq30NO5sT49eLEptfCuhm5WYewYCMdUDz/wbahT
 djYjjqyXJ5LQE0Gxyo3qZVero0blbzxJn8bJNIGy4hza5FDRKyz37Yf4VqEjt8AWjOCw
 as9e1og+j3HBKgTOKjMPyk+oWZGLbRk/1oKu/cvg+jIG3P2layPasvQkaWq7B61NtePD
 5VEg==
X-Gm-Message-State: AOAM531wZ9lsntjudIXbHwEj3kuQoJHZdipMTxjcE2K0d7QR2wVDohbU
 39eLjagTLnNXHpY+VFZjoerC65xT1n8=
X-Google-Smtp-Source: ABdhPJy6ArE1XGu48Cds5I1bMBGxuGYIUoMjcPJDsHLv9Mru0k60J6rTO7Gev0Dln7Sl6CxpsPdAzg==
X-Received: by 2002:a1c:4b0b:: with SMTP id y11mr22324011wma.9.1636019188983; 
 Thu, 04 Nov 2021 02:46:28 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id q26sm4446068wrc.39.2021.11.04.02.46.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 02:46:28 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  4 Nov 2021 10:44:40 +0100
Message-Id: <20211104094440.879700-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libdbi-drivers: bump to
 0bfae6c43134cf58dc89364328545982ca297abb
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
Cc: =?UTF-8?q?Herv=C3=A9=20Codina?= <herve.codina@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump to 0bfae6c43134cf58dc89364328545982ca297abb to fix the following
build failure with postgresql raised since commit
f032973fc56ba4a73d95927384d2a5d185f2ddce which removed
https://sourceforge.net/p/libdbi-drivers/libdbi-drivers/ci/7a8e24ec1cf763226f4be31ba1018d888d4989f3

checking for MySQL support... no
checking for PostgreSQL support... yes
checking for pg_config... no

Fixes:
 - http://autobuild.buildroot.org/results/89f58005b3a4d50384803fe6f07ea3049935959c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libdbi-drivers/libdbi-drivers.hash | 2 +-
 package/libdbi-drivers/libdbi-drivers.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libdbi-drivers/libdbi-drivers.hash b/package/libdbi-drivers/libdbi-drivers.hash
index 38d66f90d1..b805bb0283 100644
--- a/package/libdbi-drivers/libdbi-drivers.hash
+++ b/package/libdbi-drivers/libdbi-drivers.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  564438dda6af59af8c66cda9fa378ce86b1393fd31a7b0f1ba98af641a34a428  libdbi-drivers-b0c7ac0ef2e733e858c9870139944eeaf7b66984-br1.tar.gz
+sha256  80a1befb044238a89b2d0dbd40881aa6c75bf99d3a7a6c016c657ea26df7792c  libdbi-drivers-0bfae6c43134cf58dc89364328545982ca297abb-br1.tar.gz
 sha256  5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509  COPYING
diff --git a/package/libdbi-drivers/libdbi-drivers.mk b/package/libdbi-drivers/libdbi-drivers.mk
index d86f32dafc..af8db79581 100644
--- a/package/libdbi-drivers/libdbi-drivers.mk
+++ b/package/libdbi-drivers/libdbi-drivers.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDBI_DRIVERS_VERSION = b0c7ac0ef2e733e858c9870139944eeaf7b66984
+LIBDBI_DRIVERS_VERSION = 0bfae6c43134cf58dc89364328545982ca297abb
 LIBDBI_DRIVERS_SITE = https://git.code.sf.net/p/libdbi-drivers/libdbi-drivers
 LIBDBI_DRIVERS_SITE_METHOD = git
 LIBDBI_DRIVERS_LICENSE = LGPL-2.1+
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

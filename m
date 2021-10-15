Return-Path: <SRS0=lKTV=PD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70584C433F5
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 16:53:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B43A561151
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 16:53:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B43A561151
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59107839DC;
	Fri, 15 Oct 2021 16:53:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G98FItCtweoE; Fri, 15 Oct 2021 16:53:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19BD683942;
	Fri, 15 Oct 2021 16:53:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EBD331BF8B4
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 16:53:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DBD8F607C2
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 16:53:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LKYeRs2tVGLn for <buildroot@lists.busybox.net>;
 Fri, 15 Oct 2021 16:53:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 51FC360717
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 16:53:02 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id o20so27612229wro.3
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 09:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TdvVsfUyH0ffEXyj2ZhWcwjmAjfNLtNWNAVYCQ2djrY=;
 b=HE7dqBK2QWrIV9InxR3bIsqGvH5KGA83tanynlttHfDYD86DKMkF1sNsapVvz+dQn5
 G8AgFS9uAQB2OycGyrSGDFWKfTVUQSyMrOyO1zyyxCj1+CTrfPInGL8I7aSnK+w9ZAW5
 kclB2z13X/eQn/RcCi+sAgmXAlsGVNUo8GLAR6gXHgUZ59nAHDsBsaODc7m+Tagi9MT7
 BGExOYMQogolRzTrLzzCrjVL4puZdp37s3BMDVKTZWP3UFqlUhestNWyaF0DV+ZlAtVl
 UNGK2ja1+zZ+oy4b6scJqhChldkkOxOsxUxjfPrVL16Fx1WKwfLFhrYi2qPI0gNG8Rc9
 TIJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TdvVsfUyH0ffEXyj2ZhWcwjmAjfNLtNWNAVYCQ2djrY=;
 b=J1+I60V6wTN/0v9VC2zaMupf2UBez14rbm81squl5EsoYrZ3TdGAB9Bp6ufygvi80r
 s0AZRcBmTmAnjIm3q6Snz5PIwZguSuBSW13BeeuXMusQkMeEsnUoFnuQBCdC8dK9OUlP
 xSoiWjFyvUZ3Ww40gnECW+mCmUfRqJ+6FwK3IS19qiUiNiE6nM5qR/mldtGCmpEWB6O4
 W9XJUj8KjhI1Si0FnqLj6A7rvvaky1BqajGsKP+ubMqM1QUGIBXRnlegyehzvfMDwjgo
 ujhO6N57461Fw/e5850yue9cxRIEz3rxMIrSp8OgSRc85u3sUNP+TsxoX3P9Pvkcvn0R
 JrdQ==
X-Gm-Message-State: AOAM530NjjlyJHQpfvDtBlEgMILDIBZ4iz+kXo0AMdaMIJQY0oeD+OAu
 vdeFJZ839jvC87W46HoO+pcD+3UZKyY=
X-Google-Smtp-Source: ABdhPJy8xIvT6Lw9prHRxqa8EgLMsn1yn1hriHtFmpSDgfypsXt7HUFSAjsBeGATlIZFt6IHK5EN9w==
X-Received: by 2002:adf:a78a:: with SMTP id j10mr15662008wrc.105.1634316779955; 
 Fri, 15 Oct 2021 09:52:59 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id f3sm10771349wmb.12.2021.10.15.09.52.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 09:52:59 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 15 Oct 2021 18:51:39 +0200
Message-Id: <20211015165139.1142080-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2, 1/1] package/libpam-nfc: bump to
 64a8b30ba2cfd634342ded8c096c7cfc5c8fa22a
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This bump will fix the following build failure raised since bump of
automake to version 1.16.4 in commit
fe90272b5128987ee7492fff950660e05324838d thanks to
https://github.com/nfc-tools/pam_nfc/commit/1b3d33c23f77c6f2a244f04f00f9140f8fa28155:

make[1]: Entering directory '/home/giuliobenetti/autobuild/run/instance-2/output-1/build/libpam-nfc-bb762e0e649195110e015ffb605c4375e927c437'
  CC       pam-nfc-add.o
  CCLD     pam-nfc-add
/home/giuliobenetti/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i686-buildroot-linux-uclibc/9.3.0/../../../../i686-buildroot-linux-uclibc/bin/ld: cannot find -lnfcauth

Fixes:
 - http://autobuild.buildroot.org/results/4f6018cb44770ea8fb9a9eb24c161239c2d04c27

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Bump version now that patch has been merged upstream

 package/libpam-nfc/libpam-nfc.hash | 2 +-
 package/libpam-nfc/libpam-nfc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libpam-nfc/libpam-nfc.hash b/package/libpam-nfc/libpam-nfc.hash
index 27896ef4b1..543db86960 100644
--- a/package/libpam-nfc/libpam-nfc.hash
+++ b/package/libpam-nfc/libpam-nfc.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  f44273944f1ecc78b10b65147328860836b60fe4bb8c39819e32199f2870d48b  libpam-nfc-bb762e0e649195110e015ffb605c4375e927c437.tar.gz
+sha256  042049cecaacd9274f444d69f756b9499eb2d2436136f576eef375531ac25157  libpam-nfc-64a8b30ba2cfd634342ded8c096c7cfc5c8fa22a.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/libpam-nfc/libpam-nfc.mk b/package/libpam-nfc/libpam-nfc.mk
index d4f6d446cf..7cf0a51e00 100644
--- a/package/libpam-nfc/libpam-nfc.mk
+++ b/package/libpam-nfc/libpam-nfc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPAM_NFC_VERSION = bb762e0e649195110e015ffb605c4375e927c437
+LIBPAM_NFC_VERSION = 64a8b30ba2cfd634342ded8c096c7cfc5c8fa22a
 LIBPAM_NFC_SITE = $(call github,nfc-tools,pam_nfc,$(LIBPAM_NFC_VERSION))
 LIBPAM_NFC_LICENSE = GPL-2.0
 LIBPAM_NFC_LICENSE_FILES = COPYING
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

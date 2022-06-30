Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD900C43334
	for <buildroot@archiver.kernel.org>; Thu, 30 Jun 2022 03:58:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4710A84035;
	Thu, 30 Jun 2022 03:58:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4710A84035
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L5vp16sx_x2S; Thu, 30 Jun 2022 03:58:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6511D83FAC;
	Thu, 30 Jun 2022 03:58:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6511D83FAC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8031B1BF9C2
 for <buildroot@lists.busybox.net>; Thu, 30 Jun 2022 03:58:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A25F404A8
 for <buildroot@lists.busybox.net>; Thu, 30 Jun 2022 03:58:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A25F404A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fq5yIYmRU3_W for <buildroot@lists.busybox.net>;
 Thu, 30 Jun 2022 03:58:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6EF67401F1
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6EF67401F1
 for <buildroot@buildroot.org>; Thu, 30 Jun 2022 03:58:38 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id
 c130-20020a1c3588000000b0039c6fd897b4so822611wma.4
 for <buildroot@buildroot.org>; Wed, 29 Jun 2022 20:58:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XqESrZvVqmX8IenfqEvMmock6OcVWb0QzuBJZQKHU8s=;
 b=kKABgaWumaPsnXTj7Qz4PFvj/4cQY5NF2tTUM9hj5pIzfY7DbbgXFdha/ZaSG1iRBy
 pjZzI7VT68yE70nKAjyyjEBbo92KqC4j6TCyEdX9qMMAucPOu5+O2Nm/a8Q5asYiEgkm
 ikMWljCKJbtyocuD4+hooqIu7Z+bwoBw0xY3ZyMT5B0NABc0t0EFUt3C+ZM0i7HQ1WtD
 RUCCLQT02azDaw+lVmAaUTr7UfwwJoxpcBENl/TBalrlOTJYLRUHQt+irmrMaFWGcU8I
 4ySS/oPPVmtmunMws4r3BZMWNYQ7eOGGnwkbRCT0iPAoPQdt4e4/INpQ7APNj2v8MNJM
 WiaA==
X-Gm-Message-State: AJIora9x0nd91drEZC8K8KmUdMtA8V7nhKyyDEbw2fXR4kWIYjrk7H5r
 ZaSgZnaqfIYi7xKwZJSFzmCPYGDGS7Y0rymF
X-Google-Smtp-Source: AGRyM1t7FNF1VmHwYTFn21UhbJsPDpNFuXzvI3wyjBAuthFZuRbfqIbFTUS/KhUisYrHuwQwjTQI5g==
X-Received: by 2002:a05:600c:3b0e:b0:3a0:3fb2:a464 with SMTP id
 m14-20020a05600c3b0e00b003a03fb2a464mr7408186wms.129.1656561516417; 
 Wed, 29 Jun 2022 20:58:36 -0700 (PDT)
Received: from smartcross-dev.lan ([185.217.109.52])
 by smtp.gmail.com with ESMTPSA id
 m32-20020a05600c3b2000b0039744bd664esm1164027wms.13.2022.06.29.20.58.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 20:58:36 -0700 (PDT)
From: SmartCross Developer <andreadaoud6@gmail.com>
X-Google-Original-From: SmartCross Developer <dev@smartcross.io>
To: buildroot@buildroot.org
Date: Thu, 30 Jun 2022 11:58:23 +0800
Message-Id: <20220630035823.3098231-1-dev@smartcross.io>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XqESrZvVqmX8IenfqEvMmock6OcVWb0QzuBJZQKHU8s=;
 b=XU2bf2ll4N2rEDvCMuS8aGjf+QmjlbxgnCWySWRHT2I48k6fmI/4TmkzjWuFXcA+zF
 PXupKxzujhSqFO/mRUQMs6+6UkyQu7b+Zvd24j5fxnrP56Lhxq3yVW58UEeMn0iziXh3
 RXwm/dsLoIS0QChy2v69GdiGwdkwIII3356Au9b25w/JWCuI09N44hUVzl2Q8qNxzAm0
 X67Vd74nTJ4IhjF4YvCt9nc0K8Iik5ZbLl8pews+y+AXpkMBIautweW08AJUA40OrzVu
 CeYwkCY5iFehdO9zm9W2iabiPyvo/ehITv+cEEltC9ep6Xju8Dv6zXu78X6rZOT4lFsu
 44hg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=XU2bf2ll
Subject: [Buildroot] [PATCH 1/1] package/bluez-alsa: bump to version 4.0.0
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
Cc: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Andrea Daoud <andreadaoud6@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Andrea Daoud <andreadaoud6@gmail.com>

Version 4.0.0 contains various changes and fixes, including LC3
support and dbus changes.

Signed-off-by: Andrea Daoud <andreadaoud6@gmail.com>
---
 package/bluez-alsa/bluez-alsa.hash | 2 +-
 package/bluez-alsa/bluez-alsa.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bluez-alsa/bluez-alsa.hash b/package/bluez-alsa/bluez-alsa.hash
index f6e7294681..a42ba46e70 100644
--- a/package/bluez-alsa/bluez-alsa.hash
+++ b/package/bluez-alsa/bluez-alsa.hash
@@ -1,3 +1,3 @@
 # Locally calculated:
-sha256  d9a878d9fd7f18842c9c8ed83bc96cab684753c90f2751d575a3cdd776ec78a5  bluez-alsa-3.1.0.tar.gz
+sha256  ce5e060e61669d61d44f5f9bad34a7b88378376e9d49d31482406a68127a6b29  bluez-alsa-4.0.0.tar.gz
 sha256  60253922a459245128c34eb379cbda7c76936636d4c10edc576663a0f560dd4d  LICENSE
diff --git a/package/bluez-alsa/bluez-alsa.mk b/package/bluez-alsa/bluez-alsa.mk
index f5e3aa1245..83dfce6177 100644
--- a/package/bluez-alsa/bluez-alsa.mk
+++ b/package/bluez-alsa/bluez-alsa.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BLUEZ_ALSA_VERSION = 3.1.0
+BLUEZ_ALSA_VERSION = 4.0.0
 BLUEZ_ALSA_SITE = $(call github,Arkq,bluez-alsa,v$(BLUEZ_ALSA_VERSION))
 BLUEZ_ALSA_LICENSE = MIT
 BLUEZ_ALSA_LICENSE_FILES = LICENSE
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

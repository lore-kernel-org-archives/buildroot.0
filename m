Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32270C433EF
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 19:58:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3EAE610A8
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 19:58:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C3EAE610A8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 899F660AD2;
	Wed,  3 Nov 2021 19:58:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fzHSnqgyQrth; Wed,  3 Nov 2021 19:58:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E57BC6063D;
	Wed,  3 Nov 2021 19:58:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E5C051BF3D1
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 19:58:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D3A1C401C0
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 19:58:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v2oKa5lWqsUE for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 19:58:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DCA0740146
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 19:58:12 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id v65so4271902ioe.5
 for <buildroot@buildroot.org>; Wed, 03 Nov 2021 12:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LJ38MzziyFxYo4/yxsthwCsLTUVLuHBAE6PH3yS2bCs=;
 b=a+IOgnL9XgJVUTiFmuNotj9N+0wqkYTom1J+njbw3jDxR+FDZu6cahOTOPCv0fOooB
 k7v/9xbDuDpfr0wuOQy8WUaLGX1FWAfUrq+dGX6TyqU/634PyZVBJUksP9afWbvn7/yK
 P+xviUGyEadGwoU19wx8MftUaRatMj3m/JuIk4a3w7y8c1Ko3aZe+S1Of0dfVaqg4QAC
 RmBqtdjNp56jOp5g0onqb9Z02AyUflW0a/wv4tS3tPmDCjLD/yKrPJe+BxBu/trWmcKE
 uxgTpH5wUZIyLvLEuLNuAGRQ8StyNDd2yx2/8PLZVCC40e8qt/TfdqA5gHZb66wJ7DoH
 cvVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LJ38MzziyFxYo4/yxsthwCsLTUVLuHBAE6PH3yS2bCs=;
 b=RsRhyiQA9GuTuNKqDy3igv2zsBvPEwSUUH6ESyAoNAgVjdLh/maDAdA1bZwUwdBgYY
 wUr1janWQJM/QoPWBYLYYkDqF0LvQ2oHAcqDz43C2u+qFHGuBpTVTbctSBkWvduH6Buy
 DPVfyNPYoVP0o6yVQdVZW95iFneis5LRIyUHwCPrCfjDOwZI5AqUW1XIJkWBErjn1YAQ
 JS0+mppJ2lUDbfyPTMTgfSXnP7o9jU8WLr6xc4vZVVHffWyio8qM94kGLAQZ15ZyoPQe
 LuvTcdZ7++0CL12y6nhNGF7vCCikaPyOmS0cdgC1cgFn4uYJ6QIyPt9oQUWBmL9BAPAt
 szWw==
X-Gm-Message-State: AOAM533x8V/SMIYI2VQwLASG37udfIkAUSs/kp7tiB7FgOIBnRJghrnK
 uW/Sq4H8qW3P88dwVv9KYrreJ3kZoBg=
X-Google-Smtp-Source: ABdhPJztbTmjmcX0BsxeTOQHtSFu4jTWjD1QB5UZMYdPvf3fU38CRX0sV265q9iK8Khq8Gf57Dz0Lw==
X-Received: by 2002:a05:6602:160c:: with SMTP id
 x12mr2848017iow.36.1635969491761; 
 Wed, 03 Nov 2021 12:58:11 -0700 (PDT)
Received: from james-x399.localdomain (71-218-115-49.hlrn.qwest.net.
 [71.218.115.49])
 by smtp.gmail.com with ESMTPSA id p2sm1465112ios.47.2021.11.03.12.58.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 12:58:11 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  3 Nov 2021 13:58:09 -0600
Message-Id: <20211103195809.3740664-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/meson: bump to version 0.60.1
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/meson/meson.hash | 4 ++--
 package/meson/meson.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index f3cfe66072..33b8676cc5 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/0.59.2/meson-0.59.2.tar.gz.asc
-sha256  13dee549a7ba758b7e33ce7719f28d1d337a98d10d378a4779ccc996f5a2fc49  meson-0.59.2.tar.gz
+# https://github.com/mesonbuild/meson/releases/download/0.60.1/meson-0.60.1.tar.gz.asc
+sha256  5add789c953d984b500858b2851ee3d7add0460cf1a6f852f0a721af17384e13  meson-0.60.1.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index bd03a7cd67..a8c846126a 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 0.59.2
+MESON_VERSION = 0.60.1
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80BEFC6FA83
	for <buildroot@archiver.kernel.org>; Tue, 27 Sep 2022 08:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04F756102F;
	Tue, 27 Sep 2022 08:10:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04F756102F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MniKnsNlHIIm; Tue, 27 Sep 2022 08:10:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3480461028;
	Tue, 27 Sep 2022 08:10:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3480461028
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 800821BF2EA
 for <buildroot@lists.busybox.net>; Tue, 27 Sep 2022 08:10:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 64B7B41719
 for <buildroot@lists.busybox.net>; Tue, 27 Sep 2022 08:10:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64B7B41719
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K60bA6Uxl0cv for <buildroot@lists.busybox.net>;
 Tue, 27 Sep 2022 08:10:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D678418D2
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2D678418D2
 for <buildroot@buildroot.org>; Tue, 27 Sep 2022 08:10:49 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id y141so7168952iof.5
 for <buildroot@buildroot.org>; Tue, 27 Sep 2022 01:10:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=js5Ceo6FkqRafKn49uVPJAEtYKJ16zvjya5ngBpghvM=;
 b=5MwhQLOpiCnEbT8VwJnUwllurS+mjPnYeUxjzxesm/1tkatz7fKoQ9jpk83t2M237i
 ajdVaqrZjj0gCY3wjFZ6AfpUgNztqYEIe0zm03nS1PKWgLk6gBHTjE/YR0ozQiHtyVDI
 T14RPkinxpDV8aOTNmm5p4S0+OX90tfweuJUB0SVVOCOMuyEuSPU9xc0QLcsNDVhkCPi
 qASCIcUq3iT7KDwE2rAgtKyrzoSpRv/cXV2TGdnk309Z8ThlUvAbLuJIpU3XSEr5X+G9
 g4Laf00syYcYEVa0cdx2ahoIMfGDFBBzFfyjeOgqeMclY+s36VrBtmZkkho9BHOX/79y
 uXAg==
X-Gm-Message-State: ACrzQf05kcszFP7VLX91IaFFhC0+YO0YrLHe7jd94wpmVwx2N/05//1H
 J0AP2HcMNCErlFfL5AscAPO96DWsoZiRbw==
X-Google-Smtp-Source: AMsMyM6a1MNQTD9avERL0W6WyOI8fvFlKvsOtp0XsCep1aP2eJ7fajbSzYB+pSK0h9NOkEFAOdKS4w==
X-Received: by 2002:a05:6638:2584:b0:349:edd4:4fed with SMTP id
 s4-20020a056638258400b00349edd44fedmr13438582jat.26.1664266247903; 
 Tue, 27 Sep 2022 01:10:47 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 n14-20020a92d9ce000000b002e11d365ccesm387042ilq.80.2022.09.27.01.10.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 01:10:47 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 27 Sep 2022 02:10:45 -0600
Message-Id: <20220927081045.1059596-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=js5Ceo6FkqRafKn49uVPJAEtYKJ16zvjya5ngBpghvM=;
 b=I7PCtSKY1Qr4b2HgTgjJ2NVACegtKxc0n2MjTNWH/UVVenDxq3n3p/KZX+5zc2aE3h
 FY+ZN+3es926WBCZVm5CFJZBXUKh9AwvEIFSMUwYcyUrscPw6EJwrAKpSREuXDYnDQ8o
 S2lwucTSjVZaTQKZMS9bq3KRw84nd6baYNbXcOsxrpVvac9wCewGfKaEwSWYsAGNewSM
 +vF8FyLGJeipp8EsWFRMIc4tvge7ete8mpGdGKIqEWivxoGKXGPOfRMSHIe5O0rkAk1D
 cCY45TgIWYNLVJ1a8P/TGdrhLGCdosBilntyHmbx8SdftAmiKZ40dUrdNmDJNYgrFRfu
 OI0w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=I7PCtSKY
Subject: [Buildroot] [PATCH 1/1] package/python-maturin: bump to version
 0.13.5
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-maturin/python-maturin.hash | 2 +-
 package/python-maturin/python-maturin.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-maturin/python-maturin.hash b/package/python-maturin/python-maturin.hash
index 7babd70111..e2de1123ac 100644
--- a/package/python-maturin/python-maturin.hash
+++ b/package/python-maturin/python-maturin.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  33f7cc8cd0a05bdd577afda1482e6bd5e33ad881366b1e9333625e063852cdd7  maturin-0.13.3.tar.gz
+sha256  c3c80ea7c10817c5fa1862c15ffae85c00db96d33b2b9f8088abe0024b983d84  maturin-0.13.5.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  license-apache
 sha256  ea7882c559733766ad08343bde1d1ec80a4967c03a738fb8e0058ef6289f7b7c  license-mit
diff --git a/package/python-maturin/python-maturin.mk b/package/python-maturin/python-maturin.mk
index b239f282ba..f67f0ef562 100644
--- a/package/python-maturin/python-maturin.mk
+++ b/package/python-maturin/python-maturin.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MATURIN_VERSION = 0.13.3
+PYTHON_MATURIN_VERSION = 0.13.5
 PYTHON_MATURIN_SOURCE = maturin-$(PYTHON_MATURIN_VERSION).tar.gz
-PYTHON_MATURIN_SITE = https://files.pythonhosted.org/packages/f2/5c/af29a40fde2c8fea1e34e79a5d43e2a4278a685c1c9039c107444f9312d9
+PYTHON_MATURIN_SITE = https://files.pythonhosted.org/packages/02/02/0bc5e44bc6f0a1ec21bd1b32d7d0ff6035a72858823ef394a95ac66327b7
 PYTHON_MATURIN_SETUP_TYPE = setuptools
 PYTHON_MATURIN_LICENSE = Apache-2.0 or MIT
 PYTHON_MATURIN_LICENSE_FILES = license-apache license-mit
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

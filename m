Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 381C4ECAAA1
	for <buildroot@archiver.kernel.org>; Fri, 28 Oct 2022 21:53:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDBBE8144B;
	Fri, 28 Oct 2022 21:53:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDBBE8144B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4dk6DY9BdjK7; Fri, 28 Oct 2022 21:53:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 098778142E;
	Fri, 28 Oct 2022 21:53:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 098778142E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 735E01BF855
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 21:53:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 583584010E
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 21:53:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 583584010E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id juZ1MMQOMVV8 for <buildroot@lists.busybox.net>;
 Fri, 28 Oct 2022 21:53:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 357D040104
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 357D040104
 for <buildroot@buildroot.org>; Fri, 28 Oct 2022 21:53:41 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id z14so8204646wrn.7
 for <buildroot@buildroot.org>; Fri, 28 Oct 2022 14:53:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J7jMo+9jNqHAbXaMV1bFBmj5g8PwNaTMdTaoZsvXmSA=;
 b=fvEGJ3VQAJxx3kDyRzJKrcpk/nW+XQgqmfPUmf8TEym6pUncLo9MvzuNFYmeFpHAgH
 DPhEQfWbOX/1T5+u5aws2kgqYmB653ZnSNvxaEF8wbqQPM72bm7QrqUrALQp6wMvvuQY
 W4O2ubV1TrNpYldAGX7LpbFEvmskGwqWrP758INQ2CPMHZOZL01gDQZaWNYeSKV48ng3
 l8xkh7P0k8HN/8Y82ugCZbN1kY7rXtOXZDkSZwuHutjhP/fK9t7U7iZm8Kcg+oYVx74H
 MYlZN58qRDmEz6aZc2SYRX5c6equ+sGrCI61tKGlqRMNsbyyq3JyaQt0s+sMX6+fa/LR
 41cg==
X-Gm-Message-State: ACrzQf2Y2ck6eGqFO7iR1aSJblsmGfCrJfkx/wHai1ly5Ocv9Zns9tXH
 PH+3ArH82WoqDZj3/tG0YjyIOptHS8s=
X-Google-Smtp-Source: AMsMyM6y+4f1y5LniQ4aBf1ABfwpR+/ciMAZOJBpIbR1e59LqnEvJCNIL4NBfBqAoeDYEo4U0H67/g==
X-Received: by 2002:adf:fe8e:0:b0:236:6860:e55a with SMTP id
 l14-20020adffe8e000000b002366860e55amr707426wrr.105.1666994019031; 
 Fri, 28 Oct 2022 14:53:39 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 i6-20020adff306000000b002368424f89esm4406403wro.67.2022.10.28.14.53.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 14:53:38 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 28 Oct 2022 23:53:25 +0200
Message-Id: <20221028215325.278206-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=J7jMo+9jNqHAbXaMV1bFBmj5g8PwNaTMdTaoZsvXmSA=;
 b=OeIGCAUB+7RTG5SoU4UKR1jsIN4d++GxlTXYgY63zH1yx+7YJT22AS2OZ8WQz4TozU
 PoktNaypGwkePhSLMGPnZYGvj8yVffwi5ll31gZYZwmSzAYOQECpvLn1vWPnDQLBUtOK
 I38k4a0ytPHbbRqbEyT23P0VGFKI2BE72Yt7aGQ1aBEapyBSwnVpb83UDn6lhijFxMll
 birM5ss/lSPHHXolxZjQSJvDqjSqU7cuWb3UjMZqFajgV/86AKIDrV6IIRoCGumMxEjA
 6ScqErIqWC+wVYa4q9Ip7OgR/WCfHZk5PCgtmxc3OOI7KZNyvC28en5GnSQi2UezjdfQ
 AGLQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=OeIGCAUB
Subject: [Buildroot] [PATCH 1/1] package/smartmontools: bump to version 7.3
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

https://github.com/smartmontools/smartmontools/releases/tag/RELEASE_7_3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/smartmontools/smartmontools.hash | 8 ++++----
 package/smartmontools/smartmontools.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/smartmontools/smartmontools.hash b/package/smartmontools/smartmontools.hash
index 3c5535b29a..e48e955d01 100644
--- a/package/smartmontools/smartmontools.hash
+++ b/package/smartmontools/smartmontools.hash
@@ -1,7 +1,7 @@
-# From http://sourceforge.net/projects/smartmontools/files/smartmontools/7.2/
-md5  e8d134c69ae4959a05cb56b31172ffb1  smartmontools-7.2.tar.gz
-sha1  8d68241096f6ed5b1bbcd8b427fa4a881c1f3e33  smartmontools-7.2.tar.gz
+# From http://sourceforge.net/projects/smartmontools/files/smartmontools/7.3/
+md5  7a71d388124e3cd43abf6586a43cb1ff  smartmontools-7.3.tar.gz
+sha1  5ce7adb606119148d725b91a00652d427ca0adc2  smartmontools-7.3.tar.gz
 
 # Locally computed
-sha256  5cd98a27e6393168bc6aaea070d9e1cd551b0f898c52f66b2ff2e5d274118cd6  smartmontools-7.2.tar.gz
+sha256  a544f8808d0c58cfb0e7424ca1841cb858a974922b035d505d4e4c248be3a22b  smartmontools-7.3.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/smartmontools/smartmontools.mk b/package/smartmontools/smartmontools.mk
index 2e2bbcd4e2..d24f008df4 100644
--- a/package/smartmontools/smartmontools.mk
+++ b/package/smartmontools/smartmontools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SMARTMONTOOLS_VERSION = 7.2
+SMARTMONTOOLS_VERSION = 7.3
 SMARTMONTOOLS_SITE = http://downloads.sourceforge.net/project/smartmontools/smartmontools/$(SMARTMONTOOLS_VERSION)
 SMARTMONTOOLS_LICENSE = GPL-2.0+
 SMARTMONTOOLS_LICENSE_FILES = COPYING
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

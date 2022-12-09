Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F37C4332F
	for <buildroot@archiver.kernel.org>; Fri,  9 Dec 2022 07:52:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B589660B44;
	Fri,  9 Dec 2022 07:52:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B589660B44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VyslMZmoii_F; Fri,  9 Dec 2022 07:52:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0282960B3A;
	Fri,  9 Dec 2022 07:52:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0282960B3A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B93251BF5DE
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 07:51:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9328040127
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 07:51:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9328040127
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Usl0SHCWdQcV for <buildroot@lists.busybox.net>;
 Fri,  9 Dec 2022 07:51:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 840244014B
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 840244014B
 for <buildroot@buildroot.org>; Fri,  9 Dec 2022 07:51:17 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id o5so4373702wrm.1
 for <buildroot@buildroot.org>; Thu, 08 Dec 2022 23:51:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rW/t9AyXl/jo7w64m/GcZHYBpc0t7pJS2I1geErGeBg=;
 b=8PV45V3es028mLD3bYLv+2RReDMf5VMKTWoLISjQIR3hzlXLMUJhjSVG14ax+aekUx
 YiGLl5Z42M2Pf5vrt4dr1n/da33EFGvlJjqaiM3TtfUvY4canmAfo4N9wwT6zHF3YTjA
 J/SQRcn7wN47MUIaCPoroJcUG0RhnHI4fhZkmuAR+I+D7eJzofSIOeEPRyKRtrxlErhw
 CsENATaGeCRIYxnKOE8awOPjFQW1aTvmpJML9DrpY1JxsHFgUiXqwy2hECVFpqzUVBPw
 w9EBKl7EsqaXx4usj1W5oOA4GOABXQ4hCL6NlXYBCvpInkhy9rW/7FYENWc1G8tw3UoW
 Qsgw==
X-Gm-Message-State: ANoB5pkSOrHdrN/YarUXLxM+6ZoOXDe0K3m8D6VCV1ZgYftF/yTAbbKs
 XV5hxDUMhYxU8y5kdlowmxoVerfKAhZDW43e
X-Google-Smtp-Source: AA0mqf7uvKryWjPozp5mt0D5Fes9W6JGC/37JaUZX86ejc0Ov1Sot5LkLnc6rd6Zw9/t8sHaN5Qnvw==
X-Received: by 2002:adf:e7c3:0:b0:242:eb5:254f with SMTP id
 e3-20020adfe7c3000000b002420eb5254fmr3232464wrn.48.1670572276832; 
 Thu, 08 Dec 2022 23:51:16 -0800 (PST)
Received: from lmecxl1178.home (lfbn-nan-1-127-214.w90-49.abo.wanadoo.fr.
 [90.49.211.214]) by smtp.gmail.com with ESMTPSA id
 bp3-20020a5d5a83000000b002415dd45320sm664507wrb.112.2022.12.08.23.51.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 23:51:16 -0800 (PST)
From: Etienne Carriere <etienne.carriere@linaro.org>
To: buildroot@buildroot.org
Date: Fri,  9 Dec 2022 08:51:04 +0100
Message-Id: <20221209075104.1168297-5-etienne.carriere@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221209075104.1168297-1-etienne.carriere@linaro.org>
References: <20221209075104.1168297-1-etienne.carriere@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rW/t9AyXl/jo7w64m/GcZHYBpc0t7pJS2I1geErGeBg=;
 b=H4A1QiXCz/VlUjLbRdOmdb6JpM5voYtBhoGR2PXZ5JdOlfAMrNiIJfyWxdwoEW17Cb
 yKvbt4Q/Kif+5nsQJhRh/uQfJQTiwIrdFEgsx3oCv0IaDvAZv9q6FZSebrSgtiAlE32P
 sJ8+0BZzYmYLnfxGdXzz25k7ugNjiEGPFDzOYUGX6DcA3rcnBeT/vfz888Ujltdr3HXy
 F2l8jf8HNKe520cO5aJVN3SipbzGB7SuHEAeFHsvoigp6iCw3PJKd0rb8DPynlI9GeKg
 ApzOmSvnKmPGX+BMF1/x1let3bCL2bEIyQTYj0UzQRdg223IjHRY+q1QA1h9S1uDovzG
 xd5A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=H4A1QiXC
Subject: [Buildroot] [PATCH v2 5/5] package/optee-test: bump to version
 3.19.0
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
Cc: Etienne Carriere <etienne.carriere@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bumps OP-TEE test package version to OP-TEE release 3.19.0.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
No change since v1.
---
 package/optee-test/optee-test.hash | 4 ++--
 package/optee-test/optee-test.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/optee-test/optee-test.hash b/package/optee-test/optee-test.hash
index 2af1768155..4da3807bb5 100644
--- a/package/optee-test/optee-test.hash
+++ b/package/optee-test/optee-test.hash
@@ -1,4 +1,4 @@
-# From https://github.com/OP-TEE/optee_test/archive/3.18.0/optee-test-3.18.0.tar.gz
-sha256  cc36a9afb99bd299a3d3769ad634ab7d5cb0e27c84ad04e14c0ff593db0f3faf  optee-test-3.18.0.tar.gz
+# From https://github.com/OP-TEE/optee_test/archive/3.19.0/optee-test-3.19.0.tar.gz
+sha256  9435901e9329a25ef4de3904e27d80377b8bb4dd6b215e8fb29d66a7b76afa11  optee-test-3.19.0.tar.gz
 # Locally computed
 sha256  6e6810981f0ddab9e0d44399d0700a15d9f760a3c2843cc866659c2074139ae7  LICENSE.md
diff --git a/package/optee-test/optee-test.mk b/package/optee-test/optee-test.mk
index d522bb3300..7b065b6123 100644
--- a/package/optee-test/optee-test.mk
+++ b/package/optee-test/optee-test.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPTEE_TEST_VERSION = 3.18.0
+OPTEE_TEST_VERSION = 3.19.0
 OPTEE_TEST_SITE = $(call github,OP-TEE,optee_test,$(OPTEE_TEST_VERSION))
 OPTEE_TEST_LICENSE = GPL-2.0, BSD-2-Clause,
 OPTEE_TEST_LICENSE_FILES = LICENSE.md
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

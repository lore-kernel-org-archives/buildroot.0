Return-Path: <SRS0=hSOo=MZ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C39EC4338F
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 09:47:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19B0E60F11
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 09:47:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 19B0E60F11
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D99D883542;
	Mon,  2 Aug 2021 09:47:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bP3cFFAYXq_R; Mon,  2 Aug 2021 09:47:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 452FE82C8F;
	Mon,  2 Aug 2021 09:47:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 97DE81BF4E4
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 09:47:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 916B682C8F
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 09:47:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l7pq6bFXk46G for <buildroot@lists.busybox.net>;
 Mon,  2 Aug 2021 09:47:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9E51A82C04
 for <buildroot@buildroot.org>; Mon,  2 Aug 2021 09:47:15 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id c16so20697356wrp.13
 for <buildroot@buildroot.org>; Mon, 02 Aug 2021 02:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pv+GcdK4EIAalsNifzPyWMTeOZF76BtpyHlfhEYT/v4=;
 b=NDrjf+gPg/zQOQr2cgecWge8yxHnzrkPZfIg3LitG1drTMNlMitDQ2QxqMLxekoQm2
 xOrpGLyEpv2MEOGniJyGxC/yROBAxF/rGo1cTKqaktEWms08T49jWQjpzr64BN3bT6c5
 2B19+VKBZ6KzWbNmR2/6Merx6DM7UeHAYwtLlmHy2P/WxQy+Gt7/pBPSOTtYu7pdpx1q
 1+4LQYYILV1PVlCn9Ms3DRfpZ2HPbkFZ0TY0WMvFQUBrB4m3YjSi2fMSeIfQwKUUrxcz
 I+NLtOtYF51F2V1tC1AOUje6A17RapnRFqfduBGyOTBegIFpDb4aNsfIJk9S0/WlPf8N
 fR3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pv+GcdK4EIAalsNifzPyWMTeOZF76BtpyHlfhEYT/v4=;
 b=KAr36BQimdLdg76Eba8IwcRHc+qquTMV7AbeQkvojHT7NkApIs6DYuhSfG++LRKnii
 YvxwG/okYzM/r8T+ds3QaixtGj7ZTWBg4GIRucBSuwxeB4Vfk5cSYJlH2BsioZmO4UIQ
 WqIw40k63IJAz2G+FAN5IYvLQlyxUq+0r9EmpnaRE1Kq/M0MmRVaFMeAIIt0ZOKKpRvO
 GJ/8BVXZqgJQ8oxjKcWV8DW+9niNshsPglkcjBGGV3O9k9pO1xhRgHAffwGyRGqOed5m
 A2bPajY9eCXK4qMTyYOuOqmqSdlQibMc4xMrEm8zPho+s92cVPtnc+avDZea96WpBEmg
 nf4Q==
X-Gm-Message-State: AOAM533yJeraixknzAUUduJDYSiSy4/5fhevStOkiJ8ElUi7Ra/AZqaH
 kFp49IgzisLP746QPbMSBIp7zB/rclUQzg==
X-Google-Smtp-Source: ABdhPJxrGlgWKsjafrnOyQYdxwBrtd6UnsvEPSoXyLEq/+0M/UGRgJzTZAb+9WFOCTZSCovd+FLVRA==
X-Received: by 2002:adf:dcd1:: with SMTP id x17mr16338661wrm.59.1627897633681; 
 Mon, 02 Aug 2021 02:47:13 -0700 (PDT)
Received: from kali.home (pop.92-184-106-71.mobile.abo.orange.fr.
 [92.184.106.71])
 by smtp.gmail.com with ESMTPSA id j140sm9780501wmj.37.2021.08.02.02.47.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 02:47:13 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  2 Aug 2021 11:47:04 +0200
Message-Id: <20210802094704.1563649-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/rtl_433: force Release build
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Force Release build to avoid the following build failure which is raised
since the addition of the package in commit
4634e84978a3e64e9050021d209a41cd88a1ad16:

/tmp/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i586-buildroot-linux-musl/9.3.0/../../../../i586-buildroot-linux-musl/bin/ld: cannot find -lasan
/tmp/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i586-buildroot-linux-musl/9.3.0/../../../../i586-buildroot-linux-musl/bin/ld: cannot find -lubsan

Fixes:
 - http://autobuild.buildroot.org/results/83274082879f9599bc106e12a253f4b9229ea00b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rtl_433/rtl_433.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/rtl_433/rtl_433.mk b/package/rtl_433/rtl_433.mk
index e6d28721fa..df00c09518 100644
--- a/package/rtl_433/rtl_433.mk
+++ b/package/rtl_433/rtl_433.mk
@@ -9,7 +9,9 @@ RTL_433_SITE = $(call github,merbanan,rtl_433,$(RTL_433_VERSION))
 RTL_433_LICENSE = GPL-2.0+
 RTL_433_LICENSE_FILES = COPYING
 
+# Force Release build to remove ASAN.
 RTL_433_CONF_OPTS = \
+	-DCMAKE_BUILD_TYPE=Release \
 	-DBUILD_DOCUMENTATION=OFF \
 	-DBUILD_TESTING=OFF \
 	-DBUILD_TESTING_ANALYZER=OFF \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

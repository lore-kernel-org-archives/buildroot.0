Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0EE0C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 20:22:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF53460EE0
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 20:22:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AF53460EE0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9262D61BF7;
	Sun, 12 Sep 2021 20:22:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DgsHtCRYpRH9; Sun, 12 Sep 2021 20:22:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D933361BEA;
	Sun, 12 Sep 2021 20:22:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 341E01BF404
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 20:21:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23A5040381
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 20:21:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WPDkP0Gkn01x for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 20:21:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DDCA041604
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 20:21:00 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id d21so3641266wra.12
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 13:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=90XsE4BZ1fA+9nexXCIsO3Bh+owrQW9lv/+FM50sJ8E=;
 b=P9+jxaGUtunopiyq9pvw6Xr2M4a9qjsLr/PVRtTddSBPKY7lX+tIvS8bouqTFB7nTp
 2SHuTRZ47q7Xnhc3ReKzaTZYV537QRUvOHllsmc3jm3QSpQlNHG9+IAXPNJM91oXr5GB
 KW45Z4BL0u5258irH02+h34p9kH2H3Qy7Uotf/Zw2kjogQN4R3+Zq/VoJyHD0f09poCz
 ojmodj20d0ztsQIoJXG8tKkCwTowIFhhtgBWAmXzL87HsnCtA5AKr0X00ys9Reer9IME
 ++8hJbnEy+S4H1B2yiQmsXMXK2AsDAJfZnskfadUBOZbIOTyMbL4pso5nO9evmYQtmx9
 WbwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=90XsE4BZ1fA+9nexXCIsO3Bh+owrQW9lv/+FM50sJ8E=;
 b=dfyOrkoLHeRGlfHd+KCdQUainKwbwVU8U0ZDtLSymSY9hOblWD76dE4j1+NtunSrT/
 pEDhck3EK8VSFmCKT6o5p4WdsDCLaeEpS01awB0vnZnHCg8gFaEo70/gWOuwEBf3m84E
 l/hrq/pDaLc/jpFrDvQaSsIPAWkjWyrUIu9GtT7Juu6oL4zCONWE/4lL+hSWbuM89luz
 5f3WwbT05/gpTGRbt8ONJF8SZ4xJrjqqHR2Zar+4Kc75CUNbFU+HjFsVSKM2LtuEMPoQ
 4K35u4qmkONwmnoKdlgDCiH0OhWKvpfobpyL2WXjS5FthzBeSrYCLTi0oPvQXvFVc5rF
 o/NQ==
X-Gm-Message-State: AOAM530ayZelRsT/IzZo98N0ofi1lllOEBdpIp1pDSvHKTPjIQTooeGx
 dBd4H/jVXMwrtEJAFxArGxuiunc3rZg=
X-Google-Smtp-Source: ABdhPJx8+P970FfkkDqGYJBweHGKD5MBpYkTPCj6o+nN+yRlJixLIKJQBHZqATO1LSqimER5qJaX5A==
X-Received: by 2002:a5d:5541:: with SMTP id g1mr9056721wrw.402.1631478058863; 
 Sun, 12 Sep 2021 13:20:58 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id l187sm4909640wml.39.2021.09.12.13.20.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 13:20:58 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 Sep 2021 22:20:56 +0200
Message-Id: <20210912202056.2999548-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/stress-ng: bump to version 0.13.1
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

This will fix the following build failure with glibc >= 2.34 thanks to
https://github.com/ColinIanKing/stress-ng/commit/7c4f74761089177127c2cfe6685b7886aa231885

core-helper.c: In function 'stress_sighandler':
core-helper.c:1340:31: error: storage size of 'stack' isn't constant
 1340 |   static uint8_t MLOCKED_DATA stack[SIGSTKSZ + STACK_ALIGNMENT];
      |                               ^~~~~

https://github.com/ColinIanKing/stress-ng/blob/V0.13.01/debian/changelog

Fixes:
 - http://autobuild.buildroot.org/results/3c2d624d1af776162978a6a72343bc04448d2885

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/stress-ng/stress-ng.hash | 2 +-
 package/stress-ng/stress-ng.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/stress-ng/stress-ng.hash b/package/stress-ng/stress-ng.hash
index 41e2801915..f3eb76fa82 100644
--- a/package/stress-ng/stress-ng.hash
+++ b/package/stress-ng/stress-ng.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f847be115f60d3ad7d37c806fd1bfb1412aa3c631fca581d6dc233322f50d6a5  stress-ng-0.12.02.tar.xz
+sha256  f37f739e4d15343360a47980b67dc8b2a6bf3d4d3ef727d55e2dd99a0b64f9ea  stress-ng-0.13.01.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/stress-ng/stress-ng.mk b/package/stress-ng/stress-ng.mk
index 53d7b7e5b7..e0b385e756 100644
--- a/package/stress-ng/stress-ng.mk
+++ b/package/stress-ng/stress-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRESS_NG_VERSION = 0.12.02
+STRESS_NG_VERSION = 0.13.01
 STRESS_NG_SOURCE = stress-ng-$(STRESS_NG_VERSION).tar.xz
 STRESS_NG_SITE = https://kernel.ubuntu.com/~cking/tarballs/stress-ng
 STRESS_NG_LICENSE = GPL-2.0+
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

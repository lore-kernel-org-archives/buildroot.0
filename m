Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1EA3CCA47B
	for <buildroot@archiver.kernel.org>; Thu, 30 Jun 2022 22:05:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EEED84633;
	Thu, 30 Jun 2022 22:05:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9EEED84633
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 67Fp1TB6P0pZ; Thu, 30 Jun 2022 22:05:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF34284514;
	Thu, 30 Jun 2022 22:05:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF34284514
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 68FEE1BF27C
 for <buildroot@lists.busybox.net>; Thu, 30 Jun 2022 22:05:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4415484514
 for <buildroot@lists.busybox.net>; Thu, 30 Jun 2022 22:05:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4415484514
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jLfhqArRU1_y for <buildroot@lists.busybox.net>;
 Thu, 30 Jun 2022 22:05:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F116183F9B
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F116183F9B
 for <buildroot@buildroot.org>; Thu, 30 Jun 2022 22:05:40 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id e28so585053wra.0
 for <buildroot@buildroot.org>; Thu, 30 Jun 2022 15:05:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZeshMyYL2N+soNh9748/3bSP/P4okOiheLu8D3r3ImE=;
 b=og4kpzoN1qav1unxqpN1huZ6OwMQo224SkVV38AfrzUwT+L1ttqaXveR6vxDk8Rzdq
 Ivl97jy3nLPO6dc782+vJBzi+kdCiqlenvKe4XIrRoTTizi/7dlFoydwdyhYBvMmrKvp
 jfzR03Y6VH1JT7vuh3MtHJmdZl2LeZp6aQONhevYaGxNZ7Nq3IV7WOJFio0ylCYDxZG0
 mjmaJTgVOkpVP/5yabqcygcH5wFHLXfWFjkqCo4Uwd/MFDoukjgv7kC7NgeuL4+PD5nR
 9QGhiPlkGO6Y/Dr8T+1g8tRo0xt7TnmqSkOrzjBe6eJWcJG2OttMVDxZGqGuNW5pL7Rk
 AAJg==
X-Gm-Message-State: AJIora+GCMYClJxtrsXdyJAtjQ+QOSKLbg2C4jttAftl0UgpNK4R35qe
 ihGg6wkdfo2e1qWDARRI09R/a9ztGRU=
X-Google-Smtp-Source: AGRyM1vD7uH5xaKSgJ/p6g/mKo9BO/s5O7jYrmM6sDqRpQg39xznFO4y/td6036Kut2wJklhQGtFwA==
X-Received: by 2002:a5d:65c3:0:b0:21b:bca9:83b1 with SMTP id
 e3-20020a5d65c3000000b0021bbca983b1mr10444197wrw.568.1656626738890; 
 Thu, 30 Jun 2022 15:05:38 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 i30-20020a1c541e000000b003a032c88877sm3972626wmb.15.2022.06.30.15.05.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 15:05:38 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  1 Jul 2022 00:02:48 +0200
Message-Id: <20220630220248.730937-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZeshMyYL2N+soNh9748/3bSP/P4okOiheLu8D3r3ImE=;
 b=SMN/MjvsM/8SWJNnLNqBhJOJpwI2qSh0hnQZLTCMfv9VjZ0MNkoRZ3RHLUoBESHOKF
 SWOwHj+ubheQ+Vs8WaZMW0uYoc2CmjdxfbfWiFdpTHH2ZeiMlMtvwtzcSFPI1dv6xK/Y
 6g4N3xPUw/8Qown5VJZfkwZDmL4xjm2v13CjWN+l3yab70FZpL4yKnPxF855yuqIbUXh
 qT2tr6a9MLEgrUhTT3H/vfDAEuQJIFvVbiVJbkNkqMDRDsfkPZCDu9DIecmWa0Ag+h/b
 mY8gzlqitplwNTenTGxNGrAbVWVTY3TPsnugRPLqLDYov9sB+3Benq5AEnLzWVEt7rOb
 hOrA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=SMN/Mjvs
Subject: [Buildroot] [PATCH 1/1] package/isl: bump to version 0.24
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

https://repo.or.cz/isl.git/blob/3ea3e8b77475bea49b35b8215d8f66af94121b3c:/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/isl/isl.hash | 2 +-
 package/isl/isl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/isl/isl.hash b/package/isl/isl.hash
index 3df331b143..001fc9d115 100644
--- a/package/isl/isl.hash
+++ b/package/isl/isl.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5efc53efaef151301f4e7dde3856b66812d8153dede24fab17673f801c8698f2  isl-0.23.tar.xz
+sha256  043105cc544f416b48736fff8caf077fb0663a717d06b1113f16e391ac99ebad  isl-0.24.tar.xz
 sha256  3a2c398103f6bca0f50a9a9465deca9230b370b0212af5fdf31ed88a36215c30  LICENSE
diff --git a/package/isl/isl.mk b/package/isl/isl.mk
index df57c83f55..51e608b304 100644
--- a/package/isl/isl.mk
+++ b/package/isl/isl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ISL_VERSION = 0.23
+ISL_VERSION = 0.24
 ISL_SOURCE = isl-$(ISL_VERSION).tar.xz
 ISL_SITE = https://libisl.sourceforge.io
 ISL_LICENSE = MIT
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE5CC0015E
	for <buildroot@archiver.kernel.org>; Thu, 13 Jul 2023 21:46:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35F29420A9;
	Thu, 13 Jul 2023 21:46:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35F29420A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nYNlM-OtXg7D; Thu, 13 Jul 2023 21:46:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D93B420A1;
	Thu, 13 Jul 2023 21:46:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D93B420A1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6BB431BF383
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 21:46:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 43D96420A1
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 21:46:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43D96420A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LsKrGP9PJQ1R for <buildroot@lists.busybox.net>;
 Thu, 13 Jul 2023 21:46:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 353334209B
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 353334209B
 for <buildroot@buildroot.org>; Thu, 13 Jul 2023 21:46:20 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-78362f574c9so42336739f.3
 for <buildroot@buildroot.org>; Thu, 13 Jul 2023 14:46:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689284779; x=1691876779;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gTzCG80x5s4fTxm58Ubd0/wV/T9GMxd1mjwjypOJ/gM=;
 b=EB9WXpedwfZb0wU7x0UwbVkNxrenCihJsl5nCfDGSln96wct38tNvCIPy5PygLdVA5
 x4PYb4rTE9Jayg0qw8io2Jzuk19gBskGNmoJ9kycR4vh9M/hE4X2kthdwtcPm5TO2I7v
 qY9BBMOJ/fLUXWZ1gVMxjqd1FHVKC45kXVwZpNau6pEp7e50rxmqQOZrhWevxu5U+Tll
 2WLZTss1581sPffhAR19wMDCUITyDes2x6fiadbN5Wv3Ey0cDa00yCZIUDgK2mrn7Say
 Qk/HMm2/TgAKVH0NDYDK5kUtX0YPiWA2VcAIoxy0f1Dl0LMMQ50u5+UZC5FNjRcNhQ/E
 ubKw==
X-Gm-Message-State: ABy/qLZzyfQrP1wkHrdGfg6bY+Bftzuzbo3na8NxQIgW/oOLLQJDFc6/
 gjTEXsJ6pX7z6dyc4XT1Mn3GPbviAi0=
X-Google-Smtp-Source: APBJJlEOTlWHcuKtCevvD1Of2BFFnoz7hwkG8rtpjIanFHxUWat413hiRUeTDG1/QSWzzJTq1ezcdw==
X-Received: by 2002:a05:6602:19da:b0:786:ea57:22e2 with SMTP id
 ba26-20020a05660219da00b00786ea5722e2mr3277265iob.20.1689284778652; 
 Thu, 13 Jul 2023 14:46:18 -0700 (PDT)
Received: from james-x399.localdomain (71-218-225-212.hlrn.qwest.net.
 [71.218.225.212]) by smtp.gmail.com with ESMTPSA id
 q4-20020a02cf04000000b0042b6cb44429sm2133604jar.46.2023.07.13.14.46.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jul 2023 14:46:18 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 13 Jul 2023 15:46:16 -0600
Message-Id: <20230713214616.463353-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689284779; x=1691876779;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gTzCG80x5s4fTxm58Ubd0/wV/T9GMxd1mjwjypOJ/gM=;
 b=SbTKaFELEnaiJXgX8kg7URV9mMDIvSO16uWZkLyrO3Gh+1klUVGl2ZAcUPcGxFm98R
 K2O/K6bOEnL1Lb2bf0/rl5Yt11vuUHoVAJSsqmpSOdGslkg+fnulp19b/2qx0I47xO4v
 KDKhcMLT/ABqBxYHUtP37Qn3/qCU5oG8RjTaeNaNNT97AqX1yKsdM2nmSXuaft2T2GvV
 b0nVE63PrfYhVeG5+bdH2kEtT9fOV1Y7qpCjcwJb8olNextIY4ySP+HOJi5srXPyFf2N
 ZSuRA7z7c8ynVko3asatDthKw0Au/OsK4mOqM6N1oDNZ49E4hFOUauXhBPAmB5kxLVns
 SIYQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=SbTKaFEL
Subject: [Buildroot] [PATCH 1/1] package/strace: bump to version 6.4
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/strace/strace.hash | 4 ++--
 package/strace/strace.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/strace/strace.hash b/package/strace/strace.hash
index 555d074c5d..e6e9c4ec96 100644
--- a/package/strace/strace.hash
+++ b/package/strace/strace.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking signature with RSA key 0xA8041FA839E16E36
-# https://strace.io/files/6.3/strace-6.3.tar.xz.asc
-sha256  e17878e301506c1cc301611118ad14efee7f8bcef63b27ace5d290acce7bb731  strace-6.3.tar.xz
+# https://strace.io/files/6.4/strace-6.4.tar.xz.asc
+sha256  27987dbac57fdfd260c6db4dc8328df35c95c6867c8a3d4371d59cdcf4eb9238  strace-6.4.tar.xz
 sha256  d92f973d08c8466993efff1e500453add0c038c20b4d2cbce3297938a296aea9  COPYING
 sha256  7c379436436a562834aa7d2f5dcae1f80a25230fa74201046ca1fba4367d39aa  LGPL-2.1-or-later
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 6514bfe354..b109578a35 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRACE_VERSION = 6.3
+STRACE_VERSION = 6.4
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = https://github.com/strace/strace/releases/download/v$(STRACE_VERSION)
 STRACE_LICENSE = LGPL-2.1+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

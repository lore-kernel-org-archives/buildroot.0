Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E42BC433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 06:49:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FF6460F46
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 06:49:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9FF6460F46
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 422A740369;
	Mon, 25 Oct 2021 06:49:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LzttDKa0BZPY; Mon, 25 Oct 2021 06:49:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4C1E40277;
	Mon, 25 Oct 2021 06:49:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BE43A1BF3EA
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 06:49:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC67140277
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 06:49:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2iR4c1jXPYGQ for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 06:49:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7298F40271
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 06:49:51 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id 3so9211175ilq.7
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 23:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iy/6Be2LpxRnCWwQB1ZJVl8WNuEXI+hdKnJlqP3FxnM=;
 b=oeBgUqho5UrUjQQ5IszsLj4QadQZFKibBCRpjOj8uXx1QwF8aaMpPWhEdBP+J57bYE
 dxPt6NKZRuNk5l+er4syAIkdPVHfoGkHlz5mksgCtDX+9bHC4Gb44Eb/JElIjPKyzee+
 X2I9DOAdJGlVbGIe7VeDH7yMKiB0XoUcviBV12G1TkD24r4pwPEiXUKfGg2KdtVfq4r3
 6vvW+EF1WZhGQ4xi4m+mDEAQbbbaqoKjxUrbOzlKkVX5y5J8ofxsJNQ/Sdbbvs9i29pl
 WiMTmri/0OqeNBauY5RdD1HaU3Av+8kVJA4I3OthlG83fvbPwcCorFNF/WmErUsP9r/g
 ldsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iy/6Be2LpxRnCWwQB1ZJVl8WNuEXI+hdKnJlqP3FxnM=;
 b=re4+ny3EM4x3WmWUO/uie0d5shngzyY8u24Nee9dgS7riwgzGtuRGxjgg6mwTLWcev
 V4t2oddHY7izQdf59E2jLGvSqh4ObBvxTBapfLpPP7wmHzi407ggtLkjevNfXzVh3hpT
 vsz1RNkNHN/uBHRq6Q+b1qxkcpz044Fc+6/AQyzaBMZPb0tPre5HObAv6Izqk/sFhHuQ
 UkB8xRaDGuVRiIhwWBZr6zvzkYvzuXueo1LsoIKveJP3NVzMzhVsl6MzfkCW3MQtrd8j
 DxWxX2AHp7MXCZm6BSbCgth8sI7hBnsUEKs3DDaaEBPvlmYrxC8fFQ8TLt7Q586iK0kW
 T9MQ==
X-Gm-Message-State: AOAM533mFSDKHPZDj0sR+onZxOR3dESouwFdiClzxaup/efBWzfF16Qt
 co6zR/fg/PIgLNAeIWuBNeX1bjIDqK8=
X-Google-Smtp-Source: ABdhPJwq4XwDBHF57SxApps5rBvDwVE3B5o2msy8fBZVkY7za84t/NAal6FpNH+rIdoe8wKfjNI4NQ==
X-Received: by 2002:a92:d4c4:: with SMTP id o4mr8357432ilm.190.1635144590436; 
 Sun, 24 Oct 2021 23:49:50 -0700 (PDT)
Received: from james-x399.localdomain (71-218-115-49.hlrn.qwest.net.
 [71.218.115.49])
 by smtp.gmail.com with ESMTPSA id v5sm7221283ilu.16.2021.10.24.23.49.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Oct 2021 23:49:50 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 25 Oct 2021 00:49:38 -0600
Message-Id: <20211025064938.2279526-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/meson: bump to version 0.60.0
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
index f3cfe66072..0702a7685a 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/0.59.2/meson-0.59.2.tar.gz.asc
-sha256  13dee549a7ba758b7e33ce7719f28d1d337a98d10d378a4779ccc996f5a2fc49  meson-0.59.2.tar.gz
+# https://github.com/mesonbuild/meson/releases/download/0.60.0/meson-0.60.0.tar.gz.asc
+sha256  080d68b685e9a0d9c9bb475457e097b49e1d1a6f750abc971428a8d2e1b12d47  meson-0.60.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index bd03a7cd67..0f989ac8a1 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 0.59.2
+MESON_VERSION = 0.60.0
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

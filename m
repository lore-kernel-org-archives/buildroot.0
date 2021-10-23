Return-Path: <SRS0=6sxh=PL=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9CDDC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Oct 2021 04:31:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFF1760FBF
	for <buildroot@archiver.kernel.org>; Sat, 23 Oct 2021 04:31:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EFF1760FBF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7DC0B4031D;
	Sat, 23 Oct 2021 04:31:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L8IOtYHHSdbA; Sat, 23 Oct 2021 04:31:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9BD32402F0;
	Sat, 23 Oct 2021 04:31:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A5C3A1BF28C
 for <buildroot@lists.busybox.net>; Sat, 23 Oct 2021 04:31:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A107C402F0
 for <buildroot@lists.busybox.net>; Sat, 23 Oct 2021 04:31:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V2Bva9Ro5PS1 for <buildroot@lists.busybox.net>;
 Sat, 23 Oct 2021 04:31:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 62BEB40132
 for <buildroot@buildroot.org>; Sat, 23 Oct 2021 04:31:27 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id o184so7935102iof.6
 for <buildroot@buildroot.org>; Fri, 22 Oct 2021 21:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uZQu+CB1liww/Q7zHYoGgQ3Lc1qsMiyldwS87FEkpLA=;
 b=DBagoz+ACD0y82tpOFBPb+8Yds2S4biG0MfIqrh4bJskCQShp1P4rVhgvEfa7n9vmW
 DxXKPpjsISk/M6UpBPdVVA/18d73Apagtnqnd71rCs5cDuNAVAWsuvV6+BD81f6G+dwN
 MVTQnKawoLhvSRH1UZIEss+g2nDKEStQdf+KCnnr3gYrbrZDfEGwGO1npXU7QxgsYyr3
 SVMXChG8STcNvn7/GX06i15O229A3S+erBBJ+c/WdzdNgS/WFgv8r3rRjGh94QZVrql1
 zGuv/B7t3FrIJvvGyOJGbrcftjw+hWe3A5qpAr8aYn5PElgGWziNSXr5+6j/K5OQ5FI6
 Uerg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uZQu+CB1liww/Q7zHYoGgQ3Lc1qsMiyldwS87FEkpLA=;
 b=u+r8vBIPJRkYWfeAl+jGAeBkKSxnYUp7+DyBNvadd4Zmc92kQCo4XjtRunjAKpeStb
 R7Iu3FJXCVpPgaLPxjxV6h4Mm6GbSwoKrvfWyzbjZfoZNg8LrX2n5scRrkC6j5L60LWf
 gbAOrdxXRhqlTNTYkpHPds9nK0zJNATALtBr/e133j39bB4/NEdCk02Sz3Dwo6nKFjGP
 hnpP75PM58EQEHdLw/51+U0GuTR96m960H6Y2SzfChzj7VwtudCrrMcItNZkd+XxJ4tl
 eK/oGqHxYCmTLG9EhUNKdccHNZIEy4746tJ/asH4k/tDWz42KiYaW/MgEdeAbX4dbgy4
 fDbQ==
X-Gm-Message-State: AOAM532TUGlU5j5gnsGQrLsAIqgdQqgXesVaBn3I1XUEw6Q5dyTX4cNj
 SBMVF4XSX4KVwwSEoYjq1PH6MgijwV0=
X-Google-Smtp-Source: ABdhPJwrZLdpjtPcx187tEKhYEAy57GwzL16n+gO4Kp6WzeU3At+3gGOmUUo4lSt/fc78Gl58LlsOg==
X-Received: by 2002:a05:6638:3723:: with SMTP id
 k35mr2466860jav.104.1634963486109; 
 Fri, 22 Oct 2021 21:31:26 -0700 (PDT)
Received: from james-x399.localdomain (71-218-115-49.hlrn.qwest.net.
 [71.218.115.49])
 by smtp.gmail.com with ESMTPSA id x5sm5032348ioh.23.2021.10.22.21.31.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Oct 2021 21:31:25 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 22 Oct 2021 22:31:14 -0600
Message-Id: <20211023043114.3208095-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gpsd: bump to version 3.23.1
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Robert Hancock <robert.hancock@calian.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
https://us-cert.cisa.gov/ncas/current-activity/2021/10/21/gps-daemon-gpsd-rollover-bug

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/gpsd/gpsd.hash | 4 ++--
 package/gpsd/gpsd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gpsd/gpsd.hash b/package/gpsd/gpsd.hash
index b91ab16e18..6d93e7b553 100644
--- a/package/gpsd/gpsd.hash
+++ b/package/gpsd/gpsd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	65504c3af8d3b0cce3c07405b8815d7730d2d2be2da7d28d275f1a9c57c6fe91	gpsd-3.21.tar.gz
-sha256	fdf339997bbca9eaf507476b82fbcac608fc39a3d89b86b51e16db4c9f933716	COPYING
+sha256  0b991ce9a46538c4ea450f7a8ee428ff44fb4f8d665fddf2ffe40fe0ae9a6c09  gpsd-3.23.1.tar.gz
+sha256  fdf339997bbca9eaf507476b82fbcac608fc39a3d89b86b51e16db4c9f933716  COPYING
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 45f6d35ef8..ff924c49e0 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GPSD_VERSION = 3.21
+GPSD_VERSION = 3.23.1
 GPSD_SITE = http://download-mirror.savannah.gnu.org/releases/gpsd
 GPSD_LICENSE = BSD-2-Clause
 GPSD_LICENSE_FILES = COPYING
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

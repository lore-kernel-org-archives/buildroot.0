Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B695C433F5
	for <buildroot@archiver.kernel.org>; Tue, 12 Apr 2022 18:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF94940B3D;
	Tue, 12 Apr 2022 18:03:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YLpeBF1N-G-D; Tue, 12 Apr 2022 18:03:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C8B9740B3C;
	Tue, 12 Apr 2022 18:03:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8E02F1BF3C6
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 18:03:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7CDA483F35
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 18:03:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4hcgtiErLcq9 for <buildroot@lists.busybox.net>;
 Tue, 12 Apr 2022 18:02:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 911EB83EFE
 for <buildroot@busybox.net>; Tue, 12 Apr 2022 18:02:59 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id s28so12954169wrb.5
 for <buildroot@busybox.net>; Tue, 12 Apr 2022 11:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5Np5kRrN63IMLaBA3FtNRE1GyT8VYW93k4PfofegGb4=;
 b=AGFERrc4VcOXu30b+Gvko9TMWUlOO/CLK/wKCAukl3E4umUGDQTr1+KLPd/XPqAExj
 KuV0iL+TYaNHhDUAIV/Smlw/UCo2jHD0KKqy6MzViQu4UhhoWnlf0MWpE4zE80DE3C1+
 K+olhz6R+GdQthanYP6kdqVU9THyBc/fNI6aZS83k5YuBZfw4BIH3/YWAwlRonC9onRi
 dWPALl4QTAvwmSgBP+GcT/iQQDXiATr+vKRsjw92gk2wipMYj/SXAUaAAWSnh+AcdEWr
 UIqAfO/79UX8poOq17JQJplf7tWOBXQ9ppwKNPSMfVr7BsJuEmEfYRNx9F7VXmY0r/xl
 6C4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5Np5kRrN63IMLaBA3FtNRE1GyT8VYW93k4PfofegGb4=;
 b=IVRpoygtG/cXBYWbVB1qoj6Jo/Swaqk/7HMJd2yqOfOzzybDg5O1NkJsu4iMnyPC5R
 EZTRfHR+NvzVlqU1ATk7bBUUj53TEGwbND4SdRHEsgtqb+GeY8JG4vdgcazsNDb3Ix8/
 ARJn1wlZ3A2J3oBWBYOAxASpChG+pzOg0mAiBJeYPMd8Gjf2Jm9QpujC2Vfc8UbSmiEy
 qJqxT8KCvVmNjeg0n5I3DFPT6zkuxWn6B4Mfs1DB8vNfFTCIrD7eK5we4hmshmrU8e1H
 ZPa6+lYcidQZ87Tt2T4W0JdRZOddUME8bosx+ZpiXFX++suH2hca7c4DVB0oHgXE3TNK
 0mhQ==
X-Gm-Message-State: AOAM530WDhiGWo3S4mNrMXDDMO6Kse/lCPzfOhLtiZ0QDzK6Qbgsam5Y
 UdSR1wU6uxAfbozpyXw6lYguuUU8WI8=
X-Google-Smtp-Source: ABdhPJxXkcyIQ7HRUOUPTMebS4KDXMDD+Ved9XMwH+chDXu1gA76nVuxHBsQJyKBhGo4TG9VuM9SdA==
X-Received: by 2002:adf:8122:0:b0:1e7:b111:3b92 with SMTP id
 31-20020adf8122000000b001e7b1113b92mr30110113wrm.695.1649786577715; 
 Tue, 12 Apr 2022 11:02:57 -0700 (PDT)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 v13-20020a5d4b0d000000b00207a8815063sm4959769wrq.2.2022.04.12.11.02.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 11:02:57 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue, 12 Apr 2022 20:02:48 +0200
Message-Id: <20220412180248.2709842-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/sqlite: bump to version 3.38.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/sqlite/sqlite.hash | 2 +-
 package/sqlite/sqlite.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 1b3dc35cc..882cf8564 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8e3a8ceb9794d968399590d2ddf9d5c044a97dd83d38b9613364a245ec8a2fc4  sqlite-autoconf-3380100.tar.gz
+sha256  e7974aa1430bad690a5e9f79a6ee5c8492ada8269dc675875ad0fb747d7cada4  sqlite-autoconf-3380200.tar.gz
 sha256  66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index a0c90b7f6..9f88af7ae 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3.38.1
-SQLITE_TAR_VERSION = 3380100
+SQLITE_VERSION = 3.38.2
+SQLITE_TAR_VERSION = 3380200
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_TAR_VERSION).tar.gz
 SQLITE_SITE = https://www.sqlite.org/2022
 SQLITE_LICENSE = Public domain
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

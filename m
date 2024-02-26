Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DACFC48BF6
	for <buildroot@archiver.kernel.org>; Mon, 26 Feb 2024 20:55:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC94960B67;
	Mon, 26 Feb 2024 20:55:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a46fSNRYm6Jz; Mon, 26 Feb 2024 20:55:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E515160B5C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E515160B5C;
	Mon, 26 Feb 2024 20:55:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4460A1BF271
 for <buildroot@lists.busybox.net>; Mon, 26 Feb 2024 20:54:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3278980BFC
 for <buildroot@lists.busybox.net>; Mon, 26 Feb 2024 20:54:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RU_WZ2w0fhZs for <buildroot@lists.busybox.net>;
 Mon, 26 Feb 2024 20:54:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32b; helo=mail-ot1-x32b.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4010580AE3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4010580AE3
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4010580AE3
 for <buildroot@buildroot.org>; Mon, 26 Feb 2024 20:54:56 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 46e09a7af769-6e49812ba77so898297a34.2
 for <buildroot@buildroot.org>; Mon, 26 Feb 2024 12:54:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708980895; x=1709585695;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G+Ut5Nr2nsNNeu3OHKbqBsK+YP/CNyS7NiEb7nouVSE=;
 b=NUIMcoQtawgJPrM5DtmZ3FvdEQ9Xi73k8moaptVHrKCKhJDkxhI7Aq7MagvpfIgAPp
 B6lkAwy58EcyVzhO13S88VhtDWXVvOmXRZmxwhltiyy0LVfqk1+wm7vreuyn7aICpsDv
 E9jPtPrq4WI8j55EB4zd4kQeCR43cCnm6U2hHNtS1Q0lzeS6a3nfFrUxirkBR7HPbbzz
 x1DhfsDXtXkIsmiQRwo3j1H7AV9jIpBui5PYYIq0VTKBRnHtWjBfLiQthJTsK/ZXypJF
 CWDbZdfScCsIXLr0V0XDe9/du8Bshc1HujuqfEVZVg6CdDU8Gi9NjbGDI8wy1BW8cx4W
 /LTg==
X-Gm-Message-State: AOJu0Yw+/z0dcVKjzt1GzSZv9B48/TD+vWCQaZDL0h/yQ5aXNzWfBscD
 hq0zaoZVI0J5B71SrP3xHfo8nsgAt4YjRJhDpurvxsyBKBnAMw3N/Ch6fF2FmZQbURJI2HNEpTd
 J
X-Google-Smtp-Source: AGHT+IFa1uHeczPZuEt99QquwzGe7hTtINF+dzWLRtBikf53QjHGCgPNkAdRBiU5+ofQ99zKvXJx/w==
X-Received: by 2002:a9d:3e07:0:b0:6e2:f0c1:d719 with SMTP id
 a7-20020a9d3e07000000b006e2f0c1d719mr8998963otd.35.1708980894910; 
 Mon, 26 Feb 2024 12:54:54 -0800 (PST)
Received: from DESKTOP-OI0KN2B.amarulasolutions.com ([204.229.2.167])
 by smtp.gmail.com with ESMTPSA id
 a28-20020a631a1c000000b005dcbb855530sm4369991pga.76.2024.02.26.12.54.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 12:54:54 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 26 Feb 2024 13:54:42 -0700
Message-ID: <20240226205446.842600-6-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240226205446.842600-1-adam.duskett@amarulasolutions.com>
References: <20240226205446.842600-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1708980895; x=1709585695;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G+Ut5Nr2nsNNeu3OHKbqBsK+YP/CNyS7NiEb7nouVSE=;
 b=EJJ/O2f4Y6KYXBOZ0BcFqs8OYrFq3gJ2GOuXwj9z4VoLU9C6rHEy81s0t51rrc4NHb
 AqU2gseYhAT47MuCTT1QDgwnlipirycNyLLEiZLh3aIpPenA1kqo4Fc8nwkIncbyXbNX
 xqy0r/8bWjdPx8wyCFx4E94B+Hj2vFpInIhrY=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=EJJ/O2f4
Subject: [Buildroot] [PATCH 6/9] package/restorecond: bump version to 3.6
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/restorecond/restorecond.hash | 2 +-
 package/restorecond/restorecond.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/restorecond/restorecond.hash b/package/restorecond/restorecond.hash
index 215c9192f4..5b86afdcc0 100644
--- a/package/restorecond/restorecond.hash
+++ b/package/restorecond/restorecond.hash
@@ -1,5 +1,5 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  f00d8caddb6aba2793c65e69154d04671b52f3d37e081b0e96c1b443fe23c2fe  restorecond-3.5.tar.gz
+sha256  8f8aa2c6c66bcc6d91c6edd63913e5d738de6428928f27d1019d89c31cf347b1  restorecond-3.6.tar.gz
 
 # Hash for license file
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  LICENSE
diff --git a/package/restorecond/restorecond.mk b/package/restorecond/restorecond.mk
index cd40905230..4e9a66c592 100644
--- a/package/restorecond/restorecond.mk
+++ b/package/restorecond/restorecond.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RESTORECOND_VERSION = 3.5
+RESTORECOND_VERSION = 3.6
 RESTORECOND_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(RESTORECOND_VERSION)
 RESTORECOND_LICENSE = GPL-2.0
 RESTORECOND_LICENSE_FILES = LICENSE
-- 
2.43.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

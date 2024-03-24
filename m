Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA23C47DD9
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 21:25:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4C6881D3A;
	Sun, 24 Mar 2024 21:25:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RDP_rn5QAMBs; Sun, 24 Mar 2024 21:25:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 229D181D4F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 229D181D4F;
	Sun, 24 Mar 2024 21:25:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EE3E01BF4E5
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 21:24:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E8C2B400D7
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 21:24:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gSiEKXTyhh5v for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 21:24:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::329; helo=mail-ot1-x329.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C4BCA403A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C4BCA403A5
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C4BCA403A5
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 21:24:56 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 46e09a7af769-6e6ce0702c3so505589a34.0
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 14:24:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711315495; x=1711920295;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JPvdrkMxVtRhIcEBne9n/X1qrDDyli/Vn10Fy1zlgEQ=;
 b=TMkRADkMopQL/21OvAXNnyw+8xxklfHrZmwUI1pL1pmWYCsMvqM1CbGBoSUxZoTuZ6
 APMohh1iYFBGiHbNRBa5REmjay/w0D5ukl2ZrRAo/MzkMRbaSGdPl8i9e6U/zNWc9Q12
 7y1WsFM6/VKrxKHW8Mp/r5fdvx+jFDITM/rwsHPF6UCw1xwKp39xeup++whDDC8AX1JY
 4RY2MGW94gh0vm4DjJSdq3jOmxxDw+sZYSQ0gvbY7OEhaV5RedjHFecLiZwjTClhwCUp
 0SZW3+vOGk04yrBXigngM0eq0flLP08ffyB165XePLBkdvioVslrvefWcRkkTIBWJkCs
 IBYQ==
X-Gm-Message-State: AOJu0YwnXT0nfxX11gZpf1TOwj2pvX04tsE9wbfuGbl8ei3HXlV7jd9e
 sqp1WDpBIYr+BsQgovpDEa0b4axR07c9er2y7n3yxd0scB3ug5Ep3RiBYFYjg4TrqvZ2Ziu6z+0
 0
X-Google-Smtp-Source: AGHT+IE2sH5wg1vKr6fRkwIkq5ap0cOv+7TMcRg9p/acGNn6mKahuQFptQSlBi984LEH6D0NSwvH7Q==
X-Received: by 2002:a05:6359:203:b0:17f:7807:320c with SMTP id
 ej3-20020a056359020300b0017f7807320cmr2963665rwb.5.1711315494846; 
 Sun, 24 Mar 2024 14:24:54 -0700 (PDT)
Received: from localhost.localdomain ([204.229.2.167])
 by smtp.gmail.com with ESMTPSA id
 k7-20020a17090a658700b0029c3bac0aa8sm8979556pjj.4.2024.03.24.14.24.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Mar 2024 14:24:53 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 15:24:36 -0600
Message-ID: <20240324212441.526544-5-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240324212441.526544-1-adam.duskett@amarulasolutions.com>
References: <20240324212441.526544-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1711315495; x=1711920295;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JPvdrkMxVtRhIcEBne9n/X1qrDDyli/Vn10Fy1zlgEQ=;
 b=Ov7NEJ1NG0PQmIHerLsAVC+Fx/1wU9CZT6OEw7sk5zum/8O/C9bkhjW6pXVXp91/Nw
 yUMiCbfghuY4N98kiDnkFCGXfozKZDhQ6IJXCaxCEznsnWUtqyM/eS8Qwv2fzZYmccEa
 gFhxyWLPeQVhoyx6Gv7f7QtArOTBghrm4btqI=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Ov7NEJ1N
Subject: [Buildroot] [PATCH v2 5/9] package/checkpolicy: bump version to 3.6
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
 package/checkpolicy/checkpolicy.hash | 2 +-
 package/checkpolicy/checkpolicy.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/checkpolicy/checkpolicy.hash b/package/checkpolicy/checkpolicy.hash
index fcfd81c554..d2ecc7265a 100644
--- a/package/checkpolicy/checkpolicy.hash
+++ b/package/checkpolicy/checkpolicy.hash
@@ -1,5 +1,5 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  7aa48ab2222a0b9881111d6d7f70c3014d3d9338827d9e02df105a68c0df5dbc  checkpolicy-3.5.tar.gz
+sha256  1b346b3cdd4f8a78a157627bad64a3b3479c67b6a19d15e6d5c8694620eadbc1  checkpolicy-3.6.tar.gz
 
 # Hash for license file
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  LICENSE
diff --git a/package/checkpolicy/checkpolicy.mk b/package/checkpolicy/checkpolicy.mk
index 024d306233..109aaf6072 100644
--- a/package/checkpolicy/checkpolicy.mk
+++ b/package/checkpolicy/checkpolicy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CHECKPOLICY_VERSION = 3.5
+CHECKPOLICY_VERSION = 3.6
 CHECKPOLICY_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(CHECKPOLICY_VERSION)
 CHECKPOLICY_LICENSE = GPL-2.0
 CHECKPOLICY_LICENSE_FILES = LICENSE
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

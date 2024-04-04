Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF817CD1284
	for <buildroot@archiver.kernel.org>; Thu,  4 Apr 2024 17:56:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 32E72400E2;
	Thu,  4 Apr 2024 17:56:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QWfM-HyZ1ITs; Thu,  4 Apr 2024 17:56:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40FCE40489
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 40FCE40489;
	Thu,  4 Apr 2024 17:56:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DE5981BF35E
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 17:56:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C7BF26102B
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 17:56:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ny9bauBH_fdp for <buildroot@lists.busybox.net>;
 Thu,  4 Apr 2024 17:56:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com;
 envelope-from=festevam@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5580B61028
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5580B61028
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5580B61028
 for <buildroot@buildroot.org>; Thu,  4 Apr 2024 17:56:08 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-5f0a485dab9so156833a12.1
 for <buildroot@buildroot.org>; Thu, 04 Apr 2024 10:56:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712253368; x=1712858168;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0C8XSq5VuekH2K5yidD9ol8fH44tHRKW3PIHz+NDDMQ=;
 b=NfwfUpB/5z/g6EiBCcQnl6l9McrW4dXFmWcdU36kS1IVj+Dnv+EHNOKWSyzry6FVAH
 gg3VWTjwD6uVAxl4e8tOfRrQcQHgkYtMDyaB9KHUA6BqDVdLQDi56mrH/AP47O/v75lH
 lKgq+O1Ad//Kwc3U7Yost4tZ+lp+tz6LrVxfy4LKS1pIRdk0fipwzbNgdyVRNMK2BtIG
 TTYBfzZJqq0j5sEyoyG9f2/WmlN4MO4d/RSvne3ehY4Q6yXHNVnyZFaE4PMbPN4w5xdz
 VuBcuvdzxy+2Va8QQw9Bz41Yw9uwpr4wZwka6KCnu3WEU/YDXxGgaQTjiONy3ZSFKfCW
 KgPg==
X-Gm-Message-State: AOJu0YwL4+hCrjgCplOjvCdVbVUaoSe3SQeJ74EEQpTimt06PAVJlnTi
 5zuJWTpwGQQRbZ/vHYkEZFESU71NP6KqXDtD03XSPG0N4IpFowxg0rX3NF36
X-Google-Smtp-Source: AGHT+IEZ5LghzVNnnRYBTlIT89G+tHj6gjRQP3CQtkXR2HlRVfKsCltAphDPrtjvC9GVBgWjEkQQvg==
X-Received: by 2002:a05:6a21:7899:b0:1a7:2d42:7a8b with SMTP id
 bf25-20020a056a21789900b001a72d427a8bmr3811719pzc.0.1712253367882; 
 Thu, 04 Apr 2024 10:56:07 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:9c:998:79c7:d666])
 by smtp.gmail.com with ESMTPSA id
 h12-20020a63e14c000000b005f0bc6d04adsm9025613pgk.46.2024.04.04.10.56.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Apr 2024 10:56:06 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  4 Apr 2024 14:55:52 -0300
Message-Id: <20240404175552.672410-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712253368; x=1712858168; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0C8XSq5VuekH2K5yidD9ol8fH44tHRKW3PIHz+NDDMQ=;
 b=D0JCLBNkFszdLl+/qQ9zSGUh/l3MsQow6uWngnC7zvYOsD1LG4wayDSJy2b/laOvbh
 9fcHySbYUgMw0CmmD1KjSigkrgQu4K4iGwQdoomHmzNIYTnJ5ODU+myJKDLP3Xhu/PVA
 tozWJrSfqnNScO7brIE4XRmRpc8rMKQrAy5Q5CUtxjX67+THmfq1ErqwtMFYHSOCBeg0
 snd+AzZkeNuGHd+M9qVodtI+eZLM3kJjuIwgObNmfSQxkAhlK/iAQz6WSzlsDmAWan8A
 zvsbOE6zhOZinw/to7MjwesNifiiK5fx5dh/9wtbyzrm93YKx2wipa9neJFBSjA5a4+I
 a4Zg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=D0JCLBNk
Subject: [Buildroot] [PATCH] package/crucible: update LICENSE information
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
Cc: Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since crucible commit 7fe0bb96da65 ("move to BSD style license") the
license has been changed to BSD-3.

Change the license type and hash accordingly.

Fixes:
  - http://autobuild.buildroot.net/results/14dfa0a47be54929c527c12fe9b95f34c1d8c7f5/

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 package/crucible/crucible.hash | 2 +-
 package/crucible/crucible.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/crucible/crucible.hash b/package/crucible/crucible.hash
index d5fee0068d8e..3a9a7167323a 100644
--- a/package/crucible/crucible.hash
+++ b/package/crucible/crucible.hash
@@ -1,2 +1,2 @@
 sha256  d21842f050163765269290d72fe79d3f95005038e865138d94e247cb455098da  crucible-2023.11.02.tar.gz
-sha256  d88514630470aec9fa7abdc990a1e0a8751a752321bffa868188c49009d64d59  LICENSE
+sha256  a89c50d83be30fe7ec75be69a07f6c1b5dfaae0a6b94a678d2394fff34acb69c  LICENSE
diff --git a/package/crucible/crucible.mk b/package/crucible/crucible.mk
index 2206663e248f..5eedbca8eeae 100644
--- a/package/crucible/crucible.mk
+++ b/package/crucible/crucible.mk
@@ -6,7 +6,7 @@
 
 CRUCIBLE_VERSION = 2023.11.02
 CRUCIBLE_SITE = $(call github,usbarmory,crucible,v$(CRUCIBLE_VERSION))
-CRUCIBLE_LICENSE = GPL-3.0
+CRUCIBLE_LICENSE = BSD-3-Clause
 CRUCIBLE_LICENSE_FILES = LICENSE
 CRUCIBLE_GOMOD = ./cmd/crucible
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

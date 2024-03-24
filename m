Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E21C47DD9
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 21:25:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7222C81DA0;
	Sun, 24 Mar 2024 21:25:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UGLOa9XVrr7q; Sun, 24 Mar 2024 21:25:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 379D981DE1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 379D981DE1;
	Sun, 24 Mar 2024 21:25:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8D9EA1BF4E5
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 21:24:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7AF7060679
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 21:24:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W23WX9D2Y11B for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 21:24:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c34; helo=mail-oo1-xc34.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3222E605F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3222E605F2
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3222E605F2
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 21:24:58 +0000 (UTC)
Received: by mail-oo1-xc34.google.com with SMTP id
 006d021491bc7-5a470320194so2061549eaf.3
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 14:24:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711315496; x=1711920296;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OlTl7T/+2KNB9SYh5ZkMy68Q6A845O9lAw58Y3jlUlo=;
 b=WcYpUqpLZeGNtbNIhGk4o1gvtMdxAWRLQmarXxyk1VHsUcClEmmRo/vsDuQoV/ZdNY
 Z9PEew377Urkh8uRpUMimbJzAxi5E01i1lRLzsJAaPKT/QUjnub7rPTAm9aBJQZCK3qT
 CzDllBz13C/nbeiFyCm8j532pyKIeeUVTBBrOrREVQdqag2rrkfewNKXW41WfYYRzNiO
 SI6ZRG3MSDd33Zwr2mru7ZnDL563sEqo1adwc1nCNdw0jgDHq8XbUAuensrM0kySLIq1
 1kJAGMsEQD58OC0PztNUSHOpQKedLARDmHBcklSawN/pqbR3uYWidJcJK0yW9FLMnUdv
 gxVw==
X-Gm-Message-State: AOJu0YzEHUpO9Gk3p3dA2AxSUXeZzY8Rp81X8QE5BDFaQki0lWoxiLpO
 UL2z9zngkDxUKyW4xzADmAZ/MSU76ZGReGNBcD9EXhhLoq9/a4ivqUPURZGggIO7cj62EwEjvZE
 5
X-Google-Smtp-Source: AGHT+IFWOc3MhddQyp2NyPNV68P7oXegJjWsubaW8hZUPBXM792IukFV7FVD51d9aOc4ucbDULLVLQ==
X-Received: by 2002:a05:6358:2490:b0:17e:b631:25d4 with SMTP id
 m16-20020a056358249000b0017eb63125d4mr6328812rwc.2.1711315496281; 
 Sun, 24 Mar 2024 14:24:56 -0700 (PDT)
Received: from localhost.localdomain ([204.229.2.167])
 by smtp.gmail.com with ESMTPSA id
 k7-20020a17090a658700b0029c3bac0aa8sm8979556pjj.4.2024.03.24.14.24.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Mar 2024 14:24:55 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 15:24:37 -0600
Message-ID: <20240324212441.526544-6-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240324212441.526544-1-adam.duskett@amarulasolutions.com>
References: <20240324212441.526544-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1711315496; x=1711920296;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OlTl7T/+2KNB9SYh5ZkMy68Q6A845O9lAw58Y3jlUlo=;
 b=BuF9+CX204+N5TtGforYfT2/DLsxQ8mOgZro/lbuejLpCO/QGfQAqFOYHaHNWxHIhF
 59C/oG1pxtX7iqvuHE4BQglKf2Gyssbp5s687zxWdW/Kpkx2Jv5OwRUl5V9ihX8Lfjac
 8kur6z1YsXDMFlt2vbizapCBqv+N2LZVqQU1M=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=BuF9+CX2
Subject: [Buildroot] [PATCH v2 6/9] package/restorecond: bump version to 3.6
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
index 96ef8d2a50..93495d8b7f 100644
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
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

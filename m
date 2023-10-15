Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8538FCDB47E
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 11:49:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E1B28143D;
	Sun, 15 Oct 2023 11:49:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E1B28143D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bw8Le1wA2zq0; Sun, 15 Oct 2023 11:49:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6631E81367;
	Sun, 15 Oct 2023 11:49:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6631E81367
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E3C3F1BF372
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 11:49:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BDA6760B98
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 11:49:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDA6760B98
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dlH48tJjGi0e for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 11:49:54 +0000 (UTC)
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A3F5260B94
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 11:49:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3F5260B94
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-53e84912038so1214874a12.1
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 04:49:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697370592; x=1697975392;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VzFprROLE7OrccQ2b4WGpkN+M1NV2gQNGGEOymtBvlk=;
 b=urDAsM4lfPLrv77sUgnCNNzRmY2tPUz/4FRJ3WdD8l8lI1hVxFfR3c5zKBSys/wgDu
 DVjmzRDCW8m97kUJN6mD8H4ITLddkqdU3aCwRtZuXLg1aiQ2yOdvWQrg2EQvPhmuQ2yH
 D3c9nYIpfH73yvQgQXOpRHUClY3VRhTv1UV3jCRqz7/8yeat6uzIrVtNaarL0yAq0mmQ
 sx/1dxt4A/ufT2UZSqw8RWPSU9yeKLUpb39ZDou5F3k8cOt4Nu4QWNJzVPNg1V5LkKa/
 3u/lx9PNC9EDLlemklTBf4EAGJii3ZVupPMICTeheiqX7x1V0mtlKL9II/PkN+6LhI8E
 Sx3g==
X-Gm-Message-State: AOJu0YxKEjucjLAOhx3Hpnb2ibhZbf82fzzHrrXZFYLQFdbNwSMRYEGv
 lCLsPmUVHT8hKfH9rzv++TQ7msLHg0s=
X-Google-Smtp-Source: AGHT+IErmjGzbshD0sC84p3UxEQBwN/ZqbzcGMcbGwT469ZFbaqiafIKcm8Uyx5z6NICmE++LluX+Q==
X-Received: by 2002:aa7:cb93:0:b0:52a:943:9abd with SMTP id
 r19-20020aa7cb93000000b0052a09439abdmr27126232edt.30.1697370592484; 
 Sun, 15 Oct 2023 04:49:52 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:63d3:7700:b737:23f:c590:d252])
 by smtp.gmail.com with ESMTPSA id
 cm7-20020a0564020c8700b0053d9f427a6bsm6853918edb.71.2023.10.15.04.49.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Oct 2023 04:49:52 -0700 (PDT)
From: Titouan Christophe <titouanchristophe@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Oct 2023 13:46:15 +0200
Message-ID: <20231015114615.235625-1-titouanchristophe@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697370592; x=1697975392; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VzFprROLE7OrccQ2b4WGpkN+M1NV2gQNGGEOymtBvlk=;
 b=iOH7EdxT6/3uk8kO/SN483ti2u3hbQkF0AmPPsTeVn602FBeX/x0jhR53xRd27OhcL
 UcucgMEgPVvUEV5y1UmQ1Tbu5Jd6otr9734n6Cp/vzYl6CKRuE8Q9KY8WxJwqN4hb9yJ
 DV5FoUu7araBvKyGWaV8k1hhugE2yMVym8gkrb9e7q2QptVSGjX2+bLDAG3T4KpfFzUl
 IxeXQW0hu73RPx1Nj5wQHi7wuaZtIGb4u+WbZpa3sxwBHhVjL3WacCcqaGpkpQ7KEqWv
 O9MeL2zGLWyd7WZU9PPReoShF0IDksJHp/8XfvU0Li+K59D6+WpjfrvKXWDLyyb+BOy2
 BFhQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=iOH7EdxT
Subject: [Buildroot] [PATCH 1/1] package/waf: bump to v2.0.26
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
Cc: Titouan Christophe <titouanchristophe@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
---
 package/waf/waf.hash | 6 +++---
 package/waf/waf.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/waf/waf.hash b/package/waf/waf.hash
index c8d464ebfb..1ad535febb 100644
--- a/package/waf/waf.hash
+++ b/package/waf/waf.hash
@@ -1,7 +1,7 @@
 # Locally computed
-sha1  9cc6db88ecda57067024f368722ecbf48a3bba1a  waf-2.0.24
-sha256  93909bca823a675f9f40af7c65b24887c3a3c0efdf411ff1978ba827194bdeb0  waf-2.0.24
+sha1  e310e29a44f23f80591f2aa6c2d4c30e5f1a26a8  waf-2.0.26
+sha256  dcec3e179f9c33a66544f1b3d7d91f20f6373530510fa6a858cddb6bfdcde14b  waf-2.0.26
 
 # The waf script also contains its license, but is renamed `waf` in the extract
 # step, so this is a synonym for the above, to check WAF_LICENSE
-sha256  93909bca823a675f9f40af7c65b24887c3a3c0efdf411ff1978ba827194bdeb0  waf
+sha256  dcec3e179f9c33a66544f1b3d7d91f20f6373530510fa6a858cddb6bfdcde14b  waf
diff --git a/package/waf/waf.mk b/package/waf/waf.mk
index d98ab489ca..bffa27a926 100644
--- a/package/waf/waf.mk
+++ b/package/waf/waf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAF_VERSION = 2.0.24
+WAF_VERSION = 2.0.26
 WAF_SOURCE = waf-$(WAF_VERSION)
 WAF_SITE = https://waf.io
 WAF_LICENSE = BSD-3-Clause
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

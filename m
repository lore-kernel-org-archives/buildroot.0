Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C294C5478C
	for <buildroot@archiver.kernel.org>; Mon, 26 Feb 2024 20:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13A5260B39;
	Mon, 26 Feb 2024 20:55:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S_vpIVKyfnha; Mon, 26 Feb 2024 20:55:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E2F560B71
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E2F560B71;
	Mon, 26 Feb 2024 20:55:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E5D311BF271
 for <buildroot@lists.busybox.net>; Mon, 26 Feb 2024 20:54:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D1158405F4
 for <buildroot@lists.busybox.net>; Mon, 26 Feb 2024 20:54:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CQwFfOZgvwF3 for <buildroot@lists.busybox.net>;
 Mon, 26 Feb 2024 20:54:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 114B540663
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 114B540663
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 114B540663
 for <buildroot@buildroot.org>; Mon, 26 Feb 2024 20:54:57 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-6e09143c7bdso1967842b3a.3
 for <buildroot@buildroot.org>; Mon, 26 Feb 2024 12:54:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708980897; x=1709585697;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BwKZLR+2pthraVmpfd1szIsxDkWusqiJMCSgOQqxRQ4=;
 b=fawkdDmywFmOyFygaz4py/5s7YG76dfGfvXgdoxjJcZD8Bz6abS6QCAWY01x5pROmk
 8TGjtx5ASdrc1+nABS5L4o9jcAUqElIEsZknM203AdX0CZsfjmoEPbk5mMlyNgz89H96
 2G6aB0ZXosSI4XthehSdQ9dL0GIk8eTT6YGxrk4glsiFRyzWTgeZffXq50073ucizabj
 dkkA6KAGDmD50n2Tt1MRKAfmIOgxc0rWr3eHH8KrrM+j/kQ+K4Uf4RDp/T9GSyz6xl3M
 TI2ZrDeVLlKggvX0w38RapUH3SE/xnIXDL2EbfhlxkR59PlGbdh8SEPYIpKbf07UDjSY
 crSg==
X-Gm-Message-State: AOJu0Yx0ksWHl7BxzAFLxtQea7Qh8XyL4poEzon7a67x99a3dBqCdyqq
 jxH7Eb24S9GND17p2/FYRmQ2IXc/TvJcV0KfJqoN7uEpqBwwIFARF2hBG/gv+kZ8Bt8EWiaMBh6
 a
X-Google-Smtp-Source: AGHT+IE/5lEFnqn+TFjEU5/2U1hhzFeZ0OR6g2E99v/38Okh1ZXbaezduJvy8Fg27Uy1GRna8Oozjg==
X-Received: by 2002:a62:bd19:0:b0:6e5:d6:134a with SMTP id
 a25-20020a62bd19000000b006e500d6134amr5071344pff.14.1708980897039; 
 Mon, 26 Feb 2024 12:54:57 -0800 (PST)
Received: from DESKTOP-OI0KN2B.amarulasolutions.com ([204.229.2.167])
 by smtp.gmail.com with ESMTPSA id
 a28-20020a631a1c000000b005dcbb855530sm4369991pga.76.2024.02.26.12.54.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 12:54:56 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 26 Feb 2024 13:54:44 -0700
Message-ID: <20240226205446.842600-8-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240226205446.842600-1-adam.duskett@amarulasolutions.com>
References: <20240226205446.842600-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1708980897; x=1709585697;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BwKZLR+2pthraVmpfd1szIsxDkWusqiJMCSgOQqxRQ4=;
 b=WwecHXqvJNXdru51ro1KNZ9K6Ogymme9lKWO41qF7qZDXs7+CCKcQAJAYKcuQ45qX/
 fogMu+UVlIqkE3cFH672GouFpEXheNiqWxtqrAMkCTXw3ovijGhwrVpuw7mKt27AKwQT
 Betgg05ilLIr+yNRjLJVIUTgG8vocMh/TbRsA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=WwecHXqv
Subject: [Buildroot] [PATCH 8/9] package/selinux-python: bump version to 3.6
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
 package/selinux-python/selinux-python.hash | 2 +-
 package/selinux-python/selinux-python.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/selinux-python/selinux-python.hash b/package/selinux-python/selinux-python.hash
index 3592540703..96be214fd3 100644
--- a/package/selinux-python/selinux-python.hash
+++ b/package/selinux-python/selinux-python.hash
@@ -1,5 +1,5 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  8245bb4dae59333461f19ca0c79a829081f07972fa5e3ad4c2b2b917dd71d96b  selinux-python-3.5.tar.gz
+sha256  e2867d4cd26f9869c55216cc20ca7d10442491a0fbf256116ade99ec39426ec0  selinux-python-3.6.tar.gz
 
 # Hash for license file
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  LICENSE
diff --git a/package/selinux-python/selinux-python.mk b/package/selinux-python/selinux-python.mk
index 7505474aa4..84fc9cbc22 100644
--- a/package/selinux-python/selinux-python.mk
+++ b/package/selinux-python/selinux-python.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SELINUX_PYTHON_VERSION = 3.5
+SELINUX_PYTHON_VERSION = 3.6
 SELINUX_PYTHON_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(SELINUX_PYTHON_VERSION)
 SELINUX_PYTHON_LICENSE = GPL-2.0
 SELINUX_PYTHON_LICENSE_FILES = LICENSE
-- 
2.43.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

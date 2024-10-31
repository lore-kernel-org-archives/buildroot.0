Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A55DDD7495C
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 13:37:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46FA560A8B;
	Thu, 31 Oct 2024 13:37:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JyKHYNABdLYx; Thu, 31 Oct 2024 13:37:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39C7D60A8D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39C7D60A8D;
	Thu, 31 Oct 2024 13:37:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A2D515E50
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 13:37:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E9E88145F
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 13:37:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Buw-GiK64F51 for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 13:37:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com;
 envelope-from=boerge.struempfel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B5A178145E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5A178145E
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B5A178145E
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 13:37:21 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-83b4e8f3bd0so4149639f.1
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 06:37:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730381841; x=1730986641;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ikwj6lXJQwwubh+zzQeDmuSItKpzpe2NsWggimR05Mk=;
 b=ku8XVoYekViuvVRpyo/9yC34iBM1WWI/yLNclRXi7TWeMYNzaVLClYzakMEM2JjhHo
 5phK8zcIuoTf6AQDFUpzItLEhpudcV/RPvIBzkKc9Qv06YteHpBJZjqdETQxaZigBX7D
 cyapHQHfFtU0/BpVj7mQLoNqXNSLVa8ANX5Tlti0b8GUo6MhziG3//21Ctn+x8lJoy7K
 pSiB/+B2ZwViHMGSNaQg/GyTNrzo864fI58X3lbUMOIMIAPLVvUN7ohBgZUbGcU6hvCW
 pZRjWlNKTQiFuVWpsD0USuRvp+L08s1eGJAW+O5A2f6ryrctVwV/+Nwwl+6u6D1w7Fdh
 RJ4w==
X-Gm-Message-State: AOJu0YygZk8G/Y7zbR+0WufVy5JwPdXDe6PkSgnjNAnOw5JysamtHdga
 fvXeuj7GSdCdAM+Mic8yIzn+7k5rSlxp3V9GbkZ1uptCyACrPKR0BWZnJ6p9
X-Google-Smtp-Source: AGHT+IGAG5VFjgnwFpEcs/sakkWmacn6WbAH23tqG5z3WW82uF1aQMwiJnA7JaEIpeyMEWM9Nhttow==
X-Received: by 2002:a05:6e02:1d19:b0:3a2:6cd7:3255 with SMTP id
 e9e14a558f8ab-3a4ed30c266mr48721485ab.6.1730381840510; 
 Thu, 31 Oct 2024 06:37:20 -0700 (PDT)
Received: from wslxew228..
 (p200300c78705c3009da80627a0a19c33.dip0.t-ipconnect.de.
 [2003:c7:8705:c300:9da8:627:a0a1:9c33])
 by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a6a97b04dasm3379735ab.16.2024.10.31.06.37.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 06:37:19 -0700 (PDT)
From: Boerge Struempfel <boerge.struempfel@gmail.com>
To: buildroot@buildroot.org
Cc: Boerge Struempfel <bstruempfel@ultratronik.de>,
 Boerge Struempfel <boerge.struempfel@gmail.com>
Date: Thu, 31 Oct 2024 14:37:02 +0100
Message-ID: <20241031133702.1467746-1-boerge.struempfel@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730381841; x=1730986641; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ikwj6lXJQwwubh+zzQeDmuSItKpzpe2NsWggimR05Mk=;
 b=G169jtaIr026hGuKYSQyvhMYbJ1eJSyIIwDFm5yhYgX/f5yKNjkvT+ivLCpa3Of7dW
 hwvXHXtTuv4cz1wwBxgEh+acinrBLZJh8JwFOKpaumwTQXt9XSCRSJGHlrbyqPKKsLNq
 BAQMjNuzRfUE/sFADUaTGgCdI+O+uaiGoUiR9+H3O+o8WzW61a1vJ2ze9t9OYsqrWrEq
 4PoA/8C1MPPgA5F6yA/o0wiLHfwro62M+gfFsuke5fDsdP8CCC/YaC322JPvqTw4/P/A
 M4580jpph89dsenPJAym5RjLOVUkb7uUtb6tK83PLJDDieqjVQphdzzDNRBFYo0DnCGf
 J27w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=G169jtaI
Subject: [Buildroot] [PATCH 1/1] package/libgpiod2: bump to version 2.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

multiple improvements and bugfixes [0]

[0] https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/tree/NEWS?h=v2.2

Signed-off-by: Boerge Struempfel <boerge.struempfel@gmail.com>
---

This patch only bumps the version of libgpiod2 to 2.2. It does not include the
new dbus support feature as it depends on libglib2 >= 2.80.0, which is still
debated over on the mailing list.

I do have the patch for that ready however and will submit it, once the discussion
is settled.

---
 package/libgpiod2/libgpiod2.hash | 2 +-
 package/libgpiod2/libgpiod2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgpiod2/libgpiod2.hash b/package/libgpiod2/libgpiod2.hash
index 3b498f0eb9..f51cc80b9f 100644
--- a/package/libgpiod2/libgpiod2.hash
+++ b/package/libgpiod2/libgpiod2.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/software/libs/libgpiod/sha256sums.asc
-sha256  2be4c0b03e995d236c0e476e14aeb475d7b431dd1439609b6d65c540f91eaf58  libgpiod-2.1.3.tar.xz
+sha256  ee29735890eb1cc0e4b494001da5163d1a9c4735343201d22485db313601ca07  libgpiod-2.2.tar.xz
 # Hash for license file
 sha256  f646ad5159efb51c1130a4b43c31f0759750b1e254d2acf510f368ee2e2085c3  COPYING
diff --git a/package/libgpiod2/libgpiod2.mk b/package/libgpiod2/libgpiod2.mk
index 142289cb3a..e73f8d699f 100644
--- a/package/libgpiod2/libgpiod2.mk
+++ b/package/libgpiod2/libgpiod2.mk
@@ -6,7 +6,7 @@
 
 # Be careful when bumping versions.
 # Dependency on kernel header versions may change.
-LIBGPIOD2_VERSION = 2.1.3
+LIBGPIOD2_VERSION = 2.2
 LIBGPIOD2_SOURCE = libgpiod-$(LIBGPIOD2_VERSION).tar.xz
 LIBGPIOD2_SITE = https://www.kernel.org/pub/software/libs/libgpiod
 LIBGPIOD2_LICENSE = LGPL-2.1+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29701C6FD1F
	for <buildroot@archiver.kernel.org>; Fri, 29 Mar 2024 18:53:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD7A060EF2;
	Fri, 29 Mar 2024 18:53:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RtdCIlqid8Va; Fri, 29 Mar 2024 18:53:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 952626078B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 952626078B;
	Fri, 29 Mar 2024 18:53:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BFA9F1BF3ED
 for <buildroot@lists.busybox.net>; Fri, 29 Mar 2024 18:52:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC24360654
 for <buildroot@lists.busybox.net>; Fri, 29 Mar 2024 18:52:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UDp5ToG_4Jbx for <buildroot@lists.busybox.net>;
 Fri, 29 Mar 2024 18:52:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 395CE6062F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 395CE6062F
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 395CE6062F
 for <buildroot@buildroot.org>; Fri, 29 Mar 2024 18:52:57 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-6ea9a605ca7so1651871b3a.0
 for <buildroot@buildroot.org>; Fri, 29 Mar 2024 11:52:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711738376; x=1712343176;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/YEexF2POm7J3SYkEvkqzgJ6nSRFvc0LG6ykZifIbdw=;
 b=eDlG4Na/U+yt0OnB5SOhlvVwBNMFk8oMwGxPQMFZDNMmv0rY6ggjlzSPJQvxv0WgC2
 cPDvZi29fc/PVaS5kAdozeo4Yy+1vZkmL4obKnl/cIyvE6OR7dnDmLLvD0Oi06Ks6mWj
 2KXg0U8An7wuZ/tuOMlL+4AivQc89KclnZ/9PUG0eEvwS4ekzPqcNvlBtDjpC7PmMThE
 9cIfvOz503SXETiHoysL2nlLpn2g9JPYr8NTOWQL6Scz67OCb2PEwrpWCTf/Z5gTR/3q
 U0DAvj+4F2zfU+fq5qE95tbNJvyn75N2BTi6CtPuaBbUecqJ70vy+xp+lBh89dE38sQp
 LB4g==
X-Gm-Message-State: AOJu0Yw89db1arjzISnY/nvkK8V/HgwBqibRdkTWXbUpYBJQAeopl97G
 hnvjnTJ7dM4SiICuWtgP7kKHptHsjCcWmh9FhiQNF/cXdxMzYBRbryuMEQoBHq4CX4tNaZVjDra
 5
X-Google-Smtp-Source: AGHT+IERdWMpyT/c/jbrcZaWz2FqQIjHK3zWhLmGfNhFKTYl7rfUvsKxNfZcQ0bKB3HHrarDzmf8Lg==
X-Received: by 2002:a05:6a20:12c6:b0:1a3:5624:a5a4 with SMTP id
 v6-20020a056a2012c600b001a35624a5a4mr9181842pzg.23.1711738376472; 
 Fri, 29 Mar 2024 11:52:56 -0700 (PDT)
Received: from localhost.localdomain ([204.229.2.167])
 by smtp.gmail.com with ESMTPSA id
 j11-20020a63ec0b000000b005dc5289c4edsm2861772pgh.64.2024.03.29.11.52.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Mar 2024 11:52:55 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri, 29 Mar 2024 12:52:46 -0600
Message-ID: <20240329185246.387792-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240329185246.387792-1-adam.duskett@amarulasolutions.com>
References: <20240329185246.387792-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1711738376; x=1712343176;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/YEexF2POm7J3SYkEvkqzgJ6nSRFvc0LG6ykZifIbdw=;
 b=a2BrwiFVEABU34g0fbW3DQu2RU2F8Cy4hBVkW8t+eo3c5lwjv0RHZhSuHKACvxqD4d
 o9WCQQBBLXc+Ydw85rO1KKEPQ7+aNfqo31cM8RJ9IKBLNcQvaKD4yN+jrGlafbR2S0zx
 FpiLGeKs0fzRYIKwkijPA5vIXNq/Tshz0bKmk=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=a2BrwiFV
Subject: [Buildroot] [PATCH 2/2] package/flutter-engine: bump version to
 3.19.5
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
 package/flutter-engine/flutter-engine.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/flutter-engine/flutter-engine.mk b/package/flutter-engine/flutter-engine.mk
index ff21e0949d..d9c2b3dee5 100644
--- a/package/flutter-engine/flutter-engine.mk
+++ b/package/flutter-engine/flutter-engine.mk
@@ -21,7 +21,7 @@
 #
 # There is no hash provided, as the gn binary (used for configuration) relies
 # on the .git directories. As such, a reproducible tarball is not possible.
-FLUTTER_ENGINE_VERSION = 3.19.4
+FLUTTER_ENGINE_VERSION = 3.19.5
 
 # There is nothing for Buildroot to download. This is handled by gclient.
 FLUTTER_ENGINE_SITE =
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

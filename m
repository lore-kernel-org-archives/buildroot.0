Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6889C3DA4B
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 13:41:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FF2881236;
	Mon, 15 Jul 2024 13:41:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O9sKg4M-9NzY; Mon, 15 Jul 2024 13:41:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D13681249
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D13681249;
	Mon, 15 Jul 2024 13:41:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A3AB11BF969
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 13:41:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9EB7281236
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 13:41:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fA3aACnE6GuJ for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 13:41:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 477B481249
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 477B481249
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 477B481249
 for <buildroot@busybox.net>; Mon, 15 Jul 2024 13:41:27 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2ebed33cb65so58719641fa.2
 for <buildroot@busybox.net>; Mon, 15 Jul 2024 06:41:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721050885; x=1721655685;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lgBqi4p04ayCPXFTm08goq95tl0COSb8ZQqJeLTRLyA=;
 b=G+9h6hyNcbiCqhdF0xUVqjPH/JF2qSXD4ugrH/g4yKtFuuJkxDRsZndmen0kiqIFjI
 wigcATbEAXJyO6Huh6b7Y5niEMzfXC3zzFhd3YJ16gcK7g+fzXH9O7EGIkCME2VKsKaE
 hza7pb55q+ms/RZ0IOA9J8hWff5ZWg4CN8Gc6628W415AuBzUqBsk4F0RCWVZRGSzjO1
 a+2wewNWlatvZMRJGcc8FyDxNtAkAEifQVbcZjsAtynukh7+4JGLTWChmgm+zgFrBLNv
 JxVVepINgVyWP7iGE3Pp1XmD8JFU60JDbQff4+96X8cGgjtM0yf/L4NiU/+jHtWj0QgX
 /Y2w==
X-Gm-Message-State: AOJu0YyQ66DTNa5cc9x5f+/w3MGOkxgXLglAAp+ZwkXJnFnYOXr90yLf
 4U05ODLt975nbLVKRVU9HnVOZm7PBlCzMEsn7Cqfrzm/xAqYAitMcCnuIXCAQQukCboX3zVC25A
 =
X-Google-Smtp-Source: AGHT+IFlm8qdomvL+5G73xzpO/vnfeuA0MRs1Za6hKtKI+QIhzM7PjYhNtYRMJDPUs0aS4ux0vIelA==
X-Received: by 2002:a05:651c:198c:b0:2ee:46ec:60bc with SMTP id
 38308e7fff4ca-2eeb30fc98amr151662621fa.27.1721050885011; 
 Mon, 15 Jul 2024 06:41:25 -0700 (PDT)
Received: from vm-2404.. (140.33.66.37.rev.sfr.net. [37.66.33.140])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427a574e1f3sm89541005e9.0.2024.07.15.06.41.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jul 2024 06:41:24 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 15 Jul 2024 15:41:19 +0200
Message-ID: <20240715134119.508896-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1721050885; x=1721655685; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lgBqi4p04ayCPXFTm08goq95tl0COSb8ZQqJeLTRLyA=;
 b=Bmua9NiLMuU14CGgLyk5tHP+KjTM37kv1BQ5Gfj4k2f4IJ1IISGJ49X2MQKW0H0GV9
 uwdYbVoGASP3+BzJqQOmHh99yF6dS9PCZT1iOUhKi5m7g0zKdXM1w/mOMxz+ZyN3zjZ1
 k0iK+VS8QI0PohBgmhCHR9UEbboY280NDrC+v5g/XDco0k0EcHnKe2Y9s+RWyMcd23+S
 nQxUraMH7UykCL4qixrLXpmFCqehygRur+zUhouHlVlpn2XGqzN7m1OW2BGXmbtfpoW3
 N8ILArQYNpZ04wa2C6xLtuEYp5XuKtFdjTB2g7DOo3dAMsoIDCHrEXioNrIbhrgUwWXX
 9NIg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=Bmua9NiL
Subject: [Buildroot] [PATCH] package/nano: bump to version 8.1
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
 package/nano/nano.hash | 4 ++--
 package/nano/nano.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nano/nano.hash b/package/nano/nano.hash
index fc9a0947a..04e3c6290 100644
--- a/package/nano/nano.hash
+++ b/package/nano/nano.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://www.nano-editor.org/dist/v8/nano-8.0.tar.xz.asc
+# https://www.nano-editor.org/dist/v8/nano-8.1.tar.xz.asc
 # using key 168E6F4297BFD7A79AFD4496514BBE2EB8E1961F
-sha256  c17f43fc0e37336b33ee50a209c701d5beb808adc2d9f089ca831b40539c9ac4  nano-8.0.tar.xz
+sha256  93b3e3e9155ae389fe9ccf9cb7ab380eac29602835ba3077b22f64d0f0cbe8cb  nano-8.1.tar.xz
 sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index 72f4de6a0..db614feb7 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NANO_VERSION_MAJOR = 8
-NANO_VERSION = $(NANO_VERSION_MAJOR).0
+NANO_VERSION = $(NANO_VERSION_MAJOR).1
 NANO_SITE = https://www.nano-editor.org/dist/v$(NANO_VERSION_MAJOR)
 NANO_SOURCE = nano-$(NANO_VERSION).tar.xz
 NANO_LICENSE = GPL-3.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

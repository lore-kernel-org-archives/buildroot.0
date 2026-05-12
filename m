Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F5DCD4F39
	for <buildroot@archiver.kernel.org>; Tue, 12 May 2026 19:37:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB0C94101E;
	Tue, 12 May 2026 19:37:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VdKV6aJ-HMqx; Tue, 12 May 2026 19:37:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E79341011
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778614627;
	bh=qeT2pyiI5YGGXnTWe+SK+cXN9IAlQe6lbRLFPvd+bWM=;
	h=From:Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OtPJRlVTr6xDpCEvIYvwL/ShLHwCMcWXROE7gd+uCMqOnF2jw20W76Oc47QtsPWMZ
	 4T6K4zPuURYTCcfgD6ArtF8z7NQ2D+P27sTYV9aoE7O7iP+E22lx8caoL5uUJ7Mp8R
	 lqZ8B1u+TuqcEPUYU6ryrel2Wut41+FCqQX7W8f8Ng/xnXXsavep/z4ljqM2ltLaPQ
	 B7bF8zJ0Mq8kXCYbzD1oaX3Z7cZq4N9GzPJkp3lBh8ahDsqamLXwNrkHIopJAQ8IkY
	 2rQI9HgdD7gQgzE3M0bsCv6Q3BIwsxfLbskL8uVOg+LUHhEPS7gJyQN1SEtyYU7ttG
	 ESJHVSAx8X26A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E79341011;
	Tue, 12 May 2026 19:37:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 34B3B15F
 for <buildroot@buildroot.org>; Tue, 12 May 2026 19:37:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2629782531
 for <buildroot@buildroot.org>; Tue, 12 May 2026 19:37:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HR9vSInd_Brc for <buildroot@buildroot.org>;
 Tue, 12 May 2026 19:37:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 521A482521
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 521A482521
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 521A482521
 for <buildroot@buildroot.org>; Tue, 12 May 2026 19:37:03 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-834f1075805so4179274b3a.2
 for <buildroot@buildroot.org>; Tue, 12 May 2026 12:37:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778614622; x=1779219422;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=0YTCCu6VB+dq8jxhRi6RM6CbYcyaBj9Wa6KC+K3Rr+o=;
 b=TuqVgAe6WLlysAWOHFRIA5HvKpzWCvPZD6HkUcqwoHzP2UJr7O3gVlp/JRUNdzKhHP
 d+MRD11UNWnO9KKjcYqEdcOES/nu8OHkvYtUMRjx1XaG+Lta0SZgTJkfphuQ22XpMV/N
 1sLikrpUIZtkTt1i/JkdxFIXHpQY/hseADGp6yJj3BSa05oZLX3eI+6IbWfiqigkW3E/
 733Hg2yHTAsLrBXRj0cAmEloewsjh8YO9h8krF4DpNcVbz2gsWh+lAD61NP1ma0GwJFD
 6fCETvVEyJMkwqukDpV7CVDpKKRwVzf0kLF0Q4sqjEwLYwH5lSW5wSHbdivN7YdUkyez
 7vyA==
X-Gm-Message-State: AOJu0YxTxzScTbq+TjuyMiGbT8pcL34tkq2hSp1WI6iw6eQNtYXnaIwb
 hkkwhkjHeQPKlBwudPrXx8Cx6PKHY5SCXZ9Ys+pscTeqQdVB2G6arpRZ
X-Gm-Gg: Acq92OElgCvA2QI1y19FyiG+Je7LVilNFpyeNjcPSuRJlsFtQKpLme5dnF6LFldJGQW
 0hb5/2g8UPHuiKoUhWGEiip3j7BZ7e9Bc8awlH0UJTApoCVt2SfGkY3qwf4Yrx/TjYTIUuWw/b3
 S1IQbi7CBZGAjfsGivB4XI9Y+ABHm+c7Zs6bVHGxqWAThRYpMmUPnrXouf4pVO8pt0mtfXoWNqA
 6sSGTp45BuCPwaw6KvnF1yi9pp2noelMzFlp24imCs1tzFIhAKTx6iTDlryqReHtA9BCb+awogj
 qk86rKOa3CIO4NTEvhMgr1B9ZN5/QIxhp1piXJ8bAH2pesIOgbreDoG0OmQpu/JIrptNPiUsYAN
 Xjrg9hqDsTJqTaHpJEUIfmPcymFwK3Y5KDGO5qGnnBRtej5XiV8ug1ArwVWoNQXVU6p3jK1E8XO
 XOJ3MSFKakiMXFP9H4TN2AtdRf
X-Received: by 2002:a05:6a00:3d44:b0:839:f1c0:13ce with SMTP id
 d2e1a72fcca58-83f042befc3mr48870b3a.40.1778614622456; 
 Tue, 12 May 2026 12:37:02 -0700 (PDT)
Received: from wash-3.local ([50.120.90.9]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-839679c8634sm28932799b3a.39.2026.05.12.12.37.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2026 12:37:02 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Tue, 12 May 2026 12:36:32 -0700
MIME-Version: 1.0
Message-Id: <20260512-virglrenderer-v5-3-1806e588eb59@gmail.com>
References: <20260512-virglrenderer-v5-0-1806e588eb59@gmail.com>
In-Reply-To: <20260512-virglrenderer-v5-0-1806e588eb59@gmail.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>, 
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Romain Naour <romain.naour@gmail.com>, 
 Joseph Kogut <joseph.kogut@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778614619; l=2121;
 i=joseph.kogut@gmail.com; s=20251022; h=from:subject:message-id;
 bh=t1I7vhbxbbylbah+L/q436JRAKySLpH8vFAIRq6m0DE=;
 b=kpwpbJlOmcUOYKhWQgkvS7Eh1w3WLzBowO56mrr52uXZuV2z4Gy0qTF/KjU31cY9wFeEUDKOT
 oMnGDCWXOvXC2p4ykPls14IgriI2w4dWX3i5bdF2VKIGpxPHXOC7YsW
X-Developer-Key: i=joseph.kogut@gmail.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778614622; x=1779219422; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0YTCCu6VB+dq8jxhRi6RM6CbYcyaBj9Wa6KC+K3Rr+o=;
 b=Mhv4b2RmOJ6WjG094R5VM7TTZJl3jeDFOl+jYVTbmDCKMtdo9uGBzpOzAwcljzc7O5
 1PQPN4jpIV0dGrBPgrizQAiUCFsAOrbgVgd0jtKTAAHDb+VxBUamtdK/DxAlwkODVbG6
 qYq3Y1Nmuo8pT2yfXnYryzU/onXo4+QO09WZrtCbdCsoHAFYjZnGNeQV2Y7OGKPV/9pw
 qDpC1vmwFX6yBWFI8lF5JkRbIA+qsUx6y8U9J9A35sZokspeeO0cVQ4wZqwUPYj9XTjc
 1EGxwrdlLcxDk+Ref3PDaoBsrBXJdtd9cAr1y74pgnH+QiTn32lfg7FPzjtjvVpCUHV8
 eigw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Mhv4b2Rm
Subject: [Buildroot] [PATCH RESEND v5 3/5] package/virglrenderer: Fix build
 with glibc 2.43
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

Add an upstream patch to fix the build with glibc 2.43, not present in a
stable release yet.

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 .../0001-fix-build-with-glibc-2.43.patch           | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/package/virglrenderer/0001-fix-build-with-glibc-2.43.patch b/package/virglrenderer/0001-fix-build-with-glibc-2.43.patch
new file mode 100644
index 0000000000..fda1d9b218
--- /dev/null
+++ b/package/virglrenderer/0001-fix-build-with-glibc-2.43.patch
@@ -0,0 +1,39 @@
+From 986b5fc57b07c06b5e0b3a3694d06898ebc80163 Mon Sep 17 00:00:00 2001
+From: Maximilian Hofmann <maxi@maxiicodes.dev>
+Date: Thu, 26 Feb 2026 23:28:58 +0100
+Subject: [PATCH] fix: build with glibc 2.43
+
+Several glibc functions now return a const pointer if the input is a
+const pointer and a non-const pointer if the input is non-const, causing
+a build failure.
+
+Fix this by declaring the output pointers as const if they are never
+modified, and for the lone failure where the output is modified, instead
+make the input non-const.
+
+Signed-off-by: Maximilian Hofmann <maxi@maxiicodes.dev>
+Part-of: <https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/1599>
+
+Upstream: https://gitlab.freedesktop.org/virgl/virglrenderer/-/commit/986b5fc57b07c06b5e0b3a3694d06898ebc80163
+
+Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
+---
+ src/gallium/auxiliary/tgsi/tgsi_text.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/gallium/auxiliary/tgsi/tgsi_text.c b/src/gallium/auxiliary/tgsi/tgsi_text.c
+index db7d7b95..7e37bf79 100644
+--- a/src/gallium/auxiliary/tgsi/tgsi_text.c
++++ b/src/gallium/auxiliary/tgsi/tgsi_text.c
+@@ -84,7 +84,7 @@ streq_nocase_uprcase(const char *str1,
+ static inline bool skip_n_chars(const char **pcur,
+                                    int n)
+ {
+-   char* str = memchr(*pcur, '\0', n);
++   const char* str = memchr(*pcur, '\0', n);
+    if (unlikely(str)) {
+       *pcur = str;
+       return false;
+-- 
+2.53.0
+

-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

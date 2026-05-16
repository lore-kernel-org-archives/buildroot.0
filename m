Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DDC6CD4851
	for <buildroot@archiver.kernel.org>; Sat, 16 May 2026 02:03:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 447D084A67;
	Sat, 16 May 2026 02:03:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sp1a3xoLv-ND; Sat, 16 May 2026 02:03:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6054884A68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778897013;
	bh=qeT2pyiI5YGGXnTWe+SK+cXN9IAlQe6lbRLFPvd+bWM=;
	h=From:Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CjD3meylVonozaQb95kxVsb0956/9sNdHp/Rg8z4orC/mJVI0An+rBuslt7kaLdxA
	 s+NGNF1qtN8vyQCpD90ous8lgVFflghbsjEi7J/JnSt8ghucMJKqzLb9dAuXz7IPuG
	 D9h795y3pjd/RC6sjmt8E9ObcR4FU5W1UzzAZcgv9eDr5u0PYHLQs6bWW/UHn+xKss
	 ShOH8VLoeyu/UVlig+TVdHQL7MFzr1EnnPx8QGKUux+GovCh4TUFakF1LezJqHYj+l
	 AO4tk7oF0NIgk68oU5FtAIP3OuI0/Xy79cBhjAJ6C/SsfYxtILatAbT/jBgz+0+kZA
	 ICZAcFxEKU0Ig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6054884A68;
	Sat, 16 May 2026 02:03:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 48D10206
 for <buildroot@buildroot.org>; Sat, 16 May 2026 02:03:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 39D5361B4F
 for <buildroot@buildroot.org>; Sat, 16 May 2026 02:03:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rUeXp1RblUNz for <buildroot@buildroot.org>;
 Sat, 16 May 2026 02:03:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4551261B51
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4551261B51
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4551261B51
 for <buildroot@buildroot.org>; Sat, 16 May 2026 02:03:30 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-c8021c8c42fso139641a12.3
 for <buildroot@buildroot.org>; Fri, 15 May 2026 19:03:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778897009; x=1779501809;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=0YTCCu6VB+dq8jxhRi6RM6CbYcyaBj9Wa6KC+K3Rr+o=;
 b=hbM3j9lgBsY/VsPv3OAzbuIn4nuIrutHy1a2sCVW75w42ftshGFhemww+6Zd6Rkcnb
 sijyhKh4VMAzSkz/4q0ejiVMXRv0clVLwMvKXT1ObZAsCZrPmU9Ej8ed/Qg7hgFSD8UC
 VjkVs1K/b06v8x+UlCKARZItVPMOD7WoEJEHCilj93UcKeUgNjgc/U8CyZiPxJS5+dSr
 1O0jNQ8kA4bfRYS2DFO0EvKTOAs4+ni5uy7vzXrrYCObsXB4C0RIQPNgENGLYrGSJg6N
 DJ35eLmyQ8Es37THigvf1AvLvbGdqTQ7sSeMn9XBfqUuLW/fip12G09zk/cg62EwBCu+
 xgyg==
X-Gm-Message-State: AOJu0Yw1QbmvJN0NN69xoxbXYRZt2D6teJccexV9j2tcjuFOEEpgxQMH
 OWr3C4fbVfRYQ1qeDv8O1Pu3fDxswBfAtkTPdfNMODb2Z78AWnk4j2V4
X-Gm-Gg: Acq92OG7GKLxx8jK6pCbfrLQLAeW+q1JprP4R6xqpzrHYFsEomdEO1G5URMKc2El5IN
 5lr3kLcz+F0wxWNrq/S75ceiTLuX91mruXFZBpqpS379nojeVG4CpWO9URaaaepKvoyK4hryxW+
 8o7nocx+zZG1X7IVdoXBzdzNg0CW8rSKO5YMVqofb3kwXgd2gAK1ufvjyMI9qF/tpOFnbPhJDRm
 QBiEKeDYcpplSHI3U1k8kkW+uN//8rqWHJFxXjtFZMHia6CR+4GEgk+s4E2Xb8nxYZWrEIuainJ
 o0iMXZRdANdTI/X2grtUnPJHwml+Y/hEbsXzfwhIkC3C+2+26Fve8z0y/f2vzMgHuGuFYIaVx+x
 nOYeHUnc4MaocwEQS2YB6ZNU2YaLYP7Y6xGd/SqeglEcgIXGX5/vQoCUp9ckCn0t4WBF7fNBv7X
 O4JUQxkdyVGt23/8piBFojhg8g5yAY+A2z93k=
X-Received: by 2002:a17:903:2f07:b0:2bd:a403:4ab8 with SMTP id
 d9443c01a7336-2bda403553emr13141075ad.25.1778897009479; 
 Fri, 15 May 2026 19:03:29 -0700 (PDT)
Received: from wash-3.local ([50.120.90.9]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2bd5c16ac4asm68201375ad.33.2026.05.15.19.03.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 19:03:28 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Fri, 15 May 2026 19:03:14 -0700
MIME-Version: 1.0
Message-Id: <20260515-virglrenderer-v7-5-1f1814b65ccd@gmail.com>
References: <20260515-virglrenderer-v7-0-1f1814b65ccd@gmail.com>
In-Reply-To: <20260515-virglrenderer-v7-0-1f1814b65ccd@gmail.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>, 
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Romain Naour <romain.naour@gmail.com>, 
 Joseph Kogut <joseph.kogut@gmail.com>, 
 Raphael Pavlidis <raphael.pavlidis@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778897001; l=2121;
 i=joseph.kogut@gmail.com; s=20251022; h=from:subject:message-id;
 bh=t1I7vhbxbbylbah+L/q436JRAKySLpH8vFAIRq6m0DE=;
 b=YmfapsD8+EaRFWFmq5M9Sv1uqbTlKWMi6BZDk0pR7uk4187H8GV2Q/dYrlFFC+4DLvTBxNUao
 yYLJVbPI4whA6YGt1Yu0AGwfrAmHYZLDfNFWWhOo9eVLuFFKjsiQC8s
X-Developer-Key: i=joseph.kogut@gmail.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778897009; x=1779501809; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0YTCCu6VB+dq8jxhRi6RM6CbYcyaBj9Wa6KC+K3Rr+o=;
 b=fUgrLpshZKQ7/xVoooOfihpXdwiM+OGkWbLKcqJaAZhmGVMT2MwOwjouf+G8xKJjyR
 FEBKC3i/J8ilIE7y3MhK6yZrhSdNMj1/JeLQYGASFBN/HJit0+o/aNwmdzJmup0jpcrN
 PWOYTgqz/d4Z1vXFwJ4r0PVw/iPgu9/3EBLzXuuPpGz3E/3dnvwe/PuH7MfJkRkmP4cg
 YlJ1O6LZxhuiyPG3Uca6Bt5R4cYkQM7Cw/KZpbhuR9P3YlUUxxiAgy/V47ty7tOs+DZj
 lRUpwsh/DBeBbalhKfMO8WRyH9tIx8tbw3OU8yHrQAZwfvt32yA8mVqd0dmyQxGAs2di
 d1jw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=fUgrLpsh
Subject: [Buildroot] [PATCH v7 5/8] package/virglrenderer: Fix build with
 glibc 2.43
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

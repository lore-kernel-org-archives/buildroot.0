Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE2731077618
	for <buildroot@archiver.kernel.org>; Wed, 18 Mar 2026 20:38:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 086A24175B;
	Wed, 18 Mar 2026 20:38:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZZtlMzzwXcAK; Wed, 18 Mar 2026 20:38:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 898AE40B96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773866310;
	bh=D6vrAUgijfwKOBsykoFulDqQhAmSfrMxBHl7fx5Vvpg=;
	h=From:Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N3Qo/HEmw87o3rVlxIGScLhNAtC+jhDz/04PJsgWzWYTBKrSa3ZdWfkTiHHdRsqxE
	 c91fr9ob8x+oaDJVte+8jBEx9Gs4X+0ei1qqid0jf7nq+/jK41rJThPMJgOxByf9uc
	 TuuemXqz4YmKhzwqqfpGJbtIADOd1MlVEt2afmkB6FCei4+ry0msmXM3ZZEY2JfPch
	 i7RaPEQwsA+K66HdCklygrEH6plKYUPEcTQedsofiGW8ziJbRtHI5RnInxi8qDmSx/
	 U0ZeT24U1ozMv8nRKxXj4LylfhxE3Scv4F9l8ZYqCtgkcZs/XZgM/zKPJiF9sscyiW
	 IVMug+AHgMclg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 898AE40B96;
	Wed, 18 Mar 2026 20:38:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 237F41B6
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 20:38:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0988D40AA7
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 20:38:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pjTDWc0yy-Ar for <buildroot@buildroot.org>;
 Wed, 18 Mar 2026 20:38:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 18FBA40A64
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18FBA40A64
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 18FBA40A64
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 20:38:27 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-829a27414a3so226057b3a.3
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 13:38:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773866307; x=1774471107;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=VZj0TvXt1cfEKDG9f8Ykdnu4PpjubPxj03fpEWr84ik=;
 b=j7f3G2ToYxyU4pMyBzdt8QTdu9KQke3hU1pg3sFOSBkTWzmv5Vpoe9+sNnUdG9F9Jz
 tbgexpEqe9pyyTRq1RjshwMZDkWeSKMx7FDMjQnAZlkg1kocR58kBYR7mU5ImJA0RcVh
 wFUYhFyYeOaUrBqLCYMic4vtf96pjKuG52f2xqe+uu4KyUVYwfzalxGHIb8UqP/S1m2X
 xLgfcyPsELvxBrvSIyedPF/Aw0a9XWGgAO/+1VUBE0S59cNJTNo8OcyQdH6QrIlQKqdZ
 OZY79/hFXpKx8+a+vaRmAtJZPRFqi8wJeLo6dPXclDzQbfN1KawgPtsGYwkI2YGWMUmB
 RPrQ==
X-Gm-Message-State: AOJu0YyU16RgK1EVGKGJLM1Jn6BMsydN1liHVXpkvFmR8LQx6r/UmuXA
 /tdVPgeyyW8GI3N5hFaYVdsevy8OZtLrHgM6S2thM/DLOyhPnFHd+neH9Qi3/QRsIa0=
X-Gm-Gg: ATEYQzz4J760b/wWi0NIrJyiFZmzYxCoqccFokejWJeq/qabJSROBL/L926iMuIkRq7
 AB5zcigYxEMDtpQ1pMU49vzl0YQQ/qh/7XmDUinTyolvAT8BymkjVtERfdBcCQ08E1yRx+5OI/k
 HLdfWP5hRXJ4SeqQD03BBgkCOuOs0C16z9kRJhBugNe8dhDZFKiGgkbgf92ZjaP9tTk86LeoQ1h
 In7rFErRE3KkJNkYfAI4BaVOzeq6ydqfxZNBxopbZHO9+GCQ9a1lPdG9DA4BlY4KZYVECoIifX/
 sEfDTV+Vm4hR559rdvCwvJv9Md4lCkGPwdlzjdo5FHasszfgBZSXAJdeZfrm8Jxr7G3AW4XXdCD
 +maMHIgZEMSBHGTg7HODF/rql6W7UiMJVFve3MTkn2bdgtKG68G87U83OXYyZapG/VDy2SxEU+h
 iw+SCq8h1E59ef2NgUwx2y4pK9VjU=
X-Received: by 2002:a05:6a00:1ca3:b0:81f:4ce8:d64b with SMTP id
 d2e1a72fcca58-82a6ae4f234mr3920906b3a.44.1773866307335; 
 Wed, 18 Mar 2026 13:38:27 -0700 (PDT)
Received: from wash-13.local ([50.120.91.49]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82a6b56ac50sm4636143b3a.16.2026.03.18.13.38.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2026 13:38:27 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Wed, 18 Mar 2026 13:37:59 -0700
MIME-Version: 1.0
Message-Id: <20260318-virglrenderer-v5-3-09a3274852d6@gmail.com>
References: <20260318-virglrenderer-v5-0-09a3274852d6@gmail.com>
In-Reply-To: <20260318-virglrenderer-v5-0-09a3274852d6@gmail.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>, 
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Romain Naour <romain.naour@gmail.com>, 
 Joseph Kogut <joseph.kogut@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773866304; l=2121;
 i=joseph.kogut@gmail.com; s=20251022; h=from:subject:message-id;
 bh=m9jbmsOCVg1B/sulqQmK1/2VvwLV2CCkWTabWjkoAw4=;
 b=6w5vmIaN18Y5FvnZEaPYyCXndy0ffMrGA8+Cr1T95p1LTC4IgRX80m+Ad8U3Av5IDtSsWX5gV
 GcS9Z3kiipjACull7fhRcU3v2ihGPH9NtNj5FYEX3Pgh/kGMuX0SAjK
X-Developer-Key: i=joseph.kogut@gmail.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773866307; x=1774471107; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VZj0TvXt1cfEKDG9f8Ykdnu4PpjubPxj03fpEWr84ik=;
 b=kS8b3hq94mMFAKiuE8ldBKj7f8EMdtFaUle0lCARxHh3HD6KHt1ZHD370fs1Cj2zyo
 ArRo1cWhTCIgkqXRoaIyYIf9EPJIOqy4OZCNbAOO1YEA3iAO3S34jD+otArUN50aKROs
 FhZZ51IvPH+HNa3nUsrbOKLdoWvEzfFhAZT5alPFDRKqRZdohID308F+PxzOGYbqu88I
 uatqRvGyUFrgtyhfTjDuiW2m0lBuuYdmvKTl4xlIqF1w/qtdpkfxHKTpV7YFk57XD3aO
 UYP5vRt4/TyL7dpuQLi0tRzifeU3FPiodMdR2n0PRwBiPlOVANxlOUBxnuQ0vXhoPSN9
 TeSg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=kS8b3hq9
Subject: [Buildroot] [PATCH v5 3/5] package/virglrenderer: Fix build with
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
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

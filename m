Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9BF1FF6E8D
	for <buildroot@archiver.kernel.org>; Tue, 17 Mar 2026 22:16:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78A978036F;
	Tue, 17 Mar 2026 22:16:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y5TiwNuuzmfo; Tue, 17 Mar 2026 22:16:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF94983F20
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773785796;
	bh=7+1rfr7Ufh1Qwx59qEb460kuyYEF1hgzivpj+gKu4Uk=;
	h=From:Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cJUVH8/8dLXMr9jVa44SeRlG93mN9Qen5S/nTKSZ7HmiHSNnO/INx2QcAJJ986ucI
	 EtbFff/ymYiirxaEyMWUrcw/XqQZbXpcpKQG3udv9RjuXPbe6Ba9hJIHx4LzADf7L7
	 4loNgYnEZNR9TgppEvxXLdQGklWuMgU4wYXUM8TkWKm8PiOJeOr8p62/ooUgq1MYvc
	 J4JnmKkFMQ0rMFAQbNG57zf6mhVDQXa/DBN096Zjb/w5dSOu4SQuJJeLAnoAkZO2pX
	 eWD9faCTsZPrruYqV8BZbHyCw1cgrAys8EpYfdyocQ6YRVzJJEW2hzKE0FldnwhuIT
	 IgV7p0yDKzuyg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF94983F20;
	Tue, 17 Mar 2026 22:16:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4EC771B6
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 22:16:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F2BB613E5
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 22:16:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DXfSiQvTQCxC for <buildroot@buildroot.org>;
 Tue, 17 Mar 2026 22:16:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5FBD260873
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FBD260873
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5FBD260873
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 22:16:32 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-3591cc98871so2837512a91.3
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 15:16:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773785791; x=1774390591;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=4aVjQrI0QIlUZsH3QQbt3ILxQRQQ0ImzVtd78a934zE=;
 b=ZGigAqhiz5md8VnelRU3x36XbSDddGNQgOQlXrAW2Pnbe6wWMFVQx2h8AYXohytlDs
 3CCk0XRjp3IiHyVO6AVYACe3dJkpPSafWHCOjDZLr34heLW1U7W9FvoZSnmrAqAj8Wxz
 H3FP9W19ssP/S0PYSBG8a2wEoTEnqRGQKnFRf/85eQVS/Q93RqbJiniRYS/w7qlWpwpD
 AdkQ3yK1j+zie2HEIbMRWFmfCRDpqNcdfGomMK06jjL/l5Bebunf7Kc0BgntTB/R79oj
 G65GB7D3DOytguu7pVY+ICtdJCJ3DqotbzQqxZwdoR6SrC+vJ0E2+TnhfH8su0F/UXvG
 zZAA==
X-Gm-Message-State: AOJu0YyXJ8M+EMO7QYGG1sj8rWmqNvlA9DxE9+XIqBGjRjVeeEj2g8XB
 70dghJCoDfI2uvMh7gitWvbIt4VC+6n6CfPgpZ7YjGUYsmvW8PF3THl0J2253VTlvGA=
X-Gm-Gg: ATEYQzzAbFTTUBdidLcyS92noZLslFd2CdSb4asPbiLeHRTT4V//caPHPkUrapUv0KM
 bcL64HYFX2ayN0xzayxLscdNKBWJUnGeW75jrrno3F77E4dSMYAne22y5+H/rnR0ogfuUdnllFr
 N3mknmpR0v+CND9uC76ZqT8e8p2/U07Dan+zcEww0q5tUQksyK+TpGWxWjH/FHuPjx/xA3q+eoY
 TvA8aYf5GHaw/QmYG1sh8uQQrdKWIhBRHW1yw55XTZJjVjB1nwSWjyYKYcAluRY8zer+vCVXvPO
 KcztH4cdd+QRbvOdeXmDvm25hL2CbPQHsOt+s1R8drLHCwKVKKZStA7AzMadfDw4XrOBilTxcId
 xMCkR8J2HESFRuv8us2zD1j6vVVmEBwA65KD5a7w26J67pE8muC3VL5HksPnNIv/PrFeLdy1e/p
 sBZun+srg0Z4juCUSgCr3JH05Vitk=
X-Received: by 2002:a17:90b:390c:b0:35b:8d89:71a2 with SMTP id
 98e67ed59e1d1-35bb9f47dd7mr801975a91.33.1773785791462; 
 Tue, 17 Mar 2026 15:16:31 -0700 (PDT)
Received: from wash-13.local ([50.120.91.49]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35bada2bfdbsm3997231a91.3.2026.03.17.15.16.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Mar 2026 15:16:31 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Tue, 17 Mar 2026 15:16:24 -0700
MIME-Version: 1.0
Message-Id: <20260317-virglrenderer-v4-3-ed223e222bb6@gmail.com>
References: <20260317-virglrenderer-v4-0-ed223e222bb6@gmail.com>
In-Reply-To: <20260317-virglrenderer-v4-0-ed223e222bb6@gmail.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>, 
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Romain Naour <romain.naour@gmail.com>, 
 Joseph Kogut <joseph.kogut@gmail.com>, Joseph Kogut <joseph@anodize.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773785788; l=2065;
 i=joseph.kogut@gmail.com; s=20251022; h=from:subject:message-id;
 bh=O1Dhmnpm93oI86eyLM+nagCCnGxeZ/uf2nf3GtbNBe4=;
 b=CBglc2ktUQqaLAEuqbXBhyFE40qV3dmBFutp1RXtGh6K+J516QV8r1O22TnGD29QEPIgv6w0i
 msgfYtjxr9DDlR3OwFIgVVcw8nfBEj7nK6bvmacRP3IFgTilF0PEhXG
X-Developer-Key: i=joseph.kogut@gmail.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773785791; x=1774390591; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4aVjQrI0QIlUZsH3QQbt3ILxQRQQ0ImzVtd78a934zE=;
 b=Yc4pLQH48FXCska2u0jhD2b1gRG0RauhHpaPxEhA9qPQGHxeoRR1EhY1grZaJDc3UP
 NlAjcz+PJZe0PczOQt1DIzpmMi0UgdvFHvv1LlDk6OLsparzxLxjDzTMqSRsFZrtpgAA
 UWVPfbOg5PiGJO6Msqmyujh0MQYtM1XvH5QycqraN6QVstlNtrEmX4D4EqC6sfuhHfcw
 8RrYhjm/L775URcVcMkacIO2aybWsMOh10VujaEq0PZn0EsnsJMkyKFkr9AMNw5br7po
 pT0soyVmdo8QzSm5DAywiLEByM8/mKm/W0Wnu6vBhSff6utcEOFdUzpYL0EnaKnIeUla
 CC+Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Yc4pLQH4
Subject: [Buildroot] [PATCH v4 3/5] package/virglrenderer: Fix build with
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

From: Joseph Kogut <joseph@anodize.com>

Add an upstream patch to fix the build with glibc 2.43, not present in a
stable release yet.
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

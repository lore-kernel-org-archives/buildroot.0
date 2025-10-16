Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42ECBCCD183
	for <buildroot@archiver.kernel.org>; Thu, 16 Oct 2025 09:28:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBE2341C62;
	Thu, 16 Oct 2025 09:28:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OJjqJPsggjFs; Thu, 16 Oct 2025 09:28:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D909C41C66
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D909C41C66;
	Thu, 16 Oct 2025 09:28:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EBE1968
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 09:28:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E8BD384645
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 09:28:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l_UyQgakflJp for <buildroot@buildroot.org>;
 Thu, 16 Oct 2025 09:28:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BE8FA84639
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE8FA84639
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BE8FA84639
 for <buildroot@busybox.net>; Thu, 16 Oct 2025 09:28:33 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-46e384dfde0so5589355e9.2
 for <buildroot@busybox.net>; Thu, 16 Oct 2025 02:28:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760606911; x=1761211711;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X0t287tbLf8KMpIYRWSRWCiA3wD4jcJKvLy2MnUGmHs=;
 b=W9c/MHCVlWjIgAAaQOoF09Iq4pMuzWe+6H2y9RLPMQbsfjd5C0AqR3W/FXw4wp8uuN
 05Jx5XnRgzkecFyaS6Piy5UV+1ArmIDt20SD51X95r2Evd6b0+z6hELjoaYKB5Ptjvj0
 gqMh7W21QNjU7YKlHhY83lU9sLJwRb00DOxyGm3P7gbLC0svZYZvySyATXZKUQdN1Pks
 XZg6RKQgNLoTknSZfH5HCbXIJB31RuxKKL2iOzRTWBybEyqb2LIPsI3LJQH6Qo2RjlDG
 GXMiHUpw5YLO4WSfbDFfBy5KgTbKIlhQM9LN3roPMfO0MBSljrFFYZ8I0u7K3DQMreNl
 NgAw==
X-Gm-Message-State: AOJu0YxHYOq7wKjDlvLv6p5WT65agfk8KHkrq/oeMQwfHPssq0Cxk+fq
 1dP8QkBISfQprA+d6dVNKIXD6zsgoSk7Ian7vqB0ECZ0cjMa2qZvybNTdeJEzmmUG1y/U6edGQ+
 gKBBj3A==
X-Gm-Gg: ASbGncuuDCpSBsMdV3ByrhkkYqMA721ifKbacO0kxSKKMVshZVEbbtUQbzb+PZFoIVv
 OTUtAfQjJB+Vjs8eaH/S1lll7phfpIYiP3WSc0i0kN7SpkhT23gp6WqhKAsqh4uk9BoK5zCFq6O
 Qe5AV5ybCx+2RfcKs9aDdbmK55Fs4m8BBMKciHrxAV8p6g0h8IcPuT/qgvDD6v+M+PDXMDDkRVX
 XZsz8E/hvpg9+a94ig0xRrgqf8Gag77GsiRpQPJb8rC2VQ2pS6AisTst3d5Zy8xDlcAYAt8HnVS
 mLRbbcde0MMc7l3Bzbg8UO7ecl91+zBRVeB3e/jmsbPd5+SJl2nXSGgkMqHT2/WFhJRzcrBbKeJ
 Bu7crXMQkNDMtQqZKe9i0Z4HbTtez+Fc2zL4dN1Faqh0FHtcnphQiAq8C83w4mCqfvEv1QNECEJ
 mXD7h+SUoNA64PWU+rE1xPFysVjqRRayLe56gyWOXIDEE5
X-Google-Smtp-Source: AGHT+IH1ep+ppRWj6qR0edpRb79fE1P1NuIRk60LcoqXDTdJnPEKWVOz269dgIyc8wNWJsT3A3fEoA==
X-Received: by 2002:a05:600c:6990:b0:471:115e:87bd with SMTP id
 5b1f17b1804b1-471115e8a8amr10960645e9.26.1760606911194; 
 Thu, 16 Oct 2025 02:28:31 -0700 (PDT)
Received: from vm-2404.. (10.187.66.37.rev.sfr.net. [37.66.187.10])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-471144c900asm14559155e9.16.2025.10.16.02.28.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Oct 2025 02:28:30 -0700 (PDT)
To: buildroot@busybox.net
Date: Thu, 16 Oct 2025 11:28:26 +0200
Message-ID: <20251016092827.601321-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1760606911; x=1761211711; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=X0t287tbLf8KMpIYRWSRWCiA3wD4jcJKvLy2MnUGmHs=;
 b=UMfS/yfkooMzrVA3TrrD7izrgqbSmoT7i5M3YPcANcQPPCg9JaeNkQInHZ7cGusB+V
 BKL+EcZyKrnRA0RO/4o219ezPts/02rdRmTRewPagRmYImfSXwXs0r0ogNGTaW1Zk7fi
 9Y5AHRu+6Cd8pK8z19Ua3Pr+fQ9gYozMSh1/zLXEaLO6cVy0fpEGNeJQszUuN3JmbBYW
 cVMeP1N7+IzBf/sXf2nVnxjzq8U/RmRANb80dRmu660+J3xFzNJMFK1s1Fh3ct8qjBXf
 RFXuC5MOlm2QDrRWAJEIALhpY6yuEB7uR/adUHA3Eq/DrfrYw0kDa0kM5d0e02TGYgKm
 qKTQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=UMfS/yfk
Subject: [Buildroot] [PATCH] package/janet: bump to version 1.39.1
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

remove upstream patch

diff LICENSE:
    -Copyright (c) 2023 Calvin Rose and contributors
    +Copyright (c) 2025 Calvin Rose and contributors

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 ...heck-for-glibc-instead-of-gnu-source.patch | 26 -------------------
 package/janet/janet.hash                      |  4 +--
 package/janet/janet.mk                        |  2 +-
 3 files changed, 3 insertions(+), 29 deletions(-)
 delete mode 100644 package/janet/0001-check-for-glibc-instead-of-gnu-source.patch

diff --git a/package/janet/0001-check-for-glibc-instead-of-gnu-source.patch b/package/janet/0001-check-for-glibc-instead-of-gnu-source.patch
deleted file mode 100644
index 5ee021e65..000000000
--- a/package/janet/0001-check-for-glibc-instead-of-gnu-source.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From a5d6b2283834422a9fa9e79b5c7ad9b932b52568 Mon Sep 17 00:00:00 2001
-From: Calvin Rose <calsrose@gmail.com>
-Date: Fri, 21 Jun 2024 17:17:22 -0500
-Subject: [PATCH] Check for __GLIBC__ instead of _GNU_SOURCE
-
-musl doesn't obey this behavior.
-
-Upstream: https://github.com/janet-lang/janet/commit/a5d6b2283834422a9fa9e79b5c7ad9b932b52568
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- src/core/util.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/core/util.c b/src/core/util.c
-index 4bb37abc5..6cb5676e0 100644
---- a/src/core/util.c
-+++ b/src/core/util.c
-@@ -972,7 +972,7 @@ const char *janet_strerror(int e) {
- #ifdef JANET_WINDOWS
-     /* Microsoft strerror seems sane here and is thread safe by default */
-     return strerror(e);
--#elif defined(_GNU_SOURCE)
-+#elif defined(__GLIBC__)
-     /* See https://linux.die.net/man/3/strerror_r */
-     return strerror_r(e, janet_vm.strerror_buf, sizeof(janet_vm.strerror_buf));
- #else
diff --git a/package/janet/janet.hash b/package/janet/janet.hash
index a35835a54..15516a4cd 100644
--- a/package/janet/janet.hash
+++ b/package/janet/janet.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  947dfdab6c1417c7c43efef2ecb7a92a3c339ce2135233fe88323740e6e7fab1  janet-1.35.2.tar.gz
+sha256  a43489328b88846e5cddbdad9274f25ee9854e337e52490a74bb7955de03c650  janet-1.39.1.tar.gz
 
 # Locally calculated
-sha256  95fca700e8dce9699248e7cc80ac88ce2357874c8352cd2be4d18f183dc9710b  LICENSE
+sha256  805858acec1df54018879efc78ee3ff7bab5e69908c58e46bbc2d94520f29023  LICENSE
diff --git a/package/janet/janet.mk b/package/janet/janet.mk
index 9bf5322d1..e076f7c46 100644
--- a/package/janet/janet.mk
+++ b/package/janet/janet.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JANET_VERSION = 1.35.2
+JANET_VERSION = 1.39.1
 JANET_SITE = $(call github,janet-lang,janet,v$(JANET_VERSION))
 JANET_LICENSE = MIT
 JANET_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

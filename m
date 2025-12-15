Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0D33D5B86F
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 22:44:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C355760F2C;
	Mon, 15 Dec 2025 22:44:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oEHEh7oMkpPi; Mon, 15 Dec 2025 22:44:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DBB660EF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765838644;
	bh=4K5sCeO5kPsSxGlMbCwPXedh3HWs7SDn8HvhnkQm87g=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=G4V3dK8tXKK1jaaM/XITSlC0/4pXRFdXuVr4LP+G1sqKv3YOdfibQQsOus9CFm07H
	 kL6rNz8Z6YqYo555P3TDt/9S/fy+ps3alSCtYIUOH160JR7IzoRqRVnQ/tFCVVbBJr
	 GEikf2RBBsaajULWyyL3rVKtr8ahb/GnX6VB2Q/uQLh7z47fa/k06SebNoWYotxzso
	 XnxDF2Uv9LyoXh33rgw0MsJa/hIxp4HyRV9nV+KVt9LLQc1C7h6zxv5TL4Typgzc8Y
	 rJz9iTaO2ttQO47wuH5PQPSzOp3jxZJ/6FyASUCtXUxzU2V14wWYee4avi1yIZCBKx
	 gXtI7PcoDi+Lw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DBB660EF2;
	Mon, 15 Dec 2025 22:44:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8875A219
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 22:44:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6EC4860EF2
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 22:44:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bhh8rzlnjkR5 for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 22:44:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F261A60EE3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F261A60EE3
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F261A60EE3
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 22:44:01 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-59445ee9738so3251607e87.3
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 14:44:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765838639; x=1766443439;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=6ScXOQLof9nDvqZgzUCrBDMoGo+2RRrTNAAH0O/RHFw=;
 b=a+lLSm3lpjjUMPnx5x4qUJyoX+c8MV5ciyK3oEdWyPA2rfWexOwY1OlUCPJC3I3WQ9
 0lbUs+gwt9A3zeDEH1jyRpsqLgJc9mUK0dhanvBl+J6WbzZ2pmqG/TdFfh6Oz+V0mgZg
 W8UHA55MHzrkWE1GCL2Kxf+kVPiTVzdwFbZJE1vN3pF50qU3JzFUAYrd9YTjDli3bgmO
 18eY4pQ/mdmERulk7EM3XKz4PSa3RgXSC1lrZLxVwAHHv+gGDWw+2ZGrwBFSo+4QZeyx
 zMNvJLkoU6a1pPMOd0gAYpdDovQDZglwDXKke2MMFTDykTd+I2L6G7T2lIkPXo/X2UVX
 hSdQ==
X-Gm-Message-State: AOJu0Yx2Hd7NfRqSZzXFvmyhdzVAQuCafOsA4wh2T6DEO4JdU/urWWjt
 QixqMu77GljKC96JggA/fmvek9C+jrO7yxM7WwI/nvgQlauuhbtQBKGyv4z7rg==
X-Gm-Gg: AY/fxX50U4awbnI0W4YwmyagICvAMLbq1zblT8MHIQMN4g6sg+bUufr0qePhlnGThMD
 jzz49HLPCUcYC+WlmSZlze+y2D+qQmNZfHObt2dilsBfrRsIWhTmv9Qcewp3okWN/cxz9S3DSEW
 sdX5S3ebjDoqPU5hklQUoUjFv3iDq0lWPXID2tddDM7ZTIq9eUuhfp8u7gKnXz7TutlXhrtwg+6
 QfDOthKKtg2X1tjQQ4wV/hh8JkUiITxd1ZW/QZuiQ0E4XaRTNWPHQAeaQ/YxFgokOYS2FZIhBpr
 q8p1TWoEHBrDynHi7dx8dVodVVgWHoGNyL5GL5r8U5/lCmK50aWEuRRr250AV/wD4dFGn7MLhz4
 gK2c0m6r8mN3XFKPxO/yedkXWxHLaT8IbZ+E84XUQ7j0XMn7wWDemVR/cvQF9V7uGUzvyiH8qB5
 +AFFQOeb0RAv7oYGYwkpJKwiC3LN8CHV9PrrzfX5ufqyo=
X-Google-Smtp-Source: AGHT+IGRrf3CnoRiUqhpK9NB7fYD1caaUBkjTfwpeG3D8MJmhG9Kvr1UIBl7ASO5EYwW4vrT0vnv0Q==
X-Received: by 2002:a05:6512:3c83:b0:598:8f92:c341 with SMTP id
 2adb3069b0e04-598faa82a97mr3243429e87.53.1765838639288; 
 Mon, 15 Dec 2025 14:43:59 -0800 (PST)
Received: from gimli.. (h-158-174-186-51.NA.cust.bahnhof.se. [158.174.186.51])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5990da11b5esm232994e87.10.2025.12.15.14.43.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 14:43:56 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Cc: Joachim Wiberg <troglobit@gmail.com>
Date: Mon, 15 Dec 2025 23:43:53 +0100
Message-ID: <20251215224353.2285071-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Wires
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765838639; x=1766443439; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6ScXOQLof9nDvqZgzUCrBDMoGo+2RRrTNAAH0O/RHFw=;
 b=P0ywjX8bS5O4vdFD23hz2byhmgGxv0Ds97+UvUI20mWZksExrOkx+uKB47M49wEsUR
 2LJGLGWA4tpEOYakGMikOc6jCRDMglqRDYC7tL22M9XLtK07JWSkc8u2gOiq+Fe9M377
 laNI80GCSudSqXx1tsskEDyb0yPlhq57EAP2wl1SwTiB1Q+2PJKZOPMnSBfsFYV40z8B
 8RehL23kEglu2Jmz6mM5T5A0BDxbNAOaUh6NVGAAOk7uMX/rFjL6rz8cM/vi9XobU/Yv
 ivyEZGZly/k3250iS3X1H6jNjHG5KzLucppVNChbUXIQfGDFKuCsRWVNRCVVgjxC2Zal
 CqoQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=P0ywjX8b
Subject: [Buildroot] [PATCH 1/1] package/inadyn: bump to v2.13.0
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

Changes:
 - Add support for Porkbun DDNS provider
 - Add support for domene.shop (Norwegian DDNS provider)
 - Add support for round-robin records to Cloudflare
 - Add example config for DuckDNS IPv6
 - Cloudflare: omit proxy setting if unset in config
 - Cloudflare: omit TTL update if unset in config
 - Simply.com provider fixed and re-enabled
 - Support for long ddns-path requests (increased buffer size)

Fixes:
 - Do not use an IP resolution method different than the one
   specified in configuration
 - Fix support for Namecheap
 - Fix Dynu IPv6 issue
 - Default value -1 not used for ttl setting
 - Fix IPv6 detection for providers with "v6" in their name,
   e.g., ipv64.net and dynv6.com
 - Fix dnspod error: "Communication with checkip server failed"
 - Fix cache directory creation on --help or --check-config
 - Fix cache directory not writeable and no $HOME

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/inadyn/inadyn.hash | 2 +-
 package/inadyn/inadyn.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/inadyn/inadyn.hash b/package/inadyn/inadyn.hash
index eb5249e371..f6e07a2e30 100644
--- a/package/inadyn/inadyn.hash
+++ b/package/inadyn/inadyn.hash
@@ -1,5 +1,5 @@
 # Upstream .sha256 from GitHub
-sha256  38fe00f20b293e64a89efc85f766ff40f0be3bcf9c3ed68b842104540a60806e  inadyn-2.12.0.tar.gz
+sha256  411a999420d825eb79998b6db84936d0dff7baa07510cb4a9c65aa4eae0d42c0  inadyn-2.13.0.tar.gz
 
 # Locally computed
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/inadyn/inadyn.mk b/package/inadyn/inadyn.mk
index fa2eedc1f3..a8891debb3 100644
--- a/package/inadyn/inadyn.mk
+++ b/package/inadyn/inadyn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INADYN_VERSION = 2.12.0
+INADYN_VERSION = 2.13.0
 INADYN_SITE = https://github.com/troglobit/inadyn/releases/download/v$(INADYN_VERSION)
 INADYN_LICENSE = GPL-2.0+
 INADYN_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

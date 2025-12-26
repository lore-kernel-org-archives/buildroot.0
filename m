Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 157E9E8FDAC
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 17:13:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC7CC81222;
	Fri, 26 Dec 2025 17:13:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 68bQrENZpdg4; Fri, 26 Dec 2025 17:13:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6AE0812C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766769202;
	bh=qzPDx4BMtytm/fTaRQWBX4lTRshVczN6xwzmuuA6Zzs=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cYTOSSPCgH1zIzsCBUTmSk9uMaM4V9OO/eloZhVhiM/YC3KiQt1rkEw/BnANXB7As
	 CmrV6A78pTGHZ45VZOL7oSg9IRISjfK8d4JCIpbaRc++zZa6Qx1d7SgTA9ftIvAlVF
	 vB+LZILGKmB3hPikSwro0TkGNVZr6/rcgw1fXApR3OcBVVpkOSyknWJlf2qsqjTsEJ
	 B6CQb1Cup1AAXsvKTUpuHhvdi5LzJB9BmmH0v2iGOwxGehq0QZ7zVYB4CTAsKXU04v
	 FcfsfBs/sv/6FaQoPlCp+x60MPKzJLUlqgydhIRqjKEyjAQEZNe9qg0Np+fRrlZp9V
	 0G9Y6SzN+AdbA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6AE0812C4;
	Fri, 26 Dec 2025 17:13:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A314EC
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 17:13:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6AFB3403EA
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 17:13:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mlgYMZ5hjRoD for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 17:13:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E1AA14012B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1AA14012B
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E1AA14012B
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 17:13:19 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-b79d6a70fc8so1290417866b.0
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 09:13:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766769197; x=1767373997;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hAXmfwI0JchNS51dGMoYJqtbzw/0yc/GuZ34dx8/g4k=;
 b=msW+yLZDaelUnD41mMBW80KTALO4Vm5OgN001owROM6R4Y9bBBbZ+jQmQFHrR3GjA4
 jbZmwzibuEZrvx+Y+eik2NjS44HbgEMOgkEC0m6Oyqff26u65dCLJ6UcVxhWgiBnnWgx
 cNxhxgi3IB/xO0LOniD7LYZ+eFBDomqKCGEspgJ+ClEILheKxFDtMrF9ZVcPE8vSyqN4
 bpNVgzf0UAIevH2oDNLWAqW7xaGaaQ2RFGioYoxpR2Ff8C5C5krVmm0hpUBH6PaBnZhO
 VBpLw2KVcsqOT7jZ48D2SKuAYCJwt2egaEj1N3ZJX/gEr6tds9r4TaTqJxC4qs1+2e7A
 TkvQ==
X-Gm-Message-State: AOJu0YyFIHPygnVI9HEDnpUPqNKjD8yow7rRDhOKnnGMFKLlovm4JcCS
 4MceYZoCuvvlQO0MsZ1iLzruNu/anfocE8OGbTIiTqn+rKIMTm5YnLq4PnjCz5iQtF5+S1GkXgq
 ohRdF
X-Gm-Gg: AY/fxX4q9aviu9ePyI7dtYitqH5DQaVRuZ21x0HGpJfuwmjunqGMii11MXrIyokAdko
 OcdmLzDm4cBluvVaDF2f93tNXJclajtoj7h02dAyHdD35ujTt6VnEviB2csRiSvN/JAGGpePIuE
 Aqy7Tw4YXXsGivWn21U84Fo0RIvzT/QBId6FGiMklYtm9PLvqIbMZu45bLb8rwpu5wbwD08BGR4
 qVr7ejkyefkXuToVp/8SkaPURmPvY0i5hOwAvYgbbKcQqlM8MgC2XcUunUE3kSp5ummRT2+/PdB
 q8qckMALT2HzZq7N+KV4nvljVdXmMU7xBO34FwK8QtxpqVxm8K3RGHwQV9JsxOk+aUw94uG6Mdf
 3QKrTjmC5N1FTcEZ85iHbTgPANxT636zBcRc+WGvbyaSxar1AR8pCPwe8RUAi2UL7zHD4y/AOYm
 eBvL1qJkopoxRoCyyRcxs6Fu/sOOdfzmL1BZTTvDi/bZ8jpQYSOuuxKmsLWVur8q+SvRet1OUOX
 msY4iTG6VwkUeOC6TcfB4S4WvbIzQfVMc9bv52pgV4w+jH1HnIQkQTEeCFVbHiDUy6NdRjVLr+P
 K4npe8drTW4=
X-Google-Smtp-Source: AGHT+IHIPK8MlV0F+nyqsJtwPVS0F7mfUUUuBsFP517Xuhd6kkPDb9c4IjcWaOE9FiouhLrrBmd0vg==
X-Received: by 2002:a17:907:9713:b0:b7c:532b:cc99 with SMTP id
 a640c23a62f3a-b803719d464mr2632105366b.46.1766769197153; 
 Fri, 26 Dec 2025 09:13:17 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-45-45-148.retail.telecomitalia.it. [79.45.45.148])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037f09149sm2414690066b.47.2025.12.26.09.13.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Dec 2025 09:13:16 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Danomi Manchego <danomimanchego123@gmail.com>,
 linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Fri, 26 Dec 2025 18:13:13 +0100
Message-ID: <20251226171313.1982585-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1766769197; x=1767373997;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hAXmfwI0JchNS51dGMoYJqtbzw/0yc/GuZ34dx8/g4k=;
 b=F5xDhAdB2KGRe50fpqIlwAa6+Fq7oeajR1N04GXNjRni80lK9by/OB/jmNmdUpWFlG
 6s8pt7BMOqf+mK+ZWFvSEJklcSHnVDWfmTV2HH0rs/MRE+wFvOljeAz7Y2efKqZl5MHz
 Kn7/IIZNeYfSHl6mdglBLar66X7rY5hGla2mo=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=F5xDhAdB
Subject: [Buildroot] [PATCH 1/1] package/xinetd: fix build w/ gcc-14
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

Building xinetd with gcc-14 raises the following error:

cvt.c: In function 'fcvt_r':
cvt.c:113:9: error: implicit declaration of function 'strx_nprint' [-Wimplicit-function-declaration]
  113 |     n = strx_nprint (buf, len, "%.*" FLOAT_FMT_FLAG "f", ndigit, value);
      |

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 ...libs-src-portable-fix-build-w-gcc-14.patch | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 package/xinetd/0006-libs-src-portable-fix-build-w-gcc-14.patch

diff --git a/package/xinetd/0006-libs-src-portable-fix-build-w-gcc-14.patch b/package/xinetd/0006-libs-src-portable-fix-build-w-gcc-14.patch
new file mode 100644
index 000000000000..8bfbcd6d8ddf
--- /dev/null
+++ b/package/xinetd/0006-libs-src-portable-fix-build-w-gcc-14.patch
@@ -0,0 +1,46 @@
+From 499087df7c0aaa01f0f64aa7aa355d2e543665bc Mon Sep 17 00:00:00 2001
+From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Date: Wed, 24 Dec 2025 11:36:20 +0100
+Subject: [PATCH] libs/src/portable: fix build w/ gcc-14
+
+Building xinetd with gcc-14 in Buildroot raises the following error:
+
+cvt.c: In function 'fcvt_r':
+cvt.c:113:9: error: implicit declaration of function 'strx_nprint' [-Wimplicit-function-declaration]
+  113 |     n = strx_nprint (buf, len, "%.*" FLOAT_FMT_FLAG "f", ndigit, value);
+      |         ^~~~~~~~~~~
+
+Including "str.h" header to fix the compiler error would add a
+build-time dependency of libportable on libstr, creating a circular
+dependency chhain:
+
+  libportable -> libstr -> libsio -> libportable
+
+which results in GNU make dropping dependency edges and therefore not
+fixing the original build error.
+
+The commit keeps the existing library layering unchanged while restoring
+successful builds with modern compilers.
+
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Upstream: https://github.com/xinetd-org/xinetd/pull/39
+---
+ libs/src/portable/cvt.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/libs/src/portable/cvt.c b/libs/src/portable/cvt.c
+index 4bd99fc80c26..4badab1cbd42 100644
+--- a/libs/src/portable/cvt.c
++++ b/libs/src/portable/cvt.c
+@@ -64,6 +64,8 @@
+ #endif
+ 
+ #ifndef HAVE_FCVT
++int strx_nprint ( char *buf, int len, const char *fmt, ... );
++
+ int
+ APPEND (FUNC_PREFIX, fcvt_r) (FLOAT_TYPE value, 
+                               int ndigit, 
+-- 
+2.43.0
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

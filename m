Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AC4DD1171E
	for <buildroot@archiver.kernel.org>; Tue,  2 Dec 2025 17:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38B5C41136;
	Tue,  2 Dec 2025 17:52:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UhW5ZxcbHdPu; Tue,  2 Dec 2025 17:52:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4E9D410E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764697970;
	bh=Nz1JKiHhu/6jH75DJAVy2B1gwy2+a1t9Qel8hkPzvwA=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CcHzGLkAVbUnt/3XvlyNvbkKJL+ZicVx1+n7CspTvlvqzKfprkkGdGqPaHUJ8Kf5G
	 Xe/sBKMI9GreXlTjJC0yfl3GPKLxrXic2OdU/VhONPt1cJyDjwsBoTdVt3faotL+Dq
	 MUrs5TGlEjww8huScB6uzaAOukDs5ucMXGX3vx296AnIYh+gqH+9PEluKpBFEMQ/x3
	 knVEk5G+/ACjB1++03qAH5E0fp1KB97BxAs78k1u5N83TWPN8/urdoOYFekwQujASs
	 4i2X7RRkAPLFXF60wzJwZgufdHA+VEoWUTs75Ff6Q4TdLqbTClQf7y65/FFG6zHYCK
	 oY0IThndgWHSg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4E9D410E0;
	Tue,  2 Dec 2025 17:52:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 63290E4
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 17:52:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 555D783EBF
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 17:52:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JZ8TUS8SyG6Q for <buildroot@buildroot.org>;
 Tue,  2 Dec 2025 17:52:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::2b; helo=mail-oa1-x2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5372783EBE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5372783EBE
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5372783EBE
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 17:52:48 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-3ec41466a30so89476fac.0
 for <buildroot@buildroot.org>; Tue, 02 Dec 2025 09:52:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764697967; x=1765302767;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uUTD4jo2VItWK43iJZ16uRmBPmzA82Rye52udyk3l44=;
 b=OA98ZYcN/v1EcjinyEqbXAVry531bLkX0VJnAYAdqiJaUwWYvCqgT4VX62nBpBof1V
 LpRCBSX7yHxE1XwY6Qftz8DklKHj1Q/0ke9Yfpdf0Wc6w5V23zxsc3xcWQw00MbnPgnG
 6O5edbaHZKCnMl/PNCs3Kc8Kk4/8BeKm/sAKv2OaaA9uVWbfaRPHO/r+2KZRHg2GG1j9
 BFxLl+2vXZd0C/mlkFH1Tzg1zsr6tTkt/kh2QiX4FL+SlW+n2C09mZHBQIaZgZkzsF9u
 wR3s6WBYem/iU3G1Gkbboq817amsQJa42q9+gWPTBK2iwtgsv0A9A0wGXRn3ynKYFUl+
 vMBA==
X-Gm-Message-State: AOJu0YzsZ7SYNC6z93mgdUOaxe31fh/Y4mKPjVc14fBdaKR7QGtHZwAH
 COTaByzrlxFq7coGH3vHk7PK9AasBHl7+NwAugrYegBKpWVwcUo8GQJv5Pfp0acE
X-Gm-Gg: ASbGncuCf+ihp6CfWMIar+1cUXRlOS5yDO4khSCi3FSfFHUshZqB86Hbrbe9Vi3L4/q
 MtK0pAOxrzZBUScYoRfQP/yUAWDXBKKrgN2XzVxAEMZIBnC8jZjXYVq61oncSDrbRp25s8h21N5
 saeRhyD+CplunXNFKxyCyGfOMMw80NwNxM9TfRObWP+lUYijm4CSHCcyxQzV/GLw5C0oLwniy8X
 LV9SXQOs/qi8oyD3euxNm524FzSWP1tjZ/D+SQfoIdQ1QJzdnGsqd9ye5Q/4Mno+uRLN6D05LAg
 pxgwma3Rwozzff5ASuaL1xj38iiy+PbbxiCu4Rq7yhvzYpuhNQI2Ntg98Jd3qfBt4VOh57Z3BEB
 4rwdr+VZsvanR2Ft4ZTn3RrA4QIzN8y6Wa7MCp6r3Xo87sFrExsWi/mIdUmg1tASGmr86cTygnl
 AGT6bM+DVtQVV6icjF8JuSvO7QAovFl2FibJtCjQgNyAycI7TFRdsAr7nq5/4=
X-Google-Smtp-Source: AGHT+IEfahzKKl3ro71s6LPlarZDfqor+EEmUu70DAXN/2h8qNx/kgOFPBkve2hBGT+p4SlmIlXkNA==
X-Received: by 2002:a05:6870:2396:b0:3e8:4730:bcb4 with SMTP id
 586e51a60fabf-3f14f2b641amr2589781fac.1.1764697967021; 
 Tue, 02 Dec 2025 09:52:47 -0800 (PST)
Received: from james-x399.localdomain (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-3f0dd021aa4sm8081759fac.15.2025.12.02.09.52.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Dec 2025 09:52:46 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Tue,  2 Dec 2025 10:52:38 -0700
Message-ID: <20251202175240.1270265-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251202175240.1270265-1-james.hilliard1@gmail.com>
References: <20251202175240.1270265-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764697967; x=1765302767; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uUTD4jo2VItWK43iJZ16uRmBPmzA82Rye52udyk3l44=;
 b=Xd82+jJYOWjT4jBB0HTdVwka06Q7ynfSUp8vPhToch2EF9AchjDOKv4OAgd0l4OVwy
 juQ2RdLmb1pc/xf0fxcyA4R7e1Jqgy/Q6awlRrpOsz3fuB3HBtzoq+KTQ39tT/LcsePl
 JD3IhogYbmeUrB+SYXcWrwlqzPShhwbN/uD+CKIgXkF5XBTN0qsbcQeSwRUIYY4qq7OE
 g9jpodYrbigNbPGIKQfd4r6+FuhJF/gw/IhA7Ext9jvIXI1YFJs+wwcFrkgcuMJWDWDh
 9tmaWE619iC/XebRWedx57jXVdamyxGgznb7eE8lAjR0A58JCs6cwu1b1nCx+gJByj4l
 l91Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Xd82+jJY
Subject: [Buildroot] [PATCH v5 2/3] package/pkg-golang.mk: make GOPROXY
 configurable
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

BR2_GOPROXY now configures the Go module proxy URL used to download Go modules
specified in project go.mod and go.sum files. By default, it uses Google's
official Go module mirror at proxy.golang.org, falling back to direct downloads
if the module is not found in the mirror.

The default value from the toolchain can be read with "go env GOPROXY"

We rely on package developers to audit their dependencies in go.mod and go.sum.

The value can be configured to:
- A comma-separated list of proxy URLs
- "off" to disable all downloads
- "direct" to download directly from source repositories

For more details on Go module proxies:
https://go.dev/ref/mod#module-proxy

Discussion:
https://lore.kernel.org/all/CADvTj4pXO2rwJ8oCzzGNY+OxLuo3uJnDT2PAxbyquw0L6dhfiA@mail.gmail.com/T/#t

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Christian Stewart <christian@aperture.us>
---
v1 -> v2:

 - added more context and links
 - renamed to GOPROXY instead of GOPROXY_LIST
 - moved into the !BR2_PRIMARY_SITE_ONLY section

v2 -> v3:
 - split out GOPROXY default change

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 Config.in             | 16 ++++++++++++++++
 package/pkg-golang.mk |  2 +-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/Config.in b/Config.in
index d730f2034b..23717f3f97 100644
--- a/Config.in
+++ b/Config.in
@@ -335,6 +335,22 @@ config BR2_LUAROCKS_MIRROR
 
 	  See http://luarocks.org
 
+config BR2_GOPROXY
+	string "Go module proxy"
+	default "https://proxy.golang.org,direct"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	help
+	  The Go module proxy URL used to download Go modules. By
+	  default, it uses the official Go module mirror, falling back
+	  to direct downloads if the module is not found in the mirror.
+
+	  The value can be one of:
+	    - Comma-separated list of proxy URLs
+	    - "off" to disable all downloads
+	    - "direct" to download directly from source repositories
+
+	  See https://go.dev/ref/mod#module-proxy
+
 config BR2_CPAN_MIRROR
 	string "CPAN mirror (Perl packages)"
 	default "https://cpan.metacpan.org"
diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index 26da7be71b..3e388cb257 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -101,7 +101,7 @@ $(2)_POST_PATCH_HOOKS += $(2)_GEN_GOMOD
 $(2)_DOWNLOAD_POST_PROCESS = go
 $(2)_DL_ENV += \
 	$$(HOST_GO_COMMON_ENV) \
-	GOPROXY="https://proxy.golang.org,direct" \
+	GOPROXY=$$(call qstrip,$$(BR2_GOPROXY)) \
 	$$($(2)_GO_ENV)
 
 # If building in a sub directory, do the vendoring in there
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

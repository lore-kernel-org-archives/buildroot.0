Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0974BC02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 23:28:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAEA360F46;
	Wed,  5 Feb 2025 23:28:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CDA6dMCFyVNg; Wed,  5 Feb 2025 23:28:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8690460F49
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8690460F49;
	Wed,  5 Feb 2025 23:28:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 299CF12F
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 23:28:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2446F415F2
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 23:28:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y9h9CnJkZgeL for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 23:28:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DD2C7415E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD2C7415E4
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DD2C7415E4
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 23:28:50 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-21670dce0a7so8082485ad.1
 for <buildroot@buildroot.org>; Wed, 05 Feb 2025 15:28:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738798130; x=1739402930;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Yhp6yjklqMu5ornjWccr9LWxQ1X2mmkIAQ9OUv5j1O4=;
 b=Wtykk96sssaTD/Bn1GcKRc0VTP1c6+4oQlwkol5yj0wXLS0z2vn1NhUCKhpEMOAAiG
 0VDT+8pqKVEqAC7j4U9xBoemyaLKfKLf+xXiyIz8A9OEOI0gaYBFjDqnF18cLzniT9ln
 LM/UPI1gNk8k9QngGX/1g4YkXn24UPspDceH40f1OtuuuHY3+4CLH8kMpG9pObEqH4/h
 wgCz6bnkZtWVwUn9jwQfP7iEs2xifcg0q54eunAMzJNGEAtqUm2UjkkLWGcoXPjQS74R
 ox8muS/7BfUnBBgwJxhxcr58fH88JrXvY4YmSNj3PS2DGYGcnk3NdJNJhTvwQP6bjp4W
 gk8g==
X-Gm-Message-State: AOJu0YyMAJOy0SDonrVcYPn1kgg62eyeFOGIbHh12U6sazB+Pw8wBeDo
 yIuAa7en67Kk9Ych1fcvsTcNMKLp2ORLsRdrdqWP5HTMINvwI/Hvptg43f+N1zPoWX9IfebWjUz
 tO9mFEw==
X-Gm-Gg: ASbGncuXyEilTp+UlA1PDgsjECtB79M2qlrYAJjAlgGwau7oTwqjA/Iery74Ysle8Rg
 NIBXtx050fgZ9nZnU3i96/GMj6GC/2EGFM5th/6hTPrymvLkgbDuu9zb1+4bmqxdyW2KcBpcT58
 rT1u0xna2bggoJP6Nil62/kfqJ1auXV2hi3Km3cw5oleGxCArE/UAQvSfky7a7nazysNDC1srth
 0qItKaRGwr7M1u3hyy00uEmEBEqVT180isItDoK9YfZSEBbfOfEZylnq8FVdQdPV3hfuOf9n1ck
 CpicVobm3N2ZmUYPzSip7C7v98J5sdSqd9O6d93ODA==
X-Google-Smtp-Source: AGHT+IHH8zfwxBzU8eJ14jZ9QIWFrNrsKWI1t58hzqKg9T7spv9OXTixNImJf0shpwq1NNFGcowjgw==
X-Received: by 2002:a05:6a20:43a0:b0:1ed:e2bc:5c9 with SMTP id
 adf61e73a8af0-1ede88b1343mr7241712637.38.1738798129973; 
 Wed, 05 Feb 2025 15:28:49 -0800 (PST)
Received: from localhost.localdomain ([94.156.149.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73048a9d1bbsm17268b3a.9.2025.02.05.15.28.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 05 Feb 2025 15:28:49 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed,  5 Feb 2025 15:28:37 -0800
Message-ID: <20250205232837.70303-1-christian@aperture.us>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1738798130; x=1739402930; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Yhp6yjklqMu5ornjWccr9LWxQ1X2mmkIAQ9OUv5j1O4=;
 b=VMG0iYMnS4jaHePZLyTW327B9qWe+CYZy5l6fhapjwBqPbP0I+6nkBWRAPwtDRzuwG
 k/z+e+kb2DRgRCIR5i3IRxDWcRpbvp8MUpAPcofYYXugti04sTDQnzRj4MU4+z4/eyNT
 vpPP7tsuo2oRyGW5twvP+n116y8uaEiOHCfdX+8QvpL2gDg87nCIFIE0wZ5Hijud/fOt
 eldmGW8CO2id+4pc8+cDIOOqfpm2A7avpHWqABXhpSMAzPJWueUn0wQUool+G2dLgULT
 ox4/VE55s5dk09u2kPQQtbzY4E/FjFg1sMwds3dq34aEePDnRa5gnXDN4IcT/cR+DDD0
 APCA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=VMG0iYMn
Subject: [Buildroot] [PATCH v3 1/1] package/pkg-golang.mk: make GOPROXY
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: James Hilliard <james.hilliard1@gmail.com>

BR2_GOPROXY now configures the Go module proxy URL used to download Go modules
specified in project go.mod and go.sum files. By default, it uses Google's
official Go module mirror at proxy.golang.org, falling back to direct downloads
if the module is not found in the mirror.

This change sets the default GOPROXY value to match Go's built-in default of
"https://proxy.golang.org,direct" which provides several benefits:

- Avoid package breakages due to missing module sources
- Better alignment with upstream Go toolchain defaults
- Faster downloads via the proxy compared to direct Git clones
- Maintains reproducible builds through Go's module checksum validation

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

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 Config.in             | 16 ++++++++++++++++
 package/pkg-golang.mk |  2 +-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/Config.in b/Config.in
index a543091d4f..4015cb5094 100644
--- a/Config.in
+++ b/Config.in
@@ -307,6 +307,22 @@ config BR2_GNU_MIRROR
 	     http://ftp.gnu.org/pub/gnu
 	     http://mirror.aarnet.edu.au/pub/gnu
 
+config BR2_GOPROXY
+	string "Go module proxy"
+	default "https://proxy.golang.org,direct"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	help
+	  The Go module proxy URL used to download Go modules. By default,
+	  it uses the official Go module mirror, falling back to direct
+	  downloads if the module is not found in the mirror.
+
+	  The value can be one of:
+	    - Comma-separated list of proxy URLs
+	    - "off" to disable all downloads
+	    - "direct" to download directly from source repositories
+
+	  See https://go.dev/ref/mod#module-proxy
+
 config BR2_LUAROCKS_MIRROR
 	string "LuaRocks mirror"
 	default "http://rocks.moonscript.org"
diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index 33cf9bfb1a..9b70e9553d 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -88,7 +88,7 @@ $(2)_POST_PATCH_HOOKS += $(2)_GEN_GOMOD
 $(2)_DOWNLOAD_POST_PROCESS = go
 $(2)_DL_ENV += \
 	$$(HOST_GO_COMMON_ENV) \
-	GOPROXY=direct \
+	GOPROXY=$$(call qstrip,$$(BR2_GOPROXY)) \
 	$$($(2)_GO_ENV)
 
 # Because we append vendored info, we can't rely on the values being empty
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0308CCD1A2
	for <buildroot@archiver.kernel.org>; Mon, 20 Oct 2025 22:54:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8628640A1F;
	Mon, 20 Oct 2025 22:54:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YtA0F74yaJPl; Mon, 20 Oct 2025 22:54:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C15C40A22
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C15C40A22;
	Mon, 20 Oct 2025 22:54:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 90D7270A
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 22:54:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 827316075B
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 22:54:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1p6n9BGWFjJq for <buildroot@buildroot.org>;
 Mon, 20 Oct 2025 22:54:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::129; helo=mail-il1-x129.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E780660756
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E780660756
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E780660756
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 22:54:30 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id
 e9e14a558f8ab-430d098121cso13022615ab.0
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 15:54:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761000869; x=1761605669;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F0ciR1xImifMOIErZsz5AfgXpoShPJZVeSJf/cf48ms=;
 b=JZAa6FMAfVr+82862cwLlZPeC+PLtRFK6Nv7aeXzL7XThJtPv7sssl8JiI3cOeOCrB
 0mpNkzEyqXkRWVUkr7FenZPTNuwQsKKYX3MQTMBS3o7khw6jhkOx7cwQVAY7J95vVydb
 6kCKXO1Bba1opiq0HWESqlyP7QqTMwls1Kq2cHgx1DyuLhrPI2yL1gb4Ka8QQ0Hw8eCR
 xlzvSKs3yXr2g8fIQNZG3OB2m4H8F6a4TlgKDJ+I08JJ7GyFwTUw7FC5Sx0CF/q+75rX
 otH5uYYTvhZUo5XAb1+csCHWsw8LbZs5/pQDZvS1buND1DWWEqMCKzAiLDDGdrUmGOxB
 Tt9g==
X-Gm-Message-State: AOJu0YxM7r+8TXRJKUzVZIVhpAeW/NRDb+C1VcNPY685/SktK5hWc39B
 gYa/1hJ+ac4THpuANFI3gOuJY/Viq6Iq1MuMRrke/9zL9EmQQZ0m5QUlW7h3Cx27Ukc=
X-Gm-Gg: ASbGncvF8cQLNTbFglgoXqpZiaoFifrBI0C4YOd3mMY/JUsAIUqi+njyqSvWoz5dCxc
 qEete8jG4xeAM3yXVC2kdvJr7WxG/l0IQIQhqpp/JR6jQm7xq6ynpJtfYgeAe0rn1VGS31QwO8c
 v0RNYyr3whUGIpHd/RoGUGniVPAwU74QEgRkonfmMXJVDtQ51gKN9kMsid9o31EnJjP5WE1iFFg
 GOn+sua4VyBV+mW+TsonqicnZL/odgHv8jKIQ2ndm1ocmZpS5txbfXw4+r43d/9VUCXlnj/lR90
 yQkrEq4+/ue4xW3pYhOpAVza+8MdDEuSmpH+xyEZNNirxhJ/isA+QzbVPewiv12d/+4td0iFSm/
 bHMuCHgO/LMyAp7XhJ4tgwktQgMr7edtFWCPbyL6rUwj/IYi2NEE66AzVH01yAoxfqhacY2cvsP
 saxgGzYaJtJBGdDt18HkF0I3utX2RqTPXW85QsOAQb4BK4MRVktXdBrMHzPkdv
X-Google-Smtp-Source: AGHT+IEBUyVarepJmxMCa0U0EfcnF54i9EMXiD1r1gNXMQMzKJDirYLWE3F7yPZfPuJ2C+cV3Txzyw==
X-Received: by 2002:a05:6e02:156c:b0:430:ad98:981f with SMTP id
 e9e14a558f8ab-430c524b96bmr195862355ab.4.1761000869540; 
 Mon, 20 Oct 2025 15:54:29 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-100-179.hlrn.qwest.net.
 [71.218.100.179]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-5a8a9630bf1sm3457282173.17.2025.10.20.15.54.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Oct 2025 15:54:29 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 20 Oct 2025 16:54:23 -0600
Message-ID: <20251020225424.98853-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761000869; x=1761605669; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=F0ciR1xImifMOIErZsz5AfgXpoShPJZVeSJf/cf48ms=;
 b=SbG8yAyNsvyQxeDAAqYBSLODgLoV+e73T3xZkSEgpFO45koOCPgnRjycNVOfredruP
 p4HPK0XPmdI0QzwnyYsT2wu5rpDfbqOvE2KW5Oi5NPMY6e99EBvCde4kPXxd90csIzSa
 NtlukdVCEahKRKy/lxW+gF47rtIhd8A4bcTO9iMvDpy5o84gHTMX4JNY7kzbKGo9WLaH
 noG/z3kDVpyxSvgwAzxiJWbvFk+T1Nxeew9ez+ClklJ/Q4vj/3IvoK3wZRinyLV8T6EK
 OWNOTEwnPte8PGYemdNgYDaqUotjJ9KdA7sz0Txk8PCpCvyMEiPVpOpkH+s1PMj5MLTr
 gi+w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=SbG8yAyN
Subject: [Buildroot] [PATCH v2 1/2] package/pkg-golang.mk: make GOPROXY
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
index ffd50adecc..3e388cb257 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -101,7 +101,7 @@ $(2)_POST_PATCH_HOOKS += $(2)_GEN_GOMOD
 $(2)_DOWNLOAD_POST_PROCESS = go
 $(2)_DL_ENV += \
 	$$(HOST_GO_COMMON_ENV) \
-	GOPROXY=direct \
+	GOPROXY=$$(call qstrip,$$(BR2_GOPROXY)) \
 	$$($(2)_GO_ENV)
 
 # If building in a sub directory, do the vendoring in there
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

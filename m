Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EBF1FCC066
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:53:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E65F141ED1;
	Fri,  6 Mar 2026 19:53:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YLq9nDOXf2ts; Fri,  6 Mar 2026 19:53:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7FF44206C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826789;
	bh=I4zyiAzJ0cig/IXj2Nj1+KNWBWJ3/DlihFPo6LDhArs=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EpPCeEy4EFi2gy8si50Ogs7r+CU2bjZg09QxGcPad8SD0v5uT5M5+u586sGZoErdp
	 BIJc/DPLvkvnRD98s2fPFuPJoHKJ0kPUHWBPW99Y9uYsVqUZioYfBMdOGRIQU9FEZb
	 BwtNzHuTnOLTgagtdc1EIVe4B8MCAsolIrJAq63qsOZg3si/JTIdlPaVOSZxzDEWiA
	 3pir2/HkaW2hwf0h3VCleUbs2/Ae4S5p7Fn6wuEeel//6SbBTv1FmGmYHE8+6RCsB7
	 LSfoJ+seDucShbaRk36R9buZcbAqv95rbfozJGr4LqflusK2xurbpuhR7aKAsTTIVj
	 4ypfk/GeKknWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7FF44206C;
	Fri,  6 Mar 2026 19:53:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F53D223
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2EFFB83D75
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0V8vLvfB_MsS for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:53:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C31EF83D65
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C31EF83D65
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C31EF83D65
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:03 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4838c15e3cbso88305575e9.3
 for <buildroot@buildroot.org>; Fri, 06 Mar 2026 11:53:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772826782; x=1773431582;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/0ax+dsM4LJ0OvgAf3yR/C5YvSdY7rlgzPkmKz1Zae8=;
 b=GSveYmm8hc+Wzwb4lrnz2DMgg+GWfck3wnVDPaboJQXqj2pH2A5klfxueCR3DbMSG7
 qCBlyjG4nqVkFtdxFr/S5zfNEY8iALzwIbeF54PR2j9xkx7JLz9VF1asVc2NnMHtxfOt
 aq22GZv1MHCvgrMnAgeOVhMrBYb3C0YCJRIJO51CQ57TVciNKwqMPELkJXyUDqT2fFFR
 0V/Mp5fi9QwqOnREZQxVB/f0qYcQ/J0Ik0JRORSui+t+GQ9VooV2TvWO2OxqJYBD/0gQ
 hb/5kMheSnhfYrHGn1SoZ8pCzJGH5vHIRGITle2I6xveMYlJehX1zcLfRzlVz8g6tF+w
 U0Ww==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLllO9z86GkdC6mINw1vf2EQ2358lo3v3eLKsOMbELYxisCg24irrMUI4z3kVECNQ8msIOIS3TSTc=@buildroot.org
X-Gm-Message-State: AOJu0Yx2aJPa5iignzaEYyYUAONpQNtRbYCnTRaVSqwxZwa9dbHRH6sz
 w06EEaVV0ldfjJq9zyHxAweEVc9zBHHdSvGz6Eowzsf3sBIvfxmfmlcVcxpR/GVMyPM=
X-Gm-Gg: ATEYQzxYEUj+BpMU2fJZAaRUIUhZB+/CSkirWEwgl6w7rfifnjxMLgtOMOCK8Rvgmei
 BHiAdyV8UR6r3O3d3po8YQ1oQyikd1Ggnqg8bR8ocz/HxzToxK/YaIdJ1G2a1hMnpinOGFZRHxM
 7K5En/AI5AZ6GTKkfxWFTp7AHx0+SyyOkY2SjWqqe/DqbV2QWKQOCJQp5hfOX4OORMqr3VpXgx6
 lKhlw7/taN3l6myZWDQ3OE1vhCqAHz58zkEZ9vcNEqaXeLtt0u7uDgLzp018OaO9Tw4NKNmW0yx
 J1YNcw/1u8VvB89gjl1+Cbvy78iW08fBw2MJfJRSvLaWtcUxmdbFg4xALEien/p71IEB4KhGFUy
 4Ez2s0mxSmx23Vf7QeshbtNJTcg+BmXoZHRj5IMqyC0jki3rTSknz+mIcW6WG1Zsyhra7zyD/Sn
 uz0kGPO61rJh4NEJY=
X-Received: by 2002:a05:600c:45c6:b0:483:7ae2:1737 with SMTP id
 5b1f17b1804b1-48526957d45mr54360535e9.17.1772826781629; 
 Fri, 06 Mar 2026 11:53:01 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851fae538bsm176239125e9.7.2026.03.06.11.53.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 11:53:01 -0800 (PST)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  6 Mar 2026 20:53:00 +0100
Message-ID: <20260306195300.7241-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260218195812.2983207-2-bernd@kuhls.net>
References: <20260218195812.2983207-2-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772826782; x=1773431582; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/0ax+dsM4LJ0OvgAf3yR/C5YvSdY7rlgzPkmKz1Zae8=;
 b=Zh0eNmWPrbpBTnf7Pp10Qt8Oj0BbCLoaWG/bsecvbP5Ofhjs4pUIRgq/HmAmV6s0Os
 0qGwLiSFqiLACWS/GmfJ3fnj5eTGBVmYMd4+crNnOgo4WPwP4w1FQIOyUoL3JLDRDcuH
 NGFpd4hMXU/94mF7AHvMb3fr1IrVX5AukSv1ayiu32C2qrr4AnURwEP3JL69XKlcjfod
 ruT59S5YfHuJt+tWIPuEpSWun9N0ry89Wans9rCO76PwEgBGdCs7sjygRivkrQx3istc
 pZV6NC3fgKe7JEGOJdq+kPJz/+Yx8sGWeeBPPVeFmTNVO5ej6vlwsvzTKmPwfyxKMVwA
 ogzw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Zh0eNmWP
Subject: Re: [Buildroot] [PATCH 2/2] package/wpewebkit: security bump to
 version 2.50.5
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> This updates WPE WebKit to the 2.50 stable series.
> WPE WebKit 2.50 highlights and 2.50.[1-5] release notes:
> 
> - https://wpewebkit.org/release/wpewebkit-2.50.0.html
> - https://wpewebkit.org/release/wpewebkit-2.50.1.html
> - https://wpewebkit.org/release/wpewebkit-2.50.2.html
> - https://wpewebkit.org/release/wpewebkit-2.50.3.html
> - https://wpewebkit.org/release/wpewebkit-2.50.4.html
> - https://wpewebkit.org/release/wpewebkit-2.50.5.html
> 
> Fixes the following security issues:
> 
> - From https://wpewebkit.org/security/WSA-2025-0007.html
>   CVE-2025-43343
> 
> - From https://wpewebkit.org/security/WSA-2025-0006.html
>   CVE-2025-43272, CVE-2025-43342, CVE-2025-43356, CVE-2025-43368
> 
> - From https://wpewebkit.org/security/WSA-2025-0005.html
>   CVE-2025-31273, CVE-2025-31278, CVE-2025-43211, CVE-2025-43212,
>   CVE-2025-43216, CVE-2025-43227, CVE-2025-43228, CVE-2025-43240,
>   CVE-2025-43265, CVE-2025-6558
> 
> Removed patch 0001 which is included in this release.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> [Bernd: bumped to 2.50.5, removed two patches originally added by Adrian
>  which were added to upstream version 2.50.2]
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  ...d-with-USE_SKIA_OPENTYPE_SVG-ON-and-.patch | 44 -------------------
>  package/wpewebkit/wpewebkit.hash              |  8 ++--
>  package/wpewebkit/wpewebkit.mk                |  2 +-
>  3 files changed, 5 insertions(+), 49 deletions(-)
>  delete mode 100644 package/wpewebkit/0001-WPE-Fix-the-build-with-USE_SKIA_OPENTYPE_SVG-ON-and-.patch
> 
> diff --git a/package/wpewebkit/0001-WPE-Fix-the-build-with-USE_SKIA_OPENTYPE_SVG-ON-and-.patch b/package/wpewebkit/0001-WPE-Fix-the-build-with-USE_SKIA_OPENTYPE_SVG-ON-and-.patch
> deleted file mode 100644
> index 8432543e07..0000000000
> --- a/package/wpewebkit/0001-WPE-Fix-the-build-with-USE_SKIA_OPENTYPE_SVG-ON-and-.patch
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -From 94acd1ce0ff2860b19f22ab2d386d7711c9699b7 Mon Sep 17 00:00:00 2001
> -From: Adrian Perez de Castro <aperez@igalia.com>
> -Date: Tue, 8 Jul 2025 21:46:44 +0300
> -Subject: [PATCH] [WPE] Fix the build with USE_SKIA_OPENTYPE_SVG=ON and
> - USE_SYSPROF_CAPTURE=OFF
> -
> -Unreviewed build fix.
> -
> -When backporting 287859@main the #include for the needed Skia header
> -slipped inside an USE(SYSPROF_CAPTURE) guard. This moves the guards
> -and #include statements to their correct places.
> -
> -* Source/WebKit/WebProcess/wpe/WebProcessMainWPE.cpp:
> -
> -Canonical link: https://commits.webkit.org/290945.273@webkitglib/2.48
> -
> -Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> -Upstream: https://github.com/WebKit/WebKit/commit/943d05f0c9b03c053a456c90c2a8817c1f679711
> ----
> - Source/WebKit/WebProcess/wpe/WebProcessMainWPE.cpp | 5 +++--
> - 1 file changed, 3 insertions(+), 2 deletions(-)
> -
> -diff --git a/Source/WebKit/WebProcess/wpe/WebProcessMainWPE.cpp b/Source/WebKit/WebProcess/wpe/WebProcessMainWPE.cpp
> -index a06e33fd04f8..5fb245ce0b66 100644
> ---- a/Source/WebKit/WebProcess/wpe/WebProcessMainWPE.cpp
> -+++ b/Source/WebKit/WebProcess/wpe/WebProcessMainWPE.cpp
> -@@ -43,11 +43,12 @@
> - #include <skia/core/SkGraphics.h>
> - #endif
> - 
> --#if USE(SYSPROF_CAPTURE)
> --#include <wtf/SystemTracing.h>
> - #if USE(SKIA_OPENTYPE_SVG)
> - #include <skia/modules/svg/SkSVGOpenTypeSVGDecoder.h>
> - #endif
> -+
> -+#if USE(SYSPROF_CAPTURE)
> -+#include <wtf/SystemTracing.h>
> - #endif
> - 
> - namespace WebKit {
> --- 
> -2.50.1
> -
> diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
> index 332fd9deaa..60a51c3e49 100644
> --- a/package/wpewebkit/wpewebkit.hash
> +++ b/package/wpewebkit/wpewebkit.hash
> @@ -1,7 +1,7 @@
> -# From https://wpewebkit.org/releases/wpewebkit-2.48.3.tar.xz.sums
> -md5  2d3b7fa3c62886546f918fcc289cabbe  wpewebkit-2.48.3.tar.xz
> -sha1  8a90b9ff8809c99c306defc1a08e50a31a09c590  wpewebkit-2.48.3.tar.xz
> -sha256  807571f07e87823b8fb79564692c9b1ef81ee62edbf51345a15bd0e7e1f2e07b  wpewebkit-2.48.3.tar.xz
> +# From https://wpewebkit.org/releases/wpewebkit-2.50.5.tar.xz.sums
> +md5  1d81485379005cca0236a278706f194f  wpewebkit-2.50.5.tar.xz
> +sha1  dd56b76eff8ba157a0291c0b61220666eed59313  wpewebkit-2.50.5.tar.xz
> +sha256  de4bfd20bfc921cdfc77e839ee4da84e2674bcb58b2f916172978d62fa115fc2  wpewebkit-2.50.5.tar.xz
>  
>  # Hashes for license files:
>  sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
> diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
> index 31aba2a0b9..03deb6e991 100644
> --- a/package/wpewebkit/wpewebkit.mk
> +++ b/package/wpewebkit/wpewebkit.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  # The middle number is even for stable releases, odd for development ones.
> -WPEWEBKIT_VERSION = 2.48.3
> +WPEWEBKIT_VERSION = 2.50.5
>  WPEWEBKIT_SITE = https://wpewebkit.org/releases
>  WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
>  WPEWEBKIT_INSTALL_STAGING = YES
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

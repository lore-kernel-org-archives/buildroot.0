Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29653F436B8
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 15:25:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0061260E66;
	Fri, 17 Apr 2026 15:25:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gfaSBS7DJlyX; Fri, 17 Apr 2026 15:25:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BF2E60DED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776439507;
	bh=+2D+7NtgF9T+D814JYV6cjwfE8/nOrLoGECqhyeB6ME=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Erh2LPJAjNYscMNGZskRRKYzDfnFOYtgXL+DRJtiE4lyjb9F6rkKHmYt9ELVlbpwr
	 Ic8nVty4qgGOzcaTPz4tG7ftZV0CR17Aq4Nqw7QqQqDQOowLcD/8Dhn5sC2CPfp3Jg
	 XvHB00/EQtlZ7+qhCt55xvUp8kHE0cIUM2vTF4wd0BcaXAkSnMXk04SJWJZy9S6/NK
	 nogmRQJE3H93qPtaGgFhZhZUiPxzhMp4p3TwoknAxdouPTtaUTuXClkjBMwoJk7l0G
	 v8FxTcHprn60E+WfyvsvL3E8ZLOIuJEcojUw0cVc0wjXsvqirUuQrzzx95KNbYejfU
	 6q16kAni+/X1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BF2E60DED;
	Fri, 17 Apr 2026 15:25:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6601C396
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:25:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C780406E0
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:25:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u4t4F1NNoJxp for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 15:25:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4677B405E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4677B405E0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4677B405E0
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:25:01 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-488afb0427eso10278485e9.1
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:25:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776439499; x=1777044299;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1Gkx7Rdn5dpZTfpwDV6COF0R0/awMsStv51fuVpA348=;
 b=WHsl3syYLl6tggXIxAXilib2+kiLxrMCLMrqxQZnFIxG/zsBkJ52Y2v29gmpopOx/S
 E3cX/5Pj3rcqxEbFI4N470iA1fBGlHx+tANw5kSgaLPwO5VqgSJzjL8AHHSnw+tAY2mS
 wI16u84WChwu9GBY3PPnurCBd+KzvJrr1NpIi50pOnbTtJquqQ/vhs7lRwDRlb0O/IAf
 rWQJldPmiIocAwV69ym2Iu9vz2nIjwciliUoKJWG1roRrfcY48pN/sp9mBOj/D62a7O2
 N+ODPftjfi2xsWXgph5qTSayntRvFj9Zp/RUvrg4SrEZ9LN6el/RrYusaIQZuiMy1Qsi
 9z5A==
X-Forwarded-Encrypted: i=1;
 AFNElJ9l+nm6iMuHcHWZJ+XGG+QWEmbDjVgAPLHtfpRHOMmqWBvBH9PgMoHWl605bw+pE8n5Oxxug3MB8pk=@buildroot.org
X-Gm-Message-State: AOJu0YwiY13gaPDDMW5ntTVNDXZRhZyUr8pehnRbVykNrPn3WT9x3lmg
 DnK0PRfPkYAIQMkXuyYTK9EIRequzNUaCyiAzAXQPypvE6k8ii9sd6+6rNuc5I1TA/amLQxd0xy
 yYHjd
X-Gm-Gg: AeBDievLFT2AUuVKDxoIxbiZEl7QIZrPOMPHflHjxC60V3q4cQwjUY+XEaBed6mHitt
 s6Dfka59GVy1xEICaYcDThyIilZtgaGWHQEdj7DUth3HanPagPSwXiSrlG5iUIN++LQfEpy/Jyh
 NG7kw3OSHYvRESCwTyiKq2vb9anBgfYMA46Y0LVDtIodBc2p+syBWnMTO3fXwCX+N9CC6FcFxHe
 A8Q/yh9ESHR+1vJq9VwaoHbyy9XLLCwJvZsNUB0O///uJ9+g8NMKrvX3RgXu3ayyNV86R1N+tMA
 cdnZGnCPg1SV3uyzOtc0dy6xOHk4Gzpw72WlgLMLTZVty0K9hF+SQN8vrV4iWB5qWOl4WUqHi0i
 2oh0jcsUnloiNa8Xc3rt2Dj5kKtRbDbTgMWxIMSQS9gznwMK+Uiws/pw3fCtAVLEOU+aMmTsVDm
 IF4YFPklzU2oDP9Wrn2MJs1GRLNDU=
X-Received: by 2002:a05:600c:3515:b0:488:8b99:54a1 with SMTP id
 5b1f17b1804b1-488fb78e7c5mr43818425e9.28.1776439499125; 
 Fri, 17 Apr 2026 08:24:59 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb794e26sm27126905e9.6.2026.04.17.08.24.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 08:24:58 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 17 Apr 2026 17:24:57 +0200
Message-ID: <20260417152457.313562-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410051908.25055-1-bernd@kuhls.net>
References: <20260410051908.25055-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1776439499; x=1777044299; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1Gkx7Rdn5dpZTfpwDV6COF0R0/awMsStv51fuVpA348=;
 b=WOJkdNesyVkKT1V/MGdG1jKwww9x4oCcXh7O9+BFHjbvSgSPHz5cjNoWG9mJj+6ny6
 YkBRH/d2bbG3KhmYkaUD+ehGw9D9nTF5iQ0nejSiU2ZBDeUcWX/Uay78ytQRjrOW+5Fz
 DF9jkgqDUU2aIIWDb7zwKDsmWC/4UwlpVD3Kh110D5aOlDPyGyOYZRfZ9Xlu09y44n2e
 AGACqVYjJ7/F4HgkwCcLum/9Dfupl82Wi9vNSW82rpbVYxx0Fl0Fhl+cy7RbGjO0JiRY
 hZHPfgmsFpO0F62aFzQeCJTnLa11qo2wtRthNkjNy2Mt3+bOLt6l7g2kIFkjTx3nFFJz
 iZ2g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=WOJkdNes
Subject: Re: [Buildroot] [PATCH 1/1] package/libcap: security bump version
 to 2.78
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
> Release notes:
> https://sites.google.com/site/fullycapable/release-notes-for-libcap#h.x4zn8j3lss6r
> 
> Removed patch which is included in this release.
> 
> Fixes CVE-2026-4878.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.02.x. Thanks

> ---
>  ...Add-build-ldflags-to-_makenames-rule.patch | 34 -------------------
>  package/libcap/libcap.hash                    |  2 +-
>  package/libcap/libcap.mk                      |  2 +-
>  3 files changed, 2 insertions(+), 36 deletions(-)
>  delete mode 100644 package/libcap/0001-Revert-libcap-Add-build-ldflags-to-_makenames-rule.patch
> 
> diff --git a/package/libcap/0001-Revert-libcap-Add-build-ldflags-to-_makenames-rule.patch b/package/libcap/0001-Revert-libcap-Add-build-ldflags-to-_makenames-rule.patch
> deleted file mode 100644
> index ae9655fd57..0000000000
> --- a/package/libcap/0001-Revert-libcap-Add-build-ldflags-to-_makenames-rule.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From 542d7d86ecd2129dd5fe7e5b31ba307304f5b319 Mon Sep 17 00:00:00 2001
> -From: "Andrew G. Morgan" <morgan@kernel.org>
> -Date: Mon, 10 Nov 2025 18:26:34 -0800
> -Subject: [PATCH] Revert "libcap: Add build ldflags to _makenames rule"
> -
> -This reverts commit c3ddf45d9afaab85d3b7db0dc7bfd1aafb8fde50.
> -
> -The details of what this broke are here:
> -
> -  https://bugzilla.kernel.org/show_bug.cgi?id=220691#c2
> -
> -Signed-off-by: Andrew G. Morgan <morgan@kernel.org>
> -Upstream: 542d7d86ecd2129dd5fe7e5b31ba307304f5b319
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ----
> - libcap/Makefile | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/libcap/Makefile b/libcap/Makefile
> -index f0eb87e..e90a950 100644
> ---- a/libcap/Makefile
> -+++ b/libcap/Makefile
> -@@ -80,7 +80,7 @@ $(PSXTITLE).pc: $(PSXTITLE).pc.in
> - 		$< >$@
> - 
> - _makenames: _makenames.c cap_names.list.h
> --	$(BUILD_CC) $(BUILD_CFLAGS) $(BUILD_CPPFLAGS) $< -o $@ $(BUILD_LDFLAGS)
> -+	$(BUILD_CC) $(BUILD_CFLAGS) $(BUILD_CPPFLAGS) $< -o $@
> - 
> - cap_names.h: _makenames
> - 	./_makenames > cap_names.h
> --- 
> -2.51.1
> -
> diff --git a/package/libcap/libcap.hash b/package/libcap/libcap.hash
> index 1925060235..735481f33c 100644
> --- a/package/libcap/libcap.hash
> +++ b/package/libcap/libcap.hash
> @@ -1,5 +1,5 @@
>  # https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/sha256sums.asc
> -sha256  897bc18b44afc26c70e78cead3dbb31e154acc24bee085a5a09079a88dbf6f52  libcap-2.77.tar.xz
> +sha256  0d621e562fd932ccf67b9660fb018e468a683d7b827541df27813228c996bb11  libcap-2.78.tar.xz
>  
>  # Hash for license file:
>  sha256  68467e731f4744bd6e0bb69e8df9c3a994e09cd6b203d0c41327ac6d079c581d  License
> diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
> index 37ccdc22b4..f3cd49ff0f 100644
> --- a/package/libcap/libcap.mk
> +++ b/package/libcap/libcap.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBCAP_VERSION = 2.77
> +LIBCAP_VERSION = 2.78
>  LIBCAP_SITE = https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2
>  LIBCAP_SOURCE = libcap-$(LIBCAP_VERSION).tar.xz
>  LIBCAP_LICENSE = GPL-2.0 or BSD-3-Clause
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

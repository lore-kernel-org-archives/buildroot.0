Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE6DCA0EE6
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 20:32:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44AC4607D0;
	Thu, 14 Aug 2025 20:32:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5C96-rpkRpG0; Thu, 14 Aug 2025 20:32:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3F1A6078A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3F1A6078A;
	Thu, 14 Aug 2025 20:32:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D7561BA
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3121380E2E
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:32:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C5FoSI46X4Ha for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 20:32:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4A45A80E23
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A45A80E23
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4A45A80E23
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:32:03 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-45a1b0b6ac4so6800535e9.2
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 13:32:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755203521; x=1755808321;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8SFJ4nJqmljV9dsS2UNrKMfiKf4alXe9y5kdARr6z8c=;
 b=ansWBs8w3PheVNUg64uOzWEPmwc1azp/aiiWBI/L8YD1OmtqGP3QzFkZKovJEQndSt
 +6AS9/AfJxwNUfjDi/u7nFkOmXDDwEJhizuxXh16nPxFxQMKNq6Nc6dm48CPVQCJIR3r
 PdwxbtQuutIY85VV9dbmFyX1mr/VRYQC0Bh5m71VfCLrKlaRTAJMswc+z5grLa6jfNO0
 VrHKWBQevJh9cTr/WMCfVBRkCOf46f1jMmVzd1KRtQRBJ4fgKdaQvEFLncRks42o+1PL
 BQxtYqVxnltuWERFRQCGLlFzELbihh2F2eYp1cONab3uyM9xlIdvb8VHe4Xbcd6rrQLJ
 93Qw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWw2Jm94ecBTh1scd044VZ8I7qdm+YdrLY0Wwx0dbL6UeB+F4qXptDkkc3wDcaCI0G/z2ODT7QGCug=@buildroot.org
X-Gm-Message-State: AOJu0YwDroDq29sqpjIn1i0rIfyqn8Aay3XvYCl/p7Ekh/xb7hy7DAlF
 eoAcfWc2dngRnBKYAvKtXValf7Or7Z8RyDJuDAWeXkiSeS7mb+SiHJaXAlivLrHdxs0sYbB9UIH
 uQVic2r0=
X-Gm-Gg: ASbGncvyWKD5lap1Nj56x4vec3j7Zwdss8y16Di6/VI6I5ybw7BByaZrV3V2FQKBBgr
 10xa3tT/snvHyjKi2ihE6Zq/Elbwgp2y9evw6YT0wEWVQsSt/xajayi7DhtJ73rKZPbMknFR6jQ
 UymuhIwzfQmVNjNf7GvM5kAA2+wvMw+77SZzJHiTGFz3TGmarrS1L+uJnx77Qmt3252Ar4xYMGH
 Ym2jQ/TLeBUkhlg1qhtqsJLyiQbwJm+VpUHeDLsFAgbtdhZ5v16ruMRY72a6GBUiqT5yehOVKgi
 qbrLyi7b0gYtJx6dyltXsCg1fUdYxcKOq9CstZIuM0pgdmO8OK61fnc9qd4qkaiYv636LafpEBQ
 Hr36m+A4AX3KtcA==
X-Google-Smtp-Source: AGHT+IHmriV2Xky3+LZt13cRlSbx+BjO0ZoQruBfU9E+2PYe4SEpORxKgeufImXku2hld12wfggsJA==
X-Received: by 2002:a05:600c:4f45:b0:456:3b21:ad1e with SMTP id
 5b1f17b1804b1-45a20d9cc19mr2161195e9.17.1755203521146; 
 Thu, 14 Aug 2025 13:32:01 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b90d147485sm14199598f8f.19.2025.08.14.13.32.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 13:32:00 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 14 Aug 2025 22:32:00 +0200
Message-ID: <20250814203200.2816273-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250805110636.3514105-1-peter@korsgaard.com>
References: <20250805110636.3514105-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755203521; x=1755808321; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8SFJ4nJqmljV9dsS2UNrKMfiKf4alXe9y5kdARr6z8c=;
 b=ZtOjDJWDVxV/tSrCopQjWIjyQfE4vR1C7ov8/Z6wo6WQ58VJxFqDjiO9PYpTlVSv+1
 67Bi42lKtX21Ut+TZkR8inWXrsIhA1dqF+KbZnvx+40TwfTdp28phZ9aRMGj94QmHYF2
 Hjgej6WVSpHtp5AyRlrD/UQc9leYghQJurde2IvTI6r+5gjG1z+CnOrInpC/8uMO++n/
 KBALjuQuKZzSQOroxx7QR2Y76clCGAx+KEvkvMvZNyEuTntyzD8LBEfA6XrlPnLi8qW7
 sCzSekumVljDPnFWo4cUAC4lqBDrS6bJ7rVPqGDVdFCiZ9o6/Qv+EhVTTbu7XVqnSsDZ
 0kGA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZtOjDJWD
Subject: Re: [Buildroot] [PATCH] package/glibc: security bump to version
 2.41-70
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
> Fixes the following security issues:
> 
> - CVE-2025-5702: power10: strcmp fails to save and restore nonvolatile
>   vector registers
>   https://sourceware.org/cgit/glibc/tree/advisories/GLIBC-SA-2025-0003
> 
> - CVE-2025-5745: power10: strncmp fails to save and restore nonvolatile
>   vector registers
>   https://sourceware.org/cgit/glibc/tree/advisories/GLIBC-SA-2025-0004
> 
> - CVE-2025-8058: posix: Fix double-free after allocation failure in regcomp
>   https://sourceware.org/cgit/glibc/tree/advisories/GLIBC-SA-2025-0005
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/glibc/glibc.hash       |  2 +-
>  package/glibc/glibc.mk         | 11 ++++++++++-
>  package/localedef/localedef.mk |  2 +-
>  3 files changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
> index 61af3d9488..0deba84dc7 100644
> --- a/package/glibc/glibc.hash
> +++ b/package/glibc/glibc.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated (fetched from Github)
> -sha256  ed2cd1f058f22f682e700c5be408975db62025a14863a5a6700ee93d5927504e  glibc-2.41-5-gcb7f20653724029be89224ed3a35d627cc5b4163.tar.gz
> +sha256  166b6e7637bb45cb9352e4813005f83dd48f03ef634d3e9e94a30aa5a0300fab  glibc-2.41-70-g1502c248d58cb99a203731707987a4342926e830.tar.gz
>  
>  # Hashes for license files
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index 29617b9756..239e39a2ba 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -7,7 +7,7 @@
>  # Generate version string using:
>  #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
>  # When updating the version, please also update localedef
> -GLIBC_VERSION = 2.41-5-gcb7f20653724029be89224ed3a35d627cc5b4163
> +GLIBC_VERSION = 2.41-70-g1502c248d58cb99a203731707987a4342926e830
>  
>  # Upstream doesn't officially provide an https download link.
>  # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
> @@ -25,6 +25,15 @@ GLIBC_CPE_ID_VENDOR = gnu
>  # allow proper matching with the CPE database.
>  GLIBC_CPE_ID_VERSION = $(word 1, $(subst -,$(space),$(GLIBC_VERSION)))
>  
> +# Fixed by glibc-2.41-57-g84bdbf8a6f2fdafd3661489dbb7f79835a52da82
> +GLIBC_IGNORE_CVES += CVE-2025-5745
> +
> +# Fixed by glibc-2.41-60-g0c76c951620f9e12df2a89b2c684878b55bb6795
> +GLIBC_IGNORE_CVES += CVE-2025-5702
> +
> +# Fixed by glibc-2.41-64-g1e16d0096d80a6e12d5bfa8e0aafdd13c47efd65
> +GLIBC_IGNORE_CVES += CVE-2025-8058
> +
>  # All these CVEs are considered as not being security issues by
>  # upstream glibc:
>  #  https://security-tracker.debian.org/tracker/CVE-2010-4756
> diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
> index 7a6c94bd2f..c76a8d82a0 100644
> --- a/package/localedef/localedef.mk
> +++ b/package/localedef/localedef.mk
> @@ -7,7 +7,7 @@
>  # Use the same VERSION and SITE as target glibc
>  # As in glibc.mk, generate version string using:
>  #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
> -LOCALEDEF_VERSION = 2.41-5-gcb7f20653724029be89224ed3a35d627cc5b4163
> +LOCALEDEF_VERSION = 2.41-70-g1502c248d58cb99a203731707987a4342926e830
>  LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION).tar.gz
>  LOCALEDEF_SITE = $(call github,bminor,glibc,$(LOCALEDEF_VERSION))
>  HOST_LOCALEDEF_DL_SUBDIR = glibc
> -- 
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

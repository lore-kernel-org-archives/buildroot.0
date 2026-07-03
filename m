Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D50C43458
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 14:33:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3512B61528;
	Fri,  3 Jul 2026 14:33:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2_8sUH4JXlxI; Fri,  3 Jul 2026 14:33:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BD8D610B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783089194;
	bh=77Ayn5o8Ga0YXe+Wt3UsJGD/NQTjIrViet5KzRsMM/k=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ixJHhJ9TqJB5ITamBjtueeECiKTqi8CO6oTlUW5oFg2+XYfs5es3MAMQ4PnG5ymb1
	 gDpi6Pz0ixyghs6XGlE4pBOmBMb8O7Z0rfp/bR0fMtlqkibgSeN+c3eJBN6Gzybfcy
	 aBszvBDqlzULwmUWlQEO4ltxGJQKhqq0mw9JI+QzXF6joRhcxcaBjLfhB0SW3h/KWM
	 O2YuZJpP8aW/LDPjDHrLE6pLlY6/YhZum4FlqKWSd/5uN1sJmtQ4/LWVp1flAcfoOU
	 f54ivb9I/x95oofhZ/uMFk9WDqvm7yFwPT0hLEKuq3JZMzWDDF/IkK7Ht4OBJQkJub
	 v4m5Oclyd/ahw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BD8D610B6;
	Fri,  3 Jul 2026 14:33:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1758D363
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 14A2182AB9
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:33:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XRhX16Qawpp0 for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 14:33:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D9C38820C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9C38820C1
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D9C38820C1
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:33:11 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-493c5220cb7so4329715e9.3
 for <buildroot@buildroot.org>; Fri, 03 Jul 2026 07:33:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783089190; x=1783693990;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=1YbmMXDU3e47pI95xA1KGfx9QUSIbgVVpU+PrZsF3UQ=;
 b=AasJvajI9Mqgv2aLWxKQ06azhtRoSBoNf+bGnZ1tKVoh8qm3s0+7pOBsTjXjYSB25D
 /NUjIMPVYR2MPjugdgUzUYuvTesKjEyCPJ63OJVOSragzkf+9KDB8OvLeeIMr3ib5+H2
 BCr01ZVaJADbY7uKH594llUwxTmBvJCtXRVyyJ9qu+jOt93AUnk5ev7etU8RHAWcZ/jt
 zy1/YDR5hIzbxp1LtIjcmJXoYKo6IPpg64VZ/jhHT9cXpbot2/R3Xnpp/XilPbNGPKH8
 ddQuGyCvy9jknkNAy/nbIQyE9dm4a92TYuHZyuMZBvwXtme9LK524ggrQLzQy7OKf7x0
 QDtQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rpm4zx/dK8nxSbiK326qQuRUmcl6xUcDaHQG8Ddm20qDn0H4J30uIqU8OrgRS2IQjWTff2LMy111Z8=@buildroot.org
X-Gm-Message-State: AOJu0YyA/fGc3yCjK4UdSJFf+uooHBCq1+oJSVAKXw/wv04cZkxA21yS
 DyYaMY9Smc4eLc1U6xly8SFBc7cDQdedC54RdaxDhDb4IiQy4eHraEYI/7B0rx10csE=
X-Gm-Gg: AfdE7cmCyc1S6+Dy4RMdFrUzGyMKogL5AhRSP+NqFlXfGg802vyInnRImPlt9E6AcJB
 v4tgHzLLVWKMz5lBgqRZxTlhzAMt9QH0uIfLL4AC7w7P+DuPkhnmBY8vZw6f9duWC3/Goc9LG/T
 n+cZqN/fb68nDe9/qjXdkeZdsJIvV+tnr14cDjeQcln6fN7ViHqCC9hCA4eDP1B2I3RC+NVkhNs
 BxOfbzFl5oem8yNP40SO4LWxUT5i780TCriqhfZKCLdlFZnOhu/DiFzO1owfpH2ViaTOfLvTfJD
 17oE9/3XZm1MojKq7+w8n2jkl3W0DaPOV4sxCZb7DwkspZjpn9/gcaK0tuYKf56fowbG7i9cpC+
 r8MKy80AatInj8og79q60Alcrkm8fiWIj0mIodysFbMDK7fY6SRFDcRGTtVeYUEnFyzlFi5ks82
 GJJNgp
X-Received: by 2002:a05:6000:420e:b0:45e:64b3:af44 with SMTP id
 ffacd0b85a97d-477b4fb28e9mr14728352f8f.36.1783089189825; 
 Fri, 03 Jul 2026 07:33:09 -0700 (PDT)
Received: from arch ([77.109.126.77]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-477d766e0b4sm17726439f8f.0.2026.07.03.07.33.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2026 07:33:09 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  3 Jul 2026 16:33:08 +0200
Message-ID: <20260703143308.275561-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260624184057.1060045-1-bernd@kuhls.net>
References: <20260624184057.1060045-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1783089190; x=1783693990; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=1YbmMXDU3e47pI95xA1KGfx9QUSIbgVVpU+PrZsF3UQ=;
 b=CYJ22L12E5Ozq0mdEqABqmFwSr1f+hBOyqVuhQfyaf+vUwFBdGTnjGs4ZOPofVeQVp
 JbplpOtEGkXvgApqJl66FECUmiIt8+QBWjGJYs0E2fxx8Pz/U8i4QwmaYuYBPfo4uvPC
 DLWUY5Br0GMN57QpzsresGhBK7I7ldP/8JEMyRqO0ZEZ3F/NVjRtAmuN4OpYf3Y1hvhm
 AQeeR8mg+tOaKOdY8Oe2k9AFBmwOnoP3c4dYVYka/vWlFXhJ8r0imy+15cXCcrcRnS91
 VWToTgOgg6Xt096jqvHdWlZ7QsY5pg+hAzQAf8JBJitF/eckfrVly9APi3WgUAXr9wpj
 Rm3A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=CYJ22L12
Subject: Re: [Buildroot] [PATCH 1/1] package/libcurl: security bump to
 version 8.21.0
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
> https://curl.se/ch/8.21.0.html
> https://daniel.haxx.se/blog/2026/06/24/curl-8-21-0/
> 
> Fixes the following CVEs:
> 
> Severity Medium
>     CVE-2026-8925: SASL double-free
>     CVE-2026-8927: env-set cross-proxy Digest auth state leak
>     CVE-2026-9079: stale proxy password leak
>     CVE-2026-11856: cross-origin Digest auth state leak
> 
> Severity Low
>     CVE-2026-8286: wrong STARTTLS connection reuse
>     CVE-2026-8458: wrong reuse for different services
>     CVE-2026-8924: trailing dot domain super cookie
>     CVE-2026-8926: password leak with netrc and user in URL
>     CVE-2026-8932: incomplete mTLS config matching in conn reuse
>     CVE-2026-9080: UAF after pause in socket callback
>     CVE-2026-9545: exposing HTTP/3 early data
>     CVE-2026-9546: sending old referer
>     CVE-2026-9547: SSH improper host validation
>     CVE-2026-10536: HTTP/2 stream-dependency tree UAF
>     CVE-2026-11352: QUIC zero-length UDP datagrams busy-loop
>     CVE-2026-11564: Native CA trust persist
>     CVE-2026-11586: WS Auto-PONG memory exhaustion
>     CVE-2026-12064: proto-default skips SSH verification
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/a016b2837c83c8c12dfd612efb0bb723190f7e18
> 
>  package/libcurl/libcurl.hash | 6 +++---
>  package/libcurl/libcurl.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
> index 549527b1af..e2393bf2f4 100644
> --- a/package/libcurl/libcurl.hash
> +++ b/package/libcurl/libcurl.hash
> @@ -1,7 +1,7 @@
> -# From https://github.com/curl/curl/releases/tag/curl-8_20_0
> +# From https://github.com/curl/curl/releases/tag/curl-8_21_0
>  # after checking pgp signature:
> -# https://curl.se/download/curl-8.20.0.tar.xz.asc
> +# https://curl.se/download/curl-8.21.0.tar.xz.asc
>  # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
> -sha256  63fe2dc148ba0ceae89922ef838f7e5c946272c2e78b7c59fab4b79d3ce2b896  curl-8.20.0.tar.xz
> +sha256  aa1b66a70eace83dc624508745646c08ae561de512ab403adffb93ac87fc72e6  curl-8.21.0.tar.xz
>  # Locally computed
>  sha256  82f2f4427d6545ee5aaac4f0b80428da6cc8ba41c2cf5da3a03680ec327b9681  COPYING
> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
> index 94d7ec677c..219ce9f712 100644
> --- a/package/libcurl/libcurl.mk
> +++ b/package/libcurl/libcurl.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBCURL_VERSION = 8.20.0
> +LIBCURL_VERSION = 8.21.0
>  LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
>  LIBCURL_SITE = https://curl.se/download
>  LIBCURL_DEPENDENCIES = host-pkgconf \
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

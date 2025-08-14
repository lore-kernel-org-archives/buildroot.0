Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C02CA0EE4
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 20:32:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F53C80EBF;
	Thu, 14 Aug 2025 20:32:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 45VTRhsS58Mm; Thu, 14 Aug 2025 20:32:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3AB2F80DBD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AB2F80DBD;
	Thu, 14 Aug 2025 20:32:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D0F8D228
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:32:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C35414048F
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:32:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ch9sRPGQlPYt for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 20:32:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 47A6F4046C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47A6F4046C
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 47A6F4046C
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:32:04 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3b9e413a219so1064594f8f.3
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 13:32:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755203522; x=1755808322;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Cibpb9PyhNeBB2btrw3VoSwPbXjKpzQPIxeWmPF5qew=;
 b=HpOtMKK2bqhMW0W/vn9VjpYeFObqxoF8l04/WdoPt/lExhbP4i4FyX1Y4d1GSZG6Zg
 M2oS6Rd4PYCcoxY0sQ5ywKWjMbflJF7BB6CLtFgFZ6DkUNTus8B/s5vt2VO0G+2egQ6b
 N9ONBmG0TQ28f8ZW8m05jJD2dP3RVpQfgOoCCdYI/Mg5PlGnafanb4dIrqRLSh8etnDF
 HE4dY0exKOnXkK0bs+cdSJCegBa4HnQVeInCQtIdhrb4SEpbjULRTPCHyD/t7wvBRCXi
 BnbyKBbXi6lYAAMkdg340fsyJkLkTI5rPy0S23sPou8rJJ2vbY0TKHFN5pDCN24oBGXG
 nAOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9Do74zhN25C9ALIvAwzARfsDYFBTfiBwWgQTzQaqduFie7RfrjHXlf8wwBLj6+1zW/8if/Cu2AjA=@buildroot.org
X-Gm-Message-State: AOJu0Yzz1aLWO1P/VXR+x/gEg3JwRuSQ3Ig4s6KGa9tu5rr0MI4YPOoN
 kFtnrUio+BufUwO/vZkbsD1GOK8p4WIPxcSm2g3C3RPsAVaUXE9at8u0GEK8J4vwi9c=
X-Gm-Gg: ASbGnct5rgk5GarUGY4lnsyhiUr48DUGVmM/3K6clOIxC6qlVztWHHFpQlg/NHNdr3q
 NdI4EFyGSkO3WKhA7SWnwBwbFEnbD5DWWL38PeRQMReV9evYS1B+4xsOSMvfOhzkM9P3b/bL5Ge
 swqfiyFxmym+loPVk6Y/VMwAgZCIHogUswMb9BlvZ2pVjz3t1mUsVS1NbcgWTvyxFZcgQkgWkLH
 Zw47MQY95GYm1t4SFuPLAssrE7bE4usBHsLgljiPNL7Ru71p6Tfi8E8ZqK6fi9M8jlQwAJz3BjQ
 27MayERDexQ4DsV5UMFIzYl4SziITA0/yNCfbIO89GrqnIu6yx8RBfDRpVkl07Xx/8Gs89MBr0I
 5TPnuDLea215k3w==
X-Google-Smtp-Source: AGHT+IEj6pnJCrY+xE8GeLlr8KowQXsKVEIoc1dMiMcOzIYlfQq1k9IDQl7mzNrjEOMJXWvzMPVdsg==
X-Received: by 2002:a05:6000:2407:b0:3a4:f72a:b18a with SMTP id
 ffacd0b85a97d-3b9e419288cmr4111025f8f.26.1755203522176; 
 Thu, 14 Aug 2025 13:32:02 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a1c6bd337sm33112425e9.4.2025.08.14.13.32.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 13:32:01 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 14 Aug 2025 22:32:01 +0200
Message-ID: <20250814203201.2816328-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250805124954.3736900-1-peter@korsgaard.com>
References: <20250805124954.3736900-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755203522; x=1755808322; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Cibpb9PyhNeBB2btrw3VoSwPbXjKpzQPIxeWmPF5qew=;
 b=Plx6ZulZUDaMwFoWDQdJ9FhTikO6iS/5rM07i/Gc7iy6mlJlJEhHInJOEs1U0fjjyg
 U0a1m0kBe6GENrPtIy2SsptQ+azRiJRtivcYkNBaUHxXUZVGIO8bPQlMcAL6OfNU9F5m
 UDP7TZUCXxiW7wiF7WWyonXA2sQ9BTltEqmPi4C84ecOUHG09Z9lYD+mD276tTIgUtKZ
 nznOKQTLCvFkEhPYDySjcJDYKwJeJTjyiAfdtm0EjOOqA8zA9DuWYEOyeCrWX16/rIIg
 u8wI1bgtJ+Eq7ibLLJGSuLLTiKq1dVBK/eDqSLZlL7t3DyVN79WgQHPf/4mo3Lrnj/G0
 fhOQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Plx6ZulZ
Subject: Re: [Buildroot] [PATCH] package/gnutls: security bump to version
 3.8.10
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
> GNUTLS-SA-2025-07-08-1 CVE-2025-32989
> Severity Medium; Heap read buffer overflow
> 
> When an X.509 certificate contains an SCT (signed certificate timestamp)
> extension and its length field is malformed, the library could read the memory
> buffer past the boundary. The issue was reported in the issue tracker as
> <https://gitlab.com/gnutls/gnutls/-/issues/1695>.
> 
> ------------------------------------------------------------------------------
> 
> GNUTLS-SA-2025-07-08-2 CVE-2025-32988
> Severity Low; Memory corruption on error path
> 
> When any error occurs during exporting a certificate with an otherName in the
> SAN (subject alternative name) extension, the library could potentially double
> free the ASN.1 structure. The issue was reported in the issue tracker as
> <https://gitlab.com/gnutls/gnutls/-/issues/1694>.
> 
> ------------------------------------------------------------------------------
> 
> GNUTLS-SA-2025-07-08-3 CVE-2025-32990
> Severity Low; Heap write buffer overflow
> 
> When the certtool program is invoked with a template file with a number of
> string pairs for a single keyword, a NULL pointer could be written past the
> memory boundary. The issue was reported in the issue tracker as
> <https://gitlab.com/gnutls/gnutls/-/issues/1696>.
> 
> ------------------------------------------------------------------------------
> 
> GNUTLS-SA-2025-07-08-4 CVE-2025-6395
> Severity Medium; Denial of service
> 
> When a TLS 1.3 handshake involves a Hello Retry Request and the second
> Client Hello omits the PSK which was present in the first Client Hello,
> the GnuTLS server can dereference a NULL pointer. The issue was reported
> in the issue tracker as <https://gitlab.com/gnutls/gnutls/-/issues/1718>.
> 
> https://lists.gnupg.org/pipermail/gnutls-help/2025-July/004883.html
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/gnutls/gnutls.hash | 4 ++--
>  package/gnutls/gnutls.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
> index dcfe201f3d..1b2a7ba9b5 100644
> --- a/package/gnutls/gnutls.hash
> +++ b/package/gnutls/gnutls.hash
> @@ -1,6 +1,6 @@
>  # Locally calculated after checking pgp signature
> -# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.8/gnutls-3.8.9.tar.xz.sig
> -sha256  69e113d802d1670c4d5ac1b99040b1f2d5c7c05daec5003813c049b5184820ed  gnutls-3.8.9.tar.xz
> +# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.8/gnutls-3.8.10.tar.xz.sig
> +sha256  db7fab7cce791e7727ebbef2334301c821d79a550ec55c9ef096b610b03eb6b7  gnutls-3.8.10.tar.xz
>  # Locally calculated
>  sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
>  sha256  20e50fe7aae3e56378ebf0417d9de904f55a0e61e4df315333e632a4d3555d95  COPYING.LESSERv2
> diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
> index e71e411cf0..7536189429 100644
> --- a/package/gnutls/gnutls.mk
> +++ b/package/gnutls/gnutls.mk
> @@ -6,7 +6,7 @@
>  
>  # When bumping, make sure *all* --without-libfoo-prefix options are in GNUTLS_CONF_OPTS
>  GNUTLS_VERSION_MAJOR = 3.8
> -GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).9
> +GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).10
>  GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
>  GNUTLS_SITE = https://www.gnupg.org/ftp/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
>  GNUTLS_LICENSE = LGPL-2.1+ (core library)
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

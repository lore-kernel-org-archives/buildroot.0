Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A9BC44506
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:52:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D7728118D;
	Fri, 10 Jul 2026 13:52:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MGF5YroV72HA; Fri, 10 Jul 2026 13:52:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63CDA811A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783691523;
	bh=4aFDMk/HnsuaWL4tzonjEyfJtCbg8FP+/TyTo4CPml8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kZgsdyIrXeY3VE1cLRt0ybyk8uHc3PJNTW56kYlMsP7k15mnASHzrFiKgcfiAGmry
	 yP1pMIduZ68YWRPp/G/IgSCkz9OGPTztyFJ4RlFzfSP79Vs6RQLmRO3Z+VUjbvEqzi
	 PnKxT4uPjLaPHB/aRi7X3sCKXuUPaBu1MobFhTfiEfKbJ+IUXYFq6/frrS3mqhG9KN
	 5rVDnLXwhOSPimZdUtR79dKslJm485rZM7WoBMZdr6iH4nFNZdvjpUhNF8CBBGlPT7
	 8q4lxw55GbkKsqHxl8REJAQ4Zr0kriU1gqdgQkWoS1kX0HukbZGnREzPYjaWAz5Cp3
	 ObUCttNRx6/jA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63CDA811A1;
	Fri, 10 Jul 2026 13:52:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 06FA4A3C
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:52:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E1497606F2
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:52:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oTirrVPYkq7y for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:52:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CE425606B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE425606B4
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CE425606B4
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:51:59 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-493f0ae9572so3635315e9.3
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 06:51:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783691518; x=1784296318;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=TvnKdqz9aKgCyN+QrVyFYdIB8oLd/DTV7SAuUQOZjJI=;
 b=T09dlBiS5bCydu7hx2aCaupKVakPGolwZvgp2eoMXVtrP1EfPV1naKFHYMsSmLyxx5
 4Czbg6xYT0tt7FgRdC2X4lFQxK3f8BF3FsOufN+NWBBVGJKrh40P2LtVScGFwZr3MAQ4
 lV4higtIgpoLoubMgysST70XdJgTuHoXC69fdZTHpViXIfSEM78F05TgvXvVJBTcKuWa
 bZZSPusijEiNzW4a9xeKOHpmIRWjPQZmStVNNlsjB+CfEUn+ze+MT5Bvqw1+e/Q06Lne
 ObIMk6obp8pYMDBN+BwS1aZJ1JgevwRc9k957P3vICgNIY5rDGec0mGznYVmPzL7Lq81
 EqJQ==
X-Gm-Message-State: AOJu0YxrDb8GSKdfq+9/6uQ0hgrkUmSS9oGqKodrZVJdlzQxWNKh/bD2
 kJaOjutZtS85eNUeCsdl7cxC3vqNw3E2rhjxN5nI2QD+OprpZF5A2w0jmysuWjLeVuiWesxkJj7
 dxQfF
X-Gm-Gg: AfdE7cm1xWQL4ZcePSRqJ9iAziLPJ5MFyqoNxuaSh4s5CRto1fng4Gg76GfagyvQmnO
 53HR1I9smeQQzFSgRwXshOJS853Rqv8VxvCLqn51SmrhAoECOE8GCVYacUpNiPy4c8mbw+BA+xf
 79yIjyG2+3ED6saRLIhry0Gkz/eCO0cvvLyGUnJVQ+jGepHQ2rkk7iYRbiDV4S+EbqRJNt8xRX3
 +uuIsyzcJoSHu3Tx+RhnAnQe5Lb2GXQbOZzE/2+tLsjK+qrRb1XYuDsW5nPzZ7xhmR6BsHRqcfX
 FQGCc4uX42e5zrXh+o4HZREXnvD3Ht/5WDJZd9e59DhwqFzXJGPC26e0e3IEHNfnzKvlRfuQun0
 x6LsnwzJqQZLltP1oZ9NI6P5+JZ48pSrh4OIFsAiZdqad4WdPjBjbpS4+tScGOt0G7oJbJc8a4D
 nzDHqtdQ==
X-Received: by 2002:a05:600c:5307:b0:493:f442:3de9 with SMTP id
 5b1f17b1804b1-493f442425emr32400605e9.27.1783691517768; 
 Fri, 10 Jul 2026 06:51:57 -0700 (PDT)
Received: from arch ([212.233.37.141]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb6df417sm147207095e9.8.2026.07.10.06.51.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 06:51:57 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri, 10 Jul 2026 15:51:56 +0200
Message-ID: <20260710135156.759883-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260629210600.630908-1-thomas.perale@mind.be>
References: <20260629210600.630908-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1783691518; x=1784296318; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=TvnKdqz9aKgCyN+QrVyFYdIB8oLd/DTV7SAuUQOZjJI=;
 b=OMJ0450AW6rq7b9HvIYlxiEwfaxN9ZQpJ3jfzqTFu+UnGBgQXcyCDsnLIAHVIzTlRJ
 9OEbjvUIdQSE5y1+rQdEowrsocuonA0aTuzlXxzvG17nHZnIRWl7x8vRQsydCEuJmHu7
 8ONMlTf6TJ+ymLOPR5KHf0PU1jPA8J8hqaG3xyXA3AyBINZ5IvY2LX41J50rnl6Akqf1
 HvsfyeYcj5uJ6XNWPkSaBuCN1OASSiVR/5cxTAtGI89a6IatWMLvqTrShR1JoGe2IPXU
 vuhLb83n6bbxBWxGO7Vwf4crrmurlLmS0TH4JuzvXFXaqedzG0eU8PN0J9D9jnk5j2qT
 DYWg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=OMJ0450A
Subject: Re: [Buildroot] [PATCH] package/openjpeg: add upstream patch for
 CVE-2026-6192
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
> - CVE-2026-6192:
>     A vulnerability was identified in uclouvain openjpeg up to 2.5.4. This
>     impacts the function opj_pi_initialise_encode in the library
>     src/lib/openjp2/pi.c. The manipulation leads to integer overflow. The
>     attack must be carried out locally. The exploit is publicly available
>     and might be used. The identifier of the patch is
>     839936aa33eb8899bbbd80fda02796bb65068951. It is suggested to install a
>     patch to address this issue.
> 
> For more information, see:
>   - https://www.cve.org/CVERecord?id=CVE-2026-6192
>   - https://github.com/uclouvain/openjpeg/commit/839936aa33eb8899bbbd80fda02796bb65068951
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2026.05.x & 2025.02.x. Thanks

> ---
>  ...ng-to-insufficient-memory-allocation.patch | 35 +++++++++++++++++++
>  package/openjpeg/openjpeg.mk                  |  3 ++
>  2 files changed, 38 insertions(+)
>  create mode 100644 package/openjpeg/0001-opj-pi-initialise-encode-avoid-potential-integer-overflow-leading-to-insufficient-memory-allocation.patch
> 
> diff --git a/package/openjpeg/0001-opj-pi-initialise-encode-avoid-potential-integer-overflow-leading-to-insufficient-memory-allocation.patch b/package/openjpeg/0001-opj-pi-initialise-encode-avoid-potential-integer-overflow-leading-to-insufficient-memory-allocation.patch
> new file mode 100644
> index 0000000000..de5c925ec0
> --- /dev/null
> +++ b/package/openjpeg/0001-opj-pi-initialise-encode-avoid-potential-integer-overflow-leading-to-insufficient-memory-allocation.patch
> @@ -0,0 +1,35 @@
> +From 839936aa33eb8899bbbd80fda02796bb65068951 Mon Sep 17 00:00:00 2001
> +From: Even Rouault <even.rouault@spatialys.com>
> +Date: Sun, 5 Apr 2026 13:25:27 +0200
> +Subject: [PATCH] opj_pi_initialise_encode() (write code path): avoid potential
> + integer overflow leading to insufficient memory allocation
> +
> +Fixes #1619
> +
> +CVE: CVE-2026-6192
> +Upstream: https://github.com/uclouvain/openjpeg/commit/839936aa33eb8899bbbd80fda02796bb65068951
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + src/lib/openjp2/pi.c | 9 ++++++---
> + 1 file changed, 6 insertions(+), 3 deletions(-)
> +
> +diff --git a/src/lib/openjp2/pi.c b/src/lib/openjp2/pi.c
> +index 15ac33142..4abb87af2 100644
> +--- a/src/lib/openjp2/pi.c
> ++++ b/src/lib/openjp2/pi.c
> +@@ -1694,9 +1694,12 @@ opj_pi_iterator_t *opj_pi_initialise_encode(const opj_image_t *p_image,
> +     l_current_pi = l_pi;
> + 
> +     /* memory allocation for include*/
> +-    l_current_pi->include_size = l_tcp->numlayers * l_step_l;
> +-    l_current_pi->include = (OPJ_INT16*) opj_calloc(l_current_pi->include_size,
> +-                            sizeof(OPJ_INT16));
> ++    l_current_pi->include = NULL;
> ++    if (l_step_l <= UINT_MAX / l_tcp->numlayers) {
> ++        l_current_pi->include_size = l_tcp->numlayers * l_step_l;
> ++        l_current_pi->include = (OPJ_INT16*) opj_calloc(l_current_pi->include_size,
> ++                                sizeof(OPJ_INT16));
> ++    }
> +     if (!l_current_pi->include) {
> +         opj_free(l_tmp_data);
> +         opj_free(l_tmp_ptr);
> diff --git a/package/openjpeg/openjpeg.mk b/package/openjpeg/openjpeg.mk
> index bc5d8143a6..7ded900856 100644
> --- a/package/openjpeg/openjpeg.mk
> +++ b/package/openjpeg/openjpeg.mk
> @@ -11,6 +11,9 @@ OPENJPEG_LICENSE_FILES = LICENSE
>  OPENJPEG_CPE_ID_VENDOR = uclouvain
>  OPENJPEG_INSTALL_STAGING = YES
>  
> +# 0001-opj-pi-initialise-encode-avoid-potential-integer-overflow-leading-to-insufficient-memory-allocation.patch
> +OPENJPEG_IGNORE_CVES += CVE-2026-6192
> +
>  OPENJPEG_DEPENDENCIES += $(if $(BR2_PACKAGE_ZLIB),zlib)
>  OPENJPEG_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBPNG),libpng)
>  OPENJPEG_DEPENDENCIES += $(if $(BR2_PACKAGE_TIFF),tiff)
> -- 
> 2.54.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

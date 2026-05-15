Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B35DCD4F25
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:46:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D83D41D92;
	Fri, 15 May 2026 17:46:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IXtPyR8v-S_L; Fri, 15 May 2026 17:46:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AC9A41D7A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867171;
	bh=/Ag/VDIVuJEigwscO8TL8kdZvyTFD4wrBBa90UOm+1s=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PMyQugRYYZtGWXGOLPF91wxQm5DzDoDQfKH2UjVTs2AAMzbiCBbsyNsbTJ9fn8Tqb
	 88MkYscyjOtn1QeP2Jn/I0b3pgJyJsMabo9dVj2225UrV4sESyeBZhfE95UmsZJ8he
	 ZLwaH741hu+pV6JMo4Icwg9irud1DHEGOHIugBZwWuXuucvx839BrE8794nsSDcDk6
	 nvRFRrAEuSeaEVsV2AqX9NU49wA3hZ/iCy4ye1KGkCgTudAoBpBI29C1HxwrG69bcx
	 Tujq/vAeNS7RJ1CW7xUqkYI86Ldm500DiB3ylJHsYgVdUOQDcz90EWewj8aHYOd7MX
	 TUaK5KOiLhw0w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AC9A41D7A;
	Fri, 15 May 2026 17:46:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 020BC23F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D2EF845F5
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EFpSykh_pMyZ for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:46:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 27440845E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27440845E5
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 27440845E5
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:06 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-488a88aeec9so912385e9.2
 for <buildroot@buildroot.org>; Fri, 15 May 2026 10:46:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778867164; x=1779471964;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=e00A+hvdB84s+yfjAT4jVGZx6MCzmbNzIzfebJcRnYc=;
 b=ryIlffLdHzRkJbv4GxcqPQxEvSEVpAqv3mXNlkSmFmyRo7An7it0fo/cCUDEU45waL
 pCiISQi1jfK2tLjdxTaMHJl+6Ik4X03Mo18TatvJzCH9DL7Dxd5Gu/sUTx3Vq8GbvjfH
 wqIZxujvq589ZjgfZUwSsQ9+7mxaqFn/nzBFfOTxJPv8sE/ZMWxzlF9mNf6bB3h7T1Tb
 jo62XBTpt5uznybxMSpUw0vC6B5P2hK5yfj62a9WRq48ME0r9FG8RrbfnyFJUgeof0Pl
 C5tXSUpybQ2XvAdFh2nwwwBJiKA91qVAgssFEKYOg7Gu5BSsfOlT2HFNZXvGnqor8mCs
 wFKw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+C5j+Q1nLT7s6+lxm/tuOYpVOLJBf7iCd/KojXbFJJ9xvQlR0k0Hqeh1cRCm66avFzPqQpANcNy2M=@buildroot.org
X-Gm-Message-State: AOJu0YzfYvZFR2I9Ma5uB3Y0G0rIieuXZb3XBGLlVxxKqTBW29E32dAW
 VAvkUYKutu8XmJzzWXJRBJvsy7zGSfp9tBOWhKqIwLllJOsukYOU/JlLvdGgYCFej7o=
X-Gm-Gg: Acq92OEoiq295BGN8fubsLCZuRXa3Mnm/fLBc1YIkgk8r4NwIhrLz4AznnF8MdC2duP
 L536/lmiKtASIIRez5nnAE0kw1TDdwKAQvr5LgcdU5tdMfWMiuNRhKs91QdxAjkv4dNqg7KbkUQ
 8Bang39Cc7308rg8BFlzwNAodGIkyJPuTQjPwgRDU5v7FoJCfHgcyVdodBgX9CwUmvIyzpN5OTM
 KSKF6oHMd5GJVMNEcRjL12x9kVpWzPhPDEQYSU1ikuy0syasLtQMXJq1SnDChPQTs+/1B/vBGxi
 2Gk5bH+AsVra3g3CLH01PGhOrRQ1klFlam0H8zGhwI5ufjSOgHBHwgqP6b+xOxxQREOYzCX/Mv2
 1mEQfV7tUR3aC6N2d15fWCXggDk4pJgyZCDH1Z2EioLDwlK3TWEjvwh2m/JopkWwFi8tU0P9Ot7
 5CGgbkb1WKgMruv/QG3fqjGZONspI8zfZWwCStmPpJV6m0QrQ6uBquI4c=
X-Received: by 2002:a05:600c:3506:b0:485:40db:d40c with SMTP id
 5b1f17b1804b1-48fe60e13d1mr72095815e9.3.1778867164210; 
 Fri, 15 May 2026 10:46:04 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48febc56f89sm23660635e9.3.2026.05.15.10.46.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 10:46:04 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 15 May 2026 19:46:03 +0200
Message-ID: <20260515174603.529527-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260507202811.3399651-1-bernd@kuhls.net>
References: <20260507202811.3399651-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778867164; x=1779471964; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e00A+hvdB84s+yfjAT4jVGZx6MCzmbNzIzfebJcRnYc=;
 b=RysYZ6H5isiPtlI6tyLXW1UyScJ2K5JIJsvHbj3ervmnsEoD/8YLAM/ssWxYxMBOVK
 TuFHd8fK1cOP2Ic6BfNY4D25JiMtSfa2rcv5O0J/VYwP0aCahpl1Lp+y4zXHMkfRu9TA
 CDHOZJx6msFvi8bmFBijgE7EDQQr3rQKoqpYWFfuoxav+k+7ael6YIwNCy8UrAbIxM6h
 1rPgP67pbw6alCu9paCuafBLCXB/B949ghtZ6TZ0IxkJAHQ4qE0ty7cDU4A7Q6T3g/5h
 jkc/QB6SRQHP8IDqM2znb+3c/AO/T4804e4Zfl6oeoOhQdy2XEIUvM5GrFU9Dw+vfy6U
 aBMA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=RysYZ6H5
Subject: Re: [Buildroot] [PATCH 1/1] package/php: security bump version to
 8.5.6
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
> https://www.php.net/ChangeLog-8.php#8.5.6
> https://news-web.php.net/php.announce/492
> https://github.com/php/php-src/blob/php-8.5.6/NEWS
> 
> Fixes CVE-2026-7263, CVE-2026-6735, CVE-2026-29078, CVE-2026-29079,
> CVE-2026-7259, CVE-2026-6104, CVE-2025-14179, CVE-2026-6722,
> CVE-2026-7261, CVE-2026-7262, CVE-2026-7568, CVE-2026-7258 &
> CVE-2026-42371.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.02.x. Thanks

> ---
>  package/php/php.hash | 2 +-
>  package/php/php.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/php/php.hash b/package/php/php.hash
> index d400f8e0bb..c85df44d73 100644
> --- a/package/php/php.hash
> +++ b/package/php/php.hash
> @@ -1,5 +1,5 @@
>  # From https://www.php.net/downloads.php?source=Y
> -sha256  95bec382f4bd00570a8ef52a58ec04d8d9b9a90494781f1c106d1b274a3902f2  php-8.5.5.tar.xz
> +sha256  826c600b7c6f956bd335558ca3bdbcab23b22126c1cc8d9348be2280a2204bb7  php-8.5.6.tar.xz
>  
>  # License file
>  sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
> diff --git a/package/php/php.mk b/package/php/php.mk
> index 9976884001..0eae93fac2 100644
> --- a/package/php/php.mk
> +++ b/package/php/php.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -PHP_VERSION = 8.5.5
> +PHP_VERSION = 8.5.6
>  PHP_SITE = https://www.php.net/distributions
>  PHP_SOURCE = php-$(PHP_VERSION).tar.xz
>  PHP_INSTALL_STAGING = YES
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

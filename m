Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67507C5516F
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 12:05:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27DA641006;
	Fri, 31 Jul 2026 12:05:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KYtAgXfruApM; Fri, 31 Jul 2026 12:05:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E47E40FC2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785499534;
	bh=H9i/YCeW7OShxiHYE/onSyfCTaf2RILd+se2kMy2tyg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ORpGUMg+47G2exoxEZwdWxGMqUuDwIARUHPx+VESlgECeLl8ZFbgLZdiX4k/6jTKy
	 APQc/Xb+G5Ht6tj5LCcy4Q09MfwC+FU9XNmc2+3UhaNOkGV2S7hTj8IEjm3MW4T9xG
	 ee0Yiv1yUWrTOVcywfm7rN1sI7bbp5YuZEO+2ZGsNXYogHGQ1tODB06RtmQcXbRaw0
	 6SYfzUrZFCyfX2WgaVReUER4PpYgTVtjtNxjB5/0eVNLAfC8O9JQq7x/tuFu+TyqhH
	 IOJeJPN93qi8kneFu+CRz39ZPyzC8sd42tE1al5sv4Aj2dODtDQHDOaBgvTZPq/VFh
	 wi0k/yiKqe/Rg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E47E40FC2;
	Fri, 31 Jul 2026 12:05:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 193BD27C
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:05:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F32818132E
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:05:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3YzFiENkLa3E for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 12:05:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6EE5A81316
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6EE5A81316
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6EE5A81316
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:05:31 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-47de0093c42so212179f8f.3
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 05:05:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785499529; x=1786104329;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ejgLZTccIzNPkNg6lAZa8z0Y0uvZ1Qy52Y+fHeWzIm4=;
 b=AwKAs2k2vahpE4KxibABsVX+xU50NdhN55hrP8XzZhnBShn7oNfwesFzzNODuUCJoD
 A2mVEqJJZPjeXmSUq5h+sBk+ZKeFzpspK4/gxlOnl1Z/4VGS07fS3OE2YRlvAI+OGUe8
 ivxfeMEfAFdFvmEeB3PWbamliks2o1WJPFhscdcFEVrp8jUdmXdxulZpyXibcg9jvsmj
 TIWiPgIsyhPXQA74bkMuWmJqiMnHrXoMYQqeZKsH0CnmYS1dHIZV36W5ZorXIOMDj4xA
 UH+dUR+1+4tin9pzAv40OM+bJmnwEVfRXV54xt5n59LZ0qYeAwwVZ/04wUnQMY4WyOEL
 BfAA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqvvdhyNaJY0ockOYy4J+IRMFa4P/1Bgv/5ZnJJo44IIJwjeVIpNRJ3h2GJC6TUirtnp1olwWQuTSs=@buildroot.org
X-Gm-Message-State: AOJu0YxHWWgmmV5ySDIjtarvvOw/b5mvTIwVixvjX0THQBXuvO3yEm/x
 WCsF9qoad2v7t+qvaMj3SczLcqyWluFw3yvgZmERh0S9dveLPe80yZJ99CP7g8oLPrE=
X-Gm-Gg: AR+sD11tDyAeJgskKCOQnyLSRSbnZsgKvXhF81lQ62b/dAMyfoV7G72y3qftYS/giQv
 k3psSXy38ufdCN8NeGuZL0MHxAuG0+L+ls/3OUcYdALkzi4S7P8yJkFG13UVDnjjBHsIcv+3Dox
 2tQwEo36hlMfO1Wjqq/wziJxoFDwlcvQjtKT0nHHeC9kC2c/exbzFJ1C0DnpxSwmsseJi1YBUxR
 Wes0WZ7bHI5rul8TZIz4hYpA0naHSE+Dfjsku0TUZ9aGmGM5XYsu+lV/2NIxxBD5mEC5A1VF0eH
 xBnoSQRaC1xiFBVfqir9TQQq6zUBLPqC3PfbgPwLSIZ6k8Cv+Q044hHjUr2lYkCQoZN6AD3mP3Z
 kjaUkxU66kebMl48K13DSO4QQ4iWN3R7ZsKFxEc+xtideF4FcjMgWuVoGKS9DHuK+28/7c7tExy
 6zlL2fiyvxDRrZusTxkdrfFWdn4MEGGMy5rOsHCSwxvKnfIOO9O6iff0XHnkc0F7Xidcr2SM6C0
 ttt66PIrSHAQ6KrN/8ijzv/cw==
X-Received: by 2002:a05:6000:22c9:b0:47f:8b24:ef01 with SMTP id
 ffacd0b85a97d-47fd2ac1d82mr4174058f8f.1.1785499529143; 
 Fri, 31 Jul 2026 05:05:29 -0700 (PDT)
Received: from mindpad (213.219.161.200.adsl.dyn.edpnet.net. [213.219.161.200])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fd458b73asm3558671f8f.29.2026.07.31.05.05.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2026 05:05:28 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 31 Jul 2026 14:05:28 +0200
Message-ID: <20260731120528.3649-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260721184316.3523325-1-bernd@kuhls.net>
References: <20260721184316.3523325-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1785499529; x=1786104329; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ejgLZTccIzNPkNg6lAZa8z0Y0uvZ1Qy52Y+fHeWzIm4=;
 b=e68IlzV4uYhG9um5020UYcKYc5c3szMi83fWgwAN7q2FzV7QdUsZwk3dQkLwVq8x/V
 2NU93yakDUx/KYqqVEr9q80Q8o5PeQsTVUskCxEz/Q/oE7S1OOxDFOVaMrDAFMCaHZcF
 mkPxHP3xLZ0kpvxh80SAGZaZn6+QQeeLvAvB2mZY4Cl+RPeSMxgCp621tFXYnA+cejr5
 +llXts3UzbW544lCGiKSRafFnMSfFCuuXc11Crdsmkpi+JOqtSC0GQ0drDTiDaUE9VUs
 Dd6/8DVEwyTsLB7jM+awiWKtlA1kS71A5HF7l8pe07g+0HLvQR1oCMFrWzC54r0ldNVX
 U8fA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=e68IlzV4
Subject: Re: [Buildroot] [PATCH 1/1] package/libssh: security bump version
 to 0.12.1
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
> https://gitlab.com/libssh/libssh-mirror/-/tags/libssh-0.12.1
> https://www.libssh.org/2026/07/21/libssh-0-12-1-and-0-11-5-security-releases/
> 
> Fixes the following security problems:
> 
> CVE-2026-15370: Stack buffer overflow in SFTP server longname construction
> CVE-2026-59842: Information disclosure via short GSSAPI Curve25519 public key
> CVE-2026-59843: Denial of service via zero advertised channel packet size
> CVE-2026-59844: Denial of service via oversized SFTP read length
> CVE-2026-59845: Denial of service via unchecked ProxyCommand fork() failure
> CVE-2026-59846: Information disclosure via ProxyCommand %r username expansion
> CVE-2026-59847: Integrity downgrade via OpenSSL AES-GCM tag verification
> CVE-2026-59848: Denial of service via SFTP responses with unknown request IDs
> CVE-2026-59849: Denial of service via automatic certificate authentication loop
> CVE-2026-59850: Use-after-free via data callbacks on closed channels
> CVE-2026-59851: Authentication bypass via missing GSSAPI principal check
> Zero-initialize every ssh_string
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/73ee002c4b0394edd42a0c33674a8360f6b0f704
> 
>  package/libssh/libssh.hash | 4 ++--
>  package/libssh/libssh.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libssh/libssh.hash b/package/libssh/libssh.hash
> index 8c40dea2e5..a1f59fe810 100644
> --- a/package/libssh/libssh.hash
> +++ b/package/libssh/libssh.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated after checking pgp signature
> -# https://www.libssh.org/files/0.12/libssh-0.12.0.tar.xz.asc
> +# https://www.libssh.org/files/0.12/libssh-0.12.1.tar.xz.asc
>  # with key 88A228D89B07C2C77D0C780903D5DF8CFDD3E8E7
> -sha256  1a6af424d8327e5eedef4e5fe7f5b924226dd617ac9f3de80f217d82a36a7121  libssh-0.12.0.tar.xz
> +sha256  d3941af0a2d78d5d82ed7a36988e9133994312f035b9659a6e43f8db3968784c  libssh-0.12.1.tar.xz
>  sha256  1656186e951db1c010a8485481fa94587f7e53a26d24976bef97945ad0c4df5a  COPYING
> diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
> index 017ff2c197..5fd34b47b0 100644
> --- a/package/libssh/libssh.mk
> +++ b/package/libssh/libssh.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  LIBSSH_VERSION_MAJOR = 0.12
> -LIBSSH_VERSION = $(LIBSSH_VERSION_MAJOR).0
> +LIBSSH_VERSION = $(LIBSSH_VERSION_MAJOR).1
>  LIBSSH_SOURCE = libssh-$(LIBSSH_VERSION).tar.xz
>  LIBSSH_SITE = https://www.libssh.org/files/$(LIBSSH_VERSION_MAJOR)
>  LIBSSH_LICENSE = LGPL-2.1
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

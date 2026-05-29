Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE52ACD6E4F
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:30:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7BB684332;
	Fri, 29 May 2026 08:30:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KGINmB8cLqeX; Fri, 29 May 2026 08:30:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D11E184336
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043440;
	bh=Mjz0JX5AFbYfuKpcZzaxNFReDXarigDpw4oCnyg/Fvs=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XqrVCCnfW86tXHDmFsQ2bzOL6RtWHNVfV32MTUr4mAZJ3vLRDhpGxFt36xWrHptBW
	 34VDwJDBcNtgkfAx64NX/SK8m2a0zFbBTy+EcEZzg+tvyXa2fwnLGx3V1z8fqPGzdi
	 SZ7P6NqMko9dmLGQ5Gy7oGyxHVNB3GVtHuoAT9ltlPjho4/Djtlipk8c9tRKFNrmt7
	 OFFMRa0WMHD6bncUkg+ZUGuY/aisholy7DVrlUxhzFT4l715Nfg86UrFnQBWgLxSgL
	 a1+t/q3mzmskDUU+4Sjgc6gNPsTB5eM1XsyGZxhgGir9LaLA5sroBB1dRu2YWrYizu
	 xrn1FMdi4b5DQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D11E184336;
	Fri, 29 May 2026 08:30:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CB6B428E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ACFF984302
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id il9REp7BbUqC for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:30:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A629884309
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A629884309
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A629884309
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:27 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4903997fcb5so79197525e9.2
 for <buildroot@buildroot.org>; Fri, 29 May 2026 01:30:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780043426; x=1780648226;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4P99uNhqlq+oT473LIkY88T8iH7pRuACgopmI2sJcHg=;
 b=JCrU4hCOrCB0XsK9AA60n7klJgQ3WMuJj0i42quZfTg3zJc7fGzTHCskplx7CatJJ5
 CzluVYOFXaOBFlQoa5J9zHhZTpAyEePOE6dM53ClRfETOESkY6snIaWW4vFcr3ZKSAYJ
 jWGFMDTya+GFKLsRp97menfPyVPBFRzbgfrbmfyn3Jm40fmbpSv0sKaGDLaA5iQlizAu
 4hhoa7gvCmU825jV9BzPR59vj4/349D04U6rAJjdkjG/9eC0vMyKYre5Bu/OFN0x+D/3
 9nofDqMbrt27c+S1VxJ+QW2cb+RSsMQMzxtHPvP1OCCUyZsfC1OpQr5PtuYZlu3c/iHr
 3n4Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ8271SyeeHla9QOBCdyCwOioPSvMhnuyXYNfkD1A2MclnuYODGqpH3yxplgog4KfkDM1AAvr89Gcw0=@buildroot.org
X-Gm-Message-State: AOJu0YwPogFV4fXMTlR146r+jkReOiDwupUd5eELKaSnQyA3yHa7iyHd
 pCDDDRycpE4QFyGRas3fqUYlH1pS0cacMA5cSaz9n6+ENbrEhhyHxY5JG9pM0rhkqac=
X-Gm-Gg: Acq92OHFe992ecC2+AwZnU8IuxKxJTnZk9uOwdqoF4lJ947en8Ps0FqITH1bjYtZlHa
 XPyUf31qlvzZi5EABlmI3XaNENDthXDPpJ89VsUOscEsLQW+b+K5Lb8T7Rc/PA8gr3qVKP4XkRq
 tFi0d7fN4/ktH092zUN3MjLsDRD66j0m/JKsqQmdF2nyiqrafuzokwHgtMXqX7ghEp6STHB863R
 zIBdVN4E/mGk5hM+F7xyAOoAaFI9OAlGNX1m3/htlqVaW3rszLTen1ihJEEiI+vE8iD+dK1Ta/t
 6E9hK9ZeePL/O2NugB6lvSpif88aJZGSkLCt2lLEXWF47odS3Tej3STkvJnLSwO78MNPAmoun4m
 zyBzQ15LoCoQleZfP7+8rfzgtc7ZtmmbH1pQm8CtF4zZ/zyl+Br2pVuxmFClqkT1qIzkt/KFpCx
 6SSNvMsm5gzeQQg1zwB1eKsx5hCDulkRRz7L2LIB6Vt8VjchjquKhjGmy5pw==
X-Received: by 2002:a05:600d:6445:20b0:490:505b:512c with SMTP id
 5b1f17b1804b1-4909c0d6807mr22496105e9.19.1780043425757; 
 Fri, 29 May 2026 01:30:25 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909c0e8c1bsm12223655e9.3.2026.05.29.01.30.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:30:25 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 29 May 2026 10:30:24 +0200
Message-ID: <20260529083024.59550-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260514064055.34049-1-bernd@kuhls.net>
References: <20260514064055.34049-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780043426; x=1780648226; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4P99uNhqlq+oT473LIkY88T8iH7pRuACgopmI2sJcHg=;
 b=XQOE4ZGs703nhIs4z3V6g6w5XQvotAmVhWJXOc/XGP4JzqBGg+sPX/XmT9mXhMqt9G
 AQpYhQWffDiOjdmG8WCl0+y+LLQyLrzetKWjbYTHt1fs4ElPQeIOYD8aQA1LyeUVUWmz
 br9K2+fFEA4UoWwL2tWMAZ/KM7v3xUsNnnL94CbFGacAuQb8Nq0zC+mYf91Utn6RSqOl
 f4S3gTVxKUDgiRPSyJFZbj65aAHiPwwxQ0257/0f9ARjlypd92ZtteZVEZQX2khY8cDE
 L/dg5EMv3qd5QDFutRvX6Gtp3ugvPoEQtY43m0xLPEgMaWap3tX7deiWHwVWtyjOU/Os
 XtfQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=XQOE4ZGs
Subject: Re: [Buildroot] [PATCH 1/1] package/sed: security bump version to
 4.10
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
> https://lists.gnu.org/archive/html/sed-devel/2026-04/msg00027.html
> "'sed --follow-symlinks -i' no longer has a TOCTOU race [...]"
> 
> Fixes CVE-2026-5958: https://cert.pl/en/posts/2026/04/CVE-2026-5958/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/sed/sed.hash | 4 ++--
>  package/sed/sed.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/sed/sed.hash b/package/sed/sed.hash
> index 10e2c36d8f..1f1a578813 100644
> --- a/package/sed/sed.hash
> +++ b/package/sed/sed.hash
> @@ -1,6 +1,6 @@
>  # Locally calculated after checking pgp signature
> -# https://ftp.gnu.org/gnu/sed/sed-4.9.tar.xz.sig
> +# https://ftp.gnu.org/gnu/sed/sed-4.10.tar.xz.sig
>  # with the key 155D3FC500C834486D1EEA677FD9FCCB000BEEEE
> -sha256  6e226b732e1cd739464ad6862bd1a1aba42d7982922da7a53519631d24975181  sed-4.9.tar.xz
> +sha256  b8e72182b2ec96a3574e2998c47b7aaa64cc20ce000d8e9ac313cc07cecf28c7  sed-4.10.tar.xz
>  # Locally calculated
>  sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
> diff --git a/package/sed/sed.mk b/package/sed/sed.mk
> index 8165083658..cf6d263b06 100644
> --- a/package/sed/sed.mk
> +++ b/package/sed/sed.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SED_VERSION = 4.9
> +SED_VERSION = 4.10
>  SED_SOURCE = sed-$(SED_VERSION).tar.xz
>  SED_SITE = $(BR2_GNU_MIRROR)/sed
>  SED_LICENSE = GPL-3.0
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

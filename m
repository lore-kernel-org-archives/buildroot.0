Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D14C83F34
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:41:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CD8640FE4;
	Thu, 17 Jul 2025 20:41:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fHQp6W22Sf0P; Thu, 17 Jul 2025 20:41:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1F7740FB9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1F7740FB9;
	Thu, 17 Jul 2025 20:41:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 949651A6
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:41:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A3F581E40
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:41:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qJOKfH9VU2Yd for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:41:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8087D81E38
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8087D81E38
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8087D81E38
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:41:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 89BFCB977A8D; Thu, 17 Jul 2025 22:41:10 +0200 (CEST)
Message-ID: <8ab2a03e-c324-496e-a8ab-2a7a77046806@rnout.be>
Date: Thu, 17 Jul 2025 22:41:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20250715222832.741431-1-james.hilliard1@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250715222832.741431-1-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1752784870; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=rhxTMiWY4d/cZQgYrsJxMTWXgtVArUXP4RvBf2TDkT4=;
 b=Mo1HQM3OyC/dQT+F9tPWdbaMX5dsRZqEKP/P0OLOq4K5ojVweAEcCKiVYcJ4LaNupArFgv
 ReA1p3IXJ5JaySWLisiK3vzlxdVyY1ZX3S0bXZE2xUTgMKV2JjuAy5uCHQP7BNb/f1+XJ2
 b3/98MIw31xuTzucSJg94XGYZRzD4nfFQwNPcmI2AoVhg1ezuUO8Zy+HXZdxdnBupTHZ9q
 g4PlelAnH78a82rGbC9tSU6VWFSk9skCNvVvofiZLJqpmNaRB1LlzBInAgm2dDOIwcZTYn
 QhXbK0517aIFeeGIgXtHZeU0nc7083ZOd8JjOcgJbwTfjDbz+ijBepO9VXOBAg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Mo1HQM3O
Subject: Re: [Buildroot] [PATCH 1/1] package/python-setuptools-rust: bump to
 version 1.11.1
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 16/07/2025 00:28, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-setuptools-rust/python-setuptools-rust.hash | 4 ++--
>   package/python-setuptools-rust/python-setuptools-rust.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-setuptools-rust/python-setuptools-rust.hash b/package/python-setuptools-rust/python-setuptools-rust.hash
> index 2b7c7b9387..daba4fb28e 100644
> --- a/package/python-setuptools-rust/python-setuptools-rust.hash
> +++ b/package/python-setuptools-rust/python-setuptools-rust.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/setuptools-rust/json
> -md5  09bd134c06a3083ed65a6ca01314dbe7  setuptools_rust-1.11.0.tar.gz
> -sha256  f765d66f3def6fdc85e1e6d889c6a812aea1430c8dadcf1c7b6779b45f874fb2  setuptools_rust-1.11.0.tar.gz
> +md5  cc5c2cf6828af473951295d9f33bcf33  setuptools_rust-1.11.1.tar.gz
> +sha256  7dabc4392252ced314b8050d63276e05fdc5d32398fc7d3cce1f6a6ac35b76c0  setuptools_rust-1.11.1.tar.gz
>   # Locally computed sha256 checksums
>   sha256  b20668c1590582b3882854050ccfbdb7aee1f71a1ffe9eacc4c5aeb08a14161b  LICENSE
> diff --git a/package/python-setuptools-rust/python-setuptools-rust.mk b/package/python-setuptools-rust/python-setuptools-rust.mk
> index ef61da549a..01cd04867a 100644
> --- a/package/python-setuptools-rust/python-setuptools-rust.mk
> +++ b/package/python-setuptools-rust/python-setuptools-rust.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_SETUPTOOLS_RUST_VERSION = 1.11.0
> +PYTHON_SETUPTOOLS_RUST_VERSION = 1.11.1
>   PYTHON_SETUPTOOLS_RUST_SOURCE = setuptools_rust-$(PYTHON_SETUPTOOLS_RUST_VERSION).tar.gz
> -PYTHON_SETUPTOOLS_RUST_SITE = https://files.pythonhosted.org/packages/e0/0c/db5a68b4e95229db38a1793d58561870bd68b92b95fed183c6cd48910c9f
> +PYTHON_SETUPTOOLS_RUST_SITE = https://files.pythonhosted.org/packages/e0/92/bf8589b1a2b6107cf9ec8daa9954c0b7620643fe1f37d31d75e572d995f5
>   PYTHON_SETUPTOOLS_RUST_SETUP_TYPE = setuptools
>   PYTHON_SETUPTOOLS_RUST_LICENSE = MIT
>   PYTHON_SETUPTOOLS_RUST_LICENSE_FILES = LICENSE

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

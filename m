Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39683D0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1086740DCA;
	Wed,  7 Jan 2026 17:50:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EOb5hE9u-WSU; Wed,  7 Jan 2026 17:50:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2850B40DD2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808224;
	bh=rK6TnQrvmZQllybHUrFmSeBOjhOZP34M5QqA1EWftKw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SgIihNA9k35N680ljPoU6VXBfzOHiKZQAu2a8lyvRYO0hNUClJmkm8140fF0UclDs
	 V6WyNFRDfSq5gz6aMBb4hY36oheJifRPfAiyUEIIhpXw21YnTdetIbj1Eqwr8Ulmul
	 +7cLKikmdb+itSR+9NGOYJv9KLiMa4sbTLb1s27qgW7zk7dCC7BtR25+A+DE67sgLU
	 dwQqmth+9kejPTezw8fFD4FTwDPNNJkRDfjTOU/F4A1W1BWbrvAifkztUttlhhN4Fh
	 NRXzAKGs0OIzjMHMP7ZnsAp2Ssns978mnPctK60SeK83am1pJZRm0QC48jMhZlhGSE
	 zdpZwBeWKpDvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2850B40DD2;
	Wed,  7 Jan 2026 17:50:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5EB499ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 45BAA40160
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2uYY6X71cJGI for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:50:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 400E140128
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 400E140128
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 400E140128
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6883FB97A70F; Wed,  7 Jan 2026 18:50:19 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:50:18 +0100
Message-ID: <20260107175018.226198-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251221223441.185169-13-bernd@kuhls.net>
References: <20251221223441.185169-13-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808219; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=C4UqefiFJ8DW+Q5acyd85Guhawp1ud0WhCOFH/tJppw=;
 b=R5rPELqIFBPByNagmnI5hNjH5YRLJ4KxHPZnS7beWNrZKLRfPgyHvtqDRg5Ta2UMn9+J5n
 tNJhfq0mq/FO4pqjQGU/cdTdean/N4jYUkH6WG4+3dzUmdiqq8L9Kw2EJX3PamJVFzKJOW
 TE6p76Une6piRdfHGe6eA3GUNg9b+QcsjqPI4FUpeW3sqvxPJtCtL+i+nbzQhZm+pYCaRj
 oFV+TS42Vlk5zhuR0AzfVHahhPeIWtqr/TQzjpEjC6KcP08PXXOwK7Swd6yF0Sbb8IDTiU
 3nB3IIAY3lRwprQFKwiDWD5VjeBeg3FlUnimZOs8CSuj8rCZp6hVGqHB3ndePQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=R5rPELqI
Subject: Re: [Buildroot] [PATCH v2 13/23] package/python-libconf: update
 tarball URL
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Updated package as computed by scanpypi.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/python-libconf/python-libconf.hash | 5 +++--
>  package/python-libconf/python-libconf.mk   | 3 ++-
>  2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/package/python-libconf/python-libconf.hash b/package/python-libconf/python-libconf.hash
> index d05efd37fd..40dfeadac6 100644
> --- a/package/python-libconf/python-libconf.hash
> +++ b/package/python-libconf/python-libconf.hash
> @@ -1,4 +1,5 @@
> -# Locally calculated
> -sha256  66897870fcafce05624eafcc99e2dc8e150124e91019d9c29cc4f3bef64311dd  python-libconf-2.0.1.tar.gz
> +# md5, sha256 from https://pypi.org/pypi/libconf/json
> +md5  e212611cbf6a696e05742a983b3a0c57  libconf-2.0.1.tar.gz
> +sha256  2f907258953ba60a95a82d5633726b47c81f2d5cf8d8801b092579016d757f4a  libconf-2.0.1.tar.gz
>  # Locally computed sha256 checksums
>  sha256  3c2afc8c9f7a12032f225e6fa870e85af14d1b71236afe28d94a4b67e5e8c873  LICENSE
> diff --git a/package/python-libconf/python-libconf.mk b/package/python-libconf/python-libconf.mk
> index 65bdee8619..5bea1b2cc6 100644
> --- a/package/python-libconf/python-libconf.mk
> +++ b/package/python-libconf/python-libconf.mk
> @@ -5,7 +5,8 @@
>  ################################################################################
>  
>  PYTHON_LIBCONF_VERSION = 2.0.1
> -PYTHON_LIBCONF_SITE = $(call github,ChrisAichinger,python-libconf,$(PYTHON_LIBCONF_VERSION))
> +PYTHON_LIBCONF_SOURCE = libconf-$(PYTHON_LIBCONF_VERSION).tar.gz
> +PYTHON_LIBCONF_SITE = https://files.pythonhosted.org/packages/c8/41/592c24b42ec6e349629f2b6310ff31255b213bc696c0e4ad2ee1d2bbb68e
>  PYTHON_LIBCONF_SETUP_TYPE = setuptools
>  PYTHON_LIBCONF_LICENSE = MIT
>  PYTHON_LIBCONF_LICENSE_FILES = LICENSE
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

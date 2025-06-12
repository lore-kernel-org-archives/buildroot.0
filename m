Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B795C61CE8
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 20:12:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54FB440572;
	Thu, 12 Jun 2025 20:12:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6JdFtQwSzQvL; Thu, 12 Jun 2025 20:12:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 852DD40799
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 852DD40799;
	Thu, 12 Jun 2025 20:12:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 404071BD
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:12:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 26E0B40906
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:12:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Y9Tbs0jTuK3 for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 20:12:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 441A740456
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 441A740456
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 441A740456
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:12:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8B9891C10C3; Thu, 12 Jun 2025 22:12:04 +0200 (CEST)
Message-ID: <5bca2a12-e1ac-44d7-86ce-b4cd085e8ad6@rnout.be>
Date: Thu, 12 Jun 2025 22:12:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Petr Vorel <petr.vorel@gmail.com>, buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
References: <20250608201006.1377973-1-petr.vorel@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250608201006.1377973-1-petr.vorel@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1749759124; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=czBNP7P8FboJ9/FXU6ImULhb0W+JHd9E/f4/2jbr5m8=;
 b=HjAf8mMGoqcIADSjGtFBkgAvLqqxvOWKcp09jxWp7XAo/weE2Y5YBndjS2KEb0j8LIFJyL
 eu1XI6fCToeJ0eHI9ex6Z2hmAquR2fRsySdPrXB72SYMx5H/zjTrbgI5YeyNt+/+Ytfawe
 GZ7oKXPaIkrph5bJatz+u/m2FsAeZvffqCKSfong3s55UQcBvXTIl0K5w1CrSlRqyDO4L2
 3zctxQ/q9hI0LZoTmzmWLihnWWmgF7zNsYt9/AKRrKcDgo1kRTBAatvDeNg6r1JHbmG6X7
 y4L0fqGeA5XZ4GiQnjMCM0vqgG+rZimKiBSk5oOXwozw9rMHZtcNqYdZaeOH/A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=HjAf8mMG
Subject: Re: [Buildroot] [PATCH 1/1] package/iputils: bump version 20250605
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



On 08/06/2025 22:10, Petr Vorel wrote:
> Bugfix release:
> https://github.com/iputils/iputils/releases/tag/20250605
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/iputils/iputils.hash | 4 ++--
>   package/iputils/iputils.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/iputils/iputils.hash b/package/iputils/iputils.hash
> index daa5f81a85..2f83d397ce 100644
> --- a/package/iputils/iputils.hash
> +++ b/package/iputils/iputils.hash
> @@ -1,5 +1,5 @@
> -# https://github.com/iputils/iputils/releases/download/20250602/sha256sums.asc
> -sha256  178f316c3f102f7c7445dee8bb851838f11214a68b3d5d4788972d8b35dcbbe5  iputils-20250602.tar.gz
> +# https://github.com/iputils/iputils/releases/download/20250605/sha256sums.asc
> +sha256  475c643e5f55b302286267b97d3ce0f47ca3489ced8aa0401b1eeb1e68228d6b  iputils-20250605.tar.gz
>   # Locally computed
>   sha256  2c9f29d982c48665c30b3adaf400c048988fd256eb91c691e351eb3b6a8b2036  LICENSE
>   sha256  9acc4bc871a4742550158e3696dcb381953172ef808d04ca248184f9f6322712  Documentation/LICENSE.BSD3
> diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
> index 391f0e1938..842fdb8478 100644
> --- a/package/iputils/iputils.mk
> +++ b/package/iputils/iputils.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -IPUTILS_VERSION = 20250602
> +IPUTILS_VERSION = 20250605
>   IPUTILS_SITE = https://github.com/iputils/iputils/releases/download/$(IPUTILS_VERSION)
>   IPUTILS_LICENSE = GPL-2.0+, BSD-3-Clause
>   IPUTILS_LICENSE_FILES = LICENSE Documentation/LICENSE.BSD3 Documentation/LICENSE.GPL2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

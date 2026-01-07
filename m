Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4FEBD0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:55:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CBC8410EE;
	Wed,  7 Jan 2026 17:55:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lPlvU47qhXTt; Wed,  7 Jan 2026 17:55:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2ED6C410D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808557;
	bh=2VhhW+Mgy7i1xNhAc2qaLYucCbA5OVPN+IUg3LZ+PJE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UZm33YJSkzO7fDJiTgDiyKCmjYHqq4Ik95ly1XPyUxHFjR//86GRT0pRzYNdrC5dT
	 x+fc0B2VrmkF7hGZJCJk7A40vGXQ+Dy8YwZ9JGIXBMT+4LpqCLsDgGH4M7R6NrTr7O
	 TRD9rjMQTlRuBPKrS3fq8IWYWEPyv39nEAgz9aWLTISAAgcYupJFSdQ6icBJxeD8/k
	 52Iq0i004C39V364rr48DnO/gh1q+ujINh6fKAJj3NC/oU6FFwRdbYFrn4Kvp1usrG
	 x2JTzteTRUrVmForgQiLV5RgoaWl6HEy8x00ipjpJDxs0UobPwVN28/XB/BIM6LH0p
	 98mnvd+s1OOTg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2ED6C410D2;
	Wed,  7 Jan 2026 17:55:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C8789ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:55:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D1BB410C2
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:55:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F49uYdUqRMR0 for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:55:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DD08B4108B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD08B4108B
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DD08B4108B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:55:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D5DB1B97A70C; Wed,  7 Jan 2026 18:55:52 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:55:51 +0100
Message-ID: <20260107175551.230525-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251219182921.2148533-1-bernd@kuhls.net>
References: <20251219182921.2148533-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808552; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=n+Yj+mQZ8zDuIqyrWo8zieL/99NQkccZj5sXJz7insI=;
 b=WKun4OG92H4RlbXrdzViZRIKWK9rXRM1qs6hKoDRATZS2uONXirgKQsaMREvwoFBpGhp9u
 E1DsGOi5/nts1FKrsOtZBqHF7+lmQMnkvxtdARvhWoc+w3mSSscCeip3o1f+3sIgJHOflb
 KU/IvItNuBwLNOYKRzvDrKXGqFnEVkoiTZ7sxHgrXQxnxNo27M01jhtSQHysvpYbeUAHjX
 4lXbbBzE5P3m4HOfzvrx90cetwkr1VTeAd3zfNqigy18TI5x+XLjz2ED+uzOsh7VS9Px9N
 F4JMQ1cuK5kERMx78GTn4syBil62vaERkvrOw5H+3kS33jSUeSgDdXEUyFWsGg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=WKun4OG9
Subject: Re: [Buildroot] [PATCH 1/1] package/php: security bump version to
 8.4.16
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
> https://www.php.net/ChangeLog-8.php#8.4.16
> https://news-web.php.net/php.announce/478
> 
> Fixes CVE-2025-14177, CVE-2025-14178, CVE-2025-14180 & CVE-2025-67899.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.11.x. Thanks

> ---
>  package/php/php.hash | 2 +-
>  package/php/php.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/php/php.hash b/package/php/php.hash
> index 0532adeed6..4a9d2e4bb4 100644
> --- a/package/php/php.hash
> +++ b/package/php/php.hash
> @@ -1,5 +1,5 @@
>  # From https://www.php.net/downloads.php?source=Y
> -sha256  a060684f614b8344f9b34c334b6ba8db1177555997edb5b1aceab0a4b807da7e  php-8.4.15.tar.xz
> +sha256  f66f8f48db34e9e29f7bfd6901178e9cf4a1b163e6e497716dfcb8f88bcfae30  php-8.4.16.tar.xz
>  
>  # License file
>  sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
> diff --git a/package/php/php.mk b/package/php/php.mk
> index cd48cd1bd9..7524187649 100644
> --- a/package/php/php.mk
> +++ b/package/php/php.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -PHP_VERSION = 8.4.15
> +PHP_VERSION = 8.4.16
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

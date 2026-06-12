Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 175A2CD8CA8
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:37:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2BF0403B3;
	Fri, 12 Jun 2026 11:37:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2yumbwVXu0x7; Fri, 12 Jun 2026 11:37:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA1AF411F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781264239;
	bh=7c4uz/FNIL9FNfDjJl8U+hSwB7OiZDrBnmSa7DwbuGs=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Y4YAS5/lry0Iw4vdrjm8T6g5kZzHb82luAQrRtWx6wJOhmiMM6tX1+6noy+1vrTxw
	 mu49Q22d8FgaGzLSmrJsAJAv7hZ7/9gSxORXZMRs/hjio5C6ZHN7UdBfbKiwh8cwxG
	 i1uBAkrJ+yG/SpPRYhu5a93A3JKplwkVkTtxJ3/A0hJd6snOVDuGUPRWDNuNhBVmld
	 PKlHdH+Nq87Y2+2WlaGQRCSFAxs4Ym1sN34Z6MsCFcVIcIXd64qhzkCzNJ4HSZFQ+i
	 x6PxW0FyH8Bp48zHeYohnpQueLnmn89XQSLKPYwmOp96Fgwa96YgxCKRaSr0NZBEzO
	 LbmG1suOdBb+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA1AF411F6;
	Fri, 12 Jun 2026 11:37:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 11095237
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:37:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 02C9D411D2
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:37:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EPYWtwGbdc8Z for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:37:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9BF3C411BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BF3C411BC
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9BF3C411BC
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:37:12 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-490be03d47bso8604695e9.0
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 04:37:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781264230; x=1781869030;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7xZYk6CZrbPlfiu+eIgZ4GP198MNSwUsyjlAWg1venc=;
 b=J+5hBp9FomkIuK/xg/ivJjDYV2c/nQvdHbBbAnOFQxxc7L2YI7svqUtK5FhkR0GEab
 VxJdJVf276IJYYk8UDwlwcr7179wBNeTbrDwpERHNl3XZkzLvI2CVNEZ+PKjhIR/vY7G
 rK0R9qHBmahGpVuWhCWjilJ5m+gSslHcDpZQra7F66gBFlSL5kgGbjKOX56t75kyurFq
 2Pkqg2rXKBlYUk7qejtqFjrXSEo+PAVgfNQrf2+QFbiZnJ9r0n7ytLI6lhF/a71vlV9b
 KGQFs8mFD6gkY1iKNsm65jySpCF/GbfwMqrFqUVM6h0/ANxptnw0iZSqxdV1g7z4AIBG
 BJjQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ95jnOgSO6rer7RNg+uIt/qdAvUh4VvlEvr5/m59oQ+IIRiqBVnjBVuDpw1qoAX4MlAxFzUBTpjJpQ=@buildroot.org
X-Gm-Message-State: AOJu0Yx7urRFSC1QEf/1Ks7MEY0wPX8xrXHUlDEg+zZx2ZRfCY40lxw8
 y8mmBeXrIbvFz3VAt6kyI1QEr4FqE9jP6ZYrl/JlEJt5XWDsBRCX3pM0JZzXwob/xis=
X-Gm-Gg: Acq92OHD9vKTE2tZI0nXpNC87n1ypahmxgSdld1VMEi6/J3QlnxhPRg6Q/H2JjVoCP3
 Lu4MFBWN+togo0YRWDi+zucEBXMORYMYplFxsYrW+oNI/9EyDY7YXiM8Pm0MB5H2Q0BmyLO4o6I
 v/hZ7xc0QDeDG65j5OZe+zkROfrAneMToCDVHds9S/wMCE5kxowkCydnyLBQj1S/toeYCXInsvl
 VzW2/zeRRQpFR3IoX4ygAlsIT8oCRT1qkRUoWYHRM/woDn0W2aODtT8dplZx5NwEzn8b7mbthCI
 6/jypgDPbXmKNVVQ5TDh5rbXbqFL3gJA12ucBI0Te10cRVb48y2TAy8t42lUcafHDO3objQiw7Y
 anHo8qCubcF5bMtlh4NZw3I92t4LKItHuR0xUc0wieBgVGNlSGP6n+7v29D0GIx2+mfFQ//xA/E
 2oVSYriuWvz4BrKvY=
X-Received: by 2002:a05:600c:314a:b0:490:d354:d15b with SMTP id
 5b1f17b1804b1-490ec50876amr27636645e9.29.1781264230577; 
 Fri, 12 Jun 2026 04:37:10 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490ea7c8f49sm67688985e9.6.2026.06.12.04.37.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 04:37:10 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 12 Jun 2026 13:37:09 +0200
Message-ID: <20260612113709.251463-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260604173511.2134198-1-bernd@kuhls.net>
References: <20260604173511.2134198-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1781264230; x=1781869030; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7xZYk6CZrbPlfiu+eIgZ4GP198MNSwUsyjlAWg1venc=;
 b=QFXLZenvzByTQ0t0aHQzgPASJ0Nc9JxUP+Vu4KkQuaH936exrK6srbA60KGsu3g8yN
 ZVMbZ2KG2VIfPsxArWom5CuYAW8VTwYnYiDbNtvAqyfkpEAlPjDaKdK2pwNrNag21EqY
 MFeFCUdlMATUtn6hycTPCy/yyGOlSz6dVn8AofvcKcoW1AF6zKE3wHLTCOqEqs0tNNro
 OZ2yCopiXLDd196ninfq/4gC/JTocxSGPPDVbwCjOgGNClrDMXF3UcH94aMGqndnxdET
 jYyrm4nMQ7ECPBROWCNHldhvrTLAmsWR7woBHoWPZlOKz7BUhycB3MCXm77yPSsz0PGO
 3thA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=QFXLZenv
Subject: Re: [Buildroot] [PATCH 1/1] package/php: security bump version to
 8.5.7
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
> https://www.php.net/ChangeLog-8.php#8.5.7
> https://news-web.php.net/php.announce/493
> https://github.com/php/php-src/blob/php-8.5.7/NEWS
> 
> Fixes CVE-2026-44927 & CVE-2026-44928.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.02.x. Thanks

> ---
> Gitlab pipeline passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/aa433b2c6ff34f634db24183cf2aac2bd9616d01
> 
>  package/php/php.hash | 2 +-
>  package/php/php.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/php/php.hash b/package/php/php.hash
> index c85df44d73..2a89d03ecd 100644
> --- a/package/php/php.hash
> +++ b/package/php/php.hash
> @@ -1,5 +1,5 @@
>  # From https://www.php.net/downloads.php?source=Y
> -sha256  826c600b7c6f956bd335558ca3bdbcab23b22126c1cc8d9348be2280a2204bb7  php-8.5.6.tar.xz
> +sha256  01ba2ed1c2658dacf91bebc8be6a4885f69b811c7993831fc48e26107ab29985  php-8.5.7.tar.xz
>  
>  # License file
>  sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
> diff --git a/package/php/php.mk b/package/php/php.mk
> index 0eae93fac2..0bfb12a8eb 100644
> --- a/package/php/php.mk
> +++ b/package/php/php.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -PHP_VERSION = 8.5.6
> +PHP_VERSION = 8.5.7
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

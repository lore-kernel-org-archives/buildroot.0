Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB28C27C4F
	for <buildroot@archiver.kernel.org>; Sun, 23 Jun 2024 20:47:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 145F481401;
	Sun, 23 Jun 2024 20:47:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Be74OdUGwIew; Sun, 23 Jun 2024 20:47:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF1AD8143E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF1AD8143E;
	Sun, 23 Jun 2024 20:47:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 818B81BF2EB
 for <buildroot@lists.busybox.net>; Sun, 23 Jun 2024 20:47:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F3BF8141F
 for <buildroot@lists.busybox.net>; Sun, 23 Jun 2024 20:47:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sTIjmfKeunJU for <buildroot@lists.busybox.net>;
 Sun, 23 Jun 2024 20:47:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 562BB81401
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 562BB81401
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 562BB81401
 for <buildroot@buildroot.org>; Sun, 23 Jun 2024 20:47:14 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id E25F313F899;
 Sun, 23 Jun 2024 22:47:08 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 23 Jun 2024 22:47:08 +0200
Date: Sun, 23 Jun 2024 22:47:08 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <ZniJzMcFYug4s_rS@landeda>
References: <20240621161049.4085310-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240621161049.4085310-1-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1719175632;
 bh=82SxZU/oFeDBK/OCUG7zfN4DsSF544V6ntRuznJPwEI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KZ/gEBuii496nNE8Pzus1SpfuU/J30c9Jhz6p1DsIVV8k+d2w6SrtIqOAnEp3BECM
 w9jI7CVtdZzF5soRsRcWK7Lj8eQstyUAcGBnB8/xbSqxoIwe/Di8Ignlpk32p0fY8a
 o0ByDokE+Cp37DJ5SPOD3TEEXGFqkuwgPx9XqfJw/k0/SDybIt4UXFB1sPBUfK2Atu
 mf8YJAeem8o12uR7wmIk1G3sLK2v1H5p4jXLAr6iwDWUXnaogCkJysd5iDRWYHCPUR
 jCnYCY7Ug8vxcF0YToTS0La+tLNIqMEnAzolo81+exfl6rQ1KV8SIgfi4QZxvyhLdF
 kP/DSx3nnx1Wg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KZ/gEBui
Subject: Re: [Buildroot] [PATCH 1/6] package/libopenssl: use $(RM) instead
 of rm
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: linux-amarula@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dario, All,

On 2024-06-21 18:10 +0200, Dario Binacchi spake thusly:
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

I've applied patches 1-5 to master, thanks!

Regards,
Yann E. MORIN.

> ---
>  package/libopenssl/libopenssl.mk | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
> index d209bb8e96ba..88debf114a3b 100644
> --- a/package/libopenssl/libopenssl.mk
> +++ b/package/libopenssl/libopenssl.mk
> @@ -135,8 +135,8 @@ endef
>  
>  define LIBOPENSSL_INSTALL_TARGET_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
> -	rm -rf $(TARGET_DIR)/usr/lib/ssl
> -	rm -f $(TARGET_DIR)/usr/bin/c_rehash
> +	$(RM) -rf $(TARGET_DIR)/usr/lib/ssl
> +	$(RM) -f $(TARGET_DIR)/usr/bin/c_rehash
>  endef
>  
>  # libdl has no business in a static build
> @@ -166,7 +166,7 @@ endif
>  
>  ifneq ($(BR2_PACKAGE_LIBOPENSSL_ENGINES),y)
>  define LIBOPENSSL_REMOVE_LIBOPENSSL_ENGINES
> -	rm -rf $(TARGET_DIR)/usr/lib/engines-1.1
> +	$(RM) -rf $(TARGET_DIR)/usr/lib/engines-1.1
>  endef
>  LIBOPENSSL_POST_INSTALL_TARGET_HOOKS += LIBOPENSSL_REMOVE_LIBOPENSSL_ENGINES
>  endif
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

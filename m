Return-Path: <SRS0=/l1z=NI=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7040C4338F
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 21:02:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AA0660EE0
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 21:02:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8AA0660EE0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56A574024A;
	Tue, 17 Aug 2021 21:02:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pyG5AlHfT-qD; Tue, 17 Aug 2021 21:02:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E04C40304;
	Tue, 17 Aug 2021 21:02:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C6B251BF95A
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 21:02:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF54D80DFD
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 21:02:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pYfV37kSvyhp for <buildroot@lists.busybox.net>;
 Tue, 17 Aug 2021 21:02:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0D26180DD7
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 21:02:22 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:8b4:21c0:9a77:1566])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 53FB3B0053F;
 Tue, 17 Aug 2021 23:02:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1629234139;
 bh=r5W+VIiCJbLoV3pG/cQN7rHnRrwtuGJIt2ZZhABjFQ8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RYysQ9PkBv7X5VYafBwIZNK7dS4WfPwUI5p4osFFgFVOYbvE4yZcpnWuMZRqX+rtS
 Id+Hz1EnlRkXMyz04ZbvIW1EkHwAVFTH+fN7XqUqDpuspxVzQmiuhst7OIzOl/4un6
 w5usdtO873RkGOMQ8crRlkGJemSM9q6b0YlJd0u0TqYIeibdOdaC7Rpk3BF3pXPhBA
 4X4VvQjDwVLDrJ8bV7nhafRChBt0YOG3NlUV72tvRu1G/PsT+T/vzroYgNpdnZdL/2
 3jhfgs1eu26ucuufar6jp1/uZEDCrMKJv8y1Da5+X1lDsjH/TWRIU87l/0wL5I0xdw
 MW6ENyKl8Pg6w==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 17 Aug 2021 23:02:13 +0200
Date: Tue, 17 Aug 2021 23:02:13 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210817210213.GX27036@scaer>
References: <20210816065458.1726927-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210816065458.1726927-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/libkrb5: disable with libressl
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: =?utf-8?B?QW5kcsOp?= Zwing <nerv@dawncrow.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fabrice, All,

On 2021-08-16 08:54 +0200, Fabrice Fontaine spake thusly:
> libkrb5 does not build with libressl since commit
> b7a5b9d06d484700fc4fcbd354f2c15e0422688c and upstream is not interested
> in fixing this issue as a PR is opened for more than 4 years
> (https://github.com/krb5/krb5/pull/607):
> 
> pkinit_crypto_openssl.c: In function 'cms_signeddata_verify':
> pkinit_crypto_openssl.c:1700:22: error: implicit declaration of function 'OBJ_get0_data'; did you mean 'BIO_get_data'? [-Werror=implicit-function-declaration]
>  1700 |         print_buffer(OBJ_get0_data(etype), OBJ_length(etype));
>       |                      ^~~~~~~~~~~~~
>       |                      BIO_get_data
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/e623f4e1d6b6004e98815b8b7da3938238890bd8
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libkrb5/libkrb5.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libkrb5/libkrb5.mk b/package/libkrb5/libkrb5.mk
> index 89f219d913..5b30fbba2c 100644
> --- a/package/libkrb5/libkrb5.mk
> +++ b/package/libkrb5/libkrb5.mk
> @@ -41,7 +41,7 @@ else
>  LIBKRB5_CONF_OPTS += --without-ldap
>  endif
>  
> -ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)

Don't forget that an openssl provider can be provided by a br2-external
tree. If we force the condition to BR2_PACKAGE_LIBOPENSSL, then it
prevents any such provider to be used.

So, I think the best solution is to exclude libressl, rather than limit
to libopenssl. I've tried to come up with a simple conditional block:

    # An openssl provider is needed, but libressl is no match.
    # A provider from a br2-external is supposed to match.
    ifeq ($(BR2_PACKAGE_OPENSSL),y)
    ifeq ($(BR2_PACKAGE_LIBRESSL),)
    LIBKRB5_SSL = y
    endif
    endif
    ifeq ($(LIBKRB5_SSL),y)
    LIBKRB5_DEPENDENCIES += openssl
    LIBKRB5_CONF_OPTS += \
        --enable-pkinit \
        ...
    endif

Regards,
Yann E. MORIN.

>  LIBKRB5_CONF_OPTS += \
>  	--enable-pkinit \
>  	--with-crypto-impl=openssl \
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F6E3CD4F21
	for <buildroot@archiver.kernel.org>; Wed,  4 Sep 2024 18:17:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 486078120E;
	Wed,  4 Sep 2024 18:17:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PIuRp7CfvPvl; Wed,  4 Sep 2024 18:17:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4020081225
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4020081225;
	Wed,  4 Sep 2024 18:17:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6DFE01BF47F
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 18:17:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5A94781225
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 18:17:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oGy0XmgkvTiF for <buildroot@lists.busybox.net>;
 Wed,  4 Sep 2024 18:17:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1421B8120E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1421B8120E
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1421B8120E
 for <buildroot@buildroot.org>; Wed,  4 Sep 2024 18:17:28 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id A032C13F88F;
 Wed,  4 Sep 2024 20:17:19 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 04 Sep 2024 20:17:19 +0200
Date: Wed, 4 Sep 2024 20:17:19 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <ZtikL2bVIPqtvgJA@landeda>
References: <20240904174021.2670289-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240904174021.2670289-1-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1725473846;
 bh=d5462pORg9PbPmlYKScMh5X8vvW7NrNoHuikZuA7WN8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PrlZj04KJNxhhCjj4orTY7uUOpCXd6WxuOZ6rSDA+FLWjkIkN36KThKsjcsif0qCR
 x7+JvSi3sypAcx5FOY8cHdWbDgPlyV77UNQHSDLtgMY3ThSAEvXx6vZo1tULSKuO29
 bUKBc3zSOuuLrAtuq5hE3aaWk9mRdsWlGVVy2z8fE+j6kZOQjk77Xgc8CeeSBx6+Cj
 +GLDSXDVoUQfQZ/vV0V4eNaOogf3aAEC8Qid5scB5GuFwZxdwaw5VEDzvZSj3iYqWN
 l6kQOD0jJSnVEKCEdyUsjJsp9zWQiQfMteUzDY18mpGHNoutVRDr1mEEAeFuINno2N
 oTStRkzP+hBSg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PrlZj04K
Subject: Re: [Buildroot] [PATCH v2 1/1] package/ipmitool: download
 enterprise-numbers versioned
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
Cc: Floris Bos <bos@je-eigen-domein.nl>, Heiko Thiery <heiko.thiery@gmail.com>,
 linux-amarula@amarulasolutions.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dario, All,

Thanks for your persistemce in fixing this issue! :-)

On 2024-09-04 19:40 +0200, Dario Binacchi spake thusly:
> The previous default URL used for the PEN registry was not stable and
> could change at any time, making it unacceptable to have to update its
> hash every time. Following the suggestions provided by Thomas Petazzoni,
> the file is now downloaded from a GitHub repository, which means it is
> versioned.
[--SNIP--]
> diff --git a/package/ipmitool/Config.in b/package/ipmitool/Config.in
> index 9516ff8596d3..783bd263756e 100644
> --- a/package/ipmitool/Config.in
> +++ b/package/ipmitool/Config.in
> @@ -11,7 +11,7 @@ if BR2_PACKAGE_IPMITOOL
>  
>  config BR2_PACKAGE_IPMITOOL_PEN_REG_URI
>  	string "IANA PEN registry URL or path"
> -	default "https://www.iana.org/assignments/enterprise-numbers.txt"
> +	default "https://github.com/larseggert/iana-assignments/raw/6eaf55c1c24941db2546da242029ceeaba3f9dfc/enterprise-numbers/enterprise-numbers"

That's unfortunately not enough, see below...

>  	help
>  	  Enter an URL or a file path to the PEN registry to use.
>  
> diff --git a/package/ipmitool/ipmitool.hash b/package/ipmitool/ipmitool.hash
> index c3b298e3ba5d..f2e91ef9000d 100644
> --- a/package/ipmitool/ipmitool.hash
> +++ b/package/ipmitool/ipmitool.hash
> @@ -1,3 +1,4 @@
>  # Locally computed:
>  sha256  48b010e7bcdf93e4e4b6e43c53c7f60aa6873d574cbd45a8d86fa7aaeebaff9c  ipmitool-1_8_19.tar.gz
>  sha256  b7e2382a8be43b5f6cb092f2d2bda163bf1a1938be9300f821a845cbcd535f56  COPYING
> +sha256  45eca3cadadd8a82736d83b130106da22cd49a34d287c9c4c7f10dffb4579f4f  enterprise-numbers

Indeed, the filename itself is still unversioned, so when we update the
version in the URL, the local file would not change name, and thus
that'd cause the same issues I explained earlier.

I tried a few hacks, notably the infamous GET parameters, like:

https://github.com/larseggert/iana-assignments/raw/6eaf[...]enterprise-numbers/enterprise-numbers&path=foo/enterprise-numbers-6eaf[...].txt

and various variants of that, but to not avail... So, unless you can
come up with a way to hack a verioned filename in the URL, we'll have to
introduce a dedicated package... :-/

Regards,
Yann E. MORIN.

> -- 
> 2.43.0
> 

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

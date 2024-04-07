Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4ED1CD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 17:44:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8561B81B14;
	Sun,  7 Apr 2024 17:44:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nMIfjRmPpmu1; Sun,  7 Apr 2024 17:44:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7380E81B7B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7380E81B7B;
	Sun,  7 Apr 2024 17:44:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C5C281BF2BE
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 17:44:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B084481B25
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 17:44:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WI_Stg2YsUoI for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 17:44:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A7A3981B14
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7A3981B14
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A7A3981B14
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 17:44:36 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id BBD4113F8AD;
 Sun,  7 Apr 2024 19:44:30 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 Apr 2024 19:44:30 +0200
Date: Sun, 7 Apr 2024 19:44:30 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Perale <thomas.perale@essensium.com>
Message-ID: <ZhLbfkgliWC2sR19@landeda>
References: <20240404124329.768546-1-thomas.perale@mind.be>
 <20240404124329.768546-3-thomas.perale@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240404124329.768546-3-thomas.perale@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1712511875;
 bh=52t5A5uQIgEEXuxiuSx7HYOkRMihklpM1/9QxOkQU00=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iGeyYDUmVg0FFtka/hB8SWD66e21jv6U2Reg0GVjUJSN1D8hC9U+dOitC0t8eJsfy
 ArQbTnSotWkY8S7B3rdmj12AR7dEvarz757C09YxM4e+3w4oypr3GLP5T0azaz1mCv
 mFOGBBHfgYS1eepm4km3UZbf3DRiGW6ziOglsmEaKZ5ND6nk90G7UrBs2EgntJ8bvL
 gGhmBbtgZsnrLxHDq0HjurEAxSDUry0A+AUZ9OAy3fZi4KME5CwAXVhAuwf7yM+t51
 VnRWWfDLbBUJBat6Js899ABgXEJsIQ24JpUYDMHDeBOGddZuHkgri93bFfmt+Zaukv
 t0GrUmzQZV37Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=iGeyYDUm
Subject: Re: [Buildroot] [RFC PATCH 2/5] package/pkg-utils.mk:
 urlencode/urldecode macros
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
Cc: Thomas Perale <thomas.perale@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2024-04-04 14:43 +0200, Thomas Perale via buildroot spake thusly:
> This patch introduces two new macros:
> 
>   - urlencode
>   - urldecode
> 
> URL encoding consists of converting ASCII characters into
> a percent symbol followed by a two digit hexadecimal code.
> And the other way around for URL decoding.
> 
> The macros encode/decode a string passed as an argument by
> escaping the following characters:
> 
>   - '%' is replaced by %25
>   - 'space' is replaced by %20
> 
> The characters covered by this patch is non exhaustive.

Not sure what you meant with this sentence... Can you elaborate?
Or did you mean that we can add more chars in the future?

Regards,
Yann E. MORIN.

> Because the Make language treats spaces as different entry of a list,
> the aim of those macros is to provide a well known encoding method
> to escape text containing spaces into a string that won't be
> treated as a list by the Make language.
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> ---
>  package/pkg-utils.mk | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> index 723bbe4e24..b8cfb85fca 100644
> --- a/package/pkg-utils.mk
> +++ b/package/pkg-utils.mk
> @@ -329,3 +329,15 @@ define NXP_EXTRACT_HELPER
>  	find $(@D)/$(basename $(notdir $(1))) -mindepth 1 -maxdepth 1 -exec mv {} $(@D) \;
>  	rmdir $(@D)/$(basename $(notdir $(1)))
>  endef
> +
> +# urlencode -- returns an url encoded string.
> +#   - encode % into %25
> +#   - encode spaces into %20
> +#
> +# $(1): text
> +urlencode = $(subst $(space),%20,$(subst %,%25,$(1)))
> +
> +# urldecode -- decode an url encoded string.
> +#
> +# $(1): text
> +urldecode = $(subst %25,%,$(subst %20,$(space),$(1)))
> --
> 2.44.0
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

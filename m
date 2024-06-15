Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F64C27C53
	for <buildroot@archiver.kernel.org>; Sat, 15 Jun 2024 14:41:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA48182223;
	Sat, 15 Jun 2024 14:41:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ixf5ZGZdJb-f; Sat, 15 Jun 2024 14:41:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99D4482225
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99D4482225;
	Sat, 15 Jun 2024 14:41:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8AE7C1BF302
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 14:41:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ACEBC405A1
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 14:41:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id isUQ7k0pUiTP for <buildroot@lists.busybox.net>;
 Sat, 15 Jun 2024 14:41:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 56E4E40598
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56E4E40598
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 56E4E40598
 for <buildroot@buildroot.org>; Sat, 15 Jun 2024 14:41:36 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 8428613F846;
 Sat, 15 Jun 2024 16:41:28 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 15 Jun 2024 16:41:28 +0200
Date: Sat, 15 Jun 2024 16:41:28 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <Zm2oGClDG0FqqZPf@landeda>
References: <20240514085801.3202503-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240514085801.3202503-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1718462494;
 bh=mVT2/Gd4+aKKBjoRa10WsAyXGjPw90BXDMYyid0MKMM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NlclvBziKfmYpRxMZSpq7JoHh5HrKTtITDhUqL9KaZOrR8pUdur6aQPnNX4WNjBuV
 tp2XpMSnmMOULOjo+uyaLZ/WDamrPTYicpKgwvZyZGg16p9TBzh0pvnIsPzj7ub1S5
 NqDKGVtlMNwrcR0qAd5YN7R3DiDIQAOUqQRvXI/ISk85IqKm5ZoE3c1z+35/7A5t60
 aUkGOPwbnOV6uuKMTbPO3ZuEaZMmk8tPZGXXfl3IPnB6PAcghH06rvEiTvlTAD2FuK
 YmvpoX/V2hfUmPODGHwVxf31e9oZm7u49yUXi9EyGhLcPK3MKVTlguPPbT5l0dKo3q
 IvTgIYgkpcTcg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NlclvBzi
Subject: Re: [Buildroot] [PATCH] docs,
 package/gcc: switch to Gitlab issue tracker
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2024-05-14 10:58 +0200, Thomas Petazzoni via buildroot spake thusly:
> Our Bugzilla is so slow and unstable that it has become
> unusable. Let's switch to using the Gitlab issue tracker instead.
> 
> There are still lots of references to the Bugzilla bug tracker in our
> News page at https://buildroot.org/news.html, but these are for older
> news.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[--SNIP--]
> diff --git a/docs/website/support.html b/docs/website/support.html
> index 28873c6d76..75551b770e 100644
> --- a/docs/website/support.html
> +++ b/docs/website/support.html
> @@ -80,8 +80,9 @@
>  		  <img class="img-responsive" src="images/bug-buddy.png" style="max-width:50px; margin-bottom:10px;">
>  		</div>
>  		<div class="col-sm-11">
> -		  <p>If you think you found a bug in Buildroot, you can use the
> -		    <a href="https://bugs.buildroot.org/">Bug Tracker</a> to post your bugs and/or
> +		  <p>If you think you found a bug in Buildroot, you
> +		  can use the

Spurious reflow; I dropped it.

Applied to master, thanks.

As planned with your non-plan, I'm planning on planing out old bug
tracker, and closing still-opened issues.

Still, it would be nice if we could get an issue template for new issues
that will be opened in our shinny new bug tracker.

Regards,
Yann E. MORIN.

> +		    <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">Bug Tracker</a> to post your bugs and/or
>  		    participate to find solutions to existing problems.</p>
>  
>  		  <p>Note: patches are only accepted through the mailing list.</p>
> diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
> index 672f9472a9..e4780353cb 100644
> --- a/package/gcc/gcc.mk
> +++ b/package/gcc/gcc.mk
> @@ -83,7 +83,7 @@ HOST_GCC_COMMON_CONF_OPTS = \
>  	--with-mpc=$(HOST_DIR) \
>  	--with-mpfr=$(HOST_DIR) \
>  	--with-pkgversion="Buildroot $(BR2_VERSION_FULL)" \
> -	--with-bugurl="http://bugs.buildroot.net/" \
> +	--with-bugurl="https://gitlab.com/buildroot.org/buildroot/-/issues" \
>  	--without-zstd
>  
>  ifeq ($(BR2_REPRODUCIBLE),y)
> -- 
> 2.45.0
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

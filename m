Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC05ECAAA1
	for <buildroot@archiver.kernel.org>; Fri,  9 Sep 2022 19:47:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6410041D7E;
	Fri,  9 Sep 2022 19:47:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6410041D7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gsFunpzYjykg; Fri,  9 Sep 2022 19:47:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F083341D54;
	Fri,  9 Sep 2022 19:47:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F083341D54
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2F4F31BF384
 for <buildroot@lists.busybox.net>; Fri,  9 Sep 2022 19:47:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 176C841716
 for <buildroot@lists.busybox.net>; Fri,  9 Sep 2022 19:47:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 176C841716
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LUJUsbZYOjUW for <buildroot@lists.busybox.net>;
 Fri,  9 Sep 2022 19:47:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AFFD1416FF
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AFFD1416FF
 for <buildroot@buildroot.org>; Fri,  9 Sep 2022 19:47:25 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:d2dc:af53:61e0:beab])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 7204719F55C;
 Fri,  9 Sep 2022 21:47:15 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 09 Sep 2022 21:47:15 +0200
Date: Fri, 9 Sep 2022 21:47:15 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20220909194715.GB264214@scaer>
References: <20220909154926.3965406-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220909154926.3965406-1-peter@korsgaard.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1662752838;
 bh=owT+P8v1mOKqLjkOCBlg6plYXVVOTci+sldOc27iiFo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f+/ENLcYX0mhoekjISa621SjRpUlzJH3i+BmseQtzFyqSHRjHs+knpSR3unwtNLIB
 AQgJBY8h/Wq0ee1QoHnwX8bOfdd7yYl+5Lzuufg2LdTq5k6zcffbL69cgrFb4TZdHq
 /QcQjhMyS8Cz5uNMBkVIOo4jIjD6rR0kCUR1enisIoB16xDRfWeVgeXC3gwVNl0zC+
 YVUh7hIWzGQ1vivrUULFm4MOX9Equt66p/5l4eY+VWqx4RlQ09fe1gwL7h1bkV9SQN
 tbY22XUNJS5qXqfBXHdpa+EsM3u8PUP3blTippXHCG8ZjeSDLRf2RK5I2GPXprJS3p
 kZarZQVrUV5WA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=f+/ENLcY
Subject: Re: [Buildroot] [PATCH] package/pkg-autotools.mk: only pass
 --runstatedir=/run if supported
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2022-09-09 17:49 +0200, Peter Korsgaard spake thusly:
> Fixes:
> (thttpd) http://autobuild.buildroot.net/results/f74/f74cae1d981b284a69d7a4e138faf97e45e44865/
> (wipe) http://autobuild.buildroot.net/results/4dc/4dc77752d5851d8a71d234c0b284ca696e633754/
> 
> And (possibly, unable to reproduce locally):
> http://autobuild.buildroot.net/results/658/65882e1f266e818fecef2892c9493d3b8e1e912e/
> 
> --runstatedir was added in autoconf 2.69b:
> http://git.savannah.gnu.org/gitweb/?p=autoconf.git;a=commit;h=a197431414088a417b407b9b20583b2e8f7363bd
> 
> Some earlier autoconf versions (E.G. 2.13 as used by thttpd/wipe) get
> confused if --runstatedir is passed, so only do so if it is supported (E.G.
> present in the script).
> 
> With this change we can go back to passing --runstatedir instead of
> runstatedir, so this effectively reverts commit c28b27032b926c2e
> (package/pkg-autotools.mk: fix runtime path).
> 
> Suggested-by: Norbert Lange <nolange79@gmail.com>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/pkg-autotools.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
> index b6224b349d..968662ddc6 100644
> --- a/package/pkg-autotools.mk
> +++ b/package/pkg-autotools.mk
> @@ -187,7 +187,7 @@ define $(2)_CONFIGURE_CMDS
>  		--exec-prefix=/usr \
>  		--sysconfdir=/etc \
>  		--localstatedir=/var \
> -		runstatedir=/run \
> +		`grep -q -e '--runstatedir' configure && printf '%s' --runstatedir=/run` \

This is a bit ugly, but grepping the source code is not unheard of, if
at least to know what libtool patch we need to apply. Still, this is not
very nice... :-(

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  		--program-prefix="" \
>  		--disable-gtk-doc \
>  		--disable-gtk-doc-html \
> -- 
> 2.30.2
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

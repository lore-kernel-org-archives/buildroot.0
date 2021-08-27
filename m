Return-Path: <SRS0=sHoS=NS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 620ECC432BE
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 19:50:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E21560E0B
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 19:50:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2E21560E0B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 026A0427D3;
	Fri, 27 Aug 2021 19:50:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EmDCTacB7hvF; Fri, 27 Aug 2021 19:50:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37B22427D4;
	Fri, 27 Aug 2021 19:50:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 371B21BF5A0
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 19:50:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF82383563
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 19:50:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6yNwUXIl0A8w for <buildroot@lists.busybox.net>;
 Fri, 27 Aug 2021 19:50:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B21CC834F1
 for <buildroot@buildroot.org>; Fri, 27 Aug 2021 19:50:25 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:a574:2179:f8:908b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 33AADB004FF;
 Fri, 27 Aug 2021 21:50:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1630093823;
 bh=xM+Bi+oeRzSkwbennBbv2/+2H2/ttGnHI8Ea1ADg8oI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h2KIUi88i+ROv6GRPCnVORkAAfDVvEXSw+RH2bNBQhzc4zeoSym1JKTsAOA5YNOYJ
 oxjczcVJXQXe31qYRqakg2sQsVzKFKym5QEloq9GBKPlYS1jLOZakgC308sbbD9Kox
 IxSdNtMT3IHKmdZDugHNFCJ7BMv/p/eY4Ems1dGMdomHB8qzF9Hmtmaqtp8IVgj3SX
 WyY/6PvaeGq2wd3r0e2EvnHsfMad/Xl1jc1qRjkQjIHhpxkyPA+OdR3ixaz0BaFtjv
 9vUqm9vdAammqbIOVZKnqUU5PesccL8h7lQwHDJ5E22TFpefmW3eEUjPiGgFbqk6N7
 8YGoQFTP+rr5A==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 27 Aug 2021 21:50:14 +0200
Date: Fri, 27 Aug 2021 21:50:14 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210827195014.GB2661@scaer>
References: <20210827163355.2007793-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210827163355.2007793-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/nodejs: security bump to
 version 12.22.5
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
Cc: Daniel Price <daniel.price@gmail.com>, Martin Bark <martin@barkynet.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fabrice, All,

On 2021-08-27 18:33 +0200, Fabrice Fontaine spake thusly:
> Fix CVE-2021-22931, CVE-2021-22940 and CVE-2021-22939:
> https://nodejs.org/en/blog/vulnerability/aug-2021-security-releases
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/nodejs/nodejs.hash | 4 ++--
>  package/nodejs/nodejs.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
> index 7d11a8d104..1552e937b7 100644
> --- a/package/nodejs/nodejs.hash
> +++ b/package/nodejs/nodejs.hash
> @@ -1,5 +1,5 @@
> -# From https://nodejs.org/dist/v12.22.4/SHASUMS256.txt
> -sha256  44cd4eab131e5282fc923e9e720d983a0b44c12e4aa4f6c3598dc97ae1e4cd4c  node-v12.22.4.tar.xz
> +# From https://nodejs.org/dist/v12.22.5/SHASUMS256.txt
> +sha256  f927ff6c2ac5a7234596031b18ba03febbcadd2650d375f1a3fd02426687fd14  node-v12.22.5.tar.xz
>  
>  # Hash for license file
>  sha256  221417a7ca275112a5ac54639b36ee3c5184e74631ea1e1b01b701293b655190  LICENSE
> diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
> index 08d2f6d7c1..39099b53dc 100644
> --- a/package/nodejs/nodejs.mk
> +++ b/package/nodejs/nodejs.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -NODEJS_VERSION = 12.22.4
> +NODEJS_VERSION = 12.22.5
>  NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
>  NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
>  NODEJS_DEPENDENCIES = host-python host-nodejs c-ares \
> -- 
> 2.32.0
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

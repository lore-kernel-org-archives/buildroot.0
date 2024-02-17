Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF82C48BC4
	for <buildroot@archiver.kernel.org>; Sat, 17 Feb 2024 17:31:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F055409A7;
	Sat, 17 Feb 2024 17:31:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1hlZrk7Nq2GQ; Sat, 17 Feb 2024 17:31:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B4BF410CA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B4BF410CA;
	Sat, 17 Feb 2024 17:31:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C090F1BF5A8
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 17:31:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B96224012E
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 17:31:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zTtG5g7LYwsq for <buildroot@lists.busybox.net>;
 Sat, 17 Feb 2024 17:31:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 746E540103
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 746E540103
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 746E540103
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 17:31:25 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id ABE8913F861;
 Sat, 17 Feb 2024 18:31:18 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 17 Feb 2024 18:31:18 +0100
Date: Sat, 17 Feb 2024 18:31:18 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Christian Stewart <christian@aperture.us>
Message-ID: <ZdDtZo9HnTB5TrUZ@landeda>
References: <CA+h8R2qSV+Yd=HDfNKKFvERdWRTdsXxpsnZe9DHG26pEigphaQ@mail.gmail.com>
 <ZdCevcKap6z2nmqV@landeda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZdCevcKap6z2nmqV@landeda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1708191081;
 bh=40CuKd+dQj5NU6cR97sEIKos4Bg2YNfJ41K1R76fqWY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jQ+dmvq+GTEY7Zc14bImMYUQPIiHDUjBicp/XqNXHrZyUQcd4efjB3TjuGeKwH0J/
 T3A47MqHMwDBPFq8BUoqJfr8w+QU2vL6RqeDmrfPuX42+gj7qE6R9KP+eMH9L+RPOD
 b6HXsOCmSgsvKypIdH4TzYBS7PTWz3IEtAuiP3TxWEglIVydKcTx37s/V+S18TA1I+
 ODzAHtcIBQZCRDJH11yjO8C290GHA7qYQxbXAKRKTLmDGbOcjWuDp8VE4pj/Oxk0I/
 vUczoAijzWpLb4FTmd3za9E4i6c9R7+5GJ/u+lSN7ZnM83KOtldssA2uVrXEDeoEms
 /tABaaj18daXg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jQ+dmvq+
Subject: Re: [Buildroot] build failure on Ubuntu 22.04 LTS: TIME_BITS=64 is
 allowed only with FILE_OFFSET_BITS=64
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Christian, All,

On 2024-02-17 12:55 +0100, Yann E. MORIN spake thusly:
> On 2024-02-17 01:32 -0800, Christian Stewart via buildroot spake thusly:
> > On a fresh Ubuntu 22.04.4 LTS VM:
> That also happens on Fedora 39.
[--SNIP--]
>     /usr/bin/cpp \
>         -I/home/ymorin/dev/buildroot/O/master/per-package/sudo/host/include \
>         -I../../include \
>         -I../.. \
>         ./sys_signame.h \
>     | /usr/bin/sed -e '1,/^int sudo_end_of_headers;/d' -e '/^#/d' > mksigname.h
>     In file included from /usr/include/features.h:394,
>                      from /usr/include/sys/types.h:25,
>                      from ./sys_signame.h:4:
>     /usr/include/features-time64.h:26:5: error: #error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
>        26 | #   error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
>           |     ^~~~~
[--SNIP--]
>     @@ -65,7 +65,7 @@ define SUDO_BUILD_MKSIGNAME_MKSIGLIST_HOST
>      	-C $(@D)/lib/util mksigname mksiglist
>      endef
> 
>     -SUDO_POST_CONFIGURE_HOOKS += SUDO_BUILD_MKSIGNAME_MKSIGLIST_HOST
>     +#SUDO_POST_CONFIGURE_HOOKS += SUDO_BUILD_MKSIGNAME_MKSIGLIST_HOST
> 
>      define SUDO_PERMISSIONS
>      	/usr/bin/sudo f 4755 0 0 - - - - -
> 
>     $ make sudo-build
>     [ succeeds ]
> 
> OK, so is that supperfluous at all nowadays?
> 
> Can you further investigate, enabling PAM et al in turn and see if any
> optional dependency triggers a call to those two utilities? If not, can
> you look sunce when that is no longer needed and why?

I've now sent a patch for that:

https://patchwork.ozlabs.org/project/buildroot/patch/20240217172923.3629905-1-yann.morin.1998@free.fr/

Regards,
Yann E. MORIN.

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

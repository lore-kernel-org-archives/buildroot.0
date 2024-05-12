Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB78DC25B4F
	for <buildroot@archiver.kernel.org>; Sun, 12 May 2024 18:37:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83D5F605EE;
	Sun, 12 May 2024 18:37:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M0gqwwq7_qU3; Sun, 12 May 2024 18:37:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 805016061D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 805016061D;
	Sun, 12 May 2024 18:37:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2971E1BF868
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 18:37:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1597B6061D
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 18:37:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ttnOJfLxPdYu for <buildroot@lists.busybox.net>;
 Sun, 12 May 2024 18:36:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B8941605EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8941605EE
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B8941605EE
 for <buildroot@buildroot.org>; Sun, 12 May 2024 18:36:57 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 9520313F88E;
 Sun, 12 May 2024 20:36:52 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 12 May 2024 20:36:52 +0200
Date: Sun, 12 May 2024 20:36:52 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <ZkEMRGJpQsaTfdtm@landeda>
References: <20240512175117.2096550-1-bernd@kuhls.net>
 <ZkEFe-dn3GSQ2bdK@landeda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZkEFe-dn3GSQ2bdK@landeda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1715539014;
 bh=gLEGCg/KFq1zvbO7mF8GwRnKVbaosIZJaF+mPgmnsm0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=u7cfXEYTFmukU7xTZbDwqYSEcgSCLtBtuV5O++LWunx/py18y+SAyIC+iLF7JJOCc
 hvaWeQ5kEv+5L5S2gj863I4IcVPSVIOTMP2b4rcOU2DjXuv2uyb4rsBH9WrBxdvq7U
 alue3IEdOCjw6WlaZWPDXJni+GETPsljLI2uMOrko5FKZ3xZQeDHU1xU1VWr5mcIXU
 UUhuOTMrAe3AFbBcf7U2IvqfkNIzxjtqu9ymtynptNiUjd01KRG2HkEKUBhfkxMwnj
 NX7q0yBfKto6ByvYjLwy2chppW1Aat7gvNleVQmcsgofN/cYoT+Qo/Puk8PKEjSQHy
 eM0iWRQ7qKk5Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=u7cfXEYT
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi: Link to libiconv when
 needed
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bernd, All,

On 2024-05-12 20:07 +0200, Yann E. MORIN spake thusly:
> On 2024-05-12 19:51 +0200, Bernd Kuhls spake thusly:
[--SNIP--]
> > diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
> > index 94cab237dc..301330a574 100644
> > --- a/package/kodi/kodi.mk
> > +++ b/package/kodi/kodi.mk
> > @@ -138,6 +138,7 @@ endif
> >  KODI_CONF_OPTS += -DCORE_PLATFORM_NAME="$(KODI_CORE_PLATFORM_NAME)"
> >  
> >  ifeq ($(BR2_ENABLE_LOCALE),)
> > +KODI_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-liconv
> 
> I don't understand how this is related: the defconfig you provide in the
> commit log does _not_ have BR2_ENABLE_LOCALE=y, so it can't exercise
> this code-path...

Ignore the above, I missed that it is testing agains "empty", i.e.
disabled...

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

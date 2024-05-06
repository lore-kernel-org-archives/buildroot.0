Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD25C25B4F
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 20:19:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77D40820CA;
	Mon,  6 May 2024 20:19:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I03z-ejZKylT; Mon,  6 May 2024 20:19:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68E7B82209
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68E7B82209;
	Mon,  6 May 2024 20:19:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 770531BF3E8
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:19:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63E6F82209
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:19:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W7FgF0kX6F9A for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 20:19:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 523C4820CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 523C4820CA
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 523C4820CA
 for <buildroot@busybox.net>; Mon,  6 May 2024 20:19:45 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 3AEEE13F8A9;
 Mon,  6 May 2024 22:19:39 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 06 May 2024 22:19:39 +0200
Date: Mon, 6 May 2024 22:19:39 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <Zjk7W9fZXDBusRc2@landeda>
References: <20240506144555.31709-1-ps.report@gmx.net>
 <20240506210440.323ccb15@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240506210440.323ccb15@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1715026783;
 bh=P9ntc1aIIGhOmZ5p6TzPzsFvPTNnasL3FYd7hx0jh4o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HeBpFZA0brn6wFAgKNdQaH/SJin5l04CSWnI4Th3laQp6+HB80JwaUoRn8MUUF7Wy
 ouWKQuSef2td1OVU7CTz4B1k3HhXYl283Wzbqg7eCJz+WYRZRq6sADE6aWp3pL2CRX
 eljvoi4cTtAfcpEiN5UAPaGWqRGYgJ0SNLLw8nEouJY/y7Gz53iLp88q51KZ9f9tvc
 S/rfaG/Xq9ePKTZjvuvmdShTPGLASXlWcC75d+1dZG3jrWK//cLhVBJM3oWiqVVfm2
 cAjwM63m6mWDBw0+RqtGql1KzaM9pDJMiTUiw3wTy4CQaTskFhKz2ajOkbwFcaqrAT
 YQ6i+livtNE+g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=HeBpFZA0
Subject: Re: [Buildroot] [PATCH v1 0/8] support/kconfig: bump to
 linux-v6.9-rc5 version
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
Cc: buildroot@busybox.net, Peter Seiderer <ps.report@gmx.net>,
 Peter Seiderer via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, Peter, All,

On 2024-05-06 21:04 +0200, Thomas Petazzoni via buildroot spake thusly:
> On Mon,  6 May 2024 16:45:43 +0200
> Peter Seiderer via buildroot <buildroot@buildroot.org> wrote:
[--SNIP--]
> > The kconfig version dump itself:
> >   - support/kconfig: bump to linux-v6.9-rc5 version
> So this commit without the next two leads to a broken situation,
> correct? (Note: this is not a complaint, I agree with them being split).

Except they should be reversed: the new commits can work with the
kconfig we currently have, so it looks like it should be OK to do the
required changes before doing the kconfig bump.

> > And two 'real' changes due to kconfig language changes:
> >   - support/kconfig: reference environment variables directly (remove 'option env=')
> >   - package/openssl: move libopenssl/libressl source statemetns outside of the choice
> But don't we have this situation of source statements inside a
> choice..endchoice in other places?

Toolchains, skeletons, init systems, jpeg library, linux extensions, and
indeed openssl.

> I remember Yann saying that this was
> a problematic change for us in the upstream kconfig code.

Yes, so given that there are two problematic changes:
  - source statements in choices,
  - environment variable direct expansion,
I wonder if it makes sense for us to update our kconfig infra...

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

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B55C25B4F
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 19:04:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B2FE740B6F;
	Mon,  6 May 2024 19:04:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9YO23eS0bJ7X; Mon,  6 May 2024 19:04:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AFFD640B9D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AFFD640B9D;
	Mon,  6 May 2024 19:04:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 55F1F1BF951
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 19:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 428B040B9D
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 19:04:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Djl0Nw5lcQNe for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 19:04:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1DD1A40B6F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1DD1A40B6F
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1DD1A40B6F
 for <buildroot@buildroot.org>; Mon,  6 May 2024 19:04:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5A404240004;
 Mon,  6 May 2024 19:04:41 +0000 (UTC)
Date: Mon, 6 May 2024 21:04:40 +0200
To: Peter Seiderer via buildroot <buildroot@buildroot.org>
Message-ID: <20240506210440.323ccb15@windsurf>
In-Reply-To: <20240506144555.31709-1-ps.report@gmx.net>
References: <20240506144555.31709-1-ps.report@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715022281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8NRd9gyyD9bfREj9C7fNnNR9F1dLnfPFXayrMlalkiE=;
 b=Nz+c7mVw4zfeBqYDWdaVh5ADHDq9U8i1tUaxn1+XV6uWuKjOPY0Npnz/uSqT2ZlYkETWd8
 HABjiXJ/K3C95YFp2hxe7VS5L01CLPkIO0BuoW5A/UdQzkKiylmZHK6u/JPuul+QJdidI5
 TV3nrEkG5hnHL1ee5kiCjUou4Z9eZYJBiMsOuf9QWOHIEGD1ZqZouudC3jVYRpPKSN5FYx
 LNI14YGE2u/Dmbtgm7n9uBeQs6sSCn1S/bU3fbUJ39bX/GKnuvhhNJIgGKt6N2Ny16ntl3
 exEtHUIkJQ2vwgcBuftXT+GzHcLl3cZ/3A/IgwGWcur2HPtU11c+yy271fC+BQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Nz+c7mVw
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@busybox.net, Peter Seiderer <ps.report@gmx.net>, "Yann E.
 MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Mon,  6 May 2024 16:45:43 +0200
Peter Seiderer via buildroot <buildroot@buildroot.org> wrote:

> The patches are orderd by the first 5 handling some minor nits (result of
> the new kconfig beeing a little more strict about the syntax, can be
> applied in advance):
> 
>   - boot/barebox/Config.in: source argument needs quotation marks
>   - package/cmocka/Config.in: bool argument needs quotation marks
>   - package/dovecot/Config.in: source argument needs quotation marks
>   - package/python-pydal/Config.in: bool argument needs quotation marks
>   - package/x11r7/Config.in: source argument needs quotation marks

I have applied those preparation patches that make sense regardless of
what happens with the bump.

> The kconfig version dump itself:
> 
>   - support/kconfig: bump to linux-v6.9-rc5 version

So this commit without the next two leads to a broken situation,
correct? (Note: this is not a complaint, I agree with them being split).

> And two 'real' changes due to kconfig language changes:
> 
>   - support/kconfig: reference environment variables directly (remove 'option env=')
>   - package/openssl: move libopenssl/libressl source statemetns outside of the choice

But don't we have this situation of source statements inside a
choice..endchoice in other places? I remember Yann saying that this was
a problematic change for us in the upstream kconfig code.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

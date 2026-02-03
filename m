Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5CADE8B366
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 21:38:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 875B140C49;
	Tue,  3 Feb 2026 21:38:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ui1zSaWZx8PH; Tue,  3 Feb 2026 21:38:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B72F040B7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770154707;
	bh=LSWVr7hwXqawvgrpoxp2ZrUSuMg/Ep0XOlJLatq+Zco=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nW44s4za5K3ow+xDVUQxGmel2cRZMJiutF+EVN0Cs0MyLa3rx8nsClWbDpFp+05RI
	 PpcRGsk0jcO/fSM1z1gOPlgl2mr39RBOdIUFAampFFwTq4WbBFsznEhmIOIWen/9Hl
	 dGYV4jq4Rp2oStfnV1zbICMLwzQDmDbCrDDV/RqmJKv305krnpyP7ZvlzDIvcIJE52
	 T7kEvQCWOIaPIsB7Rk0dIhZwHRNOJVJSA3XaRbAdVJN1klFeL2IqLIfY61yRAotWGG
	 QFpt2rNtmtV1Ea71fwpAIuJ3oOLYJa8YkOErOl/5VOdAAsvKrq2ELKZujoMowAOzw+
	 E0zpU99qeYVcw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B72F040B7E;
	Tue,  3 Feb 2026 21:38:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C2D1F5
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 21:38:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 204C583DF7
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 21:38:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4lE1SFzKZtZF for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 21:38:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2649C83DF4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2649C83DF4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2649C83DF4
 for <buildroot@busybox.net>; Tue,  3 Feb 2026 21:38:24 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 1AD924E423EB;
 Tue,  3 Feb 2026 21:38:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C8B7560728;
 Tue,  3 Feb 2026 21:38:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2A067119A8888; Tue,  3 Feb 2026 22:38:19 +0100 (CET)
Date: Tue, 3 Feb 2026 22:38:19 +0100
To: Grant Edwards <grant.b.edwards@gmail.com>
Cc: buildroot@busybox.net, buildroot@uclibc.org
Message-ID: <aYJqt3EUcWew11Gi@windsurf>
References: <10lt89l$gl$1@ciao.gmane.io> <aYI5ces8h1-KOmDJ@windsurf>
 <10ltebn$ua0$1@ciao.gmane.io>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <10ltebn$ua0$1@ciao.gmane.io>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770154701; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=/wQJicXwT1q4CzZ5+Eg0Cz7gF4nYlGzNZTLqa95ibL4=;
 b=ptryHidj8E519dOn2zcJoCLOJK17fqIxz59H7It2umqVwW4AAXvvSLsblffEeo8D+CjMSM
 7+ub192Ucbs/PNCo2QG4HtObsM2rfvXGTSRlH4ZAVTEARKejWyP66Sgy/VNTm605WdJ1U3
 0kdiJax0HjCvBJ+QLnWCFkY3ChG8RXCQZQuC8CGkbok0giu6+zUF5Drtb2p3qJCBnoYIXa
 556GtH16o3tZxykRy2QouK5ZCB7PajjFQblK7eC754DNyflyL/qC5WbcE5tdzLohLCX843
 +hqBeOCa+pvd+QxoCrQcCI9iy1q7ue6cN9MvqtvSGNMuPUJeVt+jMDdDUbmF/w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=ptryHidj
Subject: Re: [Buildroot] How to control make '-j' parallel job limit?
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Feb 03, 2026 at 06:21:43PM +0000, Grant Edwards wrote:

> Doh! My apologies. As you noticed, about one time out of three I seem
> to type LIMIT instead of LEVEL, and they're visually similar enough
> that I don't notice even after looking at the file repeatedly.
> 
> I apparently tested
> 
>    make BR2_JLIMIT=3
>    
>      instead of
>      
>    make BR2_JLEVEL=3 
> 
> Sorry for the noise.

No worries, glad that it works for you now!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

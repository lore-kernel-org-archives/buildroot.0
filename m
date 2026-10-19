Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB391CCF2D3
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 07:41:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5543D406AC;
	Mon, 19 Oct 2026 07:41:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CIoUkkobLz3V; Mon, 19 Oct 2026 07:41:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 48CC2406B3
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792395665;
	b=Ue/1YNv0GGRXgXuug00tC976Y2om9VorNqnRHiCZsvEja8K6nBgyQS6oOZY69d0N0lRq
	 rCT4mDqow048n/AvD0OiILj30lsrJ/ba2jFbTOMYBHcQsJjsNozGzuqmjku9UhpTelHxD
	 PYFTgTYfladlN4VhgJ0W63Dr89dqMhZL6Vv9/QFRH4KavPEZiMMjPYRsUOeubHZPOT0Xh
	 Qs+2/mp7EmDcrVg6f2lnBBfn9tVNNvt5K5tadLH/F8Ss6YRqpHUc9vQ+pdrYnZJHSC3Zs
	 +DV5/9MWCv9fWrYRg7H/HBOUQe1XuMyKGJNVztw7n8gOFojFyqaBLL6034oxooI2Nqw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792395665;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=zCmSlVxpn/OcXR8lwXR687SeE/t1hecCFkC0atXdheM=;
	b=eB4CkJSgqJgl4Yv3sp+9Y3G3sntBnEk6CMDaQ/pKqBy0nJ1GDhkNcGmebuuOVCJTlITn
	 EDEK72fNp2CwaOIcDH3xipz2eIPcHFqdP65hc9uJ8kNgGx9hQjtergEwkZkhoY5US8aiw
	 EHQAeV6dlhugVUMW5VqegQWXN60D6VowGfTUTuUcXI3sLtMlqK1SghcY8/MryynyO1AG/
	 xu/OVehpkaECDVptFXmsmSQX7WPtS0rsHrqEE4BDOGNFK5csK6R2sB4kNMI4ZpV0bzIjv
	 g/Ln5OWvJQYCyUHrPkk9D6t+tDylAVnQC+D9rl/slISgoIwsudetEZtifphglrPY7jw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792395665;
	bh=zCmSlVxpn/OcXR8lwXR687SeE/t1hecCFkC0atXdheM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DErWCUh3xvkua7A4ylPFHC0lNIbXm2787y1xS9MYmZVPABsYGDWUPwC4UBiGXnHYn
	 2VlxCY/2HvQmzenP6MKlaKJUG2JSHC+YPmhTlmOiw8KKKNgc2jMm3Nq435O4RLl1jq
	 2Doo799rHSkWfw7Qhz1qNu2bXYyiF3AHD0SRzID4Ch8u8XVWVmS2vpnQOSVlUNu5g8
	 TC2RQ1F7uht4hvDe3sYYfiZ9o2Ewq52CUb3lNJ2O7CPeJIrc/CtxTDug/pi8r28pvl
	 RiSQwKTFaIzmbZja+zzs7LaLSRvlkKLLUeaCCHQ1Y33Fg4vGlN5HLhnUqDj4tu7k0m
	 L12KhDPPcIBtQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48CC2406B3;
	Mon, 19 Oct 2026 07:41:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 858FA769
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 07:41:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B29F406AC
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 07:41:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YzIYJ0GpL0M8 for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 07:41:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 99F0C406B3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792395663;
 b=EuxQFlcFjBiGHj5I27ZlEPMMY7he0QFU3MLm7mdqiA3ZTYv4EiYa58gbS69S4XLYaBBj
 L27Gh7Zb/74ZB0GAQIYj6bBYc43+lTBsNqaLUwya3fYNmRJRx9jmEoufy/kTltTxsxlv5
 7VyfpvXT6jParMzqsdsvVfHQ5ETE03mmqCPqw4EIBLI3WDy4ppjQQ3ajALakq+sBrTrzy
 18oPaQCKEShL6gGw46y3M2EWRsa72jOBxyHorNDUm4wv9x7h9UkcmmpReB1kr9h7VV12p
 4c7Cfei7sS1Zk/iHnP+y+Oq9dJUO+TibyxzTBH3scZvblW9d8kUeRAGH6ZTIWfoK4rg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792395663;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=x/jlCBpQM+1dEU+k1T1EXTrFEirsg85dU6LaflqTX/o=;
 b=B/a332JwKhOQ+QYAKwTffzpPTGGiK7fpEAaMQCcs0E9FSGPQdNA9sDV7/ORnBFOPNb+p
 FPWlWaj8uklYEWQop3yyGLORgvWWlTRdWu15+dEBCYQZuN+0L0AyYb58bEqpLWrx+OQCv
 VRtnSJw0EQ6t3r1unaJtbqLcZhgiVUHtEZxKAsDO6NGN45JI21Kg6uH77/7EdGB87A7ep
 5G0qEoNHwFABi8iIwRHti+KHvY3BXqEDcNx9FyY4QVLIaoe+scBOxMh/37/LwoH6dzLfP
 tZ/gzxcgm3ewNHGOCkEEnioEd+0EbzRky21SrDfBgIAv+xY6qd9zxSDZYRJhFGAGoOQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b="bDnO//bH"; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 99F0C406B3
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 07:41:01 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 02B491A1285;
 Mon, 19 Oct 2026 07:40:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C9CB360582;
 Mon, 19 Oct 2026 07:40:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EF03010328429; 
 Mon, 19 Oct 2026 09:40:55 +0200 (CEST)
Date: Mon, 19 Oct 2026 09:40:54 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: John Ernberg <j@j-ernberg.se>, buildroot@buildroot.org, 
 Adam Ford <aford173@gmail.com>, Bernd Kuhls <bernd@kuhls.net>, 
 Joseph Kogut <joseph.kogut@gmail.com>, Romain Naour <romain.naour@gmail.com>
Message-ID: <atXItOiRRP2j79zR@windsurf>
References: <20261018160651.349981-1-j@j-ernberg.se>
 <atUtmzafWnVtVm-t@windsurf> <atWwZGNSjbN0GrwD@landeda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <atWwZGNSjbN0GrwD@landeda>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [RFC PATCH] package: {libgl, libglvnd,
 mesa3d}: Propagate libglvnd GL provider to libgl dependencies
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

Hello,

On Mon, Oct 19, 2026 at 07:53:40AM +0200, Yann E. MORIN wrote:

> > On Sun, Oct 18, 2026 at 06:06:51PM +0200, John Ernberg wrote:
> > Thanks for this new iteration. It is really annoying that mesa3d needs
> > libglvnd, as it prevents from doing the natural thing:
> > 	libgl -> libglvnd -> real OpenGL provider -> mesa3d
> > In the end this indeed means that the only option is to do something
> > like this:
> > 	libgl -> libglvnd
> > 	      -> real OpenGL provider
> 
> Is this for build dependencies?

Yes, because right now we have:

        [GL-using package] -> libgl -> libglvnd

And separately

        mesa3d -> libglvnd

which means that [GL-using package] can be built before mesa3d, except
that libglvnd doesn't provide *all* what is needed to act as a GL
provider, for example it doesn't provide dri.pc.

> AFAIR, the actual GL providers do depend on libglvnd at build time,
> so we'd have:
> 
>     [GL-using package] -> libgl -> libglvnd
>                            mesa3d -/
> 
> I wonder if should further have this:
> 
>     [GL-using package] -> libgl     ->     libglvnd
>                               \-> mesa3d -/

I'm afraid I don't understand your diagrams :-/

> ... even though the libgl -> mesa3d would be here just to ensure build
> ordering, and there would be nothing from mesa3d that the [GL-using
> package] would use at build time in practice. I think...

And that's where you're not correct, and that's the whole point of
John's patch in the first place. Check out his commit log for details.

> libglvnd would allow having multiple GL (GLES, EGL, let's call all of
> that just "GL" to simplify) providers at the same time on the same
> system.
> 
> For example, some boards have two GPUs, one integrated and one discrete.
> 
> The idea of a series I sent back then [0], was when libglvnd was _not_
> enabled in the configuration, then we could have only one GL provider,
> i.e. the case currently. But when libglvnd was enabled, then multiple
> GL provider could be enabled in the same configuration.
> 
> At the time, libglvnd was relatively new, nad only mesa3d had
> support for it; the nvidia package we had (and that we still have,
> AFAICS) was too old, but newer versions (IIRC) do support being
> installed so as to be found by libglvnd.
> 
> So, the idea was to bump nvidia-driver, but that stalled for various
> reasons...
> 
> Then, we need to also check which other GL providers can be configured
> with libglnvd support.
> 
> > So shouldn't we drop libglvnd entirely?
> 
> Depends if Buildroot eventually want to support boards with two GPU, one
> integrated and one (or more) discrete. This happens.

That is understood, but libglvnd was introduced in 2020, we're in late
2026 and nobody has enabled any other GL provider to be
libglvnd-capable. So it seems like this dual GPU use case is currently
of no interest to Buildroot users?

Essentially, I'm trying to figure out whether we should:

(1) Fix this libglvnd issue by adding more complexity

or

(2) Re-simplify everything by dropping libglvnd entirely

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

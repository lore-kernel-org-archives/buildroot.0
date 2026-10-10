Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0788ECA9EC5
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 21:10:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74E6C810E6;
	Sat, 10 Oct 2026 21:10:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ezxE4uCu1JFI; Sat, 10 Oct 2026 21:10:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 82678810DC
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791666642;
	b=eNVwRlgZsLq3jonQjM3FQQNuVTgJYSbtK8iZlNgx9D/lbZCL9TzJQ35lbummHPJghRtc
	 m3U8L7eq+PtEZsDcnDrihFuxaLHLlm5XzGYVO73Xs4nHnkvLrSvzo0vM5sZs0GfDSXlb3
	 XqERNJSvLTtKKJ8LIhOvejUIFVRRBLdgjJh3297ew5681Ov7QLsbRDHlIUx/HzDrcWNZu
	 bjyE/CzdswxcnyY+miNI5enmNVnY7cVJIWObUlDNsJ/EOxG1B5CiPpR3Y5/RFoLoX2OgV
	 kqm2B7zCZQnKjTlQ7IrkcnCp1qyU2U4w7vkGcUfZ3R5EvrMWbKXF2c6iybvfNuJnMlA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791666642;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=JWpawtnqa0SI3h67kcQr4+z1LY5wpGWEgKmmSpH2YLg=;
	b=gr03TvOdxlbWu6KUiPBEQryIAjBoc6/3Sr4cZ6I091QwL7rg9LiY48+0ZFX6h4XjzWEu
	 38HKRgnL0FNyeFbr7ItIU7w41KOO7xQ2iCyeRa/VAz+1skPRa5oztvobqxXnWMr5QuriV
	 aBhjz8K7HJjq7FMAwQFYLq0Wmbyor7lUD9F5jmM9pcWTCWQGZ1MvriGOOcDxf+K69DbEC
	 oGeQ1WpRmAWr40kLe9gaTjCovHvmhCLZY3P6oB5+ihx6lty+FyLTRH9GJM8+UaR3qncU+
	 oiPl0EAMETRpdvtS5BAENVyCQOz4/g63dOpHcq9wcvgJaCGZ38feRdcEdBQv1j1hA+g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791666642;
	bh=JWpawtnqa0SI3h67kcQr4+z1LY5wpGWEgKmmSpH2YLg=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Zx8JbZ2IaESa1MvhJFNuC3yy1KzHJgpG1oaV7CgLdmyZHjFMuVGugDCIi8LXUK6Cc
	 Nz6lso/i3Bq0Wa+p97EfCSN+EJlbHAAQkpazgC1luS+Zan8g5BaK8HqkjZ+1AcqQ93
	 VKEfZo2khuaDn/LTPyj9cJnt9XOoggzVVkmlL2oaosDjzY9QfFpxdkcaBgAANL2vtv
	 BfKYYxtPYzfky93sXTiRjv88k6RMwsFUw/PfFnO7ktc9uYu/l5UuNNFmGzjf5W4gWq
	 oCx7iSB78dTrcfmk9oG0G7eaeY1ToarzIrwMxYOUwaD+xzQzahg5o6pmgsJh7/EhJI
	 dyIRw/gfks4Hw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82678810DC;
	Sat, 10 Oct 2026 21:10:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C0BC4156
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 21:10:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B28574087A
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 21:10:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J-F2MRgG23ML for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 21:10:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 250BB40877
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791666638;
 b=bpRxdl6vMfSquPlK6ZyKaymhHE0AgOnbpdOxO2q1C56TJq+rEay1l2J104Hfc4kh8JSj
 PXvIqZtKXXIqqJFj3FL+kprTgjd+xr2AbcOvrV8rb2/2JYLHZYGwa8v+VN+UAxMnxAcrb
 RP4VjzQcXE25xvSX+TacwFGvQ700mgmaKP+VFW8FIfFY3TTQO8e176qqA+pO6DQUqUFxm
 sccwKneRxxzlOyJUQ8eXH+kzuSSqsYP+Cn7J2AFBEO0TtI0EkT3Yr5pkxU4je11wftx6I
 PJG4PVQysJd12dxbX96oq/aO4JKEcRc/DS26qN0Hh2MEYkENurQ7nHtzvzlupU5J/Kw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791666638;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=08FJ07CbMEmfIL7YuxMFv4Kx1hMTG35jE9tMnBGKnsg=;
 b=h7QeHFa/ruEHNsbQmEKjgd+h+yfvenBazaguqysfcExfBwjRCPcIEJVXs7HBW2rk5Lki
 pW0HoO3YZTZPwafLXih/Uot4wVzR2Uvx7RRRKY7KuAT/poduezdgcxyLZmzL83Sm5mzwq
 d3XjElgdmJEsMNLYtohR78uHyw1esUIWCvTUxVSC6jFHXGEOf3qc3sw1Z00f+5xMMV8cu
 Af3EEAmEOR2nqGSwrT9V+Or2eotDgIE8rAJVrSYKAL2jN5iDVlFb8Lj61kWWitDfo5jXb
 4SJFIIs9kvy684no3nIfVg/V5YS8jbsPoZT9bTvPf5fmMWmLRem1NuRTOd/jwzTPFsA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=SsFcntZ1; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 250BB40877
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 21:10:36 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 714C64E411D1;
 Sat, 10 Oct 2026 21:10:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A17B46075C;
 Sat, 10 Oct 2026 21:10:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7143711D70911; 
 Sat, 10 Oct 2026 23:10:30 +0200 (CEST)
Date: Sat, 10 Oct 2026 23:10:29 +0200
To: Neal Frager <neal.frager@amd.com>
Cc: buildroot@buildroot.org, joseph@anodize.com, ramin.moussavi@yacoub.de, 
 thesamprice@gmail.com, ju.o@free.fr, arnout@rnout.be, lordrasmus@gmail.com, 
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com
Message-ID: <asqptBFqe5itH4RQ@windsurf>
References: <20260902040121.1583600-1-neal.frager@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260902040121.1583600-1-neal.frager@amd.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 1/1] package/gcc: add microblaze frame
 unwinding fix to v15 and v16
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

On Wed, Sep 02, 2026 at 05:01:21AM +0100, Neal Frager via buildroot wrote:
> Add microblaze signal-frame unwinding fix back port to gcc 15.3.0 and 16.2.0.
> 
> Upstream: https://gcc.gnu.org/cgit/gcc/commit/?id=4ef64ad1aa9bbbe9471610e2de6ef0c8afed8b1f
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Applied to master, thanks. What about gcc 14.x? The issue didn't exist?

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

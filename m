Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A48FCA5FA2
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 21:15:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 617F980AEF;
	Mon, 28 Sep 2026 21:15:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id daLR3arVW6Qe; Mon, 28 Sep 2026 21:15:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org C3AF080A82
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790630141;
	b=HewCigg5SeoTqW3Bx2twUZQu8jLCwkRG3PlWvuvnnuHjVq7LOU959MIs7GMmPuCZWxle
	 3ZG9BKmoRGcI+vs9vrfoErLOTNKbzxd5f7kkhQ2d3anYgerQEfuBXj0Z2Xx+YlTnPDmQG
	 e/fEWMj56/Vxdp3UaduRZtQy70be5Sf0TjiEYwFuQuf+6zuXfxgX5V7LOR15mmLX16nHD
	 azq2dIzYuXCZuIM5d8uC3i2BiV9jbEzeCGj7XlCGOi50m1+mZXF5U6fEn3XqjpIBkj56V
	 i60L3TRufeqXbdORArrQU9+Mzm0z3+s9PTMgIF41LQfHDNF8QGjFbSF8vP+oirXNQ+Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790630141;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=aqYdAnUjimrfk0WKODwD1KjF9VkfXuNgwLh/B8T/i3g=;
	b=QXnBSkMWR01ba4ISGi0xp24G8h1GOS+yUHDs+vmSfdY5Bnq2kLqvt97eH+oxAkjLX4PQ
	 NXi/zt7tyUjNaZax0noZJoqe/iCz2FIc0KL2eBJHDOx7iWiuuPVx8xKSYEE4J4bdjKMTy
	 aIUD6EduzsEWBn2hsS+ESH0drvFeV9XZKYWS4N+0W94k1A4fXlmLtfKGyPGbJBp9FyRc3
	 SRiTRX2hZvCOzDoUM6SscC4BRs1e8A0rsG79NioSh6+xvlvL4EzzeDnW1YlLGXYG/pHbc
	 81u/dtvyv+yRV0ba/9ogYzVeYjLXFc93Zjb3k+JJ9P1UAts2EbW1I4bhOzekfeOXl8Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790630141;
	bh=aqYdAnUjimrfk0WKODwD1KjF9VkfXuNgwLh/B8T/i3g=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rHdVAuqQb/AuTMK3IQTO/STtOfwy5nHjsO0NXm0niDafrLRdpgHXY5/SfgVDvBYUC
	 q+nrnLwoIRfDAfMc/GcXkcwwgFRPuUUqDIROxn0oWz98LCwAB2pgIM5ciffeByN3CI
	 p+xoo3piy1V6i6JFOTzS3zySdVukTd4Jjr1sV0t/99LGAPlpkiGYhPYCeyWLfMljbd
	 p9Ahhe1EYk8A26JiBQYfckHlWMgUZwkDmzKqQD0cNZUiceDeDuJ49zovdXN3R7u1xn
	 94Q+IHYkRX3TtnLhUymHcGvCUQnKlvKuf2/FeQJXrZiBojXtIlM7c+61vodburzdIL
	 irkw5/RDx/kOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3AF080A82;
	Mon, 28 Sep 2026 21:15:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D79872
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:15:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F8F840215
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:15:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HQtwq5e3YBZi for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 21:15:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org A21A64008A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790630138;
 b=AS9yZ8T0voqUZrGX+qRgRrk/KV7aK5cnmYCinIeyk3s7MIkVi/osTkxnQD93KUUg3lBJ
 e0gXvtFGdB7Cat0WxgrbKbfWKbjCNwz9ubW6CMJiA3kziU7N2SrElsCGmSYXgust0443E
 QsR+EMBOrO5VsVmXS+S5n3hTdl3WWYL/xzJH1DEm8YMo9TVZ8TSyr6CeAeefmZoVpIzxR
 37vahlt4p4xhVupVDsoKQzJG5ojJr71huBCbRavc74Y9JAcIH0xnxmsd08A/eW6DUhEw8
 LX+ECjhdrlXDMy+wEC703cfIJFZM2n5vdWdr1X/jolwguCaGptF6LkQj+TlKW7r1Jvw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790630138;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=JHUifHI+mtA5YUM9uVx2/Cgs5AOpfiHIMwgICxfSWQk=;
 b=BpQCnxMQGqlPsOPg8zJ65jMw8F8Mt6SpPIVRhNqn7rDHig581TV3ReybWeW8Q4DF7wpX
 0LHdXXrVtlcECyw/yoX4zl4b5XWkezya3wsnmLCcpk0RCUq5MShgktQB9of5BrGOAndjM
 E1uUTOYMbpRNTy/gCXcep8b/IUJ9/N7pr0VUCCdzE9B/tCnjh1vP9f/xfDsBM4OAUmr2A
 7enzdW6D86pv49wl6Mmu9l+tdisJn+FeMwcyYKsSlDqlR2VSYUt5DNkjS42rAe0ORrOcZ
 O8tpMl1wyQC7YfbPiIUioEKTMw/0D3EeaBNr4zb1plPvcCps6mumxB70wBx71nItkhA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=nG0D87Ay; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A21A64008A
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:15:37 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 162454E410A4
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:15:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D85A1601BD;
 Mon, 28 Sep 2026 21:15:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 39EFC103295CC; 
 Mon, 28 Sep 2026 23:15:29 +0200 (CEST)
Date: Mon, 28 Sep 2026 23:15:29 +0200
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org
Message-ID: <arrY65m12ON0dc2W@windsurf>
References: <20260928144057.2235445-1-yegorslists@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260928144057.2235445-1-yegorslists@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/lpac: bump version to 2.3.0
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

On Mon, Sep 28, 2026 at 04:40:57PM +0200, Yegor Yefremov via buildroot wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Release notes:
> https://github.com/estkme-group/lpac/releases/tag/v2.3.0
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> Assisted-by: Claude:claude-opus-5-5

Applied to master, thanks!

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

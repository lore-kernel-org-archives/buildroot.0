Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98DFFC88E75
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 07:35:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60992811EE;
	Fri, 18 Sep 2026 07:35:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XJqWUiosogAA; Fri, 18 Sep 2026 07:35:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7FBCF811DB
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789716957;
	b=RpETb6gABKbw+3jvY+IBVvNglVpw56R1tB/KoGyR8Lqx4kLSXLre05Q812iJZ8hb8m+Y
	 sl8N7HO6b+mVGvcFHqmoXUe8K2RQay0rmcT0DqbHZm1vowcAPwwnOegBHIlgcxQRybxoJ
	 xm3+jgBebtAaENhT5imWboEQWjAa+PTNwYDkLGhApYay8UZahmgS8DCPZklCN0pUCgSvX
	 os0bCWPyuMGjGclIVRJgqjVxd/ZIF17DZYuXWe7PkbFIZ/5e+pY1zM1vygoLOghHYvuap
	 R9b+VmI3KvcTNH/187HhCy0dTWtdSenyyduO3UgI4xCbvo3kdxNwtr3AXGaI8iUL+oA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789716957;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=/WPOpNBRckOZZqtkJhjs6e0pGe4Wp2YSlRl+jgJkyRo=;
	b=RumRrHla8I/o1k4cIiBvzmSEMduww/ghBI32tQDGioOHVWKRjzBnKuiXA8TYvIJfg9cR
	 1h4I4IcI5zQxFt6MJBIj/F4KONuNjSch5tOfHaWSSYm7mtnLIJkQbtgreZkevSbw2g7C/
	 NWmzvgCtOhzZuBXqbtzdFOuSijdPWeFVPkL6Q+BYHWWO4R+3jLxzZtlKqeTSevjW+pHbB
	 3t/MFLFr+r63JNA72CF3UBtVNm6cbqdhywBWdxEfxHYv70sUtXy2z7swhhaK2PNUKmqtO
	 TKQC/Vrx+6J2Y9cOlQfnvEp28YtT7EgU7j7pTDUJIX9YrynPIGdpOGroESqonZdYX/A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789716957;
	bh=/WPOpNBRckOZZqtkJhjs6e0pGe4Wp2YSlRl+jgJkyRo=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YHluS9V/moWg0gukoVvkN2zkXPpWb3U8T3Ysk0mQ9CpOFxe9IHgalN9/9s9XOofg5
	 zaZKLw0IEf6srjhRs7EyeFhw4L2oJ1Ilc0VPDouwe67prlkGyHxK6559ws6BZU/Jfx
	 En8YEAq6XZZMLpkdwJKRjnLGT/g4nXrHkuthjj7bnkUVHqghfwkRtmOgHV17l8UVVd
	 QkKj60CH/aZNFlZ/o+8iEz7K6BXO2L8tKAT+JqJFmv1PJDXsK2fnBgmHZkDCnuiKnh
	 fpmNOLHSOevL8Hw6rDrmGcY5sMNI5W014DppzU2Skvh6iUI0bbpuQO2VBuAtQ6R7h8
	 xjpKBzHxwF8cQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FBCF811DB;
	Fri, 18 Sep 2026 07:35:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 71FB7362
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 07:35:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 638A4811DB
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 07:35:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VDCpY7PaLmTG for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 07:35:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7158B81196
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789716954;
 b=CZOU9CGTJFRv+0iSAdtR+DJGep6SVbbYsQtOi4Z0tS0NM8jyZrhY8Q8uHoIcVYFKzs/U
 q2AzJQCEb8DMsNJoC1U4MgCxpOkP4m5g2BD+vl/rFv4xc1ACcOjG39Fn3/3dZmrDIuV6G
 dXOUK69AXoignyxXUjaRgmGzdBTfLuqSFGpOMq8lapsc7jxbvo+/BlUFfFWaBvzEzZ5dn
 IgGmShgi1sj65qs5RMTGRFxgERK1K4npEftotumzjthfyKGQtaGMnsLKpy1gXWqsaoeJl
 b8zSUB4uVZbwTu1tKBXzG4L4A6uZya7Yh9/JdbJAq0x4APJ0A9P7pbVtqCwQ04guPOQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789716954;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=kra+4PYA8zvZaXpHeBLe9gq0VqyGynHlLt0rLXEHtMY=;
 b=nSTIA9KNFKilPo3yN8L+/BNv6Cyg64sI5maVQgXUdC4Cks3LCbS3rhHOvkAwpGORdR56
 kbEOvpdViJnUWPe8CCcDS++FgXN+p52Lr4LGnK3v8l+T+jXZMLqvWjhCGifc+TtxfaOL6
 eCyPgrgy0mqhegsma4+aIMAcS1w6uX3rg2YtUs1Z3S10ZX57kgXjvc14byh8kb2CYuzdF
 /u0wY0qke7v1QKKlNfk9CYmHTNI03goOk4rw1ea5tW/zAy0f8oN6i0adDC3DGqdfNpmmw
 TYwNGm2AUcRqkhwwYU1/D5foR2uG5jE7gCLdWtbydINGMTuj4NY/7XcrX7omR0zQAIw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=xBmzMsxL; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7158B81196
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 07:35:53 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 368DE4E40786
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 07:35:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0B0C560649;
 Fri, 18 Sep 2026 07:35:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4701A11C7B021; 
 Fri, 18 Sep 2026 09:35:50 +0200 (CEST)
Date: Fri, 18 Sep 2026 09:35:50 +0200
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org
Message-ID: <aqzp0dL8vARMo5Sq@windsurf>
References: <20260820120253.901607-1-yegorslists@googlemail.com>
 <20260918072248.1496007-1-yegorslists@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260918072248.1496007-1-yegorslists@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2] package/cannelloni: security bump to
 version 2.1.2
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

On Fri, Sep 18, 2026 at 09:22:48AM +0200, Yegor Yefremov via buildroot wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> For change log, see:
> 
> https://github.com/mguentner/cannelloni/releases/tag/v2.0.1
> https://github.com/mguentner/cannelloni/releases/tag/v2.1.0
> https://github.com/mguentner/cannelloni/releases/tag/v2.1.1
> https://github.com/mguentner/cannelloni/releases/tag/v2.1.2
> 
> 2.1.2 fixes CVE-2026-37539 (CVSS 3.1 score 9.8, CWE-121): a stack based
> buffer overflow in CAN frame parsing, in parseCANFrame() in parser.cpp
> and decodeFrame() in decoder.cpp, allowing remote attackers to cause a
> denial of service (crash) or possibly execute arbitrary code via
> crafted CAN FD frames.
> 
> The advisory names v2.0.0 explicitly, so the version used so far is
> affected. The CVE is not reported by
> https://security.buildroot.org/master/component/cannelloni because its
> NVD entry has no CPE data (vendor and product are both "n/a") and can
> therefore not be matched against the package version.
> 
> Apart from the security fix, 2.0.0..2.1.2 contains only a handful of
> changes: undeliverable frames are dropped after a timeout on a broken
> CAN bus, variable length arrays are gone, the default remote address is
> fixed, and pthreads are looked up with the CMake module instead of by
> hand. 2.1.1 is a maintenance release only, as the 2.1.0 tag pointed to
> a commit that was not the final one.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> Assisted-by: Claude:claude-opus-5

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

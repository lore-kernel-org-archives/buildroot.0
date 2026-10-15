Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B31CC6B38
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 20:12:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C01A8121F;
	Thu, 15 Oct 2026 20:12:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R-9kucHvm9f9; Thu, 15 Oct 2026 20:12:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 58C6081212
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792095151;
	b=EIf4q+KeTGTLq9Mus1Ox7qeKhDahMUlnQ86aL4xmJUt7czBhjriu1XOwBSIPsXInRgjX
	 XXzdUQ8oSyc0a9bFgWsjQqH3AlSyqZ7UUTYGRjAIlOLu+4lf9gGI0KDP3u+8ZrRuXrqE5
	 ZB1dbBwNHfSP8obonSfRnvRZ5zyDzl0n42c23IehjFIjJB5MMSZuCZTMAr4bi1JCDePok
	 3LtnjEffv8hYGY9EwntwSGpCM7sjdfWXXPNr69vv6Ge7RuQl+TisotKA9Qsf1nbdzTMfH
	 VGUI8Fbt3w6urHWkHqQiuoh2hHiPZebBzJRKu/rjsmNRihQExZtA27RD01xVYfhaMNQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792095151;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=whgKOtrqNkOS25fbjEYxzwkG/mm0N0mvsOP5zqzwv5U=;
	b=thZZLOrlK804h8teMlB9cSG+oPt3sQFUxp41pTzKWc7gMqCbGsu0vG2pmQ2W4wMpD701
	 3DRGaOaORxeMdQC4lXh3WNH4DWXUb2PfCJv58lOLo/5b7kJg3YXRyUH2z6+dtkBJeTGHb
	 UpgNl14ez7XA32BVaYT7T9+lyt8U0CJMeRTnUIxKkCMLtn1y1xNSBeGpfafCeMlSKvT88
	 gkvuUbqu42pA4bguZt+OO3fKXNP3p81l+0fuR9DMNt2v8lGhqFMhoE4Gwd3xd8jBhs8Nc
	 502ZhuCY2+wClxhwJ3PJ9N4oHtkhWHJZDWXljVrT7VaM3RpyCPNH9sqAAzldkCLBljQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792095151;
	bh=whgKOtrqNkOS25fbjEYxzwkG/mm0N0mvsOP5zqzwv5U=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Q2a6i8ZQHsTxywmBlm0mzXjnqdtqziVnJJWbV6aPrNVIATKzAeRTTnq1AZCQRwfPq
	 O8BWZrXRJclrMEz0ETK4VOPHgzSMwH0g6GmrYX1Zo+HMSE0VbTDbhamAY6HIIAV4g1
	 ypnkpqZqULFl2fsTCFmNF0VPk2iblVM8iGW80PJtc74kBzcWlsjN/Ec4lxw3fyWsOX
	 3Hq+fQSRGGhC7CBETDC5TXIpEHYRnpUf5ZIqQpUNYydArzIQSCWP8rgco74SR7wvSp
	 PHVUy3cTFgr7gEUDf6+Cj1zwxOUvXXGdAgkxbD8T4YRgDtjfZVlJCkM64b27VoAlA5
	 NZiPL68vqe/Hg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58C6081212;
	Thu, 15 Oct 2026 20:12:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 311CA1E9
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 20:12:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2EDBE81212
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 20:12:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YSwJDDQ1jn5M for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 20:12:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CBE6D8120D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792095149;
 b=eFO66kJ9g1FJ38J+PROjv/nQCo9xH1oCfmbxwYTw3C0AZSInwVJ6Tc1336tZZM7Um6yK
 n0POPAUyoBTVEMj2cHvhFNYnqwWnLr2Tyr4DV5/XXBwIxh2sGf3jQPLDWvOO0m/cZLlPO
 u4FbwAAlHHn1zCh1HJHvdxIZlypNv6+9dd93cTLTq58CtSinELo2r1vhzaQdlauwZ+g3w
 AtrIvO+dn/aw2+tSpRrYN6XUJWyImkIcrsw+eFzWZaqriSA54J1ye9vaJ3VBP+9b7Uj1C
 S2axqXpb5BIBIqrHHzgyqjY/eGj3lYezbk+uRz25DcNnA4vvxfLVhiKxyImaR5oO2pQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792095149;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=nZWDcx7i11yd7FTD2YGGWwa9xwbQ+A28pE8yRzlVRU8=;
 b=o53EbY1pELnendDD+WZ9lS2+I/TYqc7HRHnvSCvn3rEGIwEXo8Cp66A6kV9U3XbkjfSh
 2p0499Vpe3Bch6t7hOcoG1r/R/QL+vjrWBxXREBibCcTtKiv+EngRVwXUSoJbztJ2wcjt
 mqNEJ4eaYPqUgENculNvNs7ytchnqp01MKbWD7W1H3mJjAP2QP5WIepl18iK1f0dxUYqk
 kbzqZWHPBD8qFWYLZwEAEBTrgIHDvMuG021Plr2KAgBjROEoMOMHthCRX6QeJlxyWgJ2f
 3VBpxz+vlJd3GkR9KuZi+t7DL8JUiAh6RwE9+GeWuo2I88m1Dfx5+fOKSQPtqVGe8Ug==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=YgoZX2Fq; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CBE6D8120D
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 20:12:27 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 6835C1A1248
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 20:12:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2715F6075C;
 Thu, 15 Oct 2026 20:12:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 007CA10328C21; 
 Thu, 15 Oct 2026 22:12:19 +0200 (CEST)
Date: Thu, 15 Oct 2026 22:12:18 +0200
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org
Message-ID: <atEzmhQXuUzonn3H@windsurf>
References: <20261014141957.4171446-1-yegorslists@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261014141957.4171446-1-yegorslists@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/2] package/libplist: add host variant
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

On Wed, Oct 14, 2026 at 04:19:56PM +0200, Yegor Yefremov wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> shairport-sync 5.6 needs plistutil on the host to build with AirPlay 2
> support. libplist builds its tools by default.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> Assisted-by: Claude:claude-opus-5-5

Series applied to master, thanks!

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

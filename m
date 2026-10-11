Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55DA0CA9EC9
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 07:07:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0872A80F74;
	Sun, 11 Oct 2026 07:07:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cV7qxMFnqgvW; Sun, 11 Oct 2026 07:07:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 706EC80CB2
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791702450;
	b=Qa1GaFQzNDtuS+9xMb+69DUwJzwMjAVACtBsNenKaxm4y26eOlsgj9bh+wVfFFT9q8AY
	 Mh7zflgjCSWiyoPBmbrK86XHGR860kDxo9+PRZmrYJqQteKlwhM/O8359I2dOsmPISeVw
	 3ijIo/Iu8EgogR9RlpZa98Z45+ez8u7T63lOpwV2YvYBPlwn8a121DAnkK5HnXQHRw9QX
	 BMmebeto68gn3IGASG+TQwbfcaVFYkyHDGh3IUrmv/t6fG9SMDX0rl+SB9d+B1uQiNDNE
	 tgm7nnqsOAgoS2wv5wsWKeTT1JBZAWRY3gYrIXuLdoLnU5Y9VmiCbJeMZXmkYlhUFpg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791702450;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=TaPn6aor7VP1inLBWiM01RHc68BYVUNfZX93BUuHDIk=;
	b=Ki5BJmrMvXuWUdQd6gsWJvZXsI059hIfqOKO9CVaK9fP2DD21Hi9FFDQnWcmyD2p5KpX
	 h3P5/82nUOtWYylTTDbppUzW9ZbFwBWZBztjXIslE3knLqiZ1+DsgvlyhS0WpMLgGiHHE
	 LnqJKhF1AYctqYKF/xQR7Z3RiOmfeJwMW8hDxF+wrx6+7re0hlKCTThdOn3ZCyzlBV8V0
	 gt0mWUTcnT0L9ohvDfulIzdv6gqzbxisYL3SjDqoX7a2JvVelTX8qPF5wANJJK2oGdj00
	 oIuH3/gTi50CXTcswYSvs3K/2Q5wc9wMuWXVp/DcDP6lsVJnL8X9kZtIOr0nu6lmIng==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791702450;
	bh=TaPn6aor7VP1inLBWiM01RHc68BYVUNfZX93BUuHDIk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=A4m1qQhEsboFBZpoPCg07ClLyEoCCq1QrJwlJ4AHWt9m0ELQYh64BNfWaAw9QLRvY
	 kmn/NN9o6cFY/KJSpMsUsaZTH9cZ5smeqaaCQjFA6lTY8zxm5mraXdt6WtPCHaWzw2
	 DF9KeLlY3RioLLI+M+q3Vl3qN/6QcsjP8stLjagJsZNbFVz+/wvH784X1WQanPt7aW
	 3ZYNVIgwRgvgmaE/T/iBK0WFgYQ95mDJYKydRW0l6iKd9EQ5FeR6+UVsxEjjc6PE7z
	 ECZz7eAJGL2XJ0MoqVBPIRuQvXCEUToj3ZJka86lMn/dOoVJ7I+Wk4+xiYRLAokm6O
	 ZL7qyICElsaCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 706EC80CB2;
	Sun, 11 Oct 2026 07:07:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 602161DE
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 07:07:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 30E6B40556
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 07:07:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9IYJ16xos7R1 for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 07:07:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B51244062A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791702448;
 b=bF6ZRGDxbRLWc0lMqYg872wT+pgMcP8y+xGEKAh1aTVrpM3A5FNiItNxKb/mk6v2l1KD
 hhkPOpVaFz7/GjwQ3bTjb6nmh8U6+CCMP41yWqhECWbRRfbtqpm5qCEWV0KjB55STQDBX
 EWqRSxzG6zgH5xbIb8OuySvAuD6vr+oBQz6z8zyvSAM8sDmFxsfnwX8ch6vvZvxroYmTE
 0MEmKxv+MfA6cF5aJ4X8BvZ7OJD4Mx2XmcnwEtExGcwipwfSLPxa6gCUuvlo0ZFAYZoF5
 j2sujN6gbnhGFfze5JyAzkgZ4qG/rIxzyWuk2Zx3cYQ9pignywnKqYlQGzkQxfDwzUA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791702448;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=+qo6WQ8BVEdwm3MuuJvMJWfHmtAaMw9iZ72gjR0T8e8=;
 b=C91qX+9sCDxjUatV6xNCr2VI9Ac9UjmxtgBGSNFotBLY+doMkzWie0+F0YEtiLtk6e1Y
 852NSfaHx3WiiGUPgrIMj0iIDvOAP1ElH8lEUzdBCWtmDek+XP77aRmzUdQZpoI5ChSL1
 t1twUdpQ3S+dbjZdtv6J4Xs/uGzMdewerx0+K5pv6Up3XWRjRiDgEEMN/z1aOpG3AHEGl
 Bd9K24XamkXlRY4zJ8HPda5D1Yz3eadkQK22vuGOOwmZG4v+GZQBku0VOgnmzknrPhQlK
 I7vsb5MxEilkrcNV64XcL17vcWaGhsJLrfVY/uZSFS67Rb3uzcNIuQjMTYGTRBROzoA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=uJbZmfCf; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B51244062A
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 07:07:26 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id AE21C4E410F6;
 Sun, 11 Oct 2026 07:07:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 826A2605CC;
 Sun, 11 Oct 2026 07:07:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6A35F11D70215; 
 Sun, 11 Oct 2026 09:07:23 +0200 (CEST)
Date: Sun, 11 Oct 2026 09:07:21 +0200
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org, 
 Shubham Chakraborty <chakrabortyshubham66@gmail.com>,
 "Ernesto L . Williams Jr" <realcontrols@gmail.com>
Message-ID: <ass1mzSJdj9Jaow6@windsurf>
References: <20261006110714.3242851-1-yegorslists@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261006110714.3242851-1-yegorslists@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 0/2] package/szip: replace with libaec
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

On Tue, Oct 06, 2026 at 01:07:12PM +0200, Yegor Yefremov via buildroot wrote:

> Yegor Yefremov (2):
>   package/libaec: new package
>   package/szip: remove package

Thanks, series applied!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

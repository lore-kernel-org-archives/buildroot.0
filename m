Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69CADE668B8
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 19:21:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41FD14098F;
	Sat, 20 Dec 2025 19:21:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B2JmQfOrbnYj; Sat, 20 Dec 2025 19:21:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 743D24047B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766258509;
	bh=XRLSIzbB4gVoBiXUmISezY3/mfT9droxTEt3BWY4vAk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=m/rXSurPgaZXTKIBs726YfYb19h4ojxQnZktCbi2Im0wQKdd6IifC/URKm9o3yZ8S
	 hwFBKjugHLqBPoLGWJ875wp+wXscX0jz2KSzYBIPJUgrRGs9mOkL8dyd2eT6HG8Do9
	 WzudLPptsHf1P+ZU9QsD/EhyYNWPnKDKspy5Nwc78QT+p1f+G9ibIZe78PORr7510Q
	 JnxZvmVEPDSXVsjxDe8OnLQ5odVOtPriHTkbOmXeTDcdP6d30zNPxb+qJkhbvn0MOr
	 au1iqC4QNnJJ47jw1FCuygx12g19zaWw39Nk2J/za49kpluWZ7TXmeghALDi9xSdjA
	 EP6wHGCqNj4wg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 743D24047B;
	Sat, 20 Dec 2025 19:21:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A91F119
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 19:21:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EFA934097B
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 19:21:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IVhvhHHju_EF for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 19:21:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E791A4047B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E791A4047B
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E791A4047B
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 19:21:46 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 8A1F0780368;
 Sat, 20 Dec 2025 20:21:41 +0100 (CET)
Received: from 2a0d:e487:416e:b4c0:bc35:8e33:c88c:ebb9
 via 2a0d:e487:416e:b4c0:bc35:8e33:c88c:ebb9 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 20 Dec 2025 20:21:41 +0100
MIME-Version: 1.0
Date: Sat, 20 Dec 2025 20:21:41 +0100
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20251205122713.600576-1-buildroot@bubu1.eu>
References: <20251205122713.600576-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.12
Message-ID: <2f26378883e0536ed7ed3c67946a7688@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766258503;
 bh=EpNny5Cuv+9NlRYLYr8U4oAsjOTIi293ahx7ctZdI9o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Tdq7Fp/EpvC4hE2JkTNQihQWl1vR93xTn1CvioSg/2Nyy084tBOexLWomK9wMoYQH
 sgo1VYTxz6j3CMWPOzvizK7Ip/QW7Jf4uwct7GtIO25qlbAt1WP86W4e0+F2kBVz/H
 4WEqdQ3V0KKYESi1a04vwQ4DapF+qVyEaDRqCAXC1wTu/J3fIY1RCpqShZED+1Zkr9
 4JAxxQgxiBz8mSe861R0wwSIk3VYdDcqgYSCeHqa3kHd/5IYxFA3XlBT56ChRz95P4
 z4qqc0uiI/LB0BPs2kP0kPX409V7k3MzGG+TWE4LhpaowSC1dZddH5VsN+Qnb4IQ/7
 dsifm2VmS7EWg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Tdq7Fp/E
Subject: Re: [Buildroot] [PATCH] package/python-anyio: bump to 4.12.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 05/12/2025 13:27, Marcus Hoffmann via buildroot wrote:
> Drop dependency on python-sniffio, that's no longer required.
> 
> Release Notes https://github.com/agronholm/anyio/releases/tag/4.12.0
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

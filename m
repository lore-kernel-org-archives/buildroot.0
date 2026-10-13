Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D23A8CC6B1A
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 17:57:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99F5640797;
	Tue, 13 Oct 2026 17:57:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 87OY11M0XWbw; Tue, 13 Oct 2026 17:57:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BC1F440774
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791914230;
	b=q3ly5nLtPebNYuYcsYw/Oe8AvZX3+7BZhWuEwuQaoM9xDExtchmL8Vr5J1AYun/fx8Wb
	 ARZ7zY8cvp0JwacR+NGsCzWOfIBHqKdT7QyYCbT1Da1PvwQSNRF36fKWrXxZGCMSqYsfg
	 VHdK8JnCmyitM0EzPuxkuIYDo1gfjsqirSbLTuSzeFPV1LzufSSdoO/JiLO1CGthu4IdA
	 iki8XmKDW8TekrHOn6rqGQSwYYdTo1wXCTMHJKYu8MbiU6kKTSpGokGEFjFezvjbft9XZ
	 ArNJLwZgnKVGXytsMARLPmwOgb97lx+t4b9KvxZuGzwBT1mU/NRKYRbUHgGNTP1Tnsg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791914230;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
	 X-Rspamd-Queue-Id:X-Spamd-Result:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=4qmb+5f7DvsofvdGYAor2q/atOwEkedCJHIEiDQ2SvA=;
	b=Cdmajhb0zxeXOPUt4AijUUajIpfov53Knjg3mEV+yab/MDGCmFVk/NzQtLY6Gt3VG1by
	 JE6PwGHxHuK8Dmd30+A6hD/eVVVkG44wnPHSsd9KwJq1h3fLQ92m2W7bLZWeSiybCm9Rp
	 cYkbDEJfbDB6T8gAfoc8ZUQqxd4ydlJL2hk2VnhFek9Mmt09zaPSevjZJ66hqS8XkY7qA
	 Pex9lv1H/lMoursHlDjubDUCDKQkHhW/LXSjE7k/tkqs5/MACMm6UPwJUdtADmPnf7lxI
	 JhqSbfE5Sl3jo+QcQuqrA7S3N9gAWp7D5xNQDbOWhGidjRqIw/j/SBrNBQUC6I3bnYQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791914230;
	bh=4qmb+5f7DvsofvdGYAor2q/atOwEkedCJHIEiDQ2SvA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=S4waXc/hKAAantvcEtKB0scNb0U5PGgvx0NnDU6eu+vU+MZJ+QmChN7m/3bhcWSn8
	 JeOdpsdpjf/yKEBPclUPT4jnyXNbu1VtdDpUk9gUcOJttyAv3f71LsrUCSLucrXApj
	 NI5QopvaI3pDE6KUZUaBsjz43+pJAcO/6XSeWbNc+1xZv5BB/jY14GXwhn6TOXCsWN
	 tdc9Wi+SCydKsPVg9rg71nZD6lkqftLPzBamWqxYmjw5RFZOeEhAWBfZWJjB8ByvAO
	 WUBJfIQEKooKvGOLYd/yEHsjClyqh9Xvar0r7u2jC+oonR+F85Kv5UsOTHHTNYGjLZ
	 l/NmNKfmX1ROw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC1F440774;
	Tue, 13 Oct 2026 17:57:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 35FE8362
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:57:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1BFCC80BD6
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:57:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oLyJkaFOZogK for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 17:57:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1CBF280AC4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791914228;
 b=NUDkj3xhM5Jzq1Xm9xQfaock+i9j+7KYK8+MX5lKRiY0VM1TX3p+MuA7hdpgiJygCXKk
 NszZXALOcQAIMh2vW9jND/SWA2ETy9Db7cRXEHI+ZLcM5Aq/TFq8G7CR27zgobqRDM7nB
 iLR2ep1mf/c1xwxnfEfnx7NK3n71YC5btPiGSopf47UCIzYcDZGGMn3bCcvFshgZZDMOe
 qUB5oNHpb6nmzsE/cVembytxscZJ5B22prxHulqGoTXxfD8Sdh+llGB4oEZLT+y5b7S2A
 uREftofj7MpahYQuIFVBQTOS0GdXS50kHWWtZeSs1VFzjRUiLYP/YNybWSGPEaWr+yw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791914228;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
 X-Rspamd-Queue-Id:X-Spamd-Result;
 bh=RbX5V1426VH/4/wqaNfmPKAem581crf4KG6iPuHFwog=;
 b=aXGSoQHrY9pxdGGm8cX9wNwoUhni8AhLRBnbLtCI/X70q0W1Zfq8mtTn/y+9JYZdVWPh
 vGCbkr0R2N1NwO9DzeMuGTIKNgfcBhvDGcwCuthm2p1Slhay5QW0qryhcjGqTZ4xYG8qK
 OPlOHKpYTOrkp1huLMQxXcIhBhsAtC2FREYpkUTTi9K6TYDoowzNu9xauVS5ooaLgUeLz
 sp1uS4ONjmkm+OTGTRsqxrKf/47IOxBbpVezg7pFOIIa+3cB8fgS+W62GCAU3hNd/uqby
 dy2yl5wOh/jCTic0sCMeh/stpDaGJQ147ldAY6XS+pTaQR9UonD0tdpzIEbbE37FnaA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=hVk9Heix; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1CBF280AC4
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:57:07 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 6CE36C653FE
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:58:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C68C760362
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:57:05 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
 id E7F0611D718CD; Tue, 13 Oct 2026 19:50:16 +0200 (CEST)
Date: Tue, 13 Oct 2026 10:01:53 +0200
To: Alexander Shirokov <shirokovalexs@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <as3lJQExNv4g1muo@windsurf>
References: <20260617161331.141666-1-shirokovalexs@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260617161331.141666-1-shirokovalexs@gmail.com>
X-TUID: G0BThrcff8P+
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: E7F0611D718CD
X-Spamd-Result: default: False [-2.89 / 30.00]; BAYES_HAM(-3.29)[93.78%];
 MID_RHS_NOT_FQDN(0.50)[]; MIME_GOOD(-0.10)[text/plain];
 RCVD_COUNT_ZERO(0.00)[0]; BCC(0.00)[]; FROM_HAS_DN(0.00)[];
 ARC_NA(0.00)[]; FREEMAIL_TO(0.00)[gmail.com];
 MISSING_XM_UA(0.00)[]; NEURAL_HAM(-0.00)[-1.000];
 RCPT_COUNT_TWO(0.00)[2]; MIME_TRACE(0.00)[0:+];
 FROM_EQ_ENVFROM(0.00)[]; DKIM_SIGNED(0.00)[bootlin.com:s=dkim];
 TO_MATCH_ENVRCPT_SOME(0.00)[];
 MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
 URIBL_BLOCKED(0.00)[buildroot.org:url,localhost:rdns,localhost:helo,bootlin.com:url];
 TO_DN_SOME(0.00)[]
Subject: Re: [Buildroot] [v1,
 1/2] package/aichat: require SSE2 on i386 target
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

On Wed, Jun 17, 2026 at 06:13:11PM +0200, Alexander Shirokov wrote:
> The ring crate enforces SSE/SSE2 availability on x86 at compile time,
> leading to build failures on targets where they are not supported.
> 
> Add a new dependency to avoid selecting aichat on such targets.
> 
> The failure was reported by autobuild [1]:
> 
>     error[E0080]: evaluation panicked: assertion failed: cfg!(target_feature = "sse") && cfg!(target_feature = "sse2")
>     --> /home/autobuild/autobuild/instance-38/output-1/build/aichat-0.30.0/VENDOR/ring/src/cpu/intel.rs:26:9
>        |
>     26 |         assert!(cfg!(target_feature = "sse") && cfg!(target_feature = "sse2"));
>        |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>     evaluation of `cpu::intel::abi_assumptions::_ASSUMES_SSE2` failed here
> 
> [1] https://autobuild.buildroot.org/results/c38a21c80490d5012c5b7bd926e778b406b5f26a/build-end.log
> 
> Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>

Could you trace back which version of aichat first started exposing
the problem? We need to understand if our LTS branches are affected or
not. Adding a Fixes: tag pointing to the Buildroot commit who
introduced the issue is best, like this:

Fixes: <commit hash> ("<commit title>")

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

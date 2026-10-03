Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99BA1CA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:57:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FDCC6109F;
	Sat,  3 Oct 2026 15:57:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Xsur31GZIo6; Sat,  3 Oct 2026 15:57:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7C07F6107A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791043044;
	b=YrYZhJQsPIEjaqCxHKOe4eu4aPUrbi0i9y6AfhxA6kPv68UXfBjgvuzv3kQPNibnFlCi
	 WOpv7RASnwGRejbmm6izmjyfYPTqTEuGg3jV4eADYzq4KDbZBKghPdRbIhNrySTU8hoE3
	 W8phXqTC8f0kFzCgj/VpcJwj+A5glE5O6ZqqNgeioS5y4ooULJHurWqfAnSe1z/MWQFdk
	 bcG/RpPvyLs4+vCRKTsDoIbsXQN4wuEHzH8RALPjNwl0FknWHKGTxrOH5Xcz/BGdEt57T
	 DOGkZRP5Zc9x4DvQG3gqpHlfWPtyiSZCW0upJO3HrpG80HNgCuscJKNKedEd811kjhw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791043044;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=tZ+Gff3B8D64Ald6KLxm4Hr5ge53tBSwDDzVUnQxX0o=;
	b=bvC0ZKKUPjbEwLUy+ifv4RGfWgINykv2izyKuaIz0iB44BTZJnRhnL0RFhOOGMbtX4Qo
	 HNajGNvl1O09h4nD4QPy3M1Q6c+RRhxGIvESRg+ZM1h6gLk/e/WhIgarkm28lgj/hf/av
	 JTXEIHqWy6eY5LWD3pFWMrbpB6gqkkA9074G3uyfGYS8QsLMchbxmeaka0YpDqF18/X71
	 ihX1XjVF/P4ztCHn1c4aF/8UsjIBnY/A3NDzur2dEmD4o8UA7eon5ojRyAk1L+PQR0mqp
	 3Dtf4xSB5ZJ+wLUqAUooHKrs+op6Z8om0xZNI3L7CZPx8EjympKgVxWsZnZAxQCj7UQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791043044;
	bh=tZ+Gff3B8D64Ald6KLxm4Hr5ge53tBSwDDzVUnQxX0o=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Z1Sm8TcH0uUISEvPe6PwRa2Lqzck1imnQvRrUYott5kfOGKLT+BtQl1Z8bluj+uyL
	 usa14eurTV0ni7hpUfLArRulsEMxtsya0P/tczLYpAePH8sS8aAeby5ue11FHyRqUP
	 sQUPKlPxnnDgM+1VbwcVRtZkNYTMLQ+rrotQ8bPDXp0fLr1AwP9oMB1Gn8dBK/TmM6
	 0g5t5VG3YkX6XoIkbBtt3CVWE5rC7g4L0IE3WE+QdMBH+22FeIjQQr4d+0rHnM9L6t
	 d37JiSJKDluZ5vY6VXkEpoGPJta7bmbtPTPpRmylbf2Y8jEYMXwpx2ErBvm2MMAaeb
	 2KsGeCvei+NuQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C07F6107A;
	Sat,  3 Oct 2026 15:57:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B4531D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:56:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7B815815D6
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:56:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b-5onm_HzW05 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:56:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E6023815C3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042966;
 b=onoEe4z7VQyRwF2PPBghaTW6JIyerH62uINGZWr+S+Ga5pmSeHYL+Djn9rsXuiFB84Oi
 r7+B+wzuTJULzpeUWgVQ+QpokIofjAjtHGJHd2v+oFl+vSnYzRS1S+yoyoRwjQ8cFDvgi
 XAnc8QIwStIR55RiDktoGILVxeiHV/jTJvzNdLoYae4GbD8Yp4NxreQ3N+1dh4+exVwOu
 4tkYTZ56nTpLucRWk6SWEE8CUZ1wqKKGGcMSBDbe3pqV8rVC/zk8A3XOYd0HYifATk+fx
 0P8IDTq0azqYCCxjPMeL/LefluI6RzwdyXIiSBMigBoS4BKzgAtafsLui8hN9r6PJ9Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042966;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=+pYXD9Jl//3m0AkFnSs38X0b50JYxHg3lE4PlNNIO5c=;
 b=SJgpoJGUg2hoSi7ioI1jccp0feNVf9YvqRESWaGyl/BSKWmF/9W8965U3JY1ZRxySLNJ
 B6jle92HWcUKXZtm9BiXajL/Lnz4pjXigojLu6KFKjUMA0/B5ZvEMcSgzNTbp1AiJWSuV
 gjIL3KlxhxPBsaOZMncgAsRut5aS4wceb8x5N8w8bQTDeBb5mcZZgJboqLDQbOrtkmTkM
 Qt5fruEzLwWiWhnwtyNM2vqL/matAGbjV0wS5BDZa0sz8IUkTezpzh756mA8pcxXlNV/o
 xFO5/VhfeQkn1XMeZezZ/oRYzeaHzl4Wznua+arL0nCvUKJIlbXCy6dBvf7jVnnRyRg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=cRNo2l2b; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E6023815C3
 for <buildroot@busybox.net>; Sat,  3 Oct 2026 15:56:04 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id D92151A1108
 for <buildroot@busybox.net>; Sat,  3 Oct 2026 15:56:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A782B604FF;
 Sat,  3 Oct 2026 15:56:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9C24B10328318; 
 Sat,  3 Oct 2026 17:56:01 +0200 (CEST)
Date: Sat, 3 Oct 2026 17:56:00 +0200
To: Francois Perrad <francois.perrad.86@gmail.com>
Cc: buildroot@busybox.net
Message-ID: <asEljI0UnKaey6f_@windsurf>
References: <20260929175341.2329-1-francois.perrad.86@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260929175341.2329-1-francois.perrad.86@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/haproxy: allow Lua 5.4
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

On Tue, Sep 29, 2026 at 07:53:40PM +0200, Francois Perrad wrote:
> see commit "MEDIUM: lua: Add support for the Lua 5.4"
> https://github.com/haproxy/haproxy/commit/08ed98fd7963968de49593304fdd9234812845a4
> 
> Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>

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

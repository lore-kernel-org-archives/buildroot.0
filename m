Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B20AFF8850
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 21:59:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 414E540B97;
	Fri, 24 Apr 2026 21:59:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cT9d4NowMDDz; Fri, 24 Apr 2026 21:59:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56FCD40B84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777067949;
	bh=t5gJFSnt9cXJVOEZCWMFpcbfQOAjlA3/QRkqKzysRkA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=W5Tl4p26cMgbu5IHrzy/uFBS/iLbh6gZ/Y+vdFlxvb+GlR7lufJaVUgD2wRBYlx17
	 9TDVehtiZ+njx4jS+EaB2InwC47yUei2ZZldTjKx9FFI4xX+mXkj5ZccszK9dWAmjL
	 e/qIZ/ojibtB5Yn06t0LfhHD/eb17PRBkMdBxgtKNFZvQlZmlv4HrvbqZsgErUyVUL
	 UND9sVv0XqIBoE3Xkl8DfmhU7CEpBqMFQefL6T6dhRivmLx8tswYTeQAqjGFTZK0Sm
	 X+EX2WTDMe5f9KiFRhefeR1ctx5pu6boQznkPKyLHM2S33hRRpg4TdfHz80tuWtbqA
	 5nkA1+5s/uyhg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56FCD40B84;
	Fri, 24 Apr 2026 21:59:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 80AAD194
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 21:59:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 65C1E812C5
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 21:59:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LgXWgK1tvFPs for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 21:59:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5DAE4812C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DAE4812C2
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5DAE4812C2
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 21:59:07 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 067D420039C;
 Fri, 24 Apr 2026 23:59:02 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 24 Apr 2026 23:59:02 +0200
MIME-Version: 1.0
Date: Fri, 24 Apr 2026 23:59:02 +0200
To: Florian Larysch <fl@n621.de>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260413000423.9275-1-fl@n621.de>
References: <20260413000423.9275-1-fl@n621.de>
User-Agent: Webmail Free/1.6.14
Message-ID: <72837c9638f325bf86bc3eda417db609@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777067945;
 bh=XKcqqJbCXh3Li1r6/upFyNZE+NFuVXD4Om8pnuTeKYo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pK7nG9uQY76qRC3H5K40XU4C592R+SnPWACeVwj7+D2ezDXd8BiUCwDXeMBB/flh8
 /FuRaL4HwOSDEeUR1NkDhPRRKL23jpZ8W0vFD3MbeToBgjmdpKexaSNL4WQumgQN7R
 fo1TXZu1ZzRx8qNKuHY89hUw1BtiEGCMT43V9KVBqISIjzBQ5jQcyBWOpup49yk26+
 k/PaBD49GZGXWsApuTO8iX9OsMpoHijy2j3kQq2oSQbdyZPcdzEuZtOffNWEhnatVx
 bPdU2UvA6WcIAtPkeXM5N99MGwvSWL5ByIi4f1iZfNtPQ6ShPzED4vgFS2Gxeds+Ly
 NXeAbiNHeRqvw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pK7nG9uQ
Subject: Re: [Buildroot] [PATCH 1/1] package/flashrom: fix build on
 big-endian targets
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

On 13/04/2026 02:04, Florian Larysch wrote:
> flashrom 1.7.0 fails to build on big-endian targets because of an 
> errant
> compile guard. Import the pending upstream patch that fixes it.
> 
> Fixes: 
> https://autobuild.buildroot.org/results/d75/d75f5a555b7ad1a99ffe46298bf6f527f3bafbc9
> 
> Signed-off-by: Florian Larysch <fl@n621.de>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

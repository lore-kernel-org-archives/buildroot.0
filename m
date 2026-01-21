Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A4B8C44506
	for <buildroot@archiver.kernel.org>; Wed, 21 Jan 2026 20:45:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FEC260B65;
	Wed, 21 Jan 2026 20:45:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HzljWYHaKJtS; Wed, 21 Jan 2026 20:45:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF38560B5C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769028347;
	bh=FQnH4NvJeLMfx8lBoizH1d9kIm5Kw/XePhzWbZejzXM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CYHYtCe5+rCNsBMaTEhYSv2y+tjduxRD4nVwysc6Q9ORJJT/BurWLEBlkqsCkZRNG
	 EbpYkdUE6YCPG20dAfTdva564Y9M0cNqU1zVWNvBF2CVA8BcRNGtksbfSNcWkKu4Fz
	 RvwzPRl9wj6h8qCuYfOIpn/2plft96foRHjefxlBvWdotNDBgRqAT/IyvA3p8YluCh
	 Qa3YZrcSQrMjM5KL42ilawP8EnuG3fmFsJ4W9/5yrK8dTykKINWp51Jf69Pmu2diNn
	 bRVdsFhcFc1M+V95qBUCbD8GLLjGT7SJP31MbGO205pyD4OSUmuI/8WJumBCKc4gFj
	 taHoYxwwFHSOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF38560B5C;
	Wed, 21 Jan 2026 20:45:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 03832158
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 20:45:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB618812F1
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 20:45:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JOqUAXfOW5j0 for <buildroot@buildroot.org>;
 Wed, 21 Jan 2026 20:45:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 01C1181202
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01C1181202
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 01C1181202
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 20:45:44 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id A1763B0054E;
 Wed, 21 Jan 2026 21:45:41 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 21 Jan 2026 21:45:41 +0100
MIME-Version: 1.0
Date: Wed, 21 Jan 2026 21:45:41 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20260118152251.248976-1-ju.o@free.fr>
References: <20260118152251.248976-1-ju.o@free.fr>
User-Agent: Webmail Free/1.6.12
Message-ID: <541f09b80bfdbb707d261b6c3119240c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1769028342;
 bh=a4e82lBAvNwx9AmDmFiLZW60RBB3Ufw0ClgbtuVPqw4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tbZbLoSQMr9IQ8au+kSRcovJZ/O4bQiO/NpCvuLeR+8fn3Ngkmql0Xyur4zOuH2uX
 P26IRCrdgg2cQwzMiNlJ+ol9kDteqohVWLaTjtQelBtObgG/BvnpCKfQh0w5PBqndo
 EbAJZTDV7+Y63TK3goGKhEqIpFD7veLXbWXheupQ1b840vEOUhZCyV5hHqWQPrlZMy
 oGI6lnPwkg3eIxK06E/D1yv/mFk81qpww+1CHWIgjvTSppG0DmhR4zK3/rWuezJczX
 pQaoZBurj9SSmsfv3W2WnNGHNgATSn5oCCfckMKP2Y/9pc0tHKqZdk/hhKaOxkmHoT
 WVUnGxeshHyTg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tbZbLoSQ
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: test_python.py:
 disable interpreter colors
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

On 18/01/2026 16:22, Julien Olivain via buildroot wrote:
> Python 3.14 (not yet in Buildroot) introduced colors, enabled by
> default, when the output is a terminal. This behavior can make the
> pexpect pattern matching more difficult in some cases. See:
> https://docs.python.org/3.14/using/cmdline.html#controlling-color
> 
> This commit globally disables the Python interpreter colors in the base
> runtime Python test, by setting the NO_COLOR=1 environment variable.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

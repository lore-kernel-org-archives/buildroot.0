Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3F3AE668B1
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 15:46:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBAEA40338;
	Sat, 20 Dec 2025 15:46:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RC6PnnMN2pCU; Sat, 20 Dec 2025 15:46:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 014D9402FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766245569;
	bh=HaELDgT4/3w2KFWBHkNNmewzd9QTDfyV4Nejra6AfPU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=irtybcM3TbYZiZOWvckBxY//KEXcxHYZNI1LwbRdDXjU5j1cv7NT9jLPXJ2QBnNdT
	 31Ce6xvKw8VDAupiJLGADguhlcAOH5ygsQu9CnAXJ6QqbsU+dgfBQIAYca+5Xn844/
	 uDRLp9Y6FCteXJwYq3KWQ6DNcT7zbY6Z7dpxcffzOqpLot42N1jhSz9F2wv7e99wS0
	 p8WQ96q0nvX+71G7e9X/1XnUFWID1N6U322bHvFBW5rV6k1CA7/6aD7ZWn9l4Gh0ro
	 rao88ETKQ/3U+lH3ApwNQqemSXNgxog5LfNMm7GA85P0xWWsi3XZ34Zbh25PJxCent
	 h0PI0CdYDLeFQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 014D9402FA;
	Sat, 20 Dec 2025 15:46:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A74A823D
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 15:46:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D03880CC4
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 15:46:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id czxDYSFRTIqB for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 15:46:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ED1E780C8D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED1E780C8D
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ED1E780C8D
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 15:46:04 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 8215E19F5A7;
 Sat, 20 Dec 2025 16:45:56 +0100 (CET)
Received: from [37.167.178.5:29200] via [37.167.178.5] by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 20 Dec 2025 16:45:56 +0100
MIME-Version: 1.0
Date: Sat, 20 Dec 2025 16:45:56 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Daniel Lang <dalang@gmx.at>, Joseph Kogut
 <joseph.kogut@gmail.com>, Romain Naour <romain.naour@gmail.com>, Valentin
 Korenblit <valentinkorenblit@gmail.com>
In-Reply-To: <20251218200733.3570275-1-bernd@kuhls.net>
References: <20251218200733.3570275-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <b0b1813d7284c3a2a7fdefc9a31084f3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766245562;
 bh=rJ0J103H1zs8xph1oceTYZxp9FKl2GNA6Keu5/fMQIs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=u1MjMo0LnTKzyjSv7s0FA9me+zKbwvMVSAT0w5ePZtZDDkAeRD95FkzID91pXDX2y
 acqA8RNh6BG90/LUwHJxvpzLqVTE2fnWGrElJ9d/E48hTBB+R6WweCFItzSTrgyobI
 xHfzt/foSBzGyRuFMA0qqIMW7qTcekqMyv3hNg8e+SK7DDPlAkkivxYMVDpiJoXekE
 QHedOJrf1JxaMfDxb3TYRCxoC5sgK3J28MTHOJT4gg5/e0lqDRw0xnBfvhWttkeyR3
 fHEosVUh+3XAbd7KEb7K4kniDjJWlw2Y58o3Visre+oroUYGnN9JQJQoKC6Zey/WHQ
 nJ0Hp2vUFkVYg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=u1MjMo0L
Subject: Re: [Buildroot] [PATCH 1/1] package/llvm-project: bump to version
 21.1.8
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

On 18/12/2025 21:07, Bernd Kuhls wrote:
> Release notes:
> https://discourse.llvm.org/t/llvm-21-1-8-released/89144
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

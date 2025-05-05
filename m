Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F0C9C3ABAA
	for <buildroot@archiver.kernel.org>; Mon,  5 May 2025 19:31:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06F8440639;
	Mon,  5 May 2025 19:31:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xcaZ80js2-cD; Mon,  5 May 2025 19:31:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52F394064A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52F394064A;
	Mon,  5 May 2025 19:31:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D702D20F8
 for <buildroot@buildroot.org>; Mon,  5 May 2025 19:31:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B92FD4064A
 for <buildroot@buildroot.org>; Mon,  5 May 2025 19:31:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UU_ICdaQ6Pt6 for <buildroot@buildroot.org>;
 Mon,  5 May 2025 19:31:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D64D340639
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D64D340639
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D64D340639
 for <buildroot@buildroot.org>; Mon,  5 May 2025 19:31:36 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id C90C42003B4;
 Mon,  5 May 2025 21:31:28 +0200 (CEST)
Received: from lfbn-mon-1-146-106.w86-210.abo.wanadoo.fr
 ([86.210.113.106:37136])
 via lfbn-mon-1-146-106.w86-210.abo.wanadoo.fr ([86.210.113.106])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 05 May 2025 21:31:28 +0200
MIME-Version: 1.0
Date: Mon, 05 May 2025 21:31:28 +0200
From: Julien Olivain <ju.o@free.fr>
To: Viacheslav Bocharov <adeep@lexina.in>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250505101447.624822-1-adeep@lexina.in>
References: <20250505101447.624822-1-adeep@lexina.in>
User-Agent: Webmail Free/1.6.10
Message-ID: <39237a4bc6533dd51e4eb28cb2901e74@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1746473493;
 bh=PNwXHkpcbGZnJBBLeh1ZPttPoWNzedAeLpgcx/Fl8qw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UnCkSBYb6qrgJypegew9sEbcN/dAssmEmUyZ54exWdS4znrrgpxlMqAuHmNT+e5tW
 hzdqwz89gNOf6Wm/jNyh4hGScjFGMyHHR6kiyyLcNvNPbAIFHygCJmrBdY2C9i/rDM
 DbRxtm9XPQepMH61siIWtxRVGrqg+Q+2bNSIyKkZ6jNJv84xsEX+rL959uaU3B0jyL
 7YJDxjz7QKfeRmIYrZxrkZ6xxDQjhr8oAzSmHpz0IpoQ6SR0RMq7ttNHu4g5AM+238
 F0uRkqXzYi/7V8e17Xod9DfqNJoKIundZT72czPVIQV2YfTTQg2rUXY8yTrPCIs7a+
 jm5RXaxjIiHeg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=UnCkSBYb
Subject: Re: [Buildroot] [PATCH] package/rtl8822cs bump driver version to
 latest with support kernel 6.13/6.14
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 05/05/2025 12:14, Viacheslav Bocharov via buildroot wrote:
> - Update driver for kernel 6.13+
> - Fix warning/errors on build
> 
> Fixes: 
> https://autobuild.buildroot.org/results/464780b85739f323a21f9205634f6b51e3f2b916
> 
> Signed-off-by: Viacheslav Bocharov <adeep@lexina.in>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

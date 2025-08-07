Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D8DFC87FCA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 22:36:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01159402D3;
	Thu,  7 Aug 2025 22:36:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HYACCwo_eE6k; Thu,  7 Aug 2025 22:36:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39251402D2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39251402D2;
	Thu,  7 Aug 2025 22:36:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8370331
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 22:36:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 63514607F6
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 22:36:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f_oio2J3pQmA for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 22:36:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B59B8607F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B59B8607F0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B59B8607F0
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 22:36:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 73A9820039C;
 Fri,  8 Aug 2025 00:36:44 +0200 (CEST)
Received: from ip099.116-187-66.sogetel.net ([66.187.116.99:58704])
 via ip099.116-187-66.sogetel.net ([66.187.116.99]) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 08 Aug 2025 00:36:44 +0200
MIME-Version: 1.0
Date: Fri, 08 Aug 2025 00:36:44 +0200
To: Neal Frager <neal.frager@amd.com>
Cc: buildroot@buildroot.org, thomas.petazzoni@bootlin.com,
 giulio.benetti@benettiengineering.com, romain.naour@gmail.com
In-Reply-To: <20250806082428.1044021-1-neal.frager@amd.com>
References: <20250806082428.1044021-1-neal.frager@amd.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <dcf67ad3165a2cc0c29316863a199460@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1754606208;
 bh=q8Rvph9a9L/VSzijIFCeRt03DlVgt/SJyA9QPSo4qNQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=uSyCwg8XkvZhIWQqa99NzFzESnKuc8hmbpj+rB3MT6w3a9rrUfF+fU7OfQSd7jkp3
 E2/YJZlUdyw3JJaa4LWhmcxjquDJ9rEC2yIqEVYIJ200+j4clD/oAWB7079Os627OM
 g7kW+z6edjow3u5hxPtDjdj5w/of6yLKPNIswKTZirodnxSHNjrPyHPF1m0lXu+yDL
 8/YQErMxDiif5ko+pEAi2QlPEE1L9q7pED9gjwsFTEcENmAI93OkNv571QbNqHn5oD
 9RwZ+IcjZu0buWU5HRTckJy919b/wb1OMgmb0RIIa+Cc7ITl2IMb5gnMhdAgsqKN7H
 ULximiNT41kEA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=uSyCwg8X
Subject: Re: [Buildroot] [PATCH v1 1/1] package/qemu: correct help menu
 spelling error
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

On 06/08/2025 10:24, Neal Frager via buildroot wrote:
> This patch corrects the spelling of 'Xilinx' in the help menu for the
> qemu package.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

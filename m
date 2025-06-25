Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABCBBC77B7C
	for <buildroot@archiver.kernel.org>; Wed, 25 Jun 2025 17:27:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F64941F1B;
	Wed, 25 Jun 2025 17:27:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y3uqxpMoAHSu; Wed, 25 Jun 2025 17:27:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5A3741F10
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5A3741F10;
	Wed, 25 Jun 2025 17:27:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E880D43F
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 17:27:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CEB396155A
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 17:27:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cdJ19zCxL4EA for <buildroot@buildroot.org>;
 Wed, 25 Jun 2025 17:27:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 39C9460FBF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39C9460FBF
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 39C9460FBF
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 17:27:30 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 55B01B00573;
 Wed, 25 Jun 2025 19:27:27 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 25 Jun 2025 19:27:27 +0200
MIME-Version: 1.0
Date: Wed, 25 Jun 2025 19:27:27 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250624170834.2819257-1-peter@korsgaard.com>
References: <20250624170834.2819257-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <545d1c06dee21ea90411f68276455c14@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750872448;
 bh=cvg5nXWO7ZojCWExmN+ayMARByuaeVg9MAF+DldZTiY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DNwY8GPNAXRa65dP1K/2k+XRi3N9REJcxJM/E3qjV+0IRTCtgSL1jPkp4NHeQk08I
 SOL3iXuR+DZ4JyjjUSJj1yKOcsFXFAXMEebuvINSQ3X02wVJnom+ROVu0yN80OVqFs
 8sUvtgOPtgPQ793e/7dfI7C8Oz7JqV7uaq5hbi6qPY684vgXUl1ZVgMgLOYRl1hscr
 jQ2C1s/a1jhTb2uK20bmSwZB8WBrWc2UTgKU/9gmEAQdN+HFu8JO+jcia7aSk7jGcM
 VfkZ5++Vv+oatH6jtkHssNnBidtn5dE6735V9x1bODq3A81OtIPcSY9iuUw3gVOWSx
 AScqgL+lLRo4w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DNwY8GPN
Subject: Re: [Buildroot] [PATCH 1/2] Makefile: sort unexport lines
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

On 24/06/2025 19:08, Peter Korsgaard wrote:
> The list of environment variables to unexport has grown organically 
> over the
> years and is no longer sorted. Sort it alphabetically for clarity.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

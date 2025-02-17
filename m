Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB5FC021A9
	for <buildroot@archiver.kernel.org>; Mon, 17 Feb 2025 20:21:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49B8660D9C;
	Mon, 17 Feb 2025 20:21:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dZZb7xxVzx4Z; Mon, 17 Feb 2025 20:21:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C74960E4C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C74960E4C;
	Mon, 17 Feb 2025 20:21:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5AEF31C0
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 20:21:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3EF1C40017
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 20:21:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pQAiuoNdYstR for <buildroot@buildroot.org>;
 Mon, 17 Feb 2025 20:21:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 79BBD408AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79BBD408AF
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 79BBD408AF
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 20:21:48 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 7BDAF780506;
 Mon, 17 Feb 2025 21:21:45 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 17 Feb 2025 21:21:45 +0100
MIME-Version: 1.0
Date: Mon, 17 Feb 2025 21:21:45 +0100
From: Julien Olivain <ju.o@free.fr>
To: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250217123910.370880-1-aleksandr.o.makarov@gmail.com>
References: <20250217123910.370880-1-aleksandr.o.makarov@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <e76967be5aeccb65693eccbcffcf31a9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1739823706;
 bh=fsVeG1dmhgfIs+Y0dXmC3TBEpK86weioCooThdp7/Hs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=K8b7yHtVrPoahcYVWqv9aUxbO8BQNThO1Vq8fqotXw0YJ+7b9++AFHnhcBS1eI8m6
 DslWsKxN0uFgga0t8X0q6CpyzsQa7ppiBPvBbsiXftdVR/u8uaXniGiRkkSfA2wYo4
 Mb+nYdDyKHmRkfVlEPYJ+noZED1KfznNOa3gbDRNOuZYTwvrjS1sVj3tHRBESoTsKy
 4d6FbApj+BtTicMLHGYiCvExbpmjnIqdTx5+Zdy4TGmQmW01jaycwiswCIkziIROeI
 YMR1NkzwPEb46d6ne1Lb2XkNpVTauBpShqTRlBPGpDe9w/X80qVvDS+j2QdXNSWsBl
 Tf6xh3u3xYxqg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=K8b7yHtV
Subject: Re: [Buildroot] [PATCH] package/cpp-httplib: bump to version 0.19.0
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

On 17/02/2025 13:39, Aleksandr Makarov wrote:
> Signed-off-by: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

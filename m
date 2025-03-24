Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BAEEC36005
	for <buildroot@archiver.kernel.org>; Mon, 24 Mar 2025 20:02:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54DE680CDF;
	Mon, 24 Mar 2025 20:02:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qFKJ5mk4J2x3; Mon, 24 Mar 2025 20:02:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D95780D88
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D95780D88;
	Mon, 24 Mar 2025 20:02:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 54B76E0
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 20:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4612580CF2
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 20:02:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jKrGReudFNNd for <buildroot@buildroot.org>;
 Mon, 24 Mar 2025 20:02:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5270180CDF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5270180CDF
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5270180CDF
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 20:02:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 5E8455FFA3;
 Mon, 24 Mar 2025 21:02:19 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:57278])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 24 Mar 2025 21:02:19 +0100
MIME-Version: 1.0
Date: Mon, 24 Mar 2025 21:02:19 +0100
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250323190454.3336100-1-bernd@kuhls.net>
References: <20250323190454.3336100-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.10
Message-ID: <8fddf76a3f3ce2f6558a906d0ca360c5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742846540;
 bh=8ubuNLcHQPw19tt6m0ZFcsmaUMcLuokYmPfFScWFFlE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=uTN3pXW2IpNK3rY9lVPxWfQgXP0UaAWKHaoxnBIR1KWig//wvMUhv6ZvexfoSsZOY
 EhgnibJFrRSvGHuNoGJgdc0vADDQLwHmy/4GipTcSStNyr3jYC1/qnwdy7K6eGiUGk
 rxzH78etm2w9QGQ8qMN8+Vz4e109RINwMc+AkrtzYmS9xzetP9mdRyfsEkMzhTolgA
 eXLzkg49T7G/43G8hX6JMfwtxsk/oAEOwLnbrevCz8UnTMgGMLXHmE4f+O7k2pdQ2v
 w6p7XTwrUtvmxyo7V8UIo1BMgoL6rcEdihuWaRJYVdzV4RgaOghxjkyaFrwawnp3aW
 o6GAlUYzT4LxQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=uTN3pXW2
Subject: Re: [Buildroot] [PATCH] package/ytree: bump version to 2.10
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

On 23/03/2025 20:04, Bernd Kuhls wrote:
> Changelog: https://www.han.de/~werner/ytree.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

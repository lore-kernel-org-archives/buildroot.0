Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FAA5CAC5B0
	for <buildroot@archiver.kernel.org>; Fri,  3 Oct 2025 12:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 767A640E29;
	Fri,  3 Oct 2025 12:02:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id APULb6VA9HRA; Fri,  3 Oct 2025 12:02:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60C8E40CB8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60C8E40CB8;
	Fri,  3 Oct 2025 12:02:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C8EB226
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 12:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 830CF611A0
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 12:02:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id At8t8byiurdX for <buildroot@buildroot.org>;
 Fri,  3 Oct 2025 12:02:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D5DD56077A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5DD56077A
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D5DD56077A
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 12:02:27 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 4B0B9B0059A;
 Fri,  3 Oct 2025 14:02:24 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 03 Oct 2025 14:02:24 +0200
MIME-Version: 1.0
Date: Fri, 03 Oct 2025 14:02:24 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251002185916.2327332-1-bernd@kuhls.net>
References: <20251002185916.2327332-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <9de6de77740877bdb89f7c13ce7f1f03@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1759492945;
 bh=KStltsurWhzDEsNMJf1sQA0dZTbgCfzYsg1ylBBGNfo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ck/lW5Rmm2NscrjHqpQW9q1JL134VgtpB789hYmDArn+Zx4527mFIH7EHRfsWXOrG
 x3k+1yhAihJbauxfXJDYW3655J08J3tag6kAmpWTya3PcPsdxKhbMCfEBtJcxJ7mbr
 lBffsVK3UqQ7ex5CkoP6dTehSmBY46MoPkB5VxP8oO44n+/8FItqoK+PLDPrnJINBt
 0SCezN75F/ZqLpiYLe27YOU8P1COA+nufcZL/pxvXI0cPH311sAitj81rwGiOEg9Ob
 sydwWyZ4rs/OKXhyL8jrFo/JJ0iXyn5aMaN0etFiJfIIDtHhYYas8OJ9+LZmwL8TiI
 pfLPW1wdmHHLQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ck/lW5Rm
Subject: Re: [Buildroot] [PATCH 1/3] package/intel-gmmlib: bump version to
 22.8.2
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

On 02/10/2025 20:59, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

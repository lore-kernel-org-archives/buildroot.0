Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD8EC36010
	for <buildroot@archiver.kernel.org>; Tue,  1 Apr 2025 19:32:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20409413B3;
	Tue,  1 Apr 2025 19:32:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sMC0PWtBQGzq; Tue,  1 Apr 2025 19:32:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CD56413B7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CD56413B7;
	Tue,  1 Apr 2025 19:32:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E7F7A137
 for <buildroot@buildroot.org>; Tue,  1 Apr 2025 19:32:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D9A26610CF
 for <buildroot@buildroot.org>; Tue,  1 Apr 2025 19:32:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oUJWNzFJRj-Z for <buildroot@buildroot.org>;
 Tue,  1 Apr 2025 19:32:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0A2006107B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A2006107B
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0A2006107B
 for <buildroot@buildroot.org>; Tue,  1 Apr 2025 19:32:51 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id F1AE8B0055A;
 Tue,  1 Apr 2025 21:32:46 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:42906])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 01 Apr 2025 21:32:46 +0200
MIME-Version: 1.0
Date: Tue, 01 Apr 2025 21:32:46 +0200
From: Julien Olivain <ju.o@free.fr>
To: Michael Nosthoff <buildroot@heine.tech>
Cc: buildroot@buildroot.org, Asaf Kahlon <asafka7@gmail.com>
In-Reply-To: <20250401071035.2066802-1-buildroot@heine.tech>
References: <20250401071035.2066802-1-buildroot@heine.tech>
User-Agent: Webmail Free/1.6.10
Message-ID: <b908d19de2953e81e382472201dc51d0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1743535969;
 bh=NMw5jnM4QoUF0fQkuwXXa2KA6NPDOo4nGUgUZY+vSbY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cG8yN6ZgOXa1fE1JrPF+/iJzlwOiLREcloa2wRRjI11DtcAS+vjNLsx/R7cJPonIf
 Aykq8EIPxkTLtDLzijiMeTUT/o5KTSWBYTnLJK60HBM9OJQZHFYVIAsz2U72eKp4Xv
 EJ5yDKvwidhAo5gI6PgXAfbYtpGnUgu4WJEN83pd0KRzwAYQdeN+XgE+854mGYQnjv
 +zw1VoJ2duDJndn2KfUxFSjxLQzzdDvWnrOrJ8gkBc+nuTNK7banAQlpbjOK/ZFCeA
 8y/KJhPMRfwSuzIoC99soA7j/cOpcvEDi6EhWoNHB0MbkyCvwh9S8wRoOv4YkatEiL
 Mcag4ItzoSnKA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=cG8yN6Zg
Subject: Re: [Buildroot] [PATCH] package/spdlog: bump to version 1.15.2
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

On 01/04/2025 09:10, Michael Nosthoff via buildroot wrote:
> Release Notes: https://github.com/gabime/spdlog/releases/tag/v1.15.2
> 
> - fixes an issue with the %D format flag found by OSS-Fuzz
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

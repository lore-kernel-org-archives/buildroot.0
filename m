Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96679C43458
	for <buildroot@archiver.kernel.org>; Mon, 13 Jul 2026 15:04:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42E3B40866;
	Mon, 13 Jul 2026 15:04:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2ZGFVtu5hgwx; Mon, 13 Jul 2026 15:04:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE86A4086E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783955090;
	bh=eHJnvfJY4Vd1TY/kHkuf29zC3+AxsENaJbpqE9oFPrU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iGgqgB5KQsiBjlRZ4qTrGTcLtWsm+PqTwXmgX2qdwczz6Fjfuzr3g9TZ+LALt7eID
	 oGt26xiVs0q7aWdcvplm9MzrrtBWED5ggby4XFI2UzKixXagr7xWKZ8fIB43Y40uQb
	 ycymVwk+Ex7q6UmuiId6XEFPQ30bS4LTDFNC3+LL/QFnAweMYC8LiME1tMEmY7awDy
	 ADF+EwiPdFIwP/wVff+gTC1EQCKMyaMmi29JZddU9STKGCmJgiKND4RvBsCG5bVhYH
	 R/F3TYrmby7MYQRzjTHaL86ZsnCQVy4UOxkioGDr+wCVXr9wMEGV8vRzCMCA1bftsh
	 y/c+e5xjRHCkg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE86A4086E;
	Mon, 13 Jul 2026 15:04:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id ADB1C128
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 15:04:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 93B5480DD8
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 15:04:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lqu5eHByuyvN for <buildroot@buildroot.org>;
 Mon, 13 Jul 2026 15:04:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CD64880DC4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD64880DC4
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CD64880DC4
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 15:04:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 67CFD60136;
 Mon, 13 Jul 2026 17:04:43 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 13 Jul 2026 17:04:43 +0200
MIME-Version: 1.0
Date: Mon, 13 Jul 2026 17:04:43 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20260710190220.2350779-1-bernd@kuhls.net>
References: <20260710190220.2350779-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <5cba176ddb6518d198953a6c8ddfc36e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783955085;
 bh=XhIPmPayyc0UjsxxU49hhvGhBeP65AEzMJck7LRUOWY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=e1lHjj/647QHr7IRDyrG370H0DjrkkKyCSVOtiw4rhyd6oWjs1gGzpTU+SQmnlf0t
 bUGsCvl3nVFDHRS1RNHjCHHfmwBbsjO6py0qp4LYqAhsS3bzBYw/X9Mh6v+Ok1sldj
 CWhz3PSP1aJOKJlq0YK2889o4oOyxTskxqzhYtWz9CbxoqgRdpqlmD+E/RajAl26at
 y0Niq0JwbyVpefAwg/wmPdToK21EK9h9DU4fjpgLnFnU0PiWxBXdQ/Rx2zaiSwF6Q+
 LWV9mKD7dSk5KH9/FTHZ6F61x7Qmetr2wmwrSEtHVyc99lGteN2zx9Gg70gcI+4XB9
 auskv+moCHm8g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=e1lHjj/6
Subject: Re: [Buildroot] [PATCH 1/1] package/python-emailproxy: bump version
 to 2026.7.3
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

On 10/07/2026 21:02, Bernd Kuhls wrote:
> https://github.com/simonrob/email-oauth2-proxy/releases/tag/2026-07-03
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

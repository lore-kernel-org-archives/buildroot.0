Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A1E6CD6E52
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 15:45:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42C7B60F8E;
	Sun, 31 May 2026 15:45:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PlXh1Jqwo4bM; Sun, 31 May 2026 15:45:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE03860F63
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780242303;
	bh=E1jUmHcuxfTZNUtA0TdMHoY2AV06J5F+7kuEBTLhnsQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bBAs0iemg8Az5q//XugQVqRNuWd9MQN5XDIaLryWd+NKw0s6WoVzRnj6HndD4jsMd
	 i7ZscqshtObd0Qs2M/PEPgwMi+NFTAAu2nKcuq6tmTT4bPjS3Zq5HoRtDkm38HCeZJ
	 T1QWKdXtvkHt5+APp5cqMMcBLt7/TspUPwFC2f0a92lus2khnFT1uqE0KqKRPppaxX
	 bFfdfIr/ZoNA0HLTBRZg//HDaWpvyMBYBcp3fTaErgJX5daUNNO+zxfvl6NSfXTVG7
	 QhG3GR5fwONPJohniIeUKp/tYcAMafRMueATJqb13fseG6ihumcvNJjiNjBf+6XPVI
	 IRTWUa4JJ7T/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE03860F63;
	Sun, 31 May 2026 15:45:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 05072257
 for <buildroot@buildroot.org>; Sun, 31 May 2026 15:45:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E946405DC
 for <buildroot@buildroot.org>; Sun, 31 May 2026 15:45:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KlGoCZ4SCXoC for <buildroot@buildroot.org>;
 Sun, 31 May 2026 15:45:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D7E2C405D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7E2C405D8
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D7E2C405D8
 for <buildroot@buildroot.org>; Sun, 31 May 2026 15:45:00 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id AD9742003AE;
 Sun, 31 May 2026 17:44:57 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 31 May 2026 17:44:57 +0200
MIME-Version: 1.0
Date: Sun, 31 May 2026 17:44:57 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260531143911.2967639-1-bernd@kuhls.net>
References: <20260531143911.2967639-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <5f87be69997b2f08969e5e9341da2f72@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1780242298;
 bh=Njh8t9KwMxfyR+oJTYaGYxaGI+gmME6J9NkrQKNb7BM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PCxH/gHodjGOkNqOeCauWcJrAkvkA+1CBHlMLG5wv9STCpimuBuQaagcfmxGNKKRz
 pbTtyQ1Mi+XGK1vtih6INBwmnTkXi7BRGN5SOWOBp9R5yja2F2H0xay/sRvsXzwRvn
 azHlR0pPKKBLnJwhn6MVJZA1paLsTniqrQJVaaUBkXAanzuRGhQD/jvM2hNkpyDwIo
 7SSVX0PQB8lkxcwLR6kNIG9orPtkDlyo7jQN5ruAtRpZXJwPS5LZaam3FtQIkNkDPW
 IRAua1pPbHuYoW7ZcLhCSjq3ohy5bf6c7ipeOnw0wooFgvzfIPioOUfoFWi6EOPVAf
 h54ucNYkRpj3g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PCxH/gHo
Subject: Re: [Buildroot] [PATCH/next 1/1] package/nut: bump version to 2.8.5
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

On 31/05/2026 16:39, Bernd Kuhls wrote:
> Updated license hash due to upstream commit:
> https://github.com/networkupstools/nut/commit/d5b040b2a9e7eb86d819b534a0ba274f76616dfa
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

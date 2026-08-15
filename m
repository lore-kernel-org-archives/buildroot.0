Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B7E9C5CFDB
	for <buildroot@archiver.kernel.org>; Sat, 15 Aug 2026 09:21:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60E37606B9;
	Sat, 15 Aug 2026 09:21:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bQ2GBABtQCIg; Sat, 15 Aug 2026 09:21:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 921286066B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786785714;
	bh=wyxhEjM4p8iRJkzwwu9GKGcDiPsFqgWAKr7IH2RkNhE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BLoWS18ESTcdB/FvULvSGl1LGYZ++dtVJZdXiXQXm8BnCTkIiEVnsDMXTunMlLthS
	 3O/3AfWac4+fnNzfREotiO54HQyZA64Xp+q4wjBPrqkdvfNTbfcpc5kQBhItsKpD5U
	 MZMPFFwRcC24h4qBN7pwb6+s8Y6c1nTLMp7c/TETqVAsvVEwN8nNEgo6ltTi+h13mt
	 8aN7D/dyHhoc3K99O8bHYKjwd3rEDN0cO8pKnG/BXr8qB/VwEOgpyUz+fcr9ox3+zf
	 7IOrL/NXf5Kq2+6O/TsmTCgKYPA5278UPqvPtajOGiY3F4cDyKE8UEAYGJzzNtrAHy
	 eAzpBFrz9cdaQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 921286066B;
	Sat, 15 Aug 2026 09:21:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E37E8361
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 09:21:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D58A2406F4
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 09:21:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FVwHeCyeeUEs for <buildroot@buildroot.org>;
 Sat, 15 Aug 2026 09:21:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CFC0B405BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFC0B405BB
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CFC0B405BB
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 09:21:51 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 857BB6012D;
 Sat, 15 Aug 2026 11:21:44 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 15 Aug 2026 11:21:44 +0200
MIME-Version: 1.0
Date: Sat, 15 Aug 2026 11:21:44 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joseph Kogut <joseph.kogut@gmail.com>, Nathaniel Roach <nroach44@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>
In-Reply-To: <20260814195856.3295644-2-fiona.klute@gmx.de>
References: <20260814195856.3295644-1-fiona.klute@gmx.de>
 <20260814195856.3295644-2-fiona.klute@gmx.de>
User-Agent: Webmail Free/1.6.17
Message-ID: <156338233baa0edaee89b456580d3ab4@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 01/10] package/at-spi2-core: update project
 URL
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

On 14/08/2026 21:58, Fiona Klute via buildroot wrote:
> wiki.gnome.org has a big deprecation warning saying "All information
> on this site is out of date and should not be used." Point at the
> project repository instead.
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

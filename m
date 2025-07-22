Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F74C83F1A
	for <buildroot@archiver.kernel.org>; Tue, 22 Jul 2025 17:23:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F19060A7D;
	Tue, 22 Jul 2025 17:23:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v6U8zzaBPVsm; Tue, 22 Jul 2025 17:23:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D71F160E9F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D71F160E9F;
	Tue, 22 Jul 2025 17:23:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A06A9CD
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 17:23:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8638040072
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 17:23:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ryr8TfdF0LI7 for <buildroot@buildroot.org>;
 Tue, 22 Jul 2025 17:23:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CC77240052
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC77240052
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CC77240052
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 17:23:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id DEC3B2003C3;
 Tue, 22 Jul 2025 19:23:26 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 22 Jul 2025 19:23:26 +0200
MIME-Version: 1.0
Date: Tue, 22 Jul 2025 19:23:26 +0200
To: yegorslists@googlemail.com
Cc: buildroot@buildroot.org
In-Reply-To: <20250722124519.3434397-1-yegorslists@googlemail.com>
References: <20250722124519.3434397-1-yegorslists@googlemail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <21e3be4b96798d6b221f8a2f39fb5096@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753205008;
 bh=4GP8plQ66WSAyBTq1kk/W4fpyBmf277woRhbbz3yU2s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MfTdi3aQHO81Tl2qxiififaL7yz/LhGRBxqBbToyIaRD/jEP7UefC4kLMrpmBBXIw
 xgHHgJZNO04yomyZBrSgjW8lwQEGFjMGGR3b4fMfmt0ZrY8LO+AxkKd7WmFrPh+dpF
 G/Ny8WOcp3RSqSbnMUPKBOZJkoGSAy2SAg+pR3S53itieCoaDr+s1d3prf9Hsu7zAA
 lX/wg9yjEpn809H50V7D0NMIS8p2lJ6P+emqnzbm+CrMpm2MkSyvQ+ldaX0ZszW5M0
 kMzyO+c+JURvIEWoP5B3xcNirsOvQmGy2z7kd12XDLUg4n/pVEwdPfVapLzD0BgShp
 ZxvKJu0EkJLqQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MfTdi3aQ
Subject: Re: [Buildroot] [PATCH] package/memtester: bump version to 4.7.1
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

On 22/07/2025 14:45, yegorslists--- via buildroot wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> For change log, see:
> https://pyropus.ca./software/memtester/CHANGELOG
> 
> Version 4.7.1 fixes compile error with stricter C23/gcc-15 due to
> incompatible type declaration.
> 
> Fixes:
> https://autobuild.buildroot.org/results/6d4d4e8ca4269a3d8f795c7c186ef70411f2dc79/build-end.log
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

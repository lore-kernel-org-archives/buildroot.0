Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 622F4F55102
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 21:34:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FFB160EB3;
	Sat,  7 Mar 2026 21:34:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3BAvHpgnqvuB; Sat,  7 Mar 2026 21:34:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59B7D60E0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772919262;
	bh=Eb40I+SRkasT3nw8z1nphPr3IyivN0WGAbcuzrGVmjU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=J8K6wBSRLwXQWioVgCPWU+pw3vk9SAkEi6FpdhkPvLWBgxvN77vY1EXBKWuz6zA7+
	 2R2X9qmGf0/xFteVJJmgg0UL/0/mT2Hy47kBgSfPhDOGg4AvEt1pYuQ+GUdrUBX1Nn
	 duPZ7SVth26YgRYDP47yo33RR0IStgG6sIGDRKX938j9TdrtqNfPvEO8/hNxxgnvtF
	 9XbLjJ6Xv4jdHQFvJgFwRYbV9vKx9pWErjRpzI7+t2bJn3KTVevyH0aQIWSR41P9ec
	 K+ME2N5T70WOsne6pZLgiDcq+ICsiCRhZbA4OhxRnKcpyAKXVs8PpKqWqzmdW/Scmo
	 y8gVMZP/8HK/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59B7D60E0E;
	Sat,  7 Mar 2026 21:34:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 16C9D158
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 21:34:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0857683CFE
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 21:34:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pxilJIkbcdyL for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 21:34:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C0AD883CD3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0AD883CD3
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C0AD883CD3
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 21:34:19 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 2910778034D;
 Sat,  7 Mar 2026 22:34:15 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 07 Mar 2026 22:34:15 +0100
MIME-Version: 1.0
Date: Sat, 07 Mar 2026 22:34:15 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Johan Oudinet <johan.oudinet@gmail.com>
In-Reply-To: <20260303113530.472413-1-giulio.benetti@benettiengineering.com>
References: <20260303113530.472413-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.13
Message-ID: <c6682d8c3811c0b3461bdf0658dbd6d5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772919257;
 bh=QFQq5KHgJTWjdbJ0XmwaFaDT7XNPWyVg78S1x0pJtMQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=B0refnjQM5vtTdWza4G5Dqh/v6LeqgHpsg0wQ7ZGTHX5Zmjnq1lc9QPlsFqkyCO/K
 UJY29A7uCBOkLbObMhjLlFxk/AvQpnZ0JJcJG+UN7IHO9rdQvXO0tMK+HBc56z52uN
 yGpg4kJVQMiEzz7DgCEg5xUNgzFkY23ilnqRjbjlDroGCKN200pV9puR0YpBBCMR+Y
 1iq0OP4xwa3zsATn3PybpSEEII38Ku6K+Kr8V2Oau3Pgx9UvysOv77xUzNK4D+9HOv
 HYpCKY92l/1fQX5zwgy7K6RfEsco2uTg+feYoh2uHMBBUoTFXteE1T6Mj/WENDWX7j
 5GBGtXs/2y1Tg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=B0refnjQ
Subject: Re: [Buildroot] [PATCH] package/erlang-jiffy: bump to version 1.1.3
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

On 03/03/2026 12:35, Giulio Benetti wrote:
> Release Notes:
> https://github.com/davisp/jiffy/releases/tag/1.1.3
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

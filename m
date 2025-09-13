Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04DC9CAC592
	for <buildroot@archiver.kernel.org>; Sat, 13 Sep 2025 22:44:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDC0441A8C;
	Sat, 13 Sep 2025 22:44:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CSBA7pB2bOUg; Sat, 13 Sep 2025 22:44:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 159B341A50
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 159B341A50;
	Sat, 13 Sep 2025 22:44:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7EA8C117
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 22:44:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70AFE4035A
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 22:44:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a_u7fwlaBzUp for <buildroot@buildroot.org>;
 Sat, 13 Sep 2025 22:44:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F33E4400CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F33E4400CC
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F33E4400CC
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 22:44:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id A1C152003AE;
 Sun, 14 Sep 2025 00:44:30 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 14 Sep 2025 00:44:30 +0200
MIME-Version: 1.0
Date: Sun, 14 Sep 2025 00:44:30 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250909161036.59456-1-bernd@kuhls.net>
References: <20250909161036.59456-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <74396fa1e04fd3a4103b87396b2edc4f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1757803471;
 bh=ut4DOupJGWuSLZosq+8hqeRPECagTSsD0qwRrWDMP9M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pM87Zw4R/eDFnYxuxdKAwGURtFOmfopkjTER/yQW7DFeFIMhZ2hBYGNM66EoUudYI
 Ao1tsb4WMnGoamU0s7gGuo7nXMeyNsmvMK5EEGSdZhc8wk6gtrLce2BLXn/NzQhky8
 byPxvNH2WcZ7aaBABOhSlMnkrJnXEeIpcXds1ZA5q4rHSh/maWeKqw4CE7LgBdosEz
 jIVvPACDTAXKMZzMc3v+/FMCnGnVa066VOmz2UBeu5E4JC1Qs3IcpLuK9Jz5ATheSr
 tIDTaQnxPkMVWsyVuaY6IUmab2TGXJWfxcpiprmmSsMHb2KQCYW97hlk7YT3OYcANe
 gV4mbrnrTseLA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pM87Zw4R
Subject: Re: [Buildroot] [PATCH 1/2] package/kodi-pvr-waipu: bump version to
 21.12.5-Omega
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

On 09/09/2025 18:10, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

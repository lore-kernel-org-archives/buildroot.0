Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59283C83F17
	for <buildroot@archiver.kernel.org>; Sun, 13 Jul 2025 11:32:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EFA540983;
	Sun, 13 Jul 2025 11:32:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FxfKgymWc7n9; Sun, 13 Jul 2025 11:32:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47BDF40975
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47BDF40975;
	Sun, 13 Jul 2025 11:32:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AEB125E
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 11:32:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 949FD4096A
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 11:32:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jVzPzAhgmMss for <buildroot@buildroot.org>;
 Sun, 13 Jul 2025 11:32:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B47634095E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B47634095E
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B47634095E
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 11:32:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id E865813F879;
 Sun, 13 Jul 2025 13:32:47 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 13 Jul 2025 13:32:47 +0200
MIME-Version: 1.0
Date: Sun, 13 Jul 2025 13:32:47 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250622100412.3836588-1-bernd@kuhls.net>
References: <20250622100412.3836588-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <e7a1ed7c27118b52a4ae8299648dcb91@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752406369;
 bh=2P6cdW1pV15EJthSSrlgRTAS7hSWEcAixiSobs1nPKs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kMo2L5pjfB6vDhvqjLtdv2ioCLbI0emNpxS/jUBKaK4e9nPdGXJHYDzcj6NDYyym2
 FM7IpEf4lmcCwHjN+lRjOlG8IMdPJjxUV9YU/sB84w3Pu17DXoOnZjYmUKqMeCDf9u
 y1dFZTIWaCos091zA3geCr07I+IVQITpY/OcEP1law0XINvfiXIZgUTByt47/eEFLT
 FXMU4sImQHzs1JKlbGnfGTKJOGE8V6Bdn09SewsGlgwVfyz6FEhD3tgK2I4guUVYmw
 lOnx8NejLX+TZTK1Mri0g6yqXIVHsi0TKXN1ul55XcwSlOYJA++RwoDVHlhCWxx/Pg
 LHqq78J8qDXTg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kMo2L5pj
Subject: Re: [Buildroot] [PATCH 1/1] package/libcrossguid: bump version
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

On 22/06/2025 12:04, Bernd Kuhls wrote:
> Needed for kodi 22.x.
> 
> Added build fix for >= gcc-13.
> 
> Switched build system to cmake following upstream:
> https://github.com/graeme-hill/crossguid/commit/13683c56e559f93d75f8640488aa3335f43443ed
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.

For info, I switched _VERSION to use the
"git describe --tags --abbrev=40" format, since upstream
has an old tag. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/c61d7d61b1e3fe143569938f7c63b01a24169830

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB680C2D0CD
	for <buildroot@archiver.kernel.org>; Wed, 21 May 2025 18:03:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5154606BA;
	Wed, 21 May 2025 18:03:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xXIA9cQVEMB7; Wed, 21 May 2025 18:03:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA358606D3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA358606D3;
	Wed, 21 May 2025 18:03:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CC3A0758
 for <buildroot@buildroot.org>; Wed, 21 May 2025 18:03:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B20B581341
 for <buildroot@buildroot.org>; Wed, 21 May 2025 18:03:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CEnuwl7UzMTk for <buildroot@buildroot.org>;
 Wed, 21 May 2025 18:03:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B59FB81327
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B59FB81327
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B59FB81327
 for <buildroot@buildroot.org>; Wed, 21 May 2025 18:03:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id B365678034E;
 Wed, 21 May 2025 20:02:58 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 21 May 2025 20:02:58 +0200
MIME-Version: 1.0
Date: Wed, 21 May 2025 20:02:58 +0200
From: Julien Olivain <ju.o@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250520204134.383623-1-giulio.benetti@benettiengineering.com>
References: <20250520204134.383623-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <94b1e185a5c4c928493a2e96f700b8c5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747850579;
 bh=psldqbEfRfmlEcV1hRMYcGHcdeyy2COnhjmQdMSL6Ok=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aaro957egBEwTWCO0sc50MtYWjvMq/Q0fbC87+Sn5boFUjRjSEN+EGqaZ300IQyZb
 0EwxWY2U9c9ykFb2HW1YUyZKZ27RvfGhibYdh0RTkqdobBFeQooayao3V87qhtLCK9
 0joe+bteQkH9Zt10B0S6IOXbKFRXj9ATnnK7W+pBuM9qe9hvKDLsYS+/ZCE0tvii0m
 tNgXkCD6EQASa8Fv+4vVvXSlaBk/RWGLZ6yXDoX1jaMycC7xWilOcDMRONwdjC0njO
 4JZz+l/hE2MI6zGWDEz5vK+sGa6q1ej9QhIVknJbg5iTS5dr6E00S8e87aOBHzOMYI
 pV7NRBdmy8h+Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=aaro957e
Subject: Re: [Buildroot] [PATCH] package/libnvme: bump to version 1.14
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

On 20/05/2025 22:41, Giulio Benetti wrote:
> Add local patch to avoid build failure on examples folder that we don't
> need. That build failure is due to missing bits/pthreadtypes.h on musl 
> and
> since we don't need examples at all let's disable its building by 
> passing
> -Dexamples=false.
> 
> For release note, see:
> https://github.com/linux-nvme/libnvme/releases/tag/v1.14
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to next, thanks.

For info, I added the link to the "Upstream:" tag in the patch which was
missing for some reason. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/c2fdcebc6ee6b589665f9903b997b887bc0327d7

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

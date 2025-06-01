Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E53C5B543
	for <buildroot@archiver.kernel.org>; Sun,  1 Jun 2025 21:53:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD11581F1D;
	Sun,  1 Jun 2025 21:53:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p18m_4hwoHdR; Sun,  1 Jun 2025 21:53:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DABFA81F12
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DABFA81F12;
	Sun,  1 Jun 2025 21:53:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 49BB81F7
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 21:53:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 472C9610F5
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 21:53:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hx9H0XNlQXas for <buildroot@buildroot.org>;
 Sun,  1 Jun 2025 21:53:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7BD4260C23
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BD4260C23
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7BD4260C23
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 21:53:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 5D38519F54D;
 Sun,  1 Jun 2025 23:53:37 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 01 Jun 2025 23:53:37 +0200
MIME-Version: 1.0
Date: Sun, 01 Jun 2025 23:53:37 +0200
From: Julien Olivain <ju.o@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250513120604.146496-1-adam.duskett@amarulasolutions.com>
References: <20250513120604.146496-1-adam.duskett@amarulasolutions.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <4e56423317942532c4ad6b0b3d428897@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1748814818;
 bh=778SBtmSY1d1hmdzLSXwpt4ZtBLSlcteQ4lob1LZ/WA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=uu6kuGW9W8vRaEcKl//zx76sgpwBjUleWil3tvt2K19Y1JvjNvrhDgjc5KBDXADJ2
 Uc0zctDOcFJ4LjTdYFxNE8Si5WTBI4lRoCBnqlr+gphGZ6T/1GOdqULoH/TRqSnvDl
 bUFQJxMIN6b5nDeWysPzTU7lN0YQn58ySfpTto7dsWifUV5P0x2k2fQCZivfKMhOxr
 P2qEnIhnYyWTdjScfLc8Rhb3cpb5phiyCvCM7iLf525VhGcKH5tJG5BQZgRliuXB4E
 a0nROu1qaMjI4Faf4ge7l2p14M/+p7T5JsR6rlKKsmTXkSg0FJ2RQKCW1h9oyuIy3t
 Ckr0l/jFGIOIg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=uu6kuGW9
Subject: Re: [Buildroot] [PATCH 2/2] package/sysvinit: bump to version 3.14
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

On 13/05/2025 14:06, Adam Duskett wrote:
> The biggest change for 3.14 is the maximum inittab entry size has 
> increased
> from 127 charachters to 253 characters long AND it logs a warning when 
> a line
> longer than this is found AND it refuses to run a line longer than 253
> characters. It doesn't truncate too-long lines anymore, it just drops 
> them.
> 
> Changelog: https://github.com/slicer69/sysvinit/releases/tag/3.14
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

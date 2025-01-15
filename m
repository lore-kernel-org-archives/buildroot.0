Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D65CC02180
	for <buildroot@archiver.kernel.org>; Wed, 15 Jan 2025 20:16:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D53EF4174B;
	Wed, 15 Jan 2025 20:16:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mknx17NuSL3H; Wed, 15 Jan 2025 20:16:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC68A417A7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC68A417A7;
	Wed, 15 Jan 2025 20:16:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6DC6894B
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 20:16:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A447417AB
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 20:16:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LXInf9-7-a5I for <buildroot@buildroot.org>;
 Wed, 15 Jan 2025 20:16:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 58593417A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58593417A5
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 58593417A5
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 20:16:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 169FBB0057C;
 Wed, 15 Jan 2025 21:16:08 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:48102])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 15 Jan 2025 21:16:07 +0100
MIME-Version: 1.0
Date: Wed, 15 Jan 2025 21:16:07 +0100
From: Julien Olivain <ju.o@free.fr>
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org
In-Reply-To: <20250115102827.3479245-1-fiona.klute@gmx.de>
References: <20250115102827.3479245-1-fiona.klute@gmx.de>
User-Agent: Webmail Free/1.6.9
Message-ID: <06953317cce3db2d20188fa0e8e36de9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736972169;
 bh=K7tG0JdftB3CTdSr9CDkGcF+/rknDfW0ik2lZWyKaTI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FV2zpueSAwfqlkkXnLd+PWwGzXNnze8IXHhzCcl4INBuQmWmw3squrl4T6hOL4DGg
 gZjOYsaN35T5W+PF67Ec3loDLhszQpIV1p0CYMTygxy2cD/rVxkFeXZC3wrCCId2jF
 bnNOlQfKyO1LtB+84BCEUZH/df3uFtir8s8lT6wKVmoeYDhda/fr9WDK4InsnGPQ01
 8qcHl2AdaqxdytfPX6tX40ED5MoNxqYk0AyVJupa+gjGoGfqTlrt9xEqTssoOUc9q+
 vY/g0Vysrj1paxfeaAMqWV0y3xZjDpn36CfKErvlMIXZak8UeBN63jrpfdpU2UiDrD
 hE3eDh/mglYFQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=FV2zpueS
Subject: Re: [Buildroot] [PATCH 1/1] package/network-manager: bump to
 version 1.50.1
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

On 15/01/2025 11:28, Fiona Klute via buildroot wrote:
> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> Upstream changelog: 
> https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/blob/1.50.1/NEWS?ref_type=tags
> 
> Release downloads have moved to gitlab.freedesktop.org, see [1, 2].
> 
> Drop patch included upstream.
> 
> [1] 
> https://lists.freedesktop.org/archives/networkmanager/2024-December/000364.html
> [2] 
> https://download.gnome.org/sources/NetworkManager/IMPORTANT-NetworkManager-releases-moved.txt
> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

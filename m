Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13063C021A9
	for <buildroot@archiver.kernel.org>; Mon, 17 Feb 2025 20:15:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC708408DB;
	Mon, 17 Feb 2025 20:15:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wbh8XDWTtYFC; Mon, 17 Feb 2025 20:15:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEEEE4091F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEEEE4091F;
	Mon, 17 Feb 2025 20:15:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F2CFC8
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 20:15:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5EA4D60E65
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 20:15:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UUpSlNtJGDrA for <buildroot@buildroot.org>;
 Mon, 17 Feb 2025 20:15:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7638B60DFA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7638B60DFA
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7638B60DFA
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 20:15:46 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 445E978032A;
 Mon, 17 Feb 2025 21:15:43 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 17 Feb 2025 21:15:43 +0100
MIME-Version: 1.0
Date: Mon, 17 Feb 2025 21:15:43 +0100
From: Julien Olivain <ju.o@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250217194711.31295-1-peter@korsgaard.com>
References: <20250217194711.31295-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <9d23d8e2e2e6c734b016ad167a346421@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1739823344;
 bh=uzN9FTNICmpVM3rdhtSjM/foIo0LSlbrNdIqZITjBx4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SpsHUfl3/77yWLjhC3WLTL5SrpnLlr6nMMDZ6Q9+LaR7iZxiuTmdyWAGPpiw56/g3
 lZsDYXXtxZXVm29msU5sdEed41OFSLxufDO2+AjLe9GEWg3Pc9IUxzpEuvOLv4snYJ
 Ia1J7epsZrsyxcBzaHd22ng+I7y8gXuvUMWbQd/96n1mGhVEOrDSseUoeXX18TP1V+
 DcTU42CfoVi67NfDnrPpbNqL8Cr0j25NW9jT44Z7YEjONYx/m8S202takhaZ2t7cNO
 PKXyXsMiRRL0hshTEEvTK+Md1jrzeTyjaJKp8C+g7kW3k48hQJBcTAGlGeM7FJX4d/
 IA1ItmQlaF12g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SpsHUfl3
Subject: Re: [Buildroot] [PATCH] package/assimp: add upstream security fix
 for CVE-2024-48423
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

On 17/02/2025 20:47, Peter Korsgaard wrote:
> Fixes the following security issue:
> 
> CVE-2024-48423: An issue in assimp v.5.4.3 allows a local attacker to
> execute arbitrary code via the CallbackToLogRedirector function within 
> the
> Assimp library
> 
> https://github.com/assimp/assimp/issues/5788
> https://www.cve.org/CVERecord?id=CVE-2024-48423
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

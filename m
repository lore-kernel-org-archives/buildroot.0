Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E796FF8868
	for <buildroot@archiver.kernel.org>; Mon, 27 Apr 2026 20:08:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F20760743;
	Mon, 27 Apr 2026 20:08:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 57mc2b7P9ZUz; Mon, 27 Apr 2026 20:08:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17DF360738
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777320524;
	bh=KjoOJJK0fw0yYM6IekRXoJGa0n6dPz6aNqXZN+d6eKY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UOS11uj54aIUDVtnsVQiqP4rrbA2YI3sozeX2xE+EAD4rloECAppN8BZcKzzhErz2
	 4eMDVSZeQFQE//4v72OcLjbHpZphB5xZVt4QXMACxQAOCiFj4+nxN4ArcA+BeN/vJJ
	 gDQQ1y/KRSaz3A3hCoUr0zWlHdPCy6ifzDoCBadbH8WUNYiq03dQs0tpnyHmyCrkut
	 qdvZhl87x2Ql1Ul4ff27Vo5ekhvxW1eyTRck56ia4rI3CmXt5+krvRgYFwzpnvWdiv
	 AgcXfXn4VRDS6CR2ZMtBHZG5gC2gZX76JoQirhPcTQh4SBi7AIrdHOmFSL5nZ2oyQq
	 WeUaT0JNkiygQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17DF360738;
	Mon, 27 Apr 2026 20:08:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5FA68231
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 20:08:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5CB0381275
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 20:08:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lVngZBTVan43 for <buildroot@buildroot.org>;
 Mon, 27 Apr 2026 20:08:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0BB0681274
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BB0681274
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0BB0681274
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 20:08:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id E63455FFA3;
 Mon, 27 Apr 2026 22:08:37 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 27 Apr 2026 22:08:37 +0200
MIME-Version: 1.0
Date: Mon, 27 Apr 2026 22:08:37 +0200
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org
In-Reply-To: <20260216103714.802444-1-buildroot@bubu1.eu>
References: <20260216103714.802444-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.14
Message-ID: <06064ec2e3c5cd488ca381bfeeeb4bb6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777320519;
 bh=iEPa6F93Kw7sNfPvekgkb6pUHzHzGlkkWXFPtj1OTY4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rv8UBXUGy1i2S1vyVdma3VKhMDbg08JnZ4gt/4iSAmVj0lfDKc18NR6FPX/na4yut
 xGt4OxFMrSlVyPU6nwQ3j72cmWryRifR9DyWl9PwKrc2j0qVNBQXCOy38DENzFgqL5
 Qmh8bdnvXN0wHZtIXEI5jl9OkwJiZoTKV9jBMnax6gWuB4QEhQI3LJupfPouExv+Kv
 0UXKAmURWAv9SzxTM1dE50EgM2ze+EnQWQJzlTMPAXxBAr0WW5Krd82a6gL56emwiu
 /fuiZxgzyFwkUSimie4A7wF9S9pWjr/LrJb8tyv4NgPezlE1sjSW56Kfn9LBNN2gXQ
 FxNBmUPSni0yA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=rv8UBXUG
Subject: Re: [Buildroot] [PATCH v2 1/2] package/network-manager: bump to
 1.52.2
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

On 16/02/2026 11:37, Marcus Hoffmann via buildroot wrote:
> Overview of changes since NetworkManager-1.52.1[1]
> 
> * Support reapplying the "sriov.vfs" property as long as
>   "sriov.total-vfs" is not changed.
> * For private connections (the ones that specify a user in the
>   "connection.permissions" property), verify that the user can access
>   the 802.1X certificates and keys set in the connection.
> * Introduce a libnm function that can be used by VPN plugins to check
>   user permissions on certificate and keys.
> 
> [1] 
> https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/blob/1.52.2/NEWS
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

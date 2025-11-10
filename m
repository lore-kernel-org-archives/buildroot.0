Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84DBCCCF9E3
	for <buildroot@archiver.kernel.org>; Mon, 10 Nov 2025 19:09:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F9A68070C;
	Mon, 10 Nov 2025 19:09:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PU77wTmjqxvF; Mon, 10 Nov 2025 19:09:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8487806CF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8487806CF;
	Mon, 10 Nov 2025 19:09:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D46325D
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 19:09:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F6C8806BC
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 19:09:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LRWGKm_b4uDF for <buildroot@buildroot.org>;
 Mon, 10 Nov 2025 19:09:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ACAAF80696
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACAAF80696
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ACAAF80696
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 19:09:37 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 9123813F861;
 Mon, 10 Nov 2025 20:09:34 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 10 Nov 2025 20:09:34 +0100
MIME-Version: 1.0
Date: Mon, 10 Nov 2025 20:09:34 +0100
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251110064113.234252-1-nemaakhilesh@gmail.com>
References: <20251110064113.234252-1-nemaakhilesh@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <b5ac0e497098681bc18c988123b0f440@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1762801775;
 bh=UQ/ZPmeEV2++XHWvJPnzp+8SGBXsXRh11LmgcajV3eI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sc8OM7BU30Jtiz+0ohqiPis6rulSOjSIGPichV9LTNqzyaIMtLfe6oCVtxsp1jXh+
 /871OqXfAbQuuPwt9S+sZll3PUeAZnDB8z5PjBqO87uzavPlLak9BcQSsqYfgUAFXb
 58Rm4dFD/emsjuwWVRRbBVTq6GK+1Nq5dIGXvRF7Vj4s9o4hz++VO//cMMo7bnuaOK
 u9YJR3FJZyQaet28Af4v3SHqUQ0sy5DpSaUr3pUKSnMzuFX8crRpOSQzLAy1WdXP9v
 R0Y8vfdnSEjiWm6sXHLZ/x5stoeQYWWf/LuRxYaJHz72S9VeKeepQciip28Se48gg6
 Vj5mZtrPTMyaA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sc8OM7BU
Subject: Re: [Buildroot] [PATCH 1/1] package/lldpd: bump to version 1.0.20
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

On 10/11/2025 07:41, Akhilesh Nema wrote:
> Release notes:
> https://github.com/lldpd/lldpd/releases/tag/1.0.20
> https://github.com/lldpd/lldpd/releases/tag/1.0.19
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

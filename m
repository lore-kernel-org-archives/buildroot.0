Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB45C5B572
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 08:29:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4A3360657;
	Sun, 16 Aug 2026 08:29:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7XR1hdKR7W0t; Sun, 16 Aug 2026 08:29:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD14560622
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786868957;
	bh=WLtDoydVT+ecIO159CE42K7e3BUo/aqPUIR7U6tX3as=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bk2KyyQP3FMN4aE+4R7q8c+xgiYpsDhaWmUCduhsC8dgStO3qMj1uqWGxoXq6VZJH
	 UqEx/ufeJOyvCLf15mFnAAQpJRRCCoFrUBtUo++MUx9yQ1iBNbkcsi5hhnLWQzPdBJ
	 bLYnIGGNOOMYFHORi1C3X/egvbpD1qkzcmMaW6I922sNA0JdLuMGlH0TuSt9jxMh80
	 o3x36k6pidy8h12vOJIpuRMzBnjCRKpKq5T3TPLXU0tWFO0ScntyLxJ9/MziyJmzhY
	 BjrZPfFrfi9ekk4OGJEcfCg8OP+LMH5Td1ZhQgTqG1tFF1ZkrCnN6w4tT5fBUQ2uLa
	 f73n4Ev6I3alA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD14560622;
	Sun, 16 Aug 2026 08:29:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A54C7333
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 08:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 970FB80BD4
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 08:29:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TNnzW6vlgAW3 for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 08:29:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 984CC80B99
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 984CC80B99
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 984CC80B99
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 08:29:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id B2A4E19F5A5;
 Sun, 16 Aug 2026 10:29:11 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 16 Aug 2026 10:29:11 +0200
MIME-Version: 1.0
Date: Sun, 16 Aug 2026 10:29:11 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260816075345.1844714-1-bernd@kuhls.net>
References: <20260816075345.1844714-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <6d981d458871406e298837a6edee2313@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/openssh: security bump to
 version 10.5p1
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

On 16/08/2026 09:53, Bernd Kuhls wrote:
> https://www.openssh.org/releasenotes.html#10.5p1
> 
> Changes since OpenSSH 10.4
> ==========================
> 
> This release contains a number of security fixes and small bugfixes.
> 
> Security
> ========
> 
>  * ssh-agent(1): fix an interaction between agent locking and the
>    session-bind@openssh.com extension that is used to identify
>    forwarded agents. These binding requests were refused when the
>    agent was locked, with the result that operations that were
>    intended to be limited to local use only could be performed
>    remotely, including the ability to add PKCS#11 tokens and make
>    use of keys that had destination restrictions applied.
>    Reported by sn0x-sharma
> 
>  * ssh(1): avoid potential realloc use-after-free in the client if a
>    remote forwarding is added via the local session multiplexing
>    socket while a remote forwarding open request is pending with the
>    server. Report and fix from Brian Mingus of Cognatory
> 
>  * sshd(8): make the authorized_keys "restrict" keyword apply
>    correctly to tunnel forwarding too (which is administratively
>    disabled by default). Reported by Erichen, Institute of Computing
>    Technology, Chinese Academy of Sciences
> [...]
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

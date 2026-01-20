Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4268FD2629C
	for <buildroot@archiver.kernel.org>; Tue, 20 Jan 2026 20:29:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2232040B81;
	Tue, 20 Jan 2026 20:29:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2_XZ8FFSl5N2; Tue, 20 Jan 2026 20:29:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6305140B72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768940985;
	bh=zyykf/05S7bOjJGt/onlabTe3RVvZ7HynKrjLEHAH3M=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Arqos13YcSBvQVqRbPBj3nPIxyxYzONDyPocmRucE6x+IN/3FdCiXc09/Vk6zL/Vp
	 pgO1udQUPiAi0yVJYM5N27xGVbPjYnRdG3OJf0fVesRn+xvUmxctIc4SUGWvVBYaPy
	 OxYJ4cFnDomUcOXBRTcxi+By8dklPtMmd2J5yX+h+8OaOHBb2K6WLG6SVIu13yLHeC
	 y9AIIBQTbmvNsgjcO6sXH8MdSR2lce0sJxBTEH5mX4RjaCMbWf6lUJYFOj8ZljbA8G
	 9xDQW2ca/3ezrONLM8gkAPsZ8O8zBLjZz7a7+7EugbsKvwS/1Q1RIqMpfBoywupeDV
	 oTBfB3tZ+nn7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6305140B72;
	Tue, 20 Jan 2026 20:29:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D58B160
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 20:29:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E6F3C60A9A
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 20:29:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ddObD6q8_Kw3 for <buildroot@buildroot.org>;
 Tue, 20 Jan 2026 20:29:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 31D4C60A98
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31D4C60A98
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 31D4C60A98
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 20:29:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 74E915FFAF;
 Tue, 20 Jan 2026 21:29:37 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 20 Jan 2026 21:29:37 +0100
MIME-Version: 1.0
Date: Tue, 20 Jan 2026 21:29:37 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20260118170731.3366652-1-bernd@kuhls.net>
References: <20260118170731.3366652-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <8751fa252e079c01419c81c29890e580@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1768940979;
 bh=cWrGqmBhHlW1a7EtJP9a6hW1jpD3jRsKEJr9dPfaxWQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PiQOjb8VqHwnCfdLoDTs7Mr0myGSow/gx+ow89ePrT3Si1BzObpdyF9hBkOjDdThs
 rTfr8z+ZMWmryuftoIF6jqN5ysUQZ4BODcBPnJ8KBaaZh0dC7T3IkMp6pipxjQF7UP
 h41Ghe/ZZUK+2+oRUI/JRXvhAWyPeQUXScT6gSDcKGPFqBt1RFsxGdv8iux38fl+y7
 X7LVGOTpNTYhP0G5GThaeDQzo8/wGz+T3WzipTepIGhrBTDWXDkEtORjfE71P2D1XY
 l1WY7ygh1cgT+AEsZ2Yy5OmEhadbTjPF4pyHh6CJe8HdN8tL7hc3kXp+kK6Y6wrQ0N
 KhqNaMfc6fu+A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=PiQOjb8V
Subject: Re: [Buildroot] [PATCH 1/2] package/mcelog: fix musl build with gcc
 >= 14.x
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

On 18/01/2026 18:07, Bernd Kuhls wrote:
> Fixes:
> https://autobuild.buildroot.net/results/902/9020e4fda8cbc4f9886d5e8725f6df8d99716241/
> 
> The build error does not occur with gcc-13.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

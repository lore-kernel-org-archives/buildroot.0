Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 177CF10F3DF2
	for <buildroot@archiver.kernel.org>; Sat, 28 Mar 2026 18:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E959583EDE;
	Sat, 28 Mar 2026 18:23:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JCIc0QQBrhey; Sat, 28 Mar 2026 18:23:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6460083ED4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774722217;
	bh=Inik9yEw5vdWIcghxCXJHaEe7k49QHKKpbQCziBG2SE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BV5hAlnRiZvGQ05mpYFQXOingaxDGUEF8ZuEKXbRbj4Hel13wPDCR9Q3bV70H0Vwz
	 3zf3cLyJHtvZyMYs6MxAnNGU6Tmn+sdCdbO0inR6IH/2kJiVD/91jHf8A6xpBbxpFz
	 uIeSgXtstFGsuu7QgRttX6KrF9G5pdudDQB4kP585mlikKEEc2hzOgdiVx8fdFZi2p
	 4DAe0fa2xn6/mffWd/UWPtpOOlas1QxvT1I99oSsRjAxo00EKUUWe9IYscdeaXvp8D
	 OzZ0k4WLJQfFoURsk+g7iOfmVJev5DDe2sYjkuLFZQPMLgoRigp+SKbP+x1WtGdzDf
	 xmWHmEqfzE3OA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6460083ED4;
	Sat, 28 Mar 2026 18:23:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B204610F
 for <buildroot@buildroot.org>; Sat, 28 Mar 2026 18:23:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A43044117C
 for <buildroot@buildroot.org>; Sat, 28 Mar 2026 18:23:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FurJ7PzyNTpc for <buildroot@buildroot.org>;
 Sat, 28 Mar 2026 18:23:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B466141183
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B466141183
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B466141183
 for <buildroot@buildroot.org>; Sat, 28 Mar 2026 18:23:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 78B1F13F88F;
 Sat, 28 Mar 2026 19:23:29 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 28 Mar 2026 19:23:29 +0100
MIME-Version: 1.0
Date: Sat, 28 Mar 2026 19:23:29 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260302210037.1931571-2-bernd@kuhls.net>
References: <20260302210037.1931571-1-bernd@kuhls.net>
 <20260302210037.1931571-2-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <36ceeca8584fb05d82c7106f75be2f7e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1774722212;
 bh=VT5Y3uHX9wwps/ZZQSH4RvfInriYlbXh3JgRA53/ZTU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NXnaFUjC8XpZWVuU9mI4ijyjT2rqzICEOLpEtXhp9BsgY02DvcsbeU1FwIjR8ihJO
 Z7eQe0+tfYk1dnodv72Dqpvtaq4PRzg4WG+c8M1H0vhL174plliSFHVDgXbkEZbf9E
 WXaaM7zYhrrsqGV3y0Wo2aDj9ySNe7O04zS6VJkzl3zvib8BYNxrU12aT5+PRdbeQI
 CfGsU0dNnXQI0b8OXh3Ez7R5ZGN2BUS8iY2MwZ81woRz1IaiCpmUP4cazT3SSN59ib
 1PegVt+yYXmc9gvH0WCXm0bIQaDQgopN5rM/R6x0lb1veAza+Aj8D01l0k3qoaqLZt
 IPlFJiktOLvpQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=NXnaFUjC
Subject: Re: [Buildroot] [PATCH/next v2 2/2] package/fwupd-efi: bump version
 to 1.8
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

On 02/03/2026 22:00, Bernd Kuhls wrote:
> https://github.com/fwupd/fwupd-efi/releases/tag/1.8
> 
> Added TARGET_LD to _MESON_EXTRA_BINARIES due to upstream commit
> https://github.com/fwupd/fwupd-efi/commit/a7ac71e3b391e040d9ca0d58d2d186be5b60b631
> which causes a misdetection of the linker used.
> 
> Build log without specifying TARGET_LD:
> 
>   Program ld.bfd found: YES (/usr/bin/ld.bfd)
>   [...]
>   /usr/bin/ld.bfd: cannot represent machine `aarch64'
> 
> Build log with specifying TARGET_LD:
> 
>   Program ld.bfd found: YES
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

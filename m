Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7450AC87FCC
	for <buildroot@archiver.kernel.org>; Thu, 31 Jul 2025 14:11:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35941846BB;
	Thu, 31 Jul 2025 14:11:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cpcH6g7yqV-I; Thu, 31 Jul 2025 14:11:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DB6684691
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DB6684691;
	Thu, 31 Jul 2025 14:11:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4DBDE160
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 14:11:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 33DD784663
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 14:11:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NFOdCCPjRT6l for <buildroot@buildroot.org>;
 Thu, 31 Jul 2025 14:11:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D498F8462F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D498F8462F
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D498F8462F
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 14:11:13 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 6A7DC60137;
 Thu, 31 Jul 2025 16:11:09 +0200 (CEST)
Received: from [192.214.236.6:50260] via [192.214.236.6] by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 31 Jul 2025 16:11:09 +0200
MIME-Version: 1.0
Date: Thu, 31 Jul 2025 16:11:09 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250730190118.448997-1-bernd@kuhls.net>
References: <20250730190118.448997-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <9db932964223944a8b043f02bfff0405@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753971070;
 bh=iR3HcF+ajqurbfJjemhykS4oummggLYIZkL1xNvFGTU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=P5Cgc6aPWMpBTqLjjSnToMu+yc1MZxat49STaeBtzEmU7whZAqH6cO5G/WpDn4tzS
 uXv2p19Om13T0NyrYbUcYmk3PY/seLrp1DwmXjjDd+Y1VtA+8wEkZwRKc+siL0r88T
 xp5ph4sS1ITGZ4rNqtslj/VleEeyRehC904qDzOu65kCn0bPn6zd5SU5uOhbWj2FK7
 aWdqOuWmLxahwQRaClITTTSP0x4pIfFNLX0k4OuoNOmtZ0EoolduRQgth+WzUOTrQg
 86J7MFm/gN6S5C443XJQ87Feo8G914ewpewVIZrXO2f6iXjO8xqU6RRVZBlKWaUAjk
 7+R2aWIz16xCA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=P5Cgc6aP
Subject: Re: [Buildroot] [PATCH 1/1] boot/syslinux: fix build with gcc-15.x
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

On 30/07/2025 21:01, Bernd Kuhls wrote:
> Fixes build error with gcc-15.x:
> 
> drivers/net/3c509-eisa.c:39:26: error:  initialization of 'void 
> (*)(void)'
>  from incompatible pointer type 'void (*)(struct nic *, struct 
> eisa_device *)'
>  [-Wincompatible-pointer-types]
> 
> For a similar fix see https://bugzilla.suse.com/show_bug.cgi?id=1243225
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

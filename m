Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB71CCFA00
	for <buildroot@archiver.kernel.org>; Sat,  1 Nov 2025 19:46:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A2E684422;
	Sat,  1 Nov 2025 19:46:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9jnaHEnH6Qxi; Sat,  1 Nov 2025 19:46:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51B208436A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51B208436A;
	Sat,  1 Nov 2025 19:46:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3366A93D
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 19:46:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 24F94612FE
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 19:46:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aI8bF0X2TaUE for <buildroot@buildroot.org>;
 Sat,  1 Nov 2025 19:46:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2730B612F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2730B612F4
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2730B612F4
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 19:46:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 7564C5FFA3;
 Sat,  1 Nov 2025 20:46:02 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 01 Nov 2025 20:46:02 +0100
MIME-Version: 1.0
Date: Sat, 01 Nov 2025 20:46:02 +0100
To: Adrian Perez de Castro <aperez@igalia.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251014130450.3631335-1-aperez@igalia.com>
References: <20251014130450.3631335-1-aperez@igalia.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <ba7b87130c6c31953f8fc1c016141dfb@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1762026364;
 bh=z3+3TWaIvILrX4vicsdWe9NCO6EnUXvO8BjUcnx9bLw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tz+1dfIGPQtchyX421onXMwohYMQEAXMSCtaXvFUxGg7fehIRMQfNOHqJhYt1lZIw
 3ueDxOapEvSpvmU97YTruFWmMeIvbXjakq8jjH9TIFapvwJgVj84H1myatT89e3REk
 0vf9J3wPzESI0VkJ4PPqFTGKs+Ldi0boINs/0tU20Dh0+GUbA7PJXIzZ7j1y3tTBDB
 LvZRkIR85yTH5CXW3+kOgzvvURQNUtYixFxy5dIlbyiQbSz5kPcUFpxR+P3FXoih6+
 Mr3qWqBnE/6sh0mwKqTesaIf3wl/Sn5+KSxXFoqmLkKu9/vuyP00GzcbN6XWekQSMN
 hT1Lgy6Q8KOkA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tz+1dfIG
Subject: Re: [Buildroot] [PATCH] package/libmanette: bump to version 0.2.13
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

On 14/10/2025 15:04, Adrian Perez de Castro wrote:
> Bugfix version, the only changes listed in the release notes are 
> updated
> mappings in the controller database:
> 
>   https://gitlab.gnome.org/GNOME/libmanette/-/blob/0.2.13/NEWS
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

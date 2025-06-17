Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 742B2C71157
	for <buildroot@archiver.kernel.org>; Tue, 17 Jun 2025 21:10:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D7C1408A4;
	Tue, 17 Jun 2025 21:10:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sb5R61TBYq4O; Tue, 17 Jun 2025 21:10:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 650A44075E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 650A44075E;
	Tue, 17 Jun 2025 21:10:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4461816B
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 21:10:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 35D4A40791
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 21:10:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vJyMaozp8UML for <buildroot@buildroot.org>;
 Tue, 17 Jun 2025 21:10:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6D71D4074A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D71D4074A
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6D71D4074A
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 21:10:39 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 7482719F576;
 Tue, 17 Jun 2025 23:10:35 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 17 Jun 2025 23:10:35 +0200
MIME-Version: 1.0
Date: Tue, 17 Jun 2025 23:10:35 +0200
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250616200430.4097707-1-bernd@kuhls.net>
References: <20250616200430.4097707-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <c05e714be7911fc88963caebbde7610a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750194636;
 bh=BiUF+P8pE06yCPkxanBkZtpHiq/xelhRsGOLNo/hnUA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FE8Jfmkhkpyj3QJMci7wcxv/liMTZ1qwwF8Dusf7wZ/PuBACz3p4ILLUnztKhRQsZ
 oUilRS4cZ+KKPIr184DeCyMJVGUO0/cWEnlg50OzCUJudI9gytyNQDJxfc6aPngPS8
 JPIADtGiqqxFWFcFqLOqQ+fOEJ6dYANxfu/MDfwmBwg6Rdq49lhrgnlMmNJcdBvftF
 7zqVqjBV75vNfegTRZWMLerQg7SIa4a6wUBgqJe1bIO8vYDnyyWs64KPmwhAgkHo2m
 yO/K1vrCdOOMULAz+WGZjXaMZDrLNgv26tDuP5o1zjMZVn2JfZWER8L3lxJ30pzoNe
 frvx48/c10kgg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FE8Jfmkh
Subject: Re: [Buildroot] [PATCH 1/1] package/stellarium: bump version to 25.1
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

On 16/06/2025 22:04, Bernd Kuhls wrote:
> Release notes:
> https://stellarium.org/release/2025/03/23/stellarium-25.1.html
> https://stellarium.org/release/2024/12/22/stellarium-24.4.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

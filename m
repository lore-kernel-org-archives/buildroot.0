Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4018BCFC539
	for <buildroot@archiver.kernel.org>; Sat, 22 Nov 2025 16:17:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 113D540FFE;
	Sat, 22 Nov 2025 16:17:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hPhNZLWvUCqD; Sat, 22 Nov 2025 16:17:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24BA940AF0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24BA940AF0;
	Sat, 22 Nov 2025 16:17:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C30B2158
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 16:17:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A8E99404C5
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 16:17:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gTPUSc-npOaZ for <buildroot@buildroot.org>;
 Sat, 22 Nov 2025 16:17:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9802240382
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9802240382
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9802240382
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 16:17:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id C32CB19F5A7;
 Sat, 22 Nov 2025 17:17:03 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 22 Nov 2025 17:17:03 +0100
MIME-Version: 1.0
Date: Sat, 22 Nov 2025 17:17:03 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251120214507.1251665-1-bernd@kuhls.net>
References: <20251120214507.1251665-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <515caf17bebfedc1823c06144963efb9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1763828224;
 bh=Z5fIo0QasOnhKLdT2pxqDHCBgSyAJf7YPbhjh2ZNjVs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=m1nLW9XGcCDmdm5PZ+loIqQLCWDkvla3CpFnApnLH3Ha6yXkP/sJ19geS6FlJjhdp
 GlCB0qSOJO1VMiwyHWBLYw7W8pH2HCv0GqDeC6Rzpbf+PstCJUjkENN9UEle6oqMem
 4ZtWip3BGPed8N5BuXB3Llts1xbVssTBkOHw6U8XLCSFy42nLejU+gwzNKUqhtOVxY
 hMAb4ey+eo2NjnVFgR/97J/JomIWrI9Brwi+lWDTXbQV0MG4tYOUX1r+K9AbvMle4K
 bKbzZnf3fTEUNf83wVimVY8+Bui6En6n6jSy1GJPm7pqQv6KPEkJJPrN3GNNr76VWk
 Ta4PIptsZ6o3w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=m1nLW9XG
Subject: Re: [Buildroot] [PATCH 1/1] package/php-gnupg: bump version to 1.5.4
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

On 20/11/2025 22:45, Bernd Kuhls wrote:
> Changelog: https://pecl.php.net/package-changelog.php?package=gnupg
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

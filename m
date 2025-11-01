Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94243CCFA00
	for <buildroot@archiver.kernel.org>; Sat,  1 Nov 2025 16:30:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B2D7612B9;
	Sat,  1 Nov 2025 16:30:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KzkYnSXYERID; Sat,  1 Nov 2025 16:30:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD72161283
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD72161283;
	Sat,  1 Nov 2025 16:30:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5497B93D
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 16:30:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 46A1F41FA9
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 16:30:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K-M07fs4vJzz for <buildroot@buildroot.org>;
 Sat,  1 Nov 2025 16:30:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2293841F81
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2293841F81
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2293841F81
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 16:30:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id CA07E780331;
 Sat,  1 Nov 2025 17:30:05 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 01 Nov 2025 17:30:05 +0100
MIME-Version: 1.0
Date: Sat, 01 Nov 2025 17:30:05 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251031222212.2654828-1-bernd@kuhls.net>
References: <20251031222212.2654828-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <fa56b6cbb89d364884faf50236f2a2a2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1762014606;
 bh=Mx3Q063hVub54X24zIRBAyTmALwhJ+TybbnTBRSwtk0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Hq+s2j1zTKZQwf51iFctu2nziW1LsTJnoj1ikvZGyIXBNyYrQeoz0/yxmgDSlrVsN
 JmqmWieGn53zdcXuanqXH3rc13LDe2deok40kH5CSiVb3J4qzQ9BLezQwtZZoy8l/p
 KM0V75gCcx4hhUxku1ZGdwKC5RdgG7WS6AqYhYLhgUMTL/jzU7V4PYMezg8HIo78VZ
 yijVqFfCMRSa2zDYsl1TEDPcpXjiogea5w7enLPEowJPR9gNaDjY2Lw6v92R+DyNvG
 Pr0YKk1Fguh5eQ8uuHhjJeJGT5eHoyftTqh9AHY5qDeWBORKqnJ/XtpF0TBmAG4+3y
 xUUDHEbKYcrfg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Hq+s2j1z
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi: bump version to 21.3-Omega
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

On 31/10/2025 23:22, Bernd Kuhls wrote:
> Release notes: https://github.com/xbmc/xbmc/releases/tag/21.3-Omega
> 
> Removed patch 0002 which is included in this release:
> https://github.com/xbmc/xbmc/commit/957b4faa0b765bc91e64c6d33f07e853decae0d0
> 
> Updated Java libraries due to upstream commit:
> https://github.com/xbmc/xbmc/commit/7b7e20eaaa831d7740d151bdfe22c3257f5a4102
> and refactored their version numbers.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

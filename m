Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39332C0218F
	for <buildroot@archiver.kernel.org>; Sun,  2 Feb 2025 14:28:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5FC060799;
	Sun,  2 Feb 2025 14:28:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EbDP67uq182e; Sun,  2 Feb 2025 14:28:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1269C60756
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1269C60756;
	Sun,  2 Feb 2025 14:28:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C4ADB12A
 for <buildroot@buildroot.org>; Sun,  2 Feb 2025 14:28:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B3E0C60741
 for <buildroot@buildroot.org>; Sun,  2 Feb 2025 14:28:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f69uOGEFf-0X for <buildroot@buildroot.org>;
 Sun,  2 Feb 2025 14:28:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6697D60A47
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6697D60A47
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6697D60A47
 for <buildroot@buildroot.org>; Sun,  2 Feb 2025 14:28:13 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id AD76713F86E;
 Sun,  2 Feb 2025 15:28:09 +0100 (CET)
Received: from 2a01:e0a:485:b220:1449:f756:904c:bbad
 via 2a01:e0a:485:b220:1449:f756:904c:bbad by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 02 Feb 2025 15:28:09 +0100
MIME-Version: 1.0
Date: Sun, 02 Feb 2025 15:28:09 +0100
From: Julien Olivain <ju.o@free.fr>
To: Petr Vorel <petr.vorel@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250131221038.1139687-1-petr.vorel@gmail.com>
References: <20250131221038.1139687-1-petr.vorel@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <e3e51bccfc4a70f4f397e20e2e381fa1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1738506490;
 bh=bPYnAN9ye0D/U5mq17UUNQThR4L24ejxxlo6SaZY9bE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eRhPmHLr7AyGx8Pl7e8QA6i/zVUp3hA4dXFCnQSK6qjLWsee9KBmX+SAYWADI7T+j
 M3cmefRP73pbgGNcm2/4kq0+LoB+VcOI38chFa4mzi/ypXhaVDLwzD5u5k88xuWaLQ
 PluinpcPsCaloU8uRrwNaA42Gt/yi8K6f0TGK/4cTRDgLecfd785PwUwLLkpQhr8eV
 8TG3Oaiirm1JEfZ4dzvJQbmEuYyCuvLIvcHO3y05dHvEiLt2HMrezWN7UvW8R8lOYd
 K9kUv+wciJ5y17neo9Wmnr+nhrmzursELh40NVaRF8X+zQGiSyFG15R4HGeP0p9a1V
 Alb4DVXyLUFuw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=eRhPmHLr
Subject: Re: [Buildroot] [PATCH 1/1] package/ltp-testsuite: bump version to
 20250130
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

On 31/01/2025 23:10, Petr Vorel wrote:
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

Applied to master, thanks.
I also added a link to the change log.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

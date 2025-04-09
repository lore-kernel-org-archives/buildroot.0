Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 436E3C36002
	for <buildroot@archiver.kernel.org>; Wed,  9 Apr 2025 20:08:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1343F83F8D;
	Wed,  9 Apr 2025 20:08:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yr5uvS5UsR7p; Wed,  9 Apr 2025 20:08:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3CED98341A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CED98341A;
	Wed,  9 Apr 2025 20:08:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 21339D6
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:08:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 12D00413CF
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:08:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c7fJDGXyUMYQ for <buildroot@buildroot.org>;
 Wed,  9 Apr 2025 20:08:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 683AD41319
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 683AD41319
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 683AD41319
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:08:38 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 6AD1F2003C8;
 Wed,  9 Apr 2025 22:08:35 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 09 Apr 2025 22:08:35 +0200
MIME-Version: 1.0
Date: Wed, 09 Apr 2025 22:08:35 +0200
From: Julien Olivain <ju.o@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250408194808.53576-1-giulio.benetti@benettiengineering.com>
References: <20250408194808.53576-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <adc93cab99a8f38d91441fbee516cc20@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744229316;
 bh=POd4plWze/EDEriInZG8VD9RELryAexblBiA3jOaWsM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SZ6c9BpfSM7fJEXDPWibaFsmFWoTWAmyKqVder8opHhz0GfSJwwOGBsm/GMee6MEL
 aZR3cwA/+62nCorb2O07YDF/kMoCT8ZgrSJUz9po58rRQwuTZxRzVAXZjyS0IydrcW
 eyl0vczEUh0xYG1WZRJnxkaLhL/08gKA6sPBJHQhMVHNZZ8e5r4HET7j1njcoiKIsk
 BIv4lGR0Wcohi4Cj89HNZKJ7htd6JVddsbDbq9J7SOtvhB/A3X3cWm1U6XSa5QZGjL
 3QltyJndP7C79Lex0zEkgEBxH4vXldsUiFJX5Hfw/mAtEW5pCFHYwqavew6Tb9S5c+
 LXu2v2//kvsYQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SZ6c9Bpf
Subject: Re: [Buildroot] [PATCH] package/esp-hosted: bump to version
 2025-04-08
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

On 08/04/2025 21:48, Giulio Benetti wrote:
> This version add support for esp32c5 and local patch has been committed 
> so
> drop it.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

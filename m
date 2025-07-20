Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23515C83F22
	for <buildroot@archiver.kernel.org>; Sun, 20 Jul 2025 20:51:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF6C640B76;
	Sun, 20 Jul 2025 20:51:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QQa3cVE0CoD4; Sun, 20 Jul 2025 20:51:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0797240A14
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0797240A14;
	Sun, 20 Jul 2025 20:51:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D630E7AB
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 20:51:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C8BCC61193
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 20:51:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f2-XTFmXu6tQ for <buildroot@buildroot.org>;
 Sun, 20 Jul 2025 20:51:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C998761103
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C998761103
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C998761103
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 20:51:21 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 00E68B00576;
 Sun, 20 Jul 2025 22:51:16 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 20 Jul 2025 22:51:16 +0200
MIME-Version: 1.0
Date: Sun, 20 Jul 2025 22:51:16 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250720200830.142282-1-giulio.benetti@benettiengineering.com>
References: <20250720200830.142282-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <5ca2f990d963038a232435c55e946789@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753044678;
 bh=G513PGCfKDqbizRM/DgrmS318K99mFwiW66gGUg4zZo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=H60SEvMqjbziJ4zYcFEh4NAHXltibtP80Z6bN8NLg+ha0dXcO0cYZf4rPz8IAiLP4
 9Se1nOpu2HynWLjy0EDaELsNMuORtH3Gyh0jvwCJgFpShsTDWJw1qpDz0GgmHQ4W1a
 ovVU7eyZBmA3VZMDoACxNQKBYoituCHZbPrVr1R7zx6YY4Gik7VEPrBnIBoj3gG1qY
 AOgppEUkdy8chJ0cbjGKEZmr04lYnZAxnbHgdswWgogh3C4fYuj17SEf/cMslu09ai
 nfBsDwV5yaqJrcjvI5Y7KX3hZuEdJegMNeuoq4SYAPOeN0eEFVZUrFEEhiuF8JvJZw
 jaMFnbdXvvIEg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=H60SEvMq
Subject: Re: [Buildroot] [PATCH] package/harfbuzz: bump to version 11.3.0
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

On 20/07/2025 22:08, Giulio Benetti wrote:
> Release Notes:
> https://github.com/harfbuzz/harfbuzz/releases/tag/11.3.0
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F88C2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 17:12:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA64540C64;
	Mon, 19 May 2025 17:12:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZpagX9aAgtCX; Mon, 19 May 2025 17:12:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CF46407E8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CF46407E8;
	Mon, 19 May 2025 17:12:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AEC52D4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 17:12:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 948504066E
 for <buildroot@buildroot.org>; Mon, 19 May 2025 17:12:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ssxq4V7ZlYCe for <buildroot@buildroot.org>;
 Mon, 19 May 2025 17:12:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C2244405D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2244405D9
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C2244405D9
 for <buildroot@buildroot.org>; Mon, 19 May 2025 17:12:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 8958313F854;
 Mon, 19 May 2025 19:11:58 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 19 May 2025 19:11:58 +0200
MIME-Version: 1.0
Date: Mon, 19 May 2025 19:11:58 +0200
From: Julien Olivain <ju.o@free.fr>
To: Kadambini Nema <kadambini.nema@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250518211305.222842-1-kadambini.nema@gmail.com>
References: <20250518211305.222842-1-kadambini.nema@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <955f917d82ac0641899c40dc60d9ef8a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747674719;
 bh=Fzuc6lVxLrVWu55Tm3tq30CjhRfXbREgWXkLK7aqYpA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GBTk91InE6FEmH8MxOWZbWnkSaEq0AAZwIMaxPmC4U5WIyBAeF2Ge/fzi8y8jLvRi
 za94jpE9xRZ3xlPJKIOFxz2V8Kiw6tL83AFTjdsghudB6FYb7d7qzzejBB6Z98YmZZ
 fU+edPBFXV7DM54Muj8ZCmBwiQN4nDNFRoiDNoV0/VvrwW+b5eYw7LGyBFGcYyskxt
 rHBp2lzcLbfYoVQahSvOIVAlMZwLMW8K9l0g6fSLa/tfnScc83+p1OXlQm9i97ryJk
 dZMsUslgmA81V6VtYyeGTztuHe0cJxnrVQNHlTQRCnAvH7wuvTGPUTMAoP9I/4TJGG
 5DhEX7fcP9mnw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=GBTk91In
Subject: Re: [Buildroot] [PATCH 1/1] package/gperf: bump to version 3.3
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

On 18/05/2025 23:13, Kadambini Nema wrote:
> Release notes:
> https://lists.gnu.org/archive/html/info-gnu/2025-04/msg00013.html
> https://lists.gnu.org/archive/html/info-gnu/2025-04/msg00004.html
> 
> Changelog:
> https://git.savannah.gnu.org/gitweb/?p=gperf.git;a=blob;f=ChangeLog;h=7966fcd0384f833f8b7d8ebdf9c5c90c22b4e48c;hb=d2aeec9b9c1fd04dbf747afe4ada8e772d315ccd
> 
> Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42215CCD183
	for <buildroot@archiver.kernel.org>; Sun, 19 Oct 2025 15:17:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A3EC61136;
	Sun, 19 Oct 2025 15:17:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6cvvZHOEScgP; Sun, 19 Oct 2025 15:17:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36B6760E01
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36B6760E01;
	Sun, 19 Oct 2025 15:17:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B9B481CD
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 15:17:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB16883ED4
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 15:17:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b5f3iuIPqI8y for <buildroot@buildroot.org>;
 Sun, 19 Oct 2025 15:17:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CBCD283ECE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBCD283ECE
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CBCD283ECE
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 15:17:39 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id EACD713F899;
 Sun, 19 Oct 2025 17:17:34 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 19 Oct 2025 17:17:34 +0200
MIME-Version: 1.0
Date: Sun, 19 Oct 2025 17:17:34 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20251019104224.605009-1-bernd@kuhls.net>
References: <20251019104224.605009-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <2882deb0d600c701892752ef33a6daa7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760887058;
 bh=VCofAzEJp6oEPFQ6uCi1u06/GloUO308RLzY5XP8q4I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MumcJ5ZmJzXrACGa6FdYPk1Lyjon7lIpbsxFvaFV643vUaL9+8rX4G9sWQErjqpiR
 0yGUtaqi1FLYLL59lqAn5tSAglqkzfHhwltpl8nlGMk5vmIGDpWgXEdIJ55DroqQuL
 tokuFKcBP8lDD/6E4jDFRX9qdfvNlmSXVGsVPhbReYTxf9hb1UKKN4u3TX+5uR3vd1
 b3CdyreFkUswg8IVOcrX7sGxJLkhV0W6yX4BUSRtBi9r5/wnyhVmgtFRGM5U46zgNQ
 eXEQMHOZXQ9U9MazunL4/FuMIeumvaVYV5VWOzky98sPcxnCMSi5qWrC9nIY2eD599
 npqW152rZcX6w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MumcJ5Zm
Subject: Re: [Buildroot] [PATCH v2 1/1] package/python3: bump version to
 3.13.9
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

On 19/10/2025 12:42, Bernd Kuhls wrote:
> Release notes:
> https://www.python.org/downloads/release/python-3139/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

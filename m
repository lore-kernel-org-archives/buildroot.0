Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D8A1CCF9E3
	for <buildroot@archiver.kernel.org>; Mon, 10 Nov 2025 19:10:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5591780CFE;
	Mon, 10 Nov 2025 19:10:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wlostB53sWVa; Mon, 10 Nov 2025 19:10:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 246C080B94
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 246C080B94;
	Mon, 10 Nov 2025 19:10:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B02E25D
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 19:10:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D2FE4067E
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 19:10:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5zkTEw3OGPFn for <buildroot@buildroot.org>;
 Mon, 10 Nov 2025 19:10:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9F1A14067A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F1A14067A
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9F1A14067A
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 19:10:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 9667E5FFAF;
 Mon, 10 Nov 2025 20:10:17 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 10 Nov 2025 20:10:17 +0100
MIME-Version: 1.0
Date: Mon, 10 Nov 2025 20:10:17 +0100
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20251110084735.431109-1-nemaakhilesh@gmail.com>
References: <20251110084735.431109-1-nemaakhilesh@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <26e188e03c7c957394e1e2819c68380e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1762801820;
 bh=arc/e09BoY23PPFfJqobpjCRlG2x7dM9Yk3lZNq7CtU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YX1fbRi5Xcc7aZ3bRj1fb7iD32032E0XF/Apaf935t1pN2D+WTM/TqonyMqJSQ+LO
 t61YtRtNN7AEloecAvjvqRExHdwtxW535GTLoBIFfHsS0iU97SKA/zhQCKM9/B8H9h
 IdOhfOcT7JO633m8BME+rE5vX2aMWY2Ng9mOhsLko5/xS7YOG19eKGIMyqS3CW+o0k
 +Y5ZyNX9xFvOUOq3Q2ksY7WHE68fgGnq8lUen+Z/1ktXI8E0sfwDbZd36bxlRI91SO
 kwBlPkiRz9X/CZHQ1A+Brvnb8pCA+JDvPQq56yVSnyhXUealJlCoPevXvQw54Ujvs0
 xDzleRfzylUQw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YX1fbRi5
Subject: Re: [Buildroot] [PATCH 1/1] package/liblinear: bump version to 2.49
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

On 10/11/2025 09:47, Akhilesh Nema wrote:
> Changelog:
> https://github.com/cjlin1/liblinear/compare/v248...v249
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

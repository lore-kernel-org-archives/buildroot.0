Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A71C1C02181
	for <buildroot@archiver.kernel.org>; Wed, 22 Jan 2025 20:43:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 664EC403B6;
	Wed, 22 Jan 2025 20:43:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pE8kqcztRX_Y; Wed, 22 Jan 2025 20:43:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C9A641276
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C9A641276;
	Wed, 22 Jan 2025 20:43:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E272B88
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 20:43:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3BF0960658
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 20:43:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EUIwJ5U0MCpG for <buildroot@buildroot.org>;
 Wed, 22 Jan 2025 20:43:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5593C60612
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5593C60612
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5593C60612
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 20:43:04 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 3B53DB0053E;
 Wed, 22 Jan 2025 21:43:01 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:45752])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 22 Jan 2025 21:43:01 +0100
MIME-Version: 1.0
Date: Wed, 22 Jan 2025 21:43:01 +0100
From: Julien Olivain <ju.o@free.fr>
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250121092002.19476-1-nemaakhilesh@gmail.com>
References: <20250121092002.19476-1-nemaakhilesh@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <cb3a3788cd00b1b6c9f72e4bfe14c8fe@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737578582;
 bh=0NY0rwKyiVztqfIP8CfCGUM/NpkdvedebcqY6kiIWFM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lpweuI7iRjpSu9jDENTanxtNblWwv2XqD0ItzBWiAF1Ygyx5yhvHoGiuZgJtkij+Y
 ZRWGfFAmh3sRvFzySZIBYj0KHlkXxrpRgH1enZN09h05Ud9qCfq6OgitWee3wd6422
 GiS/N2PQyVMKW5cFNIFkqCvTovzp8QZeYRWCby/pwSGf2MkQCrXCZrATS6ems5YqkB
 AGQ9jyduDbBtrQ3MA868Lm9hwtcheln4huvpkWRL3gt+iEmWilYAAuPfLKzK7ekL3H
 L1M0ebaIdDJ3MmdbDv90erbduoZ4whbsSluB6axYozE7Vmv8P1wnpY8bOqD2EeQb8N
 /8LI40Cs/++CA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lpweuI7i
Subject: Re: [Buildroot] [PATCH 1/1] package/mtools: bump version to 4.0.47
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

On 21/01/2025 10:20, Akhilesh Nema wrote:
> Release notes:
> https://lists.gnu.org/archive/html/info-mtools/2025-01/msg00004.html
> 
> Changelog:
> https://svn.savannah.gnu.org/viewvc/mtools/tags/4.0.47/NEWS?view=markup
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

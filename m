Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDF16C0218C
	for <buildroot@archiver.kernel.org>; Sat, 25 Jan 2025 20:05:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87E70824E3;
	Sat, 25 Jan 2025 20:05:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GfxGRg3Sk4CC; Sat, 25 Jan 2025 20:05:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADE60825BF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADE60825BF;
	Sat, 25 Jan 2025 20:05:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 177321183
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 20:05:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 04F1540F98
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 20:05:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dhQckK7aEF3r for <buildroot@buildroot.org>;
 Sat, 25 Jan 2025 20:05:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BC88340F88
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC88340F88
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BC88340F88
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 20:05:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id E24935FF88;
 Sat, 25 Jan 2025 21:05:37 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:40746])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 25 Jan 2025 21:05:37 +0100
MIME-Version: 1.0
Date: Sat, 25 Jan 2025 21:05:37 +0100
From: Julien Olivain <ju.o@free.fr>
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250118100240.882277-1-nemaakhilesh@gmail.com>
References: <20250118100240.882277-1-nemaakhilesh@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <b96a5c9c4fea1a7ba29f8c630398db7c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737835539;
 bh=7g+lFGZqUMY/g78SYG8D7MQ4L2557Lr88r8mgdI5NKg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JViUXXi7TzpANeNOmnj+71piYV7MpBFPrJAuJkjkIrgl1l+lyAguWg8Hn7/+bukcy
 jLVspqPBtZmwuP2X4bJZyg1pWBkQ9EvDdPlbGZkcis86VzgNAQHHfSGUQdJEMRc4SU
 /4uLm2KR9qxkYB10BP3UYut05qZeiuv1W1t4La5PxDKim/0Z8dz6rB4Pp6/8uEi4Wz
 5InX4io7i2Pbh78OueHIg5kCFgji1BfuUZ6OrjF/aqYDuig6Q+gCRF0dOvBmwaM0tF
 7Twx5HHHmjv4UmGwE3EgOVVWKNGGX+PWCSzsvPsif6lSeb/k27GiWcqbjoHfKZB8fq
 Iq6UGQqznSdvA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=JViUXXi7
Subject: Re: [Buildroot] [PATCH 1/1] package/nettle: bump to version 3.10.1
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

On 18/01/2025 11:02, Akhilesh Nema wrote:
> Release notes:
> https://lists.gnu.org/archive/html/info-gnu/2024-12/msg00008.html
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

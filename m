Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD01D116E2
	for <buildroot@archiver.kernel.org>; Fri, 28 Nov 2025 17:59:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 332FF809AB;
	Fri, 28 Nov 2025 17:59:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aPr0W0nHKzhE; Fri, 28 Nov 2025 17:59:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D3638084C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D3638084C;
	Fri, 28 Nov 2025 17:59:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DCCC3273
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 17:59:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF1EE8080F
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 17:59:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nHJen20cahBt for <buildroot@buildroot.org>;
 Fri, 28 Nov 2025 17:59:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F029B807C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F029B807C7
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F029B807C7
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 17:59:27 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id B908619F5A5;
 Fri, 28 Nov 2025 18:59:24 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 28 Nov 2025 18:59:24 +0100
MIME-Version: 1.0
Date: Fri, 28 Nov 2025 18:59:24 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251128100305.952494-1-giulio.benetti@benettiengineering.com>
References: <20251128100305.952494-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <34f0196c04fc8126b72028bf7fc25fd4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764352765;
 bh=cDoCf+7rqC0Psehy2qIHYBQ0iS9myBK60Nl3j2h8OR8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=R62j6aOunyPEUdZIs4236rYrqlAaBmXt6hyOIJhHCjRtW2aLAzfWAmvnXcQ0nOAzd
 xtWT+RKcrwKHSR0qR0u93imNJrQvfttWRRVpQJRgJh9QAHzCrhTeFIw9uxUgx4/E70
 AEYi/GuWNhhC21vHUZ/+FBDWcPG1uuZ3F/NXdGH8myWUrKR+AJzRAKrjV7pw5z244V
 DzEaWycl7QJDCWcDjabDG2Xv79JghvB3QP6ks85LS1oESrRoTsCKMSWnqRJ2SpyhIO
 9m3rHgNmqkLc/1KfiVElEcT9qGvAtmunsUZrrPWFk6IYKfigfPMqyJWkkHRKdzCbM5
 KB3+Q3G11lBGQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=R62j6aOu
Subject: Re: [Buildroot] [PATCH] package/sdl: fix build failure due to type
 mismatch
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

On 28/11/2025 11:03, Giulio Benetti wrote:
> Add local patch to fix:
> ./src/stdlib/SDL_iconv.c: In function 'SDL_iconv':
> ./src/stdlib/SDL_iconv.c:50:29: error: passing argument 2 of 'iconv' 
> from incompatible pointer type [-Wincompatible-pointer-types]
>    50 |         retCode = iconv(cd, inbuf, inbytesleft, outbuf, 
> outbytesleft);
>       |                             ^~~~~
>       |                             |
>       |                             const char **
> 
> Fixes:
> https://autobuild.buildroot.net/results/cfb/cfb1f9a0137332cf080ce862722e4fe8ad275031/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

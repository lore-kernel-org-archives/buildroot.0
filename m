Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 236ACE77199
	for <buildroot@archiver.kernel.org>; Wed,  8 Jan 2025 21:45:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AEADB60687;
	Wed,  8 Jan 2025 21:45:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a3eyRjeznK-R; Wed,  8 Jan 2025 21:45:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9ECC060827
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9ECC060827;
	Wed,  8 Jan 2025 21:45:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A205F1FF7
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 21:45:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F8F840260
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 21:45:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5mt0-r7rKObd for <buildroot@buildroot.org>;
 Wed,  8 Jan 2025 21:45:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 56B5C40146
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56B5C40146
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 56B5C40146
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 21:45:21 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -988164391; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 08 Jan 2025 21:45:17 +0000 (UTC)
Message-ID: <bc19f010-bd2b-4c4d-bc75-aa076f71a84c@korsgaard.com>
Date: Wed, 8 Jan 2025 22:45:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>, Bernd Kuhls <bernd@kuhls.net>
References: <20250104152722.90914-1-thomas.petazzoni@bootlin.com>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20250104152722.90914-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=C7bikaoz/x2fdNnmExX0UMAibdU7xNs99UhAkimNCsMozITV9oBCEH0+rtT/ziDG5ZarcNn8JtGAqRRqof/EXZwLEDI85wlt3zOrHyem4Zav46MTggcO7D3jH/ZFlJq7q0l68GihHeUBXJhJIo8WPhgcb0Ay9o4FbjicOdiZXfCjijtiIqexhybwr5CVc68pu2lH3LtkS6gk0ggaQlWyOPbj6/FbrmTWihNmMF9ch7aR8uf4Ju2dxs2k62my+C4k4Ayf59YEDzGwieUUjng7m4Pl4V2jFxY5WlwE0VyQNNG9BmTBJ/AOXLnDRO26G/N+ZQvAbmFv07W63eah71PUdg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=eOSq8D+om2puXJ2ZwGsrYagX8COoNiW/I+zUwKQ+I7s=;
 h=Feedback-ID:Received:Date:Subject:To:From; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=C7bikaoz
Subject: Re: [Buildroot] [PATCH] package/php: backport upstream patch to
 fix/workaround xxhash issue
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

On 1/4/25 16:27, Thomas Petazzoni via buildroot wrote:
> Since the bump of xxhash from 0.8.2 to 0.8.3 in Buildroot commit
> 4b8f2f3a5e45fe2962a9fcdb148d32198929e228, the host of host-php fails
> when host-xxhash has been built before.
> 
> This is due to the fact that host-xxhash installs
> HOST_DIR/include/xxhash.h, and the PHP code has an internal xxhash.h,
> but due to the order of CFLAGS, the one from HOST_DIR/include/xxhash.h
> gets included instead of the internal xxhash.h from PHP.
> 
> We initially tried to fix the order of CFLAGS, but that has proven to
> be challenging within the complicated PHP build system. Then, we opted
> for renaming the internal xxhash.h header of PHP, which we had
> implemented and were about to submit upstream. But while rebasing this
> fix on PHP's master, it turned out that PHP has an upstream commit
> "Sync headers installation", merged for PHP 8.4.0, which has the side
> effect of avoiding the issue. This commit moves xxhash.h into a
> subfolder, so it gets included as #include "xxhash/xxhash.h" now,
> which avoids the conflict with HOST_DIR/include/xxhash.h. Maybe not
> the best fix, but it does fix the issue and it's upstream.
> 
> Since this patch is tweaking the PHP build system, we need to do the
> equivalent of "autoreconf" but in the PHP world. It was already done
> for the target package, we simply add the same logic for the host
> package.
> 
> Fixes:
> 
>    http://autobuild.buildroot.net/results/583c054a564f90b8c884565070c5e17b43b89674/
> 
> Cc: James Hilliard <james.hilliard1@gmail.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Ups, sounds messy. Committed to 2024.11.x, thanks. For 2024.02.x I will 
instead drop the xxhash bump.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

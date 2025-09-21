Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A9BCAC5A7
	for <buildroot@archiver.kernel.org>; Sun, 21 Sep 2025 19:25:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 457798249E;
	Sun, 21 Sep 2025 19:25:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GLH1cUFnQAvd; Sun, 21 Sep 2025 19:25:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6128382513
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6128382513;
	Sun, 21 Sep 2025 19:25:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E377E7
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 19:25:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B65882513
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 19:25:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SwGXJxztRWwt for <buildroot@buildroot.org>;
 Sun, 21 Sep 2025 19:25:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 20BA9823C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20BA9823C6
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 20BA9823C6
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 19:24:59 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id B74AE2003D0;
 Sun, 21 Sep 2025 21:24:56 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 21 Sep 2025 21:24:56 +0200
MIME-Version: 1.0
Date: Sun, 21 Sep 2025 21:24:56 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250921185034.7025c654@windsurf>
References: <20250921161721.2070176-1-ju.o@free.fr>
 <20250921185034.7025c654@windsurf>
User-Agent: Webmail Free/1.6.11
Message-ID: <02a18f4cff33b6802fab4db7877f2a39@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758482697;
 bh=JLKJECm7TMiOO3f1LubNhlTOH3zkoZ3VTSKsZE4xqiY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hxdYoikdoabkEcleoMiL3W9dLBkR14tEeo2Jlc9PgY8KqLmPfoxQuON1S9rkfg+Sj
 dI/TzOpgXuHt92H8rwsr9AmM3ZyHkMYAEKlbgAXo7y7natQQnNLdVZLi7IhVrVbv3+
 1DiUGKQN7SDSs2P2qCdBBOHNA8x5eBIG1yScFDAaMOJjCxxYlWOxBWZme/q2aCugVj
 WwdzNIeqYrc9JJ6wjb9Ma++nyNWLq1Q2yU9EoFDodd/TqrK14LLq3bql05c1pujmI8
 mv4n7kI9Uc++J51EIgp7UWzTY0HKMiWECogNlqo2qWGJqUlRZPBnWgr9KnrxVUWCJK
 gLCqNC+ed/lIg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hxdYoikd
Subject: Re: [Buildroot] [PATCH 1/1] support/scripts/gen-bootlin-toolchains:
 avoid selecting _HAS_THREADS multiple times
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

On 21/09/2025 18:50, Thomas Petazzoni via buildroot wrote:
> On Sun, 21 Sep 2025 18:17:21 +0200
> Julien Olivain <ju.o@free.fr> wrote:
> 
>> The Bootlin external toolchain file Config.in.options contains 
>> multiple
>> occurrences of "select BR2_TOOLCHAIN_HAS_THREADS". See for example 
>> [1].
>> 
>> This file is generated by the support/scripts/gen-bootlin-toolchains
>> script from the information published at [2].
>> 
>> Those multiple occurrences happens with toolchains having
>> BR2_TOOLCHAIN_HAS_THREADS_DEBUG and/or BR2_TOOLCHAIN_HAS_THREADS_NPTL.
>> 
>> Since the script uses the startswith() method, the _HAS_THREADS
>> selection is also generated for _HAS_THREADS_DEBUG and
>> _HAS_THREADS_NPTL. See [3].
>> 
>> This commit solve the issue by adding a '=' character to make sure the
>> test will be distinct from other strings having the same prefix.
>> 
>> Note: there is no functional problem due to those multiple selections,
>> since it is allowed by Kconfig. This commit is simply cosmetic, for
>> correctness.
>> 
>> [1] 
>> https://gitlab.com/buildroot.org/buildroot/-/blob/2025.08/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options#L167
>> [2] https://toolchains.bootlin.com/
>> [3] 
>> https://gitlab.com/buildroot.org/buildroot/-/blob/2025.08/support/scripts/gen-bootlin-toolchains#L366
>> 
>> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>> Signed-off-by: Julien Olivain <ju.o@free.fr>
> 
> Acked-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

> 
> Thanks a lot!
> 
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72652C83F1A
	for <buildroot@archiver.kernel.org>; Tue, 22 Jul 2025 17:20:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46CC8608DC;
	Tue, 22 Jul 2025 17:20:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZHR3rrVwSK8Z; Tue, 22 Jul 2025 17:20:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5909360A7D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5909360A7D;
	Tue, 22 Jul 2025 17:20:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 17AC7E0
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 17:20:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 093D440072
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 17:20:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fx6WQ9Yw-_ZX for <buildroot@buildroot.org>;
 Tue, 22 Jul 2025 17:20:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 375CD40052
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 375CD40052
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 375CD40052
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 17:20:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 33BA92003D6;
 Tue, 22 Jul 2025 19:20:51 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 22 Jul 2025 19:20:51 +0200
MIME-Version: 1.0
Date: Tue, 22 Jul 2025 19:20:51 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <8c34c61d-bd3c-4f93-b7c8-0f9fcd4d51e8@gmx.de>
References: <20250620221850.2465031-1-fiona.klute@gmx.de>
 <904a074fed22fe7a018a79ad34329c91@free.fr>
 <8c34c61d-bd3c-4f93-b7c8-0f9fcd4d51e8@gmx.de>
User-Agent: Webmail Free/1.6.11
Message-ID: <dce3aa5865641a828dbcd1cae71c8acb@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753204853;
 bh=IN/yTmMpx+da/VzJrpBZPQ+Da29CHQMSwlEQzyHJHis=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TrszSqufqArD4xcd5zAeu02fAWkRWHKG81ZB3XJ7E2t/ocmfNJ7btsvLQ6y03+MSC
 bsxc7DqOHYqIt+aH8UMlHbs6ow0xyjjXmCxHC+dpfOQu1+PftbPQjfVcypBDd8oH4K
 tAc2HaF+KeAUu2ju0+fMF8l2xoikqNQzO+XquJErFm14PocvFg0OPquv1CMFygic6W
 R/ONl6HisBA46510EXw2LVlXZB4B68+tmVq/z6Mc2lAJ060qQO8Oyb8SJ/JqMbF6Ax
 anJHhgOPJFoYfFFSoiZkhQaHddx7K++mUxMauu6hdbA5xs9hSRppnplZZQtiUxvxoL
 KTlS86NMuqarQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=TrszSquf
Subject: Re: [Buildroot] [PATCH 1/1] package/lrzsz: fix build with musl
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

Hi Fiona,

On 21/07/2025 11:14, Fiona Klute wrote:
> Hi Julien,
> 
> thanks for the review!
> 
> Am 20.07.25 um 13:35 schrieb Julien Olivain:
>> On 21/06/2025 00:18, Fiona Klute via buildroot wrote:
>>> lib/long-options.c failed to compile with musl for the same reason
>>> 0002-lib-long-options.c-include-stdlib.h.patch was added to fix,
>>> exit() being undefined. The fix is the same as well: include 
>>> stdlib.h.
>> 
>> Before we merge this patch, could you add a comment in the upstream
>> pull request linked in the patch in [1] proposing your change?
>> 
>> I know lrzsz is an ancient package, and this fork did not received
>> commits in the past years, but we never know ;)
> 
> Sure, I've just done that:
> https://github.com/UweOhse/lrzsz/pull/4#issuecomment-3095797981

With that, I applied to master, thanks.

>> For the record, there was an alternate proposal in:
>> https://patchwork.ozlabs.org/project/buildroot/ 
>> patch/20250326170814.2393-1-uuidxx@163.com/
>> but since all the 3 libcs seems to support that, we can go with your 
>> proposal.
>> 
>>> Fixes: b6784a1f1f ("package/lrzsz: fix build with GCC >= 14.x")
>>> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
>>> ---
>>> This compiles with uClibc-ng, too (without even a warning, I didn't
>>> test at runtime), so I'm not sure what those "non-GNU C libraries"
>>> where things break are. There are similar comments all over the 
>>> getopt
>>> code, so with the age of the code maybe way outdated ones, or
>>> non-Linux platforms.
>> 
>> Finally, if you want to runtime test, there a simple runtime test:
>> https://gitlab.com/buildroot.org/buildroot/-/blob/master/support/ 
>> testing/tests/package/test_lrzsz.py
>> the long-opt will be a bit tested with the --help.
> 
> That test currently uses only a glibc build config. Do you mean I could 
> modify it locally to test with uClibc, or that I should add test 
> variants with musl and uClibc? The latter would certainly be good for 
> reliability, but also add a lot of build time to the tests (that's why 
> I'm hesitating).

I meant to modify the test locally, or sneak the to command sequence to 
quickly
reproduce those in a qemu build with the right config.

I agree that lrzsz does not really need more testing (one is already 
enough).
Autobuilders will cover the rest...

> Best regards,
> Fiona

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

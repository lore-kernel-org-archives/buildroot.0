Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B23EDCA1013
	for <buildroot@archiver.kernel.org>; Sun,  7 Sep 2025 07:49:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A0BB84640;
	Sun,  7 Sep 2025 07:49:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eJNzGFHM1OSO; Sun,  7 Sep 2025 07:49:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 746DB84635
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 746DB84635;
	Sun,  7 Sep 2025 07:49:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 848E2273
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 07:49:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6ACBE4220A
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 07:49:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W9q4sRelyaBY for <buildroot@buildroot.org>;
 Sun,  7 Sep 2025 07:49:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5A6EF42209
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A6EF42209
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5A6EF42209
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 07:49:00 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 71387B00563;
 Sun,  7 Sep 2025 09:48:57 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 07 Sep 2025 09:48:57 +0200
MIME-Version: 1.0
Date: Sun, 07 Sep 2025 09:48:57 +0200
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20250906211900.648495-1-romain.naour@smile.fr>
References: <20250906211900.648495-1-romain.naour@smile.fr>
User-Agent: Webmail Free/1.6.11
Message-ID: <7902991d0de6d4367110d430483c8551@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1757231338;
 bh=cSHx3MsDrDiHV3w0AfJwgfn888AHS+kZyMvzKc31HhA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Rhnwr0N7mVGhCDSqt1HRVJQLtg0QoDX7qkd2bpjlbBmNyjkzhr0fPTkgtfegMIEYz
 u/ALDGJEI10OtBJviy1XQC8zUu03uJFjNtmZCjruGSfXXojIDvu4Q9L8iQ0T71KlPl
 BLvNwFzQcFQGlBw12ahY8q+xwSWFkHzvGItSYStyYcwYZ2Wt6khvz/7ahlvdgq4zxf
 lLAzkdpg2TBfPAgMwCiRYvSlc1T5cUrMh1fSfm6MLHoHJtVNiPjQaNdKy907rXOy0w
 hVIUTq3rfc7lJNBFwWChsFu0kBhXBiBsK7XFgmqaK9tz27lgLxix1rbOnNtdDpE5mO
 vo3XixXG5TdVA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Rhnwr0N7
Subject: Re: [Buildroot] [PATCH] support/testing: test_hardening: update
 toolchain to aarch64 for checksec tests
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

On 06/09/2025 23:19, Romain Naour via buildroot wrote:
> TestRelroPartial is broken since the last checksec update to 2.7.1 [1]
> (Buildroot 2024.08) due to a relro check fix [2] that doesn't work for
> powerpc architecture where .got.plt doesn't exist for some reasons
> (that's why the expected result "full" is replaced by "Partial").
> 
> From [3]:
> 
>   if ${readelf} -d "${1}/exe" 2> /dev/null | grep -q 'BIND_NOW' || ! 
> ${readelf} -l "${1}/exe" 2> /dev/null | grep -q '\.got\.plt'; then
>     echo_message '\033[32mFull RELRO   \033[m   ' 'Full RELRO,' ' 
> relro="full"' '"relro":"full",'
>   else
>     echo_message '\033[33mPartial RELRO\033[m   ' 'Partial RELRO,' ' 
> relro="partial"' '"relro":"partial",'
> 
> checksec tool is problably tested upstream on more common architectures
> like x86_64 or aarch64 than powerpc64 e5500. This may explain why
> checksec broke on powerpc64 e5500 target.
> 
> Also, the Booltin powerpc64-e5500--glibc--stable-2018.02-2 toolchain
> used by test_hardening tests was not updated since the hardening tests
> were introduced back in 2018.11 release.
> 
> So, switch to the current Bootling aarch64 stable toolchain
> (currently Bootlin aarch64 glibc stable 2025.08-1).
> 
> Checked that all 6 hardening tests pass with this new toolchain:
> 
>   tests.core.test_hardening.TestFortifyConserv
>   tests.core.test_hardening.TestFortifyNone
>   tests.core.test_hardening.TestRelro
>   tests.core.test_hardening.TestRelroPartial
>   tests.core.test_hardening.TestSspNone
>   tests.core.test_hardening.TestSspStrong
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/11176773995 
> (TestRelroPartial)
> 
> [1] 61505649746cb4d0dd57e35ff6139b7925bab72d
> [2] 
> https://github.com/slimm609/checksec/commit/1c80e39c4956f902ed15c4baa8d9c17851096900
> [3] 
> https://github.com/slimm609/checksec/commit/1c80e39c4956f902ed15c4baa8d9c17851096900#diff-9e8d1b28dfaf1c704560ac51a5613b70d70de2dcd84e87b9fa20f28811e6484aL1491
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

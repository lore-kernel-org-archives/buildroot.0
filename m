Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C61EE49AB
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 20:08:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2EFA408E4;
	Tue, 22 Aug 2023 20:08:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2EFA408E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8e32-O5gcDId; Tue, 22 Aug 2023 20:08:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9985A408FC;
	Tue, 22 Aug 2023 20:08:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9985A408FC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 364E01BF33D
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 20:08:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F83D8119D
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 20:08:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F83D8119D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SqjRaT6bTJH7 for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 20:08:37 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 09D9680C58
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 20:08:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09D9680C58
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 6BB4413F85F;
 Tue, 22 Aug 2023 22:08:32 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:42296])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 22 Aug 2023 22:08:32 +0200
MIME-Version: 1.0
Date: Tue, 22 Aug 2023 22:08:32 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20230822213539.331878ec@windsurf>
References: <20230822192315.8180-1-ju.o@free.fr>
 <20230822213539.331878ec@windsurf>
User-Agent: Webmail Free/1.6.1
Message-ID: <f2414860dfc205f44efba3d43cdddedb@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1692734913;
 bh=OP1wqLJQCYIBdogyx4mMyv9OwDnV1/j4BedTMzvIcpQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iCgUdFwRP6VeNcK9OvWWzNWY7C7uQgNRpoH/L09xz8596M5HtsIL/TgYVx80fLlsc
 2t2N2T7aCyU1/Zl87XFC8NQtAl+hZ9lE7aTlg7svL7y3bAB0jT6U4DB68fFn1FkZoP
 A+8khOLAyYQSbKzeXatSX8b1YR+2bVqv1i+xt6uD6nD0qG4cG3QsKeLFAZJX/U/khp
 pHFnoOfJTE5QlM7hsYHwSRWSS6P9m/BkNFKbDBDbndezB8Tot78fgS8Gip7c1W7iLe
 DaMFZRn14jTjrUJ7AA/MSrNFyZYEL0HCzmS+9QgTozQrlAvxPDiYV/QhlSSzxZUlBc
 DIEeHfP9yEZ2g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=iCgUdFwR
Subject: Re: [Buildroot] [PATCH next 1/1] package/kexec: fix link error when
 BR2_OPTIMIZE_0=y
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On 22/08/2023 21:35, Thomas Petazzoni wrote:
> On Tue, 22 Aug 2023 21:23:14 +0200
> Julien Olivain <ju.o@free.fr> wrote:
> 
>> When BR2_OPTIMIZE_0, -O0 is passed in compiler CFLAGS. This means no
>> code optimization will be performed.
>> 
>> kexec code uses a trick to detect unaligned accesses at link time
>> which needs at least dead-code-removal to work. See
>> put/get_unaligned() macros in kexec/kexec.h. This code was re-enabled
>> in upstream commit [1].
>> 
>> This commit sets at least -O1 (which include the sufficient
>> dead-code-removal) when BR2_OPTIMIZE_0=y, to fix those issues.
>> 
>> Fixes:
>> - 
>> http://autobuild.buildroot.org/results/8f8/8f8532f1dfbd71e52c51c00118934af9fa45e7cb
>> - 
>> http://autobuild.buildroot.org/results/528/528fd7baf9b0ad5549d22ec8e0623c5fa1f2d117
>> - 
>> http://autobuild.buildroot.org/results/499/499115439680adfb4b40042468e5bbb65d91ce6c
>> - ...and many others
>> 
>> [1] 
>> https://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git/commit/?id=0723defb5308ac7fce296f8b596bff4df6803f01
>> 
>> Signed-off-by: Julien Olivain <ju.o@free.fr>
>> ---
>> Patch tested on branch next at commit bfa4a7c with commands:
> 
> Thanks for the research, but why is this tagged for next? You're saying
> the issue was introduced in kexec-tools commit
> 0723defb5308ac7fce296f8b596bff4df6803f01, and this commit was initially
> part of the 2.0.1 release of kexec-tools, which we have in Buildroot
> since February 2010.
> 
> Based on that, I would have expected this patch to be relevant for our
> master branch, but you explicitly say it should be merged in next,
> which to me doesn't make sense. Could you clarify?

This could indeed go into the master branch. Since 2023.08-rc2 was
already tagged, I imagined only major fixes would go into master.
This one has been longstanding issue (so apparently not so important).

In fact, reading the Buildroot documentation release engineering at [1]
does really allow me to decide what kind of commits (security, bugfixes,
new features, minor improvements like typos) should go to master/next.

Recently, I had the same interpretation in [2] that a minor improvement
(in which nothing was actually broken) should go to next. Yann preferred
master.

If you summarize those situations, I would be happy to propose a doc
improvement.

> Thanks a lot!
> 
> Thomas

[1] https://nightly.buildroot.org/manual.html#_development
[2] 
https://lists.buildroot.org/pipermail/buildroot/2023-August/672866.html

Best regard,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

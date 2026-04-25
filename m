Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 862B0FF885D
	for <buildroot@archiver.kernel.org>; Sat, 25 Apr 2026 12:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3140F83BEA;
	Sat, 25 Apr 2026 12:07:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zmOAzBrPSncF; Sat, 25 Apr 2026 12:07:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D16C83BE4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777118873;
	bh=vxEhb9t31cUqFVpWq01u/3gzw4JQADH41W0I37zSEq4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RDTUI7YgfKqmolENKRgBOX2kX9/4DGYTqSHLvUB1iFP59cGaNglQFonm8PVNk8cR1
	 2dToIgutRDhhqI55u7J62DN7c+WzrtHYNtRs8ZWaKk0vwe3bBb4zaHZccsCJ4mEssf
	 sFuCseAGv5TlT6cFYSh2q0R/7QNSO0dUeK7WXVLb0GgX2gR+ttm19NQi/jyw3Layia
	 AQ99+7aomIy6dEs0KcR+7ZyEzEE7DZgDEoRZfLGj26XVAfKINryrmBA/eHaxbxEH2T
	 MbUKjVEgrRaEmNSJnfM7vqANPkdUgJ/uKaJ6EufET5QPQa2OenjGVRvxQjr25YbeAJ
	 76Eiad+eH3O7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D16C83BE4;
	Sat, 25 Apr 2026 12:07:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 49820194
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 12:07:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E54960F3E
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 12:07:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KXqmNndD6hAi for <buildroot@buildroot.org>;
 Sat, 25 Apr 2026 12:07:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EBDCF60F3A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBDCF60F3A
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EBDCF60F3A
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 12:07:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id A7C242003C1;
 Sat, 25 Apr 2026 14:07:47 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 25 Apr 2026 14:07:47 +0200
MIME-Version: 1.0
Date: Sat, 25 Apr 2026 14:07:47 +0200
To: Maxin John <maxin.john@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260425062705.74982-1-maxin.john@gmail.com>
References: <20260425062705.74982-1-maxin.john@gmail.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <0459c13f82431b7c833d30f3147b4578@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777118868;
 bh=GWp3I16+B+WBMpDtvXNKSdFNUKH5GEpQIpb6tTtDK1c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=n/2G+pvw3pSRsPpKOmvoHQ6cEctXpyl5ijoei9xVcPvy5/hs/noQC89SVUUiFQFOQ
 ACfOY5g0bo8CHL7B7AeeieZSuEBFeZlzD4YpsDQ/2L1AcKqaeCp3cwCCCdY76mKJGz
 9U1ehQaZDBhubbJLIy3IsfZe1jyEFcxH5LOYH3D3K4NHN0Ka4mcDVoM4LMkiCgNdq6
 KiWjsrZk4kV50aRJtMbkkI4TFht8uUdAC8CmJt2n020Gg1+5UTZ8QgB36AAZQl+7iD
 wC1B6jIZXojBePaBBL4ImUkVDfD8HPAeSo7UT3K5ZB4UfsPlFoLIb+hAN8lVNm6SX3
 nSOBR9npaFtTw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=n/2G+pvw
Subject: Re: [Buildroot] [PATCH v2] package/mdadm: bump to version 4.6
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

Hi Maxin,

Thanks for the v2. This new 4.6 version is introducing 2 issues.

On 25/04/2026 08:27, Maxin John wrote:
> Drop upstreamed/backported patches.
> 
> Release announcements:
> 4.6:
> https://lore.kernel.org/linux-raid/CALTww2_2pjjOSsVj-WT++m35555CjnPWokU7fut+HwUJVV-=ZQ@mail.gmail.com/

First, it breaks the mdadm runtime test. See:
https://gitlab.com/jolivain/buildroot/-/jobs/14088239652

You can reproduce the issue with the command:

utils/docker-run \
     support/testing/run-tests \
     -k -d dl -o output_folder tests.package.test_mdadm

This new version asks a question and blocks the test.

This commit should make sure the test keep working.
So this can be fixed by passing the answer to the question.
Adding "--bitmap=none" to the "mdadm --create" options should
fix the issue. See:
https://gitlab.com/buildroot.org/buildroot/-/blob/2026.02.1/support/testing/tests/package/test_mdadm.py?ref_type=tags#L72

Also, this new version breaks with toolchains with old kernel headers. 
See:
https://gitlab.com/jolivain/buildroot/-/jobs/14088277312

You can reproduce the issue with the command:

     utils/test-pkg -p mdadm

This is due to mdadm upstream commit 
71574efb077131701b3da874df0045f259ca3448
(in mdadm 4.0) which introduced a usage of MD_DISK_FAILFAST but was also
including the definition. Then upstream commit
f5889f9a1b8753a1472dfef9d025da2bae395239 (in mdadm 4.5) removed the
usage of those local definitions to use the kernel instead.
So mdadm has now a new requirement on Kernel headers >= 4.10.

The bootlin-aarch64-glibc-old has 4.9 kernel headers and is now failing.

Search for "BR2_TOOLCHAIN_HEADERS_AT_LEAST_" for examples.

Could you add this new requirement in Config.in and the explanation in
the commit log please?

> 
> 4.5:
> https://lore.kernel.org/linux-raid/CALTww293wnLE2+eZsZ42oyNZhS_cc2agB4GNqTz8j3xiP0ALWA@mail.gmail.com/
> 
> 4.4:
> https://lore.kernel.org/linux-raid/20241213121438.7ed6a0fd@mtkaczyk-private-dev/
> 
> Upstream mdadm project has moved its primary development to GitHub:
> https://github.com/md-raid-utilities/mdadm
> Updated download site accordingly.
> 
> Signed-off-by: Maxin John <maxin.john@gmail.com>

Could you send an updated patch addressing those issues,
please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

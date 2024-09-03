Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C18DCCD37AA
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 20:17:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 896C2606E3;
	Tue,  3 Sep 2024 20:17:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5RRD0sX7J7ju; Tue,  3 Sep 2024 20:17:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8840B6072A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8840B6072A;
	Tue,  3 Sep 2024 20:17:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E75591BF57B
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 20:17:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D46ED6072A
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 20:17:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ImPi090tg9bD for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 20:17:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6B3E8606E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B3E8606E3
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6B3E8606E3
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 20:17:46 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id A8E3F13F861;
 Tue,  3 Sep 2024 22:17:39 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 03 Sep 2024 22:17:39 +0200
Date: Tue, 3 Sep 2024 22:17:39 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <Ztdu47X2nbDuVFln@landeda>
References: <20240810215624.482529-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240810215624.482529-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1725394661;
 bh=LtAGs62sIaKWLKNGs48O2Y7kA89n80NcjgzKGguWvyU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=THQwl6I8CcMG+Bec/a6Q7S1s0aDiDF8erndI1jzfixGuhTbgxTfcsxfzes1AWgeKe
 STsvwU/bDqcXZoyhAQU5DxwjkDtSJYZUHBVetSQi9MuSboyunSErBietVCVPR7MVPx
 /Tw7BSArLb9a9iLbOLJ4R1XsqVYjERrOqwanVUnQlpgyXSfI1SvU8rL9iLgKGrl07x
 WRawVAjIAjfH54S4xnxs+b76q6+f8pxivu9HB9c5fm+kK0yrWU9i9GiDrGBFRvWJ3v
 CnS75OiVDmcAJ3mHsp/qNxn02H56Cy6na20qxjvz3Ib24CowilwZpvfi+gork07gC8
 y4z/E7CJQIrBA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=THQwl6I8
Subject: Re: [Buildroot] [PATCH next 0/7] Update some external toolchains
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2024-08-10 23:56 +0200, Thomas Petazzoni via buildroot spake thusly:
> This series updates the ARM external toolchains (ARM, AArch64 and
> AArch64 BE) as well as the Synopsys toolchains.
[--SNIP--]
> Thomas Petazzoni (7):
>   arch/Config.in: introduce BR2_ARCH_NEEDS_GCC_AT_LEAST_15
>   toolchain/toolchain-external/toolchain-external-arm-arm: bump to
>     13.3.rel1
>   toolchain/toolchain-external/toolchain-external-arm-aarch64: bump to
>     13.3.rel1
>   toolchain/toolchain-external/toolchain-external-arm-aarch64-be: bump
>     to 13.3.rel1
>   toolchain/toolchain-external/toolchain-external-synopsys-arc: bump to
>     2024.06

I'll further reply on that patch.

Series applied to next, thanks.

Regards,
Yann E. MORIN.

>   support/testing/tests/toolchain/test_external_arm.py: new test
>   support/testing/tests/toolchain/test_external_synopsys.py: new test
> 
>  DEVELOPERS                                    |  2 +
>  arch/Config.in                                |  4 +
>  .../tests/toolchain/test_external_arm.py      | 41 +++++++++
>  .../tests/toolchain/test_external_synopsys.py | 91 +++++++++++++++++++
>  .../Config.in                                 |  2 +-
>  .../toolchain-external-arm-aarch64-be.hash    |  4 +-
>  .../toolchain-external-arm-aarch64-be.mk      |  2 +-
>  .../toolchain-external-arm-aarch64/Config.in  |  2 +-
>  .../toolchain-external-arm-aarch64.hash       |  4 +-
>  .../toolchain-external-arm-aarch64.mk         |  2 +-
>  .../toolchain-external-arm-arm/Config.in      |  6 +-
>  .../toolchain-external-arm-arm.hash           |  8 +-
>  .../toolchain-external-arm-arm.mk             |  2 +-
>  .../toolchain-external-synopsys-arc/Config.in | 13 +--
>  .../Config.in.options                         | 32 +++++++
>  .../toolchain-external-synopsys-arc.hash      | 12 ++-
>  .../toolchain-external-synopsys-arc.mk        | 13 ++-
>  17 files changed, 206 insertions(+), 34 deletions(-)
>  create mode 100644 support/testing/tests/toolchain/test_external_arm.py
>  create mode 100644 support/testing/tests/toolchain/test_external_synopsys.py
> 
> -- 
> 2.45.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

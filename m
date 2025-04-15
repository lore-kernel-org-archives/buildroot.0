Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1499C369BA
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 20:00:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7A77408F0;
	Tue, 15 Apr 2025 20:00:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id owZecLZVNo9U; Tue, 15 Apr 2025 20:00:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4F3040839
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4F3040839;
	Tue, 15 Apr 2025 20:00:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A04C109
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 19:59:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 36C2160801
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 19:59:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B9eNwIdZbLTC for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 19:59:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5FB2E6062F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FB2E6062F
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5FB2E6062F
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 19:59:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 1BBE12003E3;
 Tue, 15 Apr 2025 21:59:54 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 15 Apr 2025 21:59:54 +0200
MIME-Version: 1.0
Date: Tue, 15 Apr 2025 21:59:54 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250415191548.2122362-1-thomas.petazzoni@bootlin.com>
References: <20250415191548.2122362-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <2548cc1bd79ef6df488f3b6506b5d39e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744747196;
 bh=ZNSE55jjxGaU296YK5HJH2IgDy+yZWwFMq5n9o59ioM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bMmV4KzdsK+F0bb5UgGZwRYaT0Ke7b2XY9Abvpp3VUDxiTDhtiJPFBMploRMZndmg
 sVZKOvlw+oWcKNQ1CZ8nF+FMdIGO+6krv3kNpc1TBcZcWZHT6t/1o7JCvOEPrl6VrH
 srG7Bv1r2FdSzIRVmvHbW7MoYsEUd7JDaPoBMnmZ67kupRd/ZTzJPL+D58P37zxjAR
 Y/0bj9IS8fDpNwmsU1jkrGrL18rH5Vzvbb/P3drlKaQXzTswyp18MWwUEAOQK9lmA8
 v0/vpv4OJ3UJTjbDvV0b2XVrcG91ca/22EZPtlRtXiMjU8scXLAZy+0GaHERsHU5o5
 A2mFIN59UGMbw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bMmV4Kzd
Subject: Re: [Buildroot] [PATCH] package/double-conversion: bump to version
 3.3.1
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

On 15/04/2025 21:15, Thomas Petazzoni via buildroot wrote:
> Upstream changelog from
> https://github.com/google/double-conversion/releases/tag/v3.3.1:
> 
>     Hash pin Github workflows by @joycebrum in #198
>     Create dependabot.yml by @joycebrum in #199
>     Add _ITERATOR_DEBUG_LEVEL=2 and _DEBUG defines by @ffa-csturdy in 
> #202
>     Add bzlmod MODULE.bazel file by @jsharpe in #205
>     Add CIFuzz Github Action by @DavidKorczynski in #203
>     Update MODULE.bazel and README.md. by @BYVoid in #234
>     Remove the explicit dependency on rules_cc. by @BYVoid in #235
>     Add missing headers by @BhavikaSharma in #239
> 
> Tested with the following configuration, which includes the only two
> reverse dependencies of double-conversion.
> 
>  BR2_arm=y
>  BR2_cortex_a9=y
>  BR2_ARM_ENABLE_VFP=y
>  BR2_TOOLCHAIN_EXTERNAL=y
>  BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
>  BR2_INIT_NONE=y
>  BR2_SYSTEM_BIN_SH_NONE=y
>  # BR2_PACKAGE_BUSYBOX is not set
>  BR2_PACKAGE_QT6=y
>  BR2_PACKAGE_PYTHON3=y
>  BR2_PACKAGE_PYTHON_UJSON=y
>  # BR2_TARGET_ROOTFS_TAR is not set
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

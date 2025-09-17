Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83531CAC59A
	for <buildroot@archiver.kernel.org>; Wed, 17 Sep 2025 21:08:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A93684766;
	Wed, 17 Sep 2025 21:08:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fQ4pToiT_QA3; Wed, 17 Sep 2025 21:08:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E8BC84746
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E8BC84746;
	Wed, 17 Sep 2025 21:08:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EA8DBAF1
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 21:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D07EE60706
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 21:07:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wb1RiJiylEKt for <buildroot@buildroot.org>;
 Wed, 17 Sep 2025 21:07:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8681D61723
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8681D61723
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8681D61723
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 21:07:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id A7232780372;
 Wed, 17 Sep 2025 23:07:52 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 17 Sep 2025 23:07:52 +0200
MIME-Version: 1.0
Date: Wed, 17 Sep 2025 23:07:52 +0200
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Dick Olsson <hi@senzilla.io>, =?UTF-8?Q?Vinc?=
 =?UTF-8?Q?ent_Stehl=C3=A9?= <vincent.stehle@arm.com>
In-Reply-To: <20250830175509.2163323-1-ju.o@free.fr>
References: <20250830175509.2163323-1-ju.o@free.fr>
User-Agent: Webmail Free/1.6.11
Message-ID: <283655cf9a8fdc125f5ad9617efb1bbc@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758143275;
 bh=vtifWC1tHjgq2awKLup79gA0pp2Oa7sND5UrMtBXmts=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BV7EkxLMnmOQcQ08qrI6kzaHmdLMYYOWIDKXAm6oKBsnmN4nG3cvojrY91SzP39Ku
 oba2F4TLZlWfnBW0e/Mc35o5pSnpxm0NZfcUC8dMQ10u8flOO+e2j9fUaiW1pVONU6
 9SvyIsZvbvDQVwvPrT4Xue/3d+4f92cR2yT2t1KHReOJ5/rxL0uMRn+i5n39CMlYCI
 q5i59MTO9hZUU8M7/DSI1oxcrE1r5WskdXUvYGimNUPh9/i5AT8ELB3LRVt1oNi2ka
 iUnMu5eqLcI2VndLmCgcqK1cQXMJivcgJPJzIQ3oLgdT8oR225tbhIEe5llhCAKWMu
 XOEFIFNqmgTSg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=BV7EkxLM
Subject: Re: [Buildroot] [PATCH 1/1]
 support/testing/tests/boot/test_edk2.py: switch to neoverse-n2 cpu
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

On 30/08/2025 19:55, Julien Olivain via buildroot wrote:
> The SBSA Reference Platform was updated to neoverse-n2 (armv9.0a)
> in Qemu v9.1 [1].
> 
> The Armv9-A and Neoverse N2 core support was added in Buildroot
> commit [2].
> 
> Since the test_edk2 uses the Qemu sbsa-ref machine, this commit
> aligns it to use the neoverse-n2 cpu.
> 
> [1] 
> https://gitlab.com/qemu-project/qemu/-/commit/b1d592e7b0a7301eae8e3baa99744ac35db3cd2a
> [2] 
> https://gitlab.com/buildroot.org/buildroot/-/commit/9845bd4541cb03e97e577281f3c64f00c6ead881
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied on master.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

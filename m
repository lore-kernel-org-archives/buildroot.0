Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 443E1C83F26
	for <buildroot@archiver.kernel.org>; Mon, 28 Jul 2025 22:20:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C50B40B35;
	Mon, 28 Jul 2025 22:20:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7ILqVn2oA5gE; Mon, 28 Jul 2025 22:20:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E8B740FAB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E8B740FAB;
	Mon, 28 Jul 2025 22:20:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 16900DA
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 22:20:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0851980D09
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 22:20:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FuZ2XG10EbmK for <buildroot@buildroot.org>;
 Mon, 28 Jul 2025 22:20:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D304480D71
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D304480D71
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D304480D71
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 22:20:18 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 354D85FFA3;
 Tue, 29 Jul 2025 00:20:14 +0200 (CEST)
Received: from [192.214.236.6:51686] via [192.214.236.6] by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 29 Jul 2025 00:20:14 +0200
MIME-Version: 1.0
Date: Tue, 29 Jul 2025 00:20:14 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Julien Olivain via buildroot <buildroot@buildroot.org>
In-Reply-To: <20250728225754.108b36eb@windsurf>
References: <20250724202406.958337-1-ju.o@free.fr>
 <20250728225754.108b36eb@windsurf>
User-Agent: Webmail Free/1.6.11
Message-ID: <9d24a945277dd6fe57163c14820f3fcb@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753741215;
 bh=om2CTZRCjtQ0pNgqYTdQGsc9zhyDOUzSDREZpIFmalw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=A+5sa8naCXrhNstMjckvR4Vn7XPXLNT435oOAwXSZw5roDRVGRLTll4OdcsKzZ/Fx
 zcJnuD3+u0kfLS2USgdICithASssgC9pVSrrVWam8XlU5DR8uLVxhzZYPWhEW4L1O0
 v46JTOHiI3yMLONk5thBgg3n81FR9VxZlY2WgxlacK2BD2oXo35L22SK4E27FYPAK5
 laoSox64wMsDFsaFG3J+WwHjgCJwkr4e4buatVPgzi7WBRkmpqzwUzvOO9s74RVzv8
 723XI02r0Wd2XFvDhEGV/qCwUFDR5F8IAPnfAU/rkzy0C94/fN2XB75wqQeSUSFqVp
 JAX+iMpwFk/8A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=A+5sa8na
Subject: Re: [Buildroot] [PATCH v2 1/1] package/berkeleydb: fix build with
 host gcc-15.x
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

Hi Thomas,

On 28/07/2025 22:57, Thomas Petazzoni via buildroot wrote:
> On Thu, 24 Jul 2025 22:24:06 +0200
> Julien Olivain via buildroot <buildroot@buildroot.org> wrote:
> 
>> Commit [1] fixed berkeleydb target build with gcc-15.x.
>> The host variant package also fails when building with host gcc-15.x.
>> 
>> This commit fixes the issue by replicating the same fix for the 
>> package
>> host variant.
>> 
>> Fixes:
>> https://autobuild.buildroot.org/results/a8051600ab95a63c852960f8dace757b16c665f0/
>> 
>> [1] 
>> https://gitlab.com/buildroot.org/buildroot/-/commit/c1d422edde19d07d6406705b1a4b059125dba689
>> 
>> Signed-off-by: Julien Olivain <ju.o@free.fr>
> 
> Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Until we find a better way to handle those fixes, I applied to master.
Thanks for the review.

> The one thing I dislike though about this kind of fix is that we will
> never remember to drop this -std=gnu99 option once upstream fixes its
> code base to be C23 compliant.

Could we track those bulk fixes (like gcc-15 build failures) with
comments, like we do for _AUTORECONF or _IGNORE_CVES? It's not ideal,
but at least we could more easily do cleanups later (with git grep).

Alternatively, we could add a commented link to an upstream bug
report. This would introduce a bit more maintenance work.

What do you think?

> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

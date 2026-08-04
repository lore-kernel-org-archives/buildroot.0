Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D8DAC55822
	for <buildroot@archiver.kernel.org>; Tue,  4 Aug 2026 20:02:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C93640758;
	Tue,  4 Aug 2026 20:02:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mJPWbJMG_FZ9; Tue,  4 Aug 2026 20:02:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E544340737
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785873725;
	bh=NyHEtJqNfMJGCSigXQCvZMddLqGr5iQGmMPekzQVUtA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kNdGBL8aK9XbXlVG8vVY4UHONHB2DS/si6HhDdnCj3Upqloy9VJsHc2x8IUHN/APE
	 p7S904bMDI3QfuHGLJ6GBN8zi7DYki3+21N7VkrJFNhl+bKSe2B4pSQrW7TLlW4beW
	 WufiSJIQjUzvKdpO5gLk61yuED20UtctnkP8qPlnrdjZ1ErYrOz+BM7bFtT4zdzqb7
	 QnBZyxF5ZXHX6daTZQayxu5Cyy9dOPi2kbp+ZJwq1sQQt6WxV7TrCvsGN5grxRohDm
	 U4ol7VKBcd8463SHLhwfKtZ8YG7IBARm/mfaGIBramUFNbuKkgq4d4YJAhpMX8G8A9
	 CsXjGzB4qbrRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E544340737;
	Tue,  4 Aug 2026 20:02:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F0C4296
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 20:02:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8104740302
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 20:02:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HU8GpYISN8o9 for <buildroot@buildroot.org>;
 Tue,  4 Aug 2026 20:02:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org ACFDD402D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACFDD402D2
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ACFDD402D2
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 20:02:02 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 183D82003AE;
 Tue,  4 Aug 2026 22:01:58 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 04 Aug 2026 22:01:58 +0200
MIME-Version: 1.0
Date: Tue, 04 Aug 2026 22:01:58 +0200
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20260606225120.409046-1-romain.naour@smile.fr>
References: <20260606225120.409046-1-romain.naour@smile.fr>
User-Agent: Webmail Free/1.6.17
Message-ID: <04b3fd2ef31bdc6f6a8168d472484ce0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785873720;
 bh=qzfgOVX1TroWEW+0+dzFArgxJckWcYvQ7QVyYRKPARs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kgcd412ABTIuSj1dqmcCDKUh4ngyN5YukIFraIyMzzu7PBwmp6UfoKgECxCwTrz2w
 bY353zXJzIZWSF90lnfoDpeWQk+BJLJ87INn1Jj2lMlqmSVjjgfhvH1wD+fjKfw98w
 VFAy+bSwfk7GKXc5UakoA1vIo67qyNAgMe7Ih74QlCvIYdr4UCU4gTLiPQo/XFEq+j
 Sr7n/ElOD0sUvt1NZ4dh7QDkmcpoEVwEfv12dEDbolrEOwexCi+c2n+/OjqWLRpMWD
 HQUIIUJxGt5fF9cwalLOAqmcL8gAR4hpmhjTU9MJMLzptvLzqSz36O05jfoC1Rlfo6
 uVnG1sJ34+JXg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kgcd412A
Subject: Re: [Buildroot] [PATCH 1/7] configs/s6lx9_microboard_defconfig:
 remove defconfig
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

On 07/06/2026 00:51, Romain Naour via buildroot wrote:
> This configuration for the s6lx9 microboard was added back in March 
> 2012
> (commit 49084a198247575650c155b6f5f147fb034becc5), and has not been
> updated in any significant way since then.
> 
> This defconfig still use a 4.4.7 (no longer maintained) and out of tree
> devicetree (lx9_mmu.dts).
> 
> Remove its support.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/14728914045 
> (s6lx9_microboard_defconfig)
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Since we did not received feedback from the maintainers
of those defconfigs, I applied the rest of this series
on master. Thanks.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

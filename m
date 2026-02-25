Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6972FD45F3
	for <buildroot@archiver.kernel.org>; Wed, 25 Feb 2026 21:15:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8544E80F21;
	Wed, 25 Feb 2026 21:15:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qBE7UZHtfZwX; Wed, 25 Feb 2026 21:15:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9342E80F52
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772054120;
	bh=w0Id+GfhqjgCsIdG3BjOp72Y+9jFAAmhkntncNGy1h4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JX72Zxw/vcGi+YxtYxMnBVMWgbwdPoC2ClpQAfBPpGyu2XxB5OL0MCRO4P0bosScm
	 D/+AIEYw8Qn7oDvIFi81RIKN2lYSYVnDRkvRAX5fxTaPyAopfxMtPKuEWjTXPPMTyp
	 zNtnchzRYHf9YjgBZLB9k2bUzFnHF7wVEEJYwuMjxCf30Z1pA2Zgx3+PTzVnmtO0OH
	 1mO53ALXj5KJaOjYRXEC/wUEHzmfaIrMDDCNxts0jT0itzdpAD/EdcFQue/Eeh+9zY
	 GecDsPkJe2btFAEpmlcvU076LknoADvAWrXyf+irOczFqzdaOQxt/QeP4pq93ScqHp
	 u4SwVEvUPthzA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9342E80F52;
	Wed, 25 Feb 2026 21:15:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1840423D
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 21:15:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 09FFA41C01
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 21:15:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rs4hApokw-dm for <buildroot@buildroot.org>;
 Wed, 25 Feb 2026 21:15:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E7A5F41BBD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7A5F41BBD
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E7A5F41BBD
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 21:15:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id F1B385FFC0;
 Wed, 25 Feb 2026 22:15:14 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 25 Feb 2026 22:15:14 +0100
MIME-Version: 1.0
Date: Wed, 25 Feb 2026 22:15:14 +0100
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20260225202847.385468-1-thomas.perale@mind.be>
References: <20260225202847.385468-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.13
Message-ID: <f4d801f64fd87c62a25bd406ea37af51@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772054116;
 bh=upr5wc1B0S1FWqpo+DjqH9FSm77H+oA4a0Cn2djXwvA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Lez4Zp10QjAwjTbbWkBjvcciKaPG1tlpzQS68h8YqYkU6v/yz7mEVWjcimF1lt4Dj
 8iK0kFk4iUOtn/wzZ4tuwguFzqilU9PuWF/41Cri5jppHmO43ce5ExjnApUwb/9HV0
 DDeYvEusyCPZw2XWQ1B05U3O48/9oDTPeqjhoeOesX2jvjw8MrrrG/MjPuKk7vW9Nq
 F9M9K357nL9APGqbb709QW+DpdWdhvmcKddB1H1L2WYW9swSDL6S9r6dTel1YzRKPs
 JoYFDq3yho7EPAA7j/7C3eNZC4zjfP3f9MIHWB+QYOg7KoVZvboQs9fiQZ1TFDG73k
 aDx8KommYLhcQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Lez4Zp10
Subject: Re: [Buildroot] [PATCH] package/patch: add patches for
 CVE-2018-6952 & CVE-2019-20633
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

On 25/02/2026 21:28, Thomas Perale via buildroot wrote:
> Fixes the following vulnerabilities:
> 
> - CVE-2018-6952:
>     A double free exists in the another_hunk function in pch.c in GNU
>     patch through 2.7.6.
> 
> For more information, see:
>   - https://www.cve.org/CVERecord?id=CVE-2018-6952
>   - 
> https://cgit.git.savannah.gnu.org/cgit/patch.git/commit/?id=9c986353e420ead6e706262bf204d6e03322c300
> 
> - CVE-2019-20633:
>     GNU patch through 2.7.6 contains a free(p_line[p_end]) Double Free
>     vulnerability in the function another_hunk in pch.c that can cause 
> a
>     denial of service via a crafted patch file. NOTE: this issue exists
>     because of an incomplete fix for CVE-2018-6952.
> 
> For more information, see:
>   - https://www.cve.org/CVERecord?id=CVE-2019-20633
>   - 
> https://cgit.git.savannah.gnu.org/cgit/patch.git/commit/?id=15b158db3ae11cb835f2eb8d2eb48e09d1a4af48
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

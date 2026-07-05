Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA4E4C43458
	for <buildroot@archiver.kernel.org>; Sun,  5 Jul 2026 16:46:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE6EB407C9;
	Sun,  5 Jul 2026 16:46:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hvu_w7-eDILR; Sun,  5 Jul 2026 16:46:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 038AD4068C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783269984;
	bh=44lyk0aHFo6sA7/6+LylfqTrdJHBfrvMChBc+SHzcn4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JLlUrnUCbfwJvE5yxFSPXodYVHuirz4z2N7HNdYN1IAjJb2D/NUa9Vlnfs6raVNOa
	 wvTtTqfvQUsrEB8wyQlULqeP8OGCCvXRrCb0iNzyWvDSUWp443xctLk9rNxfgsnpM0
	 bs6FiXxMKv+gM+7Cx2pnyZ3CvHTb33sf3kDsSMf4lVfxjBtdK9vC2BtWqanlQ5XdbQ
	 iTEsrABNZcfmy4AY4dIiEzemen9hVh7sbQ9dPMxPSc+M+9tIfSnlTL7t7RPLl4D2Tp
	 DAFFDMjJi0KsOBoQxPDhlNI/vnDoDzSQ1kB4QarBBesH278buA6DaI510REKSeetPa
	 FVBdLHOrkJo+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 038AD4068C;
	Sun,  5 Jul 2026 16:46:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E9197316
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 16:46:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF58580ED6
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 16:46:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pI1MtnLSRvv4 for <buildroot@buildroot.org>;
 Sun,  5 Jul 2026 16:46:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C767D80ED5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C767D80ED5
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C767D80ED5
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 16:46:21 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 51A082003CA;
 Sun,  5 Jul 2026 18:46:17 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 05 Jul 2026 18:46:17 +0200
MIME-Version: 1.0
Date: Sun, 05 Jul 2026 18:46:17 +0200
To: Michael Nosthoff <buildroot@heine.tech>
Cc: buildroot@buildroot.org, Semyon Kolganov <semenak94@mail.ru>
In-Reply-To: <20260629071429.4131207-2-buildroot@heine.tech>
References: <20260629071429.4131207-2-buildroot@heine.tech>
User-Agent: Webmail Free/1.6.16
Message-ID: <3a4888084fca72d66b0e255d196820e8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783269979;
 bh=6/D9M14mt1OVK1CxOewFHbqxPHRpj5nHm9PB7sb3EkM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nySDkDepsJEep97lZmwA7DfN6Q/OOre1Zz7JDOMrPLoTmI1nThWtuemndgATPhAEn
 dw9IOay3d3wmdM3RfFdhT2u94ng1YTeu2huBk1/f8IDrOxHeC6GusxFD9mHkpXCWEY
 IzR3E53QYajsyo9wiFyyPzDi7AXKZ2sM2vNznvs19jgDncfY8HXDJCNuY+voAgtUwC
 HJ1IcTykorfFqsVKtrrC2EudnOMT5tNDSo1dxP9LQEOdx3WvMNvQc1Zz8l8i7suNCs
 a3ui5EElZAModg6guIgZe8uBWQ9E8bgVErhPZ/MmRDzYWoAF6erGyhROPWvBCuggtU
 QhJkEvHEYPmOA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=nySDkDep
Subject: Re: [Buildroot] [PATCH] package/fmt: bump to version 12.2.0
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

On 29/06/2026 09:14, Michael Nosthoff via buildroot wrote:
> changelog:
> https://github.com/fmtlib/fmt/releases/tag/12.2.0
> 
> LICENSE hash changed due to split-out of exceptions:
> https://github.com/fmtlib/fmt/commit/91d1aced0a846161135310249664506b4a56e196
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D0DE8FDAC
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 20:08:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADE454058C;
	Fri, 26 Dec 2025 20:08:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gN-inz4ofvph; Fri, 26 Dec 2025 20:08:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 730C040528
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766779691;
	bh=2kSuwebNj6zA5dVUbu6GKUT7+PlMKtRDM1fWgUZ2pIg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=akqwjLz8jASto/+Yv5vSaNuEwXqm9f/0+3NCYK1v+nG6/xz53gBMkZHOP/REU+t/Y
	 VLHog57iSZzqM1frfNjnO0socAH3W+gGVDMjkeLnrTiuaogAb4+3ppm5jRTfN4NPID
	 gt0CRF9RJzmxn2fNqsxdC1FhQikXxYhE6pqUItghImmvSmU44PweHXqfAFiHiE4i5J
	 Tj6nGRCP3cNOcccVVz5rFANcnM4ioHFPTDfF3lyAPSJZSxezSPWbZ+pJ8h8PVxFi+x
	 ZZ3OiAeTNqiJnsT2+nL4B4OyHx4LvojLnKOCsam6Nk18a2BDk7qpBYavMb2eP+8YMo
	 N+EeAVo3ieDqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 730C040528;
	Fri, 26 Dec 2025 20:08:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4902AEC
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 20:08:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B298400AD
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 20:08:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M2rsOEaVlHQ5 for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 20:08:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 28D9E40063
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28D9E40063
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 28D9E40063
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 20:08:09 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 0A3AF5FFB4;
 Fri, 26 Dec 2025 21:08:04 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 26 Dec 2025 21:08:04 +0100
MIME-Version: 1.0
Date: Fri, 26 Dec 2025 21:08:04 +0100
To: Maxime Leroy <maxime@leroys.fr>
Cc: buildroot@buildroot.org, vjardin@free.fr
In-Reply-To: <20251222215636.975668-6-maxime@leroys.fr>
References: <20251222215636.975668-1-maxime@leroys.fr>
 <20251222215636.975668-6-maxime@leroys.fr>
User-Agent: Webmail Free/1.6.12
Message-ID: <4cf93505f94a6473f27c1a1f5bbbe9ff@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766779687;
 bh=BwwFbb2jfwi28IWva+gKg6hJwnzPkMLaUwEJXChYNzc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bmTc7Ifsiot8zJT89cA+CQqzdPw+PmbkR0x4zpHTYHCSmgnTbO3T4JaEHk1SSd3/Y
 v95+9iI9gmiw4WujV1gxGiwueLhY5prxLMbYmO5n66Zi/lIIbFeKL6k5Lv17HxzrUv
 6jXXUbeTAYaRuVG2RoCiJKuIsGwTKG+TbO0fM7NELy1fsPGZTG3uXOaCMkWt3/2hmR
 3Yiuzxo25/zV0FAdEymVvOJGCfXe71LKg1toC4chtfIIntXdc+wLHPQkLOa6620vxC
 /7D11h1fdM7kDdnWa8lPiRzBTT/9/S/ZRLPKRp319Hs57v9DVrG+ypLPJ7/IEMA07w
 AsNanvF9m2h6Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=bmTc7Ifs
Subject: Re: [Buildroot] [PATCH 5/7] package/grout: bump to 0.14.3 version
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

On 22/12/2025 22:56, Maxime Leroy wrote:
> See the release note of the new versions:
> https://github.com/DPDK/grout/releases/tag/v0.14.3
> 
> Signed-off-by: Maxime Leroy <maxime@leroys.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9949EEDA6B2
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 17:25:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67A6F418DC;
	Tue,  3 Mar 2026 17:25:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m-CZSQ0xMuH7; Tue,  3 Mar 2026 17:25:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E64EA41834
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772558707;
	bh=gbNvjjqPjvyTfExiPgmmF5ppi4nv1N+rtDra9Eddl3s=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dNGcVkVJYRGn0aC7asoTv/Ak/Fr6f2CQjE8FA1ydmtqSbv0l5jZQMNznwLHYIaXrQ
	 KJPnNefElNBmV1FwoZPWROjk9Vzw0BKmYHFtiOOktFQADX/q2yzAxkxmgiChwifFHV
	 n8cqvzV50KOw5SvVQmOJGi6HKziLV+fsCAej1daJIMOM2F5zx56XL0qYyuNXg4Dc0X
	 zQGqqvIbcGjDIssf3Do98dh33BGH+Y45cM5g0M0Z8+KAMcFti5/GyQ14YQHog0DdrI
	 mgLtFemk+Kovcr4IQ3SGLSQHM0AJtXNTj84yDxNd/mIxty7M0GiWZoNyHCLZ2QR+05
	 fEqzcyrbuFvSg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E64EA41834;
	Tue,  3 Mar 2026 17:25:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A6961EB
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 17:25:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 94EC640087
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 17:25:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zPvcTusUnhlB for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 17:25:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DFFDE40028
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DFFDE40028
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DFFDE40028
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 17:25:04 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id BA69960128;
 Tue,  3 Mar 2026 18:25:01 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 03 Mar 2026 18:25:01 +0100
MIME-Version: 1.0
Date: Tue, 03 Mar 2026 18:25:01 +0100
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20260303103802.274517-1-thomas.perale@mind.be>
References: <20260303103802.274517-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.13
Message-ID: <86a6e7c962726648a8229a41738f13a6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772558702;
 bh=ZR14E+Ih/ZueRIXU8JgHNhnhtuzRVPHEl7cxloqBXic=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Vq06kzkmJt9oOgQat/QLeGmDSRz2Ej2EKcatN1ndX66PkeghPw1k0+F8ACoIDnZ9i
 Ef83p9oOwgznCUicCtxPntRmFFwU6Tvx5+A478UOTcYYKFEvUG5ckRbHCGnKcegcxz
 SxtdVibIpW8cWSiUyaT5NAyZz8AG+Js6rkmSKvxy/nGdRI3rBjnE0sq6Geh0Uv4Z2U
 A0M+qoQq+owafdInev2BudAwMe/PiCTD3Ka91wT3MNoZKEWRVppvfSOJH33wRGrYBJ
 /3VM8xyjVXbbTN0tcO3DZIAZ9GwHjcEk9aTXrPE1GXDCnLyM+MlkaCeEaOIQYR5rFt
 woivLyUECi3CA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Vq06kzkm
Subject: Re: [Buildroot] [PATCH 1/1] package/squid: add patch for
 CVE-2025-62168
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

On 03/03/2026 11:38, Thomas Perale via buildroot wrote:
[...]
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

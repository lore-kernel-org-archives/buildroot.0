Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4731BC43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 17:03:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1356E60A51;
	Fri, 10 Jul 2026 17:03:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dKr-cQS4YR76; Fri, 10 Jul 2026 17:03:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8DCB6084E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783703031;
	bh=hqooz+2tQV8zHUSp6O49BOxuKVdfy4wzBXf7yeP3Pbo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FPKF0kDu56bogiOYCIU9XD47I4CYyjyZtnpuQ8QKrDyu6tc/QAueO66mh/DlrdVvv
	 o9FjN+FeDGphJjnCG1RfI0h/NsJJ7DQlC9uHbI5Zes7RzbXhSzcXPg7/f3NIxzE32v
	 46mP+pcNVY9MNtoc1nfmhTQ7dy7COczXgIIL+B0ClN/6Ung5Ovq10yjNLHnOagMPhp
	 JOuGVRSg9p/bhsUT6hGcTFMKewQWOCqlEwAwuDDcLFdGigMYHGn6yt+WUf2Ua0MRNE
	 oaaLMIyBWFhSFofNU7gh01xFdY6Yijf09YNhQrOUeEZX07gVRiFBGo5ErjuqpSZMTo
	 zbsbiEXHGmo/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8DCB6084E;
	Fri, 10 Jul 2026 17:03:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C268E2FE
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 17:03:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B411E40A16
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 17:03:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D1VX6oFisHwH for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 17:03:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DE1B840A12
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE1B840A12
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DE1B840A12
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 17:03:48 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 19BBB19F574;
 Fri, 10 Jul 2026 19:03:44 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 10 Jul 2026 19:03:44 +0200
MIME-Version: 1.0
Date: Fri, 10 Jul 2026 19:03:44 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Francis Laniel <flaniel@linux.microsoft.com>
In-Reply-To: <20260708200124.1689961-1-bernd@kuhls.net>
References: <20260708200124.1689961-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <2e9fbc093581d322d61f5cd946a08104@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783703026;
 bh=8XdLiRYX1Zwqjt5OKdhjFu063i31ia2KOYmP1d3QZqA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Dfk5rYoO4XIT8uiiY54zNFzI0uHSHMIu9/6yM3zqxLL2LnMBQj3k4RthxwDzz0QxA
 aBAW5nLExpduqWmr8Pc+dTBZHvtpWRd+P8VgMO79lgwbMS6pasQB9BgZhckxbnBu/Q
 BgZOYXBpkCLw8K8Izddb/2mxkQmUnbngRDVo1TvYdjBj4f0adB5rqD+7VVxGmsPz75
 +Oq7KpuL6Ta33i3rYXibb7Sgpl9f5aY/BxH2OxwdXxLD9gSqVWvrsf2ZyHifXuHZc3
 EAdmcr2iGLP+Y9zMFeF+SlZCHDvMyvrdHWKOpkxb4WDgf3zoNFaNgVPjc8bey/BhVV
 r0nMEivcwIBXw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Dfk5rYoO
Subject: Re: [Buildroot] [PATCH 1/1] package/pahole: bump version to 1.31
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

On 08/07/2026 22:01, Bernd Kuhls wrote:
> https://git.kernel.org/pub/scm/devel/pahole/pahole.git/tree/changes-v1.29?h=v1.31
> https://git.kernel.org/pub/scm/devel/pahole/pahole.git/tree/changes-v1.30?h=v1.31
> https://git.kernel.org/pub/scm/devel/pahole/pahole.git/tree/changes-v1.31?h=v1.31
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

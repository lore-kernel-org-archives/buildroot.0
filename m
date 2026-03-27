Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFEE210F2868
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 18:52:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9EE0610A9;
	Fri, 27 Mar 2026 18:52:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oRCRMAmw0q1y; Fri, 27 Mar 2026 18:52:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 618DB61083
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774637540;
	bh=rtR3NP4XJ+2ZCJ7zndFXLz4k5jrtpSXejc5WTFpmnSM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YNyUS4H/raUPEWSEpGaopSog4faGh3r2WKNvITD84Mbk8bK2VqQyRP8wlTEIYxzOw
	 AaCgOWIg/FWSpFcVLCFa6RLVgYvaId6b9jMPOkER1szFQwEVcnKaRUAob2fqaRsIar
	 uSX6f0rpJmqx8gAc3Xs80VsQn/w+b9UVaiRNzEWpRcGgYjhNM9b1eIa+sLZ21LG7AO
	 mzjqUspVKSWCOuxUpsMqESJfdvblZkKR8RcbrBr+aOcPjreYV2k7bOUbfywhJiEXvY
	 V/hcJgom09t3s7T32MnLg0iUsd1e5wyDPlI2xB+pyTmcwcefi9FCQEjqvVAxeG7soT
	 07TAbd/ok/WGg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 618DB61083;
	Fri, 27 Mar 2026 18:52:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 100C210F
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 18:52:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F262261083
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 18:52:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iSs8Bl-OPKgF for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 18:52:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 285246107D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 285246107D
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 285246107D
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 18:52:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id C35F95FFBA;
 Fri, 27 Mar 2026 19:52:12 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 27 Mar 2026 19:52:12 +0100
MIME-Version: 1.0
Date: Fri, 27 Mar 2026 19:52:12 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260327174418.1880770-1-bernd@kuhls.net>
References: <20260327174418.1880770-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <1fa513cee9bfcf67053de19ab38304d0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1774637536;
 bh=2xpXRFYTueU9oNXlXuw5BFxYpabM4lXso8I24GrnjOE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PCf0lnT7KoAUJF3j4zcSjYs+w9SyA/0kvmcnCQLPagzDvZ+PgRyvbK+MQyuEPAZ8m
 35Hp3+65ntUFHtKJDB7+kLRa369etuwpq3gr97NvFEpI6pch97PWh2XR2VYgLZmHWP
 zRANlofKt4weAhdtiumCIC3akYsyJCXqX59FGRX+mRFLXSH8XqxiEVsdIVW9QoxOTI
 Q/e+O1SW/U4YJBub7NlU62fkCcb2vbCsDmOvfWp6zKm5gvJgBzKZZ9QweON09T0lux
 wES0dtBdHVT6d7U7cm5DakvntXSczuP9o9M+svMhUfowkVRPHtm7X8Id+0FN6PmBSD
 udhthLbXPhjxQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PCf0lnT7
Subject: Re: [Buildroot] [PATCH 1/1] package/{glibc,
 localedef}: security bump to version 2.43-17-gdd9945c0b
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

On 27/03/2026 18:44, Bernd Kuhls wrote:
> Fixes CVE-2026-4437:
> https://sourceware.org/git/?p=glibc.git;a=commit;h=5c6fca0c62ce5bd6e68e259f138097756cbafd4d
> 
> Fixes CVE-2026-4438:
> https://sourceware.org/git/?p=glibc.git;a=commit;h=dd9945c0ba40d2dbc9eb7c99291ba6b69bd66718
> 
> For a full list of changes, see:
> https://sourceware.org/git/?p=glibc.git;a=shortlog;h=dd9945c0ba40d2dbc9eb7c99291ba6b69bd66718
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master (thanks for the v2). During my first review,
I forgot to mention that GLIBC_IGNORE_CVES update was also
missing. So I added those. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/ef01d4fc78ffcca51380ba1d46ffe63d6d63d479

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

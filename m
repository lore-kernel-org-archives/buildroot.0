Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C54FAC369C9
	for <buildroot@archiver.kernel.org>; Thu, 17 Apr 2025 20:52:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91E1B84728;
	Thu, 17 Apr 2025 20:52:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ut1o7pDXx_K9; Thu, 17 Apr 2025 20:52:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEF5181EF6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEF5181EF6;
	Thu, 17 Apr 2025 20:52:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A882122D
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 20:52:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8DBF6607D3
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 20:52:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GnwtWCVtjcEs for <buildroot@buildroot.org>;
 Thu, 17 Apr 2025 20:52:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BFEC4608C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFEC4608C2
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BFEC4608C2
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 20:52:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id BCC11B0057C;
 Thu, 17 Apr 2025 22:52:09 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 17 Apr 2025 22:52:09 +0200
MIME-Version: 1.0
Date: Thu, 17 Apr 2025 22:52:09 +0200
From: Julien Olivain <ju.o@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250417075152.3534553-1-peter@korsgaard.com>
References: <20250417075152.3534553-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <15ffce04377edf1e3db537e9bdea3fda@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744923130;
 bh=NQ79rjsjgdywfhgMwYupzGJ+FcZueohi/XtdEqBDvAg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Jg1fJuu4k0Ec7rK8q1QG+D5Q6boim17ymzpee09FsrHddLHXT+FbiLi9e6EWZkhts
 8KybhhbZ9cbA5kzaxsf+qN9yCBPUte6dSbgJD9aISMMJe1JGw4SiDrZKHgiFv5/dCf
 +cy02TQwlpWaU/O9oqNOLP8UOwYHngRGBfr2CEy8rGatSZkLslo+UOxbZO7pe9Vw3F
 Uzy19+ssVstwE0AzXlmS+PYLUFL4X+hGU6c+ap6g787WHqPoRSqmRsR3+LenW3qHhc
 8b89OW94u1KoWOXPvg8CcPG+zfCwu48R9nbVg39bVR7kTQG/sjXoVh4MG1C/B257AX
 dchOn8Byh/y8w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Jg1fJuu4
Subject: Re: [Buildroot] [PATCH] package/c-ares: security bump to version
 1.34.5
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

On 17/04/2025 09:51, Peter Korsgaard wrote:
> Fixes the following security issue:
> 
> - CVE-2025-31498: Use after free in read_answers()
>   
> https://github.com/c-ares/c-ares/security/advisories/GHSA-6hxc-62jh-p29v
> 
> For more details, see the announcement:
> https://github.com/c-ares/c-ares/releases/tag/v1.34.5
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

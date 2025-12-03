Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCEF3D1BDFF
	for <buildroot@archiver.kernel.org>; Wed,  3 Dec 2025 21:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CFD260E16;
	Wed,  3 Dec 2025 21:43:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h6VRqQD10jiC; Wed,  3 Dec 2025 21:43:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBD3860DFF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764798236;
	bh=XBTG651N8c/jH79XVegvoySKzRYSy+3SQDcCZ9OviVA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IL3iL5LWzYsLTBouQOzmRgXV8oawtp0OkvA9omTvqBB61GoN9a0vE/LEjF2OY14aq
	 W2dHMk6pwBFKiZGgPAAjph1sxY5WDYl/QxVHUXbS/EGPxdJEoZiH2T570b7M9kW/5l
	 IS2ZnFtQ9cZ88Qf8Rh1zxs+lR4YWgyfonGr14v1rWcw57RyYNuFIu/qW4asUAzxQqO
	 HDZ1aV9uLtHgZSCvZKcFBrGO9IFD5p/jRnuEBmBXRg1Y14a3BRh3t0yB5bSjJFmzJJ
	 THXdYJHhFzmyXNNIvrFgpK3TjAkbttWybwP1u4R4NMrS3QkQVku+/tKpFKAI3qfRj/
	 O3z5yRcaC1v4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBD3860DFF;
	Wed,  3 Dec 2025 21:43:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 29E2DE4
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 21:43:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1060B60DA0
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 21:43:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5o2AiQyISPP6 for <buildroot@buildroot.org>;
 Wed,  3 Dec 2025 21:43:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0286960B10
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0286960B10
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0286960B10
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 21:43:53 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id AB5A878034E;
 Wed,  3 Dec 2025 22:43:50 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 03 Dec 2025 22:43:50 +0100
MIME-Version: 1.0
Date: Wed, 03 Dec 2025 22:43:50 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251203170333.1769022-1-bernd@kuhls.net>
References: <20251203170333.1769022-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <3969541211f06c60918a8adb35c52d44@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764798231;
 bh=spbnxNOyfg0XhCdXbdA6jmTJ1Ea5t7VCGAfxKf5dEZU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ey9ZTAOn8utxtSgb5JNsXmKBCGX+mjdaZw+hdSrYPmqKXtD4Aw+xbjfEe1QI87ecr
 8e8rVdtUaoDxEQIGNt2qMxjlJcN9/BavAL1Ww2R0O5BjpzraQEFITXtb2iOAGWvbJ9
 2NZac495HMzTjvQvdRu/m5a6eQ7vY3Ag0h7ibvCBevGfeTB9FKnN+iOObFhliVkgFx
 tJ0DQNOnGggC0Z7INYmGrONHD0MytlISonVmK5lEDvNsf846FyGKDF5CjIwHJqXMkn
 EAMhaA2hyPghCXOz4RzF8ZH+8n0pEBdICz79ytxW9hybvjSdLjVBAAObk/eOhR3rzD
 vNPI4ZzyO9HrQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ey9ZTAOn
Subject: Re: [Buildroot] [PATCH 1/1] {linux,
 linux-headers}: bump 5.4.x series
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

On 03/12/2025 18:03, Bernd Kuhls wrote:
> https://lwn.net/Articles/1049060/
> "This is the LAST 5.4.y release.  It is now end-of-life and should not 
> be
>  used by anyone, anymore.  As of this point in time, there are 1539
>  documented unfixed CVEs for this kernel branch, and that number will
>  only increase over time as more CVEs get assigned for kernel bugs."
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

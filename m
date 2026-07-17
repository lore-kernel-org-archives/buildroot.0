Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B91C4451B
	for <buildroot@archiver.kernel.org>; Fri, 17 Jul 2026 16:59:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0DDF40B05;
	Fri, 17 Jul 2026 16:59:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UQolEnooV-2b; Fri, 17 Jul 2026 16:59:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12EAC40B1B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784307553;
	bh=YU8wXyggk63oMhlilmZ5jfstatxk/+Zx+ZE5BMoAek4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ELkYdKI1CD/rNPR5mf5yGxvtob3aM+e/YPaA2/QhFUUkThUZpQD7VeyCuOl6v/b/R
	 q/UvRRJ7iMNM0wotFLae02QueqoHH1wSj0LZF9/4LkFA2yGkJJbLBp7AmYEzg8hxQ4
	 oYqs7L/PmFajtC3uC1mZNzHad4ZbErrmDpUnMzWXZnTi2CBUVQTYrZR8mUnSF0J3TB
	 d/EW9VZKjRl2b4IExU6nt3HRTW2f0+yPyFQVTWnhoQQ9l6o8oTAewIVhnZ1UMV63LP
	 Z+Cd3ZiYKKwXvS59Mb2vOTn2yNHXSE9VR1Tf4+T4dV1z2r8GLrO5pSv5PKw0sw3DKP
	 Vjq5nXFwuWgdA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12EAC40B1B;
	Fri, 17 Jul 2026 16:59:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F786320
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 16:59:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 555D481170
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 16:59:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UgyhV5KddVnC for <buildroot@buildroot.org>;
 Fri, 17 Jul 2026 16:59:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 750948116D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 750948116D
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 750948116D
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 16:59:10 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id AF5D1B00563;
 Fri, 17 Jul 2026 18:59:05 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 17 Jul 2026 18:59:05 +0200
MIME-Version: 1.0
Date: Fri, 17 Jul 2026 18:59:05 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Neal Frager <neal.frager@amd.com>
In-Reply-To: <20260716054214.14597-1-bernd@kuhls.net>
References: <20260716054214.14597-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <144442463c96a6b4c4c05ce1d96accd6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784307547;
 bh=14h4N5BATVV0Th/WpEZC2FTfgxURO5MNfXk09RJ3J/A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ToUOrLfJh3mEnA3Fa24qMKjDFBFodu8etL1BHi/rUKFtblZCP72u9FAG6BwzD1IxJ
 z0mC/Y+OrHk/KYj7zCR5pn+CPLf+ZGS5YjFxBZ+8Arqu5reJG37SCnA0wZJqCD5bKL
 jOBlWuq4j+RIKeHRGhZUfLrGg8x+ZgIL0cdyxuyfmwVIdlOkOcWL5S9I47W+/5Ip3t
 zs9qmKSCyQevtlQ5WSsW8gkkfi7H1byr88GwspwiyZOnwzgLMRF8vNnd49VAd91Xdb
 5+8RK2JnPjybfQQ8vLBTFw5IsOUi2DV2IVAEI0TK0NEpKb3ul1uLt6oG8ADFV4aXZz
 MYZZZs/H7XISQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ToUOrLfJ
Subject: Re: [Buildroot] [PATCH 1/1] package/bootgen: fix build with
 host-gcc >= 14.x
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

On 16/07/2026 07:42, Bernd Kuhls wrote:
> Fixes:
> https://autobuild.buildroot.net/results/2db/2db65dc1e84255eef74beb19a44eb38bdf469724/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

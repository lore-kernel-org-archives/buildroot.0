Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA497C25B10
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 21:35:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B67742DC4;
	Fri, 10 May 2024 21:35:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U6s15Ebanuqb; Fri, 10 May 2024 21:35:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 158D142DD6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 158D142DD6;
	Fri, 10 May 2024 21:35:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7F3CB1BF36A
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 21:35:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 68EFE8430A
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 21:35:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DwNvKAy1QbPy for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 21:35:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4867884304
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4867884304
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4867884304
 for <buildroot@buildroot.org>; Fri, 10 May 2024 21:35:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 48685C0005;
 Fri, 10 May 2024 21:35:01 +0000 (UTC)
Date: Fri, 10 May 2024 23:35:00 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240510233500.49b47079@windsurf>
In-Reply-To: <20240307102535.20447-1-fontaine.fabrice@gmail.com>
References: <20240307102535.20447-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715376901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UOTY1G9Bb4kfjT0ltV6Kzwel6SMrxHSGEDvo9WZbPHE=;
 b=HUIqDlr+ILQai7ADDD+lka9uZ5JMMoskLYQWUoZWLQL31839gtyVmfD1hpA75sJmVC3pj8
 gMPkT0lswRkY7/OJz0GwQ4KfzMIgRQX6mDGLCguG0pCRqZUBa6efAFIVgoCn1Amxn3IMU6
 rIwtdKTEf6XUm3vm2HOnAvzjrdcQ9gH2C/Bqqfyanu21FI8fyF+bv6Sq9iyw+KMoNsHvQW
 c6JBdvHaJ3eT9ZDsYt4z9Fav4/tNSEkztKjnxF59GGmKXwZGkEKEIBUGVY3uKvou300tma
 wCQNGmDyaEWG0OVAl4REhMJirkKZBskjp40yR5Q6rTPQwX+8yq9VyMidwHoBvA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HUIqDlr+
Subject: Re: [Buildroot] [PATCH 1/1] package/zxing-cpp: drop opencv and qt
 dependencies
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  7 Mar 2024 11:25:35 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> opencv and qt handling can be dropped since switch to an active fork in
> commit 456a7398316655ad0b669635f580e4887c24a700 as they are only used
> when examples are enabled resulting in the following warning:
> 
> CMake Warning:
>   Manually-specified variables were not used by the project:
> 
>     BUILD_DOC
>     BUILD_DOCS
>     BUILD_EXAMPLE
>     BUILD_TEST
>     BUILD_TESTING
>     BUILD_TESTS
>     CMAKE_DISABLE_FIND_PACKAGE_OpenCV
>     CMAKE_DISABLE_FIND_PACKAGE_Qt5
> 
> While at it, also drop BUILD_EXAMPLES which is already passed by
> pkg-cmake.mk
> 
> Fixes: 456a7398316655ad0b669635f580e4887c24a700
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/zxing-cpp/zxing-cpp.mk | 26 --------------------------
>  1 file changed, 26 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

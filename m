Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C532BEC01BE
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 10:41:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5885D80EA9;
	Mon, 23 Mar 2026 10:41:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nxOWP7YhdbGm; Mon, 23 Mar 2026 10:41:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80D7080DD7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774262502;
	bh=NhQcYeyQAp11bBkTcGrR8QA3uYd1rjF5ash/S10/tUw=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ISv+zMx/iSO2Ls9nGJj5UjPZKW4WGrYFmiEYqfq09jrLJquLPmnGyIx93Pnksnquh
	 pJdwe/ptWYOMsQ7CyjXc0iVj8qnS5rP8M7z8G/wlgmcjC91lRK3FkFxhppZuAiWpwe
	 Cn6mz5I9sBJHR5NRLsxP66h5dooRDpJFOQoZOq6O8Ni/PTixkoXq1rYXVq42WuG8QG
	 JVD/ImagWCWa9cW5seYX5g8N0deegEXAZ/impZWHcT2YEXM36dX/oiceaDNZL1jdJo
	 ATX8NKDjCnTjQAlFlXFEyxuQ/mEdZ/C7gJndnPuuRGNl1IesNYOCUsAlPSkZpewPkN
	 dYLo4ubpDb0Tw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80D7080DD7;
	Mon, 23 Mar 2026 10:41:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EEC5FF4
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 10:41:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F7298057D
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 10:41:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ev496_3uOtM7 for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 10:41:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=54.36.140.181;
 helo=6.mo533.mail-out.ovh.net; envelope-from=mooz@blockos.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9D94D82384
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D94D82384
Received: from 6.mo533.mail-out.ovh.net (6.mo533.mail-out.ovh.net
 [54.36.140.181])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9D94D82384
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 10:41:38 +0000 (UTC)
Received: from director4.derp.mail-out.ovh.net
 (director4.derp.mail-out.ovh.net [79.137.60.37])
 by mo533.mail-out.ovh.net (Postfix) with ESMTPS id 4ffV0c2SBBz64k9;
 Mon, 23 Mar 2026 10:34:40 +0000 (UTC)
Received: from director4.derp.mail-out.ovh.net
 (director4.derp.mail-out.ovh.net. [127.0.0.1])
 by director4.derp.mail-out.ovh.net (inspect_sender_mail_agent) with SMTP
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 10:34:40 +0000 (UTC)
Received: from mta2.priv.ovhmail-u1.ea.mail.ovh.net (unknown [10.110.96.102])
 by director4.derp.mail-out.ovh.net (Postfix) with ESMTPS id
 4ffV0c17Yxz1xrZ; Mon, 23 Mar 2026 10:34:40 +0000 (UTC)
Received: from mailstore13.priv.ovhmail-u1.ea.mail.ovh.net (unknown
 [10.1.8.13])
 by mta2.priv.ovhmail-u1.ea.mail.ovh.net (Postfix) with ESMTP id D97E93E1478;
 Mon, 23 Mar 2026 10:34:39 +0000 (UTC)
Date: Mon, 23 Mar 2026 10:34:39 +0000 (UTC)
From: Vincent Cruz <mooz@blockos.org>
To: buildroot <buildroot@buildroot.org>
Cc: Danomi Manchego <danomimanchego123@gmail.com>
Message-ID: <944599437.25075953.1774262079707.JavaMail.zimbra@blockos.org>
In-Reply-To: <20260323102609.711228-1-mooz@blockos.org>
References: <20260323102609.711228-1-mooz@blockos.org>
MIME-Version: 1.0
X-Originating-IP: [213.36.7.12]
X-Authenticated-User: mooz@blockos.org
Thread-Topic: package/libwebsockets: bump version to 4.5.7
Thread-Index: /kVjB3xw3v74SRYszrNjOkMQuyDQcw==
x-ovh-tracer-id: 1675339063426992999
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTFhV9tGyrOmdRIfgrmzekhHFSiW2yPrd6u98fs0V2oSJK0Y36Ty5JY9gIvrn++PiH55eezaS+YuKoS49KAmcj4eLQi8fZxaywSaIq6PMTupaZdhVvlOmMnKwTNzPSO6OAtd7rnX/qFjfFItMmz2EnARXyL9/JJc+7Cf2YO0dtXiJLwnsBU7E279awoX+KcHoD21s7x7zWmqpgVBiN3Cyswe79lzKNhFVh6G8QLxBWfJp+ktiGIpLKkZCMITX/ONXrA77uWKXZdXKLZSr9ntJfd6ntd9LRQFFGXMRsQnyeixXvotBWpuNNpMuToaMqcWG95GSUB0xEEOYbR8gdNAZ5BvcdAIZS/ubq5yxY4BL6IDvpFGcyHZPzXZvSLFzkI4Uhc+MYbM90NQ1NNIrOTXdEVUUMlB35iIEuuJ2AYW0Ei0r7iOFc41YHcfmOluq+U6S/KcIOladH0gnaTRX1TabxBLn3CvhNJibV8MbHzl7Lm+WVWOluqtXJu0NUAWVJAbrhpZcWROy2OJxHM0NxBTJfLLwc/c85e10sZ9+/ir8wFwMW5oEq4YLhbElClvmVgUCJ87somkxVHsvT2z5exJfPnBmjv+MLl1ofWqt4lw+3St9Nlf8YJH7zGhU8oBNuhd5sO2PAw2F5bVwXxWGJX0fy5fRdEuOOJdV0/FOWYMkGzgsw
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=blockos.org
Subject: Re: [Buildroot] [PATCH 1/1] package/libwebsockets: bump version to
 4.5.7
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

Sorry for the inconvenience, but I managed to send the patch without the changelog link.
Here it is...

Changelog:
https://github.com/warmcat/libwebsockets/blob/v4.5.7/changelog

Best regards,
Vincent

----- Original Message -----
> From: "Vincent Cruz" <mooz@blockos.org>
> To: "buildroot" <buildroot@buildroot.org>
> Cc: "Vincent Cruz" <mooz@blockos.org>, "Danomi Manchego" <danomimanchego123@gmail.com>
> Sent: Monday, March 23, 2026 11:24:59 AM
> Subject: [PATCH 1/1] package/libwebsockets: bump version to 4.5.7

> Signed-off-by: Vincent Cruz <mooz@blockos.org>
> ---
> package/libwebsockets/libwebsockets.hash | 2 +-
> package/libwebsockets/libwebsockets.mk   | 2 +-
> 2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libwebsockets/libwebsockets.hash
> b/package/libwebsockets/libwebsockets.hash
> index 1466c8d9a2..6d708135d5 100644
> --- a/package/libwebsockets/libwebsockets.hash
> +++ b/package/libwebsockets/libwebsockets.hash
> @@ -1,3 +1,3 @@
> # Locally computed:
> -sha256  472e6cfa77b6f80ff2cc176bc59f6cb2856df7e30e8f31afcbd1fc94ffd2f828
> libwebsockets-4.4.1.tar.gz
> +sha256  d08df7634da0a377a4e077400ed6b2d1d25cf0b239e89397cd39432c5eb437ac
> libwebsockets-4.5.7.tar.gz
> sha256  6ff2868dd9d9e251de27574342663f4773a8c2f954128899eb6f3c2ba9d9a245
> LICENSE
> diff --git a/package/libwebsockets/libwebsockets.mk
> b/package/libwebsockets/libwebsockets.mk
> index 2d3395c5dd..3c7e778ccc 100644
> --- a/package/libwebsockets/libwebsockets.mk
> +++ b/package/libwebsockets/libwebsockets.mk
> @@ -4,7 +4,7 @@
> #
> ################################################################################
> 
> -LIBWEBSOCKETS_VERSION = 4.4.1
> +LIBWEBSOCKETS_VERSION = 4.5.7
> LIBWEBSOCKETS_SITE = $(call
> github,warmcat,libwebsockets,v$(LIBWEBSOCKETS_VERSION))
> LIBWEBSOCKETS_LICENSE = MIT with exceptions
> LIBWEBSOCKETS_LICENSE_FILES = LICENSE
> --
> 2.51.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

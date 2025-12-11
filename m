Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 530EDD41D7E
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:30:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F30F4117C;
	Thu, 11 Dec 2025 19:30:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d2zB6_RifBwG; Thu, 11 Dec 2025 19:30:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23591411F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765481458;
	bh=2YBSUe55TMKklq+/w5gzx1Gou306FTR/5iON0GymqwE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=K46VxqPaYZCrRsX1lgkPUMOCAkUx3fnWv/8aWXo+WhV5GdYpLt3j/vBeggcJyZmn1
	 G7KIVRpbW83Z2lx38GfH56urp307Yp3DpYy/bT4zAO7alih0zcSe+8gnkgFmjZ3A2b
	 eJk4GeUITPNGX+RWrP0RnGbWtsS5hcWT7oPNEugPqiwwDfLoPTZY0URf73oFouMGQu
	 UJ7xoOfMyukXKS2cT0Z7olg7K0VBQUIHVf8nqDom6xsuGJdeGXxnDF6yUFlzCPxYVx
	 NxXBYIdBPdhJCoKE7T9IhqG9qUXRC+CxoMS0c9Z1oWO/Az5+kzURMBIYHhH7LJnEIQ
	 ci37d0dYYUYDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23591411F2;
	Thu, 11 Dec 2025 19:30:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C4AD7E7
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:30:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A1CEA830A8
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:30:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cU7anKj3hH3k for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:30:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A0990826D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0990826D5
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A0990826D5
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:30:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B9F28B97A098; Thu, 11 Dec 2025 20:30:53 +0100 (CET)
To: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Thu, 11 Dec 2025 20:30:52 +0100
Message-ID: <20251211193052.1099322-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251205171837.22075-2-raphael.pavlidis@gmail.com>
References: <20251205171837.22075-2-raphael.pavlidis@gmail.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1765481453; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=SQqn5LAQqHJGmmMxTQzg1J68UKs2t2gdioa3vy8Kknk=;
 b=SYqcCc5dQbPDIWw81Vw9O7oVT6Oh6HssYNjnWdIS98ftcCW/TtPxGKqpibY1dj9514qnW6
 +sPo9mLKDDRVXMgh8dfz2fVp7lwMz+lGKu0SFzz0Y5WyY/Od7K89rdcB/cMUYhIuU4qW1l
 o6ig8FxGIUbkwFsOUhK90tdCqyyiq45U+m4qLs+zsvQ1kapx//YXkSi/Ho5fCNrCMWA3N+
 uza1rx7lqTUsKA35TnTb4FZH/SvbK8CNyXaLWxk7gHji53e87w1mp/abrQhDBO9PxjrM9V
 HBY8uYZ/E1tRom6fo9qarMqAry5olxeiXJq6sGMleSg3/71e5ZbZw3CDVRo9sg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=SYqcCc5d
Subject: Re: [Buildroot] [PATCH v1 2/2] package/xwayland: bump to version
 24.1.9
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Changelog:
> https://lists.x.org/archives/xorg/2025-October/062148.html
> Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>

Applied to 2025.02.x and 2025.08.x. Thanks

> ---
>  package/x11r7/xwayland/xwayland.hash | 6 +++---
>  package/x11r7/xwayland/xwayland.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/x11r7/xwayland/xwayland.hash b/package/x11r7/xwayland/xwayland.hash
> index 6cbbea8af5..717189734b 100644
> --- a/package/x11r7/xwayland/xwayland.hash
> +++ b/package/x11r7/xwayland/xwayland.hash
> @@ -1,6 +1,6 @@
> -# From https://lists.x.org/archives/xorg/2025-June/062066.html
> -sha256  c8908d57c8ed9ceb8293c16ba7ad5af522efaf1ba7e51f9e4cf3c0774d199907  xwayland-24.1.8.tar.xz
> -sha512  b6dcc87f5c4d880cb23216518171a704c2a501803ac2efd9d01760895d755a617cd82313c6516f27a888b0581c64d74e3f8db5c238e1ae0d13da6cc1a547c02f  xwayland-24.1.6.tar.xz
> +# From https://lists.x.org/archives/xorg/2025-October/062148.html
> +sha256  f297af27a84508db9b80d1cbbcc69c3801da38eb64c72f3b5b50f582459afdd0  xwayland-24.1.9.tar.xz
> +sha512  7438a572651dc77c1fd749879abccdc9a245c7b75143668d5561a8e99d41063f042a8eb3f9b931a2a12be1fc3cb9d197eee6794d0702a19e56c20f55acb35a26  xwayland-24.1.9.tar.xz
>  
>  # Locally calculated
>  sha256  4cc0447a22635c7b2f1a93fec4aa94f1970fadeb72a063de006b51cf4963a06f  COPYING
> diff --git a/package/x11r7/xwayland/xwayland.mk b/package/x11r7/xwayland/xwayland.mk
> index b0cb893ea1..62bed673eb 100644
> --- a/package/x11r7/xwayland/xwayland.mk
> +++ b/package/x11r7/xwayland/xwayland.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -XWAYLAND_VERSION = 24.1.8
> +XWAYLAND_VERSION = 24.1.9
>  XWAYLAND_SOURCE = xwayland-$(XWAYLAND_VERSION).tar.xz
>  XWAYLAND_SITE = https://xorg.freedesktop.org/archive/individual/xserver
>  XWAYLAND_LICENSE = MIT
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

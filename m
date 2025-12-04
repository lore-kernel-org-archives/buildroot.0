Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C11D2A537
	for <buildroot@archiver.kernel.org>; Thu,  4 Dec 2025 20:43:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC46961CF3;
	Thu,  4 Dec 2025 20:43:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ytVgJv4oVi5q; Thu,  4 Dec 2025 20:43:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B446A61CE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764881034;
	bh=r4cXRenkDOOFRQmIu/t48uwYAX6Cd3WlsBEQ69wxdgw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZM8vvyjaKRysIRH/pyRB8eGo/I/p3teNPyju9VXub5Gw8uICjhWqpoHhINCnPAYEO
	 PtLxlRUfFgg4y2LWx6UH6rfpD+x0xvW3f4b1ES8voEOAM0o3X4E8QZFRXA7iTu8vm6
	 8rouGzqDbwTofvEioyl33u6sSM5oFtjwXWfCkgqNUu46Wi2pBriwwfVmmLPwHvD7x5
	 FEALpTvv+bV2Dpu7Pt8Xb3uR9q6+CWYd70fTXv5YU1NxYFvvsuf1KOQV9ln5U7K523
	 rS8JIyzyOcfcdWWGTb/cvsKcGXbyRByYxJzNaLu+ssSHRAXAlIBMGdHyYdR7uZA0lL
	 0quTI39uHwhtA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B446A61CE8;
	Thu,  4 Dec 2025 20:43:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E3A201A9
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:43:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D5F4F84723
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:43:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 07Le5ESOmBAD for <buildroot@buildroot.org>;
 Thu,  4 Dec 2025 20:43:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C9E168471E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9E168471E
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C9E168471E
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:43:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D381AB979ECE; Thu,  4 Dec 2025 21:43:50 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Thu,  4 Dec 2025 21:43:49 +0100
Message-ID: <20251204204350.13361-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251019104224.605009-1-bernd@kuhls.net>
References: <20251019104224.605009-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1764881031; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=riwqM40RK4s9ojzlKS9j0NGAaVTIRbZiCAdFnToBa/4=;
 b=YhVcv9vOkTpfEqV4+DpTzxtUA4KWLuNjXfvekoI11stXDHGrQSq2AuVyEhqR4egBKJff6B
 alsrJ/wRwiaKttOn7MBxEvnmx6qH1fuozAsRglM7+M/WMFqFzg/ls9ZwEyMKkCgrioeEvP
 +/0/u/WWSJT6p3wC1VDduMmOF9kjlWj7aV40JTd4Kw22e7xw+YudeIiyAEhYiEmYMd9P7M
 obidkalajurqgWfFBaBiEr3PJYG6aM32Wgm84hCm1S2GBpICRUNhgIXOFXIl5eA6BQbL/G
 6ZG9+A6EYLuSt5ctf/RTbV+kwlObIQ+tlOdAKWsVEId7DAIs4eCDZsymzkexvg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=YhVcv9vO
Subject: Re: [Buildroot] [PATCH v2 1/1] package/python3: bump version to
 3.13.9
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
> Release notes:
> https://www.python.org/downloads/release/python-3139/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.08.x. Thanks

> ---
> v2: fixed subject, 3.13.9 has no security fixes
> 
>  package/python3/python3.hash | 6 +++---
>  package/python3/python3.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python3/python3.hash b/package/python3/python3.hash
> index a7ab3856cd..d1a8f3780f 100644
> --- a/package/python3/python3.hash
> +++ b/package/python3/python3.hash
> @@ -1,5 +1,5 @@
> -# From https://www.python.org/downloads/release/python-3138/
> -md5  ba3da8187b03db6f42052f8707c22564  Python-3.13.8.tar.xz
> +# From https://www.python.org/downloads/release/python-3139/
> +md5  516aabdf3de01eeefb6de1aacf9df810  Python-3.13.9.tar.xz
>  # Locally computed
> -sha256  b9910730526b298299b46b35595ced9055722df60c06ad6301f6a4e2c728a252  Python-3.13.8.tar.xz
> +sha256  ed5ef34cda36cfa2f3a340f07cac7e7814f91c7f3c411f6d3562323a866c5c66  Python-3.13.9.tar.xz
>  sha256  78b12c3a81360b357002334f0e70ea0e92eebf7a9b358805c03c48484945f3bb  LICENSE
> diff --git a/package/python3/python3.mk b/package/python3/python3.mk
> index b501aa7859..7aad14a8ca 100644
> --- a/package/python3/python3.mk
> +++ b/package/python3/python3.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  PYTHON3_VERSION_MAJOR = 3.13
> -PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).8
> +PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).9
>  PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
>  PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
>  PYTHON3_LICENSE = Python-2.0, others
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

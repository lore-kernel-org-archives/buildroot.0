Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2F39D0D152
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:52:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9490409B1;
	Wed,  7 Jan 2026 17:52:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5eaf-HxFpvQc; Wed,  7 Jan 2026 17:52:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D667840F7A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808324;
	bh=+gwzFZ2SYl4rkK/bsYnwInlXQRurV9c5FT9ChMCS+Vc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iPIWE6ED8ask8nomlNeJURBXw/xhY3fbIO7qCEqxRqWLT0OKJED50DDg5iDf6/BVb
	 VczHEOLXANzQyZTS9sgDSsKJMvMIDzzEeV5jR9dySGGWlUrkDvMSZkfRNT3bI1PrNW
	 4mjE7TZTmE+3VDzW3RfS4dSiE+tN2UsOAIxOIUuE9Cv5sGlIxxEkfZS8kTDfotA72t
	 93wlsPIpsE4SGfq/b/vsE45mGKQAzXoAYAG2wHKL2qOT2NHmdx+ZkWEtk0vT1U1wvD
	 vnyRvKhoVhmhNNTBK/0ApEgelkUlnySBTF7d5/u7hGRum9cYmhYedFetakFQ1q+Ead
	 X36aiZ/JdFd6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D667840F7A;
	Wed,  7 Jan 2026 17:52:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D9F709ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:52:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C062460667
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:52:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wMycnWTvVD-K for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:51:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4F2F560661
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F2F560661
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4F2F560661
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6B3CEB97A704; Wed,  7 Jan 2026 18:51:57 +0100 (CET)
To: Thomas Perale <thomas.perale@mind.be>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:51:56 +0100
Message-ID: <20260107175156.228517-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229090719.13291-13-thomas.perale@mind.be>
References: <20251229090719.13291-13-thomas.perale@mind.be>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808317; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=YsBCSFIeTC2kmAkbQivzJ+qx6Q0Nr2WEGVcCHtG6UmQ=;
 b=NQZDnseAtammz9bbQT7jKTbzqFFf8hD+XH9Dgn/rPVQz8E1tz2UXQsMwA6Sw9nsq+Oulet
 LrdXs1S+4H/DYP6XLq0j7+dwVFK0dfMxRzqSMufR+fmZtss5yTvBgf80Vix68kUZshgNZE
 UzKgoSvOUc/QJrfJ/Qtf5xjaHk0UZq2WpRfURb3lmG0xvTNLcIwSES7iCcrX9/k66F1Dkw
 Oj3wAIJ2I4F/v4eYsiWm8lnD2a33Elt2LXUHS0thAlN4UYNy1VXlbpRuDmHWgXI17I3/ni
 A1KbXWfQ94XyfEeLKu+9syTp5XK6WsNX7JuH1KUPp0akucfd7RabD4tYZWtoQw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=NQZDnseA
Subject: Re: [Buildroot] [PATCH 13/14] package/pixman: fix patch reference
 in IGNORE_CVES
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
> Since Buildroot commit [1] the
> `0001-Disable-tests.patch` patch reference
> was removed in favour of a build argument that disable the tests.
> 
> This update the reference in IGNORE_CVES accordingly.
> 
> [1] ba2fb599cd package/pixman: bump to version 0.44.2
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/pixman/pixman.mk | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
> index 87d973230f..63d9ccd10b 100644
> --- a/package/pixman/pixman.mk
> +++ b/package/pixman/pixman.mk
> @@ -26,11 +26,10 @@ PIXMAN_CONF_OPTS = \
>  	-Dlibpng=disabled \
>  	-Dtests=disabled
>  
> -# Affects only tests, and we don't build tests (see
> -# 0001-Disable-tests.patch). See
> -# https://gitlab.freedesktop.org/pixman/pixman/-/issues/76, which says
> -# "not sure why NVD keeps assigning CVEs like this. This is just a
> -# test executable".
> +# Affects only tests, and we don't build tests.
> +# See https://gitlab.freedesktop.org/pixman/pixman/-/issues/76, which says
> +# "not sure why NVD keeps assigning CVEs like this. This is just a test
> +# executable".
>  PIXMAN_IGNORE_CVES += CVE-2023-37769
>  
>  ifeq ($(BR2_X86_CPU_HAS_MMX),y)
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

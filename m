Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A6BD0D153
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:51:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F05540A84;
	Wed,  7 Jan 2026 17:51:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q-kOKCoOLw77; Wed,  7 Jan 2026 17:51:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 769C640F36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808306;
	bh=fPHa7aoOFdGpEeo9mm0ky5vQ61Ceg8+I7+YTr3NskG4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XedCy+S3eiePvNBuS8B0JGgj2uxUCh0N/wKX1IBLn3uMqtA1HjuKIvh1EqmfkU6zk
	 9554KHLg5Kt+XcEVy4rehPAXh4ImpEUdEBEzfjgmyVoFhv2lr3gbn9pUMsGJHuyGzZ
	 Ll5F+F+uu4sgG3K/gUC+GYnLorDZIYd7FAY3/XZW4qOdwMaDyLLP9ceQNfeZwxOe5G
	 bR/u7CVPDvUfQyGaqy0TXS3c+jnAqjFKY9e9mdiyydUThBQOa/srpLCqt6lggkx1Hy
	 sQks41kM+d73WWIJJZL3RFG8//lQzGuzHdckwAF5vJs+0ocDPSL4SxwxTMgAy9athX
	 IYTvdzf3Q7KsA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 769C640F36;
	Wed,  7 Jan 2026 17:51:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 359209ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 27BDB60661
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VbU29x7P3crv for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:51:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 23F6060653
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23F6060653
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 23F6060653
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5A252B97A704; Wed,  7 Jan 2026 18:51:42 +0100 (CET)
To: Thomas Perale <thomas.perale@mind.be>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:51:41 +0100
Message-ID: <20260107175141.228189-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229090719.13291-7-thomas.perale@mind.be>
References: <20251229090719.13291-7-thomas.perale@mind.be>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808302; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=rLKZtoAhjtMkeWKYSH17qXvgMVkcOeLPvcoSeCSwKIE=;
 b=W9jDKAsWyciVKGBT5A/PPeu7MQL/4EygvIx38Cf4mTv4a0NYNLYBHdRTCoZZZKa8Sxp/nV
 MJDegk9otmJmNEiIyt35lDIau9ZdklGXjOKSe2Q4PM8kHNEz95FanvENwmyIrWJ2IFXgWx
 ndVBaAFiGtdpSzY6Z5lVA6WmPq/Wm54s0XcUnZnJq896nWra8I0dEQwmqCDpT5Xxjt7adY
 f6+i3krH9hYchOB9efMKg+j8c+V6zCIlgyouEK3PF85NPZmGSrc+mC0RFyPTdmJhqfGfaN
 pPoQgoeq2czbPypivzi0lMBtZ+kKnjR7PUpci7TFzLByiojBfzDv5l/O4nWWEg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=W9jDKAsW
Subject: Re: [Buildroot] [PATCH 07/14] package/avahi: add CVE trailer in
 patch
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
> Since Buildroot commit [1] the patches that fixes a security
> vulnerability needs to reference the fixed vulnerability.
> 
> This patch adds the relevant information to the patch header
> and adds the `Upstream` trailer.
> 
> [1] 1167d0ff3d docs/manual: mention CVE trailer
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/avahi/0001-Fix-NULL-pointer-crashes-from-175.patch | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/avahi/0001-Fix-NULL-pointer-crashes-from-175.patch b/package/avahi/0001-Fix-NULL-pointer-crashes-from-175.patch
> index 7e191e8da7..98d5dbf633 100644
> --- a/package/avahi/0001-Fix-NULL-pointer-crashes-from-175.patch
> +++ b/package/avahi/0001-Fix-NULL-pointer-crashes-from-175.patch
> @@ -9,6 +9,8 @@ Add missing NULL pointer checks to fix it.
>  
>  Introduced in #175 - merge commit 8f75a045709a780c8cf92a6a21e9d35b593bdecd
>  
> +CVE: CVE-2021-36217
> +Upstream: https://github.com/lathiat/avahi/commit/9d31939e55280a733d930b15ac9e4dda4497680c
>  [Retrieved from:
>  https://github.com/lathiat/avahi/commit/9d31939e55280a733d930b15ac9e4dda4497680c]
>  Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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

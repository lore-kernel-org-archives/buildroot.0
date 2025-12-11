Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CCB6D43341
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:31:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E624F8375B;
	Thu, 11 Dec 2025 19:31:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QFKQAf-csBHS; Thu, 11 Dec 2025 19:31:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C3688379F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765481479;
	bh=euUq91c+w0TRAaALx+FVJl2GWLtEX2ASW2AU2JLCaEU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=j6HdhjDjRHLurL8axpRffK5hweXl3+2ROX9Ulqa0rdXgnnQ8yu0KaBIt+tgspLR84
	 1ZvfDwqEUh0276yxoVw1sUiteHFXFQksnw69K97MtlFpPnbdZxQg1TCLMsPZrTQUUa
	 3VaAA4X+nXM40L5uczHAnSmMwSmpiIQsl8pcNCRJkySJnPus3WLx1HdCPXp3vhWYrs
	 f3oPa1lsvmWbS5DMm+fqxpoqUuKGMnR5Wnv25i3GMHHwqxjvlxQ96ZTBZwrNDCN5aS
	 6DOJDzOHjUuDuBkbPs29+/JBJs1xjDa632bb77C8EFLmmJAQn6svKb2KF9SKRuDOHu
	 HIKVHSPIKVljQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C3688379F;
	Thu, 11 Dec 2025 19:31:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 611142C1
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:31:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4828040500
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:31:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rZt_RVHCDWlM for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:31:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CB11340515
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB11340515
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CB11340515
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:31:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E0241B97A082; Thu, 11 Dec 2025 20:31:14 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Thu, 11 Dec 2025 20:31:13 +0100
Message-ID: <20251211193113.1099630-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251206214229.2306995-1-bernd@kuhls.net>
References: <20251206214229.2306995-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1765481475; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=wrWBaoZ0xc+c7rAuchfkvlzVvbmyJ0wgN1CpEh2cE6A=;
 b=G6GtFCsdEazrIYX3Py1gYoEjdZSdbKsxGwqlL8Haisi8ghTosVKDkgeVLCEINtUNFig+dx
 SHQiltww+vq/Yfoper9X8LZLInOi+uaEb6mMkOJMJZnMFfGQU1xyMhlN0Z9Ame3ZX7T95C
 pypP7h08T9jyPBf8YWcZTh92cR5XK3IATuSn1mnr1PyfumL/ojAWwm/Ls77fIBoiKZEPJm
 6cInVLn6ujnBDVvQD17vgboBjjvQ8HWqLbSosfkMLtE12GWejcCVtskPo93ChUT3thlGik
 fPMJd1MSiHLDCZ00f9t+SoZlBzR5Xi3eY8eLWoHA7YClgYlz6jGP5+KypY8vxg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=G6GtFCsd
Subject: Re: [Buildroot] [PATCH 1/1] package/mosh: update SITE
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
> Old URL returns 404, update SITE according to https://mosh.org/
> 
> Fixes:
> https://autobuild.buildroot.net/results/c1c/c1cf4568c82deb118aad0171bda356c7f59f17dd/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x and 2025.08.x. Thanks

> ---
>  package/mosh/mosh.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/mosh/mosh.mk b/package/mosh/mosh.mk
> index 3c41a17401..bc1f382a9f 100644
> --- a/package/mosh/mosh.mk
> +++ b/package/mosh/mosh.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  MOSH_VERSION = 1.4.0
> -MOSH_SITE = https://mosh.org
> +MOSH_SITE = https://github.com/mobile-shell/mosh/releases/download/mosh-$(MOSH_VERSION)
>  MOSH_DEPENDENCIES = zlib ncurses protobuf host-pkgconf
>  MOSH_LICENSE = GPL-3.0+ with exception
>  MOSH_LICENSE_FILES = COPYING COPYING.iOS
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

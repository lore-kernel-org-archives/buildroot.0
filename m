Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED711CD6E54
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 16:07:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A140642F0C;
	Sat, 30 May 2026 16:07:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K78jbwH7JITi; Sat, 30 May 2026 16:07:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9FA542F00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780157245;
	bh=4+56cHTowzdmofx2b5G/zT+TgESB8m1iNrTUp7I9kKg=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YOeF9tO9bdJ+XR+tKBSfv2HvxhXHdOk7utmf+iS/81RBM9P+SJMjbC1xI8cJvgZ+i
	 ZIJAjtJavi+c5lcUjNwWmr2UjPADyGAIdJLHyOlzonzeGXS/zW8dTIER6cH7QEfyOm
	 tyi2j9ZXvgCAPcc5PzccH4GHcGYblgKBXKM8GFOnnU1tsSUP9bldLP8teJs0SUAX7G
	 HuSZP3jLe44hjYuAnUezxS++5IJ8Hyxtf57aXENf6PTDu1mwASBUSQS7Ndf+ks1ocq
	 m6tF6mkG7XewNJj2iCoEs3Gr6+p0FQkpwUFH6Hg7TLh1H688Eq2dr7r7jpx1UDFgQn
	 tshd95Gpz0dhA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9FA542F00;
	Sat, 30 May 2026 16:07:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CB6612F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 16:07:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A8746F5B7
 for <buildroot@buildroot.org>; Sat, 30 May 2026 16:07:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yohcpmL9u4B1 for <buildroot@buildroot.org>;
 Sat, 30 May 2026 16:07:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 20DAF61B61
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20DAF61B61
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 20DAF61B61
 for <buildroot@buildroot.org>; Sat, 30 May 2026 16:07:21 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 3B8FA4E42DA4;
 Sat, 30 May 2026 16:07:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E456B6073B;
 Sat, 30 May 2026 16:07:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CEED410888CD6; 
 Sat, 30 May 2026 18:07:15 +0200 (CEST)
Date: Sat, 30 May 2026 18:07:15 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Vadim Kochan <vadim4j@gmail.com>
Message-ID: <ahsK2eJNNKDZBkrZ@windsurf>
References: <20260421185136.2577202-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260421185136.2577202-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780157238; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=HXgI7lU5cw7rSfYjHQ2g5AQxdsKQaV0LGVYv/iLzv3A=;
 b=r9eQFEgANMPGYiBp+lExawLdQC7ImG4Faz6325dVZsPh1r1X/X+XSmeX62J/fA6fouFyJv
 YFWBIqmwpe418N0g5/bcz3YXY0KvI3CqyjrMF8ic/FXU28h23FOD/2D7KBjvmUjfcTuaf/
 NPDtcG6kPex1AfSDyFTN6xKIiprcR8BF63oebiZb7WpvQkK0Q7uyZlnl2as7ZQYWKNBUIt
 1MuQJFUAWn8tCJ6ymwfcDcYtFqgKO27wNEc9VPHHOUsqoRlvxjNXpQCcentEWXYL044JwA
 1/QZB+0uQbnbpa+MPB3QZS5dWIAfiGx2CW88HEpT/M4Mr8LvBI2Q+fodKchoTg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=r9eQFEgA
Subject: Re: [Buildroot] [PATCH v4 1/1] package/gettext-gnu: bump version to
 1.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bernd,

On Tue, Apr 21, 2026 at 08:51:36PM +0200, Bernd Kuhls wrote:

> Since upstream version 0.25 installed m4 files were moved from
> /usr/share/aclocal/ to /usr/share/gettext/m4/:
> https://lists.gnu.org/archive/html/bug-gettext/2025-05/msg00041.html
> https://bugzilla.redhat.com/show_bug.cgi?id=2366708#c10
> Added corresponding _AUTORECONF_OPTS to dovecot, libfuse & linknx.

Aside from those 3 packages, how much did you checked whether other
packages might now need this explicit path to /usr/share/gettext/m4 ?

> diff --git a/package/linknx/linknx.mk b/package/linknx/linknx.mk
> index d67f010093..8402429d8a 100644
> --- a/package/linknx/linknx.mk
> +++ b/package/linknx/linknx.mk
> @@ -9,6 +9,9 @@ LINKNX_SITE = $(call github,linknx,linknx,$(LINKNX_VERSION))
>  LINKNX_LICENSE = GPL-2.0+
>  LINKNX_LICENSE_FILES = LICENSE
>  LINKNX_INSTALL_STAGING = YES
> +LINKNX_AUTORECONF = YES
> +LINKNX_AUTORECONF_OPTS = --include=$(HOST_DIR)/share/gettext/m4

This change is weird. What are you adding AUTORECONF = YES? If this
package does not need to autoreconf, I suppose it doesn't need the
custom autoreconf opts?

Thanks for your feedback!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2194D2F35C
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:47:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9FBC40E13;
	Tue, 13 Jan 2026 19:47:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ym85e4Gl2ibc; Tue, 13 Jan 2026 19:47:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43F0440E14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333653;
	bh=PKzi5ZqVJ4Aha/Yg//VbNQYcWO3sShapgeDhisz8re0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=h7MnVis7KaIqLSGHt7JW6JB3Wa9TotHIIQN8fzyNdI925aLnRwyQRmDoqzIokJpsr
	 KB0Wc5tNfhkUkCbWLgusesx9VyvlyI8YnMTRlRgpS10mWWSK544F+dSpJgfLdauCjt
	 LbP5G3ohrfy8Ra//Jkpb1GVWYMDfMVVTZiz/F4DW+be8FEXGxHcYcgtFTAFdbSboEj
	 vZQ06zmbg5fX26rqGQ7E/lG+SID2TUHIFJi1hf6yyj/k2JBPq5iFzyzVpKX9ZWn+WP
	 pqnXHM9kpoaWiEV/0dU0gECM70cV0+kfYaVh8DrcDOU+M37Hj37yGcNRpmimbBTV+P
	 XfdlWiFsKR0LQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43F0440E14;
	Tue, 13 Jan 2026 19:47:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 098AA231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:47:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E42C760BD2
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:47:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0DrCc6WO2E3F for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:47:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CE50360BB3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE50360BB3
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CE50360BB3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:47:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EE355B97A885; Tue, 13 Jan 2026 20:47:25 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Tue, 13 Jan 2026 20:47:24 +0100
Message-ID: <20260113194724.99865-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260102145407.917492-1-bernd@kuhls.net>
References: <20260102145407.917492-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768333646; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=eVmtBGThcpm/NDKHDmZutJIuxGFZT+A4AdQqNQNcEns=;
 b=VgtWyTJvozNfyo+jjddppNqVg2CIeh8gCD9h+DvYEClcXB+u1iJrxToGqXEzhGpUwPkBhi
 m9nK45uQVR7eR6G99USqmlzke3s0MCjFULYryOajxZfyRlGEDlxu3KU5tbpIntmf8RJZ5a
 jHiaz0MgwUWE0A3D1/Ke7hYQrIAUiXmJFyPy+2SISBMKkjwxpzMgEBSa+NSoJWnL0nZZxB
 p3GD3cmdme4Jjc0YzfQz8EOQpcbaR4QcRCRcvXNHLV+3zw7KBUIE7M1u8q/kjmtgv726gE
 Zm1PKIZL1JNSwVICKF6Px9gChadZjZT8gKiZmytBCii+nSuv9c7HHqzJZjIzkQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=VgtWyTJv
Subject: Re: [Buildroot] [PATCH 1/2] package/atf: update project URL
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
> The old URL redirects to the new URL.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
> v2: initial revision
> 
>  package/atf/Config.in | 2 +-
>  package/atf/atf.mk    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/atf/Config.in b/package/atf/Config.in
> index 43a5d4f2c9..800b488945 100644
> --- a/package/atf/Config.in
> +++ b/package/atf/Config.in
> @@ -6,7 +6,7 @@ config BR2_PACKAGE_ATF
>  	  ATF, or Automated Testing Framework, is a collection of
>  	  libraries to write test programs in C, C++ and POSIX shell.
>  
> -	  https://github.com/jmmv/atf
> +	  https://github.com/freebsd/atf
>  
>  comment "atf needs a toolchain w/ C++"
>  	depends on !BR2_INSTALL_LIBSTDCPP
> diff --git a/package/atf/atf.mk b/package/atf/atf.mk
> index 27c25c8b27..91d2fb5567 100644
> --- a/package/atf/atf.mk
> +++ b/package/atf/atf.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  ATF_VERSION = 0.23
> -ATF_SITE = https://github.com/jmmv/atf/releases/download/atf-$(ATF_VERSION)
> +ATF_SITE = https://github.com/freebsd/atf/releases/download/atf-$(ATF_VERSION)
>  ATF_INSTALL_STAGING = YES
>  ATF_LICENSE = BSD-2-Clause, BSD-3-Clause
>  ATF_LICENSE_FILES = COPYING
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

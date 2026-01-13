Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B212D2F32D
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:44:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D81B40286;
	Tue, 13 Jan 2026 19:44:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rQnTQgXrnHZd; Tue, 13 Jan 2026 19:44:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D8A1402A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333455;
	bh=RfBvQ1go2VQ+R390A/TkKc8az91pc7WPwmvLwsZ8PtU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=REj/Jrkq/khBQoGeZA5X5+Ap0F/yLyK8kMbF+fN+nbRlOqGR48AZkyb0soaE5VMuR
	 Icmhn0CbuFYEkudHrnbrgrqilirlx6JKLVMnZhmsy/togOthwl0iM+wbBoE71RVVJA
	 POKgiCbT7ewovl3p0a8AHnGsrIo+B6ZWv/jjRz77d96AxrVVksVQxLuwqdJO6HV/u9
	 rFQRo3yZQIgBW/+8rN/NiWGqwXmRnuYGTyD34SjvTbjYLA9WE2ra6QqR7QFlSkbYbY
	 GbWmpWwV3aJ9vnFSr+ADVGXAqbSaOJxHMWknw+XmkrkTr3cr1Fae7FsXNsNUN0Sb+v
	 etxrr3bS+QD2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D8A1402A8;
	Tue, 13 Jan 2026 19:44:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F560231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 592A5402A8
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:44:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 45yIMw-nG8BX for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:44:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3B03A40286
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B03A40286
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3B03A40286
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:44:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9A3F1B97A863; Tue, 13 Jan 2026 20:44:10 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Tue, 13 Jan 2026 20:44:01 +0100
Message-ID: <20260113194401.97073-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251013184504.3610364-1-bernd@kuhls.net>
References: <20251013184504.3610364-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768333450; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=e5kldRslq86T96G6XCdpFa67KYSOYhKF6KXDk+9yDkY=;
 b=KT2g7i4b5t+z8W0vs4OdUFGtdegGVHrDW+EmWJcPwodmzrvLtomVAJZRVL6B73v6f9Hq1P
 Mm/U1WdDiJxlI3oy2XVd43y49VXO5Ggn+nSEG9wutbbG4BefCdsipk1fUTmbfDVOQ9cLtr
 mGK/OMdKWPHJtLhE22qwuj4bzrSVvjXnCRrVBQovIlRtvzwj8qesrtlDnRtiO64ha7zTE3
 ZN606rx7qwnZr0Taxx4c81f5LaLVaOMAx71Oq5Od7Asi4bu5zYeEd5BfgaOrtuxO+guIc3
 8pTNqHIGVdhoAe7ImNL86RiwEDD6KoEMFCfjIONdbLIjX3LV0/1xDBQ8c8SVpA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=KT2g7i4b
Subject: Re: [Buildroot] [PATCH 1/1] package/liburiparser: bump version to
 0.9.9
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
> https://github.com/uriparser/uriparser/blob/uriparser-0.9.9/ChangeLog
> 
> Renamed license file due to upstream commit:
> https://github.com/uriparser/uriparser/commit/460ff9e573b4b2bc3a3114d91e95c885d8745458
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x. Thanks

> ---
>  package/liburiparser/liburiparser.hash | 4 ++--
>  package/liburiparser/liburiparser.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/liburiparser/liburiparser.hash b/package/liburiparser/liburiparser.hash
> index f2e3317897..bed9c8ee9b 100644
> --- a/package/liburiparser/liburiparser.hash
> +++ b/package/liburiparser/liburiparser.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  1d71c054837ea32a31e462bce5a1af272379ecf511e33448e88100b87ff73b2e  uriparser-0.9.8.tar.xz
> -sha256  287f09e6546a9610f949f89e8fb937cacfeabd7bfaa8c8a0c18312193bf04ad3  COPYING
> +sha256  85645df1bb220a3867c42f8adeba4f6a4b2fdc1563e91ad7d9f92d14d3dd377d  uriparser-0.9.9.tar.xz
> +sha256  287f09e6546a9610f949f89e8fb937cacfeabd7bfaa8c8a0c18312193bf04ad3  COPYING.BSD-3-Clause
> diff --git a/package/liburiparser/liburiparser.mk b/package/liburiparser/liburiparser.mk
> index b0ba8c387b..66ec72409c 100644
> --- a/package/liburiparser/liburiparser.mk
> +++ b/package/liburiparser/liburiparser.mk
> @@ -4,11 +4,11 @@
>  #
>  ################################################################################
>  
> -LIBURIPARSER_VERSION = 0.9.8
> +LIBURIPARSER_VERSION = 0.9.9
>  LIBURIPARSER_SOURCE = uriparser-$(LIBURIPARSER_VERSION).tar.xz
>  LIBURIPARSER_SITE = https://github.com/uriparser/uriparser/releases/download/uriparser-$(LIBURIPARSER_VERSION)
>  LIBURIPARSER_LICENSE = BSD-3-Clause
> -LIBURIPARSER_LICENSE_FILES = COPYING
> +LIBURIPARSER_LICENSE_FILES = COPYING.BSD-3-Clause
>  LIBURIPARSER_CPE_ID_VENDOR = uriparser_project
>  LIBURIPARSER_CPE_ID_PRODUCT = uriparser
>  LIBURIPARSER_INSTALL_STAGING = YES
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

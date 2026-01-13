Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F16CAD2F35C
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:46:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E03784206;
	Tue, 13 Jan 2026 19:46:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bYSohiSxQpZG; Tue, 13 Jan 2026 19:46:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 462188424D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333599;
	bh=BKowP+71zHFdXffoRKLEouSQ9U0wuezll8C+qbQbBVA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=H2R5uQAWRIJf/Zeajs7ge4rx9bL5nXzRKq2/5M2M+E+ivvIYUdQX9wOKl8GgjLmGi
	 ALLfLuOmHkfSkdcq7mcR8JpJjpbv9qXXPJKkPt03QI0UFy39rd9AV2BtUJE/+fei7O
	 VmOHPfPGGZg4Jw4Jolm7J4xoWqkXvoUktFwSazTC77HfuBjkXjHojz2JR0pdm8S0TR
	 NpMmsrWVtSxF8zaBwU3H6FmPARVSqCdEoNKvVdZcWkQFDl8opihLBY+VEx4OpT965l
	 RsZqGVCmr2oiFHJ1OCND2KQJSgNY6vUODMe+tIsXV9e6Vkfz7UxZ6BQtQzpLe/sDf7
	 dh7lnc2q+c9hQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 462188424D;
	Tue, 13 Jan 2026 19:46:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 926951C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:46:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D91860BD2
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:46:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f_jvEaI-ce4m for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:46:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 68BDC60BD1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68BDC60BD1
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 68BDC60BD1
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:46:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A1B5EB97A886; Tue, 13 Jan 2026 20:46:34 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Tue, 13 Jan 2026 20:46:33 +0100
Message-ID: <20260113194633.98715-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229081435.620201-1-bernd@kuhls.net>
References: <20251229081435.620201-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768333594; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=iwCLYY9+wwa31Mct5Edmj6Aoqx56P17M1dQ8lVGayOM=;
 b=c9g49n6KpVgzDPe5Mwbp97w6f67XYa2R7148tWEWSsqsBSwKrK5+n6vySQIs2iUGf0q6N9
 2qiYBfHyc1LmfEohqbrqlmEJIu+DmFJkeZtsvs8eBrphOV0s3aDxrvdk1A0rHSnGSqGjbx
 pv6rwrVad9VtGS5II9yFPvlhRtldyij8+qX2HIem14P5qJD2UDQK6oSLXVkOTinWlK2ILa
 9SDM62KalaqufcScD7AbTnH1hcsN1XRBlB74ibLUwTACX+t3YNsxx2Z6BWx4A41nmUuuRn
 DWBAUAE8yvmP6ZYslHqpBgZb7qJJ0DJMNor9hAcQICYXrhDuC039HJmO7zV8uQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=c9g49n6K
Subject: Re: [Buildroot] [PATCH 1/1] package/liburiparser: security bump
 version to 1.0.0
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
> https://github.com/uriparser/uriparser/blob/uriparser-1.0.0/ChangeLog
> 
> Added sha256 hash provided by upstream.
> 
> Fixes CVE-2025-67899.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/liburiparser/liburiparser.hash | 3 ++-
>  package/liburiparser/liburiparser.mk   | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/liburiparser/liburiparser.hash b/package/liburiparser/liburiparser.hash
> index bed9c8ee9b..f8d7124b7f 100644
> --- a/package/liburiparser/liburiparser.hash
> +++ b/package/liburiparser/liburiparser.hash
> @@ -1,3 +1,4 @@
> +# From https://github.com/uriparser/uriparser/releases/tag/uriparser-1.0.0
> +sha256  154a3f649d80a78d5095fc461ec032ffb45f5ed3619edec923ac68cff29a088d  uriparser-1.0.0.tar.xz
>  # Locally calculated
> -sha256  85645df1bb220a3867c42f8adeba4f6a4b2fdc1563e91ad7d9f92d14d3dd377d  uriparser-0.9.9.tar.xz
>  sha256  287f09e6546a9610f949f89e8fb937cacfeabd7bfaa8c8a0c18312193bf04ad3  COPYING.BSD-3-Clause
> diff --git a/package/liburiparser/liburiparser.mk b/package/liburiparser/liburiparser.mk
> index 66ec72409c..731739e582 100644
> --- a/package/liburiparser/liburiparser.mk
> +++ b/package/liburiparser/liburiparser.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBURIPARSER_VERSION = 0.9.9
> +LIBURIPARSER_VERSION = 1.0.0
>  LIBURIPARSER_SOURCE = uriparser-$(LIBURIPARSER_VERSION).tar.xz
>  LIBURIPARSER_SITE = https://github.com/uriparser/uriparser/releases/download/uriparser-$(LIBURIPARSER_VERSION)
>  LIBURIPARSER_LICENSE = BSD-3-Clause
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

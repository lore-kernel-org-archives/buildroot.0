Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB68CCF2DA
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 10:09:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D854C8084C;
	Mon, 19 Jan 2026 10:09:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IWyp6-hyRTPg; Mon, 19 Jan 2026 10:09:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EAD1780B3D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768817386;
	bh=6Trs90cKhELHHSLEfr16JEISs7KQIeCKCiNOReQE0dA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=o7rjMzv2KyyHh1ZhrLzRLL3DhEENVRQwFLRAcu88AKOPihjs5WyydQ8WVemzqAF1E
	 L/3710VvIgcFAkhUx44dYAzMaozRdseWdydzXGjeHzE9pAMGMGat/UrHcOZBUW0nqR
	 2gXmEf0isSo1odMx/PQNPtElDNrcVoApqg/ilkowtoyi7E7EISfmYKSzyycqS5AIGs
	 wLBn0BDXLayUTyexxxtHrz6DgiVk3E0+QK/IIqSPGItFZpfdqzVK7Y678krbZAWD2M
	 86y9chh9fwIYOBUnfN68BYoQE4QBjm0X0rWhmIhKXNO8u5ZIhznzBaHubUj23AvA4J
	 KXJS3TYn9qISA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAD1780B3D;
	Mon, 19 Jan 2026 10:09:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 919F62CE
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:09:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 77B1A60D91
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:09:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IED1ScA-kLZb for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 10:09:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6525D60D90
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6525D60D90
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6525D60D90
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:09:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 56C27B97A96A; Mon, 19 Jan 2026 11:09:34 +0100 (CET)
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Mon, 19 Jan 2026 11:09:33 +0100
Message-ID: <20260119100933.13243-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <aWJdHyFAsJcw6JYP@waldemar-brodkorb.de>
References: <aWJdHyFAsJcw6JYP@waldemar-brodkorb.de>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768817374; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=cMSFJoq56KzYeWMmgYagWGCbqfGeX+rvGF5oRCAugz0=;
 b=XbU1g28kfNcUukTaHFa0ORrYf1UHMdH1MF39sFKgDiat4Tqfuc7AGZ6mQbcnTBprQGepSv
 DOhSBZdfWQO0ttcZpn0ISW357TH2AiInbkXDlAATZqQiXgzA3f+0SyVQVpxV0y5SuHZq6o
 KtoULSHSO8AakAVNlVgn+HIXvEk79WqlO0YRESIy7BpQer7CVn9nRa2CARRAQzW2e+XSiv
 Z4T1pfQvkqA0K6+DHeuWq9/MAKgyQgxpU8R2HSX8TWTuHOggHEdI/BqqqDLBwdgNTVGlhk
 Hz8u9M87TsIrO/e7VgNppVcrpJokUWVCS3VB1nRA1Y04xT5IThSBg36zfZt0Gg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=XbU1g28k
Subject: Re: [Buildroot] [PATCH] package/uclibc: bump to 1.0.56
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
> Changes in this release:
> 
> Julian Vetter (1):
>       libc: kvx: add {get,set,swap,make}context functions
> 
> Waldemar Brodkorb (6):
>       Add glibc internal macros for 64 Bit architectures
>       fix verbose output with make 4.4.1
>       nds32: add missing define for TLS
>       NPTL: remove attribute_protected from function
>       add gettid syscall wrapper
>       bump version for 1.0.56 release
> 
> tinyusbboard .matrixstorm (1):
>       avoid crashes in statical linked binaries when dlopen()
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/uclibc/uclibc.hash | 4 ++--
>  package/uclibc/uclibc.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
> index 56174a33b8..6a96e57069 100644
> --- a/package/uclibc/uclibc.hash
> +++ b/package/uclibc/uclibc.hash
> @@ -1,4 +1,4 @@
> -# From https://downloads.uclibc-ng.org/releases/1.0.55/uClibc-ng-1.0.55.tar.xz.sha256
> -sha256  5f7f3aafddb2ca08fb295be45561c0188407103d7446cfd264b9b822fed3ed2d  uClibc-ng-1.0.55.tar.xz
> +# From https://downloads.uclibc-ng.org/releases/1.0.56/uClibc-ng-1.0.56.tar.xz.sha256
> +sha256  23c9cab54c113e020fb20b9dc06be4a49560df791b78fcbc2ca899a6e8f213dd  uClibc-ng-1.0.56.tar.xz
>  # Locally calculated
>  sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING.LIB
> diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
> index 0c303d77f8..e1cf12fa68 100644
> --- a/package/uclibc/uclibc.mk
> +++ b/package/uclibc/uclibc.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -UCLIBC_VERSION = 1.0.55
> +UCLIBC_VERSION = 1.0.56
>  UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
>  UCLIBC_SITE = https://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
>  UCLIBC_LICENSE = LGPL-2.1+
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

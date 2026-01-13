Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 544C1D29DE7
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:47:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13402843C4;
	Tue, 13 Jan 2026 19:47:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id djoeUuDwVK6p; Tue, 13 Jan 2026 19:47:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D826843C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333660;
	bh=3BTP0w95heeNeDbN7IHlJK3NtTQ6nLWvYkimiJnBWmk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=J/q+yA5N5bemwp725zHlccitN5z8AN7jsFFPMoI+1GQt0VWmpWxwpiBIJFU9Z5R5U
	 Hrp3/JbvTOudM4LJtiskiMEcMjn13if51HA8F+5WLOb7rbuI4AzU75S7StMPZCaILh
	 u7sjIECPDLa2+g2iyBQTTsY0/6JDsofe2Am/tTLOTxfrsgHNpZsXYXMnqy9GYZ+JY+
	 foDJT+0dfIPdsac95Ul/yn3pep7GnGIRQS3XtRAv048qk6GYT00WuNBjLbcjzcaAhO
	 M46BtW/9P6BVvh3eC4iZCNef7WnwAmwbsBgTqJymocd5/9dq796JMFrfmorL6MXXPe
	 e/vGO8fvzVqMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D826843C8;
	Tue, 13 Jan 2026 19:47:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B2C66231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:47:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 98F6740E15
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:47:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u65DfFen7D2z for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:47:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9DDFD40E16
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DDFD40E16
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9DDFD40E16
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:47:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AF4C2B97A863; Tue, 13 Jan 2026 20:47:34 +0100 (CET)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Tue, 13 Jan 2026 20:47:33 +0100
Message-ID: <20260113194733.100053-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260103224330.2933161-2-thomas.petazzoni@bootlin.com>
References: <20260103224330.2933161-2-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768333654; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=eWuQWn5PImjEP8sjrLF9C5JeLpSP+AglZk8YtoMxlu8=;
 b=juOvHWaM+CGJRzr+tXgzuWEu8L8FrM48lAslfQADWTSp4biLvSnJRP1j0rLWDiRehrynd0
 NocRRJmIs0BnW9BBLmmHj2yG4FuXp1gnMkBZOlNBkb6hJEkMKK0OLBDMIj+Kz5mdqlOIn9
 TA5gXUcm9ukhkVDtg1x1G8c9xtuygCx60upWGZzo+L4EUref06VKJ5P3QrqQpS4LmK+/Kc
 JHzJAyv2KWLnnp69P5SmYEivn/t97iEyZGoCQN1nYffNIQjTBgpgHZ1Ail3AbY5qGz13pT
 J/dn6xyt0SgFqRyyeW5ha/DrSktF2+3wWLtrtT2+ILZBygfAQFLV3+bQcLmc3A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=juOvHWaM
Subject: Re: [Buildroot] [PATCH 02/11] package/opencv4-contrib: fix
 Config.in comments
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
> The comments saying that dnn_objdetect and dnn_superres need a glibc
> or musl toolchain should be shown when a uClibc toolchain is selected,
> not when a toolchain NOT using uClibc is selected (as this is exactly
> what's needed).
> 
> Fixes: a2e01b23fc441a4be4416e68d91e331e00db3bbd ("package/opencv-contrib: propagate opencv4 dependencies")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/opencv4-contrib/Config.in | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/opencv4-contrib/Config.in b/package/opencv4-contrib/Config.in
> index d992c6d1ac..ad61c3fbe8 100644
> --- a/package/opencv4-contrib/Config.in
> +++ b/package/opencv4-contrib/Config.in
> @@ -84,7 +84,7 @@ config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DNN_OBJDETECT
>  
>  comment "dnn_objdetect needs a glibc or musl toolchain"
>  	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
> -	depends on !BR2_TOOLCHAIN_USES_UCLIBC
> +	depends on BR2_TOOLCHAIN_USES_UCLIBC
>  
>  config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DNN_SUPERRES
>  	bool "dnn_superres"
> @@ -97,7 +97,7 @@ config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DNN_SUPERRES
>  
>  comment "dnn_superres needs a glibc or musl toolchain"
>  	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
> -	depends on !BR2_TOOLCHAIN_USES_UCLIBC
> +	depends on BR2_TOOLCHAIN_USES_UCLIBC
>  
>  config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DNNS_EASILY_FOOLED
>  	bool "dnns_easily_fooled"
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

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC3B2D2A537
	for <buildroot@archiver.kernel.org>; Thu,  4 Dec 2025 20:43:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71C6961CE4;
	Thu,  4 Dec 2025 20:43:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uTSprrjfyfZT; Thu,  4 Dec 2025 20:43:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9523561CFB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764881037;
	bh=FB/mmZTKdlX9+qv4wCgp1lt+yw1gAB3W8VJzBGVSyqY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QYzk0g1hGpRWtQ9pOv2S3tFAjNZ1KO249NKSgWhqjA4tyT8nIKpQrqEd/5KdQG8PE
	 xXm6kERa4Va+ucoStQq8ZGaLlgks6A93tcmUWupehh1zT4XyZmkhIJWeaybrq41O+M
	 8TGrN9FiGG/t2H3/hoK0KBnYufp9qtnhpDLLxztYtqJkTa3Bl9rhkX6n54LEaLKSiv
	 jjH9M6YXx7U8fX7dF9CRrKcFQGj5t9ZulKud9wspN7Miill9q/J9tQILASrsK7XXaa
	 RWJ7WPjGfp3dG7MkWP44KIlbbJzS2eX+kPbF7L0zyY9/hjxgYTq34vZ3rMTP2HqS5v
	 NU0FvpR8KIQ1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9523561CFB;
	Thu,  4 Dec 2025 20:43:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 238E91A9
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:43:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A28A4049F
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:43:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4C_hauPdsm15 for <buildroot@buildroot.org>;
 Thu,  4 Dec 2025 20:43:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E7B1340428
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7B1340428
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E7B1340428
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:43:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CE8F4B979ECC; Thu,  4 Dec 2025 21:43:52 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Thu,  4 Dec 2025 21:43:51 +0100
Message-ID: <20251204204351.13418-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251129074011.686916-1-bernd@kuhls.net>
References: <20251129074011.686916-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1764881033; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=fuK122D4EcQqcGbfYNvhKXmQm2hgzI0WYGlLloIpqIY=;
 b=Ldf7m5x6XGQN6MQCz8x33HYQvrpRi1tPi42x0BB7EdOAwxe8tVYk/wXvNXqrE0SSV83SJD
 u+HviNSIhvxqPhw6k7O6Vfowkr3HV/IEYN/a6Q7z9jMK8g//ouyg+bLILV5C8ViplK4jsP
 n0BrKxe99ecAk5sD3DF4A29n3xMuStdS0lfjYFpFvJ9japKNbqaJ29DtCIlWeuSr9N43in
 Nf7GdLIPMQsL1yFQadrOrjVOtY4zoIZiaX18qvOKMDDw7bP2xR35uRByMShR7n2AxyCrYP
 akheEd8J1J/swHNj/HllSwb39+gymMssIUC5auQAqodDvCA106j86hCJnZMDig==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=Ldf7m5x6
Subject: Re: [Buildroot] [PATCH 1/1] package/pdmenu: fix build with gcc-15.x
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
> Fixes:
> https://autobuild.buildroot.net/results/554/5545162ca0206cacfca1617280f074237e72aec1/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.08.x. Thanks

> ---
>  package/pdmenu/pdmenu.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/pdmenu/pdmenu.mk b/package/pdmenu/pdmenu.mk
> index 2691a67ef6..72eb95bddc 100644
> --- a/package/pdmenu/pdmenu.mk
> +++ b/package/pdmenu/pdmenu.mk
> @@ -11,4 +11,11 @@ PDMENU_LICENSE_FILES = doc/COPYING
>  PDMENU_DEPENDENCIES = slang $(TARGET_NLS_DEPENDENCIES)
>  PDMENU_INSTALL_TARGET_OPTS = INSTALL_PREFIX=$(TARGET_DIR) install
>  
> +# gcc-15 defaults to -std=gnu23 which introduces build failures.
> +# We force "-std=gnu17" for gcc version supporting it. Earlier gcc
> +# versions will work, since they are using the older standard.
> +ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_8),y)
> +PDMENU_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=gnu17"
> +endif
> +
>  $(eval $(autotools-package))
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

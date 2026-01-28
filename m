Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B9ED3F09D
	for <buildroot@archiver.kernel.org>; Wed, 28 Jan 2026 17:24:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6E5A40C91;
	Wed, 28 Jan 2026 17:24:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oxe-srdb8FyH; Wed, 28 Jan 2026 17:24:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7494A40C74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769621091;
	bh=joYfQ5ZSYZiD4MMHrENxOdFEXatGOyLRHIMLJbGJizU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=f6D4ZD7awM9x9NbKvy8VJjJbElE6y3caoHrB033vuDvDS8NjUP4Xi28IRkJyVL8G6
	 7oWYWonS1jzZbdPRoho9p+LZVvo3aauGnWYWfJRQmAerUYXsgEln23Foa/9xXZLM8L
	 4Bq4Ci4+pFB3b3rJBWqxfA7Wftr7nPk5Uh17/VNUVyNPBXEskxoegr4cNp1eX2KVFs
	 vEcATFJPSJwZYMdPIvDc/SOkxELEtZBoupQFBujQKyL78fhOqYmoak7sGugvXn78gz
	 O+Ph7pftaeZskAgmVJDiXDSJBgLkssf6XnTgnOGdUX/f04wtWBsM8+yPAumVgNHLqC
	 uwm9Jf6z/RUMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7494A40C74;
	Wed, 28 Jan 2026 17:24:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 741441AD
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:24:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6DF8480C42
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:24:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CG4QRe7Hz9mR for <buildroot@buildroot.org>;
 Wed, 28 Jan 2026 17:24:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5738D80C33
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5738D80C33
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5738D80C33
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:24:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 70EF2B97AC7D; Wed, 28 Jan 2026 18:24:35 +0100 (CET)
To: Michael Nosthoff <buildroot@heine.tech>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed, 28 Jan 2026 18:24:34 +0100
Message-ID: <20260128172434.343258-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116123039.879487-2-buildroot@heine.tech>
References: <20260116123039.879487-2-buildroot@heine.tech>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1769621075; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=2dWRQvQVTff3qmV6fDRqUiULH862TnfySi1sK9NcYiw=;
 b=Bor2CrvcEFhzqhCfl/ImY/RXkhX99f0g6RvTzWlG1fisHrQS+I6ZaHq6R/Si86oecwaGXN
 rdYP0SEAszNFoch4d4tbb2UeRbdYdzFiAv51NxU/2TjlWesoSAilXqN8aD64ODVUB3YKKe
 aJE8MPbr7hhBMn4RbsmBSDzlL/Q6nAaKXl6ZFNWdHvjUX9lvwi9/4IrRseLWWfSl/cL0Uh
 HeSf+VIACQimyR4f8xJOnu1UOfx4l8fiVQPmLWbHMyUDmAQX8RdS5ErslJvlidwq9R/QHK
 matTw/Hq5zGO/tWi+AT2O3oxfmi9ZL7AiV8S6bg8dhNOVUh+Wyya+kLw0urfJQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Bor2Crvc
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: update packages for Michael
 Nosthoff
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
> - i don't use grpc anymore and updates seem complicate to review,
>   so drop me from it and its dependency re2
> - add packages i'm currently using
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  DEVELOPERS | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index c150ab8fc5..4fd9add287 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2427,13 +2427,13 @@ N:	Michael Nosthoff <buildroot@heine.tech>
>  F:	package/boost/
>  F:	package/catch2/
>  F:	package/fmt/
> -F:	package/grpc/
>  F:	package/gtest/
>  F:	package/json-for-modern-cpp/
>  F:	package/libabseil-cpp/
> +F:	package/libgpiod2/
>  F:	package/networkd-dispatcher/
>  F:	package/protobuf/
> -F:	package/re2/
> +F:	package/sdbus-cpp/
>  F:	package/spdlog/
>  F:	package/sqlitecpp/
>  
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

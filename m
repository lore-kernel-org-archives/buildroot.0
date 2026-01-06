Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3096FCEFD18
	for <buildroot@archiver.kernel.org>; Tue,  6 Jan 2026 22:22:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 072A260C22;
	Tue,  6 Jan 2026 22:22:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lqIuJw8Re740; Tue,  6 Jan 2026 22:22:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2F4960C19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767738157;
	bh=dlVMqgNw66KvZgdNlwzPSw2L9WxdyrMKakWdOXoKErI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=B1qOjIb3TAAHNJiHMFj0CwsKzCrpbQWnk2KrnyyQ2XaEyoFamS494Ssw7pMgi/BYF
	 XRAiHK/bYwRWMbRsgUu8iL2cSDYaw+HhtsKeLTiDOCjGK2qfjVMed14tNb/Uzolllx
	 O5bWtJBsiXqsUAnopFSAOzUf5PLH2VFOGnQSq+PQOQi0SN+Jzrov8+H500FED+k1J/
	 hZUXYbQOtQLbvOhfzzobbRtzEr5mEWfq3F0JG8LcxWNHSdGsIMfaU5q9+iM4HZi4xm
	 JeCWTyyIhwuwnf2BYzqORbFVsDOMv2QDWqjSlO/qRdM0On2QsuU9mVrBRFzG9bIY6Z
	 aB+2gQURYRZNg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2F4960C19;
	Tue,  6 Jan 2026 22:22:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A524570B
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 22:22:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B4BB40763
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 22:22:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XQdjuujIlAKm for <buildroot@buildroot.org>;
 Tue,  6 Jan 2026 22:22:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B59F440368
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B59F440368
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B59F440368
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 22:22:34 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id C78724E41FB4
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 22:22:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9E59260739;
 Tue,  6 Jan 2026 22:22:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 07394103C807E; Tue,  6 Jan 2026 23:22:30 +0100 (CET)
Date: Tue, 6 Jan 2026 23:22:30 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>, Jarkko Sakkinen
 <jarkko@kernel.org>, Petr Vorel <petr.vorel@gmail.com>
Message-ID: <20260106232230.28cc9df4@windsurf>
In-Reply-To: <20260103132552.3979708-4-bernd@kuhls.net>
References: <20260103132552.3979708-1-bernd@kuhls.net>
 <20260103132552.3979708-4-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767738152; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ralU6E93/Vm933zDNYXtIzTqumi5VJ1Nf24b7QevLRU=;
 b=Ovp8Tb1VdDEgMsXjugvGQlVYj2yWPtPKsV0isWWyDSvwz3IjnoSf3E8xJtOhDlwvJo3/FQ
 E2N6Z+PTB2kFWnIMbtgPwsR/yg1fiGtFr4oxiEt6JKpMNNeh4lMkApt6T02eOAer91Wbqg
 cLWqXv/T8qZV8tl2vNNl+Jd7bWV+oYPa42VWdwuHU9+hsSQtu9ik853GzymI26LnNjzzwX
 isQ4nPXky7JYRRERFLdzAlcQnMB7xb22d0yhXc9hbtPrUgW/vQYz5DyuyYrvxI1bVo6McR
 tk0bd8oyPZ83/3OLQE4/7CE9Tqrz4Js7krdiS/bOMBt1QvHndLRLgcqxi06NmQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=Ovp8Tb1V
Subject: Re: [Buildroot] [PATCH v4 3/5] package/rpcbind: fix build failure
 due to missing BR2_PACKAGE_LIBTIRPC_RPCDB
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

On Sat,  3 Jan 2026 14:25:50 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> diff --git a/package/rpcbind/Config.in b/package/rpcbind/Config.in
> index 9cde7bba39..0b2c207580 100644
> --- a/package/rpcbind/Config.in
> +++ b/package/rpcbind/Config.in
> @@ -5,6 +5,7 @@ config BR2_PACKAGE_RPCBIND
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libtirpc
>  	depends on BR2_USE_MMU 	# fork()
>  	select BR2_PACKAGE_LIBTIRPC
> +	select BR2_PACKAGE_LIBTIRPC_RPCDB if !BR2_TOOLCHAIN_USES_GLIBC

Same as nfs-utils, dropped " if !BR2_TOOLCHAIN_USES_GLIBC", and applied.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

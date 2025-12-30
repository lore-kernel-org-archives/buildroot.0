Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FC0BEE4992
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 18:16:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 247244082C;
	Tue, 30 Dec 2025 18:16:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bcxJqfYNGzfd; Tue, 30 Dec 2025 18:16:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33ACF40446
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767118606;
	bh=g92ar6we6djLfSfg6iLP8XvA5oD+quoTDE2THeO9Uw8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Y1kqLCNSLENh0WaapRz7/V4IItluZ4Cxp0SGes2rkHYqy19LRVzQEDuOaylnzWLrZ
	 2FJfZOGNMtVATmABr/dqftKN4boADus07Io0xASrD5BY1OQfrnV43nvWYiGYW3Jv2Y
	 eEQEpdbqWZsrNYMr1PSdZR88HInNV/AE8SZ0Rg2EJnZqaG/llJOx7j+rBXWV/Ku/6+
	 47bKtRC84UHPznZmlmtyjhwl99Pf/UKxtsCw3eFwI8+eoqSzLc5fI+2g7QFlQ5K781
	 L9XxLA1o3uCpkVf2JjhuQ32oMcKdzf98CLOryBkVDsV2Rz9nFupjKX6Sj6jNuEg/Uj
	 zOO71UL8++UsA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33ACF40446;
	Tue, 30 Dec 2025 18:16:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0105E177
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 18:16:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB83D80B71
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 18:16:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hNR-ehIzbVXh for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 18:16:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D1DFE80B56
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1DFE80B56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D1DFE80B56
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 18:16:43 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 340211A2544;
 Tue, 30 Dec 2025 18:16:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0527A6072C;
 Tue, 30 Dec 2025 18:16:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 554D3113B05B3; Tue, 30 Dec 2025 19:16:38 +0100 (CET)
Date: Tue, 30 Dec 2025 19:16:36 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Andreas Ziegler <br025@umbiko.net>, Angelo
 Compagnucci <angelo.compagnucci@gmail.com>, Fabrice Fontaine
 <fontaine.fabrice@gmail.com>, Mahyar Koshkouei
 <mahyar.koshkouei@gmail.com>, Matt Flax <flatmax@flatmax.org>, Romain Naour
 <romain.naour@gmail.com>, Simon Dawson <spdawson@gmail.com>, Woodrow
 Douglass <wdouglass@carnegierobotics.com>
Message-ID: <20251230191636.0fa025a9@windsurf>
In-Reply-To: <20251230114545.2236640-16-bernd@kuhls.net>
References: <20251230114545.2236640-1-bernd@kuhls.net>
 <20251230114545.2236640-16-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767118601; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=7kgftYPclRyQ3DhTS7HhuGhXP+FhknPJUh2q97Q+w2c=;
 b=Bdaacp4NU4fNc+9MSqjWoYQ6Y3lwLyjeXueenj5DtRE/fNAg2ROd3YYVanGVYH8DS/Ha9Z
 iPrdqugB44r1oRGOFyDK5qwjChMCiNSMgAw9QjaXFcojHgbzt0xb/okWLSTSPZpnxaZule
 l8KVKX2udMAKPxsuB2mcO8U/Vi+VZ9FvWH+NlqqJImxC+lVQBDJJTKevS8KqVe9OpTCc+5
 9r2lyjSJ6FPOqpZTIQPq8Grb5g4WtsKa89HBZKmEnBJ9cuQESl5BSrwYHcGX0QQRC9sJiG
 RC1ozg+IbDsWPCBdlBZcZMB5bsFIMShIvQq0je5AL9u5V+b0eb+3rrvsGYi3jQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=Bdaacp4N
Subject: Re: [Buildroot] [PATCH v9 15/19] package/vlc: remove optional
 dependency to opencv3
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

On Tue, 30 Dec 2025 12:45:36 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> -config BR2_PACKAGE_VLC_OPENCV3_BACKEND
> -	bool
> -	select BR2_PACKAGE_OPENCV3_LIB_IMGPROC
> -	select BR2_PACKAGE_OPENCV3_LIB_OBJDETECT

A Config.in.legacy entry should have been added for that, so I did it.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

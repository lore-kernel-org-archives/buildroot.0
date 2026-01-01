Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7CFEEEB57B
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 22:25:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 667B460790;
	Thu,  1 Jan 2026 22:25:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r0sP9KgLgyWz; Thu,  1 Jan 2026 22:24:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0004A60749
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767306299;
	bh=ruHnVj0QILX6ROgMG1Wsrivbdg9wpCfHtPQeW/xJLpo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Uv6SOLTbHNbuAsMLiXAbfp7qnDJrbSilIBui1OQY4QrmQa1Uw22sVffRa9IYyzSr2
	 xH+OWNJWmaW/6u2Nt+RUbwxfVVCh1E2a4faDRmjRJ/f20TnS6xdtg1AhdjNefKmZDW
	 yG7tEuXCn5waT1biju7esTp4UwfgAvZfHlZ07Kd1u2dhx8Og2Rhn+rEKfRYaIjG9lL
	 uU5mIWwzNN6dSKXJR2S2k6R5/8ngLAyt1Q2/tkUZ3KQnRO7vv9GLQhPxwxBK3bwTb7
	 RiFd9OiPEXVhcht4cO33j6+M/DtMzN0W31kAvfGPgWsMGLjAF42rwmLEaj/pXac2o2
	 e4hFqXuY9TU5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0004A60749;
	Thu,  1 Jan 2026 22:24:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 71AA8206
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 22:24:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 63B9D404AA
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 22:24:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mdkqkrbkp6Ep for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 22:24:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 77FD940489
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77FD940489
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 77FD940489
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 22:24:55 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id BBF954E41EE5
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 22:24:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6EDC760749;
 Thu,  1 Jan 2026 22:24:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D7689113B0713; Thu,  1 Jan 2026 23:24:51 +0100 (CET)
Date: Thu, 1 Jan 2026 23:24:50 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Dario Binacchi
 <dario.binacchi@amarulasolutions.com>
Message-ID: <20260101232450.72c4316e@windsurf>
In-Reply-To: <20251122225314.2208991-1-bernd@kuhls.net>
References: <20251122225314.2208991-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767306292; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=wdkCkuEGtitINmTyYe+DeDrEwZ1MBQ6wqPAIbJUv4aE=;
 b=zNdaKorSRksSI8g57UjTk729AwGEn0kiYiBx42FfySDiwXZKOA+3bqCfzs/z+UnfIUdLuy
 IGIAd8zshiM1jDHti6TyzNpZ6DkO1FvFt34/DiXmEJlCgIBAQNXX7TreOFHga4VJwEv+cs
 y4yl4/Y1HsbP6FQZwxyBEx4ZPsTGvWpYeD6n2KOj8SH38peQyP32gdnLtSd7ThobGVJ/TL
 JRDQwrJEthx/9PGE9GqKFBshFWu60CJopCaO0wE3CWeEoYvippdvrpndYUbTtVutXDdE3w
 5j+IA9CXCdW3vhCavocXifMgzHFaerJ+QmlPBNocLwGPiQgAYZsClYcpb7tvMg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=zNdaKorS
Subject: Re: [Buildroot] [PATCH 1/1] package/atf: fix build with newer gcc
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

On Sat, 22 Nov 2025 23:53:14 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> diff --git a/package/atf/0001-atf-check.cpp-include-time.h.patch b/package/atf/0001-atf-check.cpp-include-time.h.patch
> new file mode 100644
> index 0000000000..9207602382
> --- /dev/null
> +++ b/package/atf/0001-atf-check.cpp-include-time.h.patch
> @@ -0,0 +1,33 @@
> +From 67e7d350a15aff88c151b1fc838dac83d35be955 Mon Sep 17 00:00:00 2001
> +From: Bernd Kuhls <bernd@kuhls.net>
> +Date: Sat, 22 Nov 2025 23:47:41 +0100
> +Subject: [PATCH] atf-check.cpp: include time.h
> +
> +Fixes build error with gcc 14 as reported by the buildroot autobuilders:
> +https://autobuild.buildroot.net/results/41b/41b25ee8e66e34323eca011e4b5fe479ece9ed76/build-end.log

Do you have a minimal reproducer, preferably with an external
toolchain? I built atf successfully with gcc 14.x uClibc and glibc
toolchains (Bootlin toolchains). The file atf-check.cpp was built
successfully, so I'm curious to understand what makes a difference.

Thanks,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

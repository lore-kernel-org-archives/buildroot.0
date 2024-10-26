Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F9A9D10BFA
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 14:08:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27E12605F7;
	Sat, 26 Oct 2024 14:08:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0vXWx7KlFEyu; Sat, 26 Oct 2024 14:07:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EC516061C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EC516061C;
	Sat, 26 Oct 2024 14:07:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0455C5C24
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D5DA34018E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:07:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z_X7scMbmSNR for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 14:07:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7FF70400D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7FF70400D7
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7FF70400D7
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:07:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2334CE0002;
 Sat, 26 Oct 2024 14:07:52 +0000 (UTC)
Date: Sat, 26 Oct 2024 16:07:51 +0200
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Cc: Christian Stewart <christian@aperture.us>, Bernd Kuhls
 <bernd@kuhls.net>, "Yann E . MORIN" <yann.morin.1998@free.fr>
Message-ID: <20241026160751.733cd748@windsurf>
In-Reply-To: <20241026055003.69253-1-christian@aperture.us>
References: <20241026055003.69253-1-christian@aperture.us>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729951673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SMEZ0iEUUiu7Y0RLLdygcivspGQPkLXKUAvip3M9bz4=;
 b=FWUHhuaUX4FihAb97HsrayFzL9eBsT4TVOEDwU5InPAiKR7qAITYMnvNqMD2kbbLYIQCI7
 efMhElRMQPAh8vpNkXAaTG/xi8pt3k06ZTkl1zE2XMw74IZqDbjQU4qlgen4AOUzB2Kz+B
 qK6wokMIjduaURvzMlOPd0iP4YE7ojTUUBnrjXfrWxonRu6ulfvbdz7aWNAKyOzX6YperQ
 9qOMXg3v/JB0nyiThtEVj0sYGtt8IIFLcM9QZKkSs3SVez6weYeUeRacnA324GXIgtclF3
 jccQpDxKWiUHi/AdqvbSvr4qM/AaJ5llNGPKPmCHvQ0ZwDX6jbqkODoLw9eCIQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FWUHhuaU
Subject: Re: [Buildroot] [PATCH v1 1/1] package/linux-firmware: fix missing
 rtl8723 bins
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

On Fri, 25 Oct 2024 22:50:03 -0700
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> Fix a build failure due to these changes:
> 
> Commit 2bb8fb26599302c9cbc69a5aff329a8559c91e48:
> rename rtl8723bs_config-OBDA8723.bin -> rtl_bt/rtl8723bs_config.bin
> 
> Commit 5a017996c6de64ebd7f7c60e1233a45ba04086ca:
> remove rtl_bt/rtl8723d_config.bin
> 
> https://lists.buildroot.org/pipermail/buildroot/2024-October/765934.html
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>
> ---
>  package/linux-firmware/linux-firmware.mk | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Thanks, I have applied, but two things were missing from your commit
log:

1. Important: you did not specify which Buildroot commit introduced the
issue. You mentioned upstream commits (good!), but we also need to know
which Buildroot commit did the linux-firmware bump that introduced the
issue, so that we know if we should backport your fix to a stable
branch or not.

2. Less important, but nice: you did not add a reference to the
autobuilder failures being fixed.

I've fixed both issues when applying. Again: thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

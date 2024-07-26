Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81228C3DA49
	for <buildroot@archiver.kernel.org>; Fri, 26 Jul 2024 07:19:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D9D0407AA;
	Fri, 26 Jul 2024 07:19:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UpYjt4DiyPhs; Fri, 26 Jul 2024 07:19:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E3014086C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E3014086C;
	Fri, 26 Jul 2024 07:19:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C4EC51BF311
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 07:19:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B2A3440150
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 07:19:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CqUbVhtMmpg6 for <buildroot@lists.busybox.net>;
 Fri, 26 Jul 2024 07:19:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 43F7840018
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43F7840018
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 43F7840018
 for <buildroot@buildroot.org>; Fri, 26 Jul 2024 07:19:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 74A9F1BF208;
 Fri, 26 Jul 2024 07:19:24 +0000 (UTC)
Date: Fri, 26 Jul 2024 09:19:23 +0200
To: Martin Wetterwald <martin@wetterwald.eu>
Message-ID: <20240726091923.12123d17@windsurf>
In-Reply-To: <20240725173709.1087549-1-martin@wetterwald.eu>
References: <20240725173709.1087549-1-martin@wetterwald.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721978364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lNgCLk3NAov3AV2z1yNWo2ZPDcCe73e2ypoENeOyFoY=;
 b=SM10c1uM2yEAymP9GZoUhGHI+s8g/mFB7vETGXLOurnan6E6XjJ77krTBX23sAYygd93BF
 oxdcCQ4R3fU5EtVbAixIM6rfsRV5GWzTXH5tYPpXpf6BD1Uron58oB72sjofaF+OGBFnfH
 pHa7RlaFCdm1+3QcTZF7w5/9tTaQo8tg+uRHDA3WBxkraxKz06qaB8SXKq9PKmEUlyFZFh
 wVhYXvrs/TY/yDX7XtkNsCkgjv7ubbWbn1KX2RGsH/KaxN8zkaBy8Sd2+52Ypemj70QmIm
 VHl9oqyqHefLN9cVIDwu5PTR3fXUKkd8TKVFeI2t+rUi4NzUzL1SAIHVyvN8Uw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SM10c1uM
Subject: Re: [Buildroot] [PATCH 1/1] package/tinysshd: Fix static-only build
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: Vadim Kochan <vadim4j@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Martin,

On Thu, 25 Jul 2024 19:37:09 +0200
Martin Wetterwald <martin@wetterwald.eu> wrote:

> When using BR2_STATIC_LIBS=y, tinysshd's build was successful, but the
> binary didn't work on the final target: this is because a dynamically
> linked ELF was produced, on a target having no dynamic loader at all.
> 
> Using $(TARGET_CONFIGURE_OPTS) propagates all the options and not only
> "CC", resulting in a correct static binary able to run on the target.
> 
> Without the patch:
> 
> > tinysshd: ELF 32-bit LSB executable, ARM, EABI5 version 1 (SYSV),
> > dynamically linked, interpreter /lib/ld-musl-armhf.so.1, stripped  
> 
> With the patch:
> 
> > tinysshd: ELF 32-bit LSB executable, ARM, EABI5 version 1 (SYSV),
> > statically linked, stripped  
> 
> Signed-off-by: Martin Wetterwald <martin@wetterwald.eu>
> ---
>  package/tinyssh/tinyssh.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks for your contribution, I've applied your patch, after fixing
some small details:

- package/tinyssh instead of package/tinysshd as the commit prefix.
  Indeed, the package name is tinyssh, not tinyssd

- remove the capital letter in "Fix", as we try to have consistency
  between our commit titles, and the vast majority of them don't
  capitalize the first word

- add a "Fixes:" tag that points to which commit is being fixed by your
  change, so that we know if your fix needs to be backported to our LTS
  branch or not

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

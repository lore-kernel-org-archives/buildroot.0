Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C61E7718B
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 20:04:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1BA3808A0;
	Sun, 29 Dec 2024 20:04:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4x09ea3BNECB; Sun, 29 Dec 2024 20:03:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4F1E80CE4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4F1E80CE4;
	Sun, 29 Dec 2024 20:03:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E7C7C8
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 20:03:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 382EF4012F
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 20:03:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UZ5x3Wq32CwL for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 20:03:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D865C401B2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D865C401B2
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D865C401B2
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 20:03:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6ECFE40005;
 Sun, 29 Dec 2024 20:03:53 +0000 (UTC)
Date: Sun, 29 Dec 2024 21:03:52 +0100
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20241229210352.684be2d5@windsurf>
In-Reply-To: <4ec6a821a844d53ce68489983d4e4068@free.fr>
References: <20241229093332.334759-1-thomas.petazzoni@bootlin.com>
 <4ec6a821a844d53ce68489983d4e4068@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735502634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J+JCXY5FC8tIM7UlxQ4EzG886MPJUPcHcLM5DIYHMk4=;
 b=crhOHElQJUG7pslxScWxXt9DiC4j3iGJJ1in6o0L5mmNbq6HSSzfbprBW5n4CLpGF3MT48
 xHdNYmx+Csij7ZaEnO4t6gMoZvtOzF907A0RNiM5Rb084LXxFOwaVIyrDDlFLCW3iQbp8O
 8vRQ1Q/VXqY2XJFIIX01ehe+jmEtVoxaqTALFLkUGNa3akP53JoAsaenVAALEPfc1My4oK
 mzfcAjLzVJxOBk0/b3e8MwQdaq7DaxvhPhnX5c/aTyjEqQuH93Ar4dvadzV94cdQJNiR0B
 WAAE55Si4ymy3kNbdGsDHRxCINoHWl+cdxSiauyA6xg+PDtASuuflKfPbiughQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=crhOHElQ
Subject: Re: [Buildroot] [PATCH] linux: select
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL when needed
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Julien,

+Peter in Cc.

On Sun, 29 Dec 2024 15:41:52 +0100
Julien Olivain <ju.o@free.fr> wrote:

> While reviewing, I quickly tested with:
> 
>      cat <<EOF >.config
>      BR2_x86_64=y
>      BR2_LINUX_KERNEL=y
>      BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>      BR2_TOOLCHAIN_EXTERNAL=y
>      EOF
>      make olddefconfig
>      make
> 
> It failed with output:
> 
>      In file included from 
> /buildroot/output/build/linux-6.12.5/tools/objtool/include/objtool/objtool.h:13,
>                       from weak.c:10:
>      
> /buildroot/output/build/linux-6.12.5/tools/objtool/include/objtool/elf.h:10:10: 
> fatal error: gelf.h: No such file or directory
> 
> This hints to a missing BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y.

Indeed.

> Do you think we will need the same logic for other
> BR2_LINUX_KERNEL_NEEDS_HOST_* configs? It is likely that autobuilder
> will catch this kind of failures.

Yes that would be the idea.

> I was wondering if this logic will not become a bit complicated over
> time (e.g. BR2_LINUX_KERNEL_NEEDS_HOST_PYTHON3 for aarch64, ...).
> What do you think?
> 
> If you think this is OK, I'll apply this patch as is and we'll
> update those conditions in future commits, when needed.

I am not sure myself what is the right solution here. I'm trying to
avoid recurring autobuilder failures. I discussed this topic some time
ago with Peter. My idea was to do tweaks in utils/genrandconfig, but
Peter was on the opinion that we should deal with those issues directly
in the linux package, so that it doesn't just benefit the autobuilders,
but also our users.

Clearly, it's going to be a cat-and-mouse game: we discover issues in
the autobuilders and address them. This is for example the case for the
x86-64 situation you reported. But for example, I only took care of the
"latest kernel version" case, but we might have similar issues for the
CIP versions as well. My idea was to simply deal with those
progressively, improving the logic as we discover new cases.

Note that I am not 100% sure of what the best approach is. Maybe it's
one of those cases where we simply to try one approach, and decide
later if it was the right approach or not?

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D357C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 14:53:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 010C0405E5;
	Fri, 12 Jul 2024 14:53:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WwELumnN4RwL; Fri, 12 Jul 2024 14:53:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD73D419A5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD73D419A5;
	Fri, 12 Jul 2024 14:53:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 657781BF424
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 14:53:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 523E64043E
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 14:53:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N_RH3NBQ3O7Y for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 14:53:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BC12440185
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC12440185
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BC12440185
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 14:52:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 974C0FF802;
 Fri, 12 Jul 2024 14:52:56 +0000 (UTC)
Date: Fri, 12 Jul 2024 16:52:55 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240712165255.4671c621@windsurf>
In-Reply-To: <20240705065121.3235358-1-dario.binacchi@amarulasolutions.com>
References: <20240705065121.3235358-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720795976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=szoTF9UcrDf0NTj44VCrRKsmErM4N+12jDnWEX7Kb0U=;
 b=VFMqcmYzwGMPRDn20XRvw/sewXOlQb+O0QLmJju4ja5D0b+xcu/ySogM/YJ6sqojPVStRp
 qBxS+Tgq6evpA4xHAb4fdz8Mr67bjGXEveh2zUZO9dd2LmslpGhWRjABR4Vlk8rcgmWEPF
 kqWAFP2icV35eK9HIWn8bfyp5MCnNGcRAKXzAjrSc9dw7aq2yVw3ku5SpSApcIJQq7wRvL
 st7Hx3GG56zVfFmybdkCaWZCsewign9k5gf9zI4+dcje1z3QqypVD96YUnXGO1S/Uhlr4z
 xIgizMlulC3rP4+lKtyi1iD7fiOa7rZ8DUIM7UJoBFJOAGJxf48T/wcU7UMraA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VFMqcmYz
Subject: Re: [Buildroot] [PATCH 1/1] package/pulseview: update the patches
 to be applied with fuzz 0
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
Cc: linux-amarula@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri,  5 Jul 2024 08:51:21 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
> fuzz factor to 0") reduced the fuzz factor.
> 
> Due to this change, pulseview fails to build with output:
> 
>     Applying 0001-Replace-obsolete-deprecated-Qt-methods.patch using patch:
>     patching file pv/util.cpp
>     Hunk #2 succeeded at 175 (offset 4 lines).
>     Hunk #3 succeeded at 285 (offset 4 lines).
>     patching file pv/util.hpp
>     Hunk #2 succeeded at 139 (offset 1 line).
>     patching file pv/views/trace/decodetrace.cpp
>     Hunk #1 FAILED at 103.
>     1 out of 1 hunk FAILED -- saving rejects to file pv/views/trace/decodetrace.cpp.rej
> 
>     Applying 0003-Support-glibmm-2.68.patch using patch:
>     patching file CMakeLists.txt
>     Hunk #3 FAILED at 231.
>     Hunk #4 FAILED at 492.
>     2 out of 4 hunks FAILED -- saving rejects to file CMakeLists.txt.rej
> 
> This commit refreshes the package patches on the current package version.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  .checkpackageignore                           |  1 -
>  ...place-obsolete-deprecated-Qt-methods.patch | 32 ++++++++++---------
>  .../pulseview/0003-Support-glibmm-2.68.patch  | 22 +++++++------
>  3 files changed, 29 insertions(+), 26 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

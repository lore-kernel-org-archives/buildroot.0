Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1601CC3DA4A
	for <buildroot@archiver.kernel.org>; Fri,  2 Aug 2024 17:11:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5C49820AE;
	Fri,  2 Aug 2024 17:11:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oL6lVCUkwxHh; Fri,  2 Aug 2024 17:11:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE43082086
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE43082086;
	Fri,  2 Aug 2024 17:11:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CD9C61BF387
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 17:11:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B9FE8606A5
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 17:11:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SP4MsBRBUwde for <buildroot@lists.busybox.net>;
 Fri,  2 Aug 2024 17:10:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7BA5A6069E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BA5A6069E
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7BA5A6069E
 for <buildroot@buildroot.org>; Fri,  2 Aug 2024 17:10:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 92921240002;
 Fri,  2 Aug 2024 17:10:57 +0000 (UTC)
Date: Fri, 2 Aug 2024 19:10:56 +0200
To: Woodrow Douglass via buildroot <buildroot@buildroot.org>
Message-ID: <20240802191056.30ca5678@windsurf>
In-Reply-To: <20240722173136.412283-1-wdouglass@carnegierobotics.com>
References: <20240722181534.44a86e85@windsurf>
 <20240722173136.412283-1-wdouglass@carnegierobotics.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722618657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XX4NTgFsKZPG7wb3p9hihBoFyaIxSk/MyIOXqUBMAyc=;
 b=fwIW8wYo6zxmNMtTSRntlG0C/6pPvpufiqHzuoE/1iylpPaYDAkbPMoyVMXi1Yj14kj8P/
 q6xLwJXKoadh8WJV/9Rkz9LO8vuLFx6wHABbmsReH6Y1jgRrrkr4ByycNYQ7erdSS6h99X
 WhkUak1gBmg0Vutl1bX7/eBPwBeYSt1KCtWDOlpCLJlZb2moULlihVaB7KR4KiybTzSB40
 nh/fQn5Vn/zNAxJxXjkxuvsQ2mSr+AVK99FoWuwomiYkbgH7EEN6dFPziUxZnCR4c3AMJg
 WbiTJyRfxD+zi9PT2jXlSClJaIKSAn4BsCJXtUCttSVQq5ql1wyrPIf+ebXGVw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fwIW8wYo
Subject: Re: [Buildroot] [PATCH] package/chicken: move literals into text
 section for xtensa architecture
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
Cc: Woodrow Douglass <wdouglass@carnegierobotics.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Woodrow,

On Mon, 22 Jul 2024 13:31:36 -0400
Woodrow Douglass via buildroot <buildroot@buildroot.org> wrote:

> This solves a build problem -- by default xtensa-gcc puts literals in a
> different section of memory then the program text, and chicken is a very
> literal-heavy program, so they don't all fit there. This avoids that problem.
> 
> Signed-off-by: Woodrow Douglass <wdouglass@carnegierobotics.com>

Thanks, I have applied your patch, with a few fixes.

First, I've added a reference to an autobuilder failure fixed by this
patch, as follows:

"""
    Fixes:
    
      http://autobuild.buildroot.net/results/ce36170d67c4702f34bee025d8a46e5269c4573e/
  
"""

> -# If ARCH is not set, it attempts to autodiscover. But it is anyway not used.
> +#Chicken only uses the "arch" variable for some special-case compile arguments
> +#If it's empty, it tries to detect the arch host
> +#Filter out values that have an effect, or pass "unused" here

We always put a space after the # sign starting a comment.

> +ifeq ($(BR2_NORMALIZED_ARCH),"x86_64")

I've used $(NORMALIZED_ARCH) instead, which already has double quotes
stripped, so instead of "x86_64" we can use just x86_64.

> +CHICKEN_ARCH="x86-64"

Spaces around = sign, no double quotes around x86-64.

> +else ifeq ($(BR2_NORMALIZED_ARCH),"xtensa")
> +CHICKEN_ARCH="xtensa"
> +else
> +CHICKEN_ARCH="unused"
> +endif
> +
>  CHICKEN_MAKE_OPTS = \
> -	ARCH=unused \
> +	ARCH=$(CHICKEN_ARCH) \

and instead, used ARCH="$(CHICKEN_ARCH)" here

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

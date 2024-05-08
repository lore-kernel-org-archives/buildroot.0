Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C41BC19F4F
	for <buildroot@archiver.kernel.org>; Wed,  8 May 2024 16:32:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFA0C60D64;
	Wed,  8 May 2024 16:32:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wJKKVFb6tret; Wed,  8 May 2024 16:32:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7969760D65
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7969760D65;
	Wed,  8 May 2024 16:32:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BFE2A1BF2B0
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 16:32:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB7B640147
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 16:32:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NAObCLY5XNXw for <buildroot@lists.busybox.net>;
 Wed,  8 May 2024 16:32:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2487340125
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2487340125
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2487340125
 for <buildroot@buildroot.org>; Wed,  8 May 2024 16:32:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EF93F40009;
 Wed,  8 May 2024 16:31:58 +0000 (UTC)
Date: Wed, 8 May 2024 18:31:58 +0200
To: Jesse Van Gavere <jesseevg@gmail.com>
Message-ID: <20240508183158.69b99bd9@windsurf>
In-Reply-To: <20240508065039.6060-1-jesseevg@gmail.com>
References: <20240508065039.6060-1-jesseevg@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715185919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RgK2W8z9gCWWFlzngdTsLHMeI9dYnir9+AV0i9h5tr4=;
 b=nI6BHa+KsrBVJ+ynJSehVZELOzI/SEm/9mub2Gd9cFw9dEE1V7I5GgCLi4nSxcs6/j+h19
 T+40mt8ZBs3f+XbSIEy2SaD4sXAaBxARQ2marsKtTitAHEZkU2H74bv12UpMod+CC/eo/6
 3VeymO2382Zp1mzBnxUR5Q/hYSHfji8u57QwdwvWNZh9Gsk7DdpgVLn1bWqOpF4+6toGXB
 neuiLnloLlRe9Q+rfasPXg7zVrjhaYPd7UlX2DxZBmexlgou4qx29LR6i/1jzBxn26NJdj
 Rk1QqfmXt2e1nYWLggtn0liP0+J+ZbmKPr/GAUevouDqmwcAmtF6eQwPzBmMZg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nI6BHa+K
Subject: Re: [Buildroot] [PATCH v2] package/agentpp: bump to version 4.6.1
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  8 May 2024 08:50:39 +0200
Jesse Van Gavere <jesseevg@gmail.com> wrote:

> Bump to version 4.6.1 and drop the linking without v3 patch as this
> version integrates the fix for that
> 
> Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
> ---
> Changes from v1:
> - Drop accidental change in .packageignore, this was for the snmppp
>   version bump
> - Drop the patch, the failure mode here is not strictly related to the
>   use of debugprintf but rather that the buildroot build of snmppp
>   does not define __STRICT_ANSI__ but in my application using agentpp
>   I use Qt which does define this, this rippled through and causes a
>   mismatch between the function definition used in the buildroot build
>   and the function my application wants to use and link against

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

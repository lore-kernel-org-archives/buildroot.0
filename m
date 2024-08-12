Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37CB1C3DA7F
	for <buildroot@archiver.kernel.org>; Mon, 12 Aug 2024 20:52:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F20E680DA0;
	Mon, 12 Aug 2024 20:52:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UlFcvluBujNj; Mon, 12 Aug 2024 20:52:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D6B181426
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D6B181426;
	Mon, 12 Aug 2024 20:52:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 86D611BF344
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 20:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 71708811AF
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 20:52:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wbPohKB2Wrhn for <buildroot@lists.busybox.net>;
 Mon, 12 Aug 2024 20:52:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CE86580C77
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE86580C77
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CE86580C77
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 20:52:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 20F2C1BF207;
 Mon, 12 Aug 2024 20:52:13 +0000 (UTC)
Date: Mon, 12 Aug 2024 22:52:12 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240812225212.4c2bee04@windsurf>
In-Reply-To: <ZrcFOqAT600add79@waldemar-brodkorb.de>
References: <ZrcFOqAT600add79@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723495933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ABGoNME0mt22GPUFFxS4x3Zl1wyp8bY2nuIy+PWOBTI=;
 b=AyHjwm33hRd6Ndxs1vwd6Syo4E2lSnuDetJtLRK6iJxiI9bprseLE3cwwwCQcxyhvuxFKC
 SsXa8XKa41gysuM6+yVbvjilgAffXG+bc1ZNuozoom+rmRJXhZVSow25EAzV4vUX3Qg80V
 Lgd6O7eAxlQgCwhrfZUWtpED5Kl3QoAOUaHlCiSJRcUm/3R0moQCjNQBq6PwdVqdui8jKr
 YLaru+ayxvOJjXN5uzxcqicsq2wEriAYSn0NsMKqFjUG+ck1FaUVGRu5lPoJImBW9kkMei
 W2metn5a/fTXhLVCvpOx3ikIbkgZRZKyEtCDizTN7CChg2rewDk7kqRlwQraNg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AyHjwm33
Subject: Re: [Buildroot] [PATCH] package/atop: update to 2.11.0
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Waldemar,

On Sat, 10 Aug 2024 08:14:18 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> +ATOP_MAKE_FLAGS = PKG_CONFIG=$(PKG_CONFIG_HOST_BINARY)

Instead of this, could you try to change ATOP_BUILD_CMDS as such:

	$(TARGET_MAKE_ENV) $(MAKE) ...

this should allow the Makefile to find our pkg-config correctly.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

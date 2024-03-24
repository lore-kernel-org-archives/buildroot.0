Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3CB9C47DD9
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 16:46:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5AAEA403A2;
	Sun, 24 Mar 2024 16:46:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K8OTjEdWhIDz; Sun, 24 Mar 2024 16:46:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6691540469
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6691540469;
	Sun, 24 Mar 2024 16:46:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B31471BF4D6
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 16:46:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A033840469
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 16:46:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aC5SFereDC8P for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 16:46:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4D748403A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D748403A2
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4D748403A2
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 16:46:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4D9BF60002;
 Sun, 24 Mar 2024 16:46:49 +0000 (UTC)
Date: Sun, 24 Mar 2024 17:46:48 +0100
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20240324174648.02bdf400@windsurf>
In-Reply-To: <7b0c2b66-38d2-4853-8438-2671006a91a1@mind.be>
References: <20240320221352.13766-1-fontaine.fabrice@gmail.com>
 <7b0c2b66-38d2-4853-8438-2671006a91a1@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1711298809;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UawY0RO96Y1j0Ak57m62QlmeZ0NEaPlezBrQzAA5nhM=;
 b=YJ77bHTMuSj8ox999CHhncQlYxIANyXpnsS+eANaNiC3nhBq4DGkEjfX1xtcSJtuAN+SgW
 mW9T9UCbgaJ2wtICh/xvOyRjA3eOLor4tKZ3Apd0peIrCQ4vjMFMhxxk95IyRpOg3O5Q7C
 syRqFunGsXcQAYnMBKTWRCCJFEp4Nt3Px1CP1ucbKjXE9x1kvjLitBI3hVglnOX+V1wgVl
 8LqfhurS/B+fR6W4LFinnun6gYg8AqYC0FZ6QKKA+BJoY/Xb72CMl4aDNDN14YRs5IHrHe
 +B324zNyrUrJ7HVB+2WOCjTVpA9fsS1tnDco81sErYSULPEIBDiiprW8+DpOUg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YJ77bHTM
Subject: Re: [Buildroot] [PATCH 1/1] package/zlib-ng: disable riscv with
 uclibc
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 24 Mar 2024 17:33:04 +0100
Arnout Vandecappelle <arnout@mind.be> wrote:

>   I believe we generally don't fix issues in packages if the issue is actually 
> in the libc itself. This does mean we will have build failures for older 
> prebuilt external toolchains, but those we should fix using the exclusions in 
> genrandconfig.
> 
>   I'm putting the other maintainers in Cc to check if they agree with my assessment.

I agree with your assessment. If Bootlin toolchains need to be rebuilt,
let me know, and I will be happy to rebuild them.

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

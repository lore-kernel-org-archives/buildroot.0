Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5591DCD1288
	for <buildroot@archiver.kernel.org>; Sun, 31 Mar 2024 07:26:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF95A400AB;
	Sun, 31 Mar 2024 07:26:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EjkxyP7qE0YZ; Sun, 31 Mar 2024 07:26:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C764940166
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C764940166;
	Sun, 31 Mar 2024 07:26:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 08A0A1BF28D
 for <buildroot@lists.busybox.net>; Sun, 31 Mar 2024 07:26:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0210F81ABB
 for <buildroot@lists.busybox.net>; Sun, 31 Mar 2024 07:26:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hSJrOGROd3FC for <buildroot@lists.busybox.net>;
 Sun, 31 Mar 2024 07:26:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9FDF381AAB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FDF381AAB
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9FDF381AAB
 for <buildroot@busybox.net>; Sun, 31 Mar 2024 07:26:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DFE7EFF802;
 Sun, 31 Mar 2024 07:26:00 +0000 (UTC)
Date: Sun, 31 Mar 2024 09:26:00 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20240331092600.0eca553b@windsurf>
In-Reply-To: <ZgccX_OQrsUXyfIO@landeda>
References: <20240307165218.10027-1-ps.report@gmx.net>
 <CADvTj4obpt2KevT7pCZ6j=VdOefb8x-iU_-NLRJOVz_MS0Ng1A@mail.gmail.com>
 <ZgccX_OQrsUXyfIO@landeda>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1711869961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hjbnhfN13xaKYBa83ttVJN6e8yLJh7dMXHTHI0K94Nw=;
 b=b+YpY9kqmpcGQoxfqaDPboysq4Rz1Gf+nXzeOMKyJl+EFvtOHmI3GI/3oBAQrtKKH8ayCI
 9tmLgGR5JdFdgAah9ULzV2FcpWdEQrScQrA+lfQwd5pvCWGksnsU1LTQQ7B0SRJ37pX8NU
 KfJZHBp2k6qZUEX3trpPy+5Rem/bzS4F+6YPa0z2lHpWD5xhY1L+iGkWuZZvxLHC3nfV+8
 MVHyb5pBWoqvz5bnNFxc1nM/g95neoGV4Mhj4yHa3sa0jbf+OKyfV+HJZF0uZC2bj3yK9P
 hJQ5Ym+Y7iFJhl1+xYoD1c4a0E9uXoiOjBJQ8/clxIjoq63n2Rvdo88WBM5/Ag==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=b+YpY9kq
Subject: Re: [Buildroot] [PATCH v1 1/4] package/xz: bump version to 5.6.0
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
Cc: buildroot@busybox.net, James Hilliard <james.hilliard1@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>, Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Fri, 29 Mar 2024 20:54:07 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> On 2024-03-29 11:21 -0600, James Hilliard spake thusly:
> [--SNIP--]
> >     -XZ_VERSION = 5.4.6
> >     +XZ_VERSION = 5.6.0
> > Is this version backdoored?
> > [17]https://www.openwall.com/lists/oss-security/2024/03/29/4  
> 
> Wahoo. Just, wahoo... thanks for pointing this out, I've marked the
> series rejected.
> 
> I've been reading on this story, and it is just, well, I don't have
> words. I'm stomached.

The story is indeed crazy. For once, the fact that we are somewhat slow
at merging patches ensured this didn't get applied before the backdoor
was discovered :-)

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

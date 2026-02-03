Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D441E87829
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 13:50:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FBD4812C4;
	Tue,  3 Feb 2026 13:50:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e-tso1WICh8L; Tue,  3 Feb 2026 13:50:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A44C812C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770126611;
	bh=L2A8IPkOb1HRM46wZlDEkekqSJx1QpZ2ur23IsrTZ2A=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pBJO+uBh+Ns7wjAzmg4KyRe+Nn08D1o4u86Rlj1ewOtZuJcnLzcrZby7PYUKgOATf
	 23i9WXxX7kE9fb0uSamuMYWIn7VYKcUkNiBfq1+OfOEitRqs9mtCOWHKi03oZAZmyf
	 Zx+ljkFlIUFy82ASYXyyzddxR8tOP3MigDiQx5omUxtHFoGSdnDXxJvryelt8ghht8
	 K8dIkf1TjWbMXVppHW2Vx/1Ev+GRsjmPj6ZCqqZJJqa/txmzgH6L8nRX3tZcens7tV
	 WQMlDQzHd1Z3y3qDFdfQCEqV68wnL9RWO37EBHZ+DCkfUT7TEjt1WcQU+cahXRpFpl
	 8wFnv8r5Icchg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A44C812C6;
	Tue,  3 Feb 2026 13:50:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9FFD613D
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 13:50:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A980812C6
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 13:50:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OhCBluSTApVG for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 13:50:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 15671812C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15671812C4
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 15671812C4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 13:50:08 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 43907C211C9
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 13:50:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0F4EC60728;
 Tue,  3 Feb 2026 13:50:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 18FC1119A8891; Tue,  3 Feb 2026 14:50:04 +0100 (CET)
Date: Tue, 3 Feb 2026 14:50:03 +0100
To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>
Message-ID: <aYH8O522wgwXYglG@windsurf>
References: <20250808133112.3212687-1-elmehdi.younes@smile.fr>
 <20250808133112.3212687-5-elmehdi.younes@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250808133112.3212687-5-elmehdi.younes@smile.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770126605; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=pVyGLBqyuK9/mv1AhjcBHxDBxhaZmwfMd1P58vE4aZo=;
 b=bWw82hvgJxnXdynGp77j+XYstPUuOAMSLVNPjmtlrRpOddlQNf57qTXm+cX+HKJIlLb/sr
 +NokG20PUZl/9N5wE3yx7a7tGtX71wv92/03APGTIAbAX2s7rbeR8pw1DoEeduzrz9lgt3
 Cnhf7dq4PyOrs+1AxNUK6khlhx3yW7TEkhLxvPf8ZfiyR5yiAlutf8XqXX/XLQ7qz4NwCt
 P2BYwm1spqkO6jHBBJ0tlGM78NmP+n/W6N8w21cx8haN48dMAdONZU1Q+Px3Yof3HWemdg
 btzUsikjGU8hidlOgvurB81W+qIVWXAST4KbegtcKxHWXAJGggAcnKNYIBz/Hg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=bWw82hvg
Subject: Re: [Buildroot] [RFC PATCH 4/5] linux: split HOSTCC from flags
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

Hello Mehdi,

Thanks for your patch!

On Fri, Aug 08, 2025 at 03:31:11PM +0200, El Mehdi YOUNES via buildroot wrote:

> Since Linux v4.19, Kbuild provides explicit variables for host flags, so splitting
> compiler vs flags is supported upstream (see:
>   https://github.com/torvalds/linux/commit/96f14fe738b69dd97a33efe3cc8ab330af5fd1f1
>   https://github.com/torvalds/linux/commit/b90a368000abe5e015e0b045ca2ff7c2173b94c0
>   https://github.com/torvalds/linux/commit/f92d19e0ef9bbbb2984845682e740934ad45473b).
> 
> But with this change we can have problems with older kernel versions
> (< 4.19), as the Buildroot commit below warned when avoiding HOSTCFLAGS
> to not override internal kernel flags:
>   https://gitlab.com/buildroot.org/buildroot/-/commit/dde090c299b0357fdb1a4ec44ad8d332ac57f65e

Since your change as-is would break Linux < 4.19, here is the
suggestion that we have after discussing at the Buildroot Developers
Meeting: make things condition based on
BR2_LINUX_KERNEL_RUST_SUPPORT. Something along the lines of:

ifeq ($(BR2_LINUX_KERNEL_RUST_SUPPORT),y)
LINUX_MAKE_FLAGS += \
	HOSTCC="$(HOSTCC)" \
	HOSTCFLAGS="$(subst -I/,-isystem /,$(subst -I /,-isystem /,$(HOST_CFLAGS)))" \
	HOSTLDFLAGS="$(HOST_LDFLAGS)"
else
LINUX_MAKE_FLAGS += \
	HOSTCC="$(HOSTCC) $(subst -I/,-isystem /,$(subst -I /,-isystem /,$(HOST_CFLAGS))) $(HOST_LDFLAGS)"
endif

Of course, if someone enables BR2_LINUX_KERNEL_RUST_SUPPORT with a
kernel < 4.19 it would fail to build, but that's acceptable as it's
stupid to do this since Linux 4.19 did not have any Rust support.

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

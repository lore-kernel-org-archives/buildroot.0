Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD3EE87835
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 14:08:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A142812BB;
	Tue,  3 Feb 2026 14:08:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HafDeABOoi9h; Tue,  3 Feb 2026 14:08:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73AD7812E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770127708;
	bh=TOAByiGg15c4p+HHiX0Zj7AJFHziuLS1CuV6042L694=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kUGvE51jcSyjtlg/rYdF2isgZRPxuCBHssHbVOrbenmCSu844jcHujhse35qmCOWf
	 Z5k5vdtmyG++81batynPGMA0mqa5z6HJEagno9sFKxT9KfrhmulQQoXU8z9X01kGrv
	 LmbWwNkG/mUbbgSlO5EUZ4xeHERPJQrK07f12+OjcXhvwzUkP6yNfCbHNheZMv0hSc
	 bQLKYJ4B7JD2rN0HJoqfc4ZJohOC5wYiCXwUknSu7J7T4BqUXk8jzMVzOz72w3I8u/
	 40PMmTvFOEm5BW7yTUu8cIc4TtOCBGdgThQPYLUYQpPnh7NmeKCmvEwKay3S2CxtGZ
	 nKvSHhuTmlKSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73AD7812E8;
	Tue,  3 Feb 2026 14:08:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 98322F4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:08:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 84445812E8
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:08:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oCN19a1rTlXz for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 14:08:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A2C93812BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2C93812BB
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A2C93812BB
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:08:24 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id EA0FEC1F1DF;
 Tue,  3 Feb 2026 14:08:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B5D4C60728;
 Tue,  3 Feb 2026 14:08:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BAD09119A8888; Tue,  3 Feb 2026 15:08:18 +0100 (CET)
Date: Tue, 3 Feb 2026 15:08:17 +0100
To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>
Message-ID: <aYH9Ids-J7BuJl0u@windsurf>
References: <20250808133112.3212687-1-elmehdi.younes@smile.fr>
 <20250808133112.3212687-6-elmehdi.younes@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250808133112.3212687-6-elmehdi.younes@smile.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770127701; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=ojCbmJzaMwyM5esN5kWgJR2P4OTcpqpNIT9GMMrvoSM=;
 b=N14MhGPltW3ZpVnrWaZ9IU8Nr2NXtbYMOyR61ICIo60IL5Qf+idcH8E8fjzb7UDsZePAmk
 eztQTgDLof9neNUEckD49jOw2q7+XMIhuzOskk5eu5yovi0PgZv4OcbxAsnVVQbkaoPpo6
 jG6Fr55GcF57sY1eM7VctnkqW/95qSf8wiMv6wPEzBCBsei48VkQb1Bmp0dNmE8PhVnd1a
 7oF8MLzqrF/bQQx+X6RnElEz6xubDBkbgZe4SYe9c5btvEywapZMl2z7zAYe2/Dsqcw8xJ
 jCHcSH/sMveKn0CTUmwv1OHkXDgPmBeRoPS0uEacnI3Gdy4hIIOXnmaH2+2HdQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=N14MhGPl
Subject: Re: [Buildroot] [RFC PATCH 5/5] linux: Add Rust support
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

On Fri, Aug 08, 2025 at 03:31:12PM +0200, El Mehdi YOUNES via buildroot wrote:

> +ifeq ($(BR2_LINUX_KERNEL_RUST_SUPPORT),y)
> +LINUX_DEPENDENCIES += host-rustc host-rust-bindgen
> +LINUX_MAKE_FLAGS += \
> +	RUSTC=$(HOST_DIR)/bin/rustc \
> +	BINDGEN=$(HOST_DIR)/bin/bindgen \
> +	RUST_LIB_SRC=$(HOST_DIR)/lib/rustlib/src/rust/library \

You'll have to update this to $(HOST_DIR)/src/rust if that ends up
working (see our comments on PATCH 2/5).

Make sure to test this with both pre-compiled Rust compiler and
compiled-from-source Rust compiler.

And finally, we would like to have a test in support/testing/ to
verify that this continues to work. You don't need a test that boots
the kernel, but at least something that builds the kernel with Rust
support. Of course if there's some HW-agnostic kernel feature in Rust
that we can test in Qemu, it would be nice. Maybe binder? But I'm not
sure how to use it under a pure Linux system. But don't spend too much
time on this: a compile-time only test will be good enough.

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

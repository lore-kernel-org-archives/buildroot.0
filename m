Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 500A9E8783D
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 15:10:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0962B812A7;
	Tue,  3 Feb 2026 15:10:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mLLwqraFZ08L; Tue,  3 Feb 2026 15:10:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70AC7812B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770131401;
	bh=1oEtdk6I1O3FdEPrQ9J5B05Xfb9Zyl6Fdrpz9Eq1IKs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LhOwpT/ARVS4sRjEhlt9jPmygjK37/CLFcQpZwIjMHODiSB1MiDF9yv+/tXHmmLyE
	 B1GwQtgHhU65AV6CctbkSw0wcHDfVGGss/bnK7IJTxJOAwXiMrcz9wCDl0h2rahAM8
	 B9NvnI5Nk8wGIrdxTexiZy7UxFlOaXWOc1PF+oc8qoS2eoTmJsSnmlI+hIxkIVZfiY
	 jGh12E6nE2dinprvxRxQ7GbURuZWXU4T9ewz5qGtQVwIB0Klz2d9fHfSfOwioj3BY4
	 tP+mLE/cNsFQLf+B3P4zL/uGP4q+zK5NQNGwB59b2I/ZOwFUKG/lRXsJw0v87v2uVH
	 p0mb5l0y3eZ3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70AC7812B4;
	Tue,  3 Feb 2026 15:10:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 31FE7F5
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 15:10:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 129396070C
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 15:10:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PcemsJoTV6eb for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 15:09:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 176CB606D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 176CB606D3
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 176CB606D3
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 15:09:58 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 2358E1A2BB8;
 Tue,  3 Feb 2026 15:09:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E043A60728;
 Tue,  3 Feb 2026 15:09:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 981E2119A8888; Tue,  3 Feb 2026 16:09:53 +0100 (CET)
Date: Tue, 3 Feb 2026 16:09:52 +0100
To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>
Message-ID: <aYIPr4kkya9dylUr@windsurf>
References: <20250808133112.3212687-1-elmehdi.younes@smile.fr>
 <20250808133112.3212687-6-elmehdi.younes@smile.fr>
 <aYH9Ids-J7BuJl0u@windsurf>
 <16118340-95c2-4f82-bc60-e35622707e80@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <16118340-95c2-4f82-bc60-e35622707e80@smile.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770131395; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=M/gyFcmvqM6phFsA4TbQx35DRMTOh035VXdi5s9A2Lk=;
 b=P7zNt8AO8RvyRRAdjGq9Sf9CzPQqiPtMCXCpy4iE/o/WxJ7P7pHwBkWz0ioFPG32yMpsei
 530YC/I9M30XIwYE0LwCRRtDPfUmWVsB0Z26ChTkhbJhsnHUMJ/qLsHsgLX3Rl1RhhvOhB
 iC6U2EW3iBZdVLVUs73hDw66dLII6PK7eRNsz1VylEEDkKSzUvEWpmwdJfas1p/1uYLLOK
 Trv3A1b65fcvpTwsMTNBKhI/0Grckph2L8toVzz8HWhr8lxIPXGJGsoMdjKgD/EUJizFMJ
 lePHTp/yMk/EbZL8t2umf741+lDbGTsx3BHPEs2jNK9hZTPXKo9amx0MK/bk7w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=P7zNt8AO
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

Hello,

On Tue, Feb 03, 2026 at 03:34:48PM +0100, El Mehdi YOUNES wrote:

> Maybe we can add a runtime test using the rust_minimal sample.
> 
> https://github.com/torvalds/linux/blob/master/samples/rust/rust_minimal.rs
> 
> I have already tested it on Qemu, so I will try to add a runtime test using
> it.

Very good idea!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02360E87827
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 13:36:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACF6283C48;
	Tue,  3 Feb 2026 13:36:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fkL2bUft2a2r; Tue,  3 Feb 2026 13:36:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7A7283C4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770125765;
	bh=iD0ebgxlMVE/MYinMD/0/4r7elFd0l9OvTsiPxPE3IQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=C7d4dl7jPRXzMLdplcZUKWZjneXUEIWye+m6CpNRByO8YsTpy7laQKgPjU9aPj+Ia
	 cDPOBrUFEpUxgvc6/B6yKeQ4EFVZbJVEDKG7XBBC/1ewB+JQFoY95RWi72wMkZqJUQ
	 +2R1+BFm7qlQ7Eb6eWs1717C9pc/hZ2UCI30ukrMTlXzQg8Y8OTs9/rn9cyBasZxE6
	 3hZJmd8BtcvGTFIQcErhL40urZ0284kvCLa7ufWPLlw8MUP4N6xkOx6UJKhW+lPjn/
	 mKVTx+VI21FHRvpEXhFn3QsbP7CDoK3FhXCWm4BzRIrYjXFr9/WJ0nkWVHE299y0qG
	 hobnA2wC8d2wA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7A7283C4D;
	Tue,  3 Feb 2026 13:36:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E8C813D
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 13:36:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F27783C4D
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 13:36:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GOnbxA7bg5sF for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 13:36:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EC6B883C48
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC6B883C48
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EC6B883C48
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 13:36:02 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 8FD511A2B87;
 Tue,  3 Feb 2026 13:36:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 65B5460728;
 Tue,  3 Feb 2026 13:36:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 909DA119A8888; Tue,  3 Feb 2026 14:35:59 +0100 (CET)
Date: Tue, 3 Feb 2026 14:35:58 +0100
To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>
Message-ID: <aYH5jtksU7J7Z7sE@windsurf>
References: <20250808133112.3212687-1-elmehdi.younes@smile.fr>
 <20250808133112.3212687-4-elmehdi.younes@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250808133112.3212687-4-elmehdi.younes@smile.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770125760; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=igaQIMFWoEg61BsKtKC4MRkzzVUcXdcGfjfHg9/vuoA=;
 b=zBRAM4/dJPKr0gVdaEuIUwtXaJUJIFqj5/uiE68+fOEpjVxFaRDI5ltzkX40Xb/K72otDC
 ihfX3DHcj5YDtIMXS5VLxXdvgypxVd6ZaaYRBeksYUYVjs805bR8Gr1vYP/1ZzNIVmCy7v
 4Rw8MCHsFPwsUE2BWu8KsxaLFE+4ZVJZUX+xWHk1r6n5wtT6fDBxLhoUBkmCR1tpWxU0CB
 YF+GE/uwprRNORN1pLKIOCJ/wfdpIZPTqrkgu7JKxXR/Jtf19fHWJXAEVdgX2pq4Xjs+jC
 d6uTmEzLyYnJSBzIOAt5GQVc/iaRcUV42CXzK/TuVNHj6gLYJPeAQPD0cQfkog==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=zBRAM4/d
Subject: Re: [Buildroot] [RFC PATCH 3/5] package/rust-bin: install rustfmt
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

On Fri, Aug 08, 2025 at 03:31:10PM +0200, El Mehdi YOUNES via buildroot wrote:
> Rust-for-Linux expects rustfmt to be available; otherwise the kernel
> emits a "rustfmt not found" warning and the generated bindings are not
> correct. Provide rustfmt from rust-bin by adding it to the installed
> components.
> 
> Note: the dist tarball exposes the component as "rustfmt-preview"
> (as listed in 'components' file), so we use that name.
> 
> Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>

Thanks for the patch. Here as well, you not only have to adjust
package/rust-bin, but also package/rust, so that package/rust also
installs rustfmt.

Could you have a look into this, and send an updated version?

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

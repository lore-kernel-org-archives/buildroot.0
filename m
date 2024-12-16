Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9128E7717F
	for <buildroot@archiver.kernel.org>; Mon, 16 Dec 2024 22:10:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C0E04088D;
	Mon, 16 Dec 2024 22:10:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fs-pPn5zuOna; Mon, 16 Dec 2024 22:10:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25469407ED
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25469407ED;
	Mon, 16 Dec 2024 22:10:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 90C3AC5
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 22:10:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 71D88607A0
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 22:10:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 00ueaSKmXDDf for <buildroot@buildroot.org>;
 Mon, 16 Dec 2024 22:10:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5CD5F6059E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5CD5F6059E
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5CD5F6059E
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 22:10:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4AA2340004;
 Mon, 16 Dec 2024 22:10:12 +0000 (UTC)
Date: Mon, 16 Dec 2024 23:10:11 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: "Thomas Bonnefille" <thomas.bonnefille@bootlin.com>
Cc: <buildroot@buildroot.org>, =?UTF-8?B?TWlxdcOobA==?= Raynal
 <miquel.raynal@bootlin.com>
Message-ID: <20241216231011.39e908c6@windsurf>
In-Reply-To: <D6DFB2M8HLES.RY7H0ZIZNUBO@bootlin.com>
References: <20241216-fix_gcc14_libsha1-v2-1-ceb3588e6866@bootlin.com>
 <20241216213605.17b86ffb@windsurf>
 <D6DFB2M8HLES.RY7H0ZIZNUBO@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1734387012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6x0kPrfC33/NuoCwKXgAtwwt1XCyTLMkyx4AcOd1e0s=;
 b=G3CXkkU3EsrtmWST34tnZpJAG5zcjPgdA9y8eURxcL0HsKZK943tFN9fLDhfhzz+eLP4qr
 fPh8ko+GhlncmUJPHntQ5OxfdeXMJ8GprjP0up5DzXY4derAbO0MACfhTcXoFU/Je+ue79
 WgrfKqubCHha3+4zQVrzuzNJ2UcLHG/YzA6d3LPyXTDdk5KHmtlohsLl6nscHKA7aVuUJR
 3XI+zIZrXvpksA7TZl01hnnKQtnC9TbUPI41YIQuaJZHK56kI2dLclDlQaqzo5n4S+AEQB
 WLwRIUy/PkAUd9GBlPvInCVdEHyhR0IDXDeBWiKJOOQUZYNnsQp9l5xUFqM3HQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=G3CXkkU3
Subject: Re: [Buildroot] [PATCH v2] package/libsha1: Fix gcc14 compilation
 in libsha1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 16 Dec 2024 21:56:04 +0100
"Thomas Bonnefille" <thomas.bonnefille@bootlin.com> wrote:

> > But more importantly: https://github.com/pseiderer/libsha1/ isn't
> > "upstream". Upstream for this package is
> > https://github.com/dottedmag/libsha1. So we're interested in seeing
> > the change having been submitted or accepted by the real upstream, not
> > just a commit in some "random" Github repository (even though Peter
> > Seiderer is a well known Buildroot contributor!)  
> 
> Ok so a link to the pull-request is probably better here according to BR
> documentation.
> (https://github.com/dottedmag/libsha1/pull/1)

Yes, that's the reference we want indeed.

> However, in this case the PR may not be merged soon given the date of
> the last commit applied to the upstream package.

Gah, indeed. I tried quickly to find another "upstream", but there
doesn't seem to be an obvious upstream alternative. This package is
used by xwayland and xserver_xorg-server as a minimal alternative to a
full-blown crypto library like OpenSSL or libgcrypt.

I think for now, your change with Upstream:
https://github.com/dottedmag/libsha1/pull/1 is going to be good enough.
We can always separately decide if we want to drop this package
entirely.

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

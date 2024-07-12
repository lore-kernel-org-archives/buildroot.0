Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40D8DC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 21:20:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B3CD416DC;
	Fri, 12 Jul 2024 21:20:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bsk9c7PgjkK5; Fri, 12 Jul 2024 21:20:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9036141767
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9036141767;
	Fri, 12 Jul 2024 21:20:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B5A761BF3C4
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 21:20:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A30B9400B9
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 21:20:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YawNvfBVdlEO for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 21:20:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 71EA4400A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71EA4400A6
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 71EA4400A6
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 21:20:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9B2D11BF205;
 Fri, 12 Jul 2024 21:20:30 +0000 (UTC)
Date: Fri, 12 Jul 2024 23:20:29 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20240712232029.5576f152@windsurf>
In-Reply-To: <20240703104233.340464-1-giulio.benetti@benettiengineering.com>
References: <c6940b68-5fc2-4f4a-bccd-c654f510a3ce@mind.be>
 <20240703104233.340464-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720819231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/1RcN6W1O2t+FlSTbQOl5sVHTXKGQUcyX5zuTncRfxA=;
 b=kQupAM8XNf/HAt91U+jjc2zcXcCT8X57BLdxc53T8dtAMfg6OUgSsbj+YrKTpATFQ9xFt3
 0s/OwNfcr7xH+bAvKVhs9c+KsSUCstInK2WxNyCQbxgqeWp8OJAEeLP+Xn4d4eycOKFprn
 alXiFVeGtGNThYHUtUlxzxlgcnruQlloeL0b0aNr+gRh2U7fWJ8Wp24kotR5gkh/9VPKCy
 QZpBNgXI5jGoyVHASII6yUOW0wYUo19CwdkN7I9vfx8PRvbtn74Ng2MkC6GKGYq1PQhNSb
 Rvv00wHbKWOLG0+qhEzK75dc5FZQn/DyFHNpf0LchTFEfDavPYpQC70ZTus00g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kQupAM8X
Subject: Re: [Buildroot] [PATCH v2] package/harfbuzz: bump to version 9.0.0
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

On Wed,  3 Jul 2024 12:42:33 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Since the major release changed all the packages that have direct
> dependency to harfbuzz have been succesfully built:
> - efl
> - libass
> - mupdf
> - pango
> - qt5base
> - qt5webengine
> - qt6base
> - sdl2_ttf
> - supertuxkart
> - vlc
> - webkitgtk
> - wpewebkit
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
> V1->V2:
> * fix patch to apply against master
> ---
>  package/harfbuzz/harfbuzz.hash | 2 +-
>  package/harfbuzz/harfbuzz.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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

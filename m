Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95775CD1292
	for <buildroot@archiver.kernel.org>; Mon,  8 Apr 2024 20:39:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6996340515;
	Mon,  8 Apr 2024 20:39:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ngnLsTbWFVye; Mon,  8 Apr 2024 20:39:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78E604117C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 78E604117C;
	Mon,  8 Apr 2024 20:39:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4347B1BF2A7
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 20:38:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3089140CA1
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 20:38:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h42NMnIcRzEg for <buildroot@lists.busybox.net>;
 Mon,  8 Apr 2024 20:38:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0B34541452
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B34541452
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0B34541452
 for <buildroot@buildroot.org>; Mon,  8 Apr 2024 20:38:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0061FE0004;
 Mon,  8 Apr 2024 20:38:52 +0000 (UTC)
Date: Mon, 8 Apr 2024 22:38:52 +0200
To: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Message-ID: <20240408223852.17afec40@windsurf>
In-Reply-To: <20240403102412.75886-1-buildroot@heine.tech>
References: <20240403102412.75886-1-buildroot@heine.tech>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712608733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hjIu/2oMh3kdybaQurY2wUhAvd2G2eV5zkqdxfWe9sw=;
 b=fE/IBHqbe1JZ6LYLCzilfa1HwzybWRP74gRc2iqEr4/ceXv8oEWfKI6TMsb4neHc3Vqvji
 q/asMsoeXKGl+ymXnmtbe9I3cJjDxe28quBceiBU/gvph57+Y7EYU2IfNv65rvWWOsnjsq
 ebvvSivJE02vSShEl1AwY+lxEokTg/dVgz4/EWxGDd+yPZoAKKkD/R1ffXkVPke2sPPeAu
 gVnOXYldFuXNv32dBPPWn/Cv9yh3/TqBG09YQrgj+3kkEQQdGVax+xSjcQRoPTGw1ByVI3
 QHEenFGUikPiaIXGwQxNrg0078AnNjq2DG7MUZm8RzLV8jxFIeolQxS8390iqQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fE/IBHqb
Subject: Re: [Buildroot] [PATCH] package/catch2: bump to version 3.5.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  3 Apr 2024 12:24:11 +0200
Michael Nosthoff via buildroot <buildroot@buildroot.org> wrote:

> ---
>  package/catch2/catch2.hash | 2 +-
>  package/catch2/catch2.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Thanks a lot, but we need your patches to have a Signed-off-by line to
be applicable. Could you resend an updated version?

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

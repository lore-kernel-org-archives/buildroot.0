Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60ABACD3440
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 21:10:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29ACD401E4;
	Tue,  3 Sep 2024 21:10:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tXDO-RGjdHns; Tue,  3 Sep 2024 21:10:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDEA140267
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDEA140267;
	Tue,  3 Sep 2024 21:10:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0A7051BF48B
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 21:10:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0581C80AB3
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 21:10:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9ToSgeHE8yyr for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 21:10:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DF82680A63
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF82680A63
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DF82680A63
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 21:10:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7530D20002;
 Tue,  3 Sep 2024 21:10:25 +0000 (UTC)
Date: Tue, 3 Sep 2024 23:10:24 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240903231024.232300b8@windsurf>
In-Reply-To: <20240903155622.922284-1-dario.binacchi@amarulasolutions.com>
References: <20240903155622.922284-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1725397826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LPg7bo4+yF6M0b/y9LyvBVEYViTptoDzKmIOo2/siqM=;
 b=AjSJb/yzYQPhmRfc4dLWGb/BwmW9ZdW51a3qazb6XLfh0FZl+eTsHPOK6PH4XDxDVe+nXY
 qQFGWLw5ire2ZqEKZ8MBiIawzMKY5t8IikF7T4hRJ6wUrTOA322ICxsLaSmM899/D1QMAf
 4xaqni3kYyezf56azj923k+dL7/IUbZr8pLkCBJBdu5A5bYrvOdEmH+ccdOnFPkW8sT5ud
 ChMwUn+0h42NrgL1qYpU34Yr2dYLkssD5sZgfyHzN8q1zXMoU9C8qffM/fKh70i6ky4ent
 QFw0mNbyWpngiXfrVEW5SWdTOPRRMDcKdvlc4xUkasq7409f/FTstjm3UUXN7A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AjSJb/yz
Subject: Re: [Buildroot] [PATCH 1/1] package/cache-calibrator: fix build
 failure for implicit declaration
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
Cc: Stephan Hoffmann <sho@relinux.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  3 Sep 2024 17:56:21 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/db996c894c810ff5c7f4263975d1def0edef6d55
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  ...e-due-to-getpagesize-implicit-declar.patch | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 package/cache-calibrator/0002-Fix-build-failure-due-to-getpagesize-implicit-declar.patch

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

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1FE3C3DA4B
	for <buildroot@archiver.kernel.org>; Wed, 17 Jul 2024 08:56:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DCA0540A24;
	Wed, 17 Jul 2024 08:56:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F1NPQc8Dk7-t; Wed, 17 Jul 2024 08:56:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E944640DCE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E944640DCE;
	Wed, 17 Jul 2024 08:56:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 681FB1BF3A6
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 08:56:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5424240A6D
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 08:56:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LBNaIWG0m5ug for <buildroot@lists.busybox.net>;
 Wed, 17 Jul 2024 08:56:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2CE5540DCE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2CE5540DCE
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2CE5540DCE
 for <buildroot@buildroot.org>; Wed, 17 Jul 2024 08:56:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D7545240002;
 Wed, 17 Jul 2024 08:56:10 +0000 (UTC)
Date: Wed, 17 Jul 2024 10:56:09 +0200
To: Andreas Ziegler <br015@umbiko.net>
Message-ID: <20240717105609.028a10bf@windsurf>
In-Reply-To: <20240717072120.148120-1-br015@umbiko.net>
References: <20240717072120.148120-1-br015@umbiko.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721206571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dUH0kVi7SyiEhANCDpLVOZr719VLgNTNwZt++G3LUak=;
 b=pJp0QqmShEP9EtgIzeiIvatPQFYH3IDuOs0KHBEdWfOp+HNcb/uLQN6u8q0IZLeVGTkDRr
 Oq3vTXnlXiN/W7OLlWrvuNtsQDTydOpLOuQAtdDs7VCqHanR3Z4islw/jxyR4E961j32Ba
 G4lpk2trgPRmqFuNyN6bbYLDKIBIzUGBgCtQ5V1r+pXioPRIV+DqAKabwmHi4y5P41tRoS
 m+eO4ROOhLGGjQmG3gS/lf31zgfndqg0DFqst2yFeV+F3gDceNt/wQreQnNCtXpK+jQTje
 8fLSuQHoPrwEzI+6iibF1A050B61aCe4oJEfttvN0OCWTnMfJcPpMT7C4V7ZSA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pJp0QqmS
Subject: Re: [Buildroot] [PATCH] package/openssh: fix typo in init script
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
Cc: Fiona Klute <fiona.klute+wiwa@gmx.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 17 Jul 2024 09:21:20 +0200
Andreas Ziegler <br015@umbiko.net> wrote:

> Now that the sshd init script is nice & new & shiny, fix an ancient 
> typo, introduced with commit e0fc615 (add runlevel script for later use)
> 
> Signed-off-by: Andreas Ziegler <br015@umbiko.net>
> ---
>  package/openssh/S50sshd | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

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

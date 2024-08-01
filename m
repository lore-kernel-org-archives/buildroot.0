Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF95FC3DA64
	for <buildroot@archiver.kernel.org>; Thu,  1 Aug 2024 21:48:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD59384542;
	Thu,  1 Aug 2024 21:48:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sOZCBRsLZZCu; Thu,  1 Aug 2024 21:48:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 795678454F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 795678454F;
	Thu,  1 Aug 2024 21:48:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8B3EE1BF3F0
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 21:48:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 82E35403E4
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 21:48:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qTm0PwU_3Cgd for <buildroot@lists.busybox.net>;
 Thu,  1 Aug 2024 21:48:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5574140114
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5574140114
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5574140114
 for <buildroot@buildroot.org>; Thu,  1 Aug 2024 21:48:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 83F6B60002;
 Thu,  1 Aug 2024 21:48:43 +0000 (UTC)
Date: Thu, 1 Aug 2024 23:48:42 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240801234842.147e4e5d@windsurf>
In-Reply-To: <ZqnxazbddLIiWfuP@waldemar-brodkorb.de>
References: <ZqnxazbddLIiWfuP@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722548923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pOOiKOBAQQiBeOWqSRaRMX1Z70XzaCeiUB/c040IIHg=;
 b=gCBF8ivA5RBO2pJpHft9sBR+dGDmHbSXd7LyvB+XeVRhPM08EqroUnMC/U594nQwlD5pBG
 PobHnG7KssXro0jlAwO/E3t7BeLORyeddBpcg7iNVFkmQucI1QRg8ntWnF700oZBHyKiS2
 nEDOLehRmCdKM2dxv1PoMPWeGvCBEN3xNtPTqG0rM5P98/3rgmdVIq323EdoV/wVYayIWV
 FOdUS645bzL7E+bvQ0UkD8sfbTyy0fD8rR5f1BAqSPwvnqHa5G8qdDMbrsQLHaRKD40+d3
 VRdskxcR0yFCVebW2at31IGqIFy/skxXc85lcNB4uLmUFcTiRycDvL/Ma4GMow==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gCBF8ivA
Subject: Re: [Buildroot] [PATCH] package/asterisk: update to 20.9.1
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

On Wed, 31 Jul 2024 10:10:19 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/asterisk/asterisk.hash | 2 +-
>  package/asterisk/asterisk.mk   | 2 +-
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

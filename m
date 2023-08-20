Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E34CEE49A4
	for <buildroot@archiver.kernel.org>; Sun, 20 Aug 2023 21:21:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01385415A6;
	Sun, 20 Aug 2023 21:21:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01385415A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BR1cFBhBWRH7; Sun, 20 Aug 2023 21:21:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 242C840931;
	Sun, 20 Aug 2023 21:21:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 242C840931
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 96ED51BF38D
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 21:21:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 610A440931
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 21:21:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 610A440931
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b3cDc4DSanOa for <buildroot@lists.busybox.net>;
 Sun, 20 Aug 2023 21:21:12 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2CA2D40929
 for <buildroot@buildroot.org>; Sun, 20 Aug 2023 21:21:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CA2D40929
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2612C40003;
 Sun, 20 Aug 2023 21:21:09 +0000 (UTC)
Date: Sun, 20 Aug 2023 23:21:09 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20230820232109.15db7311@windsurf>
In-Reply-To: <20230820165024.2818686-1-yann.morin.1998@free.fr>
References: <20230820165024.2818686-1-yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692566470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Be2SGnkcbL2bvaWJVpIP/3YDLe1R7RurK7T+rIUXtg0=;
 b=lpDxWxz05O0OcHkB+gqhLUxyt8s7KS1lD+IUrPGNaTPoibj9HQzFzcI5LmjdlNWv1jv0Lz
 ZwkdS6sAfHcaB4wybhFBXJViKXbPsofsry8RFBufL7o9XGjKjmOqtuT3DAziXDOtk1VEiC
 gePTqvRgQePTVnpQXn3xETr6YXbNMFiqQtGrssecCwS+ADImRhKdEmItbvIRc6XXXsZh58
 EXAQZc1n1tC2BsRwJ2XZc2w/xikCdIryKH8RYFupFmqT1j5NiBAMgx3woBqbrUsCOhYi0/
 4SG3IENo9RR7ft+OMzcg02Uff1/Q/wkEBKQtCbzSsSZgtOkzlYqN7YC8Ovf2Qg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lpDxWxz0
Subject: Re: [Buildroot] [PATCH] package/ca-certificates: create the bundle
 as target-finalize hook
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

On Sun, 20 Aug 2023 18:50:24 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Other packages, or rootfs overlays, may install certificates, so only
> create the certificate bundle as a target-finalize hook.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  package/ca-certificates/ca-certificates.mk | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

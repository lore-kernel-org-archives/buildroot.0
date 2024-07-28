Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2734CC3DA64
	for <buildroot@archiver.kernel.org>; Sun, 28 Jul 2024 19:36:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C7F740227;
	Sun, 28 Jul 2024 19:36:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kv99fLQSMPqN; Sun, 28 Jul 2024 19:36:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9196440538
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9196440538;
	Sun, 28 Jul 2024 19:36:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3422A1BF577
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 19:36:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 88BB48116A
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 19:36:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2a6O-IrCIin6 for <buildroot@lists.busybox.net>;
 Sun, 28 Jul 2024 19:36:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8536C811AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8536C811AA
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8536C811AA
 for <buildroot@buildroot.org>; Sun, 28 Jul 2024 19:36:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AAE0360002;
 Sun, 28 Jul 2024 19:36:16 +0000 (UTC)
Date: Sun, 28 Jul 2024 21:36:15 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240728213615.6abe4707@windsurf>
In-Reply-To: <20240728080100.5517-1-bernd@kuhls.net>
References: <20240728080100.5517-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722195376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0z5BU3MCMl72fMPH72I2QH+Ki9ZMkGDTlWZDL4RKuic=;
 b=Fd5NlIeiL7FxObxRsrJl/EGq5hs7O/afBtlJlqaROuO17Yea7V0BteeXCC654B8gLuSAX9
 wwbXWKJnxWcs9jKXOsgIxr3QO5Cpv4iiCsrkXsTQ4vpe5EfxynRcNFBkjT/KK5xi1KUwA5
 UZrgPVMxV1Dp1vibgu70sH1fNPd3Cw/PmXuUHQ+bBrcZ8xkI1z/eE2Deyglo6FAuRdChet
 trSASVMD5WA/hy6HlbGJ8Bm4FxsChqsmvUeP7y/l7aK2YsSUSTzIUe4oCoPDBAyv3eAq7h
 9XHpzlJJ2y9HPcVFCzk+pQay7W6FVd2IS/e4a7vqMh5LbGT7LTz9c4iTOLwltw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Fd5NlIei
Subject: Re: [Buildroot] [PATCH v2 1/1] DEVELOPERS: add Bernd Kuhls for
 openvpn
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

On Sun, 28 Jul 2024 10:01:00 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
> v2: rebased

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

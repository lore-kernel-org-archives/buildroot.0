Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D62C3DA49
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 17:15:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B46F960687;
	Sun, 14 Jul 2024 17:15:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zrP4MEUa2If7; Sun, 14 Jul 2024 17:15:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E223B605D2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E223B605D2;
	Sun, 14 Jul 2024 17:15:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A396D1BF3F2
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 17:15:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9CFB5402A8
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 17:15:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j0P3KtWyedCC for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 17:15:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 12ED74010D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 12ED74010D
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 12ED74010D
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 17:15:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 42DA21BF204;
 Sun, 14 Jul 2024 17:15:16 +0000 (UTC)
Date: Sun, 14 Jul 2024 19:15:15 +0200
To: Geoff Levand <geoff@infradead.org>
Message-ID: <20240714191515.372e70b2@windsurf>
In-Reply-To: <20240714170557.25802224@windsurf>
References: <5809d7c9-8cd2-4eb1-8227-901e6722a068@infradead.org>
 <20240714170557.25802224@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720977316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xNkW7GMYD9KsgNfoOw99jRenazI3iOWKqlyXLdcXcBo=;
 b=fM1O5u5nbBva+Ayk7cSZpn4Z//32Tx2XSgaN/68R4cMwEdeYBT/rXDvgtYfE/jom6qmXll
 7jSsQ9UG6pD8WN4gcc4O+9VGIzw97wz9AkhnzL0i9w9Mbast3X6htaCd3fIcIoYn13dMO2
 GfIYevJyQ57lM92nMMuXent7+6iMrAZreBMIWOnwBn/IuBl7PZRBRiU3Os4indX7rRJnFo
 oHjNFTT0qyiHJPhaDQQSt4aO1lnaMU15UbLNh/MKvxY3Rs5G/CjAiSZD7sqyyV2A5mydfm
 Iep+eFXkFBX94erOy++Rf+QPUbdEuEV/kpjtdwTDHe5S18y9W2sHTddPpWkzxg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fM1O5u5n
Subject: Re: [Buildroot] package/flannel: Bump to version 0.25.4
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

On Sun, 14 Jul 2024 17:05:57 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> > -FLANNEL_VERSION = 0.25.3
> > +FLANNEL_VERSION = 0.25.4
> >  FLANNEL_SITE = $(call github,flannel-io,flannel,v$(FLANNEL_VERSION))
> >  
> >  FLANNEL_LICENSE = Apache-2.0

Obviously, I wanted to say:

Applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

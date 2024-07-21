Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DEFAC3DA5D
	for <buildroot@archiver.kernel.org>; Sun, 21 Jul 2024 16:25:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7166600B5;
	Sun, 21 Jul 2024 16:25:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RNH34g-ZZU7f; Sun, 21 Jul 2024 16:25:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0D36605D4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0D36605D4;
	Sun, 21 Jul 2024 16:25:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8A1C11BF321
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 16:25:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7792540139
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 16:25:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UVoTD5yXqX8m for <buildroot@lists.busybox.net>;
 Sun, 21 Jul 2024 16:25:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4158D40124
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4158D40124
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4158D40124
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 16:25:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1461B1C0004;
 Sun, 21 Jul 2024 16:25:17 +0000 (UTC)
Date: Sun, 21 Jul 2024 18:25:17 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240721182517.4d4ef36a@windsurf>
In-Reply-To: <Zpy90k5YGhEjoWnO@waldemar-brodkorb.de>
References: <Zpy90k5YGhEjoWnO@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721579118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BXcuFm3mzVKSQfLN+gaQF1J9sVBnmYZQxiSJ5ux6eHY=;
 b=mNpt9CVs+IV/hjdz46vQBLKgz8pMQxqDpZRr1dJArVk+/awvr8c44RMZmeYCQvD7IfvJbH
 RcPtWzHXB7TQu09dbFQlkNPn42vMdVbffyyDCXSr5GKz8AiHtq3YDYqNGbthTJ8iRZnorf
 IXWBRXxKx68XXz8RoYGZQ9YGz6LsFWYrgPTQwNoVPzLjTTTBb45JwPN0wvEIyMNmb5cX1z
 m/4YKckibZDC7GnWxrHZFvQ/LBDqHEFchFcLWVCDJChgaPteRIHrLWb73JOmbNZclNrbQ9
 m57g58VdcHTikF89l60I2ybBLGhBVVU4qXaq8G6C2X2wbpnuNk9RQFVxBbI/rg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mNpt9CVs
Subject: Re: [Buildroot] [PATCH] package/libucontext: allow uClibc toolchains
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

On Sun, 21 Jul 2024 09:50:42 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> With commit f761a8c4516d88d70ae6f5d192fdb99cafa761a6 it is
> possible to use external libucontext together with uClibc toolchains.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/libucontext/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

This is true, but it will cause a lot of build failures as Bootlin
toolchains have not yet been rebuilt with the uClibc change. I think we
at least need to wait until Bootlin toolchains are updated with this
patch before we can merge such a change.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

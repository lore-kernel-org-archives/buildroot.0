Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25EC3C52D7F
	for <buildroot@archiver.kernel.org>; Wed, 14 Aug 2024 21:51:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6699608FC;
	Wed, 14 Aug 2024 21:51:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OURKOoFoEQEq; Wed, 14 Aug 2024 21:51:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14BD8608F0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14BD8608F0;
	Wed, 14 Aug 2024 21:51:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 63E311BF4DB
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 21:51:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D58181463
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 21:51:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uj9R7hOiHJhx for <buildroot@lists.busybox.net>;
 Wed, 14 Aug 2024 21:51:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 667EC81423
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 667EC81423
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 667EC81423
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 21:51:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AC72560002;
 Wed, 14 Aug 2024 21:51:05 +0000 (UTC)
Date: Wed, 14 Aug 2024 23:51:04 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240814235104.7e0ed31b@windsurf>
In-Reply-To: <ZrrOn5qI/Wr44k8F@waldemar-brodkorb.de>
References: <ZrrOn5qI/Wr44k8F@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723672265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=acEn8lr0B4DSVamzM0iWa1XyIZOBOm1wPJWu7LCV8eM=;
 b=X+tZ1t11pJnOpn5RGBq5ZmXt0BArDvRXJTNvDHxMLPuJDL4KY5tFnfLOcKzSTEfVsftwU5
 zsM1N9aKFuxuDTDldhC4oKsU+UVPRr0F3X0sOdNf2iQdwGYAI9Ghpd04yUcQw7Bm4Y8wnn
 XLtF/ss4B/eGzb9utJiiIs486uImGVN6W5FYzA8BefqHiKKz7Th5PS2dSGbb/kQ4YRPL0b
 xdN1FoJNTbv3c0OXB/dIvyfgA4Ri6nCBs322us1t16bhe8AD9/+IlX9PAB30XjjK2VWEsl
 Qveh5MsGnY3iIuPclANhb4PB35vJZK7J+M74UYamO8rEEvrRnl9Q9ljx5qTOFw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=X+tZ1t11
Subject: Re: [Buildroot] [PATCH v2 next] package/bind: update to 9.18.28
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

On Tue, 13 Aug 2024 05:10:23 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Bind 9.16.x is EOL since April 2024.
> See here for what version should be used in production:
> https://kb.isc.org/docs/aa-01540
> 
> Remove patch 0001 as CC_FOR_BUILD is used in upstream code
> to compile host utility gen.
> 
> Add new patch 0001 to fix a rndc linking error.
> 
> See here for a changelog:
> https://downloads.isc.org/isc/bind9/9.18.28/doc/arm/html/notes.html
> 
> COPYRIGHT file has been updated, following Copyright holders were
> added:
> Copyright Joyent, Inc. and other Node contributors. All rights reserved.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> v1->v2:
>  - add patch to fix a linking error reported by Thomas P.
> ---
>  .checkpackageignore                           |  1 -
>  package/bind/0001-cross.patch                 | 34 -------------------
>  ...1-rndc-add-missing-libns-CFLAGS-LIBS.patch | 34 +++++++++++++++++++
>  package/bind/bind.hash                        |  8 ++---
>  package/bind/bind.mk                          |  5 ++-
>  5 files changed, 42 insertions(+), 40 deletions(-)
>  delete mode 100644 package/bind/0001-cross.patch
>  create mode 100644 package/bind/0001-rndc-add-missing-libns-CFLAGS-LIBS.patch

Thanks a lot, but your patch fixing the issue has been rejected
upstream, claiming the issue is elsewhere, so it looks like more
investigation is needed I'm afraid :/

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

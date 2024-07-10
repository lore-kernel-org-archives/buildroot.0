Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03003C3DA45
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 08:49:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C954960FCB;
	Wed, 10 Jul 2024 08:49:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WD8AtjejcNWu; Wed, 10 Jul 2024 08:49:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF53F60FB2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF53F60FB2;
	Wed, 10 Jul 2024 08:49:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EDCEA1BF5AD
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 08:49:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DACB940462
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 08:49:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jU8Ryh4E2pVY for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 08:49:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7147440429
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7147440429
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7147440429
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 08:49:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3CBE720008;
 Wed, 10 Jul 2024 08:49:50 +0000 (UTC)
Date: Wed, 10 Jul 2024 10:49:49 +0200
To: <yann.morin@orange.com>
Message-ID: <20240710104949.7e32ca6a@windsurf>
In-Reply-To: <b80fa61d1f85e2e418afa9eb105a3aeddaa6d588.1720528385.git.yann.morin@orange.com>
References: <b80fa61d1f85e2e418afa9eb105a3aeddaa6d588.1720528385.git.yann.morin@orange.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720601390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TVDW9XVudFe+7T8TR+veHD9LJY85H0mJcegrBJD/7kU=;
 b=bpNsczu8a5T3qiBYwF+B8ASkyVtR6M31SqxXTlHj8OCE+kh6fHZCcLVkz8tB9lV2yacd0J
 EcbXQJj7Na5ywxpvlse4tOTR6W5yyeZ2CEmmLj4ZW4ENBraKbxyENpZPPWOaYpxQFYe0j3
 pfHATmDlXAZDe9cXg5jXPbQN9W/28YMSdJyUPRIvKEbUO3o3gmATEqSiIg4xsRMdolT27S
 o2/9oCRTKzu81yWjWD8gHq4hMoPP4iI8f0kl2TJ2v6ChS3e/BjpIEyOhOy4+f5MuksGiLH
 2UatXHxeN6tO79dKgA+dahMrAW6A6qm1p2nJ+a1geqVyjJjJoXVGWKTzQoXSIQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bpNsczu8
Subject: Re: [Buildroot] [PATCH] package/python-paho-mqtt: bump version
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
Cc: Davide Viti <zinosat@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 9 Jul 2024 14:33:05 +0200
<yann.morin@orange.com> wrote:

> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> Version 2.1.0 is a major bump, with an API change that should be
> backward compatible with version up to 1.6.1.
> 
> The runtime test failed in timeout because the crng init did not have
> time to complete in the default 5-second timeout; tests showed that the
> trip-off would be between 6s and 7s here, so increase it enough to leave
> some margin on less-capable machines.
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> Cc: Asaf Kahlon <asafka7@gmail.com>
> Cc: Davide Viti <zinosat@gmail.com>
> Cc: James Hilliard <james.hilliard1@gmail.com>
> Cc: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/python-paho-mqtt/python-paho-mqtt.hash         | 2 +-
>  package/python-paho-mqtt/python-paho-mqtt.mk           | 5 +++--
>  support/testing/tests/package/test_python_paho_mqtt.py | 3 ++-
>  3 files changed, 6 insertions(+), 4 deletions(-)

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

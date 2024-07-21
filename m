Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE61C3DA5D
	for <buildroot@archiver.kernel.org>; Sun, 21 Jul 2024 16:32:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CAE8607E2;
	Sun, 21 Jul 2024 16:32:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IgrWFsM-KwYD; Sun, 21 Jul 2024 16:32:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3360460806
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3360460806;
	Sun, 21 Jul 2024 16:32:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A33F31BF321
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 16:32:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E43080DBE
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 16:32:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZvNzM3w-x_77 for <buildroot@lists.busybox.net>;
 Sun, 21 Jul 2024 16:32:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 55D5480D9A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55D5480D9A
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 55D5480D9A
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 16:32:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 621AEFF802;
 Sun, 21 Jul 2024 16:32:14 +0000 (UTC)
Date: Sun, 21 Jul 2024 18:32:13 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240721183213.4aaec0a7@windsurf>
In-Reply-To: <20240721102430.980514-1-fontaine.fabrice@gmail.com>
References: <20240721102430.980514-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721579534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lDi1abMtEvRbKuer9oWfL0ldPHY0ksymVRPf/Xzmjuw=;
 b=UY2T0xRU55w6AefdBkrU/pHg1WLja0yL/fUPBez+UsAufZAkPznKRIDAQeq78LPictIXcz
 Euty3z0Ru/9oUrXZivdaFCN+gEfUK+5/HpEKx5mDE3ke/XRPl05ZnGebxxW58pS9XHt8wb
 K+X9wQVx2r6BsY9xDsZXPq50MX/MfyB5OmAGZ4RxpT4GzpKFtwXJh/YlzT8FieAJiAFHmn
 cwGn8ngJ8oegx7HqhGJ2Dr1qxab4yi9ajYMpBqfFxe41/Hoco+t4morDu1huLAoZJt3+64
 lSt01qC++bBKM+kt7/nO/7szmGUbjEgJNNVyaClZAnDL4MHI052duDsUuQ5fcQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UY2T0xRU
Subject: Re: [Buildroot] [PATCH 1/1] package/tftpd: bump to latest git commit
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

On Sun, 21 Jul 2024 12:24:30 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Update hash of tftpd.c (changes not related to license)
> - --include=$(@D)/autoconf/m4 and --disable-tcpwrappers must be passed
>   since
>   https://git.kernel.org/pub/scm/network/tftp/tftp-hpa.git/commit/?id=fefaa2cc5c2ae1537fccbb552496787130feeeaa
> - This bump will also fix the following musl build failure raised since
>   latest bump in ee2b57e0c98acf1d02cf66a38c9ec82bd69bcbeb:
> 
>   In file included from tftpsubs.h:41,
>                    from tftpsubs.c:34:
>   /home/autobuild/autobuild/instance-9/output-1/build/tftpd-e52af4207a6e09a1ba21f61d6f85d8b2b1e6efc0/config.h:209:13: error: conflicting types for 'socklen_t'; have 'int'
>     209 | typedef int socklen_t;
>         |             ^~~~~~~~~
> 
> Fixes: ee2b57e0c98acf1d02cf66a38c9ec82bd69bcbeb
>  - http://autobuild.buildroot.org/results/4b5320013d8ab50499a459d64a71e0b71814fb2f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/tftpd/tftpd.hash | 4 ++--
>  package/tftpd/tftpd.mk   | 5 +++--
>  2 files changed, 5 insertions(+), 4 deletions(-)

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

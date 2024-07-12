Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9285C3DA4B
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 12:57:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDE3F417E2;
	Fri, 12 Jul 2024 12:57:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hVM05Gj1yASJ; Fri, 12 Jul 2024 12:57:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA8D1417F2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA8D1417F2;
	Fri, 12 Jul 2024 12:57:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5F5BE1BF40F
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 12:57:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D49A6071C
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 12:57:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IKcnu3aQ8TEJ for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 12:57:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 33D9A606F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33D9A606F0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 33D9A606F0
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 12:57:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 81AF320003;
 Fri, 12 Jul 2024 12:57:29 +0000 (UTC)
Date: Fri, 12 Jul 2024 14:57:28 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20240712145728.25a4299e@windsurf>
In-Reply-To: <5278eb53136fe1fd8cc2591748a1cc968ece79ad.1717352584.git.yann.morin.1998@free.fr>
References: <cover.1717352584.git.yann.morin.1998@free.fr>
 <5278eb53136fe1fd8cc2591748a1cc968ece79ad.1717352584.git.yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720789049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gmA5SevM+xmUE6MX0rh26OPtTRXR1UZj3kRECmJf3fE=;
 b=nGCvKOGxzRCUDCbzFhGcA2uzk4/YCN+X1mT8TBYZLERXO3AozAG+LklzxpjJ3n10V5ybkD
 Zp4L9QDN9D6yvJnX6f2wefk3MdM9APdIWFZmQnXn9+RPngXgzZ3fla6pWGoW4zOy8ByU8s
 3Zq/O+H97dPi5nPCXMMns7v2QFvGsOsGilMnaYem6jR+p2cc3Dfam1EVPWS4xMzgM90M3A
 j81RY+yG9v2iV7woFYYX0hj38v0NPZOD8MerxVIiu2IoL9+pn/YzuCUk+On2tlMEKp5QiQ
 rDQxip3t/k5bgpcDWSCPR2apYiF4aVMZC35rXV+MuMQNekyd0NgBC+pyW41otA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nGCvKOGx
Subject: Re: [Buildroot] [PATCH 2/2 v2] utils/genrandconfig: do not check
 certificates with curl
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

On Sun,  2 Jun 2024 20:23:08 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> genrandconfig is used in autobuilders, and some autobuilders are running
> on old distributions that are lacking the most recent CAs, causing build
> failures because package sources can't be retrieved.
> 
> Do for the curl backend what we already did a while back for the wget
> backend, with commit 0866a280e40a (utils/genrandconfig: use
> --no-check-certificate in wget by default); in curl, the equivalent
> would be --insecure, and applies to the ftps transport.
> 
> The integrity of the downloads are validated against our bundled hashes
> so there is no risk of corruption of the downloaded files. The only
> issue would be that an MITM could inspect the transaction, the same way
> as for the wget --no-check-certificate in 0866a280e40a, but this is not
> considered a high-level issue (we're anyway talking FTPS here, that's a
> legacy protocol that has other issues).
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> 
> ---
> Note: this is totally untested, because FTPS is not widespread and no
> known package was available via FTPS. This patch can probably be dropped.
> ---
>  utils/genrandconfig | 1 +
>  1 file changed, 1 insertion(+)

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

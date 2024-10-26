Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F5D2D10BF7
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 11:55:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BFCB81F7E;
	Sat, 26 Oct 2024 11:55:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mzow8uXZVgnw; Sat, 26 Oct 2024 11:55:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8739481F8D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8739481F8D;
	Sat, 26 Oct 2024 11:55:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CE39A2318
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 11:55:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AEC814018E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 11:55:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tWSCjGm8xIbo for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 11:55:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 59D424019A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59D424019A
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 59D424019A
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 11:55:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5B00340003;
 Sat, 26 Oct 2024 11:55:40 +0000 (UTC)
Date: Sat, 26 Oct 2024 13:55:39 +0200
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Gilles Talis <gilles.talis@gmail.com>
Message-ID: <20241026135539.5fdd6f6a@windsurf>
In-Reply-To: <20241005225808.903365-1-ju.o@free.fr>
References: <20241005225808.903365-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729943740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yE1dlbJH+9EzS9qJ1tu49rMoxhgM6JXXdx5bjcYH60Q=;
 b=WP9FP0/cmitjScsiaRrQWK3oeWbr0Ut1+vB4VqN82upReu8yBc19I4GRzOHEUkNzF7sUzG
 OVTlcTnp9E2Z3QbtsUKOlwwmR2rDLhUAEq+FhD7QA8hHJehvUAMiyjMUBUIh4FmGGfxQoZ
 u91ZfRYDP3KY9yNakSvKrz3RJ2IrNRJ3XJKhN0AhifSjPfq/7lViokTNoh4IioN8m8sj5j
 A4QsZl3oohbX4rkeR39T2/+yq7sSvZUS859otnw3JbqJObuFne4Pa1MOZUFPZA+XXKmRO7
 OMzg8qySK3UmApX0/c816y5KRAqgzAfHoYh4n4SZ+hGa84eJsxPmJ6avUzZ6gw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WP9FP0/c
Subject: Re: [Buildroot] [PATCH v2 1/2] package/oath-toolkit: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  6 Oct 2024 00:58:07 +0200
Julien Olivain <ju.o@free.fr> wrote:

> OATH Toolkit provide components to build one-time password
> authentication systems. It contains shared C libraries,
> command line tools and a PAM module. Supported technologies
> include the event-based HOTP algorithm (RFC 4226), the
> time-based TOTP algorithm (RFC 6238), and Portable Symmetric
> Key Container (PSKC, RFC 6030) to manage secret key
> data. OATH stands for Open AuTHentication, which is the
> organization that specify the algorithms.
> 
> https://www.nongnu.org/oath-toolkit/
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Changes v1 -> v2:
> - Included all changes recommended by Gilles:
>  - bump to 2.6.12 to include recent security fix
>  - add _INSTALL_STAGING = YES
>  - Fix PSKC typo

Series applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

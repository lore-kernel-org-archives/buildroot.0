Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C92FC27C53
	for <buildroot@archiver.kernel.org>; Sat, 22 Jun 2024 17:12:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A4764056B;
	Sat, 22 Jun 2024 17:12:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mXZnK79pqLoS; Sat, 22 Jun 2024 17:12:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 753D24059E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 753D24059E;
	Sat, 22 Jun 2024 17:12:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6EE321BF5DB
 for <buildroot@lists.busybox.net>; Sat, 22 Jun 2024 17:12:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B58F407BE
 for <buildroot@lists.busybox.net>; Sat, 22 Jun 2024 17:12:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m8ZwszaUO-7c for <buildroot@lists.busybox.net>;
 Sat, 22 Jun 2024 17:12:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 106BC40711
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 106BC40711
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 106BC40711
 for <buildroot@buildroot.org>; Sat, 22 Jun 2024 17:12:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D5CCD240002;
 Sat, 22 Jun 2024 17:12:45 +0000 (UTC)
Date: Sat, 22 Jun 2024 19:12:45 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240622191245.03dee6d9@windsurf>
In-Reply-To: <20240612192317.52329-1-bernd@kuhls.net>
References: <20240612192317.52329-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1719076366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1HMBSk4iZ5wLSG8ZGl5wxk8Ew/xltlJROpAT6CbWC78=;
 b=dHU85TzTX0aXRb4t3FnqhlE3m1JF8Vp6mplgw8QTIpgcSsAFtoHqYyHzt2AVHyU9MejYfB
 7YfHulLEmdC2Wmx+S+GFus0AiKwkanDVWYVMHly6Svxd8v/RWeZbRdSQwChRC4GEDAT3Le
 5/MyXoPm0SkgvxfxEyu+Grr13twF/8/xRHJwp2H6j4ssMohkz+8d+XPQOXJ3jvW0LEv9w7
 yRjdm1k0F4KA865S1Drt8GjNRkBBMSdGNKmV8yI4EusLSz6wMrb7akRW8jbMigZU/2ckyQ
 wh+czKszPM6XY1tkQn80INuRDGsW0Ql6scfBFVp2NuE7peOI8bJ8OGohH2jjTw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dHU85TzT
Subject: Re: [Buildroot] [PATCH 1/1] package/libcurl: bump version to 8.8.0
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

On Wed, 12 Jun 2024 21:23:17 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Changelog: https://curl.se/changes.html#8_8_0
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/libcurl/libcurl.hash | 4 ++--
>  package/libcurl/libcurl.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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

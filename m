Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D85AC3DA41
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 21:57:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DF004155A;
	Wed, 10 Jul 2024 21:57:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BPdHOCvn9bWP; Wed, 10 Jul 2024 21:57:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 028724156C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 028724156C;
	Wed, 10 Jul 2024 21:57:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 18FBD1BF292
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 21:57:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 116BA4156C
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 21:57:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XyhR4_ztyI5v for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 21:57:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C8D064155A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8D064155A
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C8D064155A
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 21:57:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B10C3240002;
 Wed, 10 Jul 2024 21:57:12 +0000 (UTC)
Date: Wed, 10 Jul 2024 23:57:11 +0200
To: Charles Hardin <ckhardin@gmail.com>
Message-ID: <20240710235711.631b77b9@windsurf>
In-Reply-To: <20240624192610.78164-1-ckhardin@gmail.com>
References: <20240624192610.78164-1-ckhardin@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720648633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PgXFu19+3uJUUfYy399U5MxKkxvgWF2zWxIuipITwpw=;
 b=k6nuThWmO1zuvwEOEEulyPLROIJv6/EGgq/nvfWLg/8w8vUkeMLOLtebFVSVPFuQViQyfi
 d02F0z4RKAW0FMyONg3gdxLFt6+mS2535UoFPPb1Rh5/KsS2qHjHM41sUWc7i7PEAJIjMr
 eItogpuAqee9PsnrP3L3/Sj7zONECAQJVIx7f7ltjrnMfRx+MbWIOhyj5bVrwu1MIWB3jP
 MfXTB8gVblU9FkGz4GBqdPiMkFC9oxo5qfid9I3mGZbWlkI/a+BoU9W/+V8WDD/8JkiVG+
 cCB0Du0Om6jBR5yzUlS+KEo1vP5VMgOYynb3Pyh02USu2kvFRAAycaXQRovrGA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=k6nuThWm
Subject: Re: [Buildroot] [PATCH 1/1] package/alsa-plugins: bump version to
 1.2.12
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

On Mon, 24 Jun 2024 12:26:10 -0700
Charles Hardin <ckhardin@gmail.com> wrote:

> Changelog:
> https://www.alsa-project.org/wiki/Changes_v1.2.11_v1.2.12#alsa-plugins
> 
> Signed-off-by: Charles Hardin <ckhardin@gmail.com>
> ---
>  package/alsa-plugins/alsa-plugins.hash | 2 +-
>  package/alsa-plugins/alsa-plugins.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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

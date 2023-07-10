Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AA10EB64D9
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 18:50:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6704417C4;
	Mon, 10 Jul 2023 18:50:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6704417C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t0_WgA_O1Zy8; Mon, 10 Jul 2023 18:50:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9804417B3;
	Mon, 10 Jul 2023 18:50:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9804417B3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 51B491BF3AE
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 18:50:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B7F261010
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 18:50:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B7F261010
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 72jeD3Uzv3gE for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 18:50:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3A5261011
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A3A5261011
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 18:50:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A179F60005;
 Mon, 10 Jul 2023 18:50:50 +0000 (UTC)
Date: Mon, 10 Jul 2023 20:50:49 +0200
To: Charles Hardin <ckhardin@gmail.com>
Message-ID: <20230710205049.419f4fea@windsurf>
In-Reply-To: <20230620170922.3722-1-ckhardin@gmail.com>
References: <20230620170922.3722-1-ckhardin@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689015051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ew3trfUen/gP5SyaYeEVoDy6LSgDvW9PLxFrscJTLSo=;
 b=kOqu4WpkFaRcpWkJYZdMhClCa0QZEVucr62CAUKk8wnRapC+LXCmeJJ82bjGVdqaUbS3+w
 c9JPOm8HuxmwC9N76PvZ4xiRL3Md0TYPcnQhG4JHcsJuviQ4puKGCKmOoX8m5RzDwtGLwi
 jkWcVEoQ3/juIim4da0j/EpwpGObrODCFie6Kk758XPY4YEw6XNFzVb3DXpf45obNbb+Gx
 BtrpRKjO72a95WRmAGT8cn8NnpXzgkv1zmyLplwoys7/J+r5Ip7TSo2LxEHH4l7Hsl+DRe
 oYKoBKAqylSkMWvXY5KaiQdf6GPuRbbnP4XoS3f3tnJIkfM0yrn1NnbCOxO36w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kOqu4Wpk
Subject: Re: [Buildroot] [PATCH 1/1] package/firmware-imx: ensure the linux
 firmware is installed first
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
Cc: Refik Tuzakli <tuzakli.refik@gmail.com>,
 Gary Bisson <bisson.gary@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 20 Jun 2023 10:09:22 -0700
Charles Hardin <ckhardin@gmail.com> wrote:

> There was imx SDMA firmware in the base linux-firmware package at
> one time, but the firmware-imx is updated with the latest versions
> from NXP releases.
> 
> This just ensures a dependency is set so that the imx package will
> always come later in case an overlap occurs again.
> 
> Signed-off-by: Chares Hardin <ckhardin@gmail.com>
> Signed-off-by: Charles Hardin <ckhardin@gmail.com>
> ---
>  package/freescale-imx/firmware-imx/firmware-imx.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

That being said, the BR2_PER_PACKAGE_DIRECTORIES=y mechanism requires
that packages don't overwrite files installed by other packages, so at
some point, this will have to be revisited. But this issue exists for
many other packages anyway, and we are far from having addressed all
those issues.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

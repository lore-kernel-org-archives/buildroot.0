Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26FCEEB64D9
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 17:40:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4B7282068;
	Mon, 10 Jul 2023 17:40:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4B7282068
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id skUfl9FKjY8T; Mon, 10 Jul 2023 17:40:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31CF482073;
	Mon, 10 Jul 2023 17:40:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31CF482073
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A10F01BF3D4
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 17:40:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 792EB606E6
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 17:40:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 792EB606E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ev1oJXRX6Jsx for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 17:40:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA16A6068B
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DA16A6068B
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 17:40:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DF9A2240003;
 Mon, 10 Jul 2023 17:40:24 +0000 (UTC)
Date: Mon, 10 Jul 2023 19:40:23 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230710194023.38f1b8e4@windsurf>
In-Reply-To: <20230703192032.270675-1-bernd@kuhls.net>
References: <20230703192032.270675-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689010825;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vR3TbHy4qSAHwS0fICNj3FikmiNASdi4aK1vIBacpNI=;
 b=M6dtbJb+PWPATYzurh0AVhw0ZHnIH+WM1ZudCxkiK2LkAMX1I4AtIkm89UD/WkvnOeqe/8
 G8yNwwgn83GPCOkrMjO+C1NU6sqB9YI8lNvsN/iv0sJWzkdU4PWdSxvrgqalN3aoi/ksOe
 tLytQF+lO87S48f1D2wdI5d6iCfgPM/ixqeEfbGyXnDeYinrtkQherJ3ze9/mw8HiOKuE3
 2yE2paJ0/xEm54Lv0cmgN5w0Uiy2HZz0WnErdFDwzwffygZWvqkpq9lxC++cDGr2XrMSCJ
 t4DLUMK8IB3r22dsUc4YVHZiHmQgqyykYhtFdcyVG113RLAQ9/ZCSC4CLavIvw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=M6dtbJb+
Subject: Re: [Buildroot] [PATCH v2 1/1] package/alsa-lib: Fix symver build
 error on non-ELF platforms
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

On Mon,  3 Jul 2023 21:20:32 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/1e9/1e965d83d75615f35308440c5db044314a349357/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
> v2: fixed typo in include/alsa-symbols.h (Arnout)

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

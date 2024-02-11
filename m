Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B0DC4829A
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 21:31:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1396B850EC;
	Sun, 11 Feb 2024 21:31:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5XRgYCpHnAGC; Sun, 11 Feb 2024 21:31:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D1E2850E8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D1E2850E8;
	Sun, 11 Feb 2024 21:31:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BA2471BF2EF
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 21:31:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B2E06418C8
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 21:31:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q7n3B0RovCcc for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 21:31:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8E885418C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E885418C5
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8E885418C5
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 21:31:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 863CC1C0002;
 Sun, 11 Feb 2024 21:31:34 +0000 (UTC)
Date: Sun, 11 Feb 2024 22:31:33 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240211223133.3d6c3247@windsurf>
In-Reply-To: <20240211163116.2318321-1-bernd@kuhls.net>
References: <20240211163116.2318321-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707687094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U/xH2C8eOl48cFgKRocrqjdbivg7xuxH737OT1We3ls=;
 b=P0uBf9W6ffUVxEY80R/S0AKkrUXyb51eUFOzbJfZiK96VCGOvkquIQ9HqoMXdOzlPIc6ot
 HK+TZFGT0PgEpsUMbZy1beCubTEzqK0+/uPhlcxGmXbqQNDmsBU2NVoJlEvCmlXioxujM2
 03ArNyIyi9oeb5Y3gfaOxe4Wpqwm63Me5BreIusXRAi+Ol2Vpok3iB17kJfj2x+n69+6hH
 Iq/YDb6oEOibNe7imEYcjgp8CPVix7HZad/dBycp/rH0BGNQ4r4C7sIqRUI7qTvl9SlwmJ
 /XnzFjNaycZvPW3NQQGi7TgV+lqmAO9RHaNmXNsjDrdA5zixrnOKJQTr57Rj3Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=P0uBf9W6
Subject: Re: [Buildroot] [PATCH 1/1] package/libpng: bump version to 1.6.42
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

On Sun, 11 Feb 2024 17:31:16 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes:
> https://raw.githubusercontent.com/pnggroup/libpng/v1.6.42/ANNOUNCE
> 
> Removed patch which disabled pngfix and png-fix-itxt tools and use the
> new upstream-provided configure option --disable-tools instead:
> https://github.com/pnggroup/libpng/commit/22ad62c25e7355b20d1486da301cb69159db0915
> https://github.com/pnggroup/libpng/commit/71475b064f3e628e55a2f89f55e873945650afe9
> 
> Updated license hash due to copyright year bump:
> https://github.com/pnggroup/libpng/commit/0dfe422e9f872d3a851d52fc45047bdfd6da0cf4
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  ...0001-Disable-pngfix-and-png-fix-itxt.patch | 47 -------------------
>  package/libpng/libpng.hash                    |  6 +--
>  package/libpng/libpng.mk                      |  3 +-
>  3 files changed, 5 insertions(+), 51 deletions(-)
>  delete mode 100644 package/libpng/0001-Disable-pngfix-and-png-fix-itxt.patch

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

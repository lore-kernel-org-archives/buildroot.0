Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A56B3C001DE
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 10:13:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5ACBB60B49;
	Sun, 30 Jul 2023 10:13:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5ACBB60B49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hK35fiFgIRkD; Sun, 30 Jul 2023 10:13:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 877C860BB8;
	Sun, 30 Jul 2023 10:13:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 877C860BB8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0B2441BF8C7
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:12:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C962E40193
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:12:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C962E40193
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JzxwVEnE9b1y for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 10:12:37 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AF91F40138
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 10:12:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF91F40138
Received: by mail.gandi.net (Postfix) with ESMTPSA id C1DAFC0002;
 Sun, 30 Jul 2023 10:12:27 +0000 (UTC)
Date: Sun, 30 Jul 2023 12:12:26 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230730121226.7fef2c19@windsurf>
In-Reply-To: <20230730065637.692838-1-bernd@kuhls.net>
References: <20230730065637.692838-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690711953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w5QXJTrs3AqVguxfQuBYWmGcs4OU7yDxaHVRT1VvoPs=;
 b=ne2/Ni963AGNe1uwD/sR9ARzukCdPirbzbP6ZsFJZACMIOB+vP9zWePLAPEJKWNqiEBWpD
 E4/YtvZ1q8/kn9csQ6xsP+vhbJsSQfOjW/TqGECM4Y8p6W7OEwBqGAZsIgQHfbQFp1NyGz
 Sg0U3933sXFs++KlOvIZDLXSxETDGYO1fTjBg61zLhegBTm9NPrx5war4mSGQGOwtoLnTt
 5yHgAqo4jYBaCe5X8DwL0Qa2uTporzpbYyRwBA1tjf76EtzLuy9xHnCFFEuOw6fF3O2imZ
 G1vai4KqaxKOgONLQ8YUEa0Td0F12ZeTuyiE1kivRG+E+8R2ONqwdCUyObqTdw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ne2/Ni96
Subject: Re: [Buildroot] [PATCH 1/1] package/mbpoll: fix build without c++
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
Cc: Jon Ringle <jringle@gridpoint.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 30 Jul 2023 08:56:37 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Add patch to enable build without c++.
> 
> Add configure option to fix subsequent configure error due to patched
> source file during git version check:
> 
> CMake Error at cmake/GitVersion.cmake:118 (message):
>   Unable to find current project version !
> Call Stack (most recent call first):
>   CMakeLists.txt:100 (GetGitVersion)
> 
> Fixes:
> http://autobuild.buildroot.net/results/2f8/2f819871a89cb2a2df239b1f879c1babcdd022fc/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  ...dd-LANGUAGES-option-to-project-varia.patch | 30 +++++++++++++++++++
>  package/mbpoll/mbpoll.mk                      |  1 +
>  2 files changed, 31 insertions(+)
>  create mode 100644 package/mbpoll/0001-CMakeLists.txt-Add-LANGUAGES-option-to-project-varia.patch

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

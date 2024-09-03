Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A9BBCD37AA
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 20:10:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2968560680;
	Tue,  3 Sep 2024 20:10:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hHLCNgBat_1f; Tue,  3 Sep 2024 20:10:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B60160687
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B60160687;
	Tue,  3 Sep 2024 20:10:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A5A9B1BF57B
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 20:10:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C5C080BF0
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 20:10:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YVgtGeo5G0O0 for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 20:10:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5182980BB3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5182980BB3
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5182980BB3
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 20:10:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 475A760002;
 Tue,  3 Sep 2024 20:10:14 +0000 (UTC)
Date: Tue, 3 Sep 2024 22:10:13 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240903221013.3e5d61af@windsurf>
In-Reply-To: <20240901064509.3505801-1-dario.binacchi@amarulasolutions.com>
References: <20240901064509.3505801-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1725394214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tUtiKkAf8EZQQjzqzMOj3wewX+UPa455+AhAJWjuVyA=;
 b=COVnPIl05Og+ufRZ27sgNMn1a8bTy2U1w7PPjTYPpfvLFPkhRQdJPQ4GaHqyehdQ4a0S1o
 pvgonB65n2Eu8eKFEB+iWl/KZLwUsyNk7gBScCJLZ3pJCLZATlNj+z1j+0qQBb3Yq93sTu
 Ucm2I0+SzAvcdMeJpUtFICpGPIEsQuk7aGUxDBYGwkV3SNAruv3boymwryI+ljVcoEidkC
 UdRXmGBib5iBG1uuuVutXBzRVJ66/OO+3anwWUkcRXrfs6X73m6fRcuaApsQYMQBcMkAnm
 5wAwW6Mxnzeb9ac1zofI1ZO+VdCwR7hHU86WPJnxZ1GNEcgkr1HCUHVUmWFrYQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=COVnPIl0
Subject: Re: [Buildroot] [PATCH v2 1/2] package/armadillo: temporarily
 update the site URL
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
Cc: Samuel Martin <s.martin49@gmail.com>, linux-amarula@amarulasolutions.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  1 Sep 2024 08:45:08 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> Following an email exchange with Conrad Sand, one of the maintainers of
> the project, I learned that version 9.900.2 has been moved to
> https://sourceforge.net/projects/arma/files/retired/.
> 
> This patch fixes the package download error, waiting for a subsequent
> patch that will restore the previous URL to bump to a more recent
> version.
> 
> Adding the .RETIRED suffix to the downloaded tarball generated the
> following error:
> 
> armadillo-9.900.2.tar.xz.RETIRED: OK (sha256: d78658c9442addf7f718eb05881150ee3ec25604d06dd3af4942422b3ce26d05)
> >>> armadillo 9.900.2 Extracting  
> buildroot/dl/armadillo/armadillo-9.900.2.tar.xz.RETIRED | buildroot/output/host/bin/tar --strip-components=1 -C buildroot/output/build/armadillo-9.900.2   -xf -
> /bin/bash: line 1: buildroot/dl/armadillo/armadillo-9.900.2.tar.xz.RETIRED: Permission denied
> buildroot/output/host/bin/tar: This does not look like a tar archive
> buildroot/output/host/bin/tar: Exiting with failure status due to previous errors
> make[1]: *** [package/pkg-generic.mk:213: buildroot/output/build/armadillo-9.900.2/.stamp_extracted] Error 2
> 
> which required the addition of ARMADILLO_EXTRACT_CMDS to be fixed.
> 
> Finally, it was also necessary to modify the tarball's hash.
> 
> Fixes:
> - http://autobuild.buildroot.org/results/d4e9e7b453960a4f62a199344b30b729a4f235bc
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> Changes v1 -> v2:
>   - Don't bump to 10.1.0 but update the URL site to continue to download and
>     build the current version (e. g. 9.900.2).

Thanks, series applied to master:

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

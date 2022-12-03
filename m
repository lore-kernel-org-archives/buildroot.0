Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 373E1C352A1
	for <buildroot@archiver.kernel.org>; Sat,  3 Dec 2022 14:33:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CACE5401B7;
	Sat,  3 Dec 2022 14:33:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CACE5401B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id imDSL3myePk8; Sat,  3 Dec 2022 14:33:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 07978401B2;
	Sat,  3 Dec 2022 14:33:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07978401B2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DFBC31BF36A
 for <buildroot@lists.busybox.net>; Sat,  3 Dec 2022 14:33:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB7C6605A2
 for <buildroot@lists.busybox.net>; Sat,  3 Dec 2022 14:33:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB7C6605A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PNMiY-v24VDI for <buildroot@lists.busybox.net>;
 Sat,  3 Dec 2022 14:33:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65C6E6058F
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 65C6E6058F
 for <buildroot@buildroot.org>; Sat,  3 Dec 2022 14:33:26 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C51B760005;
 Sat,  3 Dec 2022 14:33:22 +0000 (UTC)
Date: Sat, 3 Dec 2022 15:33:19 +0100
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20221203153319.4a941140@windsurf>
In-Reply-To: <20221202183631.2066307-1-peter@korsgaard.com>
References: <20221202183631.2066307-1-peter@korsgaard.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670078003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xnMHaMgHOJU8rL7FbQbjy694aC9TD6vRXXty0SwyRoM=;
 b=LB/x+aDcwDLlo/K5uy4YVrjiYyLl/g08cfyiWGNdJPjazHWp9Qd2o1a74MPFVo0x+7UfnI
 +I+LgU5LeP9Lj6e39uF7a4YnTX7ZAQ17hjLQih3FLdNWnOORUCBBRQy8K2FFllaqOfXTra
 g8YHPCitNL47F5LcGzKDgHCl2CrNZTayaih1Y4vWLJqiIVxMaf2OtinfqYD7TOQ17hJpxj
 IFeQvrvcsSevFi8MmjwYudDSi5J2E6y24fgbjid3Do5UNa0rr/rIVySK3wLpKIIrb5uZBh
 SF3YJetrCAJBCrBQMvO/XinnNSVxm/bPWUi7/AkSPWp07zptia/DCsj3u1Comw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LB/x+aDc
Subject: Re: [Buildroot] [PATCH 1/2] package/exim: add upstream security
 fixes for CVE-2022-3559
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri,  2 Dec 2022 19:36:30 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> Fixes CVE-2022-3559: A vulnerability was found in Exim and classified as
> problematic.  This issue affects some unknown processing of the component
> Regex Handler.  The manipulation leads to use after free.  The name of the
> patch is 4e9ed49f8f12eb331b29bd5b6dc3693c520fddc2.  It is recommended to
> apply a patch to fix this issue.  The identifier VDB-211073 was assigned to
> this vulnerability.
> 
> The upstream patch does not apply to 4.96, so use the backported patches
> from Debian.  Amazingly, the patch needs 3 additional patches to unbreak
> builds without "WITH_CONTENT_SCAN" (default in Buildroot), so add those as
> well.

What a mess :-/

> +Subject: [PATCH 1/3] Fix non-WITH_CONTENT_SCAN build.
> +Subject: [PATCH 2/3] Fix non-WITH_CONTENT_SCAN build (2)
> +Subject: [PATCH 3/3] Fix non-WITH_CONTENT_SCAN build (3)

You forgot to drop the patch numbering, so I did it when applying to
master. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

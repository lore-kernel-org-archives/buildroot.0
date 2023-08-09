Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60BE6C001B0
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 20:59:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18A2E60B73;
	Wed,  9 Aug 2023 20:59:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18A2E60B73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TTy8q67-OGGY; Wed,  9 Aug 2023 20:59:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5484760F5C;
	Wed,  9 Aug 2023 20:59:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5484760F5C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 33EFA1BF3EB
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 20:59:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F365A418EA
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 20:59:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F365A418EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9xrVuvj3UJ2f for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 20:59:06 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 35C2D408DD
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 20:59:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35C2D408DD
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4E8CC1BF207;
 Wed,  9 Aug 2023 20:59:02 +0000 (UTC)
Date: Wed, 9 Aug 2023 22:59:01 +0200
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20230809225901.470e0270@windsurf>
In-Reply-To: <143fe7eb-b3ed-55f0-f1b7-9ea9d4582d50@mind.be>
References: <20230731201422.13543-1-dalang@gmx.at>
 <20230731235236.60ddc54a@windsurf>
 <47519c2e-9b64-68b1-79b2-21a2ddea976b@gmx.at>
 <20230801161956.00715a06@windsurf>
 <143fe7eb-b3ed-55f0-f1b7-9ea9d4582d50@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691614743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UqhvHWCF+jfr7IuWH7u3cZB45KIIl27OHDZIayimgbs=;
 b=KzJZpQOftVdmY4Pl+FnLwWUK3DhcRV2fHwPwRd4lJUatw+TfKS7hKpbBZBBMaZ+dubVXcl
 1WSJTm6SxYP7trA8SEj1vjO+uTRZ3LIA7w3qULaNenbPTHJo6HP5naAUDPIz3/IpG7JMWE
 qqNJTR+Kz7qmRK7lBZXXsGohOB855jUWNZbVXnk/G3vDSYkZBO4wHXZffwUA7cSRvsymyF
 38S8BuBGTEYpnbm71yjmPPLHm4YSjgpJt7QkDosVeK2t9G7U24U2wqtPnl0vF60vyT7YPm
 eZMNQrw4sa+a6NdsA5I1p0XDsbNSL7wW38mte6HL4NYvCnhBYSJDrUQ1mVnWEg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KzJZpQOf
Subject: Re: [Buildroot] [PATCH] support/scripts/cve.py: switch to NVD JSON
 version 2.0
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
Cc: Daniel Lang <dalang@gmx.at>, clement.ramirez@bootlin.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 9 Aug 2023 22:31:11 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

>   Using the CPE database is actually useless. I think we should drop it.

When I read this, I disagreed...

>   It actually doesn't matter at all if a CPE entry (including the version) is 
> found in the CPE database. If there's a CVE for it, then the entry will exist. 
> But usually, the CVE will have a version range. In that case, we anyway match 
> the version range without caring at all if the specific version exists in the 
> CPE database or not.
> 
>   So, I think we should just construct a CPE string and match it against the 
> CVEs, without consulting the CPE database at all.
> 
>   It _does_ make sense to do a lookup in the CPE database for the CPE string, 
> but with * as the version part. This allows us to validate if the 
> vendor/project/etc. are set correctly. But that's something we can do in 
> individual API calls for each package, like we do for release-monitoring.

... but then you say we should still use the CPE database, and I agree
on the why we should use it: to have some reasonable certainty that the
CPE ID we create in Buildroot for each package has a chance of matching
the CPEs that will be associated to the CVEs that will perhaps one day
be reported against this software package. So yes, perhaps we should
just match in the CPE database with version set to '*', so that we
don't care if the CPE database isn't aware of the latest releases of
software packages, which it rarely is.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

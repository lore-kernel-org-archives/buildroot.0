Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE6F1E6FE4D
	for <buildroot@archiver.kernel.org>; Sat,  7 Sep 2024 07:24:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96100408CF;
	Sat,  7 Sep 2024 07:24:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2rRtZBXDnocR; Sat,  7 Sep 2024 07:24:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 566C8408D8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 566C8408D8;
	Sat,  7 Sep 2024 07:24:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 45B821BF401
 for <buildroot@lists.busybox.net>; Sat,  7 Sep 2024 07:24:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40BEF60784
 for <buildroot@lists.busybox.net>; Sat,  7 Sep 2024 07:24:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LwMOZRQmJ5tc for <buildroot@lists.busybox.net>;
 Sat,  7 Sep 2024 07:24:41 +0000 (UTC)
X-Greylist: delayed 394 seconds by postgrey-1.37 at util1.osuosl.org;
 Sat, 07 Sep 2024 07:24:40 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A1EB260797
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1EB260797
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br015@umbiko.net; receiver=<UNKNOWN> 
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A1EB260797
 for <buildroot@buildroot.org>; Sat,  7 Sep 2024 07:24:40 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 0BE2CBDE230D;
 Sat,  7 Sep 2024 09:18:02 +0200 (CEST)
MIME-Version: 1.0
Date: Sat, 07 Sep 2024 07:18:01 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: Dmitry Chestnykh <dm.chestnykh@gmail.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
In-Reply-To: <mailman.3568.1725652770.183350.buildroot@buildroot.org>
References: <mailman.3568.1725652770.183350.buildroot@buildroot.org>
Message-ID: <e5a479301e9c68caf40f9d4f36831e98@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 1.0.5 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1725693482; bh=cP64k3lb7Fal0vBF9yxfaGR32MP5xjMWZlJDKvJPjCw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=px+DXCT7RK87IWWigie2EZbwnA3D6ecREZMN/XBvjiUUp9TDvqyL/iq1phNjdKMkk
 +hP26MLoy+NA8xrmRGEjKIa7vtHiVllep2XFZq7i/hCkQx0fKMc8PKLjoEpzb0GRZ3
 6YPZwMFHuL6vpb1Mkz5dSwVEqFls21Ek46uk8lYE=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=px+DXCT7
Subject: Re: [Buildroot] package/uclibc: fix ARC build with 4.x kernel
 headers
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
Cc: buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Dmitry, Thomas,

This looks like a regression, due to the merge of the next branch.

> commit: 
> https://git.buildroot.net/buildroot/commit/?id=25ef4c7d708b882d0433fe1e82ae470135479469
> branch: 
> https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Provide correct grouping for preprocessor conditions to avoid building
> ld.so with undefined macroses which are in use. This is a fix for
> package/uclibc/0002-Fix-compilation-with-4.x-kernel-headers.patch.
> 
> Signed-off-by: Dmitry Chestnykh <dm.chestnykh@gmail.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  ...004-Fix-arc-build-with-4.x-kernel-headers.patch | 35 
> ++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git 
> a/package/uclibc/0004-Fix-arc-build-with-4.x-kernel-headers.patch 
> b/package/uclibc/0004-Fix-arc-build-with-4.x-kernel-headers.patch

<...>

Patch 0004 breaks builds with the current version of uClibc:

>>> uclibc 1.0.50 Patching

Applying 0001-mips64-time64-for-n32-ABI-breaks-a-lot-of-tests-disa.patch 
using patch:
patching file extra/Configs/Config.in

Applying 0004-Fix-arc-build-with-4.x-kernel-headers.patch using patch:
patching file ldso/include/dl-syscall.h
Reversed (or previously applied) patch detected!  Skipping patch.
1 out of 1 hunk ignored -- saving rejects to file 
ldso/include/dl-syscall.h.rej
make[1]: *** [package/pkg-generic.mk:247: 
/home/data/alix.2/build/uclibc-1.0.50/.stamp_patched] Error 1
make: *** [Makefile:23: _all] Error 2

See also autobuild [1] from 2024-09-06 21:05:40

Kind regards,
Andreas

[1] http://autobuild.buildroot.net/?reason=uclibc-1.0.50
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

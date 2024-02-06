Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECB6FC48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 14:17:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F73C41ECE;
	Tue,  6 Feb 2024 14:17:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F73C41ECE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TnaM4ndaHmPC; Tue,  6 Feb 2024 14:17:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4BCA41EC0;
	Tue,  6 Feb 2024 14:17:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4BCA41EC0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B185F1BF576
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 14:17:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC6C882328
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 14:17:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5Wvt4YTgXnJI for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 14:17:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9FDF48231C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FDF48231C
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9FDF48231C
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 14:17:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EFE8A24000B;
 Tue,  6 Feb 2024 14:17:09 +0000 (UTC)
Date: Tue, 6 Feb 2024 15:17:09 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240206151709.61d8e308@windsurf>
In-Reply-To: <20240114174823.2732695-1-bernd@kuhls.net>
References: <20240114174823.2732695-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707229030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hJ0PpuIuNoVoqZ3nFZ1QVQt/XRp/zAYuioqQtvPr/78=;
 b=ZCRsqngIhQbLsChnCSkMwQoZWCxfYdcT2+1YWj3htTZdj/dMn3eP01O6xlOVMTDfWP5UsH
 0roGO/vzcOIztpPvY9ia/suyn1EVHEGSnYofKrZ+YiwwBC+JhIeWkUCgDd2jL1u5jNIkWo
 1tVgbD0Zt/IJ+GmxLf2UnQ8rEOvt8yTWEHS4c+mPrsoKGfV2vVCLLiY4CGAedRB/taX85v
 9EnWBMAWntKwo4/hKs2EZCyPsmjt2ezsLOQgT+o6tqoO1cU4ZtQ+uS4Q346bigIf7C0X2n
 Ii507IVELXAi4cIfzjzZaYOPiX7bf+mdE8T75Ues0V5CFbtXxm1kakDtfdhblQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZCRsqngI
Subject: Re: [Buildroot] [PATCH 1/2] package/kodi: needs host-cmake >= 3.26
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

On Sun, 14 Jan 2024 18:48:22 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fixes build error on Debian bookworm with
> 
> $ cmake --version
> cmake version 3.25.1
> 
> -- Found Python3: /home/buildroot/br2/output/per-package/kodi/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/python3.11
>  (found suitable exact version "3.11.6") found components: Development Development.Module Development.Embed
> -- Could NOT find Python3 (missing: Interpreter)
>     Reason given by package:
>         Interpreter: Cannot run the interpreter
>         "/home/buildroot/br2/output/per-package/kodi/host/x86_64-buildroot-linux-gnu/sysroot/usr/bin/python3"
> 
> CMake Error at cmake/scripts/common/Macros.cmake:432 (message):
>   PYTHON enabled but not found
> Call Stack (most recent call first):
>   CMakeLists.txt:214 (core_optional_dep)
> 
> -- Configuring incomplete, errors occurred!
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/kodi/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Since when does kodi needs host-cmake >= 3.26 ? Indeed, we need to
understand that so that we can understand if this patch needs to be
backported to one of the LTS/stable branches. Could you check this, and
submit an updated version that includes those details in the commit log.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

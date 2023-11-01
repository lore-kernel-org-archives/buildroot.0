Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F14C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 22:41:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AC7D4025A;
	Wed,  1 Nov 2023 22:41:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AC7D4025A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S9wOcy0VKn4A; Wed,  1 Nov 2023 22:41:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B425E402A8;
	Wed,  1 Nov 2023 22:41:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B425E402A8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5378E1BF2F1
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 22:41:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E0B64402A8
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 22:41:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0B64402A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wg3LLoFpXisW for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 22:41:01 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BBC5E4025A
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 22:41:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBC5E4025A
Received: by mail.gandi.net (Postfix) with ESMTPSA id 06344C0006;
 Wed,  1 Nov 2023 22:40:58 +0000 (UTC)
Date: Wed, 1 Nov 2023 23:40:57 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231101234057.5f792112@windsurf>
In-Reply-To: <20231015210027.1587075-1-fontaine.fabrice@gmail.com>
References: <20231015210027.1587075-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698878459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x8LDIaZM4hSOSnLSjQ2zszWGlN9Kt/64UvJcjnVsQ5E=;
 b=AwEw/T42Y69hbVAW9SEuXH3/OCPjs3IQcrZk1wauGIvDLXfCvWTZ/TAVi/j3yey8Wk/sVJ
 JM3fdCUo74OkO9GiRUYICe/zuy/GRDxmAAy8LipA5/xoHDPv+PtPYZnxteAnf3Fm718X4p
 E9O9jOCKkq853m/X3WMXxhsVZQbHmwhYVMi62GIo5NmAT+pJsSFJMMDryxb2pV+pjJ6tX9
 9SBKV27Z8YTFOrCkyAjLv/m4a2H4xEF5U700twZ/tD/zmSchpJA6L0IsFSwTgACXlCQRKF
 nSZXhpqxo0HncD8vMpuMp5PzN4JaFPAgVtDXT70gG7DhaeqRi/JxKu0xtyOddQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AwEw/T42
Subject: Re: [Buildroot] [PATCH 1/1] package/monit: fix build without SSP
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

On Sun, 15 Oct 2023 23:00:27 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix build without SSP raised since bump to version 5.33.0 in commit
> 8cedb39764f70f9d467bf0cc1acc99a8bbb963d6:
> 
> configure:10524: checking for pthread_create in -lpthread
> configure:10547: /home/thomas/autobuild/instance-1/output-1/host/bin/arceb-buildroot-linux-uclibc-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Ofast -g0  -static -Wextra -fstack-protector-all -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -static conftest.c -lpthread   >&5
> /home/thomas/autobuild/instance-1/output-1/host/lib/gcc/arceb-buildroot-linux-uclibc/10.2.0/../../../../arceb-buildroot-linux-uclibc/bin/ld: cannot find -lssp_nonshared
> 
> [...]
> 
> checking for pthread_create in -lpthread... no
> configure: error: POSIX thread library is required
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/ce0f9f62d60f801b03a079135941424ad147cf45
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/monit/monit.mk | 1 +
>  1 file changed, 1 insertion(+)

I've applied, because we do the same in other packages, but I'm not
sure that what we're doing is correct. Indeed, BR2_TOOLCHAIN_HAS_SPP
only says whether the toolchain has SSP support, not whether we want to
use as part of the Buildroot build, which is controlled by the
BR2_SSP_NONE, BR2_SSP_REGULAR, BR2_SSP_STRONG, BR2_SSP_ALL options. So
should we switch to looking at those options instead?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

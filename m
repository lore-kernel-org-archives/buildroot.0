Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 776ECC4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 21:20:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 106F860F11
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 21:20:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 106F860F11
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B7290400AE;
	Sun,  8 Aug 2021 21:20:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DbjfAuvw0dTj; Sun,  8 Aug 2021 21:20:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C09F140160;
	Sun,  8 Aug 2021 21:20:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9502E1BF42E
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 21:20:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 847BF4022D
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 21:20:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zeOlopWGRAPe for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 21:20:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 218C6402E7
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 21:20:40 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 8D05EFF805;
 Sun,  8 Aug 2021 21:20:37 +0000 (UTC)
Date: Sun, 8 Aug 2021 23:20:36 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210808232036.79122689@windsurf>
In-Reply-To: <20210807152847.225678-1-fontaine.fabrice@gmail.com>
References: <20210807152847.225678-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/bullet: fix musl build
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Sat,  7 Aug 2021 17:28:47 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure on musl raised since bump to version
> 3.0.9 in commit 28b4947ed8f53c4edfbf8fef9304dc76480c01ca:
> 
> In file included from /tmp/instance-5/output-1/build/bullet-3.09/src/LinearMath/btScalar.h:289,
>                  from /tmp/instance-5/output-1/build/bullet-3.09/src/LinearMath/btVector3.h:19,
>                  from /tmp/instance-5/output-1/build/bullet-3.09/src/LinearMath/btConvexHullComputer.h:18,
>                  from /tmp/instance-5/output-1/build/bullet-3.09/Extras/VHACD/src/VHACD.cpp:28:
> /tmp/instance-5/output-1/build/bullet-3.09/Extras/BulletRobotics/../../Extras/VHACD/inc/vhacdMutex.h: In constructor 'VHACD::Mutex::Mutex()':
> /tmp/instance-5/output-1/build/bullet-3.09/Extras/BulletRobotics/../../Extras/VHACD/inc/vhacdMutex.h:97:54: error: 'PTHREAD_MUTEX_RECURSIVE_NP' was not declared in this scope; did you mean 'PTHREAD_MUTEX_RECURSIVE'?
>    97 |   VHACD_VERIFY(pthread_mutexattr_settype(&mutexAttr, PTHREAD_MUTEX_RECURSIVE_NP) == 0);
>       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/79cd2024b3dfc8d3e896cdacf67fb891df81ca6e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...HACD-inc-vhacdMutex.h-fix-musl-build.patch | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 package/bullet/0001-Extras-VHACD-inc-vhacdMutex.h-fix-musl-build.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

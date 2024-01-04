Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 121B8C47073
	for <buildroot@archiver.kernel.org>; Thu,  4 Jan 2024 21:43:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC56B61B32;
	Thu,  4 Jan 2024 21:43:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC56B61B32
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cLIKZJRpkszS; Thu,  4 Jan 2024 21:43:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22BA0615F8;
	Thu,  4 Jan 2024 21:43:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22BA0615F8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 518211BF859
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 21:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1729742210
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 21:43:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1729742210
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iUH4F06OACPf for <buildroot@lists.busybox.net>;
 Thu,  4 Jan 2024 21:43:10 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DAC074221B
 for <buildroot@buildroot.org>; Thu,  4 Jan 2024 21:43:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DAC074221B
Received: by mail.gandi.net (Postfix) with ESMTPSA id D43321BF204;
 Thu,  4 Jan 2024 21:43:07 +0000 (UTC)
Date: Thu, 4 Jan 2024 22:43:07 +0100
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20240104224307.1b4a0be7@windsurf>
In-Reply-To: <20240104165634.1215451-1-peter@korsgaard.com>
References: <20240104165634.1215451-1-peter@korsgaard.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704404588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x3XLHSuDNOGJsR4UpmRg06pgJpVt20ytnKzIeXapENo=;
 b=aGU90HyibtsT+PxryvBkgRx32VH11its7D5UPEe5J9NuIf+xsfJS3YT1ZScQG6s54o+gzO
 rKIGoscu4rbUlpOLLoI52bDRRJXXv2i2LhucmHQ6nyJ1yxljWOOpl92l8S0h2eH6RIOsI+
 qRKVOdTqLPKuL7uwCeFz+SZm25wq88Rpv1yplSyx03V3cBbjmdp1x2+SUGjogB1YuhqAFl
 vzttf2tLdiQsmnAGAFTSNkJxc2/9QMKLT7Dsv8cz78VIgjXT2GznC6pGBl0KkraBOTTVLW
 v91m2caPsp8CXmpPqqOyalgXAE1+xSAyCzwvh53FmwV+NZC04FOpGUlxw8z2+w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aGU90Hyi
Subject: Re: [Buildroot] [PATCH] boot/arm-trusted-firmware: fix fiptool
 linking issue on hosts without openssl
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
Cc: Louis Chauvet <louis.chauvet@bootlin.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  4 Jan 2024 17:56:33 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/5834758777
> 
> Commit e7d16c35a (boot/arm-trusted-firmware: fix the RPATH of fiptool) tried
> to fix the build of host-fiptool, but forgot to pass HOST_CFLAGS.
> 
> On hosts without (compatible) openssl development headers, this breaks
> the build when it cannot find the openssl headers:
> 
> fiptool_platform.h:19:11: fatal error: openssl/sha.h: No such file or directory
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  boot/arm-trusted-firmware/arm-trusted-firmware.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks a lot for having cooked the patch! Applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

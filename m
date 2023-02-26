Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7891EC64ED6
	for <buildroot@archiver.kernel.org>; Sun, 26 Feb 2023 17:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E725B408B6;
	Sun, 26 Feb 2023 17:43:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E725B408B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QBHTEVjjJH_u; Sun, 26 Feb 2023 17:43:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3BD7E40547;
	Sun, 26 Feb 2023 17:43:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3BD7E40547
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DA4771BF59B
 for <buildroot@lists.busybox.net>; Sun, 26 Feb 2023 17:43:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BFF3C60E76
 for <buildroot@lists.busybox.net>; Sun, 26 Feb 2023 17:43:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFF3C60E76
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9hhcvIVesX-m for <buildroot@lists.busybox.net>;
 Sun, 26 Feb 2023 17:43:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA51260E6F
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EA51260E6F
 for <buildroot@buildroot.org>; Sun, 26 Feb 2023 17:43:37 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 68478FF803;
 Sun, 26 Feb 2023 17:43:34 +0000 (UTC)
Date: Sun, 26 Feb 2023 18:43:32 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230226184332.39c3a9b2@windsurf>
In-Reply-To: <20230225170229.358936-1-fontaine.fabrice@gmail.com>
References: <20230225170229.358936-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1677433414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wbRlo7eF5LRO6Fs4GfoWipXSCXuIdM7/savzEpWDk24=;
 b=XwPKVaLK6d7QtbMl1cHm7xCqffFYHTxryEmXj/hLnavtXhUHeCIWf49Hg3xQoBbigvFaG0
 NlKP6Tr0MbBQOoNph0/E615Wr4ShB1rOhRZSHk4jLtW54HhPBC8cPBxzk8RLx+PpgUIgWy
 +j/sXVjZ3U1CEJFcMpfoiR2n9d9PxLOovApcLE9ShYDStBOjmz+XkXLU9t3iWoRzARCHq2
 QYCCj37EfaxNeHYPV+jNIAhCs5/YNppuVKlyirJ5NY/rgwQurvjlEFU1Acp4Ap8gVnximw
 u1lL1emuzWKtNhWQaZ89XmOft1XPKTqfzltWnCEXsqrqZw7FrssvnlJCSbU6wg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XwPKVaLK
Subject: Re: [Buildroot] [PATCH 1/1] linux: fix CIP RT kernel on microblaze
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

On Sat, 25 Feb 2023 18:02:29 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> diff --git a/linux/linux.mk b/linux/linux.mk
> index 7645b5f507..f3fdc40328 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -33,6 +33,7 @@ LINUX_SITE_METHOD = svn
>  else ifeq ($(BR2_LINUX_KERNEL_LATEST_CIP_VERSION)$(BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION),y)
>  LINUX_SOURCE = linux-cip-$(LINUX_VERSION).tar.gz
>  LINUX_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git/snapshot
> +LINUX_PATCHES += linux/cip-rt/0001-arch-microblaze-mm-init.c-fix-build.patch

Why not put the patch in linux/5.10.162-cip24-rt10/ directly? This way
it would automatically be applied, with the need to tweak LINUX_PATCHES.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

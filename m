Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11168C433F5
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 07:57:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C61AB61095;
	Thu, 27 Jan 2022 07:57:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4xBUXMl5GLao; Thu, 27 Jan 2022 07:57:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A62A6103F;
	Thu, 27 Jan 2022 07:57:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 621701BF470
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 07:57:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4FC0084E84
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 07:57:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w56RPK7JVfN7 for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 07:57:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2B96084E83
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 07:57:08 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B2FF4E0002;
 Thu, 27 Jan 2022 07:57:05 +0000 (UTC)
Date: Thu, 27 Jan 2022 08:57:04 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Christian Stewart <christian@paral.in>
Message-ID: <20220127085704.2192a320@windsurf>
In-Reply-To: <20220127062504.1835450-1-christian@paral.in>
References: <20220127062504.1835450-1-christian@paral.in>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3 1/2] package/runc: add host package
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Wed, 26 Jan 2022 22:25:03 -0800
Christian Stewart <christian@paral.in> wrote:

> diff --git a/package/runc/runc.mk b/package/runc/runc.mk
> index c4e45a00a9..932bf39eea 100644
> --- a/package/runc/runc.mk
> +++ b/package/runc/runc.mk
> @@ -10,6 +10,8 @@ RUNC_LICENSE = Apache-2.0
>  RUNC_LICENSE_FILES = LICENSE
>  RUNC_CPE_ID_VENDOR = linuxfoundation
>  
> +RUNC_GOMOD = github.com/opencontainers/runc

How is this related to  the addition of the host package? This seems
unrelated. Why is this needed now?

> +HOST_RUNC_BIN_NAME = runc

Why is this not needed for the target package ?

> +HOST_RUNC_LDFLAGS = $(RUNC_LDFLAGS)
> +HOST_RUNC_TAGS = $(RUNC_TAGS)
> +HOST_RUNC_INSTALL_BINS = $(HOST_RUNC_BIN_NAME)

This makes me think we should probably have some inheritance of those
variables between the target variant and the host variant of the
package.

However, HOST_RUNC_TAGS = $(RUNC_TAGS) looks most likely wrong. Indeed:

ifeq ($(BR2_PACKAGE_LIBAPPARMOR),y)
RUNC_DEPENDENCIES += libapparmor
RUNC_TAGS += apparmor
endif

ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
RUNC_TAGS += seccomp
RUNC_DEPENDENCIES += libseccomp host-pkgconf
endif

and you most likely don't want HOST_RUNC_TAGS to contain apparmor or
seccomp, because we are not building libseccomp or libapparmor for the
host.

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

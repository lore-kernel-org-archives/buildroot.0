Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BBE1C433EF
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 08:01:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 230A340B6B;
	Thu, 27 Jan 2022 08:01:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M_VDMj-Y7Bz3; Thu, 27 Jan 2022 08:01:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 090B740B52;
	Thu, 27 Jan 2022 08:01:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3B5C11BF470
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 08:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 273D784E84
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 08:01:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KEI0ipoM-fL5 for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 08:01:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EC0C384E6E
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 08:01:43 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 128C9240015;
 Thu, 27 Jan 2022 08:01:41 +0000 (UTC)
Date: Thu, 27 Jan 2022 09:01:41 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Christian Stewart <christian@paral.in>
Message-ID: <20220127090141.7d0645f2@windsurf>
In-Reply-To: <20220127062504.1835450-2-christian@paral.in>
References: <20220127062504.1835450-1-christian@paral.in>
 <20220127062504.1835450-2-christian@paral.in>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3 2/2] package/buildah: new package
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

On Wed, 26 Jan 2022 22:25:04 -0800
Christian Stewart <christian@paral.in> wrote:


> v1 -> v2:
> 
>  - add package to developers
>  - add host runc dependency for host package
>  - add libgpgme runtime dependency

Considering that there are runtime dependency concerns, it would be
nice to have a simple test case in support/testing/.


> diff --git a/package/buildah/buildah.hash b/package/buildah/buildah.hash
> new file mode 100644
> index 0000000000..c7e00d02a7
> --- /dev/null
> +++ b/package/buildah/buildah.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256  d99b5187a25bc9d7385408732a0e155df0458b4d2cea6e8d002f3fa2cbaac76f  buildah-1.24.0.tar.gz
> +sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE
> diff --git a/package/buildah/buildah.mk b/package/buildah/buildah.mk
> new file mode 100644
> index 0000000000..658d7ef56f
> --- /dev/null
> +++ b/package/buildah/buildah.mk
> @@ -0,0 +1,46 @@
> +################################################################################
> +#
> +# buildah
> +#
> +################################################################################
> +
> +BUILDAH_VERSION = 1.24.0
> +BUILDAH_SITE = $(call github,containers,buildah,v$(BUILDAH_VERSION))
> +
> +BUILDAH_LICENSE = Apache-2.0
> +BUILDAH_LICENSE_FILES = LICENSE
> +
> +BUILDAH_DEPENDENCIES = libgpgme

Is libgpgme really a runtime dependency, as noted in your changelog? If
it is, then it's not needed in BUILDAH_DEPENDENCIES. However, it would
be somewhat surprising for it to be only a runtime dependency. Could
you confirm? Does it get dlopen()ed at runtime? Or it's not the library
that is used at runtime, but some program that is installed by libgpgme?


> +define BUILDAH_INSTALL_CONFIG
> +	$(INSTALL) -D -m 644 $(@D)/contrib/buildroot/policy.json \
> +		$(TARGET_DIR)/etc/containers/policy.json
> +endef
> +
> +BUILDAH_POST_INSTALL_TARGET_HOOKS += BUILDAH_INSTALL_CONFIG
> +
> +HOST_BUILDAH_BUILD_TARGETS = $(BUILDAH_BUILD_TARGETS)
> +HOST_BUILDAH_TAGS = $(BUILDAH_TAGS)
> +HOST_BUILDAH_LDFLAGS = $(BUILDAH_LDFLAGS)
> +HOST_BUILDAH_INSTALL_BINS = $(BUILDAH_INSTALL_BINS)

That "repetition" also makes me think we should have some level of
inheritance between target and host variables in the golang-package
infrastructure. For BUILD_TARGETS, TAGS and INSTALL_BINS, it sounds
fine to do it. However, for LDFLAGS, it's a bit weird, as normally,
LDFLAGS are different between host and target. However here, there are
mostly used to pass these version-related -X options, that are in fact
the same between host and target. Should we have a separate variable to
pass those flags ? Not sure.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

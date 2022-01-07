Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BDB9C433EF
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 17:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E550041551;
	Fri,  7 Jan 2022 17:57:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HWKiGGo7MZU6; Fri,  7 Jan 2022 17:57:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E959410D1;
	Fri,  7 Jan 2022 17:57:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DBECA1BF35F
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 17:57:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D8F25410D1
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 17:57:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l1YVK1henaqn for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 17:57:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D46D1410C8
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 17:57:18 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 2071CC0004;
 Fri,  7 Jan 2022 17:57:15 +0000 (UTC)
Date: Fri, 7 Jan 2022 18:57:13 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>, Buildroot List
 <buildroot@buildroot.org>
Message-ID: <20220107185713.7b1d5224@windsurf>
In-Reply-To: <20220107171318.1423075-4-thomas.petazzoni@bootlin.com>
References: <20220107171318.1423075-1-thomas.petazzoni@bootlin.com>
 <20220107171318.1423075-4-thomas.petazzoni@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 3/7] package/rustc: fix
 BR2_PACKAGE_HOST_RUSTC_ARCH for ARMv5
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri,  7 Jan 2022 18:13:13 +0100
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> BR2_PACKAGE_HOST_RUSTC_ARCH only had a special value for
> BR2_ARM_CPU_ARMV7A, but it also needs a special value for
> BR2_ARM_CPU_ARMV5, as the pre-compiled Rust standard library for
> ARMv5TE is identified with the "armv5te" architecture name, see
> https://doc.rust-lang.org/nightly/rustc/platform-support.html.
> 
> We noticed this because Rust binaries wouldn't work on an ARMv5
> platform (Illegal instruction). This was due to the usage of the
> arm-unknown-linux-gnueabi variant of the Rust standard library, which
> is for ARMv6. Thanks to this commit, we correctly use the
> armv5te-unknown-linux-gnueabi variant, and Rust binaries work properly
> on ARMv5TE.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/rustc/Config.in.host | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
> index 90ea56f626..05324ad755 100644
> --- a/package/rustc/Config.in.host
> +++ b/package/rustc/Config.in.host
> @@ -102,6 +102,7 @@ config BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
>  
>  config BR2_PACKAGE_HOST_RUSTC_ARCH
>  	string
> +	default "armv5te" if BR2_ARM_CPU_ARMV5
>  	default "armv7"  if BR2_ARM_CPU_ARMV7A
>  	default BR2_ARCH if !BR2_ARM_CPU_ARMV7A

I need to drop the "if !BR2_ARM_CPU_ARMV7A" here. Will do in the next
iteration, or can be done when applying if there are no other comments.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

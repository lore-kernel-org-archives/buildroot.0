Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 776D3C38A2D
	for <buildroot@archiver.kernel.org>; Wed, 26 Oct 2022 20:15:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7F608129F;
	Wed, 26 Oct 2022 20:15:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7F608129F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8fOOHGgZQPFT; Wed, 26 Oct 2022 20:15:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1537D8126C;
	Wed, 26 Oct 2022 20:15:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1537D8126C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5E04D1BF2C2
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 20:15:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 242EC60B99
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 20:15:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 242EC60B99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mYZN-Q00P1er for <buildroot@lists.busybox.net>;
 Wed, 26 Oct 2022 20:15:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB193605A5
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CB193605A5
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 20:15:31 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A8A451BF203;
 Wed, 26 Oct 2022 20:15:29 +0000 (UTC)
Date: Wed, 26 Oct 2022 22:15:28 +0200
To: Tobias Waldekranz <tobias@waldekranz.com>
Message-ID: <20221026221528.393a1d39@windsurf>
In-Reply-To: <20221020141412.346992-4-tobias@waldekranz.com>
References: <20221020141412.346992-1-tobias@waldekranz.com>
 <20221020141412.346992-4-tobias@waldekranz.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666815330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3f7HMRT80LJRMqUhGcDG9tXAkOd2lAfHwjQhK7ZUuXY=;
 b=jDHgKgK86KWZuB3U8mfdmJdOl/GhEKYXmWRqS5w1oK+UJQYSFyNxaCNauDXilXhSF286h9
 WLmic9lDbw45co3D6FWVgV+hy3ew0jrSEKFr9Yixau/BhAK+oeiBG7tuJHKWg2r1GK/Pma
 +CzjJNRvcT55oExAH2kgPxfZRcjRsvexecRYS5BQDfQmcMbOYbwN/s3hdXlqBYgf+FmiPX
 cEGRutQmvQOoPsGePKqVXJU4TRLTkkiZuyz3efwZue2itIc0SDKwGs1sPf+S7ApgWgrNes
 0Rsm2AoSYOJ8JRArRdN2y9TQK4bFF1pyq84/5goK+Sv69YPFszghZfuIrRj/xw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jDHgKgK8
Subject: Re: [Buildroot] [PATCH 3/4] package/libbpf: extract dependencies to
 separate kconfig symbol
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Tobias,

On Thu, 20 Oct 2022 16:14:11 +0200
Tobias Waldekranz <tobias@waldekranz.com> wrote:

> This makes it obvious that the comment is just the negation of the
> dependency requirements. It also makes it easier for other packages to
> depend on libbpf.
> 
> Signed-off-by: Tobias Waldekranz <tobias@waldekranz.com>
> ---
>  package/libbpf/Config.in | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/package/libbpf/Config.in b/package/libbpf/Config.in
> index 1465366c9e..7e816c193d 100644
> --- a/package/libbpf/Config.in
> +++ b/package/libbpf/Config.in
> @@ -1,11 +1,16 @@
> -config BR2_PACKAGE_LIBBPF
> -	bool "libbpf"
> +config BR2_PACKAGE_LIBBPF_SUPPORTED
> +	bool
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on BR2_USE_WCHAR # elfutils
>  	depends on !BR2_STATIC_LIBS # elfutils
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # elfutils
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13
>  	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils

I'm afraid, but we don't do this in Buildroot, in none of our packages.
I think our rationale is that by duplicating these dependencies, it is
easier to maintain the Config.in comment in the packages that select
BR2_PACKAGE_LIBBPF.

I agree it's a very arbitrary choice, but we really strongly want
things to be consistent between all Buildroot packages, so we cannot
change this for just one package. If we want to change this, it needs
to be discussed (advantages vs. drawbacks), then the documentation
needs to be updated, and all packages changed.

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

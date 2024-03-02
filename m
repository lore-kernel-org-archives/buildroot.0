Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93364C54798
	for <buildroot@archiver.kernel.org>; Sat,  2 Mar 2024 17:10:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B9FA40190;
	Sat,  2 Mar 2024 17:10:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fQm3CsXpfSBR; Sat,  2 Mar 2024 17:10:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA1F4403C4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA1F4403C4;
	Sat,  2 Mar 2024 17:10:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C0D5F1BF34C
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 17:10:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF2F941857
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 17:10:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GPNbYEAZ4gg6 for <buildroot@lists.busybox.net>;
 Sat,  2 Mar 2024 17:10:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 90D5E417F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90D5E417F2
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 90D5E417F2
 for <buildroot@buildroot.org>; Sat,  2 Mar 2024 17:10:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CB1531BF204;
 Sat,  2 Mar 2024 17:10:20 +0000 (UTC)
Date: Sat, 2 Mar 2024 18:10:19 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20240302181019.43115635@windsurf>
In-Reply-To: <20240226205446.842600-4-adam.duskett@amarulasolutions.com>
References: <20240226205446.842600-1-adam.duskett@amarulasolutions.com>
 <20240226205446.842600-4-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1709399420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7X8JrdRJvGM0MNgX1xFCxNZgEvGwI40j5fC5AlVuhak=;
 b=STfLNpibYyITFvmd+FoLx4JiwCYTwbvoPtkNh03e0+BOUVaMFsiBAqiHPtr5dmM3Mq2Bfr
 r0gbGrqUwZp4/KnAKuSyNW1mA2lXIUmEedwWTlOWVoM7YLDhBbX4DGCeo1tnnEAMtg0QXr
 W5wSfSw/zbAXLnc6T6hQkB8DBiVpy/kVMy+N1YBuE0c/clYSpnOp3SeycBGqtyobcQvJM7
 mFl4MtvhEoe5lRq7gkcmuvYGDL3QxcClepfLO2J6ayJB3Qt1Q5PNLXfCEWa5OBnOtMz9Ei
 DSN0VDuCO2F1yrZ6xybQoIRVpMqS5kEKWBGJ8YgXp1DTjFV56x5xCxd/FQhVIQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=STfLNpib
Subject: Re: [Buildroot] [PATCH 4/9] package/policycoreutils: bump version
 to 3.6
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

Hello Adam,

On Mon, 26 Feb 2024 13:54:40 -0700
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

> setsebool/Makefile now unconditionally links against libsepol.
> As such, it is now a new dependency.
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

Some minor nit I would have fixed myself when applying, but since a v2
will be needed due to the PATCH 3/9 issue, here is a very minor comment.

> ---
>  package/policycoreutils/Config.in            | 1 +
>  package/policycoreutils/policycoreutils.hash | 2 +-
>  package/policycoreutils/policycoreutils.mk   | 4 ++--
>  3 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/package/policycoreutils/Config.in b/package/policycoreutils/Config.in
> index 3201c8fede..46a367129a 100644
> --- a/package/policycoreutils/Config.in
> +++ b/package/policycoreutils/Config.in
> @@ -10,6 +10,7 @@ config BR2_PACKAGE_POLICYCOREUTILS
>  	depends on !BR2_STATIC_LIBS # libsemanage
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # libsemanage -> libselinux -> libsepol
>  	select BR2_PACKAGE_LIBSEMANAGE
> +	select BR2_PACKAGE_LIBSEPOL

Would be nice to update the depends on comments:

        depends on BR2_TOOLCHAIN_HAS_THREADS # libsemanage, libsepol
        depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # libsemanage, libsepol

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

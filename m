Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBCC5E7FDF2
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 22:16:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E799830E6;
	Mon,  2 Feb 2026 22:16:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MjFwvvNmmLiL; Mon,  2 Feb 2026 22:16:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8883C83145
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770070610;
	bh=tlXsIuRryw0OG5SKzU4M0yNlbpl35wGjWYL0OQRByBY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZaBZd6P4r6ZaeEypUW4+e36QY4FuoQoI9c2HYCpnrbVmAFHUoyV2MQmc3te+Xn7m4
	 aLm5nRQidttpWZy0FOyG6HgMPGnrO9PyV8WxHHaitrmJZNra2a/e+kY1X/PZpFF717
	 Y0EacMD7klZicClw3snG4XshtCdS4EFjqLFBuKf78nq1zJsCel/GUiV5pQzJjQUJvr
	 E0KiXuNsE7R63/GmpMBhJwImjoL6NIdrrc/XlDI6ff+v6TDCxmwNJRY6xjhuanF/u9
	 Kp9YjwYsmIc4BxWQTaJQplScVxC0qvEJ/TOMYZDY0FQ2tTJfcsc+wMLDoCJRmu761p
	 lAV2Hq9eCnozg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8883C83145;
	Mon,  2 Feb 2026 22:16:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CE36DF4
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 22:16:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB916607AB
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 22:16:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7ZkQcZkq3QQm for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 22:16:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A90576078E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A90576078E
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A90576078E
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 22:16:48 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id BCC3B4E423CE
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 22:16:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 929DD60767;
 Mon,  2 Feb 2026 22:16:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C970B119A8888; Mon,  2 Feb 2026 23:16:45 +0100 (CET)
Date: Mon, 2 Feb 2026 23:16:45 +0100
To: Michael Nosthoff <buildroot@heine.tech>
Cc: buildroot@buildroot.org, Robert Rose <robertroyrose@gmail.com>
Message-ID: <aYEiG9RbjhMkBQ8y@windsurf>
References: <20260107140858.129302-1-buildroot@heine.tech>
 <20260107140858.129302-3-buildroot@heine.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260107140858.129302-3-buildroot@heine.tech>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770070606; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=n+iqFwcfqGps9rhdL732HVPeZlxWSKVVVd5j8e80r6o=;
 b=hbM/2fO1qNl0wBGT/r1L3tR5MG9IK6c3iLTfl4houZqH1Nh2iH3KnpDhKvmhojK6z3kWRq
 RmBC/5n7dINdKT4LOc/MqdSeRco2UXp+9ICwnc+mupuonjHgclL1ZT7orYVgOP4EfNh2ns
 Yn6jrYMWswWdMpCIdYgje/5dDBhnL3BbSyVsnHztwYoN4u3SHaZSox5JIg4d1+uGJ5X9R+
 +BxkfUIVrzSdFi2BEODAjbMWUBu52pt2P4YV+hHItOUjT9SU8KuWbrlLkg/j8XMyYthh82
 wTWOEh3mG3NGnyDtYrpwkYiz8OYjmlYatdBmNGlhG+9IpSmAgbsoeUfCVc+e+w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=hbM/2fO1
Subject: Re: [Buildroot] [PATCH v2 3/3] package/grpc: bump to version 1.76.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Wed, Jan 07, 2026 at 03:08:47PM +0100, Michael Nosthoff via buildroot wrote:
> - use new flag gRPC_DOWNLOAD_ARCHIVES=OFF which removed the need for patch 003
> - re-allign patches
> - update 0002 to properly apply and re-enable utf8_range_lib as its linked
>   against grpc_plugin_support
> 
> Release Notes since 1.66:
> https://github.com/grpc/grpc/releases/tag/v1.67.0
> https://github.com/grpc/grpc/releases/tag/v1.68.0
> https://github.com/grpc/grpc/releases/tag/v1.69.0
> https://github.com/grpc/grpc/releases/tag/v1.70.0
> https://github.com/grpc/grpc/releases/tag/v1.71.0
> https://github.com/grpc/grpc/releases/tag/v1.72.0
> https://github.com/grpc/grpc/releases/tag/v1.73.0
> https://github.com/grpc/grpc/releases/tag/v1.74.0
> https://github.com/grpc/grpc/releases/tag/v1.75.0
> https://github.com/grpc/grpc/releases/tag/v1.76.0
> 
> Fixes: 2d19a0b332dc17c18533b "package/{python-}protobuf: bump to version 33.2"
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> 
> --
> 
> V2: added "Fixes" part
> 
> The protobuf bump to 33.2 was initially contained in this series. Another
> standalone patch was then applied in commit 2d19a0b332dc17c18533b instead.
> Which broke the build of grpc 1.66.1 which relies on an older protobuf
> version.
> This can be observed with this defconfig:
> 
> BR2_arm=y
> BR2_cortex_a53=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> BR2_PACKAGE_COLLECTD=y
> BR2_PACKAGE_COLLECTD_GRPC=y

I moved a bunch of this explanation in the commit message itself, as
it was useful. Also, I've added a reference to the autobuilder failure
that this bump is fixing. And of course, I applied to master.

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

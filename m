Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84709C5AD5A
	for <buildroot@archiver.kernel.org>; Sat, 15 Aug 2026 16:20:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EC6E6069D;
	Sat, 15 Aug 2026 16:20:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3T8UFPtohwHz; Sat, 15 Aug 2026 16:20:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4522F60642
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786810841;
	bh=xFhf3l8vJ2rSlkKh2TnmVeJNmMkgEp2jxJum7IPt/Sw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ET2wTQrfx4k8+lffEysalxrTNCOeS+wss/vF2XefExGjQjTPt+tZzWBKqRoqvyKj3
	 EH4nGAtZtMwTTCPd2wHuC2elDywh6OF0SjLsCgI/iAva58dR8dIHuJpCVD9KlGbpqK
	 21mfzRRPT9WxY5rBnXNJpLXQnM+kVdbb1c6anNDeC8vEpCmBNU0UYywspvjBLcPmD0
	 gKVVBLLAihFPM9fk8l6YUr/lcJLxYDPpCl31BlLL8U8sbA3UQb/jYwfkLmNjjeu7mb
	 D0fs+Lr/oQf7JHfyHXZbvTAEhL5/47tn/RnNUOAcVD56RdvUwStnXLV1bA38KLuta7
	 zLjUeoInnejUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4522F60642;
	Sat, 15 Aug 2026 16:20:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A7351392
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 16:20:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D85280E85
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 16:20:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bLA4pfT1eihr for <buildroot@buildroot.org>;
 Sat, 15 Aug 2026 16:20:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9562880E83
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9562880E83
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9562880E83
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 16:20:38 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 8B8FEB00548;
 Sat, 15 Aug 2026 18:20:32 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 15 Aug 2026 18:20:32 +0200
MIME-Version: 1.0
Date: Sat, 15 Aug 2026 18:20:32 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>, Romain
 Naour <romain.naour@gmail.com>
In-Reply-To: <20260813213348.3653337-1-bernd@kuhls.net>
References: <20260813213348.3653337-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <4d418157821acb30cac8d2f54721dae7@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/mesa3d: Fix build with ARM
 soft-float
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 13/08/2026 23:33, Bernd Kuhls wrote:
> Buildroot commit 4ab91a29d8931105d3ff8f6263c59a5438ada1a1 bumped the
> package to version 26.1.3 which first included upstream commit
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/94a6274275e6a16255357579898b366f858e270c
> 
> causing a build error with this defconfig
> 
> BR2_arm=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_UCLIBC_STABLE=y
> BR2_PER_PACKAGE_DIRECTORIES=y
> BR2_PACKAGE_MESA3D=y
> BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=y
> BR2_PACKAGE_MESA3D_OPENGL_GLX=y
> BR2_PACKAGE_XORG7=y
> 
> Add a patch to disable some assembler intructions which are not
> available with a toolchain configure for soft-float.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

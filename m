Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E31C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 20:43:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEDA840C5B;
	Fri, 12 Jul 2024 20:43:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CWJO06o7Frfs; Fri, 12 Jul 2024 20:43:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF43A410BE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF43A410BE;
	Fri, 12 Jul 2024 20:43:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9222A1BF420
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:43:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 88A80410B1
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:43:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VM2k3lMIcYnm for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 20:43:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 07A23409EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07A23409EE
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 07A23409EE
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 20:43:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1461560002;
 Fri, 12 Jul 2024 20:43:45 +0000 (UTC)
Date: Fri, 12 Jul 2024 22:43:45 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240712224345.2c9dd1b3@windsurf>
In-Reply-To: <20240712183931.245991-1-ju.o@free.fr>
References: <20240712183931.245991-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720817026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PkQNwZ4LCbfiVOPBaG2wga9lGKxiPo9E2SkYhn87lJQ=;
 b=XvTdPiqhBDIpwiYaZOVRcJ11bQZUWVDkm4FjiIEuLW+rrg6JbAzB1ltUhlyEaZ6aaDANn2
 oGgE4+XC+RU4R0vyuQs7IuL4W4ooSQJrU3KDz+qOekVWsxIAo7/xGkka1IoV4Gb1wlA8A/
 oSdRrXYPUiX3rW6ANVTtgoWIJZvSDQJuqXvxfHDTdEUzVX30m7zJvob4IHxwm1Q1G5lXT3
 joQe9xpbVxUTChAQpsmdBhGITM/9NMdpMIsZKzpbnC174Pld2BJqv/qBgnxJ5XshNt5jDJ
 wggMYBqlWmgwQJuJRNklN8R1aiVkzuitnmLt7cqcd6ngJ6A74urEPmgeyoSK/w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XvTdPiqh
Subject: Re: [Buildroot] [PATCH 1/1] configs/spike_riscv64: bump kernel to
 6.6.35 and add hashes
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

On Fri, 12 Jul 2024 20:39:31 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Commit [1] introduced a new spike_riscv32_defconfig with Kernel
> at v6.6.35.
> 
> This commit bumps the Kernel of spike_riscv64_defconfig to have it
> aligned with its 32bit counterpart.
> 
> This commit also adds custom hashes. Therefore, it adds
> BR2_DOWNLOAD_FORCE_CHECK_HASHES=y in the defconfig, adds a global
> patch directory, and removes the entry in ".checkpackageignore".
> 
> Finally, to completely align with the spike_riscv32_defconfig, the
> config directive BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM is moved by few
> lines.
> 
> With this commit, the maintenance of the two spike_riscv{32,64}
> defconfigs will be easier.
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/a83ab3f4c8621dec58dc78a8dcb48e519377ac3d
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  .checkpackageignore                                         | 1 -
>  .../spike/riscv64/patches/linux-headers/linux-headers.hash  | 1 +
>  board/spike/riscv64/patches/linux/linux.hash                | 2 ++
>  board/spike/riscv64/patches/opensbi/opensbi.hash            | 2 ++
>  configs/spike_riscv64_defconfig                             | 6 ++++--
>  5 files changed, 9 insertions(+), 3 deletions(-)
>  create mode 120000 board/spike/riscv64/patches/linux-headers/linux-headers.hash
>  create mode 100644 board/spike/riscv64/patches/linux/linux.hash
>  create mode 100644 board/spike/riscv64/patches/opensbi/opensbi.hash

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

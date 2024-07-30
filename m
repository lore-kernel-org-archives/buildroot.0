Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F84FC3DA49
	for <buildroot@archiver.kernel.org>; Tue, 30 Jul 2024 20:16:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0752780E4C;
	Tue, 30 Jul 2024 20:16:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aOdq4c1bhAfA; Tue, 30 Jul 2024 20:16:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE20380E55
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE20380E55;
	Tue, 30 Jul 2024 20:16:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6C4611BF423
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 20:16:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 66328403FC
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 20:16:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VwyU3RauI8H2 for <buildroot@lists.busybox.net>;
 Tue, 30 Jul 2024 20:16:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E5F9A40280
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5F9A40280
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E5F9A40280
 for <buildroot@buildroot.org>; Tue, 30 Jul 2024 20:16:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3F8871C0002;
 Tue, 30 Jul 2024 20:16:31 +0000 (UTC)
Date: Tue, 30 Jul 2024 22:16:30 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240730221630.7595f673@windsurf>
In-Reply-To: <Zqcf31ivOCwqs+01@waldemar-brodkorb.de>
References: <20240728115817.743185-1-dm.chestnykh@gmail.com>
 <20240728180047.38c594f2@windsurf>
 <CA+RUeSqWVBsZYMV1S_2eDnLbEJY6E7o4aqDQjd9j=puoSs0cfQ@mail.gmail.com>
 <20240728221140.01aa7ed1@windsurf>
 <Zqcf31ivOCwqs+01@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722370591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9oxnL/p/mNNyO5cKbu02l+nSEBvhktAZpdeuMYi8THQ=;
 b=OA3j+Uore/otCcYydvUOQb90ATQVz0KqOO4LpdmaXprkOxLVg7FRuK7OKR1C3WdwfkMyHn
 h3T/EBIpErbq8tg3MwAHupLGgSvBRIjOGXl1E85M+c4fyh3yH/351J45kJ6DXMiAa/FpYe
 ojM0yCWXritQrhB9GVbN66lSikotlbIrZf20/r1kOgHTorySVNHx3Po+vxJd16CBW5U4Q0
 CMtAKoZKsNLG5sdUKpOi6mw1yYlUNpZbAkFYfY8wMiHNxqj3zmkKovDN0VuOKJhmWljC/G
 VQTTo5Jip8SNL39JrHq1Z25KtcmUGkdm7JjDb16ja7hSkouzwWf2ZlhNDrt7pw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OA3j+Uor
Subject: Re: [Buildroot] [PATCH] package/uclibc: Fix ARC build with 4.x
 kernel headers
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
Cc: buildroot@buildroot.org, Dmitriy Chestnykh <dm.chestnykh@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Waldemar,

On Mon, 29 Jul 2024 06:51:43 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> That is strange. I cloned buildroot-toolchains, 
> make qemu_sh4_r2d_defconfig && make

Indeed, I agree as well.

> For me it works with the included Qemu 9.0.0.
> Strange thing is my zImage is smaller then the artefact which can be
> downloaded and did not work.
> 
> $ ls -l Downloads/zImage 
>   -rw-r--r-- 1 6037536 Jul 29 06:06 Downloads/zImage
> $ ls -l buildroot-toolchains/output/images/zImage 
>   -rw-r--r-- 1 4530208 Jul 29 05:57 buildroot-toolchains/output/images/zImage
> 
> Are the toolchain checks are running some tests inside the image?

You probably built "just" qemu_sh4_r2d_defconfig, but the toolchains we
built are more featureful: they have C++ support, Fortran support,
OpenMP support. This means additional GCC runtime libraries installed
in /lib, and therefore a bigger rootfs, which in the SH4 defconfigs is
built into zImage as an initramfs. So not too surprising to have a
bigger zImage.

The SH4 glibc stable toolchain is built using this configuration:

BR2_sh=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_PACKAGE_GLIBC_KERNEL_COMPAT=y
BR2_KERNEL_HEADERS_4_19=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_TOOLCHAIN_BUILDROOT_FORTRAN=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
# BR2_TARGET_ROOTFS_TAR is not set
BR2_PACKAGE_HOST_GDB=y
BR2_PACKAGE_HOST_GDB_TUI=y
BR2_PACKAGE_HOST_GDB_PYTHON3=y
BR2_PACKAGE_GDB=y
BR2_GCC_ENABLE_OPENMP=y

So I am right building the concatenation of this +
qemu_sh4_r2d_defconfig to see what is the result.

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

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F53C10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 15:57:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6BF683C72;
	Thu,  9 May 2024 15:57:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id loh_EKZO-g4D; Thu,  9 May 2024 15:57:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B47BE83E48
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B47BE83E48;
	Thu,  9 May 2024 15:57:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 61CF41BF39C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 15:57:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F50E606C2
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 15:57:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8wt4xBM5fUK2 for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 15:57:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E591F60692
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E591F60692
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E591F60692
 for <buildroot@buildroot.org>; Thu,  9 May 2024 15:57:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1D929FF802;
 Thu,  9 May 2024 15:57:07 +0000 (UTC)
Date: Thu, 9 May 2024 17:57:06 +0200
To: Charles Hardin <ckhardin@gmail.com>
Message-ID: <20240509175706.6b757c5d@windsurf>
In-Reply-To: <20240417181322.36344-2-ckhardin@gmail.com>
References: <20240417181322.36344-1-ckhardin@gmail.com>
 <20240417181322.36344-2-ckhardin@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715270227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2hSnSG+AsXssV6B40mkily9AMoFI7FaXYNbt4CBFIqE=;
 b=NTqE3mLR8zQMDA4wN+cDygw3mHnDnoICOaTd+/QK346KL8PbVFED8KnRDp+mewTwkz3GLS
 HPgCewzsxk7RNZjcQRGZrMvLUfw1nPAII0j9aMjN1VEGYFSmQXyF25bH+GazbwcFaeFTau
 pM2r+nn1xN9/HZDZtPcWewIZWsrslt0kxpuNr64/Q35xzN6Oq8x/5MTTNIy4XXGI6SCG7T
 Pwej1sJE0gOChUH/SZAV+x0cNHcA7d3zTkAadaxRPbKDGcYrBcJeEyiFJgNfLxww4ADCYX
 6BPPg3c7Ai2QRT0GJzPP0KnfTC6K5+/EhZHqFr4UL0YZNvJNwxyBaGP/86cUAA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NTqE3mLR
Subject: Re: [Buildroot] [PATCH 1/1] package/gst1-plugins-good: add qt5tools
 as a dependency
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
Cc: Jens Zettelmeyer <zettelmeyerj@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Charles,

On Wed, 17 Apr 2024 11:13:22 -0700
Charles Hardin <ckhardin@gmail.com> wrote:

> During a configuration with per-package, seeing the following
> meson build error which is resolved when the qt5tools are
> declared explicitly as a dependency.
> 
>     build/gst1-plugins-good-1.22.9/ext/qt/meson.build:48:4: \
>       ERROR: Problem encountered: qt5 qmlglsink plugin is enabled, \
>       but qt specific tools were not found
> 
> Signed-off-by: Charles Hardin <ckhardin@gmail.com>
> ---
>  package/gstreamer1/gst1-plugins-good/Config.in            | 1 +
>  package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)

Thanks for your patch. I am able to reproduce the issue with the
following defconfig (please always include a defconfig that exhibits
the bug when submitting a bug fix):

BR2_aarch64=y
BR2_cortex_a72=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_GSTREAMER1=y
BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL=y
BR2_PACKAGE_GST1_PLUGINS_GOOD=y
# BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_AVI is not set
# BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_ISOMP4 is not set
# BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_WAVPARSE is not set
BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_QMLGL=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_QT5=y
BR2_PACKAGE_WAYLAND=y
# BR2_TARGET_ROOTFS_TAR is not set

But the thing is that even after applying your patch, the issue still
occurs (I re-did a full build from scratch to be sure). I do see
qt5tools being built/installed, but the build of gst1-plugins-good
still fails with:

output/build/gst1-plugins-good-1.22.9/ext/qt/meson.build:48:4: ERROR: Problem encountered: qt5 qmlglsink plugin is enabled, but qt specific tools were not found

The last line of the meson logs look like this:

Got pkg-config variable host_bins : /home/thomas/buildroot/buildroot/output/host/bin
Run-time dependency qt5 (modules: Core) found: YES 5.15.11 (pkg-config)
Program /home/thomas/buildroot/buildroot/output/host/bin/moc found: YES 5.15.11 5.15.11 (/home/thomas/buildroot/buildroot/output/host/bin/moc)
Program /home/thomas/buildroot/buildroot/output/host/bin/uic found: YES 5.15.11 5.15.11 (/home/thomas/buildroot/buildroot/output/host/bin/uic)
Program /home/thomas/buildroot/buildroot/output/host/bin/rcc found: YES 5.15.11 5.15.11 (/home/thomas/buildroot/buildroot/output/host/bin/rcc)
Program /home/thomas/buildroot/buildroot/output/host/bin/lrelease found: NO
Program lrelease5 found: NO
Program lrelease-qt5 found: NO
Program lrelease found: NO found  but need: '== 5.15.11' (/usr/bin/lrelease)

Based on this and my testing, it seems like not only
BR2_PACKAGE_QT5TOOLS=y is needed, but also
BR2_PACKAGE_QT5TOOLS_LINGUIST_TOOLS=y, so I've applied your patch with
this additional fix.

Also, the issue has nothing to do with per-package builds, it can be
reproduced without.

See the final commit at:

  https://gitlab.com/buildroot.org/buildroot/-/commit/c107dd33e679becf8b58d78d088b5320734d3e31

Thanks again!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

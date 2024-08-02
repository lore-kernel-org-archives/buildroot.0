Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D7D5C3DA7F
	for <buildroot@archiver.kernel.org>; Fri,  2 Aug 2024 21:00:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E159160744;
	Fri,  2 Aug 2024 21:00:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LQt-iAdCvw0M; Fri,  2 Aug 2024 21:00:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC5BA60789
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC5BA60789;
	Fri,  2 Aug 2024 21:00:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8CDA21BF37F
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 21:00:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA72180E17
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 21:00:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZG-7pkpmoJO9 for <buildroot@lists.busybox.net>;
 Fri,  2 Aug 2024 21:00:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4C93480E8A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C93480E8A
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4C93480E8A
 for <buildroot@buildroot.org>; Fri,  2 Aug 2024 21:00:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 99F5440008;
 Fri,  2 Aug 2024 21:00:14 +0000 (UTC)
Date: Fri, 2 Aug 2024 23:00:13 +0200
To: Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <20240802230013.0efb9e5c@windsurf>
In-Reply-To: <20240627193335.4069574-2-aperez@igalia.com>
References: <20240208095531.99049-1-aperez@igalia.com>
 <20240627193335.4069574-2-aperez@igalia.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722632416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=reXwaw68yRDcufP34EpTIcT/YDXhThysNV4dpKOW/8Y=;
 b=gpRo44G6KLR29ZJPIY1GPO7j6ChXg9FDaNDROeCzKZ3Ok1LOMd8lMsfh1lE6bKWLE6n99R
 JHkZ/s0YSno0egrW92dVV0QYdXWU+k0wOM53ngWiQD7BXaB302DxOe6F+rHAvK24HT1kAE
 1IlWUrVAZe+5cUOWmSFBWTDUF/m+5rV7GJbDljAYZxQ8oBHvp78zF0KJtzyF/r1wosuJrm
 0xpxIJEh65zhaGSJyjdbW5oe/tr5o2ueLeBpZCDOhbDlf61iJTGBzAiU5lG+YtaWkdxEhs
 dBbu6ytJY9N+eAZm4XkJIlbRBTf5tsAhkrMeGCS73t3b1h8tR7FD5eu7CWEmCg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gpRo44G6
Subject: Re: [Buildroot] [PATCH v2 1/4] package/wpebackend-rdk: new package
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
Cc: Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Adrian,

On Thu, 27 Jun 2024 22:33:29 +0300
Adrian Perez de Castro <aperez@igalia.com> wrote:

> The wpebackend-rdk can be used as an alternative to wpebackend-fdo in
> some cases, and also supports a few additional configurations. For now
> only the Wayland-EGL and Broadcom RaspberryPi userland implementations
> can be enabled. The former is useful for testing, and the latter allows
> using WPE WebKit directly on top of Dispmanx in combination with the
> rpi-userland package in supported RaspberryPi models.
> 
> This only adds the new package, follow-up commits will un-hardcode the
> usage of wpebackend-fdo and allow selecting either which of both to
> build.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

I wanted to merge this, but unfortunately:

BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_VFP=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_RPI_USERLAND=y
BR2_PACKAGE_WPEBACKEND_RDK=y
# BR2_TARGET_ROOTFS_TAR is not set

fails to build with:

In file included from /home/thomas/projets/buildroot/output/build/wpebackend-rdk-4.4.1/src/bcm-rpi/view-backend.cpp:30:
/home/thomas/projets/buildroot/output/build/wpebackend-rdk-4.4.1/src/input/Libinput/LibinputServer.h:37:10: fatal error: libudev.h: No such file or directory
   37 | #include <libudev.h>
      |          ^~~~~~~~~~~
compilation terminated.

as far as I can see, LibinputServer.h includes <libinput.h> and
<libudev.h>:

#ifndef KEY_INPUT_HANDLING_VIRTUAL
#include <libudev.h>
#include <libinput.h>
#else
#include <virtualinput.h>
#endif

whenever KEY_INPUT_HANDLING_VIRTUAL is *NOT* defined. And
KEY_INPUT_HANDLING_VIRTUAL is only defined when USE_VIRTUAL_KEYBOARD=ON.

I believe you should also properly use the USE_INPUT_UDEV and
USE_INPUT_WAYLAND options.

find_package(Libxkbcommon REQUIRED)

libxkbcommon is also a mandatory dependency. Even though it is
indirectly pulled in by libwpe, it should be expressed as a direct
dependency of wpebackend-rdk.

> ---
>  package/Config.in                          |  1 +
>  package/wpebackend-rdk/Config.in           | 57 ++++++++++++++++++++++
>  package/wpebackend-rdk/wpebackend-rdk.hash |  5 ++
>  package/wpebackend-rdk/wpebackend-rdk.mk   | 43 ++++++++++++++++
>  4 files changed, 106 insertions(+)

Please add yourself in the DEVELOPERS file for this package.


> diff --git a/package/wpebackend-rdk/Config.in b/package/wpebackend-rdk/Config.in
> new file mode 100644
> index 00000000000..6125911bec9
> --- /dev/null
> +++ b/package/wpebackend-rdk/Config.in
> @@ -0,0 +1,57 @@
> +comment "wpebackend-rdk needs a toolchain w/ C++, wchar, threads, dynamic library, and rpi-userland or an OpenGL-capable Wayland backend"
> +	depends on !(BR2_PACKAGE_RPI_USERLAND || BR2_PACKAGE_HAS_LIBEGL_WAYLAND) \
> +		|| !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR \
> +		|| !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS

Please split this into two comments, one for the toolchain things, one
for the rpi-userland || wayland EGL.

Also, the option BR2_PACKAGE_HAS_LIBEGL_WAYLAND is gone, see commit
4fad6b3c58abd20c533b67b85658bc66d015110b. You can use
BR2_PACKAGE_HAS_LIBEGL && BR2_PACKAGE_WAYLAND instead. This needs to be
fixed globally.

> +config BR2_PACKAGE_WPEBACKEND_RDK
> +	bool "wpebackend-rdk"
> +	depends on !BR2_STATIC_LIBS # wayland
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland, libglib2
> +	depends on BR2_USE_WCHAR # libglib2
> +	depends on BR2_USE_MMU # libglib2
> +	depends on BR2_PACKAGE_RPI_USERLAND || BR2_PACKAGE_HAS_LIBEGL_WAYLAND
> +	select BR2_PACKAGE_LIBGLIB2
> +	select BR2_PACKAGE_LIBWPE
> +	help
> +	  WPEBackend interface supporting a number of configurations.

Would be nice to have a slightly extended explanation for the poor
souls like that are very confused by libwpe vs. wpebackend-fdo vs.
wpebackend-rdk vs. wpewebkit vs. webkitgtk.

> +if BR2_PACKAGE_WPEBACKEND_RDK
> +
> +choice
> +	prompt Implementation

Double quotes around "Implementation". Maybe it should be "Backend"
instead of "Implementation"?

> +	default BR2_PACKAGE_WPEBACKEND_RDK_IMPL_BRCM_RPI if BR2_PACKAGE_RPI_USERLAND
> +	default BR2_PACKAGE_WPEBACKEND_RDK_IMPL_WAYLAND_EGL if BR2_PACKAGE_HAS_LIBEGL_WAYLAND
> +
> +comment "brcm-rpi needs rpi-userland"
> +	depends on !BR2_PACKAGE_RPI_USERLAND || !BR2_arm

better expressed as:

	depends on BR2_arm
	depends on !BR2_PACKAGE_RPI_USERLAND

> +
> +config BR2_PACKAGE_WPEBACKEND_RDK_IMPL_BRCM_RPI
> +	bool "brcm-rpi"
> +	depends on BR2_arm
> +	depends on BR2_PACKAGE_RPI_USERLAND
> +	help
> +	  Build RaspberryPi support using Broadcom's rpi-userland.
> +
> +comment "wayland-egl needs an EGL capable Wayland implementation"
> +	depends on !BR2_PACKAGE_HAS_LIBEGL_WAYLAND
> +
> +config BR2_PACKAGE_WPEBACKEND_RDK_IMPL_WAYLAND_EGL
> +	bool "wayland-egl"
> +	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND
> +	help
> +	  Build Wayland-EGL support.
> +
> +endchoice
> +
> +if BR2_PACKAGE_WPEBACKEND_RDK_IMPL_BRCM_RPI
> +
> +config BR2_PACKAGE_WPEBACKEND_RDK_LIBINPUT
> +	bool "libinput support"
> +	select BR2_PACKAGE_LIBINPUT
> +	help
> +	  Support keyboard and mouse input through libinput

Why is the keyboard/mouse support with libinput only available with the
brcm-rpi backend? Reading the CMakeLists.txt, I don't really see any
relationship.

Could you fix up those different issues and submit a v3 ?

Thanks a lot!

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E87DCD3420
	for <buildroot@archiver.kernel.org>; Sun,  1 Sep 2024 21:24:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EBFE080AEF;
	Sun,  1 Sep 2024 21:24:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KoAgu88Vr4WE; Sun,  1 Sep 2024 21:24:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F1F0809EE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F1F0809EE;
	Sun,  1 Sep 2024 21:24:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 55D8A1BF584
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 21:24:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 41419403B5
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 21:24:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jutESlkuj0Mw for <buildroot@lists.busybox.net>;
 Sun,  1 Sep 2024 21:24:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B61DD403AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B61DD403AA
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B61DD403AA
 for <buildroot@buildroot.org>; Sun,  1 Sep 2024 21:24:49 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 187BC13F880;
 Sun,  1 Sep 2024 23:24:43 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 01 Sep 2024 23:24:42 +0200
Date: Sun, 1 Sep 2024 23:24:42 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Message-ID: <ZtTbmk8K3LLyCpwg@landeda>
References: <cover.1725225634.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1725225634.git.yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1725225886;
 bh=SWWfe5EJNE3bzupFqzIS3SqBXBi5wlzhx7IRT1b9lN0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mXDYNYoH83WEV+lUu9SZhBdJhDV53EQ169sltnEyyOrNPNcs+29F1GHiVexC7U8Uz
 8IzatEOMAUUrX9OiWaiL660OOxVxe9CaqI1rXdoVhRIPcG3Xb0Qejgv/rB3JEo1M8f
 /SrCuF04LwZxn2RdytfkH7QkSybpCDvieGcyrA3ZB03ISkxNy6OFUvwQIyZkbJe51i
 XYmtERZR5SN0lWDHL4oE42HjPYoL9kBqHwEtrC2P5RDv6E1NeRiwomDFJkviqpMPVH
 lybhzzw+o+NnvB+RLqSv0fa6PyM9TAUfvQUJApws7eSo/yDX5XrkusQn4Isod2uPC2
 3P+3+I4lG0C/Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=mXDYNYoH
Subject: Re: [Buildroot] [PATCH 0/6 v3] From: "Fiona Klute (WIWA)"
 <fiona.klute@gmx.de> (branch yem/libglib2)
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All.

The title for the cover letter should have read:

    libglib2 2.82 series with bootstrap

I messed up when copy-pasting, sorry for the mess...

Regards,
Yann E. MORIN.

On 2024-09-01 23:20 +0200, Yann E. MORIN spake thusly:
> Hello All!
> 
> Since 2.79.0 libglib2 needs to be bootstrapped without introspection
> support before gobject-introspection can be built, the added
> libglib2-bootstrap sub-package takes care of that. See NEWS:
> 
>     https://gitlab.gnome.org/GNOME/glib/-/blob/17d1bf3c4962d942feea0830aeee6833104fef5d/NEWS#L429-438
> 
> Here's a defconfig that can be used to test Network-Manager i11n from
> python in qemu:
>     BR2_aarch64=y
>     BR2_TOOLCHAIN_EXTERNAL=y
>     BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
>     BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
>     BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
>     BR2_PER_PACKAGE_DIRECTORIES=y
>     BR2_INIT_SYSTEMD=y
>     BR2_SYSTEM_DEFAULT_PATH="/bin:/sbin:/usr/bin:/usr/sbin"
>     BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>     BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>     BR2_LINUX_KERNEL=y
>     BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>     BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.32"
>     BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>     BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
>     BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
>     BR2_PACKAGE_PYTHON3=y
>     BR2_PACKAGE_PYTHON_GOBJECT=y
>     # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
>     BR2_PACKAGE_NETWORK_MANAGER=y
>     BR2_PACKAGE_NETWORK_MANAGER_TUI=y
>     BR2_PACKAGE_NETWORK_MANAGER_CLI=y
>     BR2_PACKAGE_NETWORK_MANAGER_MODEM_MANAGER=y
>     # BR2_PACKAGE_SYSTEMD_PSTORE is not set
>     # BR2_PACKAGE_SYSTEMD_HOSTNAMED is not set
>     # BR2_PACKAGE_SYSTEMD_MYHOSTNAME is not set
>     # BR2_PACKAGE_SYSTEMD_NETWORKD is not set
>     # BR2_PACKAGE_SYSTEMD_RESOLVED is not set
>     # BR2_PACKAGE_SYSTEMD_TIMEDATED is not set
>     # BR2_PACKAGE_SYSTEMD_TIMESYNCD is not set
>     BR2_TARGET_ROOTFS_EXT2=y
>     BR2_TARGET_ROOTFS_EXT2_4=y
>     BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
>     # BR2_TARGET_ROOTFS_TAR is not set
> 
> That can be run with the command line in:
>     board/qemu/aarch64-virt/readme.txt
> 
> By running the test script there:
>     https://networkmanager.dev/docs/developers/
> 
> Thanks in advance for the review,
> Fiona
> Yann
> 
> Changes v2 -> v3: (Yann):
> * split homepage and musl support to their own patches
> * introduce qemu wrapper
> * extend/rewite commit log for versions bumps
> * add defconfig to test
> 
> Changes v1 -> v2:
> * Update libglib2 to 2.82.0 instead of 2.80.4, drop one more patch
> * make building introspection data for libglib2 conditional on
>   BR2_PACKAGE_GOBJECT_INTROSPECTION=y
> * skip bootstrap for target package when building without
>   introspection, do not depend on Qemu in that case
> 
> Regards,
> Yann E. MORIN.
> 
> 
> ----------------------------------------------------------------
> Fiona Klute (WIWA) (3):
>       package/{gobject-introspection, libglib2}: bump to {1.80.1, 2.82.0}
>       package/python-gobject: bump to version 3.48.2
>       package/network-manager: optional gobject-introspection
> 
> Yann E. MORIN (3):
>       package/gobject-introspection: don't depend on cairo
>       package/gobject-introspection: update homepage
>       package/gobject-introspection: works with musl now
> 
>  package/gobject-introspection/Config.in            | 10 +--
>  .../gobject-introspection.hash                     |  4 +-
>  .../gobject-introspection/gobject-introspection.mk | 20 +++--
>  ...or-format-in-gio-gunixconnection.c-part-2.patch | 93 ---------------------
>  ...html-documentation-generation-with-gtk_do.patch | 96 ----------------------
>  ...etection-of-a-system-provided-proxy-libin.patch | 53 ------------
>  .../0005-meson-try-iconv-in-libintl-lookup.patch   | 53 ------------
>  .../0006-link-with-latomic-when-needed.patch       | 52 ------------
>  ...-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch | 38 +++++----
>  package/libglib2/Config.in                         |  4 +
>  package/libglib2/libglib2-bootstrap/2.82.0         |  1 +
>  package/libglib2/libglib2-bootstrap/Config.in      |  9 ++
>  .../libglib2-bootstrap/libglib2-bootstrap.hash     |  1 +
>  .../libglib2-bootstrap/libglib2-bootstrap.mk       | 77 +++++++++++++++++
>  package/libglib2/libglib2-qemu-wrapper.in          |  9 ++
>  package/libglib2/libglib2.hash                     |  4 +-
>  package/libglib2/libglib2.mk                       | 30 ++++++-
>  package/network-manager/network-manager.mk         |  7 +-
>  package/python-gobject/Config.in                   |  8 +-
>  package/python-gobject/python-gobject.hash         |  4 +-
>  package/python-gobject/python-gobject.mk           |  2 +-
>  21 files changed, 182 insertions(+), 393 deletions(-)
>  delete mode 100644 package/libglib2/0002-Fix-error-format-in-gio-gunixconnection.c-part-2.patch
>  delete mode 100644 package/libglib2/0003-meson-wrap-html-documentation-generation-with-gtk_do.patch
>  delete mode 100644 package/libglib2/0004-meson-Fix-detection-of-a-system-provided-proxy-libin.patch
>  delete mode 100644 package/libglib2/0005-meson-try-iconv-in-libintl-lookup.patch
>  delete mode 100644 package/libglib2/0006-link-with-latomic-when-needed.patch
>  rename package/libglib2/{ => 2.82.0}/0001-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch (53%)
>  create mode 120000 package/libglib2/libglib2-bootstrap/2.82.0
>  create mode 100644 package/libglib2/libglib2-bootstrap/Config.in
>  create mode 120000 package/libglib2/libglib2-bootstrap/libglib2-bootstrap.hash
>  create mode 100644 package/libglib2/libglib2-bootstrap/libglib2-bootstrap.mk
>  create mode 100644 package/libglib2/libglib2-qemu-wrapper.in
> 
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

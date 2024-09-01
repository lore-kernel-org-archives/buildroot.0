Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 491CACD3420
	for <buildroot@archiver.kernel.org>; Sun,  1 Sep 2024 21:20:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6217810A8;
	Sun,  1 Sep 2024 21:20:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KnbolJZT83aP; Sun,  1 Sep 2024 21:20:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 836CF810AE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 836CF810AE;
	Sun,  1 Sep 2024 21:20:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 03A0A1BF584
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 21:20:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E4EBF403A4
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 21:20:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KY-UydTJUPi3 for <buildroot@lists.busybox.net>;
 Sun,  1 Sep 2024 21:20:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1A31B40395
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A31B40395
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1A31B40395
 for <buildroot@buildroot.org>; Sun,  1 Sep 2024 21:20:38 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-374b25263a3so1304601f8f.0
 for <buildroot@buildroot.org>; Sun, 01 Sep 2024 14:20:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725225637; x=1725830437;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vIG80EczNlhJ5jYVJK9ubHFyMG0Br38VnOPxDhMKqIU=;
 b=fKVqmJZdr9caa65RqxznOhRIMA72wccv7CKLpjdXzRQU/Qmfp14uFSSOBXCK8GM7rM
 H+jlXHurRu0XpUVRfAiBJsdXe87IlIAeL7ZtWPWwcsLeuyfjqlVmV3rkgQ0vtMkfBP/r
 es+mmY+WA/twd96OTWoYAlwtjPoGlSXAb5s49n4e6MjMgpWhHjSZZ101fB5QpvZnyr+G
 5mR4vVu/HzM0VSrEIlR5mKGG82npG1oe9Opfamv7z1/97BH9W0NZD2zg1+uXPm7Tztmq
 xUbzZ7fVFxG+c9Zh1lfkDL/N13EGac5sEL2NclsujhRlIuOUTcJfI/NpvP9OwSECj02N
 b8uw==
X-Gm-Message-State: AOJu0YwemwzVM22s+4yQvCf7O/WuS1L/2tL41XnPG9z0h+iE+tjfO1cl
 FRWHVOUrqIMcb7Z8Kq/jGh4/BIfTFe5O9ABoyJPY7+ACqh1MTczFhuCi4w==
X-Google-Smtp-Source: AGHT+IE8d4dbaoJX2g2oHMMZezaEHk/w1xuM1RogINQvwpNLWumnziumokon/PDk0+s7EMX2SGZwXA==
X-Received: by 2002:a05:6000:186e:b0:374:c92e:f6a3 with SMTP id
 ffacd0b85a97d-374c92ef910mr1401050f8f.14.1725225636368; 
 Sun, 01 Sep 2024 14:20:36 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374ba593876sm5992015f8f.5.2024.09.01.14.20.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Sep 2024 14:20:36 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun,  1 Sep 2024 23:20:35 +0200
Message-ID: <cover.1725225634.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725225637; x=1725830437; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=vIG80EczNlhJ5jYVJK9ubHFyMG0Br38VnOPxDhMKqIU=;
 b=ONEw0bNQNHMW7TnhtDpH+zOKtnHzG674VIHSYQB/KpsU3FsXrVleiaw0V6Kz+RM5en
 Lev9QifkyRCEvcYHPRKbiTsZhPmzufLEq6Tw4Awm2+pGTcwYbJCHcVWJNyaacRN+j0A8
 n98SfOnPuWXshqX4XFvIIIweuUljiZDK4bUISny2JNn5CF+z3ADM3dwflUtJm5yy4mwd
 13FnHU2H1078kV36JUx1bhsHsJaaLg+bjpMUL3QrTi8GcKtOswGP2yLxUtOWhkJm6WiU
 rw6CpMzxfhb9QMTikbna5vS2hssT1kcF30kCOTKYeovyThuRaPLEHT0QO5JWvKp7ENat
 eY5A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ONEw0bNQ
Subject: [Buildroot] [PATCH 0/6 v3] From: "Fiona Klute (WIWA)"
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
 Fiona Klute <fiona.klute@gmx.de>, "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello All!

Since 2.79.0 libglib2 needs to be bootstrapped without introspection
support before gobject-introspection can be built, the added
libglib2-bootstrap sub-package takes care of that. See NEWS:

    https://gitlab.gnome.org/GNOME/glib/-/blob/17d1bf3c4962d942feea0830aeee6833104fef5d/NEWS#L429-438

Here's a defconfig that can be used to test Network-Manager i11n from
python in qemu:
    BR2_aarch64=y
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
    BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
    BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
    BR2_PER_PACKAGE_DIRECTORIES=y
    BR2_INIT_SYSTEMD=y
    BR2_SYSTEM_DEFAULT_PATH="/bin:/sbin:/usr/bin:/usr/sbin"
    BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
    BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
    BR2_LINUX_KERNEL=y
    BR2_LINUX_KERNEL_CUSTOM_VERSION=y
    BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.32"
    BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
    BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
    BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
    BR2_PACKAGE_PYTHON3=y
    BR2_PACKAGE_PYTHON_GOBJECT=y
    # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
    BR2_PACKAGE_NETWORK_MANAGER=y
    BR2_PACKAGE_NETWORK_MANAGER_TUI=y
    BR2_PACKAGE_NETWORK_MANAGER_CLI=y
    BR2_PACKAGE_NETWORK_MANAGER_MODEM_MANAGER=y
    # BR2_PACKAGE_SYSTEMD_PSTORE is not set
    # BR2_PACKAGE_SYSTEMD_HOSTNAMED is not set
    # BR2_PACKAGE_SYSTEMD_MYHOSTNAME is not set
    # BR2_PACKAGE_SYSTEMD_NETWORKD is not set
    # BR2_PACKAGE_SYSTEMD_RESOLVED is not set
    # BR2_PACKAGE_SYSTEMD_TIMEDATED is not set
    # BR2_PACKAGE_SYSTEMD_TIMESYNCD is not set
    BR2_TARGET_ROOTFS_EXT2=y
    BR2_TARGET_ROOTFS_EXT2_4=y
    BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
    # BR2_TARGET_ROOTFS_TAR is not set

That can be run with the command line in:
    board/qemu/aarch64-virt/readme.txt

By running the test script there:
    https://networkmanager.dev/docs/developers/

Thanks in advance for the review,
Fiona
Yann

Changes v2 -> v3: (Yann):
* split homepage and musl support to their own patches
* introduce qemu wrapper
* extend/rewite commit log for versions bumps
* add defconfig to test

Changes v1 -> v2:
* Update libglib2 to 2.82.0 instead of 2.80.4, drop one more patch
* make building introspection data for libglib2 conditional on
  BR2_PACKAGE_GOBJECT_INTROSPECTION=y
* skip bootstrap for target package when building without
  introspection, do not depend on Qemu in that case

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Fiona Klute (WIWA) (3):
      package/{gobject-introspection, libglib2}: bump to {1.80.1, 2.82.0}
      package/python-gobject: bump to version 3.48.2
      package/network-manager: optional gobject-introspection

Yann E. MORIN (3):
      package/gobject-introspection: don't depend on cairo
      package/gobject-introspection: update homepage
      package/gobject-introspection: works with musl now

 package/gobject-introspection/Config.in            | 10 +--
 .../gobject-introspection.hash                     |  4 +-
 .../gobject-introspection/gobject-introspection.mk | 20 +++--
 ...or-format-in-gio-gunixconnection.c-part-2.patch | 93 ---------------------
 ...html-documentation-generation-with-gtk_do.patch | 96 ----------------------
 ...etection-of-a-system-provided-proxy-libin.patch | 53 ------------
 .../0005-meson-try-iconv-in-libintl-lookup.patch   | 53 ------------
 .../0006-link-with-latomic-when-needed.patch       | 52 ------------
 ...-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch | 38 +++++----
 package/libglib2/Config.in                         |  4 +
 package/libglib2/libglib2-bootstrap/2.82.0         |  1 +
 package/libglib2/libglib2-bootstrap/Config.in      |  9 ++
 .../libglib2-bootstrap/libglib2-bootstrap.hash     |  1 +
 .../libglib2-bootstrap/libglib2-bootstrap.mk       | 77 +++++++++++++++++
 package/libglib2/libglib2-qemu-wrapper.in          |  9 ++
 package/libglib2/libglib2.hash                     |  4 +-
 package/libglib2/libglib2.mk                       | 30 ++++++-
 package/network-manager/network-manager.mk         |  7 +-
 package/python-gobject/Config.in                   |  8 +-
 package/python-gobject/python-gobject.hash         |  4 +-
 package/python-gobject/python-gobject.mk           |  2 +-
 21 files changed, 182 insertions(+), 393 deletions(-)
 delete mode 100644 package/libglib2/0002-Fix-error-format-in-gio-gunixconnection.c-part-2.patch
 delete mode 100644 package/libglib2/0003-meson-wrap-html-documentation-generation-with-gtk_do.patch
 delete mode 100644 package/libglib2/0004-meson-Fix-detection-of-a-system-provided-proxy-libin.patch
 delete mode 100644 package/libglib2/0005-meson-try-iconv-in-libintl-lookup.patch
 delete mode 100644 package/libglib2/0006-link-with-latomic-when-needed.patch
 rename package/libglib2/{ => 2.82.0}/0001-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch (53%)
 create mode 120000 package/libglib2/libglib2-bootstrap/2.82.0
 create mode 100644 package/libglib2/libglib2-bootstrap/Config.in
 create mode 120000 package/libglib2/libglib2-bootstrap/libglib2-bootstrap.hash
 create mode 100644 package/libglib2/libglib2-bootstrap/libglib2-bootstrap.mk
 create mode 100644 package/libglib2/libglib2-qemu-wrapper.in

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

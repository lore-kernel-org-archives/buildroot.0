Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B38EC021A0
	for <buildroot@archiver.kernel.org>; Sat, 15 Feb 2025 10:33:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1149E81176;
	Sat, 15 Feb 2025 10:33:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BwDMibXgD6aO; Sat, 15 Feb 2025 10:33:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22B478102A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22B478102A;
	Sat, 15 Feb 2025 10:33:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C3E68DF
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 10:33:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BDE5C607E8
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 10:33:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TKXPaX2RsDFB for <buildroot@buildroot.org>;
 Sat, 15 Feb 2025 10:33:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4D7376077D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D7376077D
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4D7376077D
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 10:33:51 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43948021a45so29671285e9.1
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 02:33:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739615629; x=1740220429;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VJu/Z1WoU7wW/jxU/w0VdUDYbA2OiopjdrXW9siEsqk=;
 b=k5hfMWelrK+8+yQgw3sgLvED2hADJy+dtbpi5xfQCQNciLxNxJORofKAysOMe+slPl
 mBARANL9PXyPq3Y8quiiCS4Nkz+gSQ0x24w4/lJKkpf1svzLYlEr+1kAqRiKC+6Bzuuk
 oB/RRBbCtfqFo9NyNwKP4Uad4Bgqf8qxT72F+4dEc3IUCFOs6hHNn1vHt0NM/et/mCmr
 bN9lQMcWtIP2wPXz8sCgdkSOG+Kehc88ytr7MO2mUR43kazN45MMvOQpTFef31BbmrRr
 dc6YAsWDHGD2VPe/uzMXnr3rdo1PRf4+UDVDfnvZ9qkMllayxWwe5X0diPQmhru/T3rg
 2TmQ==
X-Gm-Message-State: AOJu0YxCHqYAjv9FYKTH2RVCsFGKxxymrLPGNtJTh9Zm4VV6D2iO5lVM
 vz6KGVGeIqUh3q/D926li9i1R+JYTAzo6OqRO94+xcEQvpzvB578YwthFg==
X-Gm-Gg: ASbGncsrPE6S2YgbYB6R1dhsVH9C925U8GfTwFA+Af6mG9B5kXYUHOyHT073lcFggvC
 vyfjgvvQyYsFiGL/xaqQFDitk0wUTJFl+cp+9JVvp79sIf+l/Y1HzEr38xlL80l5Bm8kNq+sVfg
 rL3vULbqw+92pbOEasu+wJR3cDrb/Np97pWPCNTUeviKiquSve/viSGbOD501M1lS5H4fiW+7SA
 AoDCnmPQHOcbuqQVsUY3GShMghbIvOtceXe0hu/+u5M8//9mbKEHQQxmbu6+15jZZ+t4u1xVb+O
 Iz8voatU5ltOlVtsTMqQGLHVNg==
X-Google-Smtp-Source: AGHT+IEa+k+K/IemZ79+6V3zswWAPp4FjWM96HU3ic1DP3ubQtTAIK9zICoWNpODw9K7NO81I6s4pw==
X-Received: by 2002:a05:600c:4f95:b0:439:6ab6:5d47 with SMTP id
 5b1f17b1804b1-4396e73462cmr32361605e9.30.1739615628750; 
 Sat, 15 Feb 2025 02:33:48 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259d65bcsm6940030f8f.65.2025.02.15.02.33.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Feb 2025 02:33:48 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Fiona Klute <fiona.klute@gmx.de>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Date: Sat, 15 Feb 2025 11:33:47 +0100
Message-ID: <cover.1739615626.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739615629; x=1740220429; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=VJu/Z1WoU7wW/jxU/w0VdUDYbA2OiopjdrXW9siEsqk=;
 b=LErOFcOT96Vu7SF+6rAseEYvyy9o5RgQ2zf8ScWwtmNFWvat2yLvZUKbcdUT1UeI6a
 njw2CpkaD2UuWloznxCg3alEJZmG76Uk1Ln/65pOBslt/ZNOOEQvljxJKk9/KSE/doTB
 X5CH7pSZnK1GphRS33mI4CPab+DWp29e7KFe9RlWvThSCBrbqH3xsBv+Pckk5yXHYeGp
 pLY3FACOY8Xyb/tJzKTWjESoZlEY3Qy3pYD+DTwD5WUs54cPvnX2fSRFlS9nvGRtq3HY
 UyqHpc0hN2t0TuMjuuhc8hdJInpyHJTkW991nI5I8D4M/qMaqGEgdlux06EeRQEoMs0v
 gbJw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=LErOFcOT
Subject: [Buildroot] [PATCH 0/4] package/catatonit: update,
 and use as init or docker init (branch yem/docker-init)
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello All!

This samall series brings catatonit to the same level of support as the
other init systems, and especially as a docker-engine init system, like
tini.

Tested with the following defconfig (based on qemu_x86_64_defconfig):

    BR2_x86_64=y
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
    BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
    BR2_PER_PACKAGE_DIRECTORIES=y
    BR2_SYSTEM_DHCP="eth0"
    BR2_ROOTFS_POST_BUILD_SCRIPT="board/qemu/x86_64/post-build.sh"
    BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
    BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
    BR2_LINUX_KERNEL=y
    BR2_LINUX_KERNEL_CUSTOM_VERSION=y
    BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
    BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
    BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
    BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
    BR2_PACKAGE_CA_CERTIFICATES=y
    BR2_PACKAGE_DOCKER_CLI=y
    BR2_PACKAGE_DOCKER_ENGINE=y
    BR2_PACKAGE_DOCKER_ENGINE_DOCKER_INIT_CATATONIT=y
    BR2_TARGET_ROOTFS_EXT2=y
    BR2_TARGET_ROOTFS_EXT2_SIZE="252M"
    BR2_TARGET_ROOTFS_EXT2_RESBLKS=1
    BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS=""
    # BR2_TARGET_ROOTFS_TAR is not set
    BR2_PACKAGE_HOST_GO_BIN=y

And then, in the VM, after login:

    # ls -l /usr/libexec/docker/
    lrwxrwxrwx    1 root     root            19 Feb 15 09:34 docker-init -> ../../bin/catatonit
    # docker container run -ti --init busybox:latest
    [...]
    / # ps
    PID   USER     TIME  COMMAND
        1 root      0:00 /sbin/docker-init -- sh
        6 root      0:00 sh
        7 root      0:00 ps
    / # ls -l /proc/1/exe
    lrwxrwxrwx    1 root     root             0 Feb 15 09:35 /proc/1/exe -> /sbin/docker-init

Replacing BR2_PACKAGE_DOCKER_ENGINE_DOCKER_INIT_CATATONIT=y with
BR2_PACKAGE_DOCKER_ENGINE_DOCKER_INIT_TINI=y still works as previously,
with the init symlink being to tini instead of catatonit.

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (4):
      package/docker-engine: carry the tini init symlink
      package/docker-engine: add option to support catatonit as init
      package/catatonit: update to version 0.2.1
      system: add catatonit as init system

 Config.in.legacy                                   |  9 ++++
 .../catatonit/0001-fix-build-with-kernel-5.9.patch | 49 ----------------------
 package/catatonit/catatonit.hash                   |  2 +-
 package/catatonit/catatonit.mk                     |  2 +-
 package/docker-engine/Config.in                    | 32 +++++++++++---
 package/docker-engine/docker-engine.mk             | 10 +++++
 package/tini/tini.mk                               |  2 -
 system/Config.in                                   | 10 +++++
 8 files changed, 58 insertions(+), 58 deletions(-)
 delete mode 100644 package/catatonit/0001-fix-build-with-kernel-5.9.patch

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

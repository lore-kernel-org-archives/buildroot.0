Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C47D1C3ABCC
	for <buildroot@archiver.kernel.org>; Wed, 14 May 2025 13:43:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C35460BB4;
	Wed, 14 May 2025 13:43:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mPg6kcXkv2wz; Wed, 14 May 2025 13:43:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5EC4F60B85
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EC4F60B85;
	Wed, 14 May 2025 13:43:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B7EE7153
 for <buildroot@buildroot.org>; Wed, 14 May 2025 13:43:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B4B9D60B71
 for <buildroot@buildroot.org>; Wed, 14 May 2025 13:43:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mtY20fL97mnM for <buildroot@buildroot.org>;
 Wed, 14 May 2025 13:43:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B195460B19
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B195460B19
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B195460B19
 for <buildroot@buildroot.org>; Wed, 14 May 2025 13:43:19 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-ad241004afcso74981966b.0
 for <buildroot@buildroot.org>; Wed, 14 May 2025 06:43:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747230197; x=1747834997;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cJyX116NqXdiazdokn0ABhzDEbczyNJ1oaX7S7yYCHI=;
 b=a34hM7UbA9jkfEHdDEJW9vKp5qvv3bqgRi+K8VtSQEkO3iK0aOZ2p3EwOmpFJ+HZo3
 1JiLzeQZXMhNloMwM4cXScH+golonb78+5aeZZHeTRXffxc8Mfbeklb2dR9O1doFFBZH
 ysQ9X33Oo5U858q+ZG+WwRJS0tmpuMGzfB8Pu9gGwDDKf24lDz+Wpfc4RiR7qFfEQRGg
 +dGOdAkpkK8QzqeWGppW9TG7YBiB3h3dSoSEkefFZ7HCh6iHRJjI3pvVG++/oKVfTRAE
 3h0KUOAKG+OMvRAH+HioC469Y7kWvDsdHvIcuZJ+EsqIPXdHeFKuTDOKTV2zYiaTK9nq
 /CiA==
X-Gm-Message-State: AOJu0Yysjv+h+lB6cK4YCaKc1U+zg+y+ZWeBxDmVnoef46tkOYijE9ae
 lSKS3fRe5K8AIVGHrNGuqTCepVP3I9b70whbZ8e7XoqVWT52Nuar33U0KwhFHB4lqUMtKuHhWxk
 r
X-Gm-Gg: ASbGncs+TU2j+/SrB4b2Lg0fqXPZCebaJlxgDMGkerR0MSjl2Za0aaadOjeEloDQ9dv
 Fj7dpmf42DTkc5Naqz4Zv25fSEArVMSJBqyJU1FmeV8wauo6jvW/4YU+CsNf/mfIz8G2TYaEoAE
 ykGXBfq8NPB3unZhyPkO0Zhiz2LXcCePFnwzHdw2jrt7oYGf4gHhjMar9BRykZ+TiYImAJDD4ts
 I2XmN0apYxF9+E9gYa6Ukg7/r/edbQLbMFZwlnpgCmq78Z6s34BDbuqpeVm6RYNcOQeQ9HyALPw
 DO2Oyqnxw3o3/HtPwJOW0/AWmfvNYDqeu6hvLw6RPjY3DbqJf/7Rf9uZAyDDNO1jwpXL+Gd/jEe
 E4fi1CZ0wGWVW70zkDacMAh+24XXytprA9PyGOcv4hwOGLdwVBEkV0lh1Hkc1dFpzGdYHb3LZ09
 x5z2DRa+XtiW/zHbPfTfaA
X-Google-Smtp-Source: AGHT+IG75x4PzgJ2+WsebKhLGaqKsskOjpCDFG1QhXImvqSdQVn/OBzQkcLD0QvMd569As4n3XcxqA==
X-Received: by 2002:a17:906:7f13:b0:ad5:f4:aa7e with SMTP id
 a640c23a62f3a-ad500f4ac55mr52839466b.1.1747230196787; 
 Wed, 14 May 2025 06:43:16 -0700 (PDT)
Received: from fedora.amarulasolutions.com
 (2001-1c00-8182-4700-cf31-04f3-d898-af42.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8182:4700:cf31:4f3:d898:af42])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad2197bd3a6sm934783866b.131.2025.05.14.06.43.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 06:43:16 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 May 2025 15:43:08 +0200
Message-ID: <20250514134314.2405052-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1747230197; x=1747834997;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cJyX116NqXdiazdokn0ABhzDEbczyNJ1oaX7S7yYCHI=;
 b=Y0ImhSwB42d6Ee4HXP+C4q/JZX45dpszh5+5KrWe1aA5liY1Q0JPLKPetziXP9YUFk
 xxHvd8wlno2jpY3JvuakhZYAUV7ebNOL6lRPV4NXBMLT7+CC4dN8dRBccwb+ey4iN/qc
 nrvlm09wvSJ0N2BS+VdUbKTsFaRvNYG08/y3Q=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Y0ImhSwB
Subject: [Buildroot] [PATCH 0/6] sway fixups
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

As of commit b4401557, sway swwitched from dmenu-wayland to the wmenu
package for swaybar with the following commit message:

"""
Switch default config to wmenu-run
This removes the last dependency bit on dmenu. No need for
"swaymsg exec" anymore: wmenu-run handles the xdg-activation
shenanigans.
"""

When sway was updated with commit 24bad652, this was overlooked and
swaybar has been broken since.

Furthermore, I must admit I have been derelect about keeping the non-flutter
packages under my care in the DEVELOPERS file up to date. As such, in this
series, the fcft and foot packages are updated the the latest releases, and
as a bonus, the libxkbcommon package is updated as well as foot requires
version >= 1.8.0.

The utf8proc package is updated just because I noticed it had an update.

I tested the updated packages with a test_defconfig containing the following:

"""
BR2_PACKAGE_FOOT=y
BR2_PACKAGE_FCFT=y
BR2_PACKAGE_UTF8PROC=y
BR2_PACKAGE_LIBXKBCOMMON=y
"""

And the following command: `./utils/test-pkg -c ./test_defconfig` using
Ubuntu 24.04.

                             arm-aarch64 [ 1/40]: OK
                   bootlin-aarch64-glibc [ 2/40]: OK
               bootlin-arcle-hs38-uclibc [ 3/40]: SKIPPED
                    bootlin-armv5-uclibc [ 4/40]: SKIPPED
                     bootlin-armv7-glibc [ 5/40]: OK
                      bootlin-armv7-musl [ 6/40]: OK
                   bootlin-armv7m-uclibc [ 7/40]: SKIPPED
                bootlin-m68k-5208-uclibc [ 8/40]: SKIPPED
               bootlin-m68k-68040-uclibc [ 9/40]: SKIPPED
             bootlin-microblazeel-uclibc [10/40]: SKIPPED
                   bootlin-mipsel-uclibc [11/40]: SKIPPED
                bootlin-mipsel32r6-glibc [12/40]: OK
                 bootlin-openrisc-uclibc [13/40]: SKIPPED
           bootlin-powerpc-e500mc-uclibc [14/40]: SKIPPED
        bootlin-powerpc64le-power8-glibc [15/40]: OK
                   bootlin-riscv32-glibc [16/40]: OK
                   bootlin-riscv64-glibc [17/40]: OK
                    bootlin-riscv64-musl [18/40]: OK
                 bootlin-s390x-z13-glibc [19/40]: OK
                      bootlin-sh4-uclibc [20/40]: SKIPPED
                    bootlin-sparc-uclibc [21/40]: SKIPPED
                   bootlin-sparc64-glibc [22/40]: OK
                    bootlin-x86-64-glibc [23/40]: OK
                     bootlin-x86-64-musl [24/40]: OK
                   bootlin-x86-64-uclibc [25/40]: SKIPPED
                   bootlin-x86-i686-musl [26/40]: OK
                   bootlin-xtensa-uclibc [27/40]: SKIPPED
                            br-arm-basic [28/40]: SKIPPED
                    br-arm-full-nothread [29/40]: SKIPPED
                      br-arm-full-static [30/40]: SKIPPED
                   br-i386-pentium4-full [31/40]: SKIPPED
                      br-mips64-n64-full [32/40]: SKIPPED
                 br-mips64r6-el-hf-glibc [33/40]: OK
               br-powerpc-603e-basic-cpp [34/40]: SKIPPED
               br-powerpc64-power7-glibc [35/40]: OK
                       linaro-aarch64-be [36/40]: FAILED
                          linaro-aarch64 [37/40]: FAILED
                              linaro-arm [38/40]: FAILED
                           sourcery-mips [39/40]: FAILED
                         sourcery-mips64 [40/40]: FAILED
40 builds, 19 skipped, 5 build failed, 0 legal-info failed, 0 show-info failed


Of note for the failed tests:
The linaro toolchains are extremely old! Sitting at version 7.3.1!
The sourcery toolchains are even older! Sitting at version 5.3.0!
The reason for the failure is none of the toolchains supply threads.h, even
though they set BR2_TOOLCHAIN_HAS_THREADS.

I would highly recommend those toolchains are dropped, as they are ancient
and buildroot only supports building gcc 13 and up.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

Adam Duskett (6):
  package/wmenu: new package
  package/dmenu-wayland: remove package
  package/utf8proc: bump version to 2.10.0
  package/libxkbcommon: bump to version 1.9.2
  package/fcft: bump to version 3.3.1
  package/foot: bump version to 1.22.3

 Config.in.legacy                              |  9 ++++
 DEVELOPERS                                    |  2 +-
 package/Config.in                             |  2 +-
 .../0001-support-cross-compilation.patch      | 32 --------------
 package/dmenu-wayland/dmenu-wayland.hash      |  3 --
 package/dmenu-wayland/dmenu-wayland.mk        | 29 -------------
 package/fcft/fcft.hash                        |  2 +-
 package/fcft/fcft.mk                          |  2 +-
 ...-handle-architecture-with-soft-float.patch | 42 -------------------
 package/foot/foot.hash                        |  2 +-
 package/foot/foot.mk                          |  2 +-
 package/libxkbcommon/libxkbcommon.hash        |  6 +--
 package/libxkbcommon/libxkbcommon.mk          |  5 +--
 package/sway/Config.in                        |  2 +-
 package/utf8proc/utf8proc.hash                |  2 +-
 package/utf8proc/utf8proc.mk                  |  2 +-
 package/{dmenu-wayland => wmenu}/Config.in    | 12 +++---
 package/wmenu/wmenu.hash                      |  3 ++
 package/wmenu/wmenu.mk                        | 20 +++++++++
 19 files changed, 53 insertions(+), 126 deletions(-)
 delete mode 100644 package/dmenu-wayland/0001-support-cross-compilation.patch
 delete mode 100644 package/dmenu-wayland/dmenu-wayland.hash
 delete mode 100644 package/dmenu-wayland/dmenu-wayland.mk
 delete mode 100644 package/foot/0001-box-drawings-handle-architecture-with-soft-float.patch
 rename package/{dmenu-wayland => wmenu}/Config.in (68%)
 create mode 100644 package/wmenu/wmenu.hash
 create mode 100644 package/wmenu/wmenu.mk

-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

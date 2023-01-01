Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB7DC4332F
	for <buildroot@archiver.kernel.org>; Sun,  1 Jan 2023 23:39:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 256924030D;
	Sun,  1 Jan 2023 23:39:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 256924030D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IHnFcJfq7gyC; Sun,  1 Jan 2023 23:39:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE14E405A6;
	Sun,  1 Jan 2023 23:39:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE14E405A6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 748C41BF38D
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 23:39:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 57C8F405A6
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 23:39:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57C8F405A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id airTtd8m_mzP for <buildroot@lists.busybox.net>;
 Sun,  1 Jan 2023 23:39:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B629A4030D
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B629A4030D
 for <buildroot@buildroot.org>; Sun,  1 Jan 2023 23:39:02 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id v70so23831245oie.3
 for <buildroot@buildroot.org>; Sun, 01 Jan 2023 15:39:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mINdcWTXw6WfTuWMtg2As4IHEC6PpMuTG3xviLoKXd0=;
 b=MxWIddN61mPhsEFyBMY1rT8yI5Mmugvx3SKbwD6i3UmFHT+LQE9ySOCSPlPatL6iRw
 OeI7M9VjLpi4s5FefSlBECOflMZWbpc6ARRXmPeXXqP8YcmLHDrN9RFDmn5QKfIuaJ1h
 ArMmp3Isik89o1Ny+9wTMtyuB3idJSnbT4vDOzGunKdB7UDiRq6JI86mwLXirlfVhCpD
 xB5YOI8fM6o8wQ7Sl5Szvub90kvTRYb3EBnnFEw9XhbihiqnvuVYR7gUdcTrVKTzZOL7
 KZkHkPKUyHcipGfkwjjFPm7Kt9pktPIoLQnXezXfAnFe2Hk2ZER9YLIl1I3V39TNDUsT
 NtaQ==
X-Gm-Message-State: AFqh2kpraM+lMWbOC5qo3l/nzlXOdRXFMGV5YyEqzjDm/9hoZhevx9o5
 mH0fncN1FsaqPRe0HMCWOXfeNn4OStI=
X-Google-Smtp-Source: AMrXdXvAeUWJoYZ85yAJ0ox9Nc/k0OOpjK48kqGKa1C6XPsArzHxroHzw9SwkqCzkrrw2pLAiHAjjQ==
X-Received: by 2002:a05:6808:f12:b0:363:b918:643b with SMTP id
 m18-20020a0568080f1200b00363b918643bmr1886983oiw.31.1672616341221; 
 Sun, 01 Jan 2023 15:39:01 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:7980:988a:6ae4:c2b1:7ea6:a195])
 by smtp.gmail.com with ESMTPSA id
 o189-20020aca41c6000000b00360e46a1edasm11372611oia.22.2023.01.01.15.38.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jan 2023 15:39:00 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Jan 2023 20:36:24 -0300
Message-Id: <20230101233653.487175-1-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mINdcWTXw6WfTuWMtg2As4IHEC6PpMuTG3xviLoKXd0=;
 b=qqu5ODRbKpdI7W6rTOoo+fGhAROPANUApZgA0UIaLYVuhRj5moY24e96HBt+65QWSH
 ecB0BVgcCcehCVmfCWozV4Ryfs10CI7OMcx65hE8Cj9wdy62KYwcjmj1SmN3+kX8Koyz
 InLplT7qFlkVo3ue7Tyo9rnVbqGKGurLyi4oLETpEBynYQkDdlH/4UGrOH7l7bHAbXz5
 9RkTtK8SD72KuIs3c7LDN8QahBikPGJ9vNle60Md+cJzyxgoB/yPIJWgpU5hiltDIVPZ
 QPTBK8zec+hL5bZsPoQyWh6Jc/S0iu3zqCnU4kEy5yiYYx+at43Vxz1/YuTo243G1EBU
 F73A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=qqu5ODRb
Subject: [Buildroot] [PATCH 00/29] check-package: warn about symbols not
 recognized by a package infra
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Patch 1 contains a fix for deprecated suffix in the package infra.
 01 package/pkg-generic: add check for deprecated _INSTALL_HOST_OPTS

Patches 2 to 9 contain fixes for packages.
 02 package/libmng: fix optional dependency to lcms2
 03 package/qcom-db410c-firmware: fix typo for <pkg>_LICENSE
 04 package/tinyxml: fix typo for TINYXML_CPE_ID_VENDOR
 05 package/gobject-introspection: really use host python for host va...
 06 package/i2pd: really install configuration files
 07 package/ima-evm-utils: really install to staging
 08 package/qt5/qt5virtualkeyboard: really configure language layouts
 09 package/tekui: really disable parallel build

Patches 10 and 11 revert bogus commits on packages.
 10 Revert "pptp-linux: fix build with high BR2_JLEVEL settings"
 11 Revert "package/zip: install to staging"

Patches 12 to 24 drop bogus or dangling variables on packages.
 12 boot/ti-k3-r5-loader: drop bogus TI_K3_R5_LOADER_BOARD
 13 package/checkpolicy: drop bogus CHECKPOLICY_STAGING_CMDS
 14 package/exfat: drop dangling EXFAT_CFLAGS
 15 package/falcosecurity-libs: drop bogus FALCOSECURITY_LIBS_SUPPORT...
 16 package/glib-networking: drop dangling GLIB_NETWORKING_INSTALL_TA...
 17 package/gobject-introspection: drop bugus GOBJECT_INTROSPECTION_A...
 18 package/libtalloc: drop bogus LIBTALLOC_{C,LD}FLAGS
 19 package/lrzsz: drop bogus LRZSZ_BUILD_HOOKS
 20 package/policycoreutils: drop bogus INSTALL_TARGET_LINUX_PAM_CONFS
 21 package/qoriq-rcw: drop bogus QORIQ_RCW_FILE_BIN
 22 package/rhash: drop dangling RHASH_ADDLDFLAGS
 23 package/swupdate: drop dangling SWUPDATE_BUILD_CONFIG
 24 package/wpa_supplicant: drop dangling WPA_SUPPLICANT_{LDFLAGS,MAK...

Patches 25 and 26 contain fixes for check-package
 25 utils/check-package: fix check for <pkg>_REDISTRIBUTE
 26 utils/check-package: check linux-tools

Patch 27 is the goal of the series, it makes check-package warn about
symbols used in packages that are not recognized by the package infra(s)
used by that package.
 27 utils/check-package: warn about symbols not recognized by a packa...

Patch 28 makes check-package complain for e.g. a package declaring
_INSTALL_STAGING_CMDS without _INSTALL_STAGING enabled.
 28 utils/check-package: warn about disabled install

Patch 29 tries to slightly improve correctness for the manual that
describes how to use the package infras, by partially standardizing the
entries.
 29 docs/manual: standardize references to the generic infra

Regards,
Ricardo

Ricardo Martincoski (29):
  package/pkg-generic: add check for deprecated _INSTALL_HOST_OPTS
  package/libmng: fix optional dependency to lcms2
  package/qcom-db410c-firmware: fix typo for <pkg>_LICENSE
  package/tinyxml: fix typo for TINYXML_CPE_ID_VENDOR
  package/gobject-introspection: really use host python for host variant
  package/i2pd: really install configuration files
  package/ima-evm-utils: really install to staging
  package/qt5/qt5virtualkeyboard: really configure language layouts
  package/tekui: really disable parallel build
  Revert "pptp-linux: fix build with high BR2_JLEVEL settings"
  Revert "package/zip: install to staging"
  boot/ti-k3-r5-loader: drop bogus TI_K3_R5_LOADER_BOARD
  package/checkpolicy: drop bogus CHECKPOLICY_STAGING_CMDS
  package/exfat: drop dangling EXFAT_CFLAGS
  package/falcosecurity-libs: drop bogus
    FALCOSECURITY_LIBS_SUPPORTS_IN_SOURCE_BUILD
  package/glib-networking: drop dangling
    GLIB_NETWORKING_INSTALL_TARGET_OPTS
  package/gobject-introspection: drop bugus
    GOBJECT_INTROSPECTION_AUTORECONF
  package/libtalloc: drop bogus LIBTALLOC_{C,LD}FLAGS
  package/lrzsz: drop bogus LRZSZ_BUILD_HOOKS
  package/policycoreutils: drop bogus INSTALL_TARGET_LINUX_PAM_CONFS
  package/qoriq-rcw: drop bogus QORIQ_RCW_FILE_BIN
  package/rhash: drop dangling RHASH_ADDLDFLAGS
  package/swupdate: drop dangling SWUPDATE_BUILD_CONFIG
  package/wpa_supplicant: drop dangling
    WPA_SUPPLICANT_{LDFLAGS,MAKE_ENV}
  utils/check-package: fix check for <pkg>_REDISTRIBUTE
  utils/check-package: check linux-tools
  utils/check-package: warn about symbols not recognized by a package
    infra
  utils/check-package: warn about disabled install
  docs/manual: standardize references to the generic infra

 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk       |   1 -
 docs/manual/adding-packages-autotools.txt     |  11 +-
 docs/manual/adding-packages-cargo.txt         |   9 +-
 docs/manual/adding-packages-cmake.txt         |  10 +-
 docs/manual/adding-packages-golang.txt        |   9 +-
 docs/manual/adding-packages-kconfig.txt       |  18 +-
 docs/manual/adding-packages-luarocks.txt      |  12 +-
 docs/manual/adding-packages-meson.txt         |   9 +-
 docs/manual/adding-packages-perl.txt          |  12 +-
 docs/manual/adding-packages-python.txt        |   4 +-
 docs/manual/adding-packages-qmake.txt         |  12 +-
 docs/manual/adding-packages-rebar.txt         |  13 +-
 docs/manual/adding-packages-waf.txt           |  12 +-
 fs/initramfs/initramfs.mk                     |   1 +
 linux/linux-ext-xenomai.mk                    |   2 +-
 package/checkpolicy/checkpolicy.mk            |   5 -
 package/exfat/exfat.mk                        |   1 -
 .../falcosecurity-libs/falcosecurity-libs.mk  |   1 -
 package/glib-networking/glib-networking.mk    |   2 -
 .../gobject-introspection.mk                  |   3 +-
 package/i2pd/i2pd.mk                          |   1 +
 package/ima-evm-utils/ima-evm-utils.mk        |   1 +
 package/libmng/libmng.mk                      |   2 +-
 package/libtalloc/libtalloc.mk                |   2 -
 package/lrzsz/lrzsz.mk                        |   4 -
 package/luarocks/luarocks.mk                  |   2 +
 package/pkg-generic.mk                        |   3 +-
 package/policycoreutils/policycoreutils.mk    |   4 -
 package/pptp-linux/pptp-linux.mk              |   1 -
 .../qcom-db410c-firmware.mk                   |   2 +-
 package/qoriq-rcw/qoriq-rcw.mk                |   1 -
 .../qt5virtualkeyboard/qt5virtualkeyboard.mk  |   2 +-
 package/rhash/rhash.mk                        |   1 -
 package/swupdate/swupdate.mk                  |   2 -
 package/tekui/tekui.mk                        |   4 +-
 package/tinyxml/tinyxml.mk                    |   2 +-
 package/wpa_supplicant/wpa_supplicant.mk      |   4 -
 package/zip/zip.mk                            |   6 -
 toolchain/toolchain.mk                        |   2 +
 utils/check-package                           |  20 +-
 utils/checkpackagelib/lib_mk.py               | 228 ++++++-
 utils/checkpackagelib/pkg_infra.py            | 309 +++++++++
 utils/checkpackagelib/test_lib_mk.py          | 603 +++++++++++++++++-
 43 files changed, 1226 insertions(+), 127 deletions(-)
 create mode 100644 utils/checkpackagelib/pkg_infra.py

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

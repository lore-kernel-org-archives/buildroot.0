Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 627AAC46CA1
	for <buildroot@archiver.kernel.org>; Mon, 18 Sep 2023 20:31:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0684941594;
	Mon, 18 Sep 2023 20:31:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0684941594
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1DAVKZosIQ9K; Mon, 18 Sep 2023 20:31:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0435C41595;
	Mon, 18 Sep 2023 20:31:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0435C41595
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 46BBB1BF3D8
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 20:31:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 20F7041989
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 20:31:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20F7041989
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DpAgi2uIZbq4 for <buildroot@lists.busybox.net>;
 Mon, 18 Sep 2023 20:31:05 +0000 (UTC)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 033EF41993
 for <buildroot@buildroot.org>; Mon, 18 Sep 2023 20:31:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 033EF41993
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4018af103bcso32999935e9.1
 for <buildroot@buildroot.org>; Mon, 18 Sep 2023 13:31:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695069062; x=1695673862;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lLKdRcoWb+1dpQwaQam11SWshIgHoqyjNeEYcqTqu0Q=;
 b=iSNvD1V5J7n/tcLsJJIA2bbqfvQlkERsDpOtTghuYxqxU7y/hXDQ4RSUeoukp+hbuq
 bW2WFpLTwhdX6KLRcJg3hojD3IVguE0Ao2ODJ03tXyLZKr/1kd/1KCMk7pYKkLuGhLE7
 uNPwKP6tG8+tMOXmSIiuNG7Hf98KmOVXPrPyYKc6sYFxjUiGHx1ecsQWBoAb3ywijXbQ
 8pP1IbKfKzSNz66oHdkSyQmornVgaAdZSysLxqRCY/Q4yF6pd5iB8gIeLvVGl8hmrv3M
 iHf5vTZ14eIC0g+NDr4LIXOzvTRdTBH94a89x2IenQ35gnstUjqbL6WiwGH70cWzRkjl
 4Mew==
X-Gm-Message-State: AOJu0YxmXifzsszAtNmYJLpKkIqpLX6otSs2CUd6MB/ixbGrTJ11TsGi
 O04cn1lE6ZA7BlA3H4b0uY01lnW/ghc=
X-Google-Smtp-Source: AGHT+IFd9akMABUzGkYz7sK2PQWYsMV5tcDb0SW/Ks86i7WEgM4NvCPB/Id/O31OylF9iCkBcqMEmQ==
X-Received: by 2002:a05:600c:1d17:b0:401:b393:da18 with SMTP id
 l23-20020a05600c1d1700b00401b393da18mr541849wms.6.1695069062409; 
 Mon, 18 Sep 2023 13:31:02 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b44:b00:9624:48f1:9fd0:3d3c])
 by smtp.gmail.com with ESMTPSA id
 hn40-20020a05600ca3a800b003fef19bb55csm13287460wmb.34.2023.09.18.13.31.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:31:01 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 18 Sep 2023 22:31:01 +0200
Message-Id: <cover.1695069059.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695069062; x=1695673862; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=lLKdRcoWb+1dpQwaQam11SWshIgHoqyjNeEYcqTqu0Q=;
 b=OT3lelpMB49i3PJAHKbZHlKJVQABa45s37eptfNw9XYsVXpMm60M5NlSLIo1+8BWAQ
 MQdmQOgcVZlTWg9e9zdFVxuvSqEqNAOFbaYT3dyxJd6BAFc/sxYAn8E/l0fFRlJ25B7p
 tjtIDX4C2l8/uitXqg6kiQs/be952BiAJ9ep66R8UA7UDCUh5ryOxo9ly6X9eNTAqoQh
 f/Ysd9g+Yh76fGRcjUSyZBSxzW/rlGRqpo6scZIEQ9euTG9L98OzuV3EWvfvOhbypoWr
 PIjkNLJWkW9luH6UpmCKdlFMKPJBMcaHQ8JNOPYdgNeO5q99NCPkpiKV98lh7fXqwGRT
 w5Fw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=OT3lelpM
Subject: [Buildroot] [PATCH 0/6 v2] support/downloaf/git: add support for
 git attirbutes (branch yem/git-attributes)
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
Cc: Francois Perrad <fperrad@gmail.com>,
 Woody Douglass <wdouglass@carnegierobotics.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello All!

Git attributes are very similar to the decades-old CVS-style keywords
and placeholders; except they are acted on while generating an archive
with git-archive, rather than on checkout.

Some packages (pcm-tools, luajit) use such markers for versioning
information; pcm-tools needs a (short-)hash, while luajit uses the UNIX
timestamp as its semver patch-level.

This series introduces support for git attributes in the git download
backend, cleans up pcm-tools, converts luajit, and updates all other
packages with the new -br2 git version suffix to filenames of generate
archives.

Changes v1 -> v2;
  - drop applied preparatory patches
  - split the update of hash files and runtime test in separate patches
  - convert luajit
  - add migration section in the manual
  - small coding style in awk script

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (6):
      support/download/git: handle git attributes
      package/*: update hashes for packages with export-subst git attibute
      package/*: update filename for git-download packages
      package/luajit: use the git download for known-reproducible tarball
      support/testing: add test for export-subst support in git-download
      docs/manual: document git backend handling of export-subst attribute

 boot/edk2/edk2.hash                                |   2 +-
 boot/vexpress-firmware/vexpress-firmware.hash      |   2 +-
 docs/manual/migrating.txt                          |  19 ++++---
 package/abootimg/abootimg.hash                     |   2 +-
 package/aer-inject/aer-inject.hash                 |   2 +-
 package/am33x-cm3/am33x-cm3.hash                   |   2 +-
 package/armbian-firmware/armbian-firmware.hash     |   2 +-
 package/azure-iot-sdk-c/azure-iot-sdk-c.hash       |   2 +-
 package/bayer2rgb-neon/bayer2rgb-neon.hash         |   2 +-
 package/bpftool/bpftool.hash                       |   2 +-
 package/brickd/brickd.hash                         |   2 +-
 package/c-capnproto/c-capnproto.hash               |   2 +-
 package/dbus-triggerd/dbus-triggerd.hash           |   2 +-
 package/dtv-scan-tables/dtv-scan-tables.hash       |   2 +-
 package/edid-decode/edid-decode.hash               |   2 +-
 package/firmware-utils/firmware-utils.hash         |   2 +-
 package/flashbench/flashbench.hash                 |   2 +-
 package/freescale-imx/imx-lib/imx-lib.hash         |   2 +-
 package/google-breakpad/google-breakpad.hash       |   2 +-
 .../gstreamer1/gst1-interpipe/gst1-interpipe.hash  |   2 +-
 .../gst1-plugins-bayer2rgb-neon.hash               |   2 +-
 package/gstreamer1/gst1-shark/gst1-shark.hash      |   3 +-
 package/ibm-sw-tpm2/ibm-sw-tpm2.hash               |   2 +-
 package/kvmtool/kvmtool.hash                       |   2 +-
 package/libbroadvoice/libbroadvoice.hash           |   2 +-
 package/libcamera/libcamera.hash                   |   2 +-
 package/libdbi-drivers/libdbi-drivers.hash         |   2 +-
 package/libdbi/libdbi.hash                         |   2 +-
 package/libg7221/libg7221.hash                     |   2 +-
 package/libilbc/libilbc.hash                       |   2 +-
 package/libsilk/libsilk.hash                       |   2 +-
 package/libsvgtiny/libsvgtiny.hash                 |   2 +-
 package/libubox/libubox.hash                       |   2 +-
 package/libuci/libuci.hash                         |   2 +-
 package/libyuv/libyuv.hash                         |   2 +-
 .../linux-syscall-support.hash                     |   2 +-
 package/luajit/luajit.hash                         |   2 +-
 package/luajit/luajit.mk                           |  12 +----
 package/mmc-utils/mmc-utils.hash                   |   3 +-
 .../netsurf-buildsystem/netsurf-buildsystem.hash   |   2 +-
 package/odhcp6c/odhcp6c.hash                       |   2 +-
 package/ogre/ogre.hash                             |   2 +-
 package/open62541/open62541.hash                   |   2 +-
 package/opkg-utils/opkg-utils.hash                 |   2 +-
 package/pcm-tools/pcm-tools.hash                   |   2 +-
 package/pcm-tools/pcm-tools.mk                     |   8 ---
 package/piglit/piglit.hash                         |   2 +-
 package/pkg-download.mk                            |   2 +-
 package/prelink-cross/prelink-cross.hash           |   2 +-
 package/psplash/psplash.hash                       |   2 +-
 package/qt-webkit-kiosk/qt-webkit-kiosk.hash       |   2 +-
 package/qt5/qt5coap/qt5coap.hash                   |   2 +-
 package/qt5/qt5knx/qt5knx.hash                     |   2 +-
 package/qt5/qt5location/qt5location.hash           |   2 +-
 package/qt5/qt5mqtt/qt5mqtt.hash                   |   2 +-
 package/qt5/qt5opcua/qt5opcua.hash                 |   2 +-
 .../qt5webengine-chromium-catapult.hash            |   2 +-
 package/rockchip-rkbin/rockchip-rkbin.hash         |   2 +-
 package/rtc-tools/rtc-tools.hash                   |   2 +-
 package/rtmpdump/rtmpdump.hash                     |   2 +-
 package/signal-estimator/signal-estimator.hash     |   2 +-
 package/sox/sox.hash                               |   2 +-
 package/tftpd/tftpd.hash                           |   2 +-
 package/ti-sgx-demos/ti-sgx-demos.hash             |   2 +-
 package/ti-sgx-km/ti-sgx-km.hash                   |   2 +-
 package/ti-sgx-um/ti-sgx-um.hash                   |   2 +-
 package/tl-expected/tl-expected.hash               |   2 +-
 package/tremor/tremor.hash                         |   2 +-
 package/ubus/ubus.hash                             |   2 +-
 package/uclibc-ng-test/uclibc-ng-test.hash         |   2 +-
 package/uemacs/uemacs.hash                         |   2 +-
 package/uhttpd/uhttpd.hash                         |   2 +-
 package/uqmi/uqmi.hash                             |   2 +-
 package/ustream-ssl/ustream-ssl.hash               |   2 +-
 package/vboot-utils/vboot-utils.hash               |   2 +-
 package/wilink-bt-firmware/wilink-bt-firmware.hash |   2 +-
 .../xdriver_xf86-video-intel.hash                  |   2 +-
 .../xdriver_xf86-video-openchrome.hash             |   2 +-
 package/x264/x264.hash                             |   2 +-
 package/yavta/yavta.hash                           |   2 +-
 support/download/git                               |  60 +++++++++++++++++++++
 .../br2-external/git-hash/package/bad/bad.hash     |   2 +-
 .../package/export-subst/export-subst.hash         |   1 +
 .../git-hash/package/export-subst/export-subst.mk  |  10 ++++
 .../br2-external/git-hash/package/good/good.hash   |   2 +-
 .../git-partial-sha1-branch-head.hash              |   2 +-
 .../git-partial-sha1-reachable-by-branch.hash      |   2 +-
 .../git-partial-sha1-reachable-by-tag.hash         |   2 +-
 .../git-partial-sha1-tag-itself.hash               |   2 +-
 .../git-partial-sha1-tag-points-to.hash            |   2 +-
 .../git-sha1-branch-head/git-sha1-branch-head.hash |   2 +-
 .../git-sha1-reachable-by-branch.hash              |   2 +-
 .../git-sha1-reachable-by-tag.hash                 |   2 +-
 .../git-sha1-tag-itself/git-sha1-tag-itself.hash   |   2 +-
 .../git-sha1-tag-points-to.hash                    |   2 +-
 .../git-submodule-disabled.hash                    |   2 +-
 .../git-submodule-enabled.hash                     |   2 +-
 .../git-refs/package/git-tag/git-tag.hash          |   2 +-
 .../git-wrong-content/git-wrong-content.hash       |   2 +-
 .../05/482df734b3715b849ef4a3147a9b1b1f8cca38      | Bin 0 -> 35 bytes
 .../0f/db95cf4f3c5ed4003287649cabb33c5f843e26      | Bin 0 -> 197 bytes
 .../68/28f88dcb0e88b8cd738ad6044ce74d7a9a13c8      | Bin 0 -> 28 bytes
 .../6d/a12b257e47f6089612fe97a8746d2d9c4ca0e0      | Bin 0 -> 112 bytes
 .../download/git-remote/repo.git/refs/heads/master |   2 +-
 support/testing/tests/download/test_git.py         |   4 ++
 105 files changed, 183 insertions(+), 121 deletions(-)
 create mode 100644 support/testing/tests/download/br2-external/git-hash/package/export-subst/export-subst.hash
 create mode 100644 support/testing/tests/download/br2-external/git-hash/package/export-subst/export-subst.mk
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/05/482df734b3715b849ef4a3147a9b1b1f8cca38
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/0f/db95cf4f3c5ed4003287649cabb33c5f843e26
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/68/28f88dcb0e88b8cd738ad6044ce74d7a9a13c8
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/6d/a12b257e47f6089612fe97a8746d2d9c4ca0e0

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

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D567C4345F
	for <buildroot@archiver.kernel.org>; Sat, 27 Apr 2024 18:38:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE2FD6071A;
	Sat, 27 Apr 2024 18:38:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XfXghR0BzHcm; Sat, 27 Apr 2024 18:38:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 482286069E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 482286069E;
	Sat, 27 Apr 2024 18:38:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BB0651BF3C1
 for <buildroot@lists.busybox.net>; Sat, 27 Apr 2024 18:38:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2BFA82CE4
 for <buildroot@lists.busybox.net>; Sat, 27 Apr 2024 18:38:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V15BZFE2-SGQ for <buildroot@lists.busybox.net>;
 Sat, 27 Apr 2024 18:38:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1018882CCA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1018882CCA
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1018882CCA
 for <buildroot@buildroot.org>; Sat, 27 Apr 2024 18:38:03 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-34cd9f50ffaso48748f8f.3
 for <buildroot@buildroot.org>; Sat, 27 Apr 2024 11:38:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714243082; x=1714847882;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xth98rg3ERt4M3q6shPj2adRPTHlZ2GBOKiJtzTXVrM=;
 b=FMywJ3a/y7yiFNNIqi6uphwMUC+qAV9pAuZLH3HeDtJa7w8kt6NjZThnGC6JcNGihO
 DvVwJ7bbcMzWmfEvbDis7gUUj1ZWgq4L0/DIwoR0OYF0DBR7z+d5WsA5e3yBdUx5wkPr
 0BnlUt6DDSOAgaVDf5ym/Em9suFAPAJYAHjAWP3uK1CZB2OaewMPiLtyaaefHEXp7atg
 ZoiBJbzQhbBPamFDZOgA5UfohqqyVO9s1YhmbwXi4IKt0DmqNz7vGVaOWj6cYhMW3ZTL
 C11rHOqdtf4jP5ypDBUy5zG5z0KCZaABH0dSRM6Eahaq3ZjHcafTUrFwUEQ1E8cUNbvH
 LvmA==
X-Gm-Message-State: AOJu0YwS6z+cWjD6iRdmB5bMhIITTVzlIuuPJlFPWjoiCXfFwwJh99V7
 aUupQxO02NGrtvaXk98sFeFNpKpNBY1iHw9hbnRCrYb7M4UakPK+UztOvQ==
X-Google-Smtp-Source: AGHT+IFFfvTCxkfd/pDm944R2t4+Px2tSfY8O1bB+Yc0PQ7haKX+OH7wtlFY9uHPaJHeLxnRzMZMsw==
X-Received: by 2002:a5d:52cd:0:b0:34a:1a7a:9d60 with SMTP id
 r13-20020a5d52cd000000b0034a1a7a9d60mr4423306wrv.62.1714243081288; 
 Sat, 27 Apr 2024 11:38:01 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 x12-20020adfdd8c000000b00349f139dbe4sm25521709wrl.91.2024.04.27.11.38.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Apr 2024 11:38:00 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 27 Apr 2024 20:38:00 +0200
Message-ID: <cover.1714243078.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714243082; x=1714847882; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=xth98rg3ERt4M3q6shPj2adRPTHlZ2GBOKiJtzTXVrM=;
 b=dIXeb2ATZEQhvB5Gx5HZ/egYUgNTDXeRS5NnsY6VHzEf0Q7CjRhwZO0PfJ6nGmLMHk
 mZA2JW6vh+voA0AarUElyUqAPW6l2VUsvsnTvBiqQ9M5RBgsWpU/D3SWo9cI8x+2j4YH
 bDBj+OhhkbN9SY3Vw7muIHNAFdqBp1w+jzVMslNKz/twje3qE+GG08Vuzwt3oBH7Wj2/
 H7fN+hycEKjoF3LuJ/xBXsxTpofRMaLwBJBliD9i0ByENPsczI6xSu/dp1EUiWHxoY0f
 faev7vlPxDI4ry9qPs4GxE4G+qr9Xb0gJhOmbbEvWNvnd2TAXT/RzOTnDJOsZZ58bdbm
 +BGw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=dIXeb2AT
Subject: [Buildroot] [PATCH 00/15 v2] support/download: extend download
 features and reproducibility (branch yem/git-attributes)
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
 Woody Douglass <wdouglass@carnegierobotics.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Francois Perrad <fperrad@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello All!

This series extends the download infra in two ways:
 1. git attributes are emulated
 2- download reproducibility is enhanced

1. git attributes

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

2. download reproducibility

We are going at great length to try and ensure that the archive we
generate are reproducible, so that we can hash them and validat ethe
hashes on further downloads. We so far had quite a strong reproducility,
except for the mode of the files. This was thought to be OK, because
Buildroot runs under a known umask, and thus files are expected to
always be created with the same modes, whatever the actual umask of the
user.

However, that does not account for ACLs, where two or more users can
share a downlaod directory (e.g. on a shared build server), and set the
ACLs with the 'default' xattr, like so:

    $ setfacl -m default:user::rwx ${BR2_DL_DIR}
    $ setfacl -m default:group::rwx ${BR2_DL_DIR}
    $ setfacl -m default:other::rwx ${BR2_DL_DIR}

This has the side effect that, whatever umaks is in use, all files and
directories created in BR2_DL_DIR will be user, group and, and world
redable and writable, and directories will additioanlly be ugo+x.
Usually, i.e. group and others are not expected to have write
permission.

Thus, when we create an archive in that situation, the modes are not
what is expected, and the hashes differ from the ones generated in a
more traditional setup...

This series addresses that in two ways:
  - first, vendored archive gain a version suffix, like for git and svn
  - second, when creating tarballs, the modes are forced to a sane and
    reproducible value

Changes v1 -> v2;
  - drop applied preparatory patches
  - split the update of hash files and runtime test in separate patches
  - convert luajit
  - add migration section in the manual
  - small coding style in awk script

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (15):
      package/flutter-packages: fix and comment the shared _SOURCE variable
      support/download/git: handle git attributes
      package/*: update hashes for packages with export-subst git attibute
      *: update filename for git-download packages
      package/luajit: drop useless post-extract hook
      package/luajit: use the git download for known-reproducible tarball
      support/testing: add test for export-subst support in git-download
      docs/manual: document git backend handling of export-subst attribute
      package/docker-compose: bump version
      package/pkg-utils: add vendoring mechanism into generated archive filename
      support/download: even more reproducible archives (until next time)
      {boot,package}: update hashes of git, svn, go, and cargo archives
      support/testing: update git tests
      board: update hashes of git archives
      docs/manual: document new archive version suffix

 .checkpackageignore                                |   1 +
 board/radxa/rock5b/patches/linux/linux.hash        |   2 +-
 board/toradex/apalis-imx6/patches/linux/linux.hash |   2 +-
 board/toradex/apalis-imx6/patches/uboot/uboot.hash |   2 +-
 boot/edk2/edk2.hash                                |   2 +-
 boot/vexpress-firmware/vexpress-firmware.hash      |   2 +-
 docs/manual/migrating.adoc                         |  26 +++++++++
 package/abootimg/abootimg.hash                     |   2 +-
 package/aer-inject/aer-inject.hash                 |   2 +-
 package/am33x-cm3/am33x-cm3.hash                   |   2 +-
 package/armbian-firmware/armbian-firmware.hash     |   2 +-
 package/azure-iot-sdk-c/azure-iot-sdk-c.hash       |   2 +-
 package/balena-engine/balena-engine.hash           |   2 +-
 package/bat/bat.hash                               |   2 +-
 package/bayer2rgb-neon/bayer2rgb-neon.hash         |   2 +-
 package/bpftool/bpftool.hash                       |   2 +-
 package/brickd/brickd.hash                         |   2 +-
 package/c-capnproto/c-capnproto.hash               |   2 +-
 package/cni-plugins/cni-plugins.hash               |   2 +-
 package/containerd/containerd.hash                 |   2 +-
 package/crucible/crucible.hash                     |   2 +-
 package/dbus-triggerd/dbus-triggerd.hash           |   2 +-
 package/delve/delve.hash                           |   2 +-
 package/depot-tools/depot-tools.hash               |   2 +-
 package/docker-cli/docker-cli.hash                 |   2 +-
 package/docker-compose/docker-compose.hash         |   2 +-
 package/docker-compose/docker-compose.mk           |   2 +-
 package/docker-engine/docker-engine.hash           |   2 +-
 package/dtv-scan-tables/dtv-scan-tables.hash       |   2 +-
 package/dust/dust.hash                             |   2 +-
 package/edid-decode/edid-decode.hash               |   2 +-
 package/embiggen-disk/embiggen-disk.hash           |   2 +-
 package/eza/eza.hash                               |   2 +-
 package/firmware-utils/firmware-utils.hash         |   2 +-
 package/flannel/flannel.hash                       |   2 +-
 package/flashbench/flashbench.hash                 |   2 +-
 package/flutter-packages/flutter-packages.hash     |   2 +-
 package/flutter-packages/flutter-packages.mk       |   8 ++-
 package/flutter-pi/flutter-pi.hash                 |   2 +-
 package/freescale-imx/imx-lib/imx-lib.hash         |   2 +-
 package/gitlab-runner/gitlab-runner.hash           |   2 +-
 package/gocryptfs/gocryptfs.hash                   |   2 +-
 package/google-breakpad/google-breakpad.hash       |   2 +-
 .../gstreamer1/gst1-interpipe/gst1-interpipe.hash  |   2 +-
 .../gst1-plugins-bayer2rgb-neon.hash               |   2 +-
 package/gstreamer1/gst1-shark/gst1-shark.hash      |   3 +-
 package/hyperfine/hyperfine.hash                   |   2 +-
 package/ibm-sw-tpm2/ibm-sw-tpm2.hash               |   2 +-
 package/ivi-homescreen/ivi-homescreen.hash         |   2 +-
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
 package/libxmlrpc/libxmlrpc.hash                   |   2 +-
 package/libyuv/libyuv.hash                         |   2 +-
 .../linux-syscall-support.hash                     |   2 +-
 package/luajit/luajit.hash                         |   2 +-
 package/luajit/luajit.mk                           |  12 +----
 package/mender-artifact/mender-artifact.hash       |   2 +-
 package/mender-connect/mender-connect.hash         |   2 +-
 package/mender/mender.hash                         |   2 +-
 package/mmc-utils/mmc-utils.hash                   |   2 +-
 package/moby-buildkit/moby-buildkit.hash           |   2 +-
 package/mxsldr/mxsldr.hash                         |   2 +-
 package/nerdctl/nerdctl.hash                       |   2 +-
 .../netsurf-buildsystem/netsurf-buildsystem.hash   |   2 +-
 package/nushell/nushell.hash                       |   2 +-
 package/odhcp6c/odhcp6c.hash                       |   2 +-
 package/ogre/ogre.hash                             |   2 +-
 package/open62541/open62541.hash                   |   2 +-
 package/opkg-utils/opkg-utils.hash                 |   2 +-
 package/pcm-tools/pcm-tools.hash                   |   2 +-
 package/pcm-tools/pcm-tools.mk                     |   8 ---
 package/piglit/piglit.hash                         |   2 +-
 package/pkg-download.mk                            |   8 +--
 package/pkg-utils.mk                               |   2 +-
 package/prelink-cross/prelink-cross.hash           |   2 +-
 package/procs/procs.hash                           |   2 +-
 package/psplash/psplash.hash                       |   2 +-
 package/qt-webkit-kiosk/qt-webkit-kiosk.hash       |   2 +-
 package/qt5/qt5coap/qt5coap.hash                   |   2 +-
 package/qt5/qt5knx/qt5knx.hash                     |   2 +-
 package/qt5/qt5location/qt5location.hash           |   2 +-
 package/qt5/qt5mqtt/qt5mqtt.hash                   |   2 +-
 package/qt5/qt5opcua/qt5opcua.hash                 |   2 +-
 .../qt5webengine-chromium-catapult.hash            |   2 +-
 package/ripgrep/ripgrep.hash                       |   2 +-
 package/rockchip-rkbin/rockchip-rkbin.hash         |   2 +-
 package/rtc-tools/rtc-tools.hash                   |   2 +-
 package/rtmpdump/rtmpdump.hash                     |   2 +-
 package/runc/runc.hash                             |   2 +-
 package/rust-bindgen/rust-bindgen.hash             |   2 +-
 package/sentry-cli/sentry-cli.hash                 |   2 +-
 package/signal-estimator/signal-estimator.hash     |   2 +-
 package/sox/sox.hash                               |   2 +-
 package/tealdeer/tealdeer.hash                     |   2 +-
 package/tftpd/tftpd.hash                           |   2 +-
 package/ti-sgx-demos/ti-sgx-demos.hash             |   2 +-
 package/ti-sgx-km/ti-sgx-km.hash                   |   2 +-
 package/ti-sgx-um/ti-sgx-um.hash                   |   2 +-
 package/tinifier/tinifier.hash                     |   2 +-
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
 package/wtfutil/wtfutil.hash                       |   2 +-
 .../xdriver_xf86-video-intel.hash                  |   2 +-
 .../xdriver_xf86-video-openchrome.hash             |   2 +-
 package/x264/x264.hash                             |   2 +-
 package/yavta/yavta.hash                           |   2 +-
 support/download/git                               |  60 +++++++++++++++++++++
 support/download/helpers                           |   2 +-
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
 149 files changed, 251 insertions(+), 158 deletions(-)
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

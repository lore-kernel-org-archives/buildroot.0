Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70194C4345F
	for <buildroot@archiver.kernel.org>; Sat,  4 May 2024 21:40:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3ABB440189;
	Sat,  4 May 2024 21:40:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OZd6hrp_QQy2; Sat,  4 May 2024 21:40:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF1474082E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF1474082E;
	Sat,  4 May 2024 21:40:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0FFFE1BF3C9
 for <buildroot@lists.busybox.net>; Sat,  4 May 2024 21:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EFBEE40300
 for <buildroot@lists.busybox.net>; Sat,  4 May 2024 21:40:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WRewKvBwUVpC for <buildroot@lists.busybox.net>;
 Sat,  4 May 2024 21:40:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 57C7E40189
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57C7E40189
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 57C7E40189
 for <buildroot@buildroot.org>; Sat,  4 May 2024 21:40:24 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-41b782405d5so7839935e9.2
 for <buildroot@buildroot.org>; Sat, 04 May 2024 14:40:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714858822; x=1715463622;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QDDFbOkalblkMssJbVJd+oUzGIGkMSS5lpa4g6a+K8o=;
 b=VgJBk49/c2uGfTjEMjllm2P4XZNmSIOwEQuOSsBWl3gcuFUlaXohPXFlC3BhKkCGCI
 4gipzGGAsvY4r6u0vljIb+xbKnCk02J4nPEYayc4L7flL0Z8DinQFquZyJE7ACBo8I7W
 mxace91dCQHP78Hv4hVBwmCFqTacPwIn0164OHfscW/uIIBXXFFywlgU3sm9As6allri
 55L8M7MOedOqY+QzG8iQrK+t5Yi/mZlq+h2BO2iYk/uNKdmk5odqa4VhuxRi1ghcOGSb
 c4zQ7teIR01f4sbHDO9UpXVy1oGKEo2w+WFrvae1LSR3Z9O9tcvxTJ4HuU7eXqnwCdUc
 Axtw==
X-Gm-Message-State: AOJu0YyUzdQ6VFXbz4M06BF8mnuiEG2rhhy2ganfuNSrmiU0RGG1YO7X
 y8k/Qcjn/LUjYt+8yxGgbhd7ufTaMdvWUctPBmrSEWFnp+9Z0dl3JwwJ6g==
X-Google-Smtp-Source: AGHT+IG0xmi5iMU/tF/aX0iZoxxOQTdkrCGZ9hEVypLp7oMQQy4NLrGFPqOjroVkhffbufgLHogZBA==
X-Received: by 2002:a05:600c:4e42:b0:41a:adc3:f777 with SMTP id
 e2-20020a05600c4e4200b0041aadc3f777mr6373893wmq.16.1714858822028; 
 Sat, 04 May 2024 14:40:22 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 a6-20020a05600c348600b0041c14e42e2bsm10368385wmq.44.2024.05.04.14.40.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 May 2024 14:40:21 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat,  4 May 2024 23:40:20 +0200
Message-ID: <cover.1714858818.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714858822; x=1715463622; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=QDDFbOkalblkMssJbVJd+oUzGIGkMSS5lpa4g6a+K8o=;
 b=AqfMgb/lKEQLduJoty/baDQe9gSusH4CjszyznySo4LPJ4uA4Zdu4w8F7J7cLLJRJq
 ZJstZi7avXgJrSXOS8d9j+GIBXNY3hcB2xRlWdzYZbUFJEtiGYjCGM/yhmZjHQhMJPie
 0jXW6SJFarWHrODlfAkIv2Dd6XjKWpK64ilZ4VkrYA+GH7MaCfiAGHlteu9+dR7KgzuH
 veh2tdIQpUeySl7VI3sYRxwKiYCmqdo5olQedXZX8MZvI1g3CsoPeYiCPKxjBL4j8sB+
 1QO313cY7kPE9RjLXJNWCvQ9TXIgAOSXHBkBCyNuw4kjwDqEcBVKE3zveL3v+bT9PRFu
 nLXA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=AqfMgb/l
Subject: [Buildroot] [PATCH 00/22 v3] support/download: extend download
 features and reproducibility (branch yem/git-attributes-2)
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
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Woody Douglass <wdouglass@carnegierobotics.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Francois Perrad <fperrad@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello All!

This series extends the download infra in three ways:
 1. git attributes are emulated
 2. download reproducibility is enhanced
 3. bump tar

----------------------------------------
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

----------------------------------------
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

----------------------------------------
3. bump tar version

Currently, we are stuck to tar 1.34 (at least ofr the host variant),
because tar 1.35 introduced a change in how devmajor/devminor fields are
stored for non-dev files (empty instead of zero), which broke the
reproducibility with the previous versions.

Since we are regenerating all our generated archives, take that
opportunity to also bump the tar version.

----------------------------------------
Changes v2 -> v3;
  - bump tar version  (Arnout)
  - drop luajit patch to switch to git-download  (Arnout)
  - reorder patches (package fixes first)
  - fix hashes for two missed packages

Changes v1 -> v2;
  - drop applied preparatory patches
  - split the update of hash files and runtime test in separate patches
  - convert luajit
  - add migration section in the manual
  - small coding style in awk script

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Fabrice Fontaine (1):
      package/tar: security bump to version 1.35

Yann E. MORIN (21):
      package/docker-compose: bump version
      package/am33x-cm3: switch upstream
      package/flutter-packages: fix and comment the shared _SOURCE variable
      package/luajit: drop useless post-extract hook
      support/download/git: handle git attributes
      support/testing: add test for export-subst support in git-download
      package/*: update hashes for packages with export-subst git attibute
      *: update filename for git-download packages
      docs/manual: document git backend handling of export-subst attribute
      package/pkg-utils: add vendoring mechanism into generated archive filename
      support/download: even more reproducible archives (until next time)
      support/testing: update git tests
      {boot, package}: update hashes of git, svn, go, and cargo archives
      board: update hashes of git archives
      docs/manual: document new archive version suffix
      support/dependencies: require tar >= 1.35
      support/testing: update hashes for generated archives
      board: update hashes for generated achives
      {boot,package}: update hashes for generated archives
      docs/manual: update archives version suffixes
      support/download: force fetching tags

 board/radxa/rock5b/patches/linux/linux.hash        |   2 +-
 board/toradex/apalis-imx6/patches/linux/linux.hash |   2 +-
 board/toradex/apalis-imx6/patches/uboot/uboot.hash |   2 +-
 boot/edk2/edk2.hash                                |   2 +-
 boot/vexpress-firmware/vexpress-firmware.hash      |   2 +-
 docs/manual/migrating.adoc                         |  58 +++++++++++++++++++
 package/abootimg/abootimg.hash                     |   2 +-
 package/aer-inject/aer-inject.hash                 |   2 +-
 package/am33x-cm3/am33x-cm3.hash                   |   2 +-
 package/am33x-cm3/am33x-cm3.mk                     |   2 +-
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
 package/flutter-packages/flutter-packages.mk       |   9 ++-
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
 package/luajit/luajit.mk                           |   9 ---
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
 package/pkg-download.mk                            |   8 ++-
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
 ...Fix-boundary-checking-in-base-256-decoder.patch |  33 -----------
 package/tar/tar.hash                               |   6 +-
 package/tar/tar.mk                                 |  16 ++++--
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
 support/dependencies/check-host-tar.sh             |  19 ++-----
 support/download/git                               |  62 ++++++++++++++++++++-
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
 152 files changed, 299 insertions(+), 215 deletions(-)
 delete mode 100644 package/tar/0002-Fix-boundary-checking-in-base-256-decoder.patch
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

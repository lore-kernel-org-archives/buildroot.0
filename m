Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EDF3C4345F
	for <buildroot@archiver.kernel.org>; Sat, 27 Apr 2024 18:39:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B939460A3E;
	Sat, 27 Apr 2024 18:39:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v-mLe9NV9Ogw; Sat, 27 Apr 2024 18:39:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4054460D52
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4054460D52;
	Sat, 27 Apr 2024 18:39:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3792D1BF3C1
 for <buildroot@lists.busybox.net>; Sat, 27 Apr 2024 18:38:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E10C482CE5
 for <buildroot@lists.busybox.net>; Sat, 27 Apr 2024 18:38:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x2lC23LO6KZE for <buildroot@lists.busybox.net>;
 Sat, 27 Apr 2024 18:38:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 01E9282CE4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01E9282CE4
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 01E9282CE4
 for <buildroot@buildroot.org>; Sat, 27 Apr 2024 18:38:10 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-346406a5fb9so2486634f8f.1
 for <buildroot@buildroot.org>; Sat, 27 Apr 2024 11:38:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714243089; x=1714847889;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8KYZ9xHhtlxZpcp6wo1In3b9z983jn9/NducbeVXO7w=;
 b=KIfuFtQHt7wNogiwiGgARQeDyCAjm/ieYnX8HEFu/TkVBcCQ2fLEXb3KKu3a2xLnG+
 kNDUF9U+WWQeZX1XakkQgUHskMvRnXMoRStYIDpJrimRY4LUPqQo/nicmAjZU5jC8+2l
 7+kixYv3PYx5iT3a2OpzW/5tE72k2XvBY3OC+k3Q+kzxL2uMR3Bf354MSMAuc9a/NjQ8
 7KOIopoHJ7aW4/vy7j3/1KdDVJM0ZzBuxSPKdwMdHfXGkWGuH7CEy3EKcE5lOR7Sm3lz
 K6ZHvHKgBrtKHdJkR3HgWCm7avsug3U0AK45ZO4pR2PQkeFOnYBxpFo4htTX10njUAj5
 +xpw==
X-Gm-Message-State: AOJu0Yxb/4dox6i8P94hfKw/848JUkP3NKK/x3cNHIv0EL3vQpiOvHRZ
 iUl2vPEFQ1TLmWfOmezRAWfur12IE3z/B1c5cEY3nb1m/KNT9uVfX3MkJw==
X-Google-Smtp-Source: AGHT+IEA8bFDkuATaMYJkHuIE10hD1u2qIjZFp/bIA5vCDrcloLUvdTYeuUI7/F/hLqrNufZPOWq3g==
X-Received: by 2002:a05:6000:156d:b0:346:b95f:277b with SMTP id
 13-20020a056000156d00b00346b95f277bmr5196663wrz.48.1714243088411; 
 Sat, 27 Apr 2024 11:38:08 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 k21-20020adfb355000000b0034c6b368aecsm4136589wrd.26.2024.04.27.11.38.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Apr 2024 11:38:08 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 27 Apr 2024 20:37:59 +0200
Message-ID: <bfaead24fe51b8b12ee14eccfb2f105edbc8821c.1714243078.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1714243078.git.yann.morin.1998@free.fr>
References: <cover.1714243078.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714243089; x=1714847889; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8KYZ9xHhtlxZpcp6wo1In3b9z983jn9/NducbeVXO7w=;
 b=GJVsmqhyZ4Tdn//pzD1UkhtBmNOyCM2mjKxhD12SdzwegBJ4//u32+IZJ8nd1DkS85
 6M63IUHOspRZanV42P/rTS2DHQL/W7GO/RY3DuAiEsfoX/jSI3Ragm2r6qxN3DdW/Je6
 LkBvw6LfsMhk9+SCZARctgHt4uaEuKzH1dBt3GVfSC/HS5ge0HsBvU4KG2cNfTAkgx5r
 WepoSpD+KpoN7L/Sfwk28jRTnKnuAGgECaJCXOMcq+YL/0YPcJ1LfPd5MptRc9xK+eP5
 ns8009JJwvC1egh9fNis0fHuHaXVmB+Hn9YHUblKVbI3WDxwyISpobVAaxRk4zqusYjW
 lZng==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GJVsmqhy
Subject: [Buildroot] [PATCH 12/15 v2] {boot, package}: update hashes of git,
 svn, go, and cargo archives
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Replace all git and svn packages archive names in hash files:

    $ sed -r -i -e 's/-br2/-git3/; s/-br3/-svn4/' $(
        git grep -l -E -- '-br2|-br3' '*.hash'
    )

    $ sed -r -i -e 's/(\.tar\.gz)$/-go1\1/' $(
        git grep -l -E '\$\(eval \$\((host-)?golang-package\)\)' '*.mk' \
        |sed -r -e 's/\.mk$/.hash/' \
        |sort -u
    )

    $ sed -r -i -e 's/(\.tar\.gz)$/-cargo1\1/' $(
        git grep -l -E '\$\(eval \$\((host-)?cargo-package\)\)' '*.mk' \
        |sed -r -e 's/\.mk$/.hash/' \
        |sort -u
    )

Then a bit of make source (based on: git diff --name-only), a lot of
sweat, and carefuylly checking the new archives to verify that only
modes have changed...

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 boot/edk2/edk2.hash                                             | 2 +-
 boot/vexpress-firmware/vexpress-firmware.hash                   | 2 +-
 package/abootimg/abootimg.hash                                  | 2 +-
 package/aer-inject/aer-inject.hash                              | 2 +-
 package/am33x-cm3/am33x-cm3.hash                                | 2 +-
 package/armbian-firmware/armbian-firmware.hash                  | 2 +-
 package/azure-iot-sdk-c/azure-iot-sdk-c.hash                    | 2 +-
 package/balena-engine/balena-engine.hash                        | 2 +-
 package/bat/bat.hash                                            | 2 +-
 package/bayer2rgb-neon/bayer2rgb-neon.hash                      | 2 +-
 package/bpftool/bpftool.hash                                    | 2 +-
 package/brickd/brickd.hash                                      | 2 +-
 package/c-capnproto/c-capnproto.hash                            | 2 +-
 package/cni-plugins/cni-plugins.hash                            | 2 +-
 package/containerd/containerd.hash                              | 2 +-
 package/crucible/crucible.hash                                  | 2 +-
 package/dbus-triggerd/dbus-triggerd.hash                        | 2 +-
 package/delve/delve.hash                                        | 2 +-
 package/depot-tools/depot-tools.hash                            | 2 +-
 package/docker-cli/docker-cli.hash                              | 2 +-
 package/docker-compose/docker-compose.hash                      | 2 +-
 package/docker-engine/docker-engine.hash                        | 2 +-
 package/dtv-scan-tables/dtv-scan-tables.hash                    | 2 +-
 package/dust/dust.hash                                          | 2 +-
 package/edid-decode/edid-decode.hash                            | 2 +-
 package/embiggen-disk/embiggen-disk.hash                        | 2 +-
 package/eza/eza.hash                                            | 2 +-
 package/firmware-utils/firmware-utils.hash                      | 2 +-
 package/flannel/flannel.hash                                    | 2 +-
 package/flashbench/flashbench.hash                              | 2 +-
 package/flutter-pi/flutter-pi.hash                              | 2 +-
 package/freescale-imx/imx-lib/imx-lib.hash                      | 2 +-
 package/gitlab-runner/gitlab-runner.hash                        | 2 +-
 package/gocryptfs/gocryptfs.hash                                | 2 +-
 package/google-breakpad/google-breakpad.hash                    | 2 +-
 package/gstreamer1/gst1-interpipe/gst1-interpipe.hash           | 2 +-
 .../gst1-plugins-bayer2rgb-neon.hash                            | 2 +-
 package/gstreamer1/gst1-shark/gst1-shark.hash                   | 2 +-
 package/hyperfine/hyperfine.hash                                | 2 +-
 package/ibm-sw-tpm2/ibm-sw-tpm2.hash                            | 2 +-
 package/ivi-homescreen/ivi-homescreen.hash                      | 2 +-
 package/kvmtool/kvmtool.hash                                    | 2 +-
 package/libbroadvoice/libbroadvoice.hash                        | 2 +-
 package/libcamera/libcamera.hash                                | 2 +-
 package/libdbi-drivers/libdbi-drivers.hash                      | 2 +-
 package/libdbi/libdbi.hash                                      | 2 +-
 package/libg7221/libg7221.hash                                  | 2 +-
 package/libilbc/libilbc.hash                                    | 2 +-
 package/libsilk/libsilk.hash                                    | 2 +-
 package/libsvgtiny/libsvgtiny.hash                              | 2 +-
 package/libubox/libubox.hash                                    | 2 +-
 package/libuci/libuci.hash                                      | 2 +-
 package/libxmlrpc/libxmlrpc.hash                                | 2 +-
 package/libyuv/libyuv.hash                                      | 2 +-
 package/linux-syscall-support/linux-syscall-support.hash        | 2 +-
 package/luajit/luajit.hash                                      | 2 +-
 package/mender-artifact/mender-artifact.hash                    | 2 +-
 package/mender-connect/mender-connect.hash                      | 2 +-
 package/mender/mender.hash                                      | 2 +-
 package/mmc-utils/mmc-utils.hash                                | 2 +-
 package/moby-buildkit/moby-buildkit.hash                        | 2 +-
 package/mxsldr/mxsldr.hash                                      | 2 +-
 package/nerdctl/nerdctl.hash                                    | 2 +-
 package/netsurf-buildsystem/netsurf-buildsystem.hash            | 2 +-
 package/nushell/nushell.hash                                    | 2 +-
 package/odhcp6c/odhcp6c.hash                                    | 2 +-
 package/ogre/ogre.hash                                          | 2 +-
 package/open62541/open62541.hash                                | 2 +-
 package/opkg-utils/opkg-utils.hash                              | 2 +-
 package/pcm-tools/pcm-tools.hash                                | 2 +-
 package/piglit/piglit.hash                                      | 2 +-
 package/prelink-cross/prelink-cross.hash                        | 2 +-
 package/procs/procs.hash                                        | 2 +-
 package/psplash/psplash.hash                                    | 2 +-
 package/qt-webkit-kiosk/qt-webkit-kiosk.hash                    | 2 +-
 package/qt5/qt5coap/qt5coap.hash                                | 2 +-
 package/qt5/qt5knx/qt5knx.hash                                  | 2 +-
 package/qt5/qt5location/qt5location.hash                        | 2 +-
 package/qt5/qt5mqtt/qt5mqtt.hash                                | 2 +-
 package/qt5/qt5opcua/qt5opcua.hash                              | 2 +-
 .../qt5webengine-chromium-catapult.hash                         | 2 +-
 package/ripgrep/ripgrep.hash                                    | 2 +-
 package/rockchip-rkbin/rockchip-rkbin.hash                      | 2 +-
 package/rtc-tools/rtc-tools.hash                                | 2 +-
 package/rtmpdump/rtmpdump.hash                                  | 2 +-
 package/runc/runc.hash                                          | 2 +-
 package/rust-bindgen/rust-bindgen.hash                          | 2 +-
 package/sentry-cli/sentry-cli.hash                              | 2 +-
 package/signal-estimator/signal-estimator.hash                  | 2 +-
 package/sox/sox.hash                                            | 2 +-
 package/tealdeer/tealdeer.hash                                  | 2 +-
 package/tftpd/tftpd.hash                                        | 2 +-
 package/ti-sgx-demos/ti-sgx-demos.hash                          | 2 +-
 package/ti-sgx-km/ti-sgx-km.hash                                | 2 +-
 package/ti-sgx-um/ti-sgx-um.hash                                | 2 +-
 package/tinifier/tinifier.hash                                  | 2 +-
 package/tl-expected/tl-expected.hash                            | 2 +-
 package/tremor/tremor.hash                                      | 2 +-
 package/ubus/ubus.hash                                          | 2 +-
 package/uclibc-ng-test/uclibc-ng-test.hash                      | 2 +-
 package/uemacs/uemacs.hash                                      | 2 +-
 package/uhttpd/uhttpd.hash                                      | 2 +-
 package/uqmi/uqmi.hash                                          | 2 +-
 package/ustream-ssl/ustream-ssl.hash                            | 2 +-
 package/vboot-utils/vboot-utils.hash                            | 2 +-
 package/wilink-bt-firmware/wilink-bt-firmware.hash              | 2 +-
 package/wtfutil/wtfutil.hash                                    | 2 +-
 .../xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash      | 2 +-
 .../xdriver_xf86-video-openchrome.hash                          | 2 +-
 package/x264/x264.hash                                          | 2 +-
 package/yavta/yavta.hash                                        | 2 +-
 111 files changed, 111 insertions(+), 111 deletions(-)

diff --git a/boot/edk2/edk2.hash b/boot/edk2/edk2.hash
index 3af2bdbc88..44f8f1f255 100644
--- a/boot/edk2/edk2.hash
+++ b/boot/edk2/edk2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9389ad20bc75f2a8fa9e7c1b1948ef07481c94e96dec57ae2f9f9be9c754f92c  edk2-edk2-stable202308-br2.tar.gz
+sha256  009ee7eeb7d7911cae8367e86bc3605465713aceb478d8603acc314ae39f8782  edk2-edk2-stable202308-git3.tar.gz
 sha256  50ce20c9cfdb0e19ee34fe0a51fc0afe961f743697b068359ab2f862b494df80  License.txt
diff --git a/boot/vexpress-firmware/vexpress-firmware.hash b/boot/vexpress-firmware/vexpress-firmware.hash
index 9a837a88df..1814b7fd93 100644
--- a/boot/vexpress-firmware/vexpress-firmware.hash
+++ b/boot/vexpress-firmware/vexpress-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  ea92d686e6e211074fb0f62cb5e011f4cfc294c7f6ec9fb27b7d987db7bf51c5  vexpress-firmware-901f81977c3b367a2e0bf3d6444be302822d97a3-br2.tar.gz
+sha256  ea92d686e6e211074fb0f62cb5e011f4cfc294c7f6ec9fb27b7d987db7bf51c5  vexpress-firmware-901f81977c3b367a2e0bf3d6444be302822d97a3-git3.tar.gz
diff --git a/package/abootimg/abootimg.hash b/package/abootimg/abootimg.hash
index 2cb2e2ac7c..ed4fd787fa 100644
--- a/package/abootimg/abootimg.hash
+++ b/package/abootimg/abootimg.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f377da42a57d982cfc22fa75c5a69febdc3e4c1ef43cd0ceaec42e14067e2f37  abootimg-1ebeb393252ab5aeed62e34bc439b6728444f06e-br2.tar.gz
+sha256  f377da42a57d982cfc22fa75c5a69febdc3e4c1ef43cd0ceaec42e14067e2f37  abootimg-1ebeb393252ab5aeed62e34bc439b6728444f06e-git3.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/aer-inject/aer-inject.hash b/package/aer-inject/aer-inject.hash
index 052c503240..610ae3e112 100644
--- a/package/aer-inject/aer-inject.hash
+++ b/package/aer-inject/aer-inject.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2dd2bd73aa738c1cc26ba04b6e502329778d18c2cc873c0bd00e6b2d38e9477c  aer-inject-9bd5e2c7886fca72f139cd8402488a2235957d41-br2.tar.gz
+sha256  2dd2bd73aa738c1cc26ba04b6e502329778d18c2cc873c0bd00e6b2d38e9477c  aer-inject-9bd5e2c7886fca72f139cd8402488a2235957d41-git3.tar.gz
 sha256  659a191d8775e05c6c6a9a4ba66b3577c577342bb83f20d393135eb6633c8973  README
diff --git a/package/am33x-cm3/am33x-cm3.hash b/package/am33x-cm3/am33x-cm3.hash
index b0750ac2d2..5bd5d2c35e 100644
--- a/package/am33x-cm3/am33x-cm3.hash
+++ b/package/am33x-cm3/am33x-cm3.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c0b11d7ed2300172354f2948e858ddb5cae19d084bd1ab6d48cfa7b6bfa13261  am33x-cm3-11107db2f1e9e58ee75d4fe9cc38423c9a6e4365-br2.tar.gz
+sha256  c0b11d7ed2300172354f2948e858ddb5cae19d084bd1ab6d48cfa7b6bfa13261  am33x-cm3-11107db2f1e9e58ee75d4fe9cc38423c9a6e4365-git3.tar.gz
 sha256  e136e6949a1d3ca144374375af8b9387faa11d2eee7debff8cf22ca8fe7bf7e9  License.txt
diff --git a/package/armbian-firmware/armbian-firmware.hash b/package/armbian-firmware/armbian-firmware.hash
index ea3d7f845c..fecff5caf3 100644
--- a/package/armbian-firmware/armbian-firmware.hash
+++ b/package/armbian-firmware/armbian-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  725b1f65a5947f053a593f917f91c6634d496c92af6180845cc3679d1377ab79  armbian-firmware-5d685ad233b4dfd03a4d025fa0061f6b0f850cb3-br2.tar.gz
+sha256  aae090f892e59124fe29fc35f4a81eeee3960e58db2be7dd2d991155b46d3c02  armbian-firmware-5d685ad233b4dfd03a4d025fa0061f6b0f850cb3-git3.tar.gz
diff --git a/package/azure-iot-sdk-c/azure-iot-sdk-c.hash b/package/azure-iot-sdk-c/azure-iot-sdk-c.hash
index 0f1ca2ec62..0dd86dd681 100644
--- a/package/azure-iot-sdk-c/azure-iot-sdk-c.hash
+++ b/package/azure-iot-sdk-c/azure-iot-sdk-c.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  b853d5ab04f3c6863fe78e3936f0d0840012d5260ae4a3b23f03e157395dc15b  azure-iot-sdk-c-LTS_08_2023-br2.tar.gz
+sha256  b853d5ab04f3c6863fe78e3936f0d0840012d5260ae4a3b23f03e157395dc15b  azure-iot-sdk-c-LTS_08_2023-git3.tar.gz
 
 # Hash for license files:
 sha256  be2e9913fad9ff33607287c728f392579e2a6cc83e51b203ef6274c41db02ee7  LICENSE
diff --git a/package/balena-engine/balena-engine.hash b/package/balena-engine/balena-engine.hash
index 6a92a40cc8..ce5e2ba7f4 100644
--- a/package/balena-engine/balena-engine.hash
+++ b/package/balena-engine/balena-engine.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  1482b64e35d5406be719e362647ed7d0599cf4eead7770247ebd972c4c85ede5  balena-engine-20.10.26.tar.gz
+sha256  1482b64e35d5406be719e362647ed7d0599cf4eead7770247ebd972c4c85ede5  balena-engine-20.10.26-go1.tar.gz
 sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/bat/bat.hash b/package/bat/bat.hash
index 3fc01aff7f..775838d921 100644
--- a/package/bat/bat.hash
+++ b/package/bat/bat.hash
@@ -1,4 +1,4 @@
 # Locally generated
-sha256  59d40adf1532834613752511cb5349679bf82f7f20b98e42de50472d4aa97970  bat-0.24.0.tar.gz
+sha256  6a32062aeb76b8d7d4cffbb5b267818ee1f35149af0c35fdb8999cea63e65854  bat-0.24.0-cargo1.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE-APACHE
 sha256  dccda9eb9533f5c65624a1106536c6cfde46008d58e60b3faf154e8b9fd5b46e  LICENSE-MIT
diff --git a/package/bayer2rgb-neon/bayer2rgb-neon.hash b/package/bayer2rgb-neon/bayer2rgb-neon.hash
index 82ff5025d6..9d2ff402a7 100644
--- a/package/bayer2rgb-neon/bayer2rgb-neon.hash
+++ b/package/bayer2rgb-neon/bayer2rgb-neon.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  35b38a40e98e9fa7fb8042c718f460fb806e916d2bf3e9721c07bbe4b42faad5  bayer2rgb-neon-bc950b3398ba034fe5cc39f625796a6111cdb87f-br2.tar.gz
+sha256  35b38a40e98e9fa7fb8042c718f460fb806e916d2bf3e9721c07bbe4b42faad5  bayer2rgb-neon-bc950b3398ba034fe5cc39f625796a6111cdb87f-git3.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/bpftool/bpftool.hash b/package/bpftool/bpftool.hash
index c5a6a1c75a..19adffed7c 100644
--- a/package/bpftool/bpftool.hash
+++ b/package/bpftool/bpftool.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  35ff149cab4a3ab209b0c04cab2707243ab7ee753de5f4b5678296c975cf7fe0  bpftool-v7.1.0-br2.tar.gz
+sha256  35ff149cab4a3ab209b0c04cab2707243ab7ee753de5f4b5678296c975cf7fe0  bpftool-v7.1.0-git3.tar.gz
 sha256  7c588754d5e81e92e2a12e47cf78949d485c9c22b4850f12d21b3835c85947d1  LICENSE
 sha256  6313108c23efffa36948f8b2cff1560a5935373b527b0e1a837cc77e6ed1bacd  LICENSE.BSD-2-Clause
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL-2.0
diff --git a/package/brickd/brickd.hash b/package/brickd/brickd.hash
index bd6036afe6..b603a451c4 100644
--- a/package/brickd/brickd.hash
+++ b/package/brickd/brickd.hash
@@ -1,5 +1,5 @@
 # Locally computed hash
-sha256  8469b6959a7e32c4b39a56e1a4f7479f785d83e6db3269487f5312f3cf1df382  brickd-v1.2.2-br2.tar.gz
+sha256  8469b6959a7e32c4b39a56e1a4f7479f785d83e6db3269487f5312f3cf1df382  brickd-v1.2.2-git3.tar.gz
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.txt
diff --git a/package/c-capnproto/c-capnproto.hash b/package/c-capnproto/c-capnproto.hash
index a73b4fa684..31dc331ccf 100644
--- a/package/c-capnproto/c-capnproto.hash
+++ b/package/c-capnproto/c-capnproto.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1e35ef786bd8e418ff04fccb20ac881a87fa2fa76df1cbddc4774e35423bafb8  c-capnproto-9053ebe6eeb2ae762655b982e27c341cb568366d-br2.tar.gz
+sha256  1e35ef786bd8e418ff04fccb20ac881a87fa2fa76df1cbddc4774e35423bafb8  c-capnproto-9053ebe6eeb2ae762655b982e27c341cb568366d-git3.tar.gz
 sha256  27797e6c7dce96675d79ed250584d157b7a86405db6eb6fba9644e6d96d42c57  COPYING
diff --git a/package/cni-plugins/cni-plugins.hash b/package/cni-plugins/cni-plugins.hash
index 90cb184604..deb0b6f258 100644
--- a/package/cni-plugins/cni-plugins.hash
+++ b/package/cni-plugins/cni-plugins.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f9871b9f6ccb51d2b264532e96521e44f926928f91434b56ce135c95becf2901  cni-plugins-1.3.0.tar.gz
+sha256  f9871b9f6ccb51d2b264532e96521e44f926928f91434b56ce135c95becf2901  cni-plugins-1.3.0-go1.tar.gz
 sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE
diff --git a/package/containerd/containerd.hash b/package/containerd/containerd.hash
index 193003e5a3..7edfd21ee7 100644
--- a/package/containerd/containerd.hash
+++ b/package/containerd/containerd.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  ae55b25fb04b45dfbbde8280b034783a48ae7c40350d17fd272be5cbf0284cf1  containerd-1.7.14.tar.gz
+sha256  ae55b25fb04b45dfbbde8280b034783a48ae7c40350d17fd272be5cbf0284cf1  containerd-1.7.14-go1.tar.gz
 sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
diff --git a/package/crucible/crucible.hash b/package/crucible/crucible.hash
index 3a9a716732..6edc0be744 100644
--- a/package/crucible/crucible.hash
+++ b/package/crucible/crucible.hash
@@ -1,2 +1,2 @@
-sha256  d21842f050163765269290d72fe79d3f95005038e865138d94e247cb455098da  crucible-2023.11.02.tar.gz
+sha256  0bed6766e5d584805c117fa049a050ccb9079f41449c661e20845414ed930868  crucible-2023.11.02-go1.tar.gz
 sha256  a89c50d83be30fe7ec75be69a07f6c1b5dfaae0a6b94a678d2394fff34acb69c  LICENSE
diff --git a/package/dbus-triggerd/dbus-triggerd.hash b/package/dbus-triggerd/dbus-triggerd.hash
index 8de278d67b..b1b5c28aa0 100644
--- a/package/dbus-triggerd/dbus-triggerd.hash
+++ b/package/dbus-triggerd/dbus-triggerd.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  930cccfe8bdff98cab0cff003d90f9421858850d2d00143108191b62b4ef5e5a  dbus-triggerd-ba3dbec805cb707c94c54de21666bf18b79bcc09-br2.tar.gz
+sha256  930cccfe8bdff98cab0cff003d90f9421858850d2d00143108191b62b4ef5e5a  dbus-triggerd-ba3dbec805cb707c94c54de21666bf18b79bcc09-git3.tar.gz
 sha256  30d135650639af9019633690fc1aecbfc150aeeef9446347d4286a58338d10b0  dbus-triggerd.c
diff --git a/package/delve/delve.hash b/package/delve/delve.hash
index 3b0798e77c..86f3c8cc5c 100644
--- a/package/delve/delve.hash
+++ b/package/delve/delve.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  fe6f0d97c233d4f0f1ed422c11508cc57c14e9e0915f9a258f1912c46824cbfb  delve-1.22.1.tar.gz
+sha256  fe6f0d97c233d4f0f1ed422c11508cc57c14e9e0915f9a258f1912c46824cbfb  delve-1.22.1-go1.tar.gz
 sha256  778864b990007e8cef6633f8c372dd05bac1fada6cf67b008afb1483f83b38f5  LICENSE
diff --git a/package/depot-tools/depot-tools.hash b/package/depot-tools/depot-tools.hash
index 0d15d59e69..1cda4040bd 100644
--- a/package/depot-tools/depot-tools.hash
+++ b/package/depot-tools/depot-tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  5da23d7558975093c6a732f5743c7f224d16dd3f878a6a1b577b1b127a4098cc  depot-tools-8d14454ba4a35fd9d2483842b08815a2357ec86f-br2.tar.gz
+sha256  aae1c07274691c29ed9962255a7621f8198d0f05a1a7e144ebee76d991a5b9bf  depot-tools-8d14454ba4a35fd9d2483842b08815a2357ec86f-git3.tar.gz
 sha256  984523ee987f4e8b72d61df37d8f1189a7077cd4b77e41a397e35593b297a29d  LICENSE
diff --git a/package/docker-cli/docker-cli.hash b/package/docker-cli/docker-cli.hash
index 26558814c1..cff729c8e5 100644
--- a/package/docker-cli/docker-cli.hash
+++ b/package/docker-cli/docker-cli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  96ed5d7c33a12f505d13fa03fa48f94cb41cf871178df0df84aa0b76839ad321  docker-cli-26.0.0.tar.gz
+sha256  96ed5d7c33a12f505d13fa03fa48f94cb41cf871178df0df84aa0b76839ad321  docker-cli-26.0.0-go1.tar.gz
 sha256  2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-compose/docker-compose.hash b/package/docker-compose/docker-compose.hash
index d55e35eb16..7e7d974ef2 100644
--- a/package/docker-compose/docker-compose.hash
+++ b/package/docker-compose/docker-compose.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  105328838a48dad4a305903c5ae98b928e8a4ea3546e1711690e9eef7e0232be  docker-compose-2.26.1.tar.gz
+sha256  105328838a48dad4a305903c5ae98b928e8a4ea3546e1711690e9eef7e0232be  docker-compose-2.26.1-go1.tar.gz
 sha256  58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  LICENSE
diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index 5c76b99af3..71358c8aa8 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  fae1aabb63ed5cf6d302a5f4266ed092716b1cea9a974a9d61154ef31b03c302  docker-engine-26.0.0.tar.gz
+sha256  fae1aabb63ed5cf6d302a5f4266ed092716b1cea9a974a9d61154ef31b03c302  docker-engine-26.0.0-go1.tar.gz
 sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/dtv-scan-tables/dtv-scan-tables.hash b/package/dtv-scan-tables/dtv-scan-tables.hash
index c3c0e05619..9a4fd2adca 100644
--- a/package/dtv-scan-tables/dtv-scan-tables.hash
+++ b/package/dtv-scan-tables/dtv-scan-tables.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  b77c6bcbbc20f6b6bdbf735fb75cf9bec8634e1e6d3a32e6db2573deeb7a2212  dtv-scan-tables-57ed2982275045ea5e92ef2a40b9fa58255852e5-br2.tar.gz
+sha256  b77c6bcbbc20f6b6bdbf735fb75cf9bec8634e1e6d3a32e6db2573deeb7a2212  dtv-scan-tables-57ed2982275045ea5e92ef2a40b9fa58255852e5-git3.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
 sha256  4fd46f32582c29007657e2daad8d0a6d954cf4e9d2e47bae8f8d8c32765fc987  COPYING.LGPL
diff --git a/package/dust/dust.hash b/package/dust/dust.hash
index 8f202d4870..0b2f123080 100644
--- a/package/dust/dust.hash
+++ b/package/dust/dust.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b1712d3bcb7443e892019b0dcfa378d97e8e35f4b21e7ab62523cc30fb974c19  dust-0.9.0.tar.gz
+sha256  fffe56f60bb596213edcd054f45e3b611c4b9b7861ff4a1bb9e0721012474032  dust-0.9.0-cargo1.tar.gz
 sha256  aee6e2d13d3a55c7881630c09b41ca7b3b44bb1437b5d36695d22decc3655160  LICENSE
diff --git a/package/edid-decode/edid-decode.hash b/package/edid-decode/edid-decode.hash
index 93c4ef7e71..3e127b979e 100644
--- a/package/edid-decode/edid-decode.hash
+++ b/package/edid-decode/edid-decode.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a8774f1d3eb031ffa4ecb85135b47ad28afeeaa7cf9e8410c5b51a29b83bbfdd  edid-decode-2d44e1b01c7ed7d65b20ecdce62d354841832201-br2.tar.gz
+sha256  a8774f1d3eb031ffa4ecb85135b47ad28afeeaa7cf9e8410c5b51a29b83bbfdd  edid-decode-2d44e1b01c7ed7d65b20ecdce62d354841832201-git3.tar.gz
 sha256  9bc7ab961e9a07dc84eaa0210af388def56d024357e79671fb89fe27d073eed7  LICENSE
diff --git a/package/embiggen-disk/embiggen-disk.hash b/package/embiggen-disk/embiggen-disk.hash
index 3a290e2ec8..8f54a5f80e 100644
--- a/package/embiggen-disk/embiggen-disk.hash
+++ b/package/embiggen-disk/embiggen-disk.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  514cde66ab9fe6af91b97f17acc19b37976f675ebea0e1be741d6bd621811d87  embiggen-disk-9e7b2fc7b99c4dece41a805489a6ca377ce55a62.tar.gz
+sha256  514cde66ab9fe6af91b97f17acc19b37976f675ebea0e1be741d6bd621811d87  embiggen-disk-9e7b2fc7b99c4dece41a805489a6ca377ce55a62-go1.tar.gz
 sha256  063aedec1652c5a05c2d04c40e032b932453142ee8ef7fd53c04a9acc127fc95  LICENSE
diff --git a/package/eza/eza.hash b/package/eza/eza.hash
index d8d55e42ca..ddc23f50e2 100644
--- a/package/eza/eza.hash
+++ b/package/eza/eza.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  32621dea52695b75fe6f6d24ebd19812b0491a852cb2a970382838dd798cc46c  eza-0.18.8.tar.gz
+sha256  925347e190028308e8105d5c6aef395fd73cd3ceec2df2bf35b285101e75bf3b  eza-0.18.8-cargo1.tar.gz
 sha256  2762990c7fbba9d550802a2593c1d857dcd52596bb0f9f192a97e9a7ac5f4f9e  LICENCE
diff --git a/package/firmware-utils/firmware-utils.hash b/package/firmware-utils/firmware-utils.hash
index ce9fa5009b..b264af8703 100644
--- a/package/firmware-utils/firmware-utils.hash
+++ b/package/firmware-utils/firmware-utils.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  0df1b7912d68822025f9bb6a7ddfdf9675e2116d34c3c74bbdc83defcefe203c  firmware-utils-86739f2b3ae9502368b89ef37fa6f31c42aad6f4-br2.tar.gz
+sha256  0df1b7912d68822025f9bb6a7ddfdf9675e2116d34c3c74bbdc83defcefe203c  firmware-utils-86739f2b3ae9502368b89ef37fa6f31c42aad6f4-git3.tar.gz
diff --git a/package/flannel/flannel.hash b/package/flannel/flannel.hash
index c1ceeed9e8..f71b3f09b6 100644
--- a/package/flannel/flannel.hash
+++ b/package/flannel/flannel.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  f9e68bc9c5b41ee7f721a754c9fa4eddf3da775faa9e638581a564e33b3fabcf  flannel-0.24.2.tar.gz
+sha256  f9e68bc9c5b41ee7f721a754c9fa4eddf3da775faa9e638581a564e33b3fabcf  flannel-0.24.2-go1.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/flashbench/flashbench.hash b/package/flashbench/flashbench.hash
index 405fc9ec70..ea76d47371 100644
--- a/package/flashbench/flashbench.hash
+++ b/package/flashbench/flashbench.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  422860966ad3528a7fd1dc88e4aa0b2bd91f11fa6429523b9acd21dc5beb6a19  flashbench-2e30b1968a66147412f21002ea844122a0d5e2f0-br2.tar.gz
+sha256  422860966ad3528a7fd1dc88e4aa0b2bd91f11fa6429523b9acd21dc5beb6a19  flashbench-2e30b1968a66147412f21002ea844122a0d5e2f0-git3.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/flutter-pi/flutter-pi.hash b/package/flutter-pi/flutter-pi.hash
index 2b41ba1b74..4212b68fc9 100644
--- a/package/flutter-pi/flutter-pi.hash
+++ b/package/flutter-pi/flutter-pi.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4ab2ae849d46261fe22ed94eae5726841d34119a5656e85b26c7c8802050d14c  flutter-pi-783db32ec6441b878783bfa241777d3bfe6b35e2-br2.tar.gz
+sha256  4ab2ae849d46261fe22ed94eae5726841d34119a5656e85b26c7c8802050d14c  flutter-pi-783db32ec6441b878783bfa241777d3bfe6b35e2-git3.tar.gz
 sha256  b34df9d3e1b4e5d1ba70b1740ec74b69f1189b44efd0c96b898b074ef8db1c70  LICENSE
diff --git a/package/freescale-imx/imx-lib/imx-lib.hash b/package/freescale-imx/imx-lib/imx-lib.hash
index 81be55a435..7b37a170b0 100644
--- a/package/freescale-imx/imx-lib/imx-lib.hash
+++ b/package/freescale-imx/imx-lib/imx-lib.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  cad7823568cbd367ed8525e01c8c11a2393fc2dc481425273cb7919385367c61  imx-lib-3f777974c0c146817e2ff5cb0340ca66a1f99e57-br2.tar.gz
+sha256  cad7823568cbd367ed8525e01c8c11a2393fc2dc481425273cb7919385367c61  imx-lib-3f777974c0c146817e2ff5cb0340ca66a1f99e57-git3.tar.gz
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING-LGPL-2.1
diff --git a/package/gitlab-runner/gitlab-runner.hash b/package/gitlab-runner/gitlab-runner.hash
index 2d39eef39b..ff10497232 100644
--- a/package/gitlab-runner/gitlab-runner.hash
+++ b/package/gitlab-runner/gitlab-runner.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f7482926d20dbf98434e3d34662d93b601166eb784c6fb4bc56f89c1a4eff19d  gitlab-runner-15.5.0.tar.gz
+sha256  da3e62ae1a34cd7523dd54ad0317ed87f35906f4d3b1a9032c12d5b04a45b0b8  gitlab-runner-15.5.0-go1.tar.gz
 sha256  0ae968b7ddd25da0209c3c6594aac1ac74ddf90385940b02b420463e2e0734de  LICENSE
diff --git a/package/gocryptfs/gocryptfs.hash b/package/gocryptfs/gocryptfs.hash
index e8691607b1..1e8ea8974d 100644
--- a/package/gocryptfs/gocryptfs.hash
+++ b/package/gocryptfs/gocryptfs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7ad6138eb49d3a0481211ec4d4828f35e269f234433b57a4e4ea7cf6e63ba887  gocryptfs-2.3.2.tar.gz
+sha256  862c771dc25094afb5faef9a2c44accbe4b695a6be0f6cfa0a56963dd6c39351  gocryptfs-2.3.2-go1.tar.gz
 sha256  322a7e3b02cf18e38b7e6b18cafefb773df8676c65634b34e8a2beb931294a4b  LICENSE
diff --git a/package/google-breakpad/google-breakpad.hash b/package/google-breakpad/google-breakpad.hash
index 62a4cebb39..ed104d1761 100644
--- a/package/google-breakpad/google-breakpad.hash
+++ b/package/google-breakpad/google-breakpad.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  29e147011bf6577df95ee3a50bf5ffd1941645dd414d569bd409a9035bcbb7f7  google-breakpad-f49c2f1a2023da0cb055874fba050563dfea57db-br2.tar.gz
+sha256  29e147011bf6577df95ee3a50bf5ffd1941645dd414d569bd409a9035bcbb7f7  google-breakpad-f49c2f1a2023da0cb055874fba050563dfea57db-git3.tar.gz
 sha256  69b3d80c19a460e09716910d54d1ada5d800716e2b73751bebac44352590f646  LICENSE
diff --git a/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash b/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash
index e278077ab0..fa247aa361 100644
--- a/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash
+++ b/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash
@@ -1,5 +1,5 @@
 # locally computed hash
-sha256  b97af0dfa108c5f736a961c388267c7a9c8f915e753985d7e85939091032deed  gst1-interpipe-v1.1.8-br2.tar.gz
+sha256  b97af0dfa108c5f736a961c388267c7a9c8f915e753985d7e85939091032deed  gst1-interpipe-v1.1.8-git3.tar.gz
 
 # Hashes for license files:
 sha256  16d7caa6cabbfd0ca47e064a7b48cb446d013e84ca88c854d6470851752136d5  COPYING
diff --git a/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.hash b/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.hash
index 60a694f378..3676e116ad 100644
--- a/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.hash
+++ b/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  76b2135a23f465f789ccb86bd3a8190a1e30f86cdb28abfac4d9a2cdece63fa2  gst1-plugins-bayer2rgb-neon-b630798efcd611879e7cb1c246052e5ba1acc41d-br2.tar.gz
+sha256  76b2135a23f465f789ccb86bd3a8190a1e30f86cdb28abfac4d9a2cdece63fa2  gst1-plugins-bayer2rgb-neon-b630798efcd611879e7cb1c246052e5ba1acc41d-git3.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/gstreamer1/gst1-shark/gst1-shark.hash b/package/gstreamer1/gst1-shark/gst1-shark.hash
index 8fa9a857aa..ff1057a6cd 100644
--- a/package/gstreamer1/gst1-shark/gst1-shark.hash
+++ b/package/gstreamer1/gst1-shark/gst1-shark.hash
@@ -1,4 +1,4 @@
-sha256  07587922dc49d12abe2444590a88c530409854b02904ad50357b312f9b6ea736  gst1-shark-v0.8.1-br2.tar.gz
+sha256  07587922dc49d12abe2444590a88c530409854b02904ad50357b312f9b6ea736  gst1-shark-v0.8.1-git3.tar.gz
 
 # Hashes for license files:
 sha256  6d191b8f1fa03cabced18b8e48fddbf960a19f965bed8491e76ed62238f92f0b  COPYING
diff --git a/package/hyperfine/hyperfine.hash b/package/hyperfine/hyperfine.hash
index c7e094080a..6806bda9c8 100644
--- a/package/hyperfine/hyperfine.hash
+++ b/package/hyperfine/hyperfine.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  40204671ee8ca73b15c88fcbc6399af0aca69ae9fc45f3ae36487b9c5c07cf48  hyperfine-1.18.0.tar.gz
+sha256  e4a945fcd08e93fed47e542383942874960a893a94a60758b7bd208821c623f5  hyperfine-1.18.0-cargo1.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE-APACHE
 sha256  1dfee18c2ff07ce551de4d6a1d2db158c0380746b488a7f0d08c8e0d3568b7c3  LICENSE-MIT
diff --git a/package/ibm-sw-tpm2/ibm-sw-tpm2.hash b/package/ibm-sw-tpm2/ibm-sw-tpm2.hash
index 3f400a500c..65d6163855 100644
--- a/package/ibm-sw-tpm2/ibm-sw-tpm2.hash
+++ b/package/ibm-sw-tpm2/ibm-sw-tpm2.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  d11203a73946ad14ca39f4b74742c0d81762dbe7e913a4685f92620f1d6fe295  ibm-sw-tpm2-5452af422edeff70fcae8ea99dd28a0922051d7b-br2.tar.gz
+sha256  d11203a73946ad14ca39f4b74742c0d81762dbe7e913a4685f92620f1d6fe295  ibm-sw-tpm2-5452af422edeff70fcae8ea99dd28a0922051d7b-git3.tar.gz
 sha256  dd2d31b560011ea673e197251e710e52669d911367d83cd3cfd018f8ed58bde9  LICENSE
diff --git a/package/ivi-homescreen/ivi-homescreen.hash b/package/ivi-homescreen/ivi-homescreen.hash
index bbd4773ae3..ff302c7fef 100644
--- a/package/ivi-homescreen/ivi-homescreen.hash
+++ b/package/ivi-homescreen/ivi-homescreen.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  1ab2e7ab5f947482cb5529dbb6392e7e1945ceb0b593abde6b6279d7bd2fdb79  ivi-homescreen-5ab78a19e95c88cc5d6b173ab1260a211e78cf0a-br2.tar.gz
+sha256  1ab2e7ab5f947482cb5529dbb6392e7e1945ceb0b593abde6b6279d7bd2fdb79  ivi-homescreen-5ab78a19e95c88cc5d6b173ab1260a211e78cf0a-git3.tar.gz
 
 # Apache-2.0
 sha256  6b96fa0a3def85caaf466caa2bd82d4ca4f22d106ff88f97a00c537c00cc714b  LICENSE
diff --git a/package/kvmtool/kvmtool.hash b/package/kvmtool/kvmtool.hash
index c29ef8ad37..bedb76e313 100644
--- a/package/kvmtool/kvmtool.hash
+++ b/package/kvmtool/kvmtool.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e2eb2cd8b31d24484e3095923cfe8c36d4b92741b76965cafaed6be3835369c6  kvmtool-f77d646ba01d04be5aad9449ac00719c043fe36e-br2.tar.gz
+sha256  e2eb2cd8b31d24484e3095923cfe8c36d4b92741b76965cafaed6be3835369c6  kvmtool-f77d646ba01d04be5aad9449ac00719c043fe36e-git3.tar.gz
 sha256  0d5bf346df9e635a29dcdddf832dc5b002ca6cdc1c5c9c6c567d2a61bb0c5c15  COPYING
diff --git a/package/libbroadvoice/libbroadvoice.hash b/package/libbroadvoice/libbroadvoice.hash
index ccd4477738..5cb80df59c 100644
--- a/package/libbroadvoice/libbroadvoice.hash
+++ b/package/libbroadvoice/libbroadvoice.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  777e5dccc3d189514b7f8e85b6c941d3b9d16d2d68d72cad055cbdfb571d3681  libbroadvoice-f65b0f50c8c767229fbf1758370880abc0d78564-br2.tar.gz
+sha256  777e5dccc3d189514b7f8e85b6c941d3b9d16d2d68d72cad055cbdfb571d3681  libbroadvoice-f65b0f50c8c767229fbf1758370880abc0d78564-git3.tar.gz
 sha256  2550586c993ce4a8c23c8b11968ea36192116a896a2504799cc65307d769c094  COPYING
diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
index 35de5f4ef3..b27c8ad473 100644
--- a/package/libcamera/libcamera.hash
+++ b/package/libcamera/libcamera.hash
@@ -1,4 +1,4 @@
-sha256  7f26568147f4f2acc795da7f26de63a5a15d544d87fb1531a1a1ef2c34c75030  libcamera-v0.2.0-br2.tar.gz
+sha256  5909ed3248946083179d36e1f3e3dc692e5a973bbac31828d3d91d94579e76ac  libcamera-v0.2.0-git3.tar.gz
 
 # license files
 sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  LICENSES/BSD-2-Clause.txt
diff --git a/package/libdbi-drivers/libdbi-drivers.hash b/package/libdbi-drivers/libdbi-drivers.hash
index 8b8009406d..ab5444de6b 100644
--- a/package/libdbi-drivers/libdbi-drivers.hash
+++ b/package/libdbi-drivers/libdbi-drivers.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  80a1befb044238a89b2d0dbd40881aa6c75bf99d3a7a6c016c657ea26df7792c  libdbi-drivers-0bfae6c43134cf58dc89364328545982ca297abb-br2.tar.gz
+sha256  80a1befb044238a89b2d0dbd40881aa6c75bf99d3a7a6c016c657ea26df7792c  libdbi-drivers-0bfae6c43134cf58dc89364328545982ca297abb-git3.tar.gz
 sha256  5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509  COPYING
diff --git a/package/libdbi/libdbi.hash b/package/libdbi/libdbi.hash
index 561721a303..d6c678da77 100644
--- a/package/libdbi/libdbi.hash
+++ b/package/libdbi/libdbi.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  958475e0010a3d8e43ce9ecd6a64d25eacca6ada46c39bc69f949dd70f92ab7a  libdbi-88b8477d57153b9f736dd19d432d3b7ab1c49073-br2.tar.gz
+sha256  958475e0010a3d8e43ce9ecd6a64d25eacca6ada46c39bc69f949dd70f92ab7a  libdbi-88b8477d57153b9f736dd19d432d3b7ab1c49073-git3.tar.gz
 sha256  5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509  COPYING
diff --git a/package/libg7221/libg7221.hash b/package/libg7221/libg7221.hash
index 68d336ac1e..dee5fb5a78 100644
--- a/package/libg7221/libg7221.hash
+++ b/package/libg7221/libg7221.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7f00d6a4f435a91ab3bc96e6c95aa1334bd416f80d98843b4f178067239ee832  libg7221-dbfc29d4806ecdace50379a2f4d68a992a6fec34-br2.tar.gz
+sha256  7f00d6a4f435a91ab3bc96e6c95aa1334bd416f80d98843b4f178067239ee832  libg7221-dbfc29d4806ecdace50379a2f4d68a992a6fec34-git3.tar.gz
 sha256  26cc5f718279b45dbe34e25a2d29b2c8ca487bd9ab11b2d68c9318ff59d5c645  COPYING
diff --git a/package/libilbc/libilbc.hash b/package/libilbc/libilbc.hash
index 9fafa9a569..9ee3a00300 100644
--- a/package/libilbc/libilbc.hash
+++ b/package/libilbc/libilbc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f97d8284776c95b31ed5d5441f13b519b8c7966b77a26aa06c29bb77e02cfe16  libilbc-829b08c7902ceb87a261279fabb36b6d523c6e07-br2.tar.gz
+sha256  f97d8284776c95b31ed5d5441f13b519b8c7966b77a26aa06c29bb77e02cfe16  libilbc-829b08c7902ceb87a261279fabb36b6d523c6e07-git3.tar.gz
 sha256  b7f4cbb4a12cd11a3d1aeda9bd17c99f59b054de4b3ee53045531cd2fa74dd2a  gips_iLBClicense.pdf
diff --git a/package/libsilk/libsilk.hash b/package/libsilk/libsilk.hash
index 154645d1c6..4936e6c679 100644
--- a/package/libsilk/libsilk.hash
+++ b/package/libsilk/libsilk.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ac79eb4c154af25c0ab25e12d60d3b4165c399903fe88d82e066cf6d9827503e  libsilk-4268a02240c35c6055b0f237c46b09b2dcf79e45-br2.tar.gz
+sha256  ac79eb4c154af25c0ab25e12d60d3b4165c399903fe88d82e066cf6d9827503e  libsilk-4268a02240c35c6055b0f237c46b09b2dcf79e45-git3.tar.gz
 sha256  62a5963f034024665641f4a9888b208f1e39aa7e29e87c9634fdcf07d3073baf  COPYING
diff --git a/package/libsvgtiny/libsvgtiny.hash b/package/libsvgtiny/libsvgtiny.hash
index 69854f3332..9c7f31d730 100644
--- a/package/libsvgtiny/libsvgtiny.hash
+++ b/package/libsvgtiny/libsvgtiny.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  917850350d014c953f2af0fb92f0eeb25652619710922d467c98f8109fb92baf  libsvgtiny-ea9d99fc8b231c22d06168135e181d61f4eb2f06-br2.tar.gz
+sha256  917850350d014c953f2af0fb92f0eeb25652619710922d467c98f8109fb92baf  libsvgtiny-ea9d99fc8b231c22d06168135e181d61f4eb2f06-git3.tar.gz
 sha256  92b965c77be71661cae51425a6b40a5ca274f44cc13c723c90fb471a9a26a828  README
diff --git a/package/libubox/libubox.hash b/package/libubox/libubox.hash
index 30d9dee234..3c2f8f948a 100644
--- a/package/libubox/libubox.hash
+++ b/package/libubox/libubox.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  b06311e7d857583303e9256f58787857944572012fbfd4a5d83e92e0e684f654  libubox-75a3b870cace1171faf57bd55e5a9a2f1564f757-br2.tar.gz
+sha256  b06311e7d857583303e9256f58787857944572012fbfd4a5d83e92e0e684f654  libubox-75a3b870cace1171faf57bd55e5a9a2f1564f757-git3.tar.gz
diff --git a/package/libuci/libuci.hash b/package/libuci/libuci.hash
index 8e445967b3..b5a23960ca 100644
--- a/package/libuci/libuci.hash
+++ b/package/libuci/libuci.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  4b4e3ef9c9f51c02a1985c63ff0e8fc1f3aafdf24491247a4dc33c993c3fa1ea  libuci-4b3db1179747b6a6779029407984bacef851325c-br2.tar.gz
+sha256  4b4e3ef9c9f51c02a1985c63ff0e8fc1f3aafdf24491247a4dc33c993c3fa1ea  libuci-4b3db1179747b6a6779029407984bacef851325c-git3.tar.gz
 sha256  39e1cc18a36172fb80d9b37f0af77d78ae935bd8a020978a7895d9e76a24e112  cli.c
 sha256  69d4eea4de19d27014f3d6ed723081b4039700bfd73cd0a5e39e2c4f19a58c66  libuci.c
diff --git a/package/libxmlrpc/libxmlrpc.hash b/package/libxmlrpc/libxmlrpc.hash
index d50ac867a9..7ce9da2db2 100644
--- a/package/libxmlrpc/libxmlrpc.hash
+++ b/package/libxmlrpc/libxmlrpc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f22f96a6dc1a574a843b5e383446fe1fa1022f211ee7c3f4c5fd8de1d5104393  libxmlrpc-r3176-br3.tar.gz
+sha256  f22f96a6dc1a574a843b5e383446fe1fa1022f211ee7c3f4c5fd8de1d5104393  libxmlrpc-r3176-svn4.tar.gz
 sha256  db7a6d3f187b218c3534010a83424c6bcdef88e6a0b6b1aa3a8762238bd642e6  doc/COPYING
diff --git a/package/libyuv/libyuv.hash b/package/libyuv/libyuv.hash
index 42d6e91329..542a1e33aa 100644
--- a/package/libyuv/libyuv.hash
+++ b/package/libyuv/libyuv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7bb4118ef050ca3e9a27f49b7d21e068922bf57cf973f2c7b1476cadf73ac66a  libyuv-413a8d8041f1cc5a350a47c0d81cc721e64f9fd0-br2.tar.gz
+sha256  7bb4118ef050ca3e9a27f49b7d21e068922bf57cf973f2c7b1476cadf73ac66a  libyuv-413a8d8041f1cc5a350a47c0d81cc721e64f9fd0-git3.tar.gz
 sha256  2b2cc1180c7e6988328ad2033b04b80117419db9c4c584918bbb3cfec7e9364f  LICENSE
diff --git a/package/linux-syscall-support/linux-syscall-support.hash b/package/linux-syscall-support/linux-syscall-support.hash
index f47b64a626..3b157fc8a3 100644
--- a/package/linux-syscall-support/linux-syscall-support.hash
+++ b/package/linux-syscall-support/linux-syscall-support.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2a12703ce59773ec714b603e46c733b03f3fbf9b4763195fae40d0042e5da3f6  linux-syscall-support-e1e7b0ad8ee99a875b272c8e33e308472e897660-br2.tar.gz
+sha256  2a12703ce59773ec714b603e46c733b03f3fbf9b4763195fae40d0042e5da3f6  linux-syscall-support-e1e7b0ad8ee99a875b272c8e33e308472e897660-git3.tar.gz
 sha256  c180f12840c00224cceed7139192018d2c7e6061db4ce4310b8626f7ad10bf26  LICENSE
diff --git a/package/luajit/luajit.hash b/package/luajit/luajit.hash
index da243d8c2a..e7f63d0683 100644
--- a/package/luajit/luajit.hash
+++ b/package/luajit/luajit.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  df50bfe78919691ce9a630c8312386a8cb6ca49f327922a833e77656e82ef6c6  luajit-41fb94defa8f830ce69a8122b03f6ac3216d392a-br2.tar.gz
+sha256  df50bfe78919691ce9a630c8312386a8cb6ca49f327922a833e77656e82ef6c6  luajit-41fb94defa8f830ce69a8122b03f6ac3216d392a-git3.tar.gz
 
 # Locally calculated
 sha256  1130331ac861a4b4520e9c8ad0814efdc6f1e79ea55ea9c460c73733d13ccb5f  COPYRIGHT
diff --git a/package/mender-artifact/mender-artifact.hash b/package/mender-artifact/mender-artifact.hash
index 8262e26bf0..91caa5c6f1 100644
--- a/package/mender-artifact/mender-artifact.hash
+++ b/package/mender-artifact/mender-artifact.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  d3ed68d8637195ff35de97b12c8fa148cebffb1ee0fd0d43909ec1643c0c296a  mender-artifact-3.8.0.tar.gz
+sha256  d3ed68d8637195ff35de97b12c8fa148cebffb1ee0fd0d43909ec1643c0c296a  mender-artifact-3.8.0-go1.tar.gz
 sha256  b8462a14975e30fb0dff14ed50e7563e833ccce13c2aa93f95386ffe877ed673  LIC_FILES_CHKSUM.sha256
 
 # License hash extracted from LIC_FILES_CHKSUM.sha256 using the
diff --git a/package/mender-connect/mender-connect.hash b/package/mender-connect/mender-connect.hash
index da4ec5fbbd..4f8abeb76c 100644
--- a/package/mender-connect/mender-connect.hash
+++ b/package/mender-connect/mender-connect.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  96b81bb4c72eb8c1756febb94101c0dea5a6d4884591824e61a5f2509cd9ca9b  mender-connect-2.1.0.tar.gz
+sha256  96b81bb4c72eb8c1756febb94101c0dea5a6d4884591824e61a5f2509cd9ca9b  mender-connect-2.1.0-go1.tar.gz
 sha256  78b3954421ec6499c3f9735b96d52288574ae80c747416a52548d7f526f26e8c  LIC_FILES_CHKSUM.sha256
 
 # Vendor licenses
diff --git a/package/mender/mender.hash b/package/mender/mender.hash
index d563dc534b..03225c6e1d 100644
--- a/package/mender/mender.hash
+++ b/package/mender/mender.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  8a149b11b990beb7620b372023eec28df63cee6a1aa4132e88ecef554f080f72  mender-3.4.0.tar.gz
+sha256  8a149b11b990beb7620b372023eec28df63cee6a1aa4132e88ecef554f080f72  mender-3.4.0-go1.tar.gz
 
 # Vendor licenses
 # Generated with sed '/^[A-Za-z0-9_]/s/^/sha256  /' LIC_FILES_CHKSUM.sha256
diff --git a/package/mmc-utils/mmc-utils.hash b/package/mmc-utils/mmc-utils.hash
index 53412e0bbb..bed6187857 100644
--- a/package/mmc-utils/mmc-utils.hash
+++ b/package/mmc-utils/mmc-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  83b1bd7602b0c8d05a8ff2f842d80fa7c9a0b084b7159bb9eed796b0075b94d1  mmc-utils-e1281d4de9166b7254ba30bb58f9191fc2c9e7fb-br2.tar.gz
+sha256  83b1bd7602b0c8d05a8ff2f842d80fa7c9a0b084b7159bb9eed796b0075b94d1  mmc-utils-e1281d4de9166b7254ba30bb58f9191fc2c9e7fb-git3.tar.gz
 sha256  4207d81122a02555f78c5a11b61c83a331ee03dc933e1ef9dd932ef9b434d12d  README
diff --git a/package/moby-buildkit/moby-buildkit.hash b/package/moby-buildkit/moby-buildkit.hash
index f7922d7e8f..3e4b5b4e01 100644
--- a/package/moby-buildkit/moby-buildkit.hash
+++ b/package/moby-buildkit/moby-buildkit.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1efa1c54b299c463c1b039d3df8ba1c68e70fe4de608fd14653fcebf9f27837b  moby-buildkit-0.11.6.tar.gz
+sha256  1efa1c54b299c463c1b039d3df8ba1c68e70fe4de608fd14653fcebf9f27837b  moby-buildkit-0.11.6-go1.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/mxsldr/mxsldr.hash b/package/mxsldr/mxsldr.hash
index 3d5ee1c8a2..8b6c11c29d 100644
--- a/package/mxsldr/mxsldr.hash
+++ b/package/mxsldr/mxsldr.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8ef7b7abb8d17c879e70b2c3911df8c5ce97f38779fa65d40be7f34febba55e1  mxsldr-2793a657ab7a22487d21c1b020957806f8ae8383-br2.tar.gz
+sha256  8ef7b7abb8d17c879e70b2c3911df8c5ce97f38779fa65d40be7f34febba55e1  mxsldr-2793a657ab7a22487d21c1b020957806f8ae8383-git3.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/nerdctl/nerdctl.hash b/package/nerdctl/nerdctl.hash
index 52e249824f..2d22dbace1 100644
--- a/package/nerdctl/nerdctl.hash
+++ b/package/nerdctl/nerdctl.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  fff8c348efa4ff6753e1aacded0dedddcb255c50b00d8b3a37a660b1fb1dd31a  nerdctl-1.7.3.tar.gz
+sha256  fff8c348efa4ff6753e1aacded0dedddcb255c50b00d8b3a37a660b1fb1dd31a  nerdctl-1.7.3-go1.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/netsurf-buildsystem/netsurf-buildsystem.hash b/package/netsurf-buildsystem/netsurf-buildsystem.hash
index baf3bc4624..1716176683 100644
--- a/package/netsurf-buildsystem/netsurf-buildsystem.hash
+++ b/package/netsurf-buildsystem/netsurf-buildsystem.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  150a3a45c3f433a35451506b316a35c14630112fc557f9e1f02c9e08b50e0cce  netsurf-buildsystem-7574b41345968b5f7e9ca5875faccb1478ce0555-br2.tar.gz
+sha256  150a3a45c3f433a35451506b316a35c14630112fc557f9e1f02c9e08b50e0cce  netsurf-buildsystem-7574b41345968b5f7e9ca5875faccb1478ce0555-git3.tar.gz
 sha256  b2ddc1d607332423f6cf415b2ac619a1c03dd565facdc39a571282a520929a65  llvm/LICENSE.TXT
diff --git a/package/nushell/nushell.hash b/package/nushell/nushell.hash
index 02fc8214b6..2fe48557da 100644
--- a/package/nushell/nushell.hash
+++ b/package/nushell/nushell.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  94af22278f584b59c7c4b2390e2d15d9934d5207a756309259d1c4b92f5af7ef  nushell-0.85.0.tar.gz
+sha256  9518d79a04b374c23d4523252080b176e835050b3c6ef8243ee54411a8f8cba4  nushell-0.85.0-cargo1.tar.gz
 sha256  2dc1f03f729c21902d869b4d8f8dc528fc730f4c6ad83fc128672bda0ad69196  LICENSE
diff --git a/package/odhcp6c/odhcp6c.hash b/package/odhcp6c/odhcp6c.hash
index b1c7765eca..d833eba9a0 100644
--- a/package/odhcp6c/odhcp6c.hash
+++ b/package/odhcp6c/odhcp6c.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7274a304016838483e2da48193309e5f84ca0a8a407647033283d1249eebe986  odhcp6c-53f07e90b7f1da6977143a488dd5cb73a33b233b-br2.tar.gz
+sha256  7274a304016838483e2da48193309e5f84ca0a8a407647033283d1249eebe986  odhcp6c-53f07e90b7f1da6977143a488dd5cb73a33b233b-git3.tar.gz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/ogre/ogre.hash b/package/ogre/ogre.hash
index 3a067f3da3..40d0758638 100644
--- a/package/ogre/ogre.hash
+++ b/package/ogre/ogre.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256  805b97aacd2070f19394fe92442307a7ba6036ad95c511f551817d694c8dea37  ogre-v1.12.12-br2.tar.gz
+sha256  805b97aacd2070f19394fe92442307a7ba6036ad95c511f551817d694c8dea37  ogre-v1.12.12-git3.tar.gz
 sha256  82758e8d1d72139904b9b7472ef0f6544413d2871b58540307fdcc20e473e5f8  LICENSE
diff --git a/package/open62541/open62541.hash b/package/open62541/open62541.hash
index 17b97d1a57..0e3f80eb18 100644
--- a/package/open62541/open62541.hash
+++ b/package/open62541/open62541.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8ca1f20dba4fc103893d74d29e41c336ab67a1725512b03eaaf6060658525b43  open62541-v1.3.9-br2.tar.gz
+sha256  8ca1f20dba4fc103893d74d29e41c336ab67a1725512b03eaaf6060658525b43  open62541-v1.3.9-git3.tar.gz
 sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  LICENSE
diff --git a/package/opkg-utils/opkg-utils.hash b/package/opkg-utils/opkg-utils.hash
index 45e491d54a..4e4cca725b 100644
--- a/package/opkg-utils/opkg-utils.hash
+++ b/package/opkg-utils/opkg-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ad4fb6d01f2f18e986c556cca1ade584b109c277794af15977c354d2ecef9b52  opkg-utils-0.6.2-br2.tar.gz
+sha256  ad4fb6d01f2f18e986c556cca1ade584b109c277794af15977c354d2ecef9b52  opkg-utils-0.6.2-git3.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/pcm-tools/pcm-tools.hash b/package/pcm-tools/pcm-tools.hash
index 5be5885d41..2b4dec46a2 100644
--- a/package/pcm-tools/pcm-tools.hash
+++ b/package/pcm-tools/pcm-tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f3eae080e1bdc1f6264709534dff4881fb94d0d78c17ba4c8d0dbd816f6b17b9  pcm-tools-93fc9193a70e2f1f054be554c48f4a4791be5032-br2.tar.gz
+sha256  f3eae080e1bdc1f6264709534dff4881fb94d0d78c17ba4c8d0dbd816f6b17b9  pcm-tools-93fc9193a70e2f1f054be554c48f4a4791be5032-git3.tar.gz
 sha256  0f476c77009f982dcc4bdff41e692ddd456a9862908e99f2ae3d57296decc649  LICENSE
diff --git a/package/piglit/piglit.hash b/package/piglit/piglit.hash
index e47d32aedf..887d8bfa5e 100644
--- a/package/piglit/piglit.hash
+++ b/package/piglit/piglit.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  ec2a80c49f10761980334f1591be54ee6f365165d7ac637270b4ca15a12ad674  piglit-2affee53f3ad7a96f5b397a2b6d6408af8a374b0-br2.tar.gz
+sha256  ec2a80c49f10761980334f1591be54ee6f365165d7ac637270b4ca15a12ad674  piglit-2affee53f3ad7a96f5b397a2b6d6408af8a374b0-git3.tar.gz
 sha256  dcc398730859aee7cc1d6aa57f526f8d181b47bb3a49830e85b5723d5bc2c3bc  COPYING
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  licences/GPL-2
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  licences/GPL-3
diff --git a/package/prelink-cross/prelink-cross.hash b/package/prelink-cross/prelink-cross.hash
index db90e868c9..87ff86f674 100644
--- a/package/prelink-cross/prelink-cross.hash
+++ b/package/prelink-cross/prelink-cross.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d7c95e81993edead813accf417f6d5b05bcc84eea9ee2d711b9505ffb4f2865b  prelink-cross-a853a5d715d84eec93aa68e8f2df26b7d860f5b2-br2.tar.gz
+sha256  d7c95e81993edead813accf417f6d5b05bcc84eea9ee2d711b9505ffb4f2865b  prelink-cross-a853a5d715d84eec93aa68e8f2df26b7d860f5b2-git3.tar.gz
 sha256  b8a2f73f743dc1a51aff23f1aacbca4b868564db52496fa3c0caba755bfd1eaf  COPYING
diff --git a/package/procs/procs.hash b/package/procs/procs.hash
index 93be601c6d..e4e3764976 100644
--- a/package/procs/procs.hash
+++ b/package/procs/procs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d90d350ebac64b6a5b2c89881421c27d266653ec1f4a6ed10e32892fe38d3c60  procs-0.14.5.tar.gz
+sha256  fe93b0ace885e1342870b49b2ee64f0862fd799395740e5c549f2fd67d14d944  procs-0.14.5-cargo1.tar.gz
 sha256  feb87a2e0c305de3464cc44077da5393c52d8ca6362d37427157d04ec6f4510d  LICENSE
diff --git a/package/psplash/psplash.hash b/package/psplash/psplash.hash
index 5ac65cf347..97ff534654 100644
--- a/package/psplash/psplash.hash
+++ b/package/psplash/psplash.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c9f71754f4606e46212a4851d6c1145e4ae8752fd11a2b40e825f04bf79b22ec  psplash-44afb7506d43cca15582b4c5b90ba5580344d75d-br2.tar.gz
+sha256  c9f71754f4606e46212a4851d6c1145e4ae8752fd11a2b40e825f04bf79b22ec  psplash-44afb7506d43cca15582b4c5b90ba5580344d75d-git3.tar.gz
 sha256  f9c375a1be4a41f7b70301dd83c91cb89e41567478859b77eef375a52d782505  COPYING
diff --git a/package/qt-webkit-kiosk/qt-webkit-kiosk.hash b/package/qt-webkit-kiosk/qt-webkit-kiosk.hash
index 30653e9dc7..18638291b6 100644
--- a/package/qt-webkit-kiosk/qt-webkit-kiosk.hash
+++ b/package/qt-webkit-kiosk/qt-webkit-kiosk.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5c3992cc35260d165f9a16094bd224529f012f799e0bc21317a39480cedb1fd2  qt-webkit-kiosk-a7720e50f2bd70aad99e0b465f5c4a57aca48127-br2.tar.gz
+sha256  5c3992cc35260d165f9a16094bd224529f012f799e0bc21317a39480cedb1fd2  qt-webkit-kiosk-a7720e50f2bd70aad99e0b465f5c4a57aca48127-git3.tar.gz
 sha256  de59ec6c939f4c4def79c0a996b3bd5626895fcbd1ae108e7bddb1dac8218381  doc/lgpl.html
diff --git a/package/qt5/qt5coap/qt5coap.hash b/package/qt5/qt5coap/qt5coap.hash
index f695b45c69..e3fdbd36e6 100644
--- a/package/qt5/qt5coap/qt5coap.hash
+++ b/package/qt5/qt5coap/qt5coap.hash
@@ -1,5 +1,5 @@
 # Hash locally calculated
-sha256  0ad05a2305437b9b96a4322bfadaa26f043ba16845d5303e53c00c82b37b243f  qt5coap-5.15.2-br2.tar.gz
+sha256  0ad05a2305437b9b96a4322bfadaa26f043ba16845d5303e53c00c82b37b243f  qt5coap-5.15.2-git3.tar.gz
 
 # Hashes for license files:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
diff --git a/package/qt5/qt5knx/qt5knx.hash b/package/qt5/qt5knx/qt5knx.hash
index 7c78b50615..543b43a3a5 100644
--- a/package/qt5/qt5knx/qt5knx.hash
+++ b/package/qt5/qt5knx/qt5knx.hash
@@ -1,5 +1,5 @@
 # Hash locally calculated
-sha256  df517ec632aca8d95150c73f4c43d1d396452b40d434b5f1969f266f127e1d70  qt5knx-5.15.2-br2.tar.gz
+sha256  df517ec632aca8d95150c73f4c43d1d396452b40d434b5f1969f266f127e1d70  qt5knx-5.15.2-git3.tar.gz
 
 # Hashes for license files:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
diff --git a/package/qt5/qt5location/qt5location.hash b/package/qt5/qt5location/qt5location.hash
index 3f80f19586..372db8bd00 100644
--- a/package/qt5/qt5location/qt5location.hash
+++ b/package/qt5/qt5location/qt5location.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  e94800d108e0f7a05df5586456fa812a0b6dd348623332b5cc8f837ccd206ebb  qt5location-0ec8f5e82da7369a92824167c4d7331f6c502325-br2.tar.gz
+sha256  e94800d108e0f7a05df5586456fa812a0b6dd348623332b5cc8f837ccd206ebb  qt5location-0ec8f5e82da7369a92824167c4d7331f6c502325-git3.tar.gz
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5mqtt/qt5mqtt.hash b/package/qt5/qt5mqtt/qt5mqtt.hash
index cd4272fb17..19cb44f5b2 100644
--- a/package/qt5/qt5mqtt/qt5mqtt.hash
+++ b/package/qt5/qt5mqtt/qt5mqtt.hash
@@ -1,5 +1,5 @@
 # Hash locally calculated
-sha256  eb7b75ab3f8fa6f512c3e2ba05e1356d15bc850977197ebbd3d360528b05281c  qt5mqtt-5.15.2-br2.tar.gz
+sha256  eb7b75ab3f8fa6f512c3e2ba05e1356d15bc850977197ebbd3d360528b05281c  qt5mqtt-5.15.2-git3.tar.gz
 
 # Hashes for license files:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
diff --git a/package/qt5/qt5opcua/qt5opcua.hash b/package/qt5/qt5opcua/qt5opcua.hash
index dbc749eaf6..4f699b949e 100644
--- a/package/qt5/qt5opcua/qt5opcua.hash
+++ b/package/qt5/qt5opcua/qt5opcua.hash
@@ -1,5 +1,5 @@
 # Hash locally calculated
-sha256  61a39fe7336709a9b2068e250713c2eb66fd3460b2c6e5f7bfc569b15b9cacb9  qt5opcua-5.15.2-br2.tar.gz
+sha256  61a39fe7336709a9b2068e250713c2eb66fd3460b2c6e5f7bfc569b15b9cacb9  qt5opcua-5.15.2-git3.tar.gz
 
 # Hashes for license files:
 sha256  d93cc415382f0013088fa276d9cf82373badf244c78220a926f15ee46f0fe3c4  LICENSE-CC0
diff --git a/package/qt5/qt5webengine-chromium-catapult/qt5webengine-chromium-catapult.hash b/package/qt5/qt5webengine-chromium-catapult/qt5webengine-chromium-catapult.hash
index a99c8bbc5b..3ecc74c2b1 100644
--- a/package/qt5/qt5webengine-chromium-catapult/qt5webengine-chromium-catapult.hash
+++ b/package/qt5/qt5webengine-chromium-catapult/qt5webengine-chromium-catapult.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  66b8593e665c4236f7b1c487548d41d3826eddbf486ff985dbdfd01cddcaa1a8  qt5webengine-chromium-catapult-5eedfe23148a234211ba477f76fc2ea2e8529189-br2.tar.gz
+sha256  66b8593e665c4236f7b1c487548d41d3826eddbf486ff985dbdfd01cddcaa1a8  qt5webengine-chromium-catapult-5eedfe23148a234211ba477f76fc2ea2e8529189-git3.tar.gz
 sha256  f0df289ba9d03d857ad1c2f5918861376b1510b71588ffc60eff5c7a7bfedb09  LICENSE
diff --git a/package/ripgrep/ripgrep.hash b/package/ripgrep/ripgrep.hash
index 9d5b869a9c..c1241106b7 100644
--- a/package/ripgrep/ripgrep.hash
+++ b/package/ripgrep/ripgrep.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6dfa5e8346b041749b9d7467efb794fcd15cf5b7d3ccec530940dcb1aa4ab590  ripgrep-14.1.0.tar.gz
+sha256  e3165367d5d613294f4c47dbb28ac59cda5465529e85bbc7243355e04be376de  ripgrep-14.1.0-cargo1.tar.gz
 sha256  0f96a83840e146e43c0ec96a22ec1f392e0680e6c1226e6f3ba87e0740af850f  LICENSE-MIT
diff --git a/package/rockchip-rkbin/rockchip-rkbin.hash b/package/rockchip-rkbin/rockchip-rkbin.hash
index f9f3dbafd6..5296c6305b 100644
--- a/package/rockchip-rkbin/rockchip-rkbin.hash
+++ b/package/rockchip-rkbin/rockchip-rkbin.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  bd8d19ace202ff26d1c0b4d7744cd467cd0093801dc674dde57290159eedee2b  rockchip-rkbin-b4558da0860ca48bf1a571dd33ccba580b9abe23-br2.tar.gz
+sha256  fef07aa31f65acd699e32b0e9639ac1d746b0a538e269065901520e0d92bd6fa  rockchip-rkbin-b4558da0860ca48bf1a571dd33ccba580b9abe23-git3.tar.gz
 sha256  1f2e25ae65f3af774e6f141f84253d6a05d489fb0b88b311220d70471c023c9c  LICENSE
diff --git a/package/rtc-tools/rtc-tools.hash b/package/rtc-tools/rtc-tools.hash
index 237674e8ae..af644e9f03 100644
--- a/package/rtc-tools/rtc-tools.hash
+++ b/package/rtc-tools/rtc-tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8614e140b04da3dbb787760bdb0fe2ac5fe8907f5d3e9a74c6713e3d17fc3650  rtc-tools-33ef4aa1c92b0c92a351284d93d1ac5570de9cc7-br2.tar.gz
+sha256  8614e140b04da3dbb787760bdb0fe2ac5fe8907f5d3e9a74c6713e3d17fc3650  rtc-tools-33ef4aa1c92b0c92a351284d93d1ac5570de9cc7-git3.tar.gz
 sha256  7ae50a5344af14d6231aff6814632a220b3127da4099aea2c6070fd79c407c1a  COPYING
diff --git a/package/rtmpdump/rtmpdump.hash b/package/rtmpdump/rtmpdump.hash
index 557f2e1130..bc8c919024 100644
--- a/package/rtmpdump/rtmpdump.hash
+++ b/package/rtmpdump/rtmpdump.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e362202d94b92632b17abc7ef909afc56de06a2cb40e308edfad901d799bbd9c  rtmpdump-c5f04a58fc2aeea6296ca7c44ee4734c18401aa3-br2.tar.gz
+sha256  e362202d94b92632b17abc7ef909afc56de06a2cb40e308edfad901d799bbd9c  rtmpdump-c5f04a58fc2aeea6296ca7c44ee4734c18401aa3-git3.tar.gz
 sha256  03fe7ca91cc28e99b4003d5b3bd4ce3b084d4c475fdf9975cf0e7fdf4dc739cd  librtmp/COPYING
diff --git a/package/runc/runc.hash b/package/runc/runc.hash
index d6eb27d352..88a7c1dc95 100644
--- a/package/runc/runc.hash
+++ b/package/runc/runc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  be31b07d6a54a8f234016501c300ad04b6c428c56588e7eca8c3b663308db208  runc-1.1.12.tar.gz
+sha256  be31b07d6a54a8f234016501c300ad04b6c428c56588e7eca8c3b663308db208  runc-1.1.12-go1.tar.gz
 sha256  552a739c3b25792263f731542238b92f6f8d07e9a488eae27e6c4690038a8243  LICENSE
diff --git a/package/rust-bindgen/rust-bindgen.hash b/package/rust-bindgen/rust-bindgen.hash
index fe94bbc096..17e6d82337 100644
--- a/package/rust-bindgen/rust-bindgen.hash
+++ b/package/rust-bindgen/rust-bindgen.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e1cdbaa8e0ed96f647e49807aecfc44d9239d438c2b1c084edb9a3cca0b1f68f  rust-bindgen-0.65.1.tar.gz
+sha256  23951b867ea4e24d49e3f74855300e1050ccacb86bca86005ce3307bfc761342  rust-bindgen-0.65.1-cargo1.tar.gz
 sha256  c23953d9deb0a3312dbeaf6c128a657f3591acee45067612fa68405eaa4525db  LICENSE
diff --git a/package/sentry-cli/sentry-cli.hash b/package/sentry-cli/sentry-cli.hash
index 78f137da3a..ff2684d110 100644
--- a/package/sentry-cli/sentry-cli.hash
+++ b/package/sentry-cli/sentry-cli.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  2188b8eead4f2b6543725b23852427bea164e8dd76bf1ce33f41ca0c03cfeee7  sentry-cli-2.20.3.tar.gz
+sha256  b31e66d4d0e65d9903c50c69565638f16db06420248d65d3d7bd955dc68d829c  sentry-cli-2.20.3-cargo1.tar.gz
 sha256  9503def7b54ceb6e3cd182fd59bc05d3a30d7eae481e65aaba4b495133c83c14  LICENSE
diff --git a/package/signal-estimator/signal-estimator.hash b/package/signal-estimator/signal-estimator.hash
index 3854c0866c..d4fbf771d4 100644
--- a/package/signal-estimator/signal-estimator.hash
+++ b/package/signal-estimator/signal-estimator.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6256b881bd9285fdcf133628cf6dd6b0e2758c08bada231e44b2684a3cf7898f  signal-estimator-v0.0.4-br2.tar.gz
+sha256  6256b881bd9285fdcf133628cf6dd6b0e2758c08bada231e44b2684a3cf7898f  signal-estimator-v0.0.4-git3.tar.gz
 sha256  e836fc784cb6ed2d160f1c1ecdf1303ed57436a86f66f97e5406a1b79e6db55e  LICENSE
diff --git a/package/sox/sox.hash b/package/sox/sox.hash
index 91b0f61a1c..e5cfc7726c 100644
--- a/package/sox/sox.hash
+++ b/package/sox/sox.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  3d06ba8fc39ac92f16da73593be48afe0a704fe4dc4f6eca2e5137ef77cd5115  sox-7524160b29a476f7e87bc14fddf12d349f9a3c5e-br2.tar.gz
+sha256  3d06ba8fc39ac92f16da73593be48afe0a704fe4dc4f6eca2e5137ef77cd5115  sox-7524160b29a476f7e87bc14fddf12d349f9a3c5e-git3.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  LICENSE.LGPL
diff --git a/package/tealdeer/tealdeer.hash b/package/tealdeer/tealdeer.hash
index 1d9eb7bf25..94049567be 100644
--- a/package/tealdeer/tealdeer.hash
+++ b/package/tealdeer/tealdeer.hash
@@ -1,4 +1,4 @@
 # Locally generated
-sha256  90690d3a6e2f6c7444c281865bd5b0787e0afa599f06b52b4283bea4541e1e77  tealdeer-1.6.1.tar.gz
+sha256  cf4999339cda32314ca42f4553440baa07fdf698e0a6ec254cbc25297f1e603a  tealdeer-1.6.1-cargo1.tar.gz
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  a313b5e62b80a08f3aae0fa62ff3de8482ef55247299eb352ab44f87ef456b1b  LICENSE-MIT
diff --git a/package/tftpd/tftpd.hash b/package/tftpd/tftpd.hash
index fa90c81efe..62434a9ad3 100644
--- a/package/tftpd/tftpd.hash
+++ b/package/tftpd/tftpd.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  c86520c30dab0b6bcbae021ab26d2ac63227696596d37a9b02aa3e56ec5c2e77  tftpd-b2b34cecc8cbc18ff6f1fc00bda6ae6e9011e6c7-br2.tar.gz
+sha256  c86520c30dab0b6bcbae021ab26d2ac63227696596d37a9b02aa3e56ec5c2e77  tftpd-b2b34cecc8cbc18ff6f1fc00bda6ae6e9011e6c7-git3.tar.gz
 
 # Hash for license file
 sha256  67754ebd8f265571d3226ac97e521b1bd6fd8a61363ecd4ab7806a6f90efab92  tftpd/tftpd.c
diff --git a/package/ti-sgx-demos/ti-sgx-demos.hash b/package/ti-sgx-demos/ti-sgx-demos.hash
index 1ac219e1a3..3e3e2a23f3 100644
--- a/package/ti-sgx-demos/ti-sgx-demos.hash
+++ b/package/ti-sgx-demos/ti-sgx-demos.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  5564741d7669b6303e52f4c0d1eaa04aa2633c0c6ad8ff7c5295b7ef3764c719  ti-sgx-demos-bb8b74cdd1323e76697b3eb2258f863b15fee287-br2.tar.gz
+sha256  5564741d7669b6303e52f4c0d1eaa04aa2633c0c6ad8ff7c5295b7ef3764c719  ti-sgx-demos-bb8b74cdd1323e76697b3eb2258f863b15fee287-git3.tar.gz
 sha256  052741ea66a4a48e0ef8cab259d2dc136e7cf52fda694af8d1fe9bd28abe333b  LegalNotice.txt
diff --git a/package/ti-sgx-km/ti-sgx-km.hash b/package/ti-sgx-km/ti-sgx-km.hash
index b0b8ba0c6b..c992b532cc 100644
--- a/package/ti-sgx-km/ti-sgx-km.hash
+++ b/package/ti-sgx-km/ti-sgx-km.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  213b4ff3893c74f026a06404dca185216809d062e54d17c2302d56ff7ede5181  ti-sgx-km-cf7f48cb30abfd5df7a60c9bf4bbb1dde0d496d9-br2.tar.gz
+sha256  213b4ff3893c74f026a06404dca185216809d062e54d17c2302d56ff7ede5181  ti-sgx-km-cf7f48cb30abfd5df7a60c9bf4bbb1dde0d496d9-git3.tar.gz
 sha256  e9d660547691b2a9232850fd43aac16d40fd063023166fd27162020c30dc2bd4  eurasia_km/GPL-COPYING
diff --git a/package/ti-sgx-um/ti-sgx-um.hash b/package/ti-sgx-um/ti-sgx-um.hash
index 4623f541ae..16b1a8aa4d 100644
--- a/package/ti-sgx-um/ti-sgx-um.hash
+++ b/package/ti-sgx-um/ti-sgx-um.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  e52c743194516fcc92d570bc5a26dfaa26d18c13d92d41640019f544ef25be3a  ti-sgx-um-909e237baf47d0bde006ff25552f5403fd7e359d-br2.tar.gz
+sha256  e52c743194516fcc92d570bc5a26dfaa26d18c13d92d41640019f544ef25be3a  ti-sgx-um-909e237baf47d0bde006ff25552f5403fd7e359d-git3.tar.gz
 sha256  368c306246c9130b5c90a6fef2f80085f70b6225b3f552654a288c0f39fc1531  TI-Linux-Graphics-DDK-UM-Manifest.doc
diff --git a/package/tinifier/tinifier.hash b/package/tinifier/tinifier.hash
index 0c35508ebc..9c1fb11dda 100644
--- a/package/tinifier/tinifier.hash
+++ b/package/tinifier/tinifier.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  927e966f9d23ea7cc1942967a8fc16ef4c55c51bd096d44f54b418844a51aa12  tinifier-3.4.0.tar.gz
+sha256  927e966f9d23ea7cc1942967a8fc16ef4c55c51bd096d44f54b418844a51aa12  tinifier-3.4.0-go1.tar.gz
 sha256  18f524914c0df04e21289c3d9ca3e27c10abe5869cc4e4d4790a1b2c56df282c  LICENSE
diff --git a/package/tl-expected/tl-expected.hash b/package/tl-expected/tl-expected.hash
index efb63cf41a..c18a0ea941 100644
--- a/package/tl-expected/tl-expected.hash
+++ b/package/tl-expected/tl-expected.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2611769546cedcaef233ef587e71420d1f079a794eb7bb19b888dedf991ace7c  tl-expected-v1.0.0-br2.tar.gz
+sha256  2611769546cedcaef233ef587e71420d1f079a794eb7bb19b888dedf991ace7c  tl-expected-v1.0.0-git3.tar.gz
 sha256  a2010f343487d3f7618affe54f789f5487602331c0a8d03f49e9a7c547cf0499  COPYING
diff --git a/package/tremor/tremor.hash b/package/tremor/tremor.hash
index 3c15dd75a5..4e599be644 100644
--- a/package/tremor/tremor.hash
+++ b/package/tremor/tremor.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a387ebb4536ca98034eb91855616b971b0a85575943699b2a6d0be79b4a9f6a9  tremor-7c30a66346199f3f09017a09567c6c8a3a0eedc8-br2.tar.gz
+sha256  a387ebb4536ca98034eb91855616b971b0a85575943699b2a6d0be79b4a9f6a9  tremor-7c30a66346199f3f09017a09567c6c8a3a0eedc8-git3.tar.gz
 sha256  d2ab5758336489da61c12cc5bb757da5339c4ae9001f9bb0562b4370249af814  COPYING
diff --git a/package/ubus/ubus.hash b/package/ubus/ubus.hash
index 94c337ad72..90107c0127 100644
--- a/package/ubus/ubus.hash
+++ b/package/ubus/ubus.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e3022aa3cf6c38a4d3c0d798d9a9c7069ada063a0a5fe6894b466b71b17ce9cc  ubus-f787c97b34894a38b15599886cacbca01271684f-br2.tar.gz
+sha256  e3022aa3cf6c38a4d3c0d798d9a9c7069ada063a0a5fe6894b466b71b17ce9cc  ubus-f787c97b34894a38b15599886cacbca01271684f-git3.tar.gz
 sha256  a3caa6c0e90c87b7c97c2ac3d0c0d416082ef777215faec2e9b24ea6e68f6988  ubusd_acl.h
diff --git a/package/uclibc-ng-test/uclibc-ng-test.hash b/package/uclibc-ng-test/uclibc-ng-test.hash
index b1af4406c5..a82c352eec 100644
--- a/package/uclibc-ng-test/uclibc-ng-test.hash
+++ b/package/uclibc-ng-test/uclibc-ng-test.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f261229c43c026e39178aca48f4f3caacd0bbe373ccd06d27954e7a5fa768fe8  uclibc-ng-test-0f303c63fab7f4038515ced6f2659242cf60ac19-br2.tar.gz
+sha256  f261229c43c026e39178aca48f4f3caacd0bbe373ccd06d27954e7a5fa768fe8  uclibc-ng-test-0f303c63fab7f4038515ced6f2659242cf60ac19-git3.tar.gz
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING.LIB
diff --git a/package/uemacs/uemacs.hash b/package/uemacs/uemacs.hash
index 157dce9fd7..1d1d270907 100644
--- a/package/uemacs/uemacs.hash
+++ b/package/uemacs/uemacs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  96e30247365bb27bd74c550b637f5b2ffd2978379872a32a840f6667cec5fa2a  uemacs-1cdcf9df88144049750116e36fe20c8c39fa2517-br2.tar.gz
+sha256  96e30247365bb27bd74c550b637f5b2ffd2978379872a32a840f6667cec5fa2a  uemacs-1cdcf9df88144049750116e36fe20c8c39fa2517-git3.tar.gz
 sha256  6e2a4cf41ec8d4379c154923349733bc0d3935c6fa72c4337cf1bc137b98b90a  README
diff --git a/package/uhttpd/uhttpd.hash b/package/uhttpd/uhttpd.hash
index 07ae6f29ec..44c7660806 100644
--- a/package/uhttpd/uhttpd.hash
+++ b/package/uhttpd/uhttpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9ae10aaf6642b214e0a4ca47d6fd9693ac4b88d61e7d6446f0f0feb3a28ca510  uhttpd-15346de8d3ba422002496526ee24c62a3601ab8c-br2.tar.gz
+sha256  9ae10aaf6642b214e0a4ca47d6fd9693ac4b88d61e7d6446f0f0feb3a28ca510  uhttpd-15346de8d3ba422002496526ee24c62a3601ab8c-git3.tar.gz
 sha256  ce1803f83f776cc88661e303fede0e5ff52faf1d9f74508fadbecf7705b4c84d  uhttpd.h
diff --git a/package/uqmi/uqmi.hash b/package/uqmi/uqmi.hash
index 383893a152..3f5ea02cb9 100644
--- a/package/uqmi/uqmi.hash
+++ b/package/uqmi/uqmi.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  aae6a72791da8f58012303ba3bfeeb613e74597cbebfb9e7c2d9125e6f256799  uqmi-0a19b5b77140465c29e2afa7d611fe93abc9672f-br2.tar.gz
+sha256  aae6a72791da8f58012303ba3bfeeb613e74597cbebfb9e7c2d9125e6f256799  uqmi-0a19b5b77140465c29e2afa7d611fe93abc9672f-git3.tar.gz
 sha256  a69bf44dbff15d727578d2069a654d60e9034c5e2cc3e199a012e72afef6c259  main.c
diff --git a/package/ustream-ssl/ustream-ssl.hash b/package/ustream-ssl/ustream-ssl.hash
index 83f74017f5..fb97ebc834 100644
--- a/package/ustream-ssl/ustream-ssl.hash
+++ b/package/ustream-ssl/ustream-ssl.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e77e579b718085c1447339e0fcd5385b85a783d5c92544e48a6b37b1695a7f39  ustream-ssl-68d09243b6fd4473004b27ff6483352e76e6af1a-br2.tar.gz
+sha256  e77e579b718085c1447339e0fcd5385b85a783d5c92544e48a6b37b1695a7f39  ustream-ssl-68d09243b6fd4473004b27ff6483352e76e6af1a-git3.tar.gz
 sha256  cf28f0f01a57423983fa062eb0f04bb1a78891863cb58c53059c3d8cb52c1dd4  ustream-ssl.h
diff --git a/package/vboot-utils/vboot-utils.hash b/package/vboot-utils/vboot-utils.hash
index c2d71202d6..2421776533 100644
--- a/package/vboot-utils/vboot-utils.hash
+++ b/package/vboot-utils/vboot-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9cdeaa2e4e1190c0cd200e1b07d394e5d24f57cc0efffdce861d5de934035bf7  vboot-utils-bbdd62f9b030db7ad8eef789aaf58a7ff9a25656-br2.tar.gz
+sha256  8ad1539e0f84e94220c17eb55ce6d755ea8fc14a30c719712837a5fb4f9c09f0  vboot-utils-bbdd62f9b030db7ad8eef789aaf58a7ff9a25656-git3.tar.gz
 sha256  cb9dc8e96aedf9120b6757a60387db10f3c1a8e3fd97bb9d0f11327be5a7ed4d  LICENSE
diff --git a/package/wilink-bt-firmware/wilink-bt-firmware.hash b/package/wilink-bt-firmware/wilink-bt-firmware.hash
index b7f5aae50f..7fbc7db70c 100644
--- a/package/wilink-bt-firmware/wilink-bt-firmware.hash
+++ b/package/wilink-bt-firmware/wilink-bt-firmware.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  209e1a46a945e7d4d031e22fb7bd1e3fc96fa3b99d069051ce257c5e2e0843f4  wilink-bt-firmware-43fca73c6a98c63fcb98f82af5bf83761778e005-br2.tar.gz
+sha256  209e1a46a945e7d4d031e22fb7bd1e3fc96fa3b99d069051ce257c5e2e0843f4  wilink-bt-firmware-43fca73c6a98c63fcb98f82af5bf83761778e005-git3.tar.gz
 sha256  21fd99ce784dc33b39ec0b4a383a9a9b8dafea261d73ad4548683c4eecd87f37  LICENSE
diff --git a/package/wtfutil/wtfutil.hash b/package/wtfutil/wtfutil.hash
index deb162794e..53904d1a36 100644
--- a/package/wtfutil/wtfutil.hash
+++ b/package/wtfutil/wtfutil.hash
@@ -1,2 +1,2 @@
-sha256  d15b2e8833d31d5b1ad7b4317777dc7aa045124d1d91994f02c9b5709f09fef3  wtfutil-0.41.0.tar.gz
+sha256  d15b2e8833d31d5b1ad7b4317777dc7aa045124d1d91994f02c9b5709f09fef3  wtfutil-0.41.0-go1.tar.gz
 sha256  b59f3dbd83c6aa4e003b6eafa80bc53f0629e4d164e8b125c56869c2603dbc8f  LICENSE.md
diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash
index 52af8a03e9..56140be59e 100644
--- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash
+++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  11f48628d2b1f495446c49df93de40569ced664c6fdbd5d3f8f7a863e4a1124c  xdriver_xf86-video-intel-31486f40f8e8f8923ca0799aea84b58799754564-br2.tar.gz
+sha256  ad4230b9810324cd643c1de25c21d16e08c2bef3d41b751bd0346f8427ca44fa  xdriver_xf86-video-intel-31486f40f8e8f8923ca0799aea84b58799754564-git3.tar.gz
 sha256  5808e89f4b9a30afc59f335bfa8219ecf2dacb89a81d16b322bc6d92993a48fa  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.hash b/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.hash
index 8601acbef1..959cfc1e10 100644
--- a/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.hash
+++ b/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  037bebbe31bcca2b4f3adeefccd2a64a30e2924946a6c6646c5829f7362212ec  xdriver_xf86-video-openchrome-ab03de703b91c7e0fd3e4d1ca06ad5add7f077a1-br2.tar.gz
+sha256  037bebbe31bcca2b4f3adeefccd2a64a30e2924946a6c6646c5829f7362212ec  xdriver_xf86-video-openchrome-ab03de703b91c7e0fd3e4d1ca06ad5add7f077a1-git3.tar.gz
 sha256  1fde58bce5cff8c32e9a0a80bfa3e60213a2767954e30a367127d5afa2884ca2  COPYING
diff --git a/package/x264/x264.hash b/package/x264/x264.hash
index 7fd8ffb2bc..c6bff5d853 100644
--- a/package/x264/x264.hash
+++ b/package/x264/x264.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e83cda2a69e72bc45bcb14aa7ca5e689cf0f67dc29fc6f1dce63abe2a428fc01  x264-baee400fa9ced6f5481a728138fed6e867b0ff7f-br2.tar.gz
+sha256  e83cda2a69e72bc45bcb14aa7ca5e689cf0f67dc29fc6f1dce63abe2a428fc01  x264-baee400fa9ced6f5481a728138fed6e867b0ff7f-git3.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/yavta/yavta.hash b/package/yavta/yavta.hash
index 1c3a675fe7..326da91795 100644
--- a/package/yavta/yavta.hash
+++ b/package/yavta/yavta.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  108a0ceec862b56a3fbcb3ad28a8744d9800555ccb3e11bdd94c8cd4614296d5  yavta-583bedefc2a247d2cfd32d1b4a0abbe3e2015c70-br2.tar.gz
+sha256  108a0ceec862b56a3fbcb3ad28a8744d9800555ccb3e11bdd94c8cd4614296d5  yavta-583bedefc2a247d2cfd32d1b4a0abbe3e2015c70-git3.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING.GPL
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

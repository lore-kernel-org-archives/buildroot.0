Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38101EE3F39
	for <buildroot@archiver.kernel.org>; Tue, 12 Sep 2023 22:17:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCD5241BC5;
	Tue, 12 Sep 2023 22:17:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCD5241BC5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XdZSlv5Xedxq; Tue, 12 Sep 2023 22:17:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9545A41C0B;
	Tue, 12 Sep 2023 22:17:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9545A41C0B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A0B6E1BF831
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 22:16:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 79AD360D88
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 22:16:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79AD360D88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h0QR_9Zc4yyK for <buildroot@lists.busybox.net>;
 Tue, 12 Sep 2023 22:15:59 +0000 (UTC)
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B07A960B1F
 for <buildroot@buildroot.org>; Tue, 12 Sep 2023 22:15:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B07A960B1F
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-31c8321c48fso179773f8f.1
 for <buildroot@buildroot.org>; Tue, 12 Sep 2023 15:15:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694556957; x=1695161757;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=y6TdowdjqMUQDIXc8AZOFwBmILQyY8svjghfTHE7swI=;
 b=uaBmDu1u9SHOTJFAN3nKipdGVSmzg54m5vqMUQQDgTNi1t/hiOnQbGASET5gBpAltk
 Bu4ahIBM/vysaYTlwxUE2snHO/MfCkuKu1IYSetLOgQJs5XqikApQlqffaguCWH7YH1m
 2C4ErWe4lhEDK77IUmN6hWEVIFlZTP/RgaLoTeAwwmg62pc45SCaasJOx6MZAgToSmo3
 bJFeYazPgTID8A/jabA482xd0/x+FOowmbLHVDVqSMmCQkBlKI2phHENnAAj6noYVUA4
 4p9uu1buvRhywgJikEXMrGCZw1pvxdkWxOpMPCrjuwqmIzJwoD7ARBA89l/7jcCs0ox7
 1iOA==
X-Gm-Message-State: AOJu0YzvaRbGG2tmaQYOHfp1MVXp6OMaRqmWnu2D/YvRdyu5pA1S9PQH
 nRydWGcsB8pU/VkfKMbhdHQRbNuCeN0=
X-Google-Smtp-Source: AGHT+IF+GhoWld6XUz9tb2utAEQnryAuIy70al19R6Qt8syLku5/38/ZzbRo9QF6S4POXWEao1hNuA==
X-Received: by 2002:a5d:568f:0:b0:314:3e96:bd7e with SMTP id
 f15-20020a5d568f000000b003143e96bd7emr3027044wrv.4.1694556956274; 
 Tue, 12 Sep 2023 15:15:56 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b44:b00:d377:8b3f:c881:5464])
 by smtp.gmail.com with ESMTPSA id
 n7-20020a5d67c7000000b0031423a8f4f7sm13901170wrw.56.2023.09.12.15.15.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Sep 2023 15:15:55 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 13 Sep 2023 00:15:52 +0200
Message-Id: <80096197fe23a2dbb5d975fd76c951b33737ca1c.1694556946.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1694556946.git.yann.morin.1998@free.fr>
References: <cover.1694556946.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694556957; x=1695161757; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y6TdowdjqMUQDIXc8AZOFwBmILQyY8svjghfTHE7swI=;
 b=m2K+jnzJE1tlqJF6JonrZWLjuWV1+2mKYlqAcZyD17m0FaYLP9yCOg3X368KbpRQqw
 5dwm7NMIM0sDAWyUesOgY4QpvJAQPwqrdIFwMFQBl6RXe2AjuL4hzRAnTcPF90gtjpR8
 XhmgZ0mBFJnUYE0Fh0iirXUUned0YpMQnOmSufmsYrsc3p/CVEvXvJty5l5lvlaXO/4l
 NIVBuluHUTq2kV+nd+KsRuThHENK6rLQR59VywW8LDPXyUT1kyr5jf/1VccBNH4lwA2P
 tS+vVmtbqD4ItwL208XA2qIxniA1hVjMOaC52UryJN9eKE/I+mm9WMCGSYpfmU1Ow9fn
 ZbDg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=m2K+jnzJ
Subject: [Buildroot] [PATCH 5/5] support/download/git: handle git attributes
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
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Files in a git repository can be given attributes, like the usual eol
that can convert to-from crlf, cr, lf when checking-out of committing a
file.

There are also two attributes that are meant to be used when generating
an archive (with git archive): export-subst, and export-ignore, that
respectively substitutes format placeholders in a file, and excludes a
file from the archive.

Some package (e.g. pcm-tools, luajit) use the export-subst attribute
to generate versioning information. luajit, specifically, uses the UNIX
timestamp of the commit as the patch-level for its semantic versioning.

Extend the git backend to handle the export-subst attribute. There is
no git tool (that we could find) that does that automatically, except
git-archive, which we can't use. So, we do it manually with a bit of
trickery where we do use awk to:

  - identify all files that have the export-subst attribute set,

  - for each such file, iterate over all the placeholders, and
    replace them with the expanded format.

When doing the replacement, we decided to force abbreviating short
hashes to 40 chars, which is the length of a full sha1, rather than
actually abbreviating them:

  - letting git decide of the length is not reproducible over time:
    as new commits are added, the short length will increase to avoid
    collisions; a newer git version may decide of a different heuristic
    to shorten hashes; a user may have a local setting with an arbitrary
    length;

  - deciding on our side of an arbitrary value would not be
    viable long term either, as it might be too large to be minimum, or
    too short to avoid collisions.

The only reproducible solution is to use unabbreviated hashes.

Handling git-attributes also implies that the format of the generated
archives has changed, since we now expand placeholders, so we bump our
git format version.

Of all our git-downloaded packages, 5 are affected:

  - pcm-tools, which was known, and the one that triggered this commit;
    since we now expand placeholders, we can drop the post-extract hook;
    switching to a full hash in replacements also changes the hash of
    the generated archive;

  - qt5knx, qt5location, qt5mqtt, and qt5opcua: the file .tag at the
    repository root, contains only the full hash placeholder; that file
    is not used at all during the build (AFAICS);

Finally, we add a run-time test to validate this new feature.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Woody Douglass <wdouglass@carnegierobotics.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Francois Perrad <fperrad@gmail.com>
---
 boot/edk2/edk2.hash                           |   2 +-
 boot/vexpress-firmware/vexpress-firmware.hash |   2 +-
 package/abootimg/abootimg.hash                |   2 +-
 package/aer-inject/aer-inject.hash            |   2 +-
 package/am33x-cm3/am33x-cm3.hash              |   2 +-
 .../armbian-firmware/armbian-firmware.hash    |   2 +-
 package/azure-iot-sdk-c/azure-iot-sdk-c.hash  |   2 +-
 package/bayer2rgb-neon/bayer2rgb-neon.hash    |   2 +-
 package/bpftool/bpftool.hash                  |   2 +-
 package/brickd/brickd.hash                    |   2 +-
 package/c-capnproto/c-capnproto.hash          |   2 +-
 package/dbus-triggerd/dbus-triggerd.hash      |   2 +-
 package/dtv-scan-tables/dtv-scan-tables.hash  |   2 +-
 package/edid-decode/edid-decode.hash          |   2 +-
 package/firmware-utils/firmware-utils.hash    |   2 +-
 package/flashbench/flashbench.hash            |   2 +-
 package/freescale-imx/imx-lib/imx-lib.hash    |   2 +-
 package/google-breakpad/google-breakpad.hash  |   2 +-
 .../gst1-interpipe/gst1-interpipe.hash        |   2 +-
 .../gst1-plugins-bayer2rgb-neon.hash          |   2 +-
 package/gstreamer1/gst1-shark/gst1-shark.hash |   3 +-
 package/ibm-sw-tpm2/ibm-sw-tpm2.hash          |   2 +-
 package/kvmtool/kvmtool.hash                  |   2 +-
 package/libbroadvoice/libbroadvoice.hash      |   2 +-
 package/libcamera/libcamera.hash              |   2 +-
 package/libdbi-drivers/libdbi-drivers.hash    |   2 +-
 package/libdbi/libdbi.hash                    |   2 +-
 package/libg7221/libg7221.hash                |   2 +-
 package/libilbc/libilbc.hash                  |   2 +-
 package/libsilk/libsilk.hash                  |   2 +-
 package/libsvgtiny/libsvgtiny.hash            |   2 +-
 package/libubox/libubox.hash                  |   2 +-
 package/libuci/libuci.hash                    |   2 +-
 package/libyuv/libyuv.hash                    |   2 +-
 .../linux-syscall-support.hash                |   2 +-
 package/mmc-utils/mmc-utils.hash              |   3 +-
 .../netsurf-buildsystem.hash                  |   2 +-
 package/odhcp6c/odhcp6c.hash                  |   2 +-
 package/ogre/ogre.hash                        |   2 +-
 package/open62541/open62541.hash              |   2 +-
 package/opkg-utils/opkg-utils.hash            |   2 +-
 package/pcm-tools/pcm-tools.hash              |   2 +-
 package/pcm-tools/pcm-tools.mk                |   8 ---
 package/piglit/piglit.hash                    |   2 +-
 package/pkg-download.mk                       |   2 +-
 package/prelink-cross/prelink-cross.hash      |   2 +-
 package/psplash/psplash.hash                  |   2 +-
 package/qt-webkit-kiosk/qt-webkit-kiosk.hash  |   2 +-
 package/qt5/qt5coap/qt5coap.hash              |   2 +-
 package/qt5/qt5knx/qt5knx.hash                |   2 +-
 package/qt5/qt5location/qt5location.hash      |   2 +-
 package/qt5/qt5mqtt/qt5mqtt.hash              |   2 +-
 package/qt5/qt5opcua/qt5opcua.hash            |   2 +-
 .../qt5webengine-chromium-catapult.hash       |   2 +-
 package/rockchip-rkbin/rockchip-rkbin.hash    |   2 +-
 package/rtc-tools/rtc-tools.hash              |   2 +-
 package/rtmpdump/rtmpdump.hash                |   2 +-
 .../signal-estimator/signal-estimator.hash    |   2 +-
 package/sox/sox.hash                          |   2 +-
 package/tftpd/tftpd.hash                      |   2 +-
 package/ti-sgx-demos/ti-sgx-demos.hash        |   2 +-
 package/ti-sgx-km/ti-sgx-km.hash              |   2 +-
 package/ti-sgx-um/ti-sgx-um.hash              |   2 +-
 package/tl-expected/tl-expected.hash          |   2 +-
 package/tremor/tremor.hash                    |   2 +-
 package/ubus/ubus.hash                        |   2 +-
 package/uclibc-ng-test/uclibc-ng-test.hash    |   2 +-
 package/uemacs/uemacs.hash                    |   2 +-
 package/uhttpd/uhttpd.hash                    |   2 +-
 package/uqmi/uqmi.hash                        |   2 +-
 package/ustream-ssl/ustream-ssl.hash          |   2 +-
 package/vboot-utils/vboot-utils.hash          |   2 +-
 .../wilink-bt-firmware.hash                   |   2 +-
 .../xdriver_xf86-video-intel.hash             |   2 +-
 .../xdriver_xf86-video-openchrome.hash        |   2 +-
 package/x264/x264.hash                        |   2 +-
 package/yavta/yavta.hash                      |   2 +-
 support/download/git                          |  58 ++++++++++++++++++
 .../git-hash/package/bad/bad.hash             |   2 +-
 .../package/export-subst/export-subst.hash    |   1 +
 .../package/export-subst/export-subst.mk      |  10 +++
 .../git-hash/package/good/good.hash           |   2 +-
 .../git-partial-sha1-branch-head.hash         |   2 +-
 .../git-partial-sha1-reachable-by-branch.hash |   2 +-
 .../git-partial-sha1-reachable-by-tag.hash    |   2 +-
 .../git-partial-sha1-tag-itself.hash          |   2 +-
 .../git-partial-sha1-tag-points-to.hash       |   2 +-
 .../git-sha1-branch-head.hash                 |   2 +-
 .../git-sha1-reachable-by-branch.hash         |   2 +-
 .../git-sha1-reachable-by-tag.hash            |   2 +-
 .../git-sha1-tag-itself.hash                  |   2 +-
 .../git-sha1-tag-points-to.hash               |   2 +-
 .../git-submodule-disabled.hash               |   2 +-
 .../git-submodule-enabled.hash                |   2 +-
 .../git-refs/package/git-tag/git-tag.hash     |   2 +-
 .../git-wrong-content/git-wrong-content.hash  |   2 +-
 .../05/482df734b3715b849ef4a3147a9b1b1f8cca38 | Bin 0 -> 35 bytes
 .../0f/db95cf4f3c5ed4003287649cabb33c5f843e26 | Bin 0 -> 197 bytes
 .../68/28f88dcb0e88b8cd738ad6044ce74d7a9a13c8 | Bin 0 -> 28 bytes
 .../6d/a12b257e47f6089612fe97a8746d2d9c4ca0e0 | Bin 0 -> 112 bytes
 .../git-remote/repo.git/refs/heads/master     |   2 +-
 support/testing/tests/download/test_git.py    |   4 ++
 102 files changed, 166 insertions(+), 103 deletions(-)
 create mode 100644 support/testing/tests/download/br2-external/git-hash/package/export-subst/export-subst.hash
 create mode 100644 support/testing/tests/download/br2-external/git-hash/package/export-subst/export-subst.mk
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/05/482df734b3715b849ef4a3147a9b1b1f8cca38
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/0f/db95cf4f3c5ed4003287649cabb33c5f843e26
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/68/28f88dcb0e88b8cd738ad6044ce74d7a9a13c8
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/6d/a12b257e47f6089612fe97a8746d2d9c4ca0e0

diff --git a/boot/edk2/edk2.hash b/boot/edk2/edk2.hash
index 17918ee7bb..3af2bdbc88 100644
--- a/boot/edk2/edk2.hash
+++ b/boot/edk2/edk2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9389ad20bc75f2a8fa9e7c1b1948ef07481c94e96dec57ae2f9f9be9c754f92c  edk2-edk2-stable202308-br1.tar.gz
+sha256  9389ad20bc75f2a8fa9e7c1b1948ef07481c94e96dec57ae2f9f9be9c754f92c  edk2-edk2-stable202308-br2.tar.gz
 sha256  50ce20c9cfdb0e19ee34fe0a51fc0afe961f743697b068359ab2f862b494df80  License.txt
diff --git a/boot/vexpress-firmware/vexpress-firmware.hash b/boot/vexpress-firmware/vexpress-firmware.hash
index ac636e1512..9a837a88df 100644
--- a/boot/vexpress-firmware/vexpress-firmware.hash
+++ b/boot/vexpress-firmware/vexpress-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  ea92d686e6e211074fb0f62cb5e011f4cfc294c7f6ec9fb27b7d987db7bf51c5  vexpress-firmware-901f81977c3b367a2e0bf3d6444be302822d97a3-br1.tar.gz
+sha256  ea92d686e6e211074fb0f62cb5e011f4cfc294c7f6ec9fb27b7d987db7bf51c5  vexpress-firmware-901f81977c3b367a2e0bf3d6444be302822d97a3-br2.tar.gz
diff --git a/package/abootimg/abootimg.hash b/package/abootimg/abootimg.hash
index 33e74b893e..2cb2e2ac7c 100644
--- a/package/abootimg/abootimg.hash
+++ b/package/abootimg/abootimg.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f377da42a57d982cfc22fa75c5a69febdc3e4c1ef43cd0ceaec42e14067e2f37  abootimg-1ebeb393252ab5aeed62e34bc439b6728444f06e-br1.tar.gz
+sha256  f377da42a57d982cfc22fa75c5a69febdc3e4c1ef43cd0ceaec42e14067e2f37  abootimg-1ebeb393252ab5aeed62e34bc439b6728444f06e-br2.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/aer-inject/aer-inject.hash b/package/aer-inject/aer-inject.hash
index 6259bb9054..052c503240 100644
--- a/package/aer-inject/aer-inject.hash
+++ b/package/aer-inject/aer-inject.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2dd2bd73aa738c1cc26ba04b6e502329778d18c2cc873c0bd00e6b2d38e9477c  aer-inject-9bd5e2c7886fca72f139cd8402488a2235957d41-br1.tar.gz
+sha256  2dd2bd73aa738c1cc26ba04b6e502329778d18c2cc873c0bd00e6b2d38e9477c  aer-inject-9bd5e2c7886fca72f139cd8402488a2235957d41-br2.tar.gz
 sha256  659a191d8775e05c6c6a9a4ba66b3577c577342bb83f20d393135eb6633c8973  README
diff --git a/package/am33x-cm3/am33x-cm3.hash b/package/am33x-cm3/am33x-cm3.hash
index 2210e8ac69..b0750ac2d2 100644
--- a/package/am33x-cm3/am33x-cm3.hash
+++ b/package/am33x-cm3/am33x-cm3.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c0b11d7ed2300172354f2948e858ddb5cae19d084bd1ab6d48cfa7b6bfa13261  am33x-cm3-11107db2f1e9e58ee75d4fe9cc38423c9a6e4365-br1.tar.gz
+sha256  c0b11d7ed2300172354f2948e858ddb5cae19d084bd1ab6d48cfa7b6bfa13261  am33x-cm3-11107db2f1e9e58ee75d4fe9cc38423c9a6e4365-br2.tar.gz
 sha256  e136e6949a1d3ca144374375af8b9387faa11d2eee7debff8cf22ca8fe7bf7e9  License.txt
diff --git a/package/armbian-firmware/armbian-firmware.hash b/package/armbian-firmware/armbian-firmware.hash
index 5ef875dbea..ea3d7f845c 100644
--- a/package/armbian-firmware/armbian-firmware.hash
+++ b/package/armbian-firmware/armbian-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  725b1f65a5947f053a593f917f91c6634d496c92af6180845cc3679d1377ab79  armbian-firmware-5d685ad233b4dfd03a4d025fa0061f6b0f850cb3-br1.tar.gz
+sha256  725b1f65a5947f053a593f917f91c6634d496c92af6180845cc3679d1377ab79  armbian-firmware-5d685ad233b4dfd03a4d025fa0061f6b0f850cb3-br2.tar.gz
diff --git a/package/azure-iot-sdk-c/azure-iot-sdk-c.hash b/package/azure-iot-sdk-c/azure-iot-sdk-c.hash
index b960c0e571..c5590f54a4 100644
--- a/package/azure-iot-sdk-c/azure-iot-sdk-c.hash
+++ b/package/azure-iot-sdk-c/azure-iot-sdk-c.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  7b52b9886a3aff20a55a0d5bc5e140c212f85fd06af18c31291c15d363743a77  azure-iot-sdk-c-LTS_01_2023_Ref02-br1.tar.gz
+sha256  7b52b9886a3aff20a55a0d5bc5e140c212f85fd06af18c31291c15d363743a77  azure-iot-sdk-c-LTS_01_2023_Ref02-br2.tar.gz
 
 # Hash for license files:
 sha256  be2e9913fad9ff33607287c728f392579e2a6cc83e51b203ef6274c41db02ee7  LICENSE
diff --git a/package/bayer2rgb-neon/bayer2rgb-neon.hash b/package/bayer2rgb-neon/bayer2rgb-neon.hash
index 26a14fcb51..19a8365375 100644
--- a/package/bayer2rgb-neon/bayer2rgb-neon.hash
+++ b/package/bayer2rgb-neon/bayer2rgb-neon.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  edf451dbb52ad67eb35f9043390bd75ea7228d493c99184aae80b3bd27beab62  bayer2rgb-neon-15feb1115b4828488cc36d09f625e23e8b6a0ec5-br1.tar.gz
+sha256  edf451dbb52ad67eb35f9043390bd75ea7228d493c99184aae80b3bd27beab62  bayer2rgb-neon-15feb1115b4828488cc36d09f625e23e8b6a0ec5-br2.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/bpftool/bpftool.hash b/package/bpftool/bpftool.hash
index cfd3c54515..c5a6a1c75a 100644
--- a/package/bpftool/bpftool.hash
+++ b/package/bpftool/bpftool.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  35ff149cab4a3ab209b0c04cab2707243ab7ee753de5f4b5678296c975cf7fe0  bpftool-v7.1.0-br1.tar.gz
+sha256  35ff149cab4a3ab209b0c04cab2707243ab7ee753de5f4b5678296c975cf7fe0  bpftool-v7.1.0-br2.tar.gz
 sha256  7c588754d5e81e92e2a12e47cf78949d485c9c22b4850f12d21b3835c85947d1  LICENSE
 sha256  6313108c23efffa36948f8b2cff1560a5935373b527b0e1a837cc77e6ed1bacd  LICENSE.BSD-2-Clause
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL-2.0
diff --git a/package/brickd/brickd.hash b/package/brickd/brickd.hash
index be9ad9ed90..bd6036afe6 100644
--- a/package/brickd/brickd.hash
+++ b/package/brickd/brickd.hash
@@ -1,5 +1,5 @@
 # Locally computed hash
-sha256  8469b6959a7e32c4b39a56e1a4f7479f785d83e6db3269487f5312f3cf1df382  brickd-v1.2.2-br1.tar.gz
+sha256  8469b6959a7e32c4b39a56e1a4f7479f785d83e6db3269487f5312f3cf1df382  brickd-v1.2.2-br2.tar.gz
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.txt
diff --git a/package/c-capnproto/c-capnproto.hash b/package/c-capnproto/c-capnproto.hash
index e215400ce5..a73b4fa684 100644
--- a/package/c-capnproto/c-capnproto.hash
+++ b/package/c-capnproto/c-capnproto.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1e35ef786bd8e418ff04fccb20ac881a87fa2fa76df1cbddc4774e35423bafb8  c-capnproto-9053ebe6eeb2ae762655b982e27c341cb568366d-br1.tar.gz
+sha256  1e35ef786bd8e418ff04fccb20ac881a87fa2fa76df1cbddc4774e35423bafb8  c-capnproto-9053ebe6eeb2ae762655b982e27c341cb568366d-br2.tar.gz
 sha256  27797e6c7dce96675d79ed250584d157b7a86405db6eb6fba9644e6d96d42c57  COPYING
diff --git a/package/dbus-triggerd/dbus-triggerd.hash b/package/dbus-triggerd/dbus-triggerd.hash
index 956a577ca4..8de278d67b 100644
--- a/package/dbus-triggerd/dbus-triggerd.hash
+++ b/package/dbus-triggerd/dbus-triggerd.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  930cccfe8bdff98cab0cff003d90f9421858850d2d00143108191b62b4ef5e5a  dbus-triggerd-ba3dbec805cb707c94c54de21666bf18b79bcc09-br1.tar.gz
+sha256  930cccfe8bdff98cab0cff003d90f9421858850d2d00143108191b62b4ef5e5a  dbus-triggerd-ba3dbec805cb707c94c54de21666bf18b79bcc09-br2.tar.gz
 sha256  30d135650639af9019633690fc1aecbfc150aeeef9446347d4286a58338d10b0  dbus-triggerd.c
diff --git a/package/dtv-scan-tables/dtv-scan-tables.hash b/package/dtv-scan-tables/dtv-scan-tables.hash
index e53a168832..c3c0e05619 100644
--- a/package/dtv-scan-tables/dtv-scan-tables.hash
+++ b/package/dtv-scan-tables/dtv-scan-tables.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  b77c6bcbbc20f6b6bdbf735fb75cf9bec8634e1e6d3a32e6db2573deeb7a2212  dtv-scan-tables-57ed2982275045ea5e92ef2a40b9fa58255852e5-br1.tar.gz
+sha256  b77c6bcbbc20f6b6bdbf735fb75cf9bec8634e1e6d3a32e6db2573deeb7a2212  dtv-scan-tables-57ed2982275045ea5e92ef2a40b9fa58255852e5-br2.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
 sha256  4fd46f32582c29007657e2daad8d0a6d954cf4e9d2e47bae8f8d8c32765fc987  COPYING.LGPL
diff --git a/package/edid-decode/edid-decode.hash b/package/edid-decode/edid-decode.hash
index 8bece94911..93c4ef7e71 100644
--- a/package/edid-decode/edid-decode.hash
+++ b/package/edid-decode/edid-decode.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a8774f1d3eb031ffa4ecb85135b47ad28afeeaa7cf9e8410c5b51a29b83bbfdd  edid-decode-2d44e1b01c7ed7d65b20ecdce62d354841832201-br1.tar.gz
+sha256  a8774f1d3eb031ffa4ecb85135b47ad28afeeaa7cf9e8410c5b51a29b83bbfdd  edid-decode-2d44e1b01c7ed7d65b20ecdce62d354841832201-br2.tar.gz
 sha256  9bc7ab961e9a07dc84eaa0210af388def56d024357e79671fb89fe27d073eed7  LICENSE
diff --git a/package/firmware-utils/firmware-utils.hash b/package/firmware-utils/firmware-utils.hash
index 16197cabd0..ce9fa5009b 100644
--- a/package/firmware-utils/firmware-utils.hash
+++ b/package/firmware-utils/firmware-utils.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  0df1b7912d68822025f9bb6a7ddfdf9675e2116d34c3c74bbdc83defcefe203c  firmware-utils-86739f2b3ae9502368b89ef37fa6f31c42aad6f4-br1.tar.gz
+sha256  0df1b7912d68822025f9bb6a7ddfdf9675e2116d34c3c74bbdc83defcefe203c  firmware-utils-86739f2b3ae9502368b89ef37fa6f31c42aad6f4-br2.tar.gz
diff --git a/package/flashbench/flashbench.hash b/package/flashbench/flashbench.hash
index 9906af02e5..405fc9ec70 100644
--- a/package/flashbench/flashbench.hash
+++ b/package/flashbench/flashbench.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  422860966ad3528a7fd1dc88e4aa0b2bd91f11fa6429523b9acd21dc5beb6a19  flashbench-2e30b1968a66147412f21002ea844122a0d5e2f0-br1.tar.gz
+sha256  422860966ad3528a7fd1dc88e4aa0b2bd91f11fa6429523b9acd21dc5beb6a19  flashbench-2e30b1968a66147412f21002ea844122a0d5e2f0-br2.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/freescale-imx/imx-lib/imx-lib.hash b/package/freescale-imx/imx-lib/imx-lib.hash
index f7d907b99d..81be55a435 100644
--- a/package/freescale-imx/imx-lib/imx-lib.hash
+++ b/package/freescale-imx/imx-lib/imx-lib.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  cad7823568cbd367ed8525e01c8c11a2393fc2dc481425273cb7919385367c61  imx-lib-3f777974c0c146817e2ff5cb0340ca66a1f99e57-br1.tar.gz
+sha256  cad7823568cbd367ed8525e01c8c11a2393fc2dc481425273cb7919385367c61  imx-lib-3f777974c0c146817e2ff5cb0340ca66a1f99e57-br2.tar.gz
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING-LGPL-2.1
diff --git a/package/google-breakpad/google-breakpad.hash b/package/google-breakpad/google-breakpad.hash
index 03719816b5..e13807e70e 100644
--- a/package/google-breakpad/google-breakpad.hash
+++ b/package/google-breakpad/google-breakpad.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  52716d140ba528d36b40591ae2c7485b18023f6610414bba0057f0cc13caf256  google-breakpad-c85eb4a59b618f3beaad5445ceb1f865ffa8efdf-br1.tar.gz
+sha256  52716d140ba528d36b40591ae2c7485b18023f6610414bba0057f0cc13caf256  google-breakpad-c85eb4a59b618f3beaad5445ceb1f865ffa8efdf-br2.tar.gz
 sha256  8d5d1311342ed55b486d778a6763f54a26002698ac0cbab64026b98033300dfd  LICENSE
diff --git a/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash b/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash
index d9f09d2985..e278077ab0 100644
--- a/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash
+++ b/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash
@@ -1,5 +1,5 @@
 # locally computed hash
-sha256  b97af0dfa108c5f736a961c388267c7a9c8f915e753985d7e85939091032deed  gst1-interpipe-v1.1.8-br1.tar.gz
+sha256  b97af0dfa108c5f736a961c388267c7a9c8f915e753985d7e85939091032deed  gst1-interpipe-v1.1.8-br2.tar.gz
 
 # Hashes for license files:
 sha256  16d7caa6cabbfd0ca47e064a7b48cb446d013e84ca88c854d6470851752136d5  COPYING
diff --git a/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.hash b/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.hash
index e626d0ba8d..60a694f378 100644
--- a/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.hash
+++ b/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  76b2135a23f465f789ccb86bd3a8190a1e30f86cdb28abfac4d9a2cdece63fa2  gst1-plugins-bayer2rgb-neon-b630798efcd611879e7cb1c246052e5ba1acc41d-br1.tar.gz
+sha256  76b2135a23f465f789ccb86bd3a8190a1e30f86cdb28abfac4d9a2cdece63fa2  gst1-plugins-bayer2rgb-neon-b630798efcd611879e7cb1c246052e5ba1acc41d-br2.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/gstreamer1/gst1-shark/gst1-shark.hash b/package/gstreamer1/gst1-shark/gst1-shark.hash
index 37276cc93d..8fa9a857aa 100644
--- a/package/gstreamer1/gst1-shark/gst1-shark.hash
+++ b/package/gstreamer1/gst1-shark/gst1-shark.hash
@@ -1,5 +1,4 @@
-# locally computed hash
-sha256  07587922dc49d12abe2444590a88c530409854b02904ad50357b312f9b6ea736  gst1-shark-v0.8.1-br1.tar.gz
+sha256  07587922dc49d12abe2444590a88c530409854b02904ad50357b312f9b6ea736  gst1-shark-v0.8.1-br2.tar.gz
 
 # Hashes for license files:
 sha256  6d191b8f1fa03cabced18b8e48fddbf960a19f965bed8491e76ed62238f92f0b  COPYING
diff --git a/package/ibm-sw-tpm2/ibm-sw-tpm2.hash b/package/ibm-sw-tpm2/ibm-sw-tpm2.hash
index e47aa6acbd..3f400a500c 100644
--- a/package/ibm-sw-tpm2/ibm-sw-tpm2.hash
+++ b/package/ibm-sw-tpm2/ibm-sw-tpm2.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  d11203a73946ad14ca39f4b74742c0d81762dbe7e913a4685f92620f1d6fe295  ibm-sw-tpm2-5452af422edeff70fcae8ea99dd28a0922051d7b-br1.tar.gz
+sha256  d11203a73946ad14ca39f4b74742c0d81762dbe7e913a4685f92620f1d6fe295  ibm-sw-tpm2-5452af422edeff70fcae8ea99dd28a0922051d7b-br2.tar.gz
 sha256  dd2d31b560011ea673e197251e710e52669d911367d83cd3cfd018f8ed58bde9  LICENSE
diff --git a/package/kvmtool/kvmtool.hash b/package/kvmtool/kvmtool.hash
index 8747ae1d21..c29ef8ad37 100644
--- a/package/kvmtool/kvmtool.hash
+++ b/package/kvmtool/kvmtool.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e2eb2cd8b31d24484e3095923cfe8c36d4b92741b76965cafaed6be3835369c6  kvmtool-f77d646ba01d04be5aad9449ac00719c043fe36e-br1.tar.gz
+sha256  e2eb2cd8b31d24484e3095923cfe8c36d4b92741b76965cafaed6be3835369c6  kvmtool-f77d646ba01d04be5aad9449ac00719c043fe36e-br2.tar.gz
 sha256  0d5bf346df9e635a29dcdddf832dc5b002ca6cdc1c5c9c6c567d2a61bb0c5c15  COPYING
diff --git a/package/libbroadvoice/libbroadvoice.hash b/package/libbroadvoice/libbroadvoice.hash
index 0a22817e25..ccd4477738 100644
--- a/package/libbroadvoice/libbroadvoice.hash
+++ b/package/libbroadvoice/libbroadvoice.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  777e5dccc3d189514b7f8e85b6c941d3b9d16d2d68d72cad055cbdfb571d3681  libbroadvoice-f65b0f50c8c767229fbf1758370880abc0d78564-br1.tar.gz
+sha256  777e5dccc3d189514b7f8e85b6c941d3b9d16d2d68d72cad055cbdfb571d3681  libbroadvoice-f65b0f50c8c767229fbf1758370880abc0d78564-br2.tar.gz
 sha256  2550586c993ce4a8c23c8b11968ea36192116a896a2504799cc65307d769c094  COPYING
diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
index c25a737809..b606c858fa 100644
--- a/package/libcamera/libcamera.hash
+++ b/package/libcamera/libcamera.hash
@@ -1,4 +1,4 @@
-sha256  f38b42fa849d4d1d5a4dd4ca3013b4b297861cba53970e665e295d3e57de58e6  libcamera-v0.1.0-br1.tar.gz
+sha256  f38b42fa849d4d1d5a4dd4ca3013b4b297861cba53970e665e295d3e57de58e6  libcamera-v0.1.0-br2.tar.gz
 
 # license files
 sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  LICENSES/BSD-2-Clause.txt
diff --git a/package/libdbi-drivers/libdbi-drivers.hash b/package/libdbi-drivers/libdbi-drivers.hash
index b805bb0283..8b8009406d 100644
--- a/package/libdbi-drivers/libdbi-drivers.hash
+++ b/package/libdbi-drivers/libdbi-drivers.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  80a1befb044238a89b2d0dbd40881aa6c75bf99d3a7a6c016c657ea26df7792c  libdbi-drivers-0bfae6c43134cf58dc89364328545982ca297abb-br1.tar.gz
+sha256  80a1befb044238a89b2d0dbd40881aa6c75bf99d3a7a6c016c657ea26df7792c  libdbi-drivers-0bfae6c43134cf58dc89364328545982ca297abb-br2.tar.gz
 sha256  5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509  COPYING
diff --git a/package/libdbi/libdbi.hash b/package/libdbi/libdbi.hash
index 6dd2d3658a..561721a303 100644
--- a/package/libdbi/libdbi.hash
+++ b/package/libdbi/libdbi.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  958475e0010a3d8e43ce9ecd6a64d25eacca6ada46c39bc69f949dd70f92ab7a  libdbi-88b8477d57153b9f736dd19d432d3b7ab1c49073-br1.tar.gz
+sha256  958475e0010a3d8e43ce9ecd6a64d25eacca6ada46c39bc69f949dd70f92ab7a  libdbi-88b8477d57153b9f736dd19d432d3b7ab1c49073-br2.tar.gz
 sha256  5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509  COPYING
diff --git a/package/libg7221/libg7221.hash b/package/libg7221/libg7221.hash
index b2174e8b46..68d336ac1e 100644
--- a/package/libg7221/libg7221.hash
+++ b/package/libg7221/libg7221.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7f00d6a4f435a91ab3bc96e6c95aa1334bd416f80d98843b4f178067239ee832  libg7221-dbfc29d4806ecdace50379a2f4d68a992a6fec34-br1.tar.gz
+sha256  7f00d6a4f435a91ab3bc96e6c95aa1334bd416f80d98843b4f178067239ee832  libg7221-dbfc29d4806ecdace50379a2f4d68a992a6fec34-br2.tar.gz
 sha256  26cc5f718279b45dbe34e25a2d29b2c8ca487bd9ab11b2d68c9318ff59d5c645  COPYING
diff --git a/package/libilbc/libilbc.hash b/package/libilbc/libilbc.hash
index 5f41a99ced..9fafa9a569 100644
--- a/package/libilbc/libilbc.hash
+++ b/package/libilbc/libilbc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f97d8284776c95b31ed5d5441f13b519b8c7966b77a26aa06c29bb77e02cfe16  libilbc-829b08c7902ceb87a261279fabb36b6d523c6e07-br1.tar.gz
+sha256  f97d8284776c95b31ed5d5441f13b519b8c7966b77a26aa06c29bb77e02cfe16  libilbc-829b08c7902ceb87a261279fabb36b6d523c6e07-br2.tar.gz
 sha256  b7f4cbb4a12cd11a3d1aeda9bd17c99f59b054de4b3ee53045531cd2fa74dd2a  gips_iLBClicense.pdf
diff --git a/package/libsilk/libsilk.hash b/package/libsilk/libsilk.hash
index 14f6676262..154645d1c6 100644
--- a/package/libsilk/libsilk.hash
+++ b/package/libsilk/libsilk.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ac79eb4c154af25c0ab25e12d60d3b4165c399903fe88d82e066cf6d9827503e  libsilk-4268a02240c35c6055b0f237c46b09b2dcf79e45-br1.tar.gz
+sha256  ac79eb4c154af25c0ab25e12d60d3b4165c399903fe88d82e066cf6d9827503e  libsilk-4268a02240c35c6055b0f237c46b09b2dcf79e45-br2.tar.gz
 sha256  62a5963f034024665641f4a9888b208f1e39aa7e29e87c9634fdcf07d3073baf  COPYING
diff --git a/package/libsvgtiny/libsvgtiny.hash b/package/libsvgtiny/libsvgtiny.hash
index ba4b4cae97..69854f3332 100644
--- a/package/libsvgtiny/libsvgtiny.hash
+++ b/package/libsvgtiny/libsvgtiny.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  917850350d014c953f2af0fb92f0eeb25652619710922d467c98f8109fb92baf  libsvgtiny-ea9d99fc8b231c22d06168135e181d61f4eb2f06-br1.tar.gz
+sha256  917850350d014c953f2af0fb92f0eeb25652619710922d467c98f8109fb92baf  libsvgtiny-ea9d99fc8b231c22d06168135e181d61f4eb2f06-br2.tar.gz
 sha256  92b965c77be71661cae51425a6b40a5ca274f44cc13c723c90fb471a9a26a828  README
diff --git a/package/libubox/libubox.hash b/package/libubox/libubox.hash
index 48b6432f5d..30d9dee234 100644
--- a/package/libubox/libubox.hash
+++ b/package/libubox/libubox.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  b06311e7d857583303e9256f58787857944572012fbfd4a5d83e92e0e684f654  libubox-75a3b870cace1171faf57bd55e5a9a2f1564f757-br1.tar.gz
+sha256  b06311e7d857583303e9256f58787857944572012fbfd4a5d83e92e0e684f654  libubox-75a3b870cace1171faf57bd55e5a9a2f1564f757-br2.tar.gz
diff --git a/package/libuci/libuci.hash b/package/libuci/libuci.hash
index 87e539d41b..8e445967b3 100644
--- a/package/libuci/libuci.hash
+++ b/package/libuci/libuci.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  4b4e3ef9c9f51c02a1985c63ff0e8fc1f3aafdf24491247a4dc33c993c3fa1ea  libuci-4b3db1179747b6a6779029407984bacef851325c-br1.tar.gz
+sha256  4b4e3ef9c9f51c02a1985c63ff0e8fc1f3aafdf24491247a4dc33c993c3fa1ea  libuci-4b3db1179747b6a6779029407984bacef851325c-br2.tar.gz
 sha256  39e1cc18a36172fb80d9b37f0af77d78ae935bd8a020978a7895d9e76a24e112  cli.c
 sha256  69d4eea4de19d27014f3d6ed723081b4039700bfd73cd0a5e39e2c4f19a58c66  libuci.c
diff --git a/package/libyuv/libyuv.hash b/package/libyuv/libyuv.hash
index 4b70e63ade..42d6e91329 100644
--- a/package/libyuv/libyuv.hash
+++ b/package/libyuv/libyuv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7bb4118ef050ca3e9a27f49b7d21e068922bf57cf973f2c7b1476cadf73ac66a  libyuv-413a8d8041f1cc5a350a47c0d81cc721e64f9fd0-br1.tar.gz
+sha256  7bb4118ef050ca3e9a27f49b7d21e068922bf57cf973f2c7b1476cadf73ac66a  libyuv-413a8d8041f1cc5a350a47c0d81cc721e64f9fd0-br2.tar.gz
 sha256  2b2cc1180c7e6988328ad2033b04b80117419db9c4c584918bbb3cfec7e9364f  LICENSE
diff --git a/package/linux-syscall-support/linux-syscall-support.hash b/package/linux-syscall-support/linux-syscall-support.hash
index 9d8855cf23..f47b64a626 100644
--- a/package/linux-syscall-support/linux-syscall-support.hash
+++ b/package/linux-syscall-support/linux-syscall-support.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2a12703ce59773ec714b603e46c733b03f3fbf9b4763195fae40d0042e5da3f6  linux-syscall-support-e1e7b0ad8ee99a875b272c8e33e308472e897660-br1.tar.gz
+sha256  2a12703ce59773ec714b603e46c733b03f3fbf9b4763195fae40d0042e5da3f6  linux-syscall-support-e1e7b0ad8ee99a875b272c8e33e308472e897660-br2.tar.gz
 sha256  c180f12840c00224cceed7139192018d2c7e6061db4ce4310b8626f7ad10bf26  LICENSE
diff --git a/package/mmc-utils/mmc-utils.hash b/package/mmc-utils/mmc-utils.hash
index 1bdb545cbc..340bd2fc40 100644
--- a/package/mmc-utils/mmc-utils.hash
+++ b/package/mmc-utils/mmc-utils.hash
@@ -1,3 +1,2 @@
-# Locally computed
-sha256  9ac9718343ffa36ab9ef192728e60cce6504febe29d43fb8003c2e2ef5a7c7d7  mmc-utils-613495ecaca97a19fa7f8f3ea23306472b36453c-br1.tar.gz
+sha256  9ac9718343ffa36ab9ef192728e60cce6504febe29d43fb8003c2e2ef5a7c7d7  mmc-utils-613495ecaca97a19fa7f8f3ea23306472b36453c-br2.tar.gz
 sha256  4207d81122a02555f78c5a11b61c83a331ee03dc933e1ef9dd932ef9b434d12d  README
diff --git a/package/netsurf-buildsystem/netsurf-buildsystem.hash b/package/netsurf-buildsystem/netsurf-buildsystem.hash
index dfdc999829..baf3bc4624 100644
--- a/package/netsurf-buildsystem/netsurf-buildsystem.hash
+++ b/package/netsurf-buildsystem/netsurf-buildsystem.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  150a3a45c3f433a35451506b316a35c14630112fc557f9e1f02c9e08b50e0cce  netsurf-buildsystem-7574b41345968b5f7e9ca5875faccb1478ce0555-br1.tar.gz
+sha256  150a3a45c3f433a35451506b316a35c14630112fc557f9e1f02c9e08b50e0cce  netsurf-buildsystem-7574b41345968b5f7e9ca5875faccb1478ce0555-br2.tar.gz
 sha256  b2ddc1d607332423f6cf415b2ac619a1c03dd565facdc39a571282a520929a65  llvm/LICENSE.TXT
diff --git a/package/odhcp6c/odhcp6c.hash b/package/odhcp6c/odhcp6c.hash
index 84d1fc4527..b1c7765eca 100644
--- a/package/odhcp6c/odhcp6c.hash
+++ b/package/odhcp6c/odhcp6c.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7274a304016838483e2da48193309e5f84ca0a8a407647033283d1249eebe986  odhcp6c-53f07e90b7f1da6977143a488dd5cb73a33b233b-br1.tar.gz
+sha256  7274a304016838483e2da48193309e5f84ca0a8a407647033283d1249eebe986  odhcp6c-53f07e90b7f1da6977143a488dd5cb73a33b233b-br2.tar.gz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/ogre/ogre.hash b/package/ogre/ogre.hash
index 0028a4b97c..3a067f3da3 100644
--- a/package/ogre/ogre.hash
+++ b/package/ogre/ogre.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256  805b97aacd2070f19394fe92442307a7ba6036ad95c511f551817d694c8dea37  ogre-v1.12.12-br1.tar.gz
+sha256  805b97aacd2070f19394fe92442307a7ba6036ad95c511f551817d694c8dea37  ogre-v1.12.12-br2.tar.gz
 sha256  82758e8d1d72139904b9b7472ef0f6544413d2871b58540307fdcc20e473e5f8  LICENSE
diff --git a/package/open62541/open62541.hash b/package/open62541/open62541.hash
index 2e650a1257..43cd4ab538 100644
--- a/package/open62541/open62541.hash
+++ b/package/open62541/open62541.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  372fd6b2d78823d3f9e8279f78fb43b6af2501603675450a194d2bac65925ca1  open62541-v1.3.6-br1.tar.gz
+sha256  372fd6b2d78823d3f9e8279f78fb43b6af2501603675450a194d2bac65925ca1  open62541-v1.3.6-br2.tar.gz
 sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  LICENSE
diff --git a/package/opkg-utils/opkg-utils.hash b/package/opkg-utils/opkg-utils.hash
index 29671f9609..86fb107a7c 100644
--- a/package/opkg-utils/opkg-utils.hash
+++ b/package/opkg-utils/opkg-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e0fcaab51bff2149bd6560fb4238319d502dd99b581f66763d702e75c224736d  opkg-utils-0.4.5-br1.tar.gz
+sha256  e0fcaab51bff2149bd6560fb4238319d502dd99b581f66763d702e75c224736d  opkg-utils-0.4.5-br2.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/pcm-tools/pcm-tools.hash b/package/pcm-tools/pcm-tools.hash
index cfa3faeff7..5be5885d41 100644
--- a/package/pcm-tools/pcm-tools.hash
+++ b/package/pcm-tools/pcm-tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  29416f83d1de95594d225f63af34f8f074ee4822010ce2e05b1fabc66933472a  pcm-tools-93fc9193a70e2f1f054be554c48f4a4791be5032-br1.tar.gz
+sha256  f3eae080e1bdc1f6264709534dff4881fb94d0d78c17ba4c8d0dbd816f6b17b9  pcm-tools-93fc9193a70e2f1f054be554c48f4a4791be5032-br2.tar.gz
 sha256  0f476c77009f982dcc4bdff41e692ddd456a9862908e99f2ae3d57296decc649  LICENSE
diff --git a/package/pcm-tools/pcm-tools.mk b/package/pcm-tools/pcm-tools.mk
index c530492696..30a8fbf0b6 100644
--- a/package/pcm-tools/pcm-tools.mk
+++ b/package/pcm-tools/pcm-tools.mk
@@ -17,14 +17,6 @@ PCM_TOOLS_EXE_FILES = \
 	pcm-core pcm-iio pcm-lspci pcm-memory pcm-msr pcm-numa \
 	pcm-pcicfg pcm-pcie pcm-power pcm-sensor pcm-tsx pcm
 
-# version.h contains git attributes; replace them with the previously-known
-# value.
-define PCM_TOOLS_FIXUP_VERSION_H
-	$(SED) 's/\$$Format:%ci ID=%h\$$/2021-10-25 16:07:54 +0200 ID=93fc9193/' \
-		$(@D)/version.h
-endef
-PCM_TOOLS_POST_EXTRACT_HOOKS += PCM_TOOLS_FIXUP_VERSION_H
-
 define PCM_TOOLS_BUILD_CMDS
 	touch $(@D)/daemon-binaries
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
diff --git a/package/piglit/piglit.hash b/package/piglit/piglit.hash
index 923569a6f3..e47d32aedf 100644
--- a/package/piglit/piglit.hash
+++ b/package/piglit/piglit.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  ec2a80c49f10761980334f1591be54ee6f365165d7ac637270b4ca15a12ad674  piglit-2affee53f3ad7a96f5b397a2b6d6408af8a374b0-br1.tar.gz
+sha256  ec2a80c49f10761980334f1591be54ee6f365165d7ac637270b4ca15a12ad674  piglit-2affee53f3ad7a96f5b397a2b6d6408af8a374b0-br2.tar.gz
 sha256  dcc398730859aee7cc1d6aa57f526f8d181b47bb3a49830e85b5723d5bc2c3bc  COPYING
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  licences/GPL-2
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  licences/GPL-3
diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index e5cd83d859..b134c3d4eb 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -20,7 +20,7 @@ export LOCALFILES := $(call qstrip,$(BR2_LOCALFILES))
 
 # Version of the format of the archives we generate in the corresponding
 # download backend:
-BR_FMT_VERSION_git = -br1
+BR_FMT_VERSION_git = -br2
 BR_FMT_VERSION_svn = -br3
 
 DL_WRAPPER = support/download/dl-wrapper
diff --git a/package/prelink-cross/prelink-cross.hash b/package/prelink-cross/prelink-cross.hash
index 5bd2c61082..db90e868c9 100644
--- a/package/prelink-cross/prelink-cross.hash
+++ b/package/prelink-cross/prelink-cross.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d7c95e81993edead813accf417f6d5b05bcc84eea9ee2d711b9505ffb4f2865b  prelink-cross-a853a5d715d84eec93aa68e8f2df26b7d860f5b2-br1.tar.gz
+sha256  d7c95e81993edead813accf417f6d5b05bcc84eea9ee2d711b9505ffb4f2865b  prelink-cross-a853a5d715d84eec93aa68e8f2df26b7d860f5b2-br2.tar.gz
 sha256  b8a2f73f743dc1a51aff23f1aacbca4b868564db52496fa3c0caba755bfd1eaf  COPYING
diff --git a/package/psplash/psplash.hash b/package/psplash/psplash.hash
index 77090d08f6..5ac65cf347 100644
--- a/package/psplash/psplash.hash
+++ b/package/psplash/psplash.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c9f71754f4606e46212a4851d6c1145e4ae8752fd11a2b40e825f04bf79b22ec  psplash-44afb7506d43cca15582b4c5b90ba5580344d75d-br1.tar.gz
+sha256  c9f71754f4606e46212a4851d6c1145e4ae8752fd11a2b40e825f04bf79b22ec  psplash-44afb7506d43cca15582b4c5b90ba5580344d75d-br2.tar.gz
 sha256  f9c375a1be4a41f7b70301dd83c91cb89e41567478859b77eef375a52d782505  COPYING
diff --git a/package/qt-webkit-kiosk/qt-webkit-kiosk.hash b/package/qt-webkit-kiosk/qt-webkit-kiosk.hash
index 8e983f8e21..30653e9dc7 100644
--- a/package/qt-webkit-kiosk/qt-webkit-kiosk.hash
+++ b/package/qt-webkit-kiosk/qt-webkit-kiosk.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5c3992cc35260d165f9a16094bd224529f012f799e0bc21317a39480cedb1fd2  qt-webkit-kiosk-a7720e50f2bd70aad99e0b465f5c4a57aca48127-br1.tar.gz
+sha256  5c3992cc35260d165f9a16094bd224529f012f799e0bc21317a39480cedb1fd2  qt-webkit-kiosk-a7720e50f2bd70aad99e0b465f5c4a57aca48127-br2.tar.gz
 sha256  de59ec6c939f4c4def79c0a996b3bd5626895fcbd1ae108e7bddb1dac8218381  doc/lgpl.html
diff --git a/package/qt5/qt5coap/qt5coap.hash b/package/qt5/qt5coap/qt5coap.hash
index 9c0258f45b..f695b45c69 100644
--- a/package/qt5/qt5coap/qt5coap.hash
+++ b/package/qt5/qt5coap/qt5coap.hash
@@ -1,5 +1,5 @@
 # Hash locally calculated
-sha256  0ad05a2305437b9b96a4322bfadaa26f043ba16845d5303e53c00c82b37b243f  qt5coap-5.15.2-br1.tar.gz
+sha256  0ad05a2305437b9b96a4322bfadaa26f043ba16845d5303e53c00c82b37b243f  qt5coap-5.15.2-br2.tar.gz
 
 # Hashes for license files:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
diff --git a/package/qt5/qt5knx/qt5knx.hash b/package/qt5/qt5knx/qt5knx.hash
index 031fad5e92..7c78b50615 100644
--- a/package/qt5/qt5knx/qt5knx.hash
+++ b/package/qt5/qt5knx/qt5knx.hash
@@ -1,5 +1,5 @@
 # Hash locally calculated
-sha256  932ea512aa8ceb514ac40ce1fcbebe86c306caff1a0b11320d9a36fd84bae10c  qt5knx-5.15.2-br1.tar.gz
+sha256  df517ec632aca8d95150c73f4c43d1d396452b40d434b5f1969f266f127e1d70  qt5knx-5.15.2-br2.tar.gz
 
 # Hashes for license files:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
diff --git a/package/qt5/qt5location/qt5location.hash b/package/qt5/qt5location/qt5location.hash
index f73053f388..bdd3d6c49f 100644
--- a/package/qt5/qt5location/qt5location.hash
+++ b/package/qt5/qt5location/qt5location.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  90b57a335d8c7311a86865a56b2b9cd944a8a1cafa6a7499de5b35a105c5b247  qt5location-ebdf5b38da6e3fe0a183702bcca395c589c459ed-br1.tar.gz
+sha256  6c4bb905d6e3e43ae4f8e46b0f2ea8dfe1fc27e97399fa69620a3e1cc7dd6555  qt5location-ebdf5b38da6e3fe0a183702bcca395c589c459ed-br2.tar.gz
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5mqtt/qt5mqtt.hash b/package/qt5/qt5mqtt/qt5mqtt.hash
index f4ea6b7015..cd4272fb17 100644
--- a/package/qt5/qt5mqtt/qt5mqtt.hash
+++ b/package/qt5/qt5mqtt/qt5mqtt.hash
@@ -1,5 +1,5 @@
 # Hash locally calculated
-sha256  38f2bc1bcbdf76d30d78c86426c85f62a6c2091c997cad4b087039f795b2b406  qt5mqtt-5.15.2-br1.tar.gz
+sha256  eb7b75ab3f8fa6f512c3e2ba05e1356d15bc850977197ebbd3d360528b05281c  qt5mqtt-5.15.2-br2.tar.gz
 
 # Hashes for license files:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
diff --git a/package/qt5/qt5opcua/qt5opcua.hash b/package/qt5/qt5opcua/qt5opcua.hash
index e55fb17743..dbc749eaf6 100644
--- a/package/qt5/qt5opcua/qt5opcua.hash
+++ b/package/qt5/qt5opcua/qt5opcua.hash
@@ -1,5 +1,5 @@
 # Hash locally calculated
-sha256  562171c6dfd6f4f072316ddb6d7c5bcc8907a68ba31005cb8c20ed75beff34fb  qt5opcua-5.15.2-br1.tar.gz
+sha256  61a39fe7336709a9b2068e250713c2eb66fd3460b2c6e5f7bfc569b15b9cacb9  qt5opcua-5.15.2-br2.tar.gz
 
 # Hashes for license files:
 sha256  d93cc415382f0013088fa276d9cf82373badf244c78220a926f15ee46f0fe3c4  LICENSE-CC0
diff --git a/package/qt5/qt5webengine-chromium-catapult/qt5webengine-chromium-catapult.hash b/package/qt5/qt5webengine-chromium-catapult/qt5webengine-chromium-catapult.hash
index 8190a6dd5d..a99c8bbc5b 100644
--- a/package/qt5/qt5webengine-chromium-catapult/qt5webengine-chromium-catapult.hash
+++ b/package/qt5/qt5webengine-chromium-catapult/qt5webengine-chromium-catapult.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  66b8593e665c4236f7b1c487548d41d3826eddbf486ff985dbdfd01cddcaa1a8  qt5webengine-chromium-catapult-5eedfe23148a234211ba477f76fc2ea2e8529189-br1.tar.gz
+sha256  66b8593e665c4236f7b1c487548d41d3826eddbf486ff985dbdfd01cddcaa1a8  qt5webengine-chromium-catapult-5eedfe23148a234211ba477f76fc2ea2e8529189-br2.tar.gz
 sha256  f0df289ba9d03d857ad1c2f5918861376b1510b71588ffc60eff5c7a7bfedb09  LICENSE
diff --git a/package/rockchip-rkbin/rockchip-rkbin.hash b/package/rockchip-rkbin/rockchip-rkbin.hash
index a4b6cbeaa7..f9f3dbafd6 100644
--- a/package/rockchip-rkbin/rockchip-rkbin.hash
+++ b/package/rockchip-rkbin/rockchip-rkbin.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  bd8d19ace202ff26d1c0b4d7744cd467cd0093801dc674dde57290159eedee2b  rockchip-rkbin-b4558da0860ca48bf1a571dd33ccba580b9abe23-br1.tar.gz
+sha256  bd8d19ace202ff26d1c0b4d7744cd467cd0093801dc674dde57290159eedee2b  rockchip-rkbin-b4558da0860ca48bf1a571dd33ccba580b9abe23-br2.tar.gz
 sha256  1f2e25ae65f3af774e6f141f84253d6a05d489fb0b88b311220d70471c023c9c  LICENSE
diff --git a/package/rtc-tools/rtc-tools.hash b/package/rtc-tools/rtc-tools.hash
index a14dcb3e6e..237674e8ae 100644
--- a/package/rtc-tools/rtc-tools.hash
+++ b/package/rtc-tools/rtc-tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8614e140b04da3dbb787760bdb0fe2ac5fe8907f5d3e9a74c6713e3d17fc3650  rtc-tools-33ef4aa1c92b0c92a351284d93d1ac5570de9cc7-br1.tar.gz
+sha256  8614e140b04da3dbb787760bdb0fe2ac5fe8907f5d3e9a74c6713e3d17fc3650  rtc-tools-33ef4aa1c92b0c92a351284d93d1ac5570de9cc7-br2.tar.gz
 sha256  7ae50a5344af14d6231aff6814632a220b3127da4099aea2c6070fd79c407c1a  COPYING
diff --git a/package/rtmpdump/rtmpdump.hash b/package/rtmpdump/rtmpdump.hash
index 54dbbc35d7..557f2e1130 100644
--- a/package/rtmpdump/rtmpdump.hash
+++ b/package/rtmpdump/rtmpdump.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e362202d94b92632b17abc7ef909afc56de06a2cb40e308edfad901d799bbd9c  rtmpdump-c5f04a58fc2aeea6296ca7c44ee4734c18401aa3-br1.tar.gz
+sha256  e362202d94b92632b17abc7ef909afc56de06a2cb40e308edfad901d799bbd9c  rtmpdump-c5f04a58fc2aeea6296ca7c44ee4734c18401aa3-br2.tar.gz
 sha256  03fe7ca91cc28e99b4003d5b3bd4ce3b084d4c475fdf9975cf0e7fdf4dc739cd  librtmp/COPYING
diff --git a/package/signal-estimator/signal-estimator.hash b/package/signal-estimator/signal-estimator.hash
index c10aa16d50..3854c0866c 100644
--- a/package/signal-estimator/signal-estimator.hash
+++ b/package/signal-estimator/signal-estimator.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6256b881bd9285fdcf133628cf6dd6b0e2758c08bada231e44b2684a3cf7898f  signal-estimator-v0.0.4-br1.tar.gz
+sha256  6256b881bd9285fdcf133628cf6dd6b0e2758c08bada231e44b2684a3cf7898f  signal-estimator-v0.0.4-br2.tar.gz
 sha256  e836fc784cb6ed2d160f1c1ecdf1303ed57436a86f66f97e5406a1b79e6db55e  LICENSE
diff --git a/package/sox/sox.hash b/package/sox/sox.hash
index d2006e0291..91b0f61a1c 100644
--- a/package/sox/sox.hash
+++ b/package/sox/sox.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  3d06ba8fc39ac92f16da73593be48afe0a704fe4dc4f6eca2e5137ef77cd5115  sox-7524160b29a476f7e87bc14fddf12d349f9a3c5e-br1.tar.gz
+sha256  3d06ba8fc39ac92f16da73593be48afe0a704fe4dc4f6eca2e5137ef77cd5115  sox-7524160b29a476f7e87bc14fddf12d349f9a3c5e-br2.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  LICENSE.LGPL
diff --git a/package/tftpd/tftpd.hash b/package/tftpd/tftpd.hash
index 3cccb0f20e..fa90c81efe 100644
--- a/package/tftpd/tftpd.hash
+++ b/package/tftpd/tftpd.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  c86520c30dab0b6bcbae021ab26d2ac63227696596d37a9b02aa3e56ec5c2e77  tftpd-b2b34cecc8cbc18ff6f1fc00bda6ae6e9011e6c7-br1.tar.gz
+sha256  c86520c30dab0b6bcbae021ab26d2ac63227696596d37a9b02aa3e56ec5c2e77  tftpd-b2b34cecc8cbc18ff6f1fc00bda6ae6e9011e6c7-br2.tar.gz
 
 # Hash for license file
 sha256  67754ebd8f265571d3226ac97e521b1bd6fd8a61363ecd4ab7806a6f90efab92  tftpd/tftpd.c
diff --git a/package/ti-sgx-demos/ti-sgx-demos.hash b/package/ti-sgx-demos/ti-sgx-demos.hash
index e5631c9630..1ac219e1a3 100644
--- a/package/ti-sgx-demos/ti-sgx-demos.hash
+++ b/package/ti-sgx-demos/ti-sgx-demos.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  5564741d7669b6303e52f4c0d1eaa04aa2633c0c6ad8ff7c5295b7ef3764c719  ti-sgx-demos-bb8b74cdd1323e76697b3eb2258f863b15fee287-br1.tar.gz
+sha256  5564741d7669b6303e52f4c0d1eaa04aa2633c0c6ad8ff7c5295b7ef3764c719  ti-sgx-demos-bb8b74cdd1323e76697b3eb2258f863b15fee287-br2.tar.gz
 sha256  052741ea66a4a48e0ef8cab259d2dc136e7cf52fda694af8d1fe9bd28abe333b  LegalNotice.txt
diff --git a/package/ti-sgx-km/ti-sgx-km.hash b/package/ti-sgx-km/ti-sgx-km.hash
index c7030b2222..b0b8ba0c6b 100644
--- a/package/ti-sgx-km/ti-sgx-km.hash
+++ b/package/ti-sgx-km/ti-sgx-km.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  213b4ff3893c74f026a06404dca185216809d062e54d17c2302d56ff7ede5181  ti-sgx-km-cf7f48cb30abfd5df7a60c9bf4bbb1dde0d496d9-br1.tar.gz
+sha256  213b4ff3893c74f026a06404dca185216809d062e54d17c2302d56ff7ede5181  ti-sgx-km-cf7f48cb30abfd5df7a60c9bf4bbb1dde0d496d9-br2.tar.gz
 sha256  e9d660547691b2a9232850fd43aac16d40fd063023166fd27162020c30dc2bd4  eurasia_km/GPL-COPYING
diff --git a/package/ti-sgx-um/ti-sgx-um.hash b/package/ti-sgx-um/ti-sgx-um.hash
index 109b2e9e56..4623f541ae 100644
--- a/package/ti-sgx-um/ti-sgx-um.hash
+++ b/package/ti-sgx-um/ti-sgx-um.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  e52c743194516fcc92d570bc5a26dfaa26d18c13d92d41640019f544ef25be3a  ti-sgx-um-909e237baf47d0bde006ff25552f5403fd7e359d-br1.tar.gz
+sha256  e52c743194516fcc92d570bc5a26dfaa26d18c13d92d41640019f544ef25be3a  ti-sgx-um-909e237baf47d0bde006ff25552f5403fd7e359d-br2.tar.gz
 sha256  368c306246c9130b5c90a6fef2f80085f70b6225b3f552654a288c0f39fc1531  TI-Linux-Graphics-DDK-UM-Manifest.doc
diff --git a/package/tl-expected/tl-expected.hash b/package/tl-expected/tl-expected.hash
index e5c9cc2a3e..efb63cf41a 100644
--- a/package/tl-expected/tl-expected.hash
+++ b/package/tl-expected/tl-expected.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2611769546cedcaef233ef587e71420d1f079a794eb7bb19b888dedf991ace7c  tl-expected-v1.0.0-br1.tar.gz
+sha256  2611769546cedcaef233ef587e71420d1f079a794eb7bb19b888dedf991ace7c  tl-expected-v1.0.0-br2.tar.gz
 sha256  a2010f343487d3f7618affe54f789f5487602331c0a8d03f49e9a7c547cf0499  COPYING
diff --git a/package/tremor/tremor.hash b/package/tremor/tremor.hash
index 89d8bde84e..3c15dd75a5 100644
--- a/package/tremor/tremor.hash
+++ b/package/tremor/tremor.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a387ebb4536ca98034eb91855616b971b0a85575943699b2a6d0be79b4a9f6a9  tremor-7c30a66346199f3f09017a09567c6c8a3a0eedc8-br1.tar.gz
+sha256  a387ebb4536ca98034eb91855616b971b0a85575943699b2a6d0be79b4a9f6a9  tremor-7c30a66346199f3f09017a09567c6c8a3a0eedc8-br2.tar.gz
 sha256  d2ab5758336489da61c12cc5bb757da5339c4ae9001f9bb0562b4370249af814  COPYING
diff --git a/package/ubus/ubus.hash b/package/ubus/ubus.hash
index faa2e2626e..94c337ad72 100644
--- a/package/ubus/ubus.hash
+++ b/package/ubus/ubus.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e3022aa3cf6c38a4d3c0d798d9a9c7069ada063a0a5fe6894b466b71b17ce9cc  ubus-f787c97b34894a38b15599886cacbca01271684f-br1.tar.gz
+sha256  e3022aa3cf6c38a4d3c0d798d9a9c7069ada063a0a5fe6894b466b71b17ce9cc  ubus-f787c97b34894a38b15599886cacbca01271684f-br2.tar.gz
 sha256  a3caa6c0e90c87b7c97c2ac3d0c0d416082ef777215faec2e9b24ea6e68f6988  ubusd_acl.h
diff --git a/package/uclibc-ng-test/uclibc-ng-test.hash b/package/uclibc-ng-test/uclibc-ng-test.hash
index c4db6ebf83..b1af4406c5 100644
--- a/package/uclibc-ng-test/uclibc-ng-test.hash
+++ b/package/uclibc-ng-test/uclibc-ng-test.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f261229c43c026e39178aca48f4f3caacd0bbe373ccd06d27954e7a5fa768fe8  uclibc-ng-test-0f303c63fab7f4038515ced6f2659242cf60ac19-br1.tar.gz
+sha256  f261229c43c026e39178aca48f4f3caacd0bbe373ccd06d27954e7a5fa768fe8  uclibc-ng-test-0f303c63fab7f4038515ced6f2659242cf60ac19-br2.tar.gz
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING.LIB
diff --git a/package/uemacs/uemacs.hash b/package/uemacs/uemacs.hash
index c8dd620b8e..157dce9fd7 100644
--- a/package/uemacs/uemacs.hash
+++ b/package/uemacs/uemacs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  96e30247365bb27bd74c550b637f5b2ffd2978379872a32a840f6667cec5fa2a  uemacs-1cdcf9df88144049750116e36fe20c8c39fa2517-br1.tar.gz
+sha256  96e30247365bb27bd74c550b637f5b2ffd2978379872a32a840f6667cec5fa2a  uemacs-1cdcf9df88144049750116e36fe20c8c39fa2517-br2.tar.gz
 sha256  6e2a4cf41ec8d4379c154923349733bc0d3935c6fa72c4337cf1bc137b98b90a  README
diff --git a/package/uhttpd/uhttpd.hash b/package/uhttpd/uhttpd.hash
index 1e37b2b251..07ae6f29ec 100644
--- a/package/uhttpd/uhttpd.hash
+++ b/package/uhttpd/uhttpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9ae10aaf6642b214e0a4ca47d6fd9693ac4b88d61e7d6446f0f0feb3a28ca510  uhttpd-15346de8d3ba422002496526ee24c62a3601ab8c-br1.tar.gz
+sha256  9ae10aaf6642b214e0a4ca47d6fd9693ac4b88d61e7d6446f0f0feb3a28ca510  uhttpd-15346de8d3ba422002496526ee24c62a3601ab8c-br2.tar.gz
 sha256  ce1803f83f776cc88661e303fede0e5ff52faf1d9f74508fadbecf7705b4c84d  uhttpd.h
diff --git a/package/uqmi/uqmi.hash b/package/uqmi/uqmi.hash
index 2db5d330e2..383893a152 100644
--- a/package/uqmi/uqmi.hash
+++ b/package/uqmi/uqmi.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  aae6a72791da8f58012303ba3bfeeb613e74597cbebfb9e7c2d9125e6f256799  uqmi-0a19b5b77140465c29e2afa7d611fe93abc9672f-br1.tar.gz
+sha256  aae6a72791da8f58012303ba3bfeeb613e74597cbebfb9e7c2d9125e6f256799  uqmi-0a19b5b77140465c29e2afa7d611fe93abc9672f-br2.tar.gz
 sha256  a69bf44dbff15d727578d2069a654d60e9034c5e2cc3e199a012e72afef6c259  main.c
diff --git a/package/ustream-ssl/ustream-ssl.hash b/package/ustream-ssl/ustream-ssl.hash
index 0c51a977cc..83f74017f5 100644
--- a/package/ustream-ssl/ustream-ssl.hash
+++ b/package/ustream-ssl/ustream-ssl.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e77e579b718085c1447339e0fcd5385b85a783d5c92544e48a6b37b1695a7f39  ustream-ssl-68d09243b6fd4473004b27ff6483352e76e6af1a-br1.tar.gz
+sha256  e77e579b718085c1447339e0fcd5385b85a783d5c92544e48a6b37b1695a7f39  ustream-ssl-68d09243b6fd4473004b27ff6483352e76e6af1a-br2.tar.gz
 sha256  cf28f0f01a57423983fa062eb0f04bb1a78891863cb58c53059c3d8cb52c1dd4  ustream-ssl.h
diff --git a/package/vboot-utils/vboot-utils.hash b/package/vboot-utils/vboot-utils.hash
index efef776caa..c2d71202d6 100644
--- a/package/vboot-utils/vboot-utils.hash
+++ b/package/vboot-utils/vboot-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9cdeaa2e4e1190c0cd200e1b07d394e5d24f57cc0efffdce861d5de934035bf7  vboot-utils-bbdd62f9b030db7ad8eef789aaf58a7ff9a25656-br1.tar.gz
+sha256  9cdeaa2e4e1190c0cd200e1b07d394e5d24f57cc0efffdce861d5de934035bf7  vboot-utils-bbdd62f9b030db7ad8eef789aaf58a7ff9a25656-br2.tar.gz
 sha256  cb9dc8e96aedf9120b6757a60387db10f3c1a8e3fd97bb9d0f11327be5a7ed4d  LICENSE
diff --git a/package/wilink-bt-firmware/wilink-bt-firmware.hash b/package/wilink-bt-firmware/wilink-bt-firmware.hash
index b0aa6b91e7..b7f5aae50f 100644
--- a/package/wilink-bt-firmware/wilink-bt-firmware.hash
+++ b/package/wilink-bt-firmware/wilink-bt-firmware.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  209e1a46a945e7d4d031e22fb7bd1e3fc96fa3b99d069051ce257c5e2e0843f4  wilink-bt-firmware-43fca73c6a98c63fcb98f82af5bf83761778e005-br1.tar.gz
+sha256  209e1a46a945e7d4d031e22fb7bd1e3fc96fa3b99d069051ce257c5e2e0843f4  wilink-bt-firmware-43fca73c6a98c63fcb98f82af5bf83761778e005-br2.tar.gz
 sha256  21fd99ce784dc33b39ec0b4a383a9a9b8dafea261d73ad4548683c4eecd87f37  LICENSE
diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash
index 26002a7966..52af8a03e9 100644
--- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash
+++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  11f48628d2b1f495446c49df93de40569ced664c6fdbd5d3f8f7a863e4a1124c  xdriver_xf86-video-intel-31486f40f8e8f8923ca0799aea84b58799754564-br1.tar.gz
+sha256  11f48628d2b1f495446c49df93de40569ced664c6fdbd5d3f8f7a863e4a1124c  xdriver_xf86-video-intel-31486f40f8e8f8923ca0799aea84b58799754564-br2.tar.gz
 sha256  5808e89f4b9a30afc59f335bfa8219ecf2dacb89a81d16b322bc6d92993a48fa  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.hash b/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.hash
index d8cc080a32..8601acbef1 100644
--- a/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.hash
+++ b/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  037bebbe31bcca2b4f3adeefccd2a64a30e2924946a6c6646c5829f7362212ec  xdriver_xf86-video-openchrome-ab03de703b91c7e0fd3e4d1ca06ad5add7f077a1-br1.tar.gz
+sha256  037bebbe31bcca2b4f3adeefccd2a64a30e2924946a6c6646c5829f7362212ec  xdriver_xf86-video-openchrome-ab03de703b91c7e0fd3e4d1ca06ad5add7f077a1-br2.tar.gz
 sha256  1fde58bce5cff8c32e9a0a80bfa3e60213a2767954e30a367127d5afa2884ca2  COPYING
diff --git a/package/x264/x264.hash b/package/x264/x264.hash
index f8b26b6910..7fd8ffb2bc 100644
--- a/package/x264/x264.hash
+++ b/package/x264/x264.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e83cda2a69e72bc45bcb14aa7ca5e689cf0f67dc29fc6f1dce63abe2a428fc01  x264-baee400fa9ced6f5481a728138fed6e867b0ff7f-br1.tar.gz
+sha256  e83cda2a69e72bc45bcb14aa7ca5e689cf0f67dc29fc6f1dce63abe2a428fc01  x264-baee400fa9ced6f5481a728138fed6e867b0ff7f-br2.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/yavta/yavta.hash b/package/yavta/yavta.hash
index aa74284d89..1c3a675fe7 100644
--- a/package/yavta/yavta.hash
+++ b/package/yavta/yavta.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  108a0ceec862b56a3fbcb3ad28a8744d9800555ccb3e11bdd94c8cd4614296d5  yavta-583bedefc2a247d2cfd32d1b4a0abbe3e2015c70-br1.tar.gz
+sha256  108a0ceec862b56a3fbcb3ad28a8744d9800555ccb3e11bdd94c8cd4614296d5  yavta-583bedefc2a247d2cfd32d1b4a0abbe3e2015c70-br2.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING.GPL
diff --git a/support/download/git b/support/download/git
index 6654d98a00..ca34236432 100755
--- a/support/download/git
+++ b/support/download/git
@@ -226,6 +226,64 @@ if [ ${large_file} -eq 1 ]; then
     fi
 fi
 
+# Find files that are affected by the export-subst git-attribute.
+# There might be a .gitattribute at the root of the repository, as well
+# as in any arbitrary sub-directory, whether from the master repository
+# or a submodule.
+# "git check-attr -z" outputs results using \0 as separator for everything,
+# so there is no difference between field or records (but there is a
+# trailing \0):
+#   path_1\0attr_name\0attr_state\0path_2\0attr_name\0attr_state\0....
+mapfile -d "" files < <(
+    set -o pipefail  # Constrained to this sub-shell
+    find . -print0 \
+    |_plain_git check-attr --stdin -z export-subst \
+    |(i=0
+      while read -r -d "" val; do
+        case "$((i++%3))" in
+          (0)   path="${val}";;
+          (1)   ;; # Attribute name, always "export-subst", as requested
+          (2)
+            if [ "${val}" = "set" ]; then
+                printf "%s\0" "${path}"
+            fi;;
+        esac
+      done
+     )
+)
+# Replace format hints in those files. Always use the master repository
+# as the source of the git metadata, even for files found in submodules
+# as this is the most practical: there is no way to chdir() in (g)awk,
+# and recomputing GIT_DIR for each submodule would really be tedious...
+for f in "${files[@]}"; do
+    TZ=UTC \
+    LC_ALL=C \
+    GIT_DIR="${git_cache}/.git" \
+    awk -v GIT="${GIT}" '
+    {
+        l = $(0);
+        while( (i = match(l, /\$Format:[^\$]+\$/)) > 0 ) {
+            len = RLENGTH
+            printf("%s", substr(l, 1, i-1) );
+            fmt = substr(l, i, RLENGTH);
+            pretty = substr(fmt, 9, length(fmt)-9);
+            cmd = GIT " -c core.abbrev=40 log -s -n1 --pretty=format:'\''" pretty "'\''";
+            while ( (cmd | getline replace) > 0) {
+                printf("%s", replace);
+            }
+            ret = close(cmd);
+            if (ret != 0) {
+                printf("%s:%d: error while executing command \"%s\"\n", FILENAME, NR, cmd) > "/dev/stderr";
+                exit 1;
+            }
+            l = substr(l, i+len);
+        }
+        printf("%s\n", l);
+    }
+    ' "${f}" >"${f}.br-temp"
+    mv -f "${f}.br-temp" "${f}"
+done
+
 popd >/dev/null
 
 # Generate the archive.
diff --git a/support/testing/tests/download/br2-external/git-hash/package/bad/bad.hash b/support/testing/tests/download/br2-external/git-hash/package/bad/bad.hash
index b44b1f8255..f263c3cfa1 100644
--- a/support/testing/tests/download/br2-external/git-hash/package/bad/bad.hash
+++ b/support/testing/tests/download/br2-external/git-hash/package/bad/bad.hash
@@ -1 +1 @@
-sha256  0000000000000000000000000000000000000000000000000000000000000000  bad-a238b1dfcd825d47d834af3c5223417c8411d90d-br1.tar.gz
+sha256  0000000000000000000000000000000000000000000000000000000000000000  bad-a238b1dfcd825d47d834af3c5223417c8411d90d-br2.tar.gz
diff --git a/support/testing/tests/download/br2-external/git-hash/package/export-subst/export-subst.hash b/support/testing/tests/download/br2-external/git-hash/package/export-subst/export-subst.hash
new file mode 100644
index 0000000000..1926236993
--- /dev/null
+++ b/support/testing/tests/download/br2-external/git-hash/package/export-subst/export-subst.hash
@@ -0,0 +1 @@
+sha256  9d359f9ae9a9e65dd4ccfe7170aa6fda24e17dfc81238972957b4b7fe97168a7  export-subst-0fdb95cf4f3c5ed4003287649cabb33c5f843e26-br2.tar.gz
diff --git a/support/testing/tests/download/br2-external/git-hash/package/export-subst/export-subst.mk b/support/testing/tests/download/br2-external/git-hash/package/export-subst/export-subst.mk
new file mode 100644
index 0000000000..8d7d3ff970
--- /dev/null
+++ b/support/testing/tests/download/br2-external/git-hash/package/export-subst/export-subst.mk
@@ -0,0 +1,10 @@
+################################################################################
+#
+# export-subst
+#
+################################################################################
+
+EXPORT_SUBST_VERSION = 0fdb95cf4f3c5ed4003287649cabb33c5f843e26
+EXPORT_SUBST_SITE = git://localhost:$(GITREMOTE_PORT_NUMBER)/repo.git
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/download/br2-external/git-hash/package/good/good.hash b/support/testing/tests/download/br2-external/git-hash/package/good/good.hash
index fc3f60dafd..a4846ce4ef 100644
--- a/support/testing/tests/download/br2-external/git-hash/package/good/good.hash
+++ b/support/testing/tests/download/br2-external/git-hash/package/good/good.hash
@@ -1 +1 @@
-sha256  682ad1f39f258bfb35e26f213f3798f44bb8105bb55fad47bdc003113765b650  good-a238b1dfcd825d47d834af3c5223417c8411d90d-br1.tar.gz
+sha256  682ad1f39f258bfb35e26f213f3798f44bb8105bb55fad47bdc003113765b650  good-a238b1dfcd825d47d834af3c5223417c8411d90d-br2.tar.gz
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-branch-head/git-partial-sha1-branch-head.hash b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-branch-head/git-partial-sha1-branch-head.hash
index 26a6b358e2..d2169afa77 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-branch-head/git-partial-sha1-branch-head.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-branch-head/git-partial-sha1-branch-head.hash
@@ -1,2 +1,2 @@
-sha256  c27041b3e874beb0d0218158e7d6507ad1515b684de5eed5fabd0f7205e9718e  git-partial-sha1-branch-head-68c197d0879d485f4f6c-br1.tar.gz
+sha256  c27041b3e874beb0d0218158e7d6507ad1515b684de5eed5fabd0f7205e9718e  git-partial-sha1-branch-head-68c197d0879d485f4f6c-br2.tar.gz
 sha256  2c1126513651b0d346a4e6d1bb75ac1c9999217e18026302d27bea47b06c7fb2  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-branch/git-partial-sha1-reachable-by-branch.hash b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-branch/git-partial-sha1-reachable-by-branch.hash
index ab1edc73a8..ee6b0d3e18 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-branch/git-partial-sha1-reachable-by-branch.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-branch/git-partial-sha1-reachable-by-branch.hash
@@ -1,2 +1,2 @@
-sha256  1bbba9bf2788bd789ed8da4e47cabbf3467b1f706875b3f6b62df38e08fb9aba  git-partial-sha1-reachable-by-branch-317406308d9259e2231b-br1.tar.gz
+sha256  1bbba9bf2788bd789ed8da4e47cabbf3467b1f706875b3f6b62df38e08fb9aba  git-partial-sha1-reachable-by-branch-317406308d9259e2231b-br2.tar.gz
 sha256  fabbc65c442bacb5e69b7adfea6d14fbbfc1327134322efd12771dc84387d507  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-tag/git-partial-sha1-reachable-by-tag.hash b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-tag/git-partial-sha1-reachable-by-tag.hash
index e4a08342a9..1c4574afd1 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-tag/git-partial-sha1-reachable-by-tag.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-tag/git-partial-sha1-reachable-by-tag.hash
@@ -1,2 +1,2 @@
-sha256  52d223f3b2d625216c259e9ff949ca8818452a531ba61557dd91f3889c7919d7  git-partial-sha1-reachable-by-tag-46bae5b639e5a18e2cc4-br1.tar.gz
+sha256  52d223f3b2d625216c259e9ff949ca8818452a531ba61557dd91f3889c7919d7  git-partial-sha1-reachable-by-tag-46bae5b639e5a18e2cc4-br2.tar.gz
 sha256  2de87d77a2f226813f2d9bda906e970e4195605cdba6680443c0c04d89c532b6  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-itself/git-partial-sha1-tag-itself.hash b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-itself/git-partial-sha1-tag-itself.hash
index 6e83e637cf..e4228383fe 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-itself/git-partial-sha1-tag-itself.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-itself/git-partial-sha1-tag-itself.hash
@@ -1,2 +1,2 @@
-sha256  5cfc004b05f48b3fb419a5db4b7239223d670225fbbb91de2ae151c97910b36c  git-partial-sha1-tag-itself-2b0e0d98a49c97da6a61-br1.tar.gz
+sha256  5cfc004b05f48b3fb419a5db4b7239223d670225fbbb91de2ae151c97910b36c  git-partial-sha1-tag-itself-2b0e0d98a49c97da6a61-br2.tar.gz
 sha256  6de8772a0a58fa62e2b8c58d4dae55c9db7534ad3b3918ecc849a9008d58f081  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-points-to/git-partial-sha1-tag-points-to.hash b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-points-to/git-partial-sha1-tag-points-to.hash
index 7d538e72df..20f73a0b9f 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-points-to/git-partial-sha1-tag-points-to.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-points-to/git-partial-sha1-tag-points-to.hash
@@ -1,2 +1,2 @@
-sha256  0f40d7f39bf2e389cc2ce03c73cc0cc9ded1119378aaa68e2a2ef8597f6fd2f3  git-partial-sha1-tag-points-to-516c9c5f64ec66534d4d-br1.tar.gz
+sha256  0f40d7f39bf2e389cc2ce03c73cc0cc9ded1119378aaa68e2a2ef8597f6fd2f3  git-partial-sha1-tag-points-to-516c9c5f64ec66534d4d-br2.tar.gz
 sha256  6de8772a0a58fa62e2b8c58d4dae55c9db7534ad3b3918ecc849a9008d58f081  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-branch-head/git-sha1-branch-head.hash b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-branch-head/git-sha1-branch-head.hash
index 2fc4fbcb95..0ccb912a8a 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-branch-head/git-sha1-branch-head.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-branch-head/git-sha1-branch-head.hash
@@ -1,2 +1,2 @@
-sha256  3ab67c485ce1825abbbf5db1d90d94dfadc89b30bb740041cfc75fc04021e218  git-sha1-branch-head-68c197d0879d485f4f6cee85544722b79e68e59f-br1.tar.gz
+sha256  3ab67c485ce1825abbbf5db1d90d94dfadc89b30bb740041cfc75fc04021e218  git-sha1-branch-head-68c197d0879d485f4f6cee85544722b79e68e59f-br2.tar.gz
 sha256  2c1126513651b0d346a4e6d1bb75ac1c9999217e18026302d27bea47b06c7fb2  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-branch/git-sha1-reachable-by-branch.hash b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-branch/git-sha1-reachable-by-branch.hash
index 38f0578fd6..d1bae36311 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-branch/git-sha1-reachable-by-branch.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-branch/git-sha1-reachable-by-branch.hash
@@ -1,2 +1,2 @@
-sha256  a5936d6d6022ea101a6076864a2afa918ab2776764012c4be589027001044041  git-sha1-reachable-by-branch-317406308d9259e2231bd0d6ddad3de3832bce08-br1.tar.gz
+sha256  a5936d6d6022ea101a6076864a2afa918ab2776764012c4be589027001044041  git-sha1-reachable-by-branch-317406308d9259e2231bd0d6ddad3de3832bce08-br2.tar.gz
 sha256  fabbc65c442bacb5e69b7adfea6d14fbbfc1327134322efd12771dc84387d507  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-tag/git-sha1-reachable-by-tag.hash b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-tag/git-sha1-reachable-by-tag.hash
index bd4673b15f..bbf765d827 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-tag/git-sha1-reachable-by-tag.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-tag/git-sha1-reachable-by-tag.hash
@@ -1,2 +1,2 @@
-sha256  c203f968e358ca478d4c5344b1e4ae9bf13f9fb1120f2ed96a12154dd64195a6  git-sha1-reachable-by-tag-46bae5b639e5a18e2cc4dc508f080d566baeff59-br1.tar.gz
+sha256  c203f968e358ca478d4c5344b1e4ae9bf13f9fb1120f2ed96a12154dd64195a6  git-sha1-reachable-by-tag-46bae5b639e5a18e2cc4dc508f080d566baeff59-br2.tar.gz
 sha256  2de87d77a2f226813f2d9bda906e970e4195605cdba6680443c0c04d89c532b6  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-itself/git-sha1-tag-itself.hash b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-itself/git-sha1-tag-itself.hash
index c6862da75e..1efc311f5f 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-itself/git-sha1-tag-itself.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-itself/git-sha1-tag-itself.hash
@@ -1,2 +1,2 @@
-sha256  57f08e9f3914e79a10e7fb5d346b26fef2773dd22eed0d61fd755e79e62cee93  git-sha1-tag-itself-2b0e0d98a49c97da6a618ab36337e2058eb733a2-br1.tar.gz
+sha256  57f08e9f3914e79a10e7fb5d346b26fef2773dd22eed0d61fd755e79e62cee93  git-sha1-tag-itself-2b0e0d98a49c97da6a618ab36337e2058eb733a2-br2.tar.gz
 sha256  6de8772a0a58fa62e2b8c58d4dae55c9db7534ad3b3918ecc849a9008d58f081  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-points-to/git-sha1-tag-points-to.hash b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-points-to/git-sha1-tag-points-to.hash
index 188cb6897b..916b781a8f 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-points-to/git-sha1-tag-points-to.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-points-to/git-sha1-tag-points-to.hash
@@ -1,2 +1,2 @@
-sha256  1d8b565827137aa21ba37cde382aa291e33a135c697e38dcd31f14e195386327  git-sha1-tag-points-to-516c9c5f64ec66534d4d069c2e408d9ae4dce023-br1.tar.gz
+sha256  1d8b565827137aa21ba37cde382aa291e33a135c697e38dcd31f14e195386327  git-sha1-tag-points-to-516c9c5f64ec66534d4d069c2e408d9ae4dce023-br2.tar.gz
 sha256  6de8772a0a58fa62e2b8c58d4dae55c9db7534ad3b3918ecc849a9008d58f081  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-submodule-disabled/git-submodule-disabled.hash b/support/testing/tests/download/br2-external/git-refs/package/git-submodule-disabled/git-submodule-disabled.hash
index c0698e7b28..840798cafb 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-submodule-disabled/git-submodule-disabled.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-submodule-disabled/git-submodule-disabled.hash
@@ -1,2 +1,2 @@
-sha256  e8e0febc7f1408df22bce2d73d9a30081e03b45e152bc25effd14435ca8b3433  git-submodule-disabled-a9dbc1e23c45e8e1b88c0448763f54d714eb6f8f-br1.tar.gz
+sha256  e8e0febc7f1408df22bce2d73d9a30081e03b45e152bc25effd14435ca8b3433  git-submodule-disabled-a9dbc1e23c45e8e1b88c0448763f54d714eb6f8f-br2.tar.gz
 sha256  ba8b6ddc4726bfb6a05045ebfd8c43263c968ad1bc601bd46a25bc055008eddc  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-submodule-enabled/git-submodule-enabled.hash b/support/testing/tests/download/br2-external/git-refs/package/git-submodule-enabled/git-submodule-enabled.hash
index b95c51fe20..1fec35d099 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-submodule-enabled/git-submodule-enabled.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-submodule-enabled/git-submodule-enabled.hash
@@ -1 +1 @@
-sha256  176c32f10ad11f290b6251d701835450292ba281eb59c7fb57b244407a55ceab  git-submodule-enabled-a9dbc1e23c45e8e1b88c0448763f54d714eb6f8f-br1.tar.gz
+sha256  176c32f10ad11f290b6251d701835450292ba281eb59c7fb57b244407a55ceab  git-submodule-enabled-a9dbc1e23c45e8e1b88c0448763f54d714eb6f8f-br2.tar.gz
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-tag/git-tag.hash b/support/testing/tests/download/br2-external/git-refs/package/git-tag/git-tag.hash
index c7ebcf0e04..13a65d9437 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-tag/git-tag.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-tag/git-tag.hash
@@ -1,2 +1,2 @@
-sha256  c66b2366d8ccb1670951012334fe8d48de3358aef39b3da2912b339448fefcde  git-tag-mytag-br1.tar.gz
+sha256  c66b2366d8ccb1670951012334fe8d48de3358aef39b3da2912b339448fefcde  git-tag-mytag-br2.tar.gz
 sha256  6de8772a0a58fa62e2b8c58d4dae55c9db7534ad3b3918ecc849a9008d58f081  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-wrong-content/git-wrong-content.hash b/support/testing/tests/download/br2-external/git-refs/package/git-wrong-content/git-wrong-content.hash
index 453ffc0ab2..1b731298e0 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-wrong-content/git-wrong-content.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-wrong-content/git-wrong-content.hash
@@ -1,2 +1,2 @@
- sha256  4a230e667227310289438cd7d899276a0d45ca8778abfd043dfc0a10ed2c9085  git-wrong-content-a238b1dfcd825d47d834af3c5223417c8411d90d-br1.tar.gz
+ sha256  4a230e667227310289438cd7d899276a0d45ca8778abfd043dfc0a10ed2c9085  git-wrong-content-a238b1dfcd825d47d834af3c5223417c8411d90d-br2.tar.gz
  sha256  0000000000000000000000000000000000000000000000000000000000000000  file
diff --git a/support/testing/tests/download/git-remote/repo.git/objects/05/482df734b3715b849ef4a3147a9b1b1f8cca38 b/support/testing/tests/download/git-remote/repo.git/objects/05/482df734b3715b849ef4a3147a9b1b1f8cca38
new file mode 100644
index 0000000000000000000000000000000000000000..404bb1397cf8ec58f5e21a86e311e3b3884a55d5
GIT binary patch
literal 35
rcmb<m^geacKgeK9ipS|Qo~A(_Yc)>jYhBdU^VQOO$iz_nm{Sb^1FsEl

literal 0
HcmV?d00001

diff --git a/support/testing/tests/download/git-remote/repo.git/objects/0f/db95cf4f3c5ed4003287649cabb33c5f843e26 b/support/testing/tests/download/git-remote/repo.git/objects/0f/db95cf4f3c5ed4003287649cabb33c5f843e26
new file mode 100644
index 0000000000000000000000000000000000000000..3a4cc4ead6ce5a7e90a38e025896bc66da85a242
GIT binary patch
literal 197
zcmV;$06PD80j18pN(3<!Kw;}V#qDK=<mP`7v9YjFK`YBl?#(*jBugd>?%TWg1cK#h
z4qtBDwhqwJ-;B--j*`L!t!LwllOZ~Vg`-cw8%Ibno17#|aY~)*fP^|Mib|${mW-#M
zO)5HDL~WGM!6-#hl1S(A**birTH$eq=hwHV7r47zbKY8C>#Sl759Ml@OTP!@qOn#-
z6W~^&lp_B^2mfOs%KF84fWi9!{yw!nrv1F^Lx}hFSed3)%CuY#e^rVfqgY-S2z_Jg

literal 0
HcmV?d00001

diff --git a/support/testing/tests/download/git-remote/repo.git/objects/68/28f88dcb0e88b8cd738ad6044ce74d7a9a13c8 b/support/testing/tests/download/git-remote/repo.git/objects/68/28f88dcb0e88b8cd738ad6044ce74d7a9a13c8
new file mode 100644
index 0000000000000000000000000000000000000000..fdc4a37651a4ad195f8f106f3496d5df0b3bb6a5
GIT binary patch
literal 28
kcmb<m^geacKghr&DWLGQ{wZIbjX_@n9x^f5#jv&l0Hs3<3;+NC

literal 0
HcmV?d00001

diff --git a/support/testing/tests/download/git-remote/repo.git/objects/6d/a12b257e47f6089612fe97a8746d2d9c4ca0e0 b/support/testing/tests/download/git-remote/repo.git/objects/6d/a12b257e47f6089612fe97a8746d2d9c4ca0e0
new file mode 100644
index 0000000000000000000000000000000000000000..932f73602f5927ae985829cdd301b1ed40350137
GIT binary patch
literal 112
zcmV-$0FVE80V^p=O;s>7FlR6{FfcPQQP4}zEJ-XWDauSLElDkAVD-@bZnC*Bx@F#%
z#UfR+rR950SwK~$W#*(ZJf9QSKh0&bCYQsEj;oGV#dUqLSCQn67&0_|^q%JH*m1VF
S>l%yCbKk02!Y2Svbu0l+hckcx

literal 0
HcmV?d00001

diff --git a/support/testing/tests/download/git-remote/repo.git/refs/heads/master b/support/testing/tests/download/git-remote/repo.git/refs/heads/master
index b6bccc1c17..b6e37260fb 100644
--- a/support/testing/tests/download/git-remote/repo.git/refs/heads/master
+++ b/support/testing/tests/download/git-remote/repo.git/refs/heads/master
@@ -1 +1 @@
-a238b1dfcd825d47d834af3c5223417c8411d90d
+0fdb95cf4f3c5ed4003287649cabb33c5f843e26
diff --git a/support/testing/tests/download/test_git.py b/support/testing/tests/download/test_git.py
index ec5b8f3fdd..ba52e03ef5 100644
--- a/support/testing/tests/download/test_git.py
+++ b/support/testing/tests/download/test_git.py
@@ -56,6 +56,10 @@ class TestGitHash(GitTestBase):
             self.check_hash("bad")
         self.check_hash("good")
         self.check_hash("nohash")
+        self.check_hash("export-subst")
+        with open(os.path.join(self.builddir, "dl", "export-subst", "git", "file2"), "r") as f:
+            blob = f.read()
+        self.assertEqual(blob, "0fdb95cf4f3c5ed4003287649cabb33c5f843e26\n")
 
 
 class TestGitRefs(GitTestBase):
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

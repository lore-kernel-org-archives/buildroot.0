Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0FEFE92FCA
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 17:59:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4A11809EB;
	Mon, 29 Dec 2025 17:59:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vhC3Bvb6CGUI; Mon, 29 Dec 2025 17:59:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7030880B88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767031183;
	bh=8L+FWCBqYLpjNILrYw0MOnKQKzsOFsRZI817qN4UhRw=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Z/jTUgcz4KoNJ13Sz4LzON/cptETqfBvQy1p20MNK6jvWYhuhiTLXexk/200eo9g/
	 8vmKsfJRK9h/basLOHwq1z6xIFSuFPDT6BwLXJzyMnUB8AX0rfXOyVNGu6Wp+jxjKG
	 e9yEpCQhMSpmKDLd66gRHcozYmprXWVNXbzxttw+nZV/XG5nkByFjAaxMoqxZGDrVJ
	 w8aSu5UHD9xGbxnD6ERPR/xRnmGcko6pET5BAODVT/21Bg4x969qOuLfnUEojecH4S
	 ugyDZzSrf2RZ8FlsdAT+SmtxxD0QFCWM4QkucalJUbx3Df3lQ9ealyfry7LzDUeJG3
	 C/9I5gKDoG+RQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7030880B88;
	Mon, 29 Dec 2025 17:59:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F8A3D8
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 17:59:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6231B407CF
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 17:59:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PbFlvAFsnE9y for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 17:59:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EF5A44074C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF5A44074C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EF5A44074C
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 17:59:40 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1365EA4C1FDC;
 Mon, 29 Dec 2025 18:59:39 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53686)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vaHWs-000000002P5-0vNs;
 Mon, 29 Dec 2025 17:59:38 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Matt Flax <flatmax@flatmax.org>, Romain Naour <romain.naour@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>
Date: Mon, 29 Dec 2025 18:59:08 +0100
Message-ID: <20251229175938.3549882-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767031179;
 bh=013vjHEXzWBKIhC/KSTjE+kktk6FoN9a++ruWtcFAqo=;
 h=From:To:Cc:Subject:Date:From;
 b=fHn9uXQcDSzHauY0n9iv2kgcGQBo2pUlclK7lC089Z0bJQQn7nOiADYmqL8vnK4Qq
 Lxvb2922zM0iNle5+iDYxCm8ze4xTZYwT2azkFjumun9JlThVfAOVUaK3OvTGPbe4F
 u/NTCugTVOElzTvWmgtZHIxT3ieM4bkDk5ZQSJzqUO0J12lCrpP6P1fARBdr4QJ239
 NBtfyEOGh8Ho04bfv4lFxOCXYxFoOaHxaWirjE7+lHnxFOmjPpcsnafuvu42qyh6eb
 9hL+Vpv8Qpj3l0wXLcI12uz+XQ3+JzK+x501LywoDYXRRPL9okuZA+4dkJeYk/wDJx
 etGx+Lp8rt/AA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=fHn9uXQc
Subject: [Buildroot] [PATCH v8 00/29] Remove packages
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

Hi,

this series removes broken packages, see commit logs for individual
reasons.

Regards, Bernd

v8: added Config.in.legacy entry for libfreeimage
v7: rebased
    added removal of libfreeimage:
    https://lists.buildroot.org/pipermail/buildroot/2025-December/793070.html
v6: rebased
    added removal of OpenCV3:
    https://lists.buildroot.org/pipermail/buildroot/2025-December/792788.html
v5: rebased on top of series "support/testing: ddrescue: use dmsetup
    from lvm2": https://patchwork.ozlabs.org/project/buildroot/list/?series=486059
    (Julien)
v4: rebased
    added python-aioredis & cppdb, the latter suggested by Thomas:
    https://lists.buildroot.org/pipermail/buildroot/2025-December/792185.html
    added links to newly detected autobuilder failures
v3: added musepack & libcuefile as suggested by Thomas:
    https://lists.buildroot.org/pipermail/buildroot/2025-December/792023.html
    https://lists.buildroot.org/pipermail/buildroot/2025-December/792021.html


Bernd Kuhls (29):
  package/libnids: remove package
  package/dmraid: remove package
  package/libmhash: remove package
  package/connman-gtk: remove package
  package/hawktracer: remove package
  package/let-me-create: remove package
  package/libcgi: remove package
  package/libiqrf: remove package
  package/libuwsc: remove package
  package/alure: remove package
  package/openpowerlink: remove package
  package/opentracing-cpp: remove package
  package/qjson: remove package
  package/sconeserver: remove package
  package/taskd: remove package
  package/racehound: remove package
  package/musepack: remove package
  package/libcuefile: remove package
  package/python-aioredis: remove package
  package/cppdb: remove package
  package/ffmpeg: remove optional dependency to opencv3
  package/freeswitch: remove optional dependency to opencv3
  package/gtkiostream: remove optional dependency to opencv3
  package/mjpg-streamer: remove optional dependency to opencv3
  package/vlc: remove optional dependency to opencv3
  package/opencv3: remove package
  package/ogre: remove dependency to libfreeimage
  package/cegui: remove dependency to libfreeimage
  package/libfreeimage: remove package

 .checkpackageignore                           |  24 --
 Config.in.legacy                              | 140 +++++++
 DEVELOPERS                                    |  19 -
 package/Config.in                             |  22 --
 package/alure/Config.in                       |  56 ---
 package/alure/alure.hash                      |   3 -
 package/alure/alure.mk                        |  65 ----
 package/cegui/cegui.mk                        |   8 +-
 package/connman-gtk/Config.in                 |  22 --
 package/connman-gtk/connman-gtk.hash          |   3 -
 package/connman-gtk/connman-gtk.mk            |  17 -
 package/cppdb/0001-mysql-library-suffix.patch |  23 --
 package/cppdb/Config.in                       |  20 -
 package/cppdb/cppdb.hash                      |   6 -
 package/cppdb/cppdb.mk                        |  31 --
 .../0001-fix-compilation-under-musl.patch     |  47 ---
 package/dmraid/Config.in                      |  19 -
 package/dmraid/S20dmraid                      |  29 --
 package/dmraid/dmraid.hash                    |   5 -
 package/dmraid/dmraid.mk                      |  25 --
 package/ffmpeg/ffmpeg.mk                      |   5 +-
 package/freeswitch/Config.in                  |   6 +-
 package/freeswitch/freeswitch.mk              |   7 +-
 package/gstreamer1/gst1-plugins-bad/Config.in |   4 -
 .../gst1-plugins-bad/gst1-plugins-bad.mk      |   8 +-
 package/gtkiostream/gtkiostream.mk            |   4 -
 package/hawktracer/Config.in                  |  25 --
 package/hawktracer/hawktracer.hash            |   3 -
 package/hawktracer/hawktracer.mk              |  48 ---
 .../0001-fix-build-with-musl-C-library.patch  |  38 --
 package/let-me-create/Config.in               |  27 --
 package/let-me-create/let-me-create.hash      |   3 -
 package/let-me-create/let-me-create.mk        |  26 --
 ...-CMakeLists.txt-honour-BUILD_TESTING.patch |  44 ---
 package/libcgi/Config.in                      |  11 -
 package/libcgi/libcgi.hash                    |   8 -
 package/libcgi/libcgi.mk                      |  14 -
 package/libcuefile/0001-fix-static-link.patch |  25 --
 .../0002-libcuefile-fedora-c99.patch          |  27 --
 ...akeLists.txt-fix-compat-with-CMake-4.patch |  35 --
 package/libcuefile/Config.in                  |   6 -
 package/libcuefile/libcuefile.hash            |   7 -
 package/libcuefile/libcuefile.mk              |  25 --
 .../libfreeimage/0001-no-root-install.patch   |  20 -
 package/libfreeimage/0002-fix-cpuid-x86.patch |  67 ----
 .../libfreeimage/0003-fix-big-endian-os.patch |  64 ----
 .../0004-fixed-C-11-warnings.patch            |  94 -----
 .../0005-jxrlib-ftbfs-with-GCC-14.patch       |  40 --
 ...BFS-fix-for-function-prototype-error.patch |  29 --
 .../0007-CVE-2019-12211_2019-12213.patch      | 188 ----------
 .../libfreeimage/0008-CVE-2020-24292.patch    |  17 -
 .../libfreeimage/0009-CVE-2020-24293.patch    |  18 -
 .../libfreeimage/0010-CVE-2020-24295.patch    |  25 --
 .../libfreeimage/0011-CVE-2021-33367.patch    |  23 --
 .../libfreeimage/0012-CVE-2021-40263.patch    |  18 -
 .../libfreeimage/0013-CVE-2021-40266.patch    |  18 -
 .../libfreeimage/0014-CVE-2023-47995.patch    |  18 -
 .../libfreeimage/0015-CVE-2023-47997.patch    |  20 -
 package/libfreeimage/Config.in                |  18 -
 package/libfreeimage/libfreeimage.hash        |   9 -
 package/libfreeimage/libfreeimage.mk          |  62 ---
 ...tic-library-and-find-required-thread.patch |  45 ---
 .../libiqrf/0002-use-only-c-language.patch    |  29 --
 package/libiqrf/Config.in                     |  16 -
 package/libiqrf/libiqrf.hash                  |   3 -
 package/libiqrf/libiqrf.mk                    |  14 -
 package/libmhash/Config.in                    |   9 -
 package/libmhash/libmhash.hash                |   3 -
 package/libmhash/libmhash.mk                  |  14 -
 .../libnids/0001-libpcap-use-pkg-config.patch |  48 ---
 package/libnids/Config.in                     |  14 -
 package/libnids/libnids.hash                  |   3 -
 package/libnids/libnids.mk                    |  43 ---
 ...001-CMakeLists.txt-add-BUILD_EXAMPLE.patch |  34 --
 .../libuwsc/0002-fix-bad-indentation.patch    |  26 --
 .../0003-src-ssl.c-fix-wolfssl-build.patch    |  37 --
 package/libuwsc/Config.in                     |   8 -
 package/libuwsc/libuwsc.hash                  |   3 -
 package/libuwsc/libuwsc.mk                    |  53 ---
 package/mjpg-streamer/mjpg-streamer.mk        |  11 +-
 package/mpd/Config.in                         |   9 -
 package/mpd/mpd.mk                            |   8 +-
 package/musepack/0001-shared.patch            |  24 --
 ...andard-CMake-flag-to-drive-the-share.patch |  43 ---
 ...-include-fpu-control-with-glibc-only.patch |  26 --
 .../musepack/0004-missing-sys-select.patch    |  21 --
 .../musepack/0005-fix-build-with-gcc-10.patch |  30 --
 .../musepack/0006-incompatible-pointers.patch |  47 ---
 package/musepack/Config.in                    |  12 -
 package/musepack/musepack.hash                |   7 -
 package/musepack/musepack.mk                  |  16 -
 package/ogre/Config.in                        |   2 -
 package/ogre/ogre.mk                          |   1 -
 ...inimum-required-CMake-version-to-3.5.patch |  41 --
 package/opencv3/Config.in                     | 312 ---------------
 package/opencv3/opencv3.hash                  |   3 -
 package/opencv3/opencv3.mk                    | 354 ------------------
 package/opencv4/Config.in                     |   1 -
 ...-stack-libraries-to-lib-subdirectory.patch | 167 ---------
 ...002-cmake-install-oplk-headers-files.patch |  32 --
 .../0003-Add-top-level-CMakeLists.txt.patch   | 201 ----------
 package/openpowerlink/Config.in               | 129 -------
 package/openpowerlink/openpowerlink.hash      |   6 -
 package/openpowerlink/openpowerlink.mk        | 153 --------
 package/opentracing-cpp/Config.in             |  18 -
 package/opentracing-cpp/opentracing-cpp.hash  |   3 -
 package/opentracing-cpp/opentracing-cpp.mk    |  28 --
 package/python-aioredis/Config.in             |   8 -
 package/python-aioredis/python-aioredis.hash  |   5 -
 package/python-aioredis/python-aioredis.mk    |  14 -
 package/qjson/Config.in                       |   8 -
 package/qjson/qjson.hash                      |   3 -
 package/qjson/qjson.mk                        |  14 -
 ...ll-path-lib-instead-of-usr-lib-prefi.patch |  26 --
 package/racehound/Config.in                   |  35 --
 package/racehound/racehound.hash              |   3 -
 package/racehound/racehound.mk                |  27 --
 package/sconeserver/Config.in                 |  96 -----
 package/sconeserver/sconeserver.hash          |   3 -
 package/sconeserver/sconeserver.mk            |  93 -----
 ...makedefine-HAVE_GET_CURRENT_DIR_NAME.patch |  28 --
 ...rrect-variables-for-GnuTLS-detection.patch |  32 --
 ...eLists-use-pkg-config-uuid-detection.patch |  40 --
 package/taskd/Config.in                       |  18 -
 package/taskd/taskd.hash                      |   5 -
 package/taskd/taskd.mk                        |  13 -
 package/vlc/Config.in                         |   6 -
 package/vlc/vlc.mk                            |  16 +-
 128 files changed, 151 insertions(+), 4187 deletions(-)
 delete mode 100644 package/alure/Config.in
 delete mode 100644 package/alure/alure.hash
 delete mode 100644 package/alure/alure.mk
 delete mode 100644 package/connman-gtk/Config.in
 delete mode 100644 package/connman-gtk/connman-gtk.hash
 delete mode 100644 package/connman-gtk/connman-gtk.mk
 delete mode 100644 package/cppdb/0001-mysql-library-suffix.patch
 delete mode 100644 package/cppdb/Config.in
 delete mode 100644 package/cppdb/cppdb.hash
 delete mode 100644 package/cppdb/cppdb.mk
 delete mode 100644 package/dmraid/0001-fix-compilation-under-musl.patch
 delete mode 100644 package/dmraid/Config.in
 delete mode 100644 package/dmraid/S20dmraid
 delete mode 100644 package/dmraid/dmraid.hash
 delete mode 100644 package/dmraid/dmraid.mk
 delete mode 100644 package/hawktracer/Config.in
 delete mode 100644 package/hawktracer/hawktracer.hash
 delete mode 100644 package/hawktracer/hawktracer.mk
 delete mode 100644 package/let-me-create/0001-fix-build-with-musl-C-library.patch
 delete mode 100644 package/let-me-create/Config.in
 delete mode 100644 package/let-me-create/let-me-create.hash
 delete mode 100644 package/let-me-create/let-me-create.mk
 delete mode 100644 package/libcgi/0001-CMakeLists.txt-honour-BUILD_TESTING.patch
 delete mode 100644 package/libcgi/Config.in
 delete mode 100644 package/libcgi/libcgi.hash
 delete mode 100644 package/libcgi/libcgi.mk
 delete mode 100644 package/libcuefile/0001-fix-static-link.patch
 delete mode 100644 package/libcuefile/0002-libcuefile-fedora-c99.patch
 delete mode 100644 package/libcuefile/0003-CMakeLists.txt-fix-compat-with-CMake-4.patch
 delete mode 100644 package/libcuefile/Config.in
 delete mode 100644 package/libcuefile/libcuefile.hash
 delete mode 100644 package/libcuefile/libcuefile.mk
 delete mode 100644 package/libfreeimage/0001-no-root-install.patch
 delete mode 100644 package/libfreeimage/0002-fix-cpuid-x86.patch
 delete mode 100644 package/libfreeimage/0003-fix-big-endian-os.patch
 delete mode 100644 package/libfreeimage/0004-fixed-C-11-warnings.patch
 delete mode 100644 package/libfreeimage/0005-jxrlib-ftbfs-with-GCC-14.patch
 delete mode 100644 package/libfreeimage/0006-FTBFS-fix-for-function-prototype-error.patch
 delete mode 100644 package/libfreeimage/0007-CVE-2019-12211_2019-12213.patch
 delete mode 100644 package/libfreeimage/0008-CVE-2020-24292.patch
 delete mode 100644 package/libfreeimage/0009-CVE-2020-24293.patch
 delete mode 100644 package/libfreeimage/0010-CVE-2020-24295.patch
 delete mode 100644 package/libfreeimage/0011-CVE-2021-33367.patch
 delete mode 100644 package/libfreeimage/0012-CVE-2021-40263.patch
 delete mode 100644 package/libfreeimage/0013-CVE-2021-40266.patch
 delete mode 100644 package/libfreeimage/0014-CVE-2023-47995.patch
 delete mode 100644 package/libfreeimage/0015-CVE-2023-47997.patch
 delete mode 100644 package/libfreeimage/Config.in
 delete mode 100644 package/libfreeimage/libfreeimage.hash
 delete mode 100644 package/libfreeimage/libfreeimage.mk
 delete mode 100644 package/libiqrf/0001-cmake-handle-static-library-and-find-required-thread.patch
 delete mode 100644 package/libiqrf/0002-use-only-c-language.patch
 delete mode 100644 package/libiqrf/Config.in
 delete mode 100644 package/libiqrf/libiqrf.hash
 delete mode 100644 package/libiqrf/libiqrf.mk
 delete mode 100644 package/libmhash/Config.in
 delete mode 100644 package/libmhash/libmhash.hash
 delete mode 100644 package/libmhash/libmhash.mk
 delete mode 100644 package/libnids/0001-libpcap-use-pkg-config.patch
 delete mode 100644 package/libnids/Config.in
 delete mode 100644 package/libnids/libnids.hash
 delete mode 100644 package/libnids/libnids.mk
 delete mode 100644 package/libuwsc/0001-CMakeLists.txt-add-BUILD_EXAMPLE.patch
 delete mode 100644 package/libuwsc/0002-fix-bad-indentation.patch
 delete mode 100644 package/libuwsc/0003-src-ssl.c-fix-wolfssl-build.patch
 delete mode 100644 package/libuwsc/Config.in
 delete mode 100644 package/libuwsc/libuwsc.hash
 delete mode 100644 package/libuwsc/libuwsc.mk
 delete mode 100644 package/musepack/0001-shared.patch
 delete mode 100644 package/musepack/0002-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch
 delete mode 100644 package/musepack/0003-include-fpu-control-with-glibc-only.patch
 delete mode 100644 package/musepack/0004-missing-sys-select.patch
 delete mode 100644 package/musepack/0005-fix-build-with-gcc-10.patch
 delete mode 100644 package/musepack/0006-incompatible-pointers.patch
 delete mode 100644 package/musepack/Config.in
 delete mode 100644 package/musepack/musepack.hash
 delete mode 100644 package/musepack/musepack.mk
 delete mode 100644 package/opencv3/0001-cmake-set-minimum-required-CMake-version-to-3.5.patch
 delete mode 100644 package/opencv3/Config.in
 delete mode 100644 package/opencv3/opencv3.hash
 delete mode 100644 package/opencv3/opencv3.mk
 delete mode 100644 package/openpowerlink/0001-install-the-stack-libraries-to-lib-subdirectory.patch
 delete mode 100644 package/openpowerlink/0002-cmake-install-oplk-headers-files.patch
 delete mode 100644 package/openpowerlink/0003-Add-top-level-CMakeLists.txt.patch
 delete mode 100644 package/openpowerlink/Config.in
 delete mode 100644 package/openpowerlink/openpowerlink.hash
 delete mode 100644 package/openpowerlink/openpowerlink.mk
 delete mode 100644 package/opentracing-cpp/Config.in
 delete mode 100644 package/opentracing-cpp/opentracing-cpp.hash
 delete mode 100644 package/opentracing-cpp/opentracing-cpp.mk
 delete mode 100644 package/python-aioredis/Config.in
 delete mode 100644 package/python-aioredis/python-aioredis.hash
 delete mode 100644 package/python-aioredis/python-aioredis.mk
 delete mode 100644 package/qjson/Config.in
 delete mode 100644 package/qjson/qjson.hash
 delete mode 100644 package/qjson/qjson.mk
 delete mode 100644 package/racehound/0001-Fix-module-install-path-lib-instead-of-usr-lib-prefi.patch
 delete mode 100644 package/racehound/Config.in
 delete mode 100644 package/racehound/racehound.hash
 delete mode 100644 package/racehound/racehound.mk
 delete mode 100644 package/sconeserver/Config.in
 delete mode 100644 package/sconeserver/sconeserver.hash
 delete mode 100644 package/sconeserver/sconeserver.mk
 delete mode 100644 package/taskd/0001-Fix-missing-cmakedefine-HAVE_GET_CURRENT_DIR_NAME.patch
 delete mode 100644 package/taskd/0002-Use-correct-variables-for-GnuTLS-detection.patch
 delete mode 100644 package/taskd/0003-CMakeLists-use-pkg-config-uuid-detection.patch
 delete mode 100644 package/taskd/Config.in
 delete mode 100644 package/taskd/taskd.hash
 delete mode 100644 package/taskd/taskd.mk

-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

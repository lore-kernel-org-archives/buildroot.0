Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC24DE668A0
	for <buildroot@archiver.kernel.org>; Fri, 19 Dec 2025 22:41:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE31B81097;
	Fri, 19 Dec 2025 22:41:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J-9mTFTgu316; Fri, 19 Dec 2025 22:41:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5684D8109A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766184109;
	bh=tTFxVpUiD6gJxyXaxbjUqvhZGUYL3c34uZ1bLfYB3q0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VI1wo/hwx2HmzDUE3RDFvTOthR6LKYdM1fnxn4p7Z+a+FZpBznJN/RD2nnjL5AZit
	 K8UxjkQinN3SGTIBOQgsoHzp3Z1TEg2UdDjQRXT0xMGE9n8/AB1TWGvG6KzystP2ec
	 Jv+CQppDKaiMnfc3CVurhbKp22fpx7M2aOTjaWZ4T41ewgs0XKtVluRKE8DtTXeyVS
	 zApjcR20NV+GezwJ8ACSuRsit8X2QZL5ReepzNEsIF8Y0YtNGTHyYhh86l21nJHGe0
	 K1y0foMZVUNAWQ+vU+1iOhE+wN8QY1dYslwPexOOKJZN2Ijw+Pyscbbw4DfQo89Y7T
	 yMWrB5nLE0Etw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5684D8109A;
	Fri, 19 Dec 2025 22:41:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 22A3B119
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 22:41:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 147B44006E
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 22:41:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Tax4Ot1WRTZ for <buildroot@buildroot.org>;
 Fri, 19 Dec 2025 22:41:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1BC7F4003A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1BC7F4003A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1BC7F4003A
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 22:41:44 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a05d4.dip0.t-ipconnect.de [91.58.5.212])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 87CFEA4C20F8;
 Fri, 19 Dec 2025 23:41:41 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45868)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vWjAL-000000002VW-15EZ;
 Fri, 19 Dec 2025 22:41:41 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>,
	Simon Dawson <spdawson@gmail.com>
Date: Fri, 19 Dec 2025 23:41:20 +0100
Message-ID: <20251219224140.1318253-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766184101;
 bh=+8KRWlxVsl++ilzYWZ87OB0vbuIa2GpIQgVpaN/5W8I=;
 h=From:To:Cc:Subject:Date:From;
 b=XO95zSkNwo9uzr+nlyLqhAgn0PM5epHN0BuER5Hvw2QoVL4ADiBQXN8CY9tWuZdey
 prSifzGDW0x6/y17HTf3xQwPdFONtn4t/4IyNhwhOk/bXC35mS4odC5PMcSUHSwSr7
 a1dH3nUG7VGzSoqEfxa1qZXUBUuI1Werg2WaAd+3tpM+zsM9B5GUlfn3D5IJFQQ9H+
 aKLoAthfcNQm8Zz/gaJEOIGeXWsVnCSmQefmvnKpdquDAYhExfzW2mMqskm0xEIuqc
 Pd8wC71D886mNIwJJpyp7CQPsOnIOB9/VrgaLpBO430iGfb44Xu5UeLnOy9IVdsIZL
 0qliftaiCMKuA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=XO95zSkN
Subject: [Buildroot] [PATCH v5 00/20] Remove packages
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

this series remove broken packages, see commit logs for individual
reasons.

Depends on https://patchwork.ozlabs.org/project/buildroot/list/?series=486059

Regards, Bernd

v5: rebased on top of series "support/testing: ddrescue: use dmsetup
    from lvm2": https://patchwork.ozlabs.org/project/buildroot/list/?series=486059
    (Julien)
v4: rebased
    added python-aioredis & cppdb, the latter suggested by Thomas:
    https://patchwork.ozlabs.org/project/buildroot/patch/20251217223317.1993455-1-thomas.petazzoni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org/
    added links to newly detected autobuilder failures
v3: added musepack & libcuefile as suggested by Thomas:
    https://patchwork.ozlabs.org/project/buildroot/patch/20251216092915.1354213-1-thomas.petazzoni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org/
    https://patchwork.ozlabs.org/project/buildroot/patch/20251216093447.1377743-1-thomas.petazzoni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org/


Bernd Kuhls (20):
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

 .checkpackageignore                           |  20 --
 Config.in.legacy                              | 128 +++++++++++
 DEVELOPERS                                    |  16 --
 package/Config.in                             |  20 --
 package/alure/Config.in                       |  56 -----
 package/alure/alure.hash                      |   3 -
 package/alure/alure.mk                        |  65 ------
 package/connman-gtk/Config.in                 |  22 --
 package/connman-gtk/connman-gtk.hash          |   3 -
 package/connman-gtk/connman-gtk.mk            |  17 --
 package/cppdb/0001-mysql-library-suffix.patch |  23 --
 package/cppdb/Config.in                       |  20 --
 package/cppdb/cppdb.hash                      |   6 -
 package/cppdb/cppdb.mk                        |  31 ---
 .../0001-fix-compilation-under-musl.patch     |  47 ----
 package/dmraid/Config.in                      |  19 --
 package/dmraid/S20dmraid                      |  29 ---
 package/dmraid/dmraid.hash                    |   5 -
 package/dmraid/dmraid.mk                      |  25 ---
 package/gstreamer1/gst1-plugins-bad/Config.in |   4 -
 .../gst1-plugins-bad/gst1-plugins-bad.mk      |   8 +-
 package/hawktracer/Config.in                  |  25 ---
 package/hawktracer/hawktracer.hash            |   3 -
 package/hawktracer/hawktracer.mk              |  48 -----
 .../0001-fix-build-with-musl-C-library.patch  |  38 ----
 package/let-me-create/Config.in               |  27 ---
 package/let-me-create/let-me-create.hash      |   3 -
 package/let-me-create/let-me-create.mk        |  26 ---
 ...-CMakeLists.txt-honour-BUILD_TESTING.patch |  44 ----
 package/libcgi/Config.in                      |  11 -
 package/libcgi/libcgi.hash                    |   8 -
 package/libcgi/libcgi.mk                      |  14 --
 package/libcuefile/0001-fix-static-link.patch |  25 ---
 .../0002-libcuefile-fedora-c99.patch          |  27 ---
 package/libcuefile/Config.in                  |   6 -
 package/libcuefile/libcuefile.hash            |   7 -
 package/libcuefile/libcuefile.mk              |  25 ---
 ...tic-library-and-find-required-thread.patch |  45 ----
 .../libiqrf/0002-use-only-c-language.patch    |  29 ---
 package/libiqrf/Config.in                     |  16 --
 package/libiqrf/libiqrf.hash                  |   3 -
 package/libiqrf/libiqrf.mk                    |  14 --
 package/libmhash/Config.in                    |   9 -
 package/libmhash/libmhash.hash                |   3 -
 package/libmhash/libmhash.mk                  |  14 --
 .../libnids/0001-libpcap-use-pkg-config.patch |  48 -----
 package/libnids/Config.in                     |  14 --
 package/libnids/libnids.hash                  |   3 -
 package/libnids/libnids.mk                    |  43 ----
 ...001-CMakeLists.txt-add-BUILD_EXAMPLE.patch |  34 ---
 .../libuwsc/0002-fix-bad-indentation.patch    |  26 ---
 .../0003-src-ssl.c-fix-wolfssl-build.patch    |  37 ----
 package/libuwsc/Config.in                     |   8 -
 package/libuwsc/libuwsc.hash                  |   3 -
 package/libuwsc/libuwsc.mk                    |  53 -----
 package/mpd/Config.in                         |   9 -
 package/mpd/mpd.mk                            |   8 +-
 package/musepack/0001-shared.patch            |  24 ---
 ...andard-CMake-flag-to-drive-the-share.patch |  43 ----
 ...-include-fpu-control-with-glibc-only.patch |  26 ---
 .../musepack/0004-missing-sys-select.patch    |  21 --
 .../musepack/0005-fix-build-with-gcc-10.patch |  30 ---
 .../musepack/0006-incompatible-pointers.patch |  47 ----
 package/musepack/Config.in                    |  12 --
 package/musepack/musepack.hash                |   7 -
 package/musepack/musepack.mk                  |  16 --
 ...-stack-libraries-to-lib-subdirectory.patch | 167 ---------------
 ...002-cmake-install-oplk-headers-files.patch |  32 ---
 .../0003-Add-top-level-CMakeLists.txt.patch   | 201 ------------------
 package/openpowerlink/Config.in               | 129 -----------
 package/openpowerlink/openpowerlink.hash      |   6 -
 package/openpowerlink/openpowerlink.mk        | 153 -------------
 package/opentracing-cpp/Config.in             |  18 --
 package/opentracing-cpp/opentracing-cpp.hash  |   3 -
 package/opentracing-cpp/opentracing-cpp.mk    |  28 ---
 package/python-aioredis/Config.in             |   8 -
 package/python-aioredis/python-aioredis.hash  |   5 -
 package/python-aioredis/python-aioredis.mk    |  14 --
 package/qjson/Config.in                       |   8 -
 package/qjson/qjson.hash                      |   3 -
 package/qjson/qjson.mk                        |  14 --
 ...ll-path-lib-instead-of-usr-lib-prefi.patch |  26 ---
 package/racehound/Config.in                   |  35 ---
 package/racehound/racehound.hash              |   3 -
 package/racehound/racehound.mk                |  27 ---
 package/sconeserver/Config.in                 |  96 ---------
 package/sconeserver/sconeserver.hash          |   3 -
 package/sconeserver/sconeserver.mk            |  93 --------
 ...makedefine-HAVE_GET_CURRENT_DIR_NAME.patch |  28 ---
 ...rrect-variables-for-GnuTLS-detection.patch |  32 ---
 ...eLists-use-pkg-config-uuid-detection.patch |  40 ----
 package/taskd/Config.in                       |  18 --
 package/taskd/taskd.hash                      |   5 -
 package/taskd/taskd.mk                        |  13 --
 package/vlc/vlc.mk                            |   8 +-
 95 files changed, 131 insertions(+), 2634 deletions(-)
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
 delete mode 100644 package/libcuefile/Config.in
 delete mode 100644 package/libcuefile/libcuefile.hash
 delete mode 100644 package/libcuefile/libcuefile.mk
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

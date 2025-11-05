Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A07CCCFA0D
	for <buildroot@archiver.kernel.org>; Wed,  5 Nov 2025 20:48:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21F7C612C0;
	Wed,  5 Nov 2025 20:48:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XE3uYLfRMXta; Wed,  5 Nov 2025 20:48:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34BC5613EB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34BC5613EB;
	Wed,  5 Nov 2025 20:48:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 136C44C6
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 20:48:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B6CF41204
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 20:48:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6sV38wuEiiVT for <buildroot@buildroot.org>;
 Wed,  5 Nov 2025 20:48:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9CBCC411F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9CBCC411F7
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9CBCC411F7
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 20:48:21 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0d15.dip0.t-ipconnect.de [91.58.13.21])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1C42AA4C0FE7
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 21:48:19 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51230)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vGkQU-000000001uY-2pg0
 for buildroot@buildroot.org; Wed, 05 Nov 2025 20:48:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  5 Nov 2025 21:48:03 +0100
Message-ID: <20251105204818.2096762-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1762375699;
 bh=4chL1jUzzrV/POcAhN5jtqGEg0Px/7kCkoe2MAZyfUg=;
 h=From:To:Subject:Date:From;
 b=Pm+ntSBgGt86SEA3l0e08jOd3GfQbBP/g+sUoQ4o5pXuxiH80IoNXKT5tM1o2ytBI
 RLgIk9ClfbITVKm83fZ8BeUC6crpOobNlAGWtBTzi9kKzxyTRE/tnmjHdlGiNvI0AP
 +wRwYjZamwAbaG+1CMNYiT5RwGRksBd1vv+oaSf5BdMV+mGKY2FLPCTub959tTMUXC
 6XOsYC4Q34JTjqwWRyN37aZWZS7QUjR/SPUk5/8fHC6bfc41kE61f/DKSBdcsEpeEq
 Oqw3TKrrg9pamG9rcDMNf+nuwXNVmVpXTBviXZZH9/spgjhrAHuLjViWMPPKTVKEgu
 wvY/067uTkQwg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=Pm+ntSBg
Subject: [Buildroot] [PATCH v2 00/12] Remove packages
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

these are accumulated patches to remove unmaintained packages in the
format of a patch series to avoid conflicts in Config.in.legacy.

Regards, Bernd

v2:.
- removed ramspeed from series, it was applied to buildroot
- added dvbsnoop removal to series
- added patches from Thomas:

  linphone series:
  https://patchwork.ozlabs.org/project/buildroot/list/?series=472582
  Apparently my review of the series did not make it to patchworks:
  https://lists.buildroot.org/pipermail/buildroot/2025-October/787537.html
  Linphone will also block the upcoming ffmpeg 8.0 bump which will be
  part of the Kodi 22.0 bump in the coming months.

  libjwt:
  https://patchwork.ozlabs.org/project/buildroot/patch/20250829170522.2436314-1-thomas.petazzoni@bootlin.com/
  Added libjwt removal to this series as suggested by Thomas.

Bernd Kuhls (5):
  package/libjwt: remove package
  package/expect: remove package
  package/mongrel2: remove package
  package/procrank_linux: remove package
  package/dvbsnoop: remove package

Thomas Petazzoni (7):
  package/asterisk: fix build caused by libjwt bump
  package/linphone: remove package
  package/belle-sip: remove package
  package/belr: remove package
  package/mediastreamer: remove package
  package/ortp: remove package
  package/bctoolbox: remove package

 .checkpackageignore                           |   9 -
 Config.in.legacy                              |  80 ++++++++
 DEVELOPERS                                    |   7 -
 package/Config.in                             |  11 --
 package/asterisk/Config.in                    |   1 -
 package/asterisk/asterisk.hash                |   2 +
 package/asterisk/asterisk.mk                  |   7 +-
 ...1-Fix-Libs.private-flags-for-mbedtls.patch |  37 ----
 package/bctoolbox/Config.in                   |  19 --
 package/bctoolbox/bctoolbox.hash              |   3 -
 package/bctoolbox/bctoolbox.mk                |  42 ----
 package/belle-sip/Config.in                   |  22 ---
 package/belle-sip/belle-sip.hash              |   3 -
 package/belle-sip/belle-sip.mk                |  40 ----
 package/belr/Config.in                        |  19 --
 package/belr/belr.hash                        |   3 -
 package/belr/belr.mk                          |  25 ---
 package/dvbsnoop/0001-musl-types-h.patch      |  15 --
 package/dvbsnoop/Config.in                    |  21 --
 package/dvbsnoop/dvbsnoop.hash                |   3 -
 package/dvbsnoop/dvbsnoop.mk                  |  12 --
 .../0001-enable-cross-compilation.patch       | 120 ------------
 .../0002-allow-tcl-build-directory.patch      |  34 ----
 package/expect/Config.in                      |   7 -
 package/expect/expect.hash                    |   4 -
 package/expect/expect.mk                      |  21 --
 package/libjwt/Config.in                      |  10 -
 package/libjwt/libjwt.hash                    |   3 -
 package/libjwt/libjwt.mk                      |  19 --
 ...re-paths-paths.cpp-fix-powerpc-build.patch |  35 ----
 package/linphone/Config.in                    |  41 ----
 package/linphone/linphone.hash                |   4 -
 package/linphone/linphone.mk                  |  42 ----
 ...-nowebcam.c-fix-build-without-ffmpeg.patch |  55 ------
 ...FER_PADDING_SIZE-to-determine-paddin.patch |  46 -----
 package/mediastreamer/Config.in               |  28 ---
 package/mediastreamer/mediastreamer.hash      |   3 -
 package/mediastreamer/mediastreamer.mk        | 179 ------------------
 package/mongrel2/0001-Do-not-run-tests.patch  |  45 -----
 ...-Fix-Makefiles-for-cross-compilation.patch |  78 --------
 .../0003-fix-build-with-gcc-4.8.patch         |  62 ------
 package/mongrel2/Config.in                    |  33 ----
 package/mongrel2/mongrel2.hash                |   6 -
 package/mongrel2/mongrel2.mk                  |  26 ---
 package/ortp/Config.in                        |  16 --
 package/ortp/ortp.hash                        |   3 -
 package/ortp/ortp.mk                          |  25 ---
 package/procrank_linux/Config.in              |   7 -
 package/procrank_linux/procrank_linux.hash    |   3 -
 package/procrank_linux/procrank_linux.mk      |  22 ---
 50 files changed, 86 insertions(+), 1272 deletions(-)
 delete mode 100644 package/bctoolbox/0001-Fix-Libs.private-flags-for-mbedtls.patch
 delete mode 100644 package/bctoolbox/Config.in
 delete mode 100644 package/bctoolbox/bctoolbox.hash
 delete mode 100644 package/bctoolbox/bctoolbox.mk
 delete mode 100644 package/belle-sip/Config.in
 delete mode 100644 package/belle-sip/belle-sip.hash
 delete mode 100644 package/belle-sip/belle-sip.mk
 delete mode 100644 package/belr/Config.in
 delete mode 100644 package/belr/belr.hash
 delete mode 100644 package/belr/belr.mk
 delete mode 100644 package/dvbsnoop/0001-musl-types-h.patch
 delete mode 100644 package/dvbsnoop/Config.in
 delete mode 100644 package/dvbsnoop/dvbsnoop.hash
 delete mode 100644 package/dvbsnoop/dvbsnoop.mk
 delete mode 100644 package/expect/0001-enable-cross-compilation.patch
 delete mode 100644 package/expect/0002-allow-tcl-build-directory.patch
 delete mode 100644 package/expect/Config.in
 delete mode 100644 package/expect/expect.hash
 delete mode 100644 package/expect/expect.mk
 delete mode 100644 package/libjwt/Config.in
 delete mode 100644 package/libjwt/libjwt.hash
 delete mode 100644 package/libjwt/libjwt.mk
 delete mode 100644 package/linphone/0001-src-core-paths-paths.cpp-fix-powerpc-build.patch
 delete mode 100644 package/linphone/Config.in
 delete mode 100644 package/linphone/linphone.hash
 delete mode 100644 package/linphone/linphone.mk
 delete mode 100644 package/mediastreamer/0001-src-videofilters-nowebcam.c-fix-build-without-ffmpeg.patch
 delete mode 100644 package/mediastreamer/0002-Use-AV_INPUT_BUFFER_PADDING_SIZE-to-determine-paddin.patch
 delete mode 100644 package/mediastreamer/Config.in
 delete mode 100644 package/mediastreamer/mediastreamer.hash
 delete mode 100644 package/mediastreamer/mediastreamer.mk
 delete mode 100644 package/mongrel2/0001-Do-not-run-tests.patch
 delete mode 100644 package/mongrel2/0002-Fix-Makefiles-for-cross-compilation.patch
 delete mode 100644 package/mongrel2/0003-fix-build-with-gcc-4.8.patch
 delete mode 100644 package/mongrel2/Config.in
 delete mode 100644 package/mongrel2/mongrel2.hash
 delete mode 100644 package/mongrel2/mongrel2.mk
 delete mode 100644 package/ortp/Config.in
 delete mode 100644 package/ortp/ortp.hash
 delete mode 100644 package/ortp/ortp.mk
 delete mode 100644 package/procrank_linux/Config.in
 delete mode 100644 package/procrank_linux/procrank_linux.hash
 delete mode 100644 package/procrank_linux/procrank_linux.mk

-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

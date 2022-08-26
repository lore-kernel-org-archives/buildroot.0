Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED6CBECAAD5
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 13:55:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7333B61114;
	Fri, 26 Aug 2022 13:55:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7333B61114
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eZwCjzk1O5Cy; Fri, 26 Aug 2022 13:55:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D4B16110D;
	Fri, 26 Aug 2022 13:55:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D4B16110D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 214EA1BF5F5
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 13:55:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ECFD483F12
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 13:55:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECFD483F12
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tcYpD1sdzEB8 for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 13:55:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0FE482FA9
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C0FE482FA9
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 13:55:08 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id sd33so3298359ejc.8
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 06:55:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=hfctL5vyJ+McRKvfXBy0XsV3mLI1HVIEclSOyHDqnVQ=;
 b=eCriiUy29KzQRBSL6bep0LZTUblI0NWXZT/vsp+BZ63zXZXn07D9S3ASVPLJw42MP/
 YZvWmdWLCdLTneG61jtLx9mtGkdHtW/1gOLrSD1ZoVy2enIOyEomjlORz8j+G+9Mc2M0
 Aa8r2l3lG0hiQnQlQFblh0NO6rdyzyhUBiT9T6Xmjx54HkM5mITIUVi/Xf95hyF62daf
 rOp/zxPzSnJrIsoMz2PdX4izu5LTlW+Mu9RH2sB9X0uUAKAvoR9NxEF4txuWVi1PHBQV
 Uz/fhFOt5K0+Z1d2XTjX7GKwnaTjQbKmWlqDdyW0xa7KijrftdEFlISyyWxElC7T9l37
 Besg==
X-Gm-Message-State: ACgBeo31WhlZ4f4npVuufuBa04SG4ZY0fGdm6kqN4mQUnrXnHlcL2csO
 qQbi5RGI+2aikh0VyT8M8ltHOYo3o2Uhlgp8
X-Google-Smtp-Source: AA6agR4bvxzdzhr+4ZYyoVtvW701Y9p9V5kZaaG7Mwj9+IoYjc24GmZxdxZXl3kgLEwlRZ+lYXOnfg==
X-Received: by 2002:a17:907:6285:b0:738:e862:a1b with SMTP id
 nd5-20020a170907628500b00738e8620a1bmr5749118ejc.70.1661522106619; 
 Fri, 26 Aug 2022 06:55:06 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a508d86000000b00446bf462203sm1347928edh.1.2022.08.26.06.55.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 06:55:05 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 15:54:34 +0200
Message-Id: <20220826135503.20612-1-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=hfctL5vyJ+McRKvfXBy0XsV3mLI1HVIEclSOyHDqnVQ=;
 b=XObRmxTH2LgXj4YDZDdGOsE/x3K/i+z6DuBGhTWlkbGA3HCLKR4ikSULxaS5lmgUJ/
 cQqpiUXVs7lDNWTPEHcu6G8cLZFIUFOlpIweRYHPYlF9QduPtwvEM0QKJc56yYXL+uQk
 YjsBMesuwoPa8g/yhYRAmS6BhrYCIbDddMJtfHlleno2FPxBdw+2J0fTCezE33pVkhQ6
 n0uV1uYAV1ETOXppKU6gjztcGb4576aDT6nq4hDc3PBEjYBkReU5hp61PSdJf+2EpFIf
 lQodx4OAOYWsRjWG1rCa0ujgiuiBWZJ2apthDD5uzSxgPPXRcjbzk716s9ejg9SsbG9a
 mCwQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=XObRmxTH
Subject: [Buildroot] [PATCH v4 00/29] Extend Qt6 configuration
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Extend qt6base package configuration options and add license/hash
information.
This is mostly a port of the existing qt5 options to qt6 and checked that the
correct CMake options are used.
see https://github.com/qt/qtbase/blob/dev/cmake/configure-cmake-mapping.md
This should be a good starting point to get more fully featured qt6 support

Changes in v4:
	* Depends on Dbus for examples changed to select Qt DBus

Changes in v3:
        * All top level options are now sorted in the Config.in
        * The hash for the harfbuzz license file has been added
        * Examples config selects additional packages to function
        * Dependencies added for examples option

Changes in v2:
        * Rework as series with a patch per feature added

Jesse Van Gavere (29):
  package/qt6/qt6base: Add qt6base hash file
  package/qt6/qt6base: Add license information
  package/qt6/qt6base: add support for network module
  package/qt6/qt6base: add support for concurrent module
  package/qt6/qt6base: add support for xml module
  package/qt6/qt6base: add support for test module
  package/qt6/qt6base: add support for dbus module
  package/qt6/qt6base: add support for syslog backend
  package/qt6/qt6base: add qt support for journald when using systemd
  package/qt6/qt6base: add qt support for zstd when using the package
  package/qt6/qt6base: add qt support for SSE/AVX SIMD extensions
  package/qt6/qt6base: add linking to libatomic
  package/qt6/qt6base: add support to link qt to openssl
  package/qt6/qt6base: add qt icu support
  package/qt6/qt6base: add qt libudev support
  package/qt6/qt6base: add qt libglib2 support
  package/qt6/qt6base: add support for passing custom options
  package/qt6/qt6base: add support for sql module w/ mysql
  package/qt6/qt6base: add support for sql module w/ postgresql
  package/qt6/qt6base: add support for sql module w/ sqlite
  package/qt6/qt6base: add support for gui module
  package/qt6/qt6base: add support for gui module fontconfig/harfbuzz
  package/qt6/qt6base: Add support for gui module jpeg/png/gif image
    format
  package/qt6/qt6base: add support for gui module
    widgets/opengl/graphics backends
  package/qt6/qt6base: add support for gui module tslib
  package/qt6/qt6base: add support for gui module libinput
  package/qt6/qt6base: add support for gui module kms
  package/qt6/qt6base: add support for gui module printsupport/cups
  package/qt6/qt6base: add support for building examples

 package/qt6/Config.in            |   5 +
 package/qt6/qt6base/Config.in    | 290 ++++++++++++++++++++++++++++
 package/qt6/qt6base/qt6base.hash |   9 +
 package/qt6/qt6base/qt6base.mk   | 318 +++++++++++++++++++++++++++++++
 4 files changed, 622 insertions(+)
 create mode 100644 package/qt6/qt6base/qt6base.hash

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

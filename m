Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B724CECAAD2
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 06:48:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E760E83E8A;
	Fri, 26 Aug 2022 06:48:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E760E83E8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HgMGFRcRuMWp; Fri, 26 Aug 2022 06:48:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1106383E85;
	Fri, 26 Aug 2022 06:48:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1106383E85
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 612081BF8A8
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 06:48:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C3C240012
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 06:48:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C3C240012
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p2emPgG-bxf3 for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 06:48:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33552400F1
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 33552400F1
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 06:48:04 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id sd33so1370984ejc.8
 for <buildroot@buildroot.org>; Thu, 25 Aug 2022 23:48:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=gtd68GqfUKM4Yfx10KAeWmT+WjtZyZ6Q4B9EoKMmhmU=;
 b=htsrq32wvTENdgM58S8wz+Hzsv/rfgH2BQLxuJ1iUqFBeThklnCtFsQ104D+O83tYy
 82f9uIhOJw95h/kZw2e/7ZDmb6nx3POYGpAuP6bLFuXPyW4VvulRxXN7LusIR0Lhiujk
 rXZurS8VpEoKbFZk6w0/vxKSNw4HEn1FdKRNUldnJ59aKwTA5/EPaek3GYp8KHz702U8
 ZhY3lIL+L4PRDcJG2AVSuA6hkYiX8y+NkkQ7ZqZl1rkXzFFVewDSK19z4TefF0mM8ecz
 qIe7T3+4w4cVhrfYQz83J/2aJsmynWZOZq12IofhftM3RhX9XsmLgKIGTrVFFEh/haYl
 AHIA==
X-Gm-Message-State: ACgBeo3Bf6DiNpK85iOIhmAnMTH2HG/ZJmCdSBhrJWzq3D63f43G/0qB
 BWWKYflhI506tVUrXRLLTPf+jF0EJ8W1NRww
X-Google-Smtp-Source: AA6agR4CHO6w6J1kGdWFVLt6zQo/BbQYpZFZZA/+srJTvnsE1lz6YapNO+vHVe3dK8wz9biEns2ylg==
X-Received: by 2002:a17:907:9727:b0:73d:981d:de2c with SMTP id
 jg39-20020a170907972700b0073d981dde2cmr4586173ejc.484.1661496481870; 
 Thu, 25 Aug 2022 23:48:01 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 e1-20020a50fb81000000b00447c0dcbb99sm787613edq.83.2022.08.25.23.48.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 23:48:01 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 08:47:29 +0200
Message-Id: <20220826064758.3968647-1-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=gtd68GqfUKM4Yfx10KAeWmT+WjtZyZ6Q4B9EoKMmhmU=;
 b=HCcotNQc08jZ4zwcwY0cXEUVfQ0Y4bq/Za1NOrq2+wC37k1yt/rfIqOfvawpajGG7U
 2CDBDvbtOJ+dxXnY5VG6RveO3ISQbIHSDWDVJQcspV9F5HcDHmxVgdwMBw+yLq7nVJxW
 rmZQP69Vz1DwoEtoHcA83GjBvJ/QhEP5wMbTArIkdqP4PElXmWMGiu4HV+DeAUmmdieQ
 rT+3BAdtz4gz5/txqR/Wy84LNBEC1IpWatEWBnMHvkd8ZnEpGO9LxbfC9dEUcnkOI3hL
 3UKqg9uwrmpA4ikav0+oCReHkTEdLrv2X9c5XYZfkMToNxb/L8M+p5TsorEfH0+ibWu/
 paSg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=HCcotNQc
Subject: [Buildroot] [PATCH v2] Extend Qt6 configuration
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
 "Yann E . Morin" <yann.morin.1998@free.fr>,
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

Changes in v2:
	* Rework as series with a patch per feature added

Jesse Van Gavere (29):
  package/qt6/qt6base: Add qt6base hash file
  package/qt6/qt6base: Add license information
  package/qt6/qt6base: add support for network module
  package/qt6/qt6base: add support for concurrent module
  package/qt6/qt6base: add support for xml module
  package/qt6/qt6base: add support for test module
  package/qt6/qt6base: add support for building examples
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
  package/qt6/qt6base: add support for sql module with postgresql
  package/qt6/qt6base: add support for sql module with sqlite
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

 package/qt6/Config.in            |   5 +
 package/qt6/qt6base/Config.in    | 280 +++++++++++++++++++++++++++
 package/qt6/qt6base/qt6base.hash |   8 +
 package/qt6/qt6base/qt6base.mk   | 318 +++++++++++++++++++++++++++++++
 4 files changed, 611 insertions(+)
 create mode 100644 package/qt6/qt6base/qt6base.hash

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

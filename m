Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D30FECAAA3
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 12:53:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0489419A1;
	Fri, 26 Aug 2022 12:53:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0489419A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hsxItKMWbDHq; Fri, 26 Aug 2022 12:53:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47895419DF;
	Fri, 26 Aug 2022 12:53:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47895419DF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CBEC91BF27E
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 12:52:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B431C83EEC
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 12:52:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B431C83EEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dKX4bDHSA9B9 for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 12:52:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D9FD83EE9
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8D9FD83EE9
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 12:52:58 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id og21so3008868ejc.2
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 05:52:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=IjdR6+qnraCOJ7SlczI0gUqk9Ru40ELH8VICZrAQrQA=;
 b=AkFXnJtNguFmUjO+oxVqp09HL9rizbOl5AzT9Oc/1fZCDwvjTyDBzuk0Rr6TsQ+S08
 OvAiBKF7nDAXqILanl4SCR6QoifmcKj/TzgwLRHr5MqpmEUxOJ2dG+/2KkZRAxOP86d2
 boGXd5kd03Qp/VOLHa9C1YL9iLpMH7GQhdknTsoo7VzgMNzDiKNbU5mo4HJizot1/6gv
 OyszDJ7c5CkooscppzrwK0EUura7pEAYRW4J8B/pTKgfHg2mSLkokwKKz/pwoyCr0x3/
 4jOrMa/XKa8SM44O3kjA6/VLTfUEZG7Wf5s+JmYZ6mDtBhcsTvuPLoaElYpEj3+hzW6b
 emjg==
X-Gm-Message-State: ACgBeo2oBAAb16+PagI/MX2S3qhziDLYxU02D5IkrUkfPU85l1P0eIYI
 h3JM5alnVcR80zOVCgVce86xcEL/jsgOpU9g
X-Google-Smtp-Source: AA6agR7RkkemHeuGd4bgx+oflADYMdRtrfVmhkC1PZgvGenV3GY6Jcd8JBK/rHsD53kLfMNm9fLtEw==
X-Received: by 2002:a17:907:1dd2:b0:740:97ab:1f9b with SMTP id
 og18-20020a1709071dd200b0074097ab1f9bmr1374953ejc.319.1661518376374; 
 Fri, 26 Aug 2022 05:52:56 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a1709064d8200b0073923a68974sm829573eju.206.2022.08.26.05.52.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 05:52:55 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 14:52:23 +0200
Message-Id: <20220826125252.16782-1-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=IjdR6+qnraCOJ7SlczI0gUqk9Ru40ELH8VICZrAQrQA=;
 b=pFmNF1yqg84HVwezRcEZKjqX0UqTwO7wbPpaBpGFo1qB4hOSHIYDsSg3az1rMrBIER
 n6KjdZMEh1zYj5eP34Nddwhnr8785KFKdMYYgSIfWAA3dCgvl1jlRCfBAWkaQ2zi5nZW
 m9SfyHJ/LA5e8L9dR8cMTBW3oRZiUVf3PlDCiZC69pF5hCq/jV/musCVAwWlC4GdJxoq
 FoYkJSSNFZTO+aVpK6FYL7UOSyrsCYvBe/GW6dNUJ/3JHt4FiN0bykPOoN63dJASJYl4
 Qrs0evVuykKER3FAe1tcsx8K1odjgf6dI23WSYX/CXyQxFG8lMggZHDaXT3755uORrhU
 Kuzw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=pFmNF1yq
Subject: [Buildroot] [PATCH v3 00/29] Extend Qt6 configuration
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

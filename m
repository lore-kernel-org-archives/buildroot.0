Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4C3EC4332F
	for <buildroot@archiver.kernel.org>; Mon,  7 Nov 2022 02:25:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F4CA81491;
	Mon,  7 Nov 2022 02:25:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F4CA81491
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CwgsV0AHpzM6; Mon,  7 Nov 2022 02:25:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D56A8146F;
	Mon,  7 Nov 2022 02:25:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D56A8146F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 57FEA1BF398
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 02:25:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 331AF8145E
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 02:25:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 331AF8145E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BDRQ3-wBDuho for <buildroot@lists.busybox.net>;
 Mon,  7 Nov 2022 02:25:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 232058145B
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 232058145B
 for <buildroot@buildroot.org>; Mon,  7 Nov 2022 02:25:05 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id q21so4955330iod.4
 for <buildroot@buildroot.org>; Sun, 06 Nov 2022 18:25:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OQKDsXbYeFnRxa/wpjW8D1l9MF8W/HpfEziHhAyo530=;
 b=O+Rz+23t7a5BwWO9UeHucoZn4v2BApmCAahfFBMYpxCUFHb0ZcOAaRBh1Rt11vpnnK
 LR6mIzFgX9scANzuoc5GhUBT0NxHQGi3iLjomQuRx3iPz5vw0sfLwC4AlthUhSI4zI59
 cvuUwjP6cXmE5ktXFjogTH9M8p/HG3ooilaXa1g69TTgSyzXwphUTWmc9WlNrHPxNp3r
 Fp0smaB+xYyD3n8VsaQs+6hpv2qy7DULvTOXvwi+rT9DVZZgvNKfZD2Vd3JnkWB5VK+e
 PbXKS2JOBe6sOAzuAb9yOQW+KyBKxXy3O3zCv+afYYR6Omtn84vKZUXq84TMiUB14oDU
 5GAg==
X-Gm-Message-State: ACrzQf0+nTilyyDPelbKMn98GDklM2ZP9/3yrg15eVz9lr3cvWKcFIAx
 3WERm6FsSeEac4TJqidh3xbGRiJIf6o3GA==
X-Google-Smtp-Source: AMsMyM5Ao2HAdszrQEyv7mrFbo/pxyDv07m/WSf3pZNntPnMJH9IRuDysK41S/hWF4vxDgaLl8pr7Q==
X-Received: by 2002:a05:6638:468e:b0:375:1ae9:ba13 with SMTP id
 bq14-20020a056638468e00b003751ae9ba13mr27125674jab.253.1667787903684; 
 Sun, 06 Nov 2022 18:25:03 -0800 (PST)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 z25-20020a027a59000000b003717c1df569sm2215225jad.165.2022.11.06.18.25.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Nov 2022 18:25:02 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  6 Nov 2022 19:24:56 -0700
Message-Id: <20221107022458.3448020-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OQKDsXbYeFnRxa/wpjW8D1l9MF8W/HpfEziHhAyo530=;
 b=fjVwiujwV1dyo6skCJcZdQblGBCO6SS7YMSiN4w7x6ZWiYDhCSBMSodUNGbXngaz9V
 BrSJrY7NQF0S/a1870NhgWdByGypCq/CH7D6FzK9edv8FLhSlSE+ntg8sTxGbLNrnjoW
 5Qn4eX3exGBl5PI3QDQAhGyknjSYB63dTr0cDhkpKjJQ1C3fqTRHex02pd+nV9dFYGpH
 +gYMsUbg7Uzmc6r4YMweazy2FP2ziXFbSk5wcCUuxJrRooWvzdN6KdMQr8djPUI3ORlb
 XCj+VEqRgSjCiYG5SMW80MFHxBKME+jnH7AqRD4eTV/7+uoFHG+suUWpAXX23aKriVi9
 1hFA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=fjVwiujw
Subject: [Buildroot] [PATCH 1/3] package/stb: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a header only library which is required by the latest version
of zxing-cpp.

Include paths and pc file are based off of debian libstb package.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 DEVELOPERS            |  1 +
 package/Config.in     |  1 +
 package/stb/Config.in |  6 ++++++
 package/stb/stb.hash  |  3 +++
 package/stb/stb.mk    | 21 +++++++++++++++++++++
 package/stb/stb.pc    |  8 ++++++++
 6 files changed, 40 insertions(+)
 create mode 100644 package/stb/Config.in
 create mode 100644 package/stb/stb.hash
 create mode 100644 package/stb/stb.mk
 create mode 100644 package/stb/stb.pc

diff --git a/DEVELOPERS b/DEVELOPERS
index 9bd98da5ef..b5665b7eb8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1419,6 +1419,7 @@ F:	package/rtl8192eu/
 F:	package/serd/
 F:	package/sord/
 F:	package/sratom/
+F:	package/stb/
 F:	package/zchunk/
 F:	support/testing/tests/package/sample_python_rtoml.py
 F:	support/testing/tests/package/test_python_rtoml.py
diff --git a/package/Config.in b/package/Config.in
index aef80f9ab0..5e9a3ec1b2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1600,6 +1600,7 @@ menu "Graphics"
 	source "package/pixman/Config.in"
 	source "package/poppler/Config.in"
 	source "package/powervr/Config.in"
+	source "package/stb/Config.in"
 	source "package/tiff/Config.in"
 	source "package/unclutter-xfixes/Config.in"
 	source "package/waffle/Config.in"
diff --git a/package/stb/Config.in b/package/stb/Config.in
new file mode 100644
index 0000000000..41014d242b
--- /dev/null
+++ b/package/stb/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_STB
+	bool "stb"
+	help
+	  Single-file image and audio processing libraries for C/C++.
+
+	  https://github.com/nothings/stb
diff --git a/package/stb/stb.hash b/package/stb/stb.hash
new file mode 100644
index 0000000000..097ad3424f
--- /dev/null
+++ b/package/stb/stb.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  c47cf5abe21e1d620afccd159c23fe71dfa86eb270015a7646a4f79e9bfd5503  stb-8b5f1f37b5b75829fc72d38e7b5d4bcbf8a26d55.tar.gz
+sha256  bebfe904b14301657e4e5d655c811d51fd31b97c455b9cc2d8600d6bac6cff63  LICENSE
diff --git a/package/stb/stb.mk b/package/stb/stb.mk
new file mode 100644
index 0000000000..59358aec26
--- /dev/null
+++ b/package/stb/stb.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# stb
+#
+################################################################################
+
+STB_VERSION = 8b5f1f37b5b75829fc72d38e7b5d4bcbf8a26d55
+STB_SITE = $(call github,nothings,stb,$(STB_VERSION))
+STB_LICENSE = Public Domain or MIT
+STB_LICENSE_FILES = LICENSE
+STB_INSTALL_STAGING = YES
+STB_INSTALL_TARGET = NO
+
+define STB_INSTALL_STAGING_CMDS
+	mkdir -p $(STAGING_DIR)/usr/include/stb
+	$(INSTALL) -m 0644 $(@D)/*.h $(STAGING_DIR)/usr/include/stb
+	$(INSTALL) -D -m 0644 $(STB_PKGDIR)/stb.pc \
+		$(STAGING_DIR)/usr/lib/pkgconfig/stb.pc
+endef
+
+$(eval $(generic-package))
diff --git a/package/stb/stb.pc b/package/stb/stb.pc
new file mode 100644
index 0000000000..165b6da94a
--- /dev/null
+++ b/package/stb/stb.pc
@@ -0,0 +1,8 @@
+prefix=/usr
+libdir=${prefix}/lib
+includedir=${prefix}/include
+
+Name: stb
+Description: single-file image and audio processing libraries for C/C++
+Version: 0.0
+Cflags: -I${includedir}/stb
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

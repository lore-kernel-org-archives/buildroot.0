Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0129CC4332F
	for <buildroot@archiver.kernel.org>; Mon, 28 Nov 2022 17:59:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8295D60BD6;
	Mon, 28 Nov 2022 17:59:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8295D60BD6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eWKTBdUdd7gw; Mon, 28 Nov 2022 17:59:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C28F660C2E;
	Mon, 28 Nov 2022 17:59:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C28F660C2E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 941501BF20B
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 17:59:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6EAB360B92
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 17:59:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EAB360B92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MAhALIongw3e for <buildroot@lists.busybox.net>;
 Mon, 28 Nov 2022 17:58:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DC4860B2C
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9DC4860B2C
 for <buildroot@buildroot.org>; Mon, 28 Nov 2022 17:58:57 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id g26so7534812iob.11
 for <buildroot@buildroot.org>; Mon, 28 Nov 2022 09:58:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2z/VoGPWnYvwHtDlK5X9LfcCaGfQbHxKgTA2z7jz+8w=;
 b=3Xhg8MQLGhbJF8Nh7o5LEH5crrybqV00QbTBAocv7+JDVi6PL5qDk/9j/aybpM6fZe
 1X0JeElghsFQqOUsBSOJ25Ud7AqCdwWwTnHoCl3NjQd0HemZwZ2E0yEWJUF5C005uhgz
 MKUzUGZeGfr6kjyU/77DTl1sVFML2RAeVEItSxfI+4ZW1j4JxuTCy/gFFg8GUiDkwhf3
 HnvBIoIQbmNwkIlEn31ntFE53NkREkZB0t8UU7p8ixc2Tn8R7StH4unC4RHjQqRTmYGS
 3qzt1vtGmNCy60A/fJXEtcN4Gp7U9ZNZ3xKm7/nnM+B0dYDLYmnnscakC4h9I8hA0CDR
 26GA==
X-Gm-Message-State: ANoB5pkiQ2Y5DG8Wly72sr1x4z+wPsHFjeEEv4aokxVHvTvbi8Y0SxZM
 2zVe7KWmoj94D7HQ00ciu5jvJq9wH01G+g==
X-Google-Smtp-Source: AA0mqf6WgiJeySk+2Jkujr/rHojMFQCWd+nenKRaKrJvcyoTxRq9jYCWYNoVfl8Mh29oJ1l/AQ0ALA==
X-Received: by 2002:a05:6638:4394:b0:34a:35a:5463 with SMTP id
 bo20-20020a056638439400b0034a035a5463mr18940669jab.148.1669658336323; 
 Mon, 28 Nov 2022 09:58:56 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 y16-20020a056638229000b00363781b6bccsm4564802jas.49.2022.11.28.09.58.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 09:58:55 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 28 Nov 2022 10:58:45 -0700
Message-Id: <20221128175851.1913859-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221128175851.1913859-1-james.hilliard1@gmail.com>
References: <20221128175851.1913859-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2z/VoGPWnYvwHtDlK5X9LfcCaGfQbHxKgTA2z7jz+8w=;
 b=DywXIOLARglJTrnC7CD4mrvGsQ1Yw8lJhqTqO6Ytc7cD7NGFo7hWViCQ78pTgBdL1i
 lPWwl2E7GrgWrF/eL3YkokQnQu9pICy3wA9UA7TuQMnKMnRvXODmFayxjT/F4TJdZjod
 sFYwVIGOAv7jLidY4WB0IiMslgqzyT4yCFq4D1IhovAjEUV8AJLlHI1fhftXxlwc0UYy
 /8O54vEnrWpxe5Z1Jr/somAbe1U2fu5pDNESbY9J+yL86TTNjECzuHbwnKFbMVJA6GAe
 i02VxJIPllvYLxU32QCrEiJmMzTs28wlp9ozgXFet/S/KJA7N4I+uHWuh7nyeS6E2KJC
 fhQA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=DywXIOLA
Subject: [Buildroot] [PATCH v2 2/8] package/cpuinfo: new package
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
Cc: Stefan Hager <stefan.hager@ginzinger.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Stefan Hager <stefan.hager@ginzinger.com>

This package is required by tensorflow-lite.

Signed-off-by: Stefan Hager <stefan.hager@ginzinger.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in            |  1 +
 package/cpuinfo/Config.in    |  9 +++++++++
 package/cpuinfo/cpuinfo.hash |  4 ++++
 package/cpuinfo/cpuinfo.mk   | 17 +++++++++++++++++
 4 files changed, 31 insertions(+)
 create mode 100644 package/cpuinfo/Config.in
 create mode 100644 package/cpuinfo/cpuinfo.hash
 create mode 100644 package/cpuinfo/cpuinfo.mk

diff --git a/package/Config.in b/package/Config.in
index aef80f9ab0..e09fa0b3bd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -465,6 +465,7 @@ endmenu
 	source "package/cc-tool/Config.in"
 	source "package/cdrkit/Config.in"
 	source "package/cpuburn-arm/Config.in"
+	source "package/cpuinfo/Config.in"
 	source "package/crucible/Config.in"
 	source "package/cryptsetup/Config.in"
 	source "package/cwiid/Config.in"
diff --git a/package/cpuinfo/Config.in b/package/cpuinfo/Config.in
new file mode 100644
index 0000000000..137f657d69
--- /dev/null
+++ b/package/cpuinfo/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_CPUINFO
+	bool "cpuinfo"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  CPU INFOrmation library, cpuinfo is a library to detect
+	  essential for performance optimization information about
+	  host CPU.
+
+	  https://github.com/pytorch/cpuinfo
diff --git a/package/cpuinfo/cpuinfo.hash b/package/cpuinfo/cpuinfo.hash
new file mode 100644
index 0000000000..c3f70fa90f
--- /dev/null
+++ b/package/cpuinfo/cpuinfo.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  0936848904943381b2c01321101614776e43d583840ee0f3ceeea1e3fb7405f7  cpuinfo-de2fa78ebb431db98489e78603e4f77c1f6c5c57.tar.gz
+# License files, locally calculated
+sha256  8e7e60636c3aa0cb03571a1a841ce5697f9551ff92b3c426c2561613d15ade70  LICENSE
diff --git a/package/cpuinfo/cpuinfo.mk b/package/cpuinfo/cpuinfo.mk
new file mode 100644
index 0000000000..ab6a0269ec
--- /dev/null
+++ b/package/cpuinfo/cpuinfo.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# cpuinfo
+#
+################################################################################
+
+CPUINFO_VERSION = de2fa78ebb431db98489e78603e4f77c1f6c5c57
+CPUINFO_SITE = $(call github,pytorch,cpuinfo,$(CPUINFO_VERSION))
+CPUINFO_LICENSE = BSD-2-Clause
+CPUINFO_LICENSE_FILES = LICENSE
+CPUINFO_INSTALL_STAGING = YES
+CPUINFO_CONF_OPTS = \
+	-DCPUINFO_BUILD_UNIT_TESTS=OFF \
+	-DCPUINFO_BUILD_MOCK_TESTS=OFF \
+	-DCPUINFO_BUILD_BENCHMARKS=OFF
+
+$(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

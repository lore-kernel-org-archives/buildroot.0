Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1E6CC6FD19
	for <buildroot@archiver.kernel.org>; Thu, 16 Mar 2023 08:36:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65C3481F10;
	Thu, 16 Mar 2023 08:36:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65C3481F10
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pFA5H-r6bWRO; Thu, 16 Mar 2023 08:36:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8046581F33;
	Thu, 16 Mar 2023 08:36:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8046581F33
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 238631BF3D5
 for <buildroot@lists.busybox.net>; Thu, 16 Mar 2023 08:35:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 448E2408FA
 for <buildroot@lists.busybox.net>; Thu, 16 Mar 2023 08:35:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 448E2408FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lgIedPkAx5z9 for <buildroot@lists.busybox.net>;
 Thu, 16 Mar 2023 08:35:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E6DC4088B
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0E6DC4088B
 for <buildroot@buildroot.org>; Thu, 16 Mar 2023 08:35:06 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id m22so450267ioy.4
 for <buildroot@buildroot.org>; Thu, 16 Mar 2023 01:35:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678955705;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uJgRkKlvX0OfRb5+6K6JT28q5xlVLHhsC/mvxLTPcQo=;
 b=PU4xzofI0Vb7CYRAsLU4DALEzHfLA6O4kmbEGqK125Dw25ZN0plot1NWJXPysAoHrG
 pE6PVBALGGK+s2/RSXXlyNaYI1KbXJIvSRWFzh2iPusneylJhQDGnfc0wsTZ4gni4t2X
 YyWVP3YNHV4B2yr6g8BZK9DdzIJXxIr+UzLhMNl+TZyoOQDfr31CIcu0naL8+57Sg1i+
 gbPpgOEBr7d3wXU0vr+w4EgYc2DVJwNBAQcg7f9+mXUyW6VNalM6g1ApVBNPGJHTADPT
 q4WzDz8SavIstbN0+56lS2zgBwgY6SwrJXhQXg2DGrm/CHN8NlfDWRgZHWnuwVZmIX7A
 LYYw==
X-Gm-Message-State: AO0yUKUUYAPW0absiyBkEcTYLRm85dueI3xI5awZC+zv8tZz7szpwkvw
 p1nOiAwBtj8pLt6JAn890xGWyQ8mG3PLUQ==
X-Google-Smtp-Source: AK7set+lV91SpCDr05ahjTyd4HAhvTZp74VVem8g81/eUSDybE33ZjyEdXDcKhXNMk1ZHvTQsj3Bjw==
X-Received: by 2002:a6b:cf05:0:b0:74c:9907:e5b4 with SMTP id
 o5-20020a6bcf05000000b0074c9907e5b4mr12632211ioa.6.1678955705492; 
 Thu, 16 Mar 2023 01:35:05 -0700 (PDT)
Received: from james-x399.localdomain (97-118-149-35.hlrn.qwest.net.
 [97.118.149.35]) by smtp.gmail.com with ESMTPSA id
 y34-20020a029525000000b003b331f0bbdfsm534630jah.97.2023.03.16.01.35.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 01:35:05 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 16 Mar 2023 02:34:39 -0600
Message-Id: <20230316083440.3466725-9-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230316083440.3466725-1-james.hilliard1@gmail.com>
References: <20230316083440.3466725-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678955705;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uJgRkKlvX0OfRb5+6K6JT28q5xlVLHhsC/mvxLTPcQo=;
 b=QxJ8xSWwyOF3pyyBf6/2MPk/mJt19xfrWWFoSmdqqcANXzFQVNP+wdKocjE87RASqY
 bmS1LF7V9WH9sqhy4LvFxJi6Ssx9j1lNSm8VaNKjWmyJSk2xyfuWoSWtrR3XIQB07g7w
 5A4gmsn+adaRaVlCC099vx3Twx5joWB4H8z5VWS7/bflWJY80JInJnppOWMTids7ke6O
 KIOgDfhC1/Ph0bWlynuK63qG2iW2lJdP0pA+sPaiMtxH2IcAh7MB2OwXHL3BcnrZBqXS
 +X7hrtdtLPDuSXyC+4D1SBoSGp0se40YmFVYwmsnz0I30a7omnKgTcjWkE8PxqEWLEhx
 gIeQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=QxJ8xSWw
Subject: [Buildroot] [PATCH v6 09/10] package/farmhash: new package
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Stefan Hager <stefan.hager@ginzinger.com>

This package is required by tensorflow-lite.

Tested-by: Stefan Hager <stefan.hager@ginzinger.com>
Signed-off-by: Stefan Hager <stefan.hager@ginzinger.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v2 -> v3:
  - add C++11 dependency
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/farmhash/Config.in     | 12 ++++++++++++
 package/farmhash/farmhash.hash |  4 ++++
 package/farmhash/farmhash.mk   | 14 ++++++++++++++
 5 files changed, 32 insertions(+)
 create mode 100644 package/farmhash/Config.in
 create mode 100644 package/farmhash/farmhash.hash
 create mode 100644 package/farmhash/farmhash.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index da79dd3022..678c027898 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2687,6 +2687,7 @@ F:	package/ti-gfx/
 
 N:	Stefan Hager <stefan.hager@ginzinger.com>
 F:	package/cpuinfo/
+F:	package/farmhash/
 F:	package/fp16/
 F:	package/fft2d/
 F:	package/gemmlowp/
diff --git a/package/Config.in b/package/Config.in
index 893d5facdc..8969672e42 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2032,6 +2032,7 @@ menu "Other"
 	source "package/elfutils/Config.in"
 	source "package/ell/Config.in"
 	source "package/falcosecurity-libs/Config.in"
+	source "package/farmhash/Config.in"
 	source "package/fft2d/Config.in"
 	source "package/fftw/Config.in"
 	source "package/flann/Config.in"
diff --git a/package/farmhash/Config.in b/package/farmhash/Config.in
new file mode 100644
index 0000000000..ef22898774
--- /dev/null
+++ b/package/farmhash/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_FARMHASH
+	bool "farmhash"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	help
+	  FarmHash, a family of hash functions.
+
+	  https://github.com/google/farmhash
+
+comment "farmhash needs a toolchain w/ C++11"
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
diff --git a/package/farmhash/farmhash.hash b/package/farmhash/farmhash.hash
new file mode 100644
index 0000000000..afdfc0f994
--- /dev/null
+++ b/package/farmhash/farmhash.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  18392cf0736e1d62ecbb8d695c31496b6507859e8c75541d7ad0ba092dc52115  farmhash-0d859a811870d10f53a594927d0d0b97573ad06d.tar.gz
+# License files, locally calculated
+sha256  4162dd091caae234f72d3b57e138174f733e736b2430a4c51b098b17d866fcb6  COPYING
diff --git a/package/farmhash/farmhash.mk b/package/farmhash/farmhash.mk
new file mode 100644
index 0000000000..6ab7d1a88b
--- /dev/null
+++ b/package/farmhash/farmhash.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# farmhash
+#
+################################################################################
+
+FARMHASH_VERSION = 0d859a811870d10f53a594927d0d0b97573ad06d
+FARMHASH_SITE = $(call github,google,farmhash,$(FARMHASH_VERSION))
+FARMHASH_LICENSE = MIT
+FARMHASH_LICENSE_FILES = COPYING
+FARMHASH_INSTALL_STAGING = YES
+FARMHASH_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
+
+$(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

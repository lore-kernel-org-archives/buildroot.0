Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CB31C0218A
	for <buildroot@archiver.kernel.org>; Tue, 28 Jan 2025 17:02:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 361A480491;
	Tue, 28 Jan 2025 17:02:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jWvY6mVQDipp; Tue, 28 Jan 2025 17:02:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13796804A2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13796804A2;
	Tue, 28 Jan 2025 17:02:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B473B31
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 17:02:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A28AD4142F
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 17:02:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aiqU7FbBjdfv for <buildroot@buildroot.org>;
 Tue, 28 Jan 2025 17:02:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2c; helo=mail-io1-xd2c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7A6A04142D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A6A04142D
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7A6A04142D
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 17:02:05 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-844e9b8b0b9so421702439f.0
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 09:02:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738083724; x=1738688524;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IG2XvFU3UWmZaLHngt5M3q9fvkXV7PMmjm4Ud7cTcFY=;
 b=a6yGXMyYgWuHEezyVntCjNnAkGTWznO21iQKIx73iMrSLiB8R4iP3QlsH62+AnXlQi
 jZSM86sOVqKep+bZfg5+XMXbdDsjwcFW23RQpgZPAAk5TYXPtTSyU3dUpQN+NmjX4uFe
 I9MrXkPSDOgu0c6/Rpw3Yw8U1KFc7p18cTE5tVhGH8lv+YyoF5y7HX/a7dYLomxoQCLK
 vd5JeJ5tl90AY/1l2c2/1vk09MFVkqNpoAXYxT5NrvCEecdw9wYejlSJUcL1jmt8T1zU
 J+ita0IlFufPBKChuigPV3iozq3Zqav8jlwQ7kqVVrhSMn0ESr6xn/6ngmmnQ5HAqX06
 t60A==
X-Gm-Message-State: AOJu0YwBY9D1nqSPnGrMFlEiYxD2/SScY8eLe0ezQWKFhyWdJSZ7vWJw
 GFgnWnI2nLiY+cOJEZlYp5WkluYZ11X8KNKZdl2dGIVyYTD8bWq80ntQGeL0
X-Gm-Gg: ASbGnctHAdhn+BO+UcLqPyMJkZ7b6CFlW24OP0EqtuoBHScNWNZhwV6TaReFB+5/XHG
 AxA0YuJimgzBGYxRPEFP+LQ9n1/0nEBWWJmK3TYxrDrbZZcAecGB/ylnBEMmD4s4QW4M8Cx88B4
 RTCcL+cjOIAGlcgwqFg0oSCvsQeBpUHJz8rr/Xe2DamoSKNpw4zJ/WjQ6KFB++ypzyzGZqepCxw
 98GdkQpkcAAnGDnDIMJozQui4lY52NIsZO8yEzBNAK3Yo6ZuUd84oBX8t3pwFL4Xf2Oqknorldp
 6tlsy91j3vdaFdK7ebRvNI6FQ3AjUnuajXbhjhOfQatJ5hBNHvnYNaGuPo3AI0OVow==
X-Google-Smtp-Source: AGHT+IHp5tPZLAtg75P2NSCXl5Se49H1Sk8WWitHVhOt0ZtXs46pLrbb68GCIWT3ytdZRDAbM5AvMQ==
X-Received: by 2002:a05:6602:1651:b0:83a:f447:f0b9 with SMTP id
 ca18e2360f4ac-851b64fa7eemr4677910739f.9.1738083723959; 
 Tue, 28 Jan 2025 09:02:03 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-8521e035927sm343086739f.43.2025.01.28.09.02.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2025 09:02:03 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Stefan Hager <stefan.hager@ginzinger.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 28 Jan 2025 10:01:52 -0700
Message-Id: <20250128170153.2298242-9-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250128170153.2298242-1-james.hilliard1@gmail.com>
References: <20250128170153.2298242-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738083724; x=1738688524; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IG2XvFU3UWmZaLHngt5M3q9fvkXV7PMmjm4Ud7cTcFY=;
 b=eKnrYsXIYye2j+/9dePyK4MibCz8k7vWclrsQDGiznKb/OiQI2C7ZeY+AbgVRZwo5y
 W/3VYhoMIYxsMX71lsKAp6fTIaTpnMX3LMKnPgESPT3PjuPv5j0HsR539u6t8I9M2Qvr
 yM8sAhP+vL9bZAapn0zRuFmWPAcrLQJ+KmpmlGG4wk/QGXETGgUubfFf2TFqdcLypnKL
 3mKCf+voCu7K10EebZPD0W7+CvmaTGj9a+qvEa5t3wiYt2SxsWQkL1kcn/gJzqQb0kg2
 Rj+grocGFRamP6VhCNFI/EouZKXYWDzrfvOGW7QL0BxtPXgE02GMj7E5ov+tYcChNozh
 kSHA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=eKnrYsXI
Subject: [Buildroot] [PATCH v8 09/10] package/farmhash: new package
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
index 5182df571c..926a4c0a37 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3034,6 +3034,7 @@ F:	package/ti-gfx/
 
 N:	Stefan Hager <stefan.hager@ginzinger.com>
 F:	package/cpuinfo/
+F:	package/farmhash/
 F:	package/fp16/
 F:	package/fft2d/
 F:	package/gemmlowp/
diff --git a/package/Config.in b/package/Config.in
index 0f35409720..e8e07d37c6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2183,6 +2183,7 @@ menu "Other"
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

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2AE4C54EED
	for <buildroot@archiver.kernel.org>; Mon, 30 Jan 2023 00:30:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1417817BD;
	Mon, 30 Jan 2023 00:30:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1417817BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lPubRTfkSDzm; Mon, 30 Jan 2023 00:30:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFC8D817FD;
	Mon, 30 Jan 2023 00:30:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFC8D817FD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 414461BF869
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 00:29:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1BDAC60B3F
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 00:29:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BDAC60B3F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id isbFk3UZjtGB for <buildroot@lists.busybox.net>;
 Mon, 30 Jan 2023 00:29:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EA6D60ADA
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2EA6D60ADA
 for <buildroot@buildroot.org>; Mon, 30 Jan 2023 00:29:08 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id k13so1343784iob.9
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 16:29:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lPo2caT/Qk9I55HDQ4CVmheHkQXXghXLguf3bXHCNj4=;
 b=7e2Q00sIXzAQ8kyTg7gjsP1NtfAKwks5MUKBavDYOXlN+XWgQu+T/qbwfKuep6ykdp
 L9y7hLAvTKLAz2/iWz+WyFKXJKNIretH5MCXZeRnSQvHC1XY61/GnKM1KJ2jt0OjK5dj
 2L7zvvNFaWU+oQ4E4NA7fPkpb8olllwWFSLQ1CXFcNUwQYTs0Rzfj1eYsu0idWStMmil
 CD17+ZN+eV3vcvM7RJlUmGeWtP3ztpw44Th49H65muUwYih2seIaHNPbj9zj/4FN38HN
 04HMYncvy4bIQJTgay0FJgRmm/tH2FXZN3Ywqokj1GLSHcPrYlSO07fBppVNTFlOf7Kn
 74xg==
X-Gm-Message-State: AO0yUKX2fg70miEC7wTtB96B3hU3PW1YoVstVM1bOxuABB8a3xfFhIb2
 ueDfUXQaHJnxRtQ3J7fsZr5NcOJiMa3Hjw==
X-Google-Smtp-Source: AK7set8ZUVXnb5RaGJeuzAkV/kaxqLGpmyynIyw+QVd/NvCIFUm2vr0tQYrFNsqR2QE0ZTRjSFicbw==
X-Received: by 2002:a6b:1492:0:b0:719:fd3a:395 with SMTP id
 140-20020a6b1492000000b00719fd3a0395mr3098157iou.12.1675038547042; 
 Sun, 29 Jan 2023 16:29:07 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 q4-20020a02c8c4000000b00363d6918540sm1676570jao.171.2023.01.29.16.29.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 16:29:06 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 29 Jan 2023 17:28:53 -0700
Message-Id: <20230130002854.2300661-9-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130002854.2300661-1-james.hilliard1@gmail.com>
References: <20230130002854.2300661-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lPo2caT/Qk9I55HDQ4CVmheHkQXXghXLguf3bXHCNj4=;
 b=L3g15v2tS1WKOGwVIFpBr7QOPmRPGRHozvrZhwkVAxYONASS9HpM44m6r7W//BsgYo
 GZ8hIzbX3Gg6fbT3y2j12lWoTk5waWgi6CPIPiFDMz3pmhJGndYU4uhvhXZ6tds7cq8V
 VQPxA55oE3uqwzFcBskN/NkDO2jIwbU+dU9FJvrX7807eyOKBm4g84Daf3K8LjsXGP/6
 QZUsVgVkk8eADshmLsUlE2cQtWQhajdY/7BkBNLRXS95poVtq+173SqNkYBHkRssysWi
 l3JNcPCbJK0LJr9fINd1LQZi//Qj+sGzH04Ucm1/R07prHg/KPmNZIrcpIF0Jt1KtUZt
 H6EA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=L3g15v2t
Subject: [Buildroot] [PATCH v5 09/10] package/farmhash: new package
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
index dcd7513a87..12d4dc2014 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2725,6 +2725,7 @@ F:	package/ti-gfx/
 
 N:	Stefan Hager <stefan.hager@ginzinger.com>
 F:	package/cpuinfo/
+F:	package/farmhash/
 F:	package/fp16/
 F:	package/fft2d/
 F:	package/gemmlowp/
diff --git a/package/Config.in b/package/Config.in
index 115659256f..e79f6fe28f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2011,6 +2011,7 @@ menu "Other"
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

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97643C54EAA
	for <buildroot@archiver.kernel.org>; Fri, 27 Jan 2023 14:13:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E13C41D6B;
	Fri, 27 Jan 2023 14:13:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E13C41D6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bvlypbD3tjXa; Fri, 27 Jan 2023 14:13:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E195541D59;
	Fri, 27 Jan 2023 14:13:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E195541D59
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2D8591BF977
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 14:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04A6B41D59
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 14:11:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04A6B41D59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K4FsWSFqCkZs for <buildroot@lists.busybox.net>;
 Fri, 27 Jan 2023 14:11:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E1F141D2D
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3E1F141D2D
 for <buildroot@buildroot.org>; Fri, 27 Jan 2023 14:11:09 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id 203so1936306iou.13
 for <buildroot@buildroot.org>; Fri, 27 Jan 2023 06:11:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qzmqLvImvYb2mjB6UNIoicAS51hLtjMPrlUkvW2lL6o=;
 b=37VlHGx5muRiZ4qhJ4/BJPKtx85HIXUlD8rihUoXrNsg6dCxlFhbo/sFBsS9CR1rT7
 uH4TBFywe9LKb4nlGkY21cwxmnIHMkOj9vl/lqDN/sqmxMjOazIWJydZjHLexjABAPKE
 arvGeHSqcB71lf6/Nf2xdV7AAMGW9U+li6uSaLhw+muI3sbktg3Q0j8UCtyh8oRnSvUR
 7f4HFRItPAYUHBZNerjBBE/z0233gK8VSDDAB0Mok1MTPjTAIcS+kcYoUYAmecnyVXF6
 q/7SuGRlz0CRYGJCv2ROIXrn4DodHNKo73gwLAvfET/NrYFBIiy+bLfzAHn0v64r7mzs
 g+yw==
X-Gm-Message-State: AFqh2kqE0M8mq5E3uw746h9E1E2u14pW5B0HvRS8Keg2/c5XZts38CiB
 BDv4XowiLmDr2CTTDldtDy7/d9RKinUUhw==
X-Google-Smtp-Source: AMrXdXt+IW1Gt/he/g2X9Yg2517zXpUvdEtsHqAeAaKHUL4BzjubWvm9qqVpw6sv/VkOacXNYlv7Ng==
X-Received: by 2002:a6b:4410:0:b0:6d4:264f:2427 with SMTP id
 r16-20020a6b4410000000b006d4264f2427mr26651417ioa.21.1674828668678; 
 Fri, 27 Jan 2023 06:11:08 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 n2-20020a6bed02000000b006d8b7bcaa6esm1290806iog.4.2023.01.27.06.11.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 06:11:08 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 27 Jan 2023 07:10:57 -0700
Message-Id: <20230127141058.2180747-12-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127141058.2180747-1-james.hilliard1@gmail.com>
References: <20230127141058.2180747-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qzmqLvImvYb2mjB6UNIoicAS51hLtjMPrlUkvW2lL6o=;
 b=BRWn8h442cwhr7TKF9iq6WlQFuCJnw1NLLOqTXPoxIMkpQ9M7iw4LORdqr83GVzvyU
 cxosIM685/Y5YZ22tbA24vCXy/cLSitXBglU/p0we3wJW9VcR9oCotFw6CJSpAsfspjI
 pYiAlLhA7RnApNu32YW1jt5srtR+HJIa3H9ZqHLijuUtv6U4P3FgGV36C6+cEk9P4fGw
 qsiLgrUS6zYuW5b7pN4nDAbMACcBF7Gler7KH/AlaV47UGBpxsXOtuOINP+IG/a3jfHX
 u/30DI7JPUr0+ue0mTVC15i1CgqvRwxBWRzAemJ5UTQ2kCpBCucyZ7AV6r6U34c0D8By
 Nz9w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=BRWn8h44
Subject: [Buildroot] [PATCH v4 12/13] package/farmhash: new package
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
index a9ecf7847f..2afe29be47 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2703,6 +2703,7 @@ F:	package/ti-gfx/
 
 N:	Stefan Hager <stefan.hager@ginzinger.com>
 F:	package/cpuinfo/
+F:	package/farmhash/
 F:	package/fp16/
 F:	package/fft2d/
 F:	package/fxdiv/
diff --git a/package/Config.in b/package/Config.in
index 53f544ef40..a7c7e87c78 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2003,6 +2003,7 @@ menu "Other"
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

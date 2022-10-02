Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 494CFC433F5
	for <buildroot@archiver.kernel.org>; Sun,  2 Oct 2022 08:27:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE4E982AB6;
	Sun,  2 Oct 2022 08:27:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE4E982AB6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oVfiLdzsnYp0; Sun,  2 Oct 2022 08:27:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C955182A72;
	Sun,  2 Oct 2022 08:27:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C955182A72
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 210961BF371
 for <buildroot@lists.busybox.net>; Sun,  2 Oct 2022 08:27:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0947082A72
 for <buildroot@lists.busybox.net>; Sun,  2 Oct 2022 08:27:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0947082A72
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hQDkPy1OOnrB for <buildroot@lists.busybox.net>;
 Sun,  2 Oct 2022 08:27:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC51F82A5D
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CC51F82A5D
 for <buildroot@busybox.net>; Sun,  2 Oct 2022 08:27:05 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id u10so12604908wrq.2
 for <buildroot@busybox.net>; Sun, 02 Oct 2022 01:27:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=/HeSJunFsovD6XM6cqmjPwKvEk29Pu68ldaqjZ8W4cg=;
 b=d6OEPPc9tOa47etNmdYOXyiUpJg5x+3gGObbH9BoBVemTvXi3mlt3lpxphO8b6lCQh
 SIYOevN5LSM2ElXh3FDBX5v2DRtt8uhxuoiLbjJFycvgTTytjLikck1vzF+Uk5hnW4cw
 viMe9HiRCJgxe6uSFDxWb27BuDJvQp1DdtBHqhnubIjWWP+JbfLGTz0Fjc3h31W7VsqI
 P3Ez0C09FI0O6Rqr/w+dFPls1gNyJcfyNgp3vvoNPbwXSsoi2DtLwbcd1a0H2Utppfe3
 y5edTGf1Q/aNeM3T9L420Dnoec4w8IYgscb29EM7bJxRAYcWT2gVKXSF51701l62alV3
 3N9A==
X-Gm-Message-State: ACrzQf0XPFB3prheF/O/qnpnsj29XpjmCMZBhSmp1ldZyujJhzl6ZZzX
 liu/CptuYTFC9f9sv0ixtH7Da9FksM0=
X-Google-Smtp-Source: AMsMyM5DjC2M1+LjAczrgzPl93sJ+LbvRwOLVLytcCzLeo3s/Xqo4RBfN3VzqPbrA1ePLc7ezp0lFQ==
X-Received: by 2002:a5d:5887:0:b0:22b:1255:42e5 with SMTP id
 n7-20020a5d5887000000b0022b125542e5mr10402876wrf.114.1664699223702; 
 Sun, 02 Oct 2022 01:27:03 -0700 (PDT)
Received: from pc-140.home ([2a01:cb15:8043:4b00:ed03:af64:3498:bc20])
 by smtp.gmail.com with ESMTPSA id
 m21-20020a05600c4f5500b003a5f54e3bbbsm14066620wmq.38.2022.10.02.01.27.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Oct 2022 01:27:03 -0700 (PDT)
From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
To: buildroot@busybox.net
Date: Sun,  2 Oct 2022 10:26:51 +0200
Message-Id: <20221002082651.29673-1-guillaume.bressaix@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=/HeSJunFsovD6XM6cqmjPwKvEk29Pu68ldaqjZ8W4cg=;
 b=B2f8ECUEr2mnXvbntxyIx2y0p96XWmfYPeX9bpo9g6GRQ+xbXARaTEj15p7kpxJtGU
 plrckgKGJ0m2gFQwxPBl94sTfUITZL/scLhK3XkB/ryTYCJCiu0PrPMbIteWrgye3LXp
 sllqkuTOC5U+sxfbTmYY4R5j3J1+MaxMAMyaxWvnGnNDCbukU7MGQ//UnYO1xGRGZK4M
 YgnmJ1lcT9ugjyHJvpXieKBNY25rLNktGkzbXs3nLuwyvGmdVl9vOSIMb7jwazGq+RoO
 DH60EShCO/tJffu2SFZBFfQVwoSUfFpG7sfa9vXa3IpLVd3bytg0f0xWOKid+Lu9Z21m
 bwig==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=B2f8ECUE
Subject: [Buildroot] [PATCH v2 1/1] package/python-scipy: bump version to
 1.9.1
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
Cc: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

scipy.tar.xz is no longer released.

A new "python.h" missing header build time failure arised,
it is fixed with a new -I cflag.

New runtime/linking errors appeared on architectures that need
libatomic, an -latomic linker flag solves them

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>

---
Scipy is expected to move to a meson build infrastructure
by the next release
Once 1.9.2 is out, we know we already have my V3-1.9.1 patch
serie that builds "fine" with meson, it involved a minor tweak
(hopefuly solved by this time). The test script no longer did pass though,
this serie is not 100% ready to go
---
 package/python-scipy/python-scipy.hash |  2 +-
 package/python-scipy/python-scipy.mk   | 13 +++++++++++--
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/package/python-scipy/python-scipy.hash b/package/python-scipy/python-scipy.hash
index 0274679c43..1ba239aabf 100644
--- a/package/python-scipy/python-scipy.hash
+++ b/package/python-scipy/python-scipy.hash
@@ -1,5 +1,5 @@
 # Locally generated
-sha256  0140dd24d14ce194fdb3df496c2190f0896ca84ac98bf5d69c3b3fb7bde1a1e9  scipy-1.8.1.tar.xz
+sha256  26d28c468900e6d5fdb37d2812ab46db0ccd22c63baa095057871faa3a498bc9  scipy-1.9.1.tar.gz
 sha256  96599f8ec69a2cc609265eed13fc75090aacb28742260e55ce623788a33da19c  LICENSE.txt
 sha256  37e64a498894ac7c3b070023e3689e954a8ecf8a23b90968d09a455f1b4f7b35  scipy/linalg/src/lapack_deprecations/LICENSE
 sha256  606209a000716c5f66e33e180ce08434b96ed17db4975ab9723c6b5fbcc89609  scipy/ndimage/LICENSE.txt
diff --git a/package/python-scipy/python-scipy.mk b/package/python-scipy/python-scipy.mk
index a8c23c6c88..d45b14c4fa 100644
--- a/package/python-scipy/python-scipy.mk
+++ b/package/python-scipy/python-scipy.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_SCIPY_VERSION = 1.8.1
-PYTHON_SCIPY_SOURCE = scipy-$(PYTHON_SCIPY_VERSION).tar.xz
+PYTHON_SCIPY_VERSION = 1.9.1
+PYTHON_SCIPY_SOURCE = scipy-$(PYTHON_SCIPY_VERSION).tar.gz
 PYTHON_SCIPY_SITE = https://github.com/scipy/scipy/releases/download/v$(PYTHON_SCIPY_VERSION)
 PYTHON_SCIPY_LICENSE = \
 	BSD-3-Clause, \
@@ -36,14 +36,23 @@ PYTHON_SCIPY_INSTALL_STAGING = YES
 PYTHON_SCIPY_SETUP_TYPE = setuptools
 PYTHON_SCIPY_BUILD_OPTS = config_fc --fcompiler=gnu95
 
+PYTHON_SCIPY_CFLAGS = \
+	-I$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)
 PYTHON_SCIPY_LDFLAGS = $(TARGET_LDFLAGS) -shared \
 	-L$(PYTHON3_PATH)/site-packages/numpy/core/lib
 # -lnpyrandom localization
 PYTHON_SCIPY_LDFLAGS += \
 	-L$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/numpy/random/lib
 
+# scipy can use C++11 atomics when available, so we need to link with
+# libatomic for the architectures that need libatomic.
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+PYTHON_SCIPY_LDFLAGS += -latomic
+endif
+
 PYTHON_SCIPY_ENV = \
 	F90=$(TARGET_FC) \
+	CFLAGS="$(PYTHON_SCIPY_CFLAGS)" \
 	LDFLAGS="$(PYTHON_SCIPY_LDFLAGS)"
 
 # Provide system configuration options to numpy distutils extensions, telling
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

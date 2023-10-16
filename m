Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F55ACDB465
	for <buildroot@archiver.kernel.org>; Mon, 16 Oct 2023 20:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E15BD4028D;
	Mon, 16 Oct 2023 20:01:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E15BD4028D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l0nfrbrRF8gk; Mon, 16 Oct 2023 20:01:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C267F40545;
	Mon, 16 Oct 2023 20:01:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C267F40545
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DC1391BF35E
 for <buildroot@lists.busybox.net>; Mon, 16 Oct 2023 20:01:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B473640492
 for <buildroot@lists.busybox.net>; Mon, 16 Oct 2023 20:01:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B473640492
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 66qbKmRp8MYp for <buildroot@lists.busybox.net>;
 Mon, 16 Oct 2023 20:01:08 +0000 (UTC)
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 923E3403ED
 for <buildroot@buildroot.org>; Mon, 16 Oct 2023 20:01:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 923E3403ED
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-99bdeae1d0aso800688666b.1
 for <buildroot@buildroot.org>; Mon, 16 Oct 2023 13:01:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697486466; x=1698091266;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L0I1FLjp9iFgp9LTs1rBD/QiNxNNcae5676q9449gck=;
 b=SFMf8X0YdfqCR21hd5lQBdbrHH++/019ySuh/5bwG0prlv+yvaS02PABus8GDuq12l
 31djpz5xiYOLuMNOtWEt1+wSAZZiEBf4fOg1S7VWN/nwb2pRpCKy+V7Km3xZyowB0nnM
 JaIhXk94LT+5YK0WH+exgyE4o5nSXMlxnkB2dJLSJwzkBhyuyKZP7mXG/TpVQMXi2ytd
 iUKFmZhRm8ZkrrHIHViowW799pmQL2AqmkqinkGCs5w0wwsRdiervkK+W3zo9aaKLjae
 GEmXLH9UssFxrTrsoESdp0CBpUrrSt8rj80xi0Pq0Of6hJM7WXK4yvCSd2J4reqYtGKe
 oCew==
X-Gm-Message-State: AOJu0YxDKmtzfz2tq8go4LFIFOdCCp05tc6SDoYVbaesB4f4UgsgfEDi
 uuuJrsFwd466nBBhyovpYEzVjEP8Mn8=
X-Google-Smtp-Source: AGHT+IE4EAdSF87SH3ga5fpZVhQ6JACAfc3XJ842Y4uQ8m9wZDAWy2GnuLDPHBHkxpCCGZGuLA7/Cw==
X-Received: by 2002:a17:907:3f90:b0:9ae:6a08:6f53 with SMTP id
 hr16-20020a1709073f9000b009ae6a086f53mr63624ejc.63.1697486465897; 
 Mon, 16 Oct 2023 13:01:05 -0700 (PDT)
Received: from localhost.localdomain ([98.128.186.118])
 by smtp.gmail.com with ESMTPSA id
 e7-20020a1709067e0700b009944e955e19sm4605032ejr.30.2023.10.16.13.01.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Oct 2023 13:01:05 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 16 Oct 2023 22:00:55 +0200
Message-Id: <20231016200055.1175594-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697486466; x=1698091266; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=L0I1FLjp9iFgp9LTs1rBD/QiNxNNcae5676q9449gck=;
 b=cEXUHttTkqRTVTqaJU6opHfB31R4keSfrJJ3OT8KAeQIfeIC80q76YnT8e1oWddj9N
 Jh9YrP3tGn9UskrxIIUMEJgh0/nkhJ0KkTP5YEJbg9op/1ZR4CiXp6Qy2a5md+z2jHBu
 y6soBDB1RZjsjgvWP+1QNEb1li1u9LMMapFbPkcKcgIIhCJlWhKITnk4+/mN+YJ86nEy
 1PhO4XUMrh1lddCciMpkoksvknX7CdUt8l1U4zOzxyXqqk1kRoEtgxUnmbh1O47PyWqJ
 +wj9HEiCCDXU8aPvsJ9TrBMnZv4jGpD6G1MtqL+3MIt9zARnmzc6z2Zg2ObX20EDDQRc
 E8Lg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cEXUHttT
Subject: [Buildroot] [PATCH 1/1] package/libnet: bump to v1.3
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
Cc: Joachim Wiberg <troglobit@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changes:
 - Major upgrade, no API or ABI breaking changes (that we know of).
   https://github.com/libnet/libnet/releases/tag/v1.3

Packaging:
 - Verified builds on *all* test-pkg archs & toolchains
 - Verified test-pkg also with ngrep, suricata, and mz
 - Drop backported int64_t patch
 - Disable doxygen (html docs) in build
 - sha256sum of tarball now generated upstream

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 ...d-of-__int64_t-for-mingw-cross-build.patch | 31 -------------------
 package/libnet/libnet.hash                    |  6 ++--
 package/libnet/libnet.mk                      |  3 +-
 3 files changed, 5 insertions(+), 35 deletions(-)
 delete mode 100644 package/libnet/0001-Use-standard-int64_t-instead-of-__int64_t-for-mingw-cross-build.patch

diff --git a/package/libnet/0001-Use-standard-int64_t-instead-of-__int64_t-for-mingw-cross-build.patch b/package/libnet/0001-Use-standard-int64_t-instead-of-__int64_t-for-mingw-cross-build.patch
deleted file mode 100644
index 793b3069c8..0000000000
--- a/package/libnet/0001-Use-standard-int64_t-instead-of-__int64_t-for-mingw-cross-build.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From a1659e261888bdbed51803132d52d9a6c6803c8a Mon Sep 17 00:00:00 2001
-From: Joachim Nilsson <troglobit@gmail.com>
-Date: Sat, 19 Oct 2019 12:26:26 +0200
-Subject: [PATCH] Use standard int64_t instead of __int64_t for mingw cross
- build
-
-Signed-off-by: Joachim Nilsson <troglobit@gmail.com>
-[Retrieved from:
-https://github.com/libnet/libnet/commit/a1659e261888bdbed51803132d52d9a6c6803c8a]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- include/libnet/libnet-structures.h | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/include/libnet/libnet-structures.h b/include/libnet/libnet-structures.h
-index 6084caa..34fffc6 100644
---- a/include/libnet/libnet-structures.h
-+++ b/include/libnet/libnet-structures.h
-@@ -49,9 +49,9 @@ struct libnet_port_list_chain
- /* libnet statistics structure */
- struct libnet_stats
- {
--    __int64_t packets_sent;               /* packets sent */
--    __int64_t packet_errors;              /* packets errors */
--    __int64_t bytes_written;              /* bytes written */
-+    int64_t packets_sent;               /* packets sent */
-+    int64_t packet_errors;              /* packets errors */
-+    int64_t bytes_written;              /* bytes written */
- };
- 
- 
diff --git a/package/libnet/libnet.hash b/package/libnet/libnet.hash
index 6962ffc83f..5462b4f2e6 100644
--- a/package/libnet/libnet.hash
+++ b/package/libnet/libnet.hash
@@ -1,5 +1,5 @@
-# From https://github.com/libnet/libnet/releases/download/v1.2/libnet-1.2.tar.gz.md5
-md5  a36c669e0cdfda6a2aa3adfb1f6fe60a  libnet-1.2.tar.gz
+# From https://github.com/libnet/libnet/releases/
+sha256 ad1e2dd9b500c58ee462acd839d0a0ea9a2b9248a1287840bc601e774fb6b28f  libnet-1.3.tar.gz
+
 # Locally computed
-sha256  caa4868157d9e5f32e9c7eac9461efeff30cb28357f7f6bf07e73933fb4edaa7  libnet-1.2.tar.gz
 sha256  a06f600f67f239898d85f083aeed82ce6015b1c57599ab1def00fb68787ef388  LICENSE
diff --git a/package/libnet/libnet.mk b/package/libnet/libnet.mk
index a5a814f4d2..e9124abd30 100644
--- a/package/libnet/libnet.mk
+++ b/package/libnet/libnet.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNET_VERSION = 1.2
+LIBNET_VERSION = 1.3
 LIBNET_SITE = \
 	https://github.com/libnet/libnet/releases/download/v$(LIBNET_VERSION)
 LIBNET_INSTALL_STAGING = YES
@@ -14,5 +14,6 @@ LIBNET_LICENSE = BSD-2-Clause, BSD-3-Clause
 LIBNET_LICENSE_FILES = LICENSE
 LIBNET_CPE_ID_VENDOR = libnet_project
 LIBNET_CONFIG_SCRIPTS = libnet-config
+LIBNET_CONF_OPTS = --disable-doxygen-doc
 
 $(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 843E6C433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Dec 2021 17:17:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1432860FE4;
	Wed, 22 Dec 2021 17:17:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N--LV-lybtn6; Wed, 22 Dec 2021 17:17:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7177C60FD1;
	Wed, 22 Dec 2021 17:17:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CFFB41BF27E
 for <buildroot@lists.busybox.net>; Wed, 22 Dec 2021 17:17:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BFB9A40260
 for <buildroot@lists.busybox.net>; Wed, 22 Dec 2021 17:17:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GN4mxLsFV5YY for <buildroot@lists.busybox.net>;
 Wed, 22 Dec 2021 17:17:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 64AD340224
 for <buildroot@buildroot.org>; Wed, 22 Dec 2021 17:17:06 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id t18so6223729wrg.11
 for <buildroot@buildroot.org>; Wed, 22 Dec 2021 09:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OOLxziOuQ50wGgFk5DPhw9t2FLUR9h66F7D58yIIF6Q=;
 b=W89SK5d0prfjgSpIjpWQ1LK+BhqTcwqBLQWgEF+ZhYx2DK54zP3lf7j3U7DxZBzIHu
 VC+ieO2auTBq3RWUhqs9gbIVQszt0dqjSrSgI7UgRLAXLwdx8DvcYHXx1hYCCtyPNj8k
 yZE7Q9Nd9Xj6sVFBz2Qpp1VhvgVbsHZ+FK+VVEyVq+WUb6hNjusl/fBqk/03/hhEa50a
 e3E4WjgeP+y+SbDIaGRkmDZCZZEErwsF1jzowcPBAR73H75MgFXyitNkHMyXCNbjjrMh
 QJRFKmbEQGYPmefvn7cFtKQ5iligw7qZuSTe9hEXU3P9OSJR/JbNLfGVH38w98ioDiYC
 7fUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OOLxziOuQ50wGgFk5DPhw9t2FLUR9h66F7D58yIIF6Q=;
 b=dh2M/7rWdMx8BvTsk/swgQHLheaw4h7qiKpNs9pT6jMjvBIQnTeWzDn6IZXFFO93kS
 Y4FwuLMSsKOBbvoMF3kF+hQ+lNxkU11/FXswkmTXNhj+HggarrKEGOLnw42cx8VZUg9+
 PMlVIm4sXSgKkcICSe5OW3t8D9WvPrRRZwv3m7ZzL3fMbEO/0I/nYIxmewt1USUjjWbu
 FEiv39p5jGi+V2OWkG187bE4y/l8JJO/iJ/AgH+ACQOf3bi6wXkH4MaogFGB/UtzQ0AP
 CWwJnzUlCtu1/uOWwCz44iT3ADUZ38Eyn5uRXA7D7kqOhZB+BzxNIVMWJDpZKmC3o7bE
 T+jg==
X-Gm-Message-State: AOAM533XOHTTebe4JHHWwphAJoSkMr7rxGdc6d5lpZkt3o/DGx+eLxoT
 1QQOUWnGe5JXdYEnpIpyl6yXiYIfw4M9qA==
X-Google-Smtp-Source: ABdhPJw0vtLmlbBKkFQ/kC+11ZMQ2PNCgJcqR0/4oj+0ZmTHlALR08wk+7Ne+uJy0BeZj/bHWUCuvg==
X-Received: by 2002:a05:6000:144a:: with SMTP id
 v10mr2681131wrx.357.1640193424631; 
 Wed, 22 Dec 2021 09:17:04 -0800 (PST)
Received: from debian-noppl.. (62-178-205-20.cable.dynamic.surfer.at.
 [62.178.205.20])
 by smtp.gmail.com with ESMTPSA id o10sm3067454wrc.55.2021.12.22.09.17.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 09:17:04 -0800 (PST)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 22 Dec 2021 18:16:57 +0100
Message-Id: <20211222171658.306816-1-nolange79@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/lttng-tools: bump to version 2.13.2
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
Cc: Norbert Lange <nolange79@gmail.com>,
 Philippe Proulx <eeppeliteloop@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/lttng-tools/0001-configure.ac-add-disable-tests.patch | 4 ++--
 package/lttng-tools/lttng-tools.hash                          | 4 ++--
 package/lttng-tools/lttng-tools.mk                            | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/lttng-tools/0001-configure.ac-add-disable-tests.patch b/package/lttng-tools/0001-configure.ac-add-disable-tests.patch
index f569c7ec70..4bc9239c3d 100644
--- a/package/lttng-tools/0001-configure.ac-add-disable-tests.patch
+++ b/package/lttng-tools/0001-configure.ac-add-disable-tests.patch
@@ -23,8 +23,8 @@ index 04f9cef4..372cdf3d 100644
 +	      [Disable the build of the test components]))
  
  
- # Always build libconfig since it a dependency of libcommon
-@@ -1027,6 +1029,7 @@ AM_CONDITIONAL([BUILD_BIN_LTTNG_SESSIOND], [test x$enable_bin_lttng_sessiond !=
+ build_lib_consumer=no
+@@ -1013,6 +1015,7 @@ AM_CONDITIONAL([BUILD_BIN_LTTNG_SESSIOND], [test x$enable_bin_lttng_sessiond !=
  
  # Export the tests and extras build conditions.
  AS_IF([\
diff --git a/package/lttng-tools/lttng-tools.hash b/package/lttng-tools/lttng-tools.hash
index a94ecc4a35..5b5f55da30 100644
--- a/package/lttng-tools/lttng-tools.hash
+++ b/package/lttng-tools/lttng-tools.hash
@@ -1,5 +1,5 @@
-# From https://lttng.org/files/lttng-tools/lttng-tools-2.12.3.tar.bz2.sha256
-sha256  2890da230edd523fcf497e9eb28133b7606d64fa01bcbffadbfcba42104db153  lttng-tools-2.12.3.tar.bz2
+# From https://lttng.org/files/lttng-tools/lttng-tools-2.13.2.tar.bz2.sha256
+sha256  ced2ba00020da77fd17ac92b5a53825502409a07e3aeca28f9515d4a844fd7bd  lttng-tools-2.13.2.tar.bz2
 
 # Locally computed
 sha256  068e55c7dbe597400199aee75ac5e71bdb2ca88c4c9a4cfa8e1fbc61f933eda5  LICENSE
diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
index fdc5c33bd2..efa22a52e3 100644
--- a/package/lttng-tools/lttng-tools.mk
+++ b/package/lttng-tools/lttng-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTTNG_TOOLS_VERSION = 2.12.3
+LTTNG_TOOLS_VERSION = 2.13.2
 LTTNG_TOOLS_SITE = https://lttng.org/files/lttng-tools
 LTTNG_TOOLS_SOURCE = lttng-tools-$(LTTNG_TOOLS_VERSION).tar.bz2
 LTTNG_TOOLS_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

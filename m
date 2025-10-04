Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE00CAC5BB
	for <buildroot@archiver.kernel.org>; Sat,  4 Oct 2025 12:17:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07C5C83B67;
	Sat,  4 Oct 2025 12:17:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e46kvQqPfhlq; Sat,  4 Oct 2025 12:17:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E506A8227A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E506A8227A;
	Sat,  4 Oct 2025 12:17:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E146909
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 12:17:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4433E8227A
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 12:17:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ESggCZ_yf0Iw for <buildroot@buildroot.org>;
 Sat,  4 Oct 2025 12:17:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 464FE83774
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 464FE83774
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 464FE83774
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 12:17:08 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a03c3.dip0.t-ipconnect.de [91.58.3.195])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E12BCA4C5BF4
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 14:17:05 +0200 (CEST)
Received: from [192.168.1.144] (port=43086 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v51CD-000000002GY-2GaQ
 for buildroot@buildroot.org; Sat, 04 Oct 2025 12:17:05 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  4 Oct 2025 14:17:05 +0200
Message-ID: <20251004121705.1972951-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1759580225;
 bh=TCINBaTsNIELZafBGJ3UyhxEACbJdhUVkd/W7WaJWEw=;
 h=From:To:Subject:Date:From;
 b=u4omlF/yTtyJKi9PnEheG5HTvoZ8dTiFSL6rlJrkHuliXB15x8/NcfzPCANovcB7s
 cOGu0mGodjcXfx2mXWl7ZfWmnMHIOMyyQZ38bKokb627h1c0jZ6a7rFSqHIiYZRpBL
 GpaT8vVAPP0YmzuZICntUdkeXZm/NNah+ZGPXWe1fzNRTrCKlDU83pD1IxTZeEUy30
 w8cOHNO6RVtCd2rRr1Spl0DC5xssMUPRryoOE08I4tkBqPdJRucIQMk9SBJm94wZDx
 aMmSK5GkPuBzJIgHAPjLxItsC7iOSBs4i4HtXS399qzUPTL412T29/uYUOAvH0bJVZ
 AVWVfHol2xbLw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=u4omlF/y
Subject: [Buildroot] [PATCH v2 1/1] package/libao: bump version to 1.2.2
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

Added upstream patch to fix a missing include, autobuild did not record
any build errors but Arch Linux provides the patch:
https://gitlab.archlinux.org/archlinux/packaging/packages/libao/-/commit/bad3196d4e3030d31b01eb3bd41fff8afc8ca113

Switched to gitlab tarball because the previous site does not provide a
tarball for version 1.2.2 which was tagged in 2016:
https://gitlab.xiph.org/xiph/libao/-/tags/1.2.2

Added autoreconf due to usage of gitlab tarball which does not contain
a configure script.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: added patch 0001

 ...issing-include-warning-for-nanosleep.patch | 27 +++++++++++++++++++
 package/libao/libao.hash                      |  6 ++---
 package/libao/libao.mk                        |  5 ++--
 3 files changed, 32 insertions(+), 6 deletions(-)
 create mode 100644 package/libao/0001-pulse-fix-missing-include-warning-for-nanosleep.patch

diff --git a/package/libao/0001-pulse-fix-missing-include-warning-for-nanosleep.patch b/package/libao/0001-pulse-fix-missing-include-warning-for-nanosleep.patch
new file mode 100644
index 0000000000..162eec730f
--- /dev/null
+++ b/package/libao/0001-pulse-fix-missing-include-warning-for-nanosleep.patch
@@ -0,0 +1,27 @@
+From 1f998f5d6d77674dad01b181811638578ad68242 Mon Sep 17 00:00:00 2001
+From: Tristan Matthews <tmatth@videolan.org>
+Date: Sun, 15 Jan 2017 12:15:07 -0500
+Subject: [PATCH] pulse: fix missing include warning for nanosleep
+
+Upstream: https://gitlab.xiph.org/xiph/libao/-/commit/1f998f5d6d77674dad01b181811638578ad68242
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/plugins/pulse/ao_pulse.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/plugins/pulse/ao_pulse.c b/src/plugins/pulse/ao_pulse.c
+index 9835273..2d10d57 100644
+--- a/src/plugins/pulse/ao_pulse.c
++++ b/src/plugins/pulse/ao_pulse.c
+@@ -30,6 +30,7 @@
+ #include <assert.h>
+ #include <string.h>
+ #include <signal.h>
++#include <time.h>
+ #include <limits.h>
+ 
+ #include <pulse/pulseaudio.h>
+-- 
+GitLab
+
diff --git a/package/libao/libao.hash b/package/libao/libao.hash
index 91c6bd11a7..70e6b4987e 100644
--- a/package/libao/libao.hash
+++ b/package/libao/libao.hash
@@ -1,5 +1,3 @@
-# From http://downloads.xiph.org/releases/ao/SHA256SUMS.txt
-sha256  03ad231ad1f9d64b52474392d63c31197b0bc7bd416e58b1c10a329a5ed89caf  libao-1.2.0.tar.gz
-
-# Hash for license file:
+# Locally computed
+sha256  df8a6d0e238feeccb26a783e778716fb41a801536fe7b6fce068e313c0e2bf4d  libao-1.2.2.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/libao/libao.mk b/package/libao/libao.mk
index 19a4c165c6..a9fd739ff3 100644
--- a/package/libao/libao.mk
+++ b/package/libao/libao.mk
@@ -4,13 +4,14 @@
 #
 ################################################################################
 
-LIBAO_VERSION = 1.2.0
-LIBAO_SITE = http://downloads.xiph.org/releases/ao
+LIBAO_VERSION = 1.2.2
+LIBAO_SITE = https://gitlab.xiph.org/xiph/libao/-/archive/$(LIBAO_VERSION)
 LIBAO_DEPENDENCIES = host-pkgconf
 LIBAO_INSTALL_STAGING = YES
 LIBAO_LICENSE = GPL-2.0+
 LIBAO_LICENSE_FILES = COPYING
 LIBAO_CPE_ID_VENDOR = xiph
+LIBAO_AUTORECONF = YES
 LIBAO_CONF_OPTS = \
 	--disable-esd \
 	--disable-wmm \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

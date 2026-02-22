Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67AC4C636B3
	for <buildroot@archiver.kernel.org>; Sun, 22 Feb 2026 19:29:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13B1A83926;
	Sun, 22 Feb 2026 19:29:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HifQ3KgxYNu9; Sun, 22 Feb 2026 19:29:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CE2083D6F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771788544;
	bh=sDvqCBT0DVWtX+fby35ALZuMriEveWCz5EuvafkMWA0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YQIvVI3RV9ZIEa0dhEbqJ9SyA10Qw/kv8rlQRWjIhU4ck+bsFjrE3f9tig5QwhdY1
	 YFGykGKDCYCMEZ/i2G3RqRVpek4CDb+mHu1ntZlizAYHadT1qaljYA6ZIftPbvDSx2
	 cruf9Nm4bj0plttWANyU7kGOXhGOpVOWE4Z5sanzm364bUG9J+8QdBDuwyi0bYjsvw
	 bMuO69J7RVSmE15QZaiwAX9fQC8b+kRSaRffxnQRKS02/OU4Q57w2o368timH6XQ+R
	 eopAx0n1Z9OQyJBkMfXy0EsWAURzqMzoTo1e0pvml8Fn8r17SRpsgPZ71gp4yUx/OW
	 lRXXNFrCL4j0g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CE2083D6F;
	Sun, 22 Feb 2026 19:29:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D099B1CE
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 19:29:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B677240C91
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 19:29:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sUKMMXgKMbCf for <buildroot@buildroot.org>;
 Sun, 22 Feb 2026 19:29:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9C16840C7D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C16840C7D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9C16840C7D
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 19:29:01 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0c16.dip0.t-ipconnect.de [91.58.12.22])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B8080A4C19F5;
 Sun, 22 Feb 2026 20:28:58 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35114)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vuF8U-000000003ti-2rU0;
 Sun, 22 Feb 2026 19:28:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Philipp Richter <richterphilipp.pops@gmail.com>
Date: Sun, 22 Feb 2026 20:28:58 +0100
Message-ID: <20260222192858.593255-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1771788538;
 bh=7Ft0oloK4YmWGuEhf/AXPgvGCYxXETH/9BCsy27Vv7A=;
 h=From:To:Cc:Subject:Date:From;
 b=mPKLY879LB+LnpcQoz3w0F6yqSeSt0zrtabf0IKzgBUKJkbX3yKUds4PIf6+lWGpV
 SzpS91POU+BLGQe3ix2AqktoQZZpatWEYatonwYIIEV5hdIvI3dyNEXodFYmItDIEr
 Lmo0qFoKd+lqD7QBBQmbJMhmx03Oeb2GmJhxs8pgZP+F//1Lbjzy2AmGu52Q9HdCxM
 Hkao0Ra1jHQHzxmN8VnRdbqnW1YeWOFzUlAuuyxgHlxzAQ8LGK9UVE3U3YKBthgUKt
 yufL8X5juKAgMXk0GbBoee6gToiKvWM8z0vuid71hUtXWQF9ODq2TFNQWqgm0sz8nT
 q72m3pZs0SvSw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=mPKLY879
Subject: [Buildroot] [PATCH 1/1] package/libtorrent-rasterbar: fix build for
 host arch = target arch
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

The following defconfig

  BR2_PACKAGE_LIBTORRENT_RASTERBAR=y

is the only broken one according to "utils/test-pkg -a":

  bootlin-x86-64-glibc [25/32]: FAILED

  32 builds, 4 skipped, 1 build failed, 0 legal-info failed, 0 show-info
  failed

on a x86_64 host because on all other archs a runtime configure test
with a cross-compiled target binary fails:

./configure: line 21141: ./cpp_standard: cannot execute binary file:
 Exec format error

and configure in this case continues to assume c++11 support:

  checking whether /home/bernd/buildroot/test-libtorrent-rasterbar/bootlin-aarch64-glibc-old/host/bin/aarch64-linux-g++
   supports C++11 features with -std=c++11... yes

while on the forementioned x86_64 host the cross-compiled target binary
works:

  $ ./cpp_standard
  17

and configure further tests for c++17 which fails due to c++11 being
forced by TARGET_CXXFLAGS:

  checking whether /home/bernd/buildroot/test-libtorrent-rasterbar/bootlin-x86-64-glibc/host/bin/x86_64-linux-g++
   supports C++17 features with -std=c++17... no

The problem occurs since upstream commit
https://github.com/arvidn/libtorrent/commit/b7e02cc700d884f87a18a3bc59f95a66a5cb0209
added to version 1.2.13 which was bumped in buildroot back in 2021 with
commit 2cecfe94f889165f3a5169598ed7e0388941a6cd

Fixes:
https://autobuild.buildroot.net/results/8c8/8c8a35052ce03871e94d4fdd3806feeebe61ce40/

The oldest build error dates back to July 2024:
https://autobuild.buildroot.net/results/3ee/3ee7753c2c5522c0075091b1d3c79ed9dffe6f40//

All present build errors occur when host arch = target arch:
https://autobuild.buildroot.net/?reason=libtorrent-rasterbar-1.2.19

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libtorrent-rasterbar/libtorrent-rasterbar.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/libtorrent-rasterbar/libtorrent-rasterbar.mk b/package/libtorrent-rasterbar/libtorrent-rasterbar.mk
index 6b497bbe58..e95877d28d 100644
--- a/package/libtorrent-rasterbar/libtorrent-rasterbar.mk
+++ b/package/libtorrent-rasterbar/libtorrent-rasterbar.mk
@@ -16,7 +16,15 @@ LIBTORRENT_RASTERBAR_INSTALL_STAGING = YES
 LIBTORRENT_RASTERBAR_CONF_OPTS = \
 	--with-boost-libdir=$(STAGING_DIR)/usr/lib \
 	--disable-invariant-checks
-LIBTORRENT_RASTERBAR_CXXFLAGS = $(TARGET_CXXFLAGS) -std=c++11
+LIBTORRENT_RASTERBAR_CXXFLAGS = $(TARGET_CXXFLAGS)
+
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_8),y)
+LIBTORRENT_RASTERBAR_CONF_OPTS += --with-cxx-standard=17
+else ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_5),y)
+LIBTORRENT_RASTERBAR_CONF_OPTS += --with-cxx-standard=14
+else
+LIBTORRENT_RASTERBAR_CONF_OPTS += --with-cxx-standard=11
+endif
 
 # Internal error, aborting at dwarf2cfi.c:2802 in connect_traces
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58864
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

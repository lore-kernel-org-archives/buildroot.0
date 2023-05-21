Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FBBCC77B7C
	for <buildroot@archiver.kernel.org>; Sun, 21 May 2023 15:12:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E1FC82CB7;
	Sun, 21 May 2023 15:12:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E1FC82CB7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XnffqA6vDAhd; Sun, 21 May 2023 15:12:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A578982893;
	Sun, 21 May 2023 15:12:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A578982893
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E55891BF3CD
 for <buildroot@lists.busybox.net>; Sun, 21 May 2023 15:12:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BED79405F5
 for <buildroot@lists.busybox.net>; Sun, 21 May 2023 15:12:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BED79405F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WCsTPjy0wP43 for <buildroot@lists.busybox.net>;
 Sun, 21 May 2023 15:12:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DAA5E4011B
 for <buildroot@buildroot.org>; Sun, 21 May 2023 15:12:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DAA5E4011B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C3B4A866C3; Sun, 21 May 2023 15:12:46 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 21 May 2023 16:23:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 603df32a0cd416caa2d2688008cb87f14ad68ef3
X-Git-Newrev: 1e0e8540eb221aa4946274ee8e63dac32c8d4637
X-Patchwork-Hint: ignore
Message-Id: <20230521151246.C3B4A866C3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libpqxx: needs C++17
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1e0e8540eb221aa4946274ee8e63dac32c8d4637
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libpqxx's v7.x series requires C++17 support. Adjust the configuration
selection to require a newer toolchain, as well as force a C++17
standard to ensure libpqxx's custom C++ standard check [1] passes.

Fixes:
 - http://autobuild.buildroot.net/results/a79cb93aec74acc8e32809530c09e26bebaf16e4/
 - http://autobuild.buildroot.net/results/ae1a02b5238b650cdc79edb298c398b078882cfc/

[1]: https://github.com/jtv/libpqxx/blob/7.7.5/configure.ac#L106-L124

Signed-off-by: James Knight <james.d.knight@live.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libpqxx/Config.in  | 6 +++---
 package/libpqxx/libpqxx.mk | 4 +++-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/libpqxx/Config.in b/package/libpqxx/Config.in
index d06451d792..f5fe2b3807 100644
--- a/package/libpqxx/Config.in
+++ b/package/libpqxx/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_LIBPQXX
 	bool "libpqxx"
 	depends on BR2_PACKAGE_POSTGRESQL
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
 	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  libpqxx is the official C++ client API for PostgreSQL, the
@@ -10,8 +10,8 @@ config BR2_PACKAGE_LIBPQXX
 
 	  http://pqxx.org/development/libpqxx/
 
-comment "libpqxx needs toolchain w/ C++, gcc >= 4.9, threads"
+comment "libpqxx needs toolchain w/ C++, gcc >= 7, threads"
 	depends on BR2_PACKAGE_POSTGRESQL
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
 		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libpqxx/libpqxx.mk b/package/libpqxx/libpqxx.mk
index b280f5a52a..434cefd069 100644
--- a/package/libpqxx/libpqxx.mk
+++ b/package/libpqxx/libpqxx.mk
@@ -11,6 +11,8 @@ LIBPQXX_DEPENDENCIES = postgresql
 LIBPQXX_LICENSE = BSD-3-Clause
 LIBPQXX_LICENSE_FILES = COPYING
 
-LIBPQXX_CONF_ENV += ac_cv_path_PG_CONFIG=$(STAGING_DIR)/usr/bin/pg_config
+LIBPQXX_CONF_ENV = \
+	ac_cv_path_PG_CONFIG=$(STAGING_DIR)/usr/bin/pg_config \
+	CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++17"
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

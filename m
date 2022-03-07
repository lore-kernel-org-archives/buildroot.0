Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46DB5C433F5
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 22:10:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BE8241747;
	Mon,  7 Mar 2022 22:10:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CAQ6wRoBRFIY; Mon,  7 Mar 2022 22:10:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3080F41745;
	Mon,  7 Mar 2022 22:10:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6B70A1BF982
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 22:09:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 676E740734
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 22:09:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mLbHl0o7zp77 for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 22:09:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A69BB404F3
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 22:09:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id CB48E82941; Mon,  7 Mar 2022 22:01:26 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 7 Mar 2022 22:52:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1e1976a25d2a967759fddb747a074343678b42ef
X-Git-Newrev: d4811802acbd16488adc32a7e340067700cec85c
X-Patchwork-Hint: ignore
Message-Id: <20220307220126.CB48E82941@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/osm2pgsql: disable external fmt
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

commit: https://git.buildroot.net/buildroot/commit/?id=d4811802acbd16488adc32a7e340067700cec85c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

osm2pgsql doesn't support fmt > 8.0 yet resulting in the following build
failure since bump of fmt to version 8.1.1 in commit
ec7fd50d08690a383fec40748ac9b78c3f764316:

/home/buildroot/autobuild/instance-0/output-1/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/fmt/core.h:1728:7: error: static assertion failed: Cannot format an argument. To make type T formattable provide a formatter<T> specialization: https://fmt.dev/latest/api.html#udt
 1728 |       formattable,
      |       ^~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/5af1a0ea176559a5dc787ba945a3a83823f5b1bb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/osm2pgsql/Config.in    | 5 ++---
 package/osm2pgsql/osm2pgsql.mk | 5 +++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/osm2pgsql/Config.in b/package/osm2pgsql/Config.in
index 315f496d8e..e903e92c49 100644
--- a/package/osm2pgsql/Config.in
+++ b/package/osm2pgsql/Config.in
@@ -1,17 +1,16 @@
 config BR2_PACKAGE_OSM2PGSQL
 	bool "osm2pgsql"
-	depends on BR2_INSTALL_LIBSTDCPP # boost, fmt, libosmium, protozero
+	depends on BR2_INSTALL_LIBSTDCPP # boost, libosmium, protozero
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
 	depends on BR2_TOOLCHAIN_HAS_THREADS # boost, libosmium
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-filesystem
-	depends on BR2_USE_WCHAR # boost, fmt, libosmium
+	depends on BR2_USE_WCHAR # boost, libosmium
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::future
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BZIP2
 	select BR2_PACKAGE_EXPAT
-	select BR2_PACKAGE_FMT
 	select BR2_PACKAGE_LIBOSMIUM
 	select BR2_PACKAGE_PROTOZERO
 	select BR2_PACKAGE_ZLIB
diff --git a/package/osm2pgsql/osm2pgsql.mk b/package/osm2pgsql/osm2pgsql.mk
index b00976d28b..d389fff590 100644
--- a/package/osm2pgsql/osm2pgsql.mk
+++ b/package/osm2pgsql/osm2pgsql.mk
@@ -10,12 +10,13 @@ OSM2PGSQL_LICENSE = GPL-2.0+
 OSM2PGSQL_LICENSE_FILES = COPYING
 OSM2PGSQL_SUPPORTS_IN_SOURCE_BUILD = NO
 
-OSM2PGSQL_DEPENDENCIES = boost bzip2 expat fmt libosmium postgresql protozero zlib
+OSM2PGSQL_DEPENDENCIES = boost bzip2 expat libosmium postgresql protozero zlib
 
+# fmt > 8.0 is not yet supported
 OSM2PGSQL_CONF_OPTS = \
 	-DBUILD_TESTS=OFF \
 	-DBUILD_COVERAGE=OFF \
-	-DEXTERNAL_FMT=ON \
+	-DEXTERNAL_FMT=OFF \
 	-DEXTERNAL_LIBOSMIUM=ON \
 	-DEXTERNAL_PROTOZERO=ON
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

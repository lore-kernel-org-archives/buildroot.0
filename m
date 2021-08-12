Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98BACC4320A
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:23:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E94860FE6
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:23:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5E94860FE6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A4B180BE9;
	Thu, 26 Aug 2021 22:23:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xik0tNBlPtjB; Thu, 26 Aug 2021 22:23:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C325D81A47;
	Thu, 26 Aug 2021 22:23:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 16AAA1BF33E
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:03:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D482F40795
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7lxhCxe1Fn0j for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 22:02:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 849CA4079D
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 22:02:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id E72B38DC50; Thu, 26 Aug 2021 22:01:28 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 12 Aug 2021 23:39:54 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3d8ce1975ff90f06818e74aa9b6a0c8ecc6f3d2d
X-Git-Newrev: 6c4aee714f5bf5d40365d2677b5a9cd35b66b849
X-Patchwork-Hint: ignore
Message-Id: <20210826220128.E72B38DC50@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/osm2pgsql: needs
 std::future
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=6c4aee714f5bf5d40365d2677b5a9cd35b66b849
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

osm2pgsql needs std::future since its addition in commit
46c42042867e672eb21b386eb5e29747c30e80ca to avoid the following build
failure:

In file included from /home/buildroot/autobuild/run/instance-3/output-1/build/osm2pgsql-1.4.2/src/db-copy.cpp:12:0:
/home/buildroot/autobuild/run/instance-3/output-1/build/osm2pgsql-1.4.2/src/db-copy.hpp:218:24: error: field 'barrier' has incomplete type
     std::promise<void> barrier;
                        ^
/home/buildroot/autobuild/run/instance-3/output-1/build/osm2pgsql-1.4.2/src/db-copy.hpp: In constructor 'db_cmd_sync_t::db_cmd_sync_t(std::promise<void>&&)':
/home/buildroot/autobuild/run/instance-3/output-1/build/osm2pgsql-1.4.2/src/db-copy.hpp:221:37: error: class 'db_cmd_sync_t' does not have any field named 'barrier'
     : db_cmd_t(db_cmd_t::Cmd_sync), barrier(std::move(b))
                                     ^
In file included from /home/buildroot/autobuild/run/instance-3/output-1/build/osm2pgsql-1.4.2/src/middle.hpp:18:0,
                 from /home/buildroot/autobuild/run/instance-3/output-1/build/osm2pgsql-1.4.2/src/dependency-manager.cpp:11:
/home/buildroot/autobuild/run/instance-3/output-1/build/osm2pgsql-1.4.2/src/thread-pool.hpp: In member function 'void thread_pool_t::check_for_exceptions()':
/home/buildroot/autobuild/run/instance-3/output-1/build/osm2pgsql-1.4.2/src/thread-pool.hpp:49:19: error: invalid use of incomplete type 'class std::future<void>'
             result.get();
                   ^

Fixes:
 - http://autobuild.buildroot.org/results/69528232ceba128a2e60aa778bb0943fdefc2ed1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/osm2pgsql/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/osm2pgsql/Config.in b/package/osm2pgsql/Config.in
index 1f1200cf46..f9fafb857c 100644
--- a/package/osm2pgsql/Config.in
+++ b/package/osm2pgsql/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_OSM2PGSQL
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11, libosmium, protozero
 	depends on BR2_TOOLCHAIN_HAS_THREADS # boost, libosmium
 	depends on BR2_USE_WCHAR # boost, fmt, libosmium
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::future
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_BOOST_FILESYSTEM
@@ -24,3 +25,6 @@ config BR2_PACKAGE_OSM2PGSQL
 comment "osm2pgsql needs a toolchain w/ C++,  wchar, threads, gcc >= 4.7"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || !BR2_TOOLCHAIN_HAS_THREADS
+
+comment "osm2pgsql needs a toolchain not affected by GCC bug 64735"
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

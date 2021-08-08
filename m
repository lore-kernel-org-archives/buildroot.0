Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C554C4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 09:55:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B517760F35
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 09:55:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B517760F35
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81E9982C98;
	Sun,  8 Aug 2021 09:55:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id egd-iwwtTois; Sun,  8 Aug 2021 09:55:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7A8182C1E;
	Sun,  8 Aug 2021 09:55:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E27461BF408
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 09:55:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D125D40285
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 09:55:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tTWK0hyhf3dR for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 09:55:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DFB8140200
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 09:55:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 895308B8F6; Sun,  8 Aug 2021 09:54:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 8 Aug 2021 11:31:04 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 2f132f14161410f771298df7fee0188de3148829
X-Git-Newrev: 3c1a3a8b92d0df8cac981fc06f00af2d0120a6b7
X-Patchwork-Hint: ignore
Message-Id: <20210808095442.895308B8F6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/libodb-pqsql: fix
 build with gcc 11
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

commit: https://git.buildroot.net/buildroot/commit/?id=3c1a3a8b92d0df8cac981fc06f00af2d0120a6b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

GCC 11 defaults to C++17. Fix the following build failure with gcc 11:

configure:13698: checking for libodb
configure:13772: /tmp/instance-1/output-1/host/bin/arm-buildroot-linux-gnueabihf-g++ -c -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0 -D_FORTIFY_SOURCE=2 -D_REENTRANT  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 conftest.cpp >&5
In file included from /tmp/instance-1/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/odb/exception.hxx:15,
                 from conftest.cpp:26:
/tmp/instance-1/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/odb/details/shared-ptr/base.hxx:38:49: error: ISO C++17 does not allow dynamic exception specifications
   38 | operator new (std::size_t, odb::details::share) throw (std::bad_alloc);
      |                                                 ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/73b06d7f923e5a7294377951f212b89b6cb0946a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit b62a72a7a75450417596588557cdd5bcb7787cb7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libodb-pgsql/libodb-pgsql.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libodb-pgsql/libodb-pgsql.mk b/package/libodb-pgsql/libodb-pgsql.mk
index 038f7878c0..014116883f 100644
--- a/package/libodb-pgsql/libodb-pgsql.mk
+++ b/package/libodb-pgsql/libodb-pgsql.mk
@@ -12,5 +12,6 @@ LIBODB_PGSQL_LICENSE = GPL-2.0
 LIBODB_PGSQL_LICENSE_FILES = LICENSE
 LIBODB_PGSQL_INSTALL_STAGING = YES
 LIBODB_PGSQL_DEPENDENCIES = postgresql libodb
+LIBODB_PGSQL_CONF_ENV = CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

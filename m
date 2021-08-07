Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DB17C4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 20:49:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F39061042
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 20:49:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1F39061042
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0C888239A;
	Sat,  7 Aug 2021 20:49:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V1BTGoYSfzi7; Sat,  7 Aug 2021 20:49:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5B0B81D19;
	Sat,  7 Aug 2021 20:49:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D7CA01BF964
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 20:48:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC12583641
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 20:48:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kEUVNEaQee8m for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 20:48:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2AA7C81B48
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 20:48:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1CAC08CA9B; Sat,  7 Aug 2021 20:48:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 7 Aug 2021 21:18:10 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: bc94b32a90b2eee72582d06682626c41c2dcadd8
X-Git-Newrev: 82b03cfd69637cee334a29555f97ab3d9bbc208a
X-Patchwork-Hint: ignore
Message-Id: <20210807204835.1CAC08CA9B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/libloki: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=82b03cfd69637cee334a29555f97ab3d9bbc208a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Fix the following build failure with gcc 11:

In file included from ../include/loki/SmartPtr.h:33,
                 from SmartPtr.cpp:20:
../include/loki/SmallObj.h: At global scope:
../include/loki/SmallObj.h:462:57: error: ISO C++17 does not allow dynamic exception specifications
  462 |         static void * operator new ( std::size_t size ) throw ( std::bad_alloc )
      |

Fixes:
 - http://autobuild.buildroot.org/results/768727160beaca5df3ef18be29cfbaa3ced67ad5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 0239ea5615a24469b6160f371fbec2735c89d4af)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libloki/libloki.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libloki/libloki.mk b/package/libloki/libloki.mk
index 7564239f6a..07a9372df9 100644
--- a/package/libloki/libloki.mk
+++ b/package/libloki/libloki.mk
@@ -23,6 +23,7 @@ endif
 
 define LIBLOKI_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11" \
 		-C $(@D) $(LIBLOKI_BUILD_TARGETS)
 endef
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

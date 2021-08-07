Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C66AC4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 20:49:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D137C61052
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 20:49:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D137C61052
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 94FA34018E;
	Sat,  7 Aug 2021 20:49:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tNu6dgy1_NCC; Sat,  7 Aug 2021 20:49:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DFCF04017C;
	Sat,  7 Aug 2021 20:48:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1CD0C1BF964
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 20:48:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A42460656
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 20:48:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PsEZALzFKdKy for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 20:48:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4C73760651
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 20:48:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 338E687F90; Sat,  7 Aug 2021 20:48:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 7 Aug 2021 21:18:15 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 71c1dbfa8ebe401fa3894adf94511d895ffe8ab0
X-Git-Newrev: fba41dfefb746cf25acbc3a3bf03df32547e33e2
X-Patchwork-Hint: ignore
Message-Id: <20210807204828.338E687F90@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/libloki: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=fba41dfefb746cf25acbc3a3bf03df32547e33e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

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

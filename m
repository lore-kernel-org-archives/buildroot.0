Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7FD8C4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 07:50:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D9CA60F39
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 07:50:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8D9CA60F39
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D6B0835E0;
	Sun,  8 Aug 2021 07:50:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 94f_hEI5WtNT; Sun,  8 Aug 2021 07:50:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C02CF83653;
	Sun,  8 Aug 2021 07:50:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8F5A31BF5A9
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 07:49:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8AD39401EC
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 07:49:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y6hxsSXitQ9O for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 07:49:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 92D36401CB
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 07:49:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 706CC8D1D9; Sun,  8 Aug 2021 07:48:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 8 Aug 2021 09:41:43 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 0bc7a29af1a5f3afcd79e479d6fb8aa0fe5f991f
X-Git-Newrev: 1544a5829d849cc3a14c7f7b36f8b4a3ddf0a9f3
X-Patchwork-Hint: ignore
Message-Id: <20210808074854.706CC8D1D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/libjson: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=1544a5829d849cc3a14c7f7b36f8b4a3ddf0a9f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

GCC 11 defaults to C++17. Fix the following build failure with gcc 11:

In file included from _internal/Source/JSONDefs.h:12,
                 from _internal/Source/JSONDebug.h:4,
                 from _internal/Source/JSONNode.h:4,
                 from _internal/Source/JSONNode.cpp:1:
_internal/Source/JSONDefs/GNU_C.h:58:28: error: ISO C++17 does not allow dynamic exception specifications
   58 |     #define json_throws(x) throw(x)
      |                            ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/1e66dff705bbb38e7e0f0e5864ce794b4345dcc6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit ff55c323af59bcaee3af949fd126bbec1889d1b2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libjson/libjson.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libjson/libjson.mk b/package/libjson/libjson.mk
index d04ddc40f3..73268c9ccf 100644
--- a/package/libjson/libjson.mk
+++ b/package/libjson/libjson.mk
@@ -11,7 +11,7 @@ LIBJSON_INSTALL_STAGING = YES
 LIBJSON_LICENSE = BSD-2-Clause
 LIBJSON_LICENSE_FILES = License.txt
 
-LIBJSON_CXXFLAGS = $(TARGET_CFLAGS) -DNDEBUG
+LIBJSON_CXXFLAGS = $(TARGET_CFLAGS) -DNDEBUG -std=c++11
 
 ifeq ($(BR2_STATIC_LIBS),y)
 LIBJSON_MAKE_OPTS += SHARED=0
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

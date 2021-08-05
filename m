Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2586C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:54:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C36C603E7
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:54:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2C36C603E7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E79B8402E8;
	Thu,  5 Aug 2021 19:54:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lhgpioGkNTdD; Thu,  5 Aug 2021 19:54:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4594340274;
	Thu,  5 Aug 2021 19:54:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D07E71BF361
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:49:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5CEEE40532
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:49:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ltsTeN3voXph for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 19:49:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6AB3B40529
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 19:49:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 2756B83738; Thu,  5 Aug 2021 19:49:40 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 5 Aug 2021 18:51:31 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 63ecfad96ad653e445d57632c81f5f27fa1761ca
X-Git-Newrev: 1116a3060955c36c43a8bea5f1f00ea4effb4e48
X-Patchwork-Hint: ignore
Message-Id: <20210805194940.2756B83738@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libebml: fix build
 with gcc 11
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

commit: https://git.buildroot.net/buildroot/commit/?id=1116a3060955c36c43a8bea5f1f00ea4effb4e48
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix the following build failure with gcc 11:

/tmp/instance-0/output-1/build/libebml-1.4.2/src/EbmlString.cpp: In member function 'virtual filepos_t libebml::EbmlString::ReadData(libebml::IOCallback&, libebml::ScopeMode)':
/tmp/instance-0/output-1/build/libebml-1.4.2/src/EbmlString.cpp:147:41: error: 'numeric_limits' is not a member of 'std'
  147 |     auto Buffer = (GetSize() + 1 < std::numeric_limits<std::size_t>::max()) ? new (std::nothrow) char[GetSize() + 1] : nullptr;
      |                                         ^~~~~~~~~~~~~~
/tmp/instance-0/output-1/build/libebml-1.4.2/src/EbmlString.cpp:147:67: error: expected primary-expression before '>' token
  147 |     auto Buffer = (GetSize() + 1 < std::numeric_limits<std::size_t>::max()) ? new (std::nothrow) char[GetSize() + 1] : nullptr;
      |                                                                   ^
/tmp/instance-0/output-1/build/libebml-1.4.2/src/EbmlString.cpp:147:70: error: '::max' has not been declared; did you mean 'std::max'?
  147 |     auto Buffer = (GetSize() + 1 < std::numeric_limits<std::size_t>::max()) ? new (std::nothrow) char[GetSize() + 1] : nullptr;
      |                                                                      ^~~
      |                                                                      std::max

Fixes:
 - http://autobuild.buildroot.org/results/3a28507127eae47994ca62e2b656da32bd2fb1f8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...riate-header-files-for-std-numeric_limits.patch | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/package/libebml/0001-include-appropriate-header-files-for-std-numeric_limits.patch b/package/libebml/0001-include-appropriate-header-files-for-std-numeric_limits.patch
new file mode 100644
index 0000000000..83d1b92051
--- /dev/null
+++ b/package/libebml/0001-include-appropriate-header-files-for-std-numeric_limits.patch
@@ -0,0 +1,52 @@
+From f0bfd53647961e799a43d918c46cf3b6bff89806 Mon Sep 17 00:00:00 2001
+From: Moritz Bunkus <mo@bunkus.online>
+Date: Sat, 27 Feb 2021 20:36:52 +0100
+Subject: [PATCH] include appropriate header files for std::numeric_limits
+
+Fixes #80.
+
+[Retrieved from:
+https://github.com/Matroska-Org/libebml/commit/f0bfd53647961e799a43d918c46cf3b6bff89806]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ ChangeLog                 | 4 ++++
+ src/EbmlString.cpp        | 1 +
+ src/EbmlUnicodeString.cpp | 1 +
+ 3 files changed, 6 insertions(+)
+
+diff --git a/ChangeLog b/ChangeLog
+index 034cf86..e4b13a9 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -1,3 +1,7 @@
++2021-02-27  Moritz Bunkus  <mo@bunkus.online>
++
++        * Fix compilation with g++ 11. Fixes #80.
++
+ 2021-02-21 Steve Lhomme <slhomme@matroska.org>
+ 
+         * Remove Coremake project files
+diff --git a/src/EbmlString.cpp b/src/EbmlString.cpp
+index 27e55fd..4c05fcf 100644
+--- a/src/EbmlString.cpp
++++ b/src/EbmlString.cpp
+@@ -34,6 +34,7 @@
+   \author Steve Lhomme     <robux4 @ users.sf.net>
+ */
+ #include <cassert>
++#include <limits>
+ 
+ #include "ebml/EbmlString.h"
+ 
+diff --git a/src/EbmlUnicodeString.cpp b/src/EbmlUnicodeString.cpp
+index 496a16a..99fc073 100644
+--- a/src/EbmlUnicodeString.cpp
++++ b/src/EbmlUnicodeString.cpp
+@@ -36,6 +36,7 @@
+ */
+ 
+ #include <cassert>
++#include <limits>
+ 
+ #include "ebml/EbmlUnicodeString.h"
+ 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

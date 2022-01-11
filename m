Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D978DC433F5
	for <buildroot@archiver.kernel.org>; Tue, 11 Jan 2022 20:59:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CB4B415F9;
	Tue, 11 Jan 2022 20:59:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZyUtBSUNS_H4; Tue, 11 Jan 2022 20:59:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A09DA415F8;
	Tue, 11 Jan 2022 20:59:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 82ED91BF20B
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 20:59:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7FAAE415F8
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 20:59:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fN_JTZNVasey for <buildroot@lists.busybox.net>;
 Tue, 11 Jan 2022 20:59:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C874840874
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 20:59:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 07D6A834DC; Tue, 11 Jan 2022 20:53:34 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 11 Jan 2022 21:59:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5da82181846b81a967c48f02f7404812a8acd60a
X-Git-Newrev: 7425450ba27ecd3dacf795e42bb70ef0c98684e8
X-Patchwork-Hint: ignore
Message-Id: <20220111205334.07D6A834DC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cryptopp: needs wchar
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

commit: https://git.buildroot.net/buildroot/commit/?id=7425450ba27ecd3dacf795e42bb70ef0c98684e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since commit
bf4cf9de833e2d571d98d1ca935ea08a3468e463:

In file included from seckey.h:11,
                 from 3way.h:10,
                 from 3way.cpp:5:
misc.h:1528:6: error: 'wstring' in namespace 'std' does not name a type
 1528 | std::wstring StringWiden(const char *str, bool throwOnError = true);
      |      ^~~~~~~
In file included from seckey.h:11,
                 from 3way.h:10,
                 from 3way.cpp:5:
misc.h:14:1: note: 'std::wstring' is defined in header '<string>'; did you forget to '#include <string>'?
   13 | #include "smartptr.h"
  +++ |+#include <string>
   14 | #include "stdcpp.h"

Fixes:
 - http://autobuild.buildroot.org/results/174fe03da7a40dd152703de93af6a213d9cac698

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cryptopp/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/cryptopp/Config.in b/package/cryptopp/Config.in
index 4ead5339ab..feb945db2f 100644
--- a/package/cryptopp/Config.in
+++ b/package/cryptopp/Config.in
@@ -1,8 +1,9 @@
 config BR2_PACKAGE_CRYPTOPP
 	bool "cryptopp"
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_USE_WCHAR
 	help
 	  A free C++ class library of cryptographic schemes
 
-comment "cryptopp needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
+comment "cryptopp needs a toolchain w/ dynamic library, wchar"
+	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

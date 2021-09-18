Return-Path: <SRS0=9D0o=OI=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLACK autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 116C2C433EF
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 19:37:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DEB160F9B
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 19:37:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5DEB160F9B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C6358378A;
	Sat, 18 Sep 2021 19:37:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cmjaEGa7Htwf; Sat, 18 Sep 2021 19:37:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D7F9828EF;
	Sat, 18 Sep 2021 19:37:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8ED031BF40A
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 19:37:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B52C828EF
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 19:37:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3cXH_NPcMNF4 for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 19:37:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C941A82865
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 19:37:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id E3A8F8B687; Sat, 18 Sep 2021 19:35:17 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 18 Sep 2021 21:36:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c257ee17cf0c0fd4487fe69961c937d082b50541
X-Git-Newrev: 8b64b75a2276bd9c91575d7bdd75b760c8baff98
X-Patchwork-Hint: ignore
Message-Id: <20210918193517.E3A8F8B687@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/apitrace: fix build with glibc >=
 2.34
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8b64b75a2276bd9c91575d7bdd75b760c8baff98
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with glibc >= 2.34:

/tmp/instance-0/output-1/host/lib/gcc/s390x-buildroot-linux-gnu/10.3.0/../../../../s390x-buildroot-linux-gnu/bin/ld: CMakeFiles/egltrace.dir/dlsym.cpp.o: in function `dlsym':
dlsym.cpp:(.text+0x34): undefined reference to `__libc_dlopen_mode'
/tmp/instance-0/output-1/host/lib/gcc/s390x-buildroot-linux-gnu/10.3.0/../../../../s390x-buildroot-linux-gnu/bin/ld: dlsym.cpp:(.text+0x46): undefined reference to `__libc_dlsym'

Fixes:
 - http://autobuild.buildroot.org/results/ac5e5b1e30249ae0fb8b9179338b47c60c026bcc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...lsym-and-__libc_dlopen_mode-on-GLIBC-2-34.patch | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/package/apitrace/0002-gltrace-Avoid-__libc_dlsym-and-__libc_dlopen_mode-on-GLIBC-2-34.patch b/package/apitrace/0002-gltrace-Avoid-__libc_dlsym-and-__libc_dlopen_mode-on-GLIBC-2-34.patch
new file mode 100644
index 0000000000..57e3ee248b
--- /dev/null
+++ b/package/apitrace/0002-gltrace-Avoid-__libc_dlsym-and-__libc_dlopen_mode-on-GLIBC-2-34.patch
@@ -0,0 +1,34 @@
+From d28a980802ad48568c87da02d630c8babfe163bb Mon Sep 17 00:00:00 2001
+From: Jose Fonseca <jfonseca@vmware.com>
+Date: Wed, 1 Sep 2021 16:34:54 +0100
+Subject: [PATCH] gltrace: Avoid __libc_dlsym and __libc_dlopen_mode on GLIBC
+ 2.34.
+
+These GLIBC_PRIVATE symbols are gone from GLIBC 2.34 due to the merge of
+libdl.so onto libc.so.
+
+This means apitrace can't defend against infinite recursion when
+used with Steam Overlay, but at least it should work otherwise.
+
+Fixes https://github.com/apitrace/apitrace/issues/756
+
+[Retrieved from:
+https://github.com/apitrace/apitrace/commit/d28a980802ad48568c87da02d630c8babfe163bb]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ wrappers/dlsym.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/wrappers/dlsym.cpp b/wrappers/dlsym.cpp
+index 5ab8465b0..5369af35a 100644
+--- a/wrappers/dlsym.cpp
++++ b/wrappers/dlsym.cpp
+@@ -34,7 +34,7 @@
+ #include "os.hpp"
+ 
+ 
+-#if defined(__GLIBC__) && !defined(__UCLIBC__)
++#if defined(__GLIBC__) && !defined(__UCLIBC__) && __GLIBC__ == 2 && __GLIBC_MINOR__ < 34
+ 
+ 
+ #include <dlfcn.h>
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

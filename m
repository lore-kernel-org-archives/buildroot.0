Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98981C433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 18:44:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 590E560E76
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 18:44:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 590E560E76
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 27B5A402BB;
	Sat,  4 Sep 2021 18:44:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dVWnI4CaTDUw; Sat,  4 Sep 2021 18:44:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3DF5A40230;
	Sat,  4 Sep 2021 18:44:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6F20A1BF5DD
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 18:26:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A896D40171
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 18:25:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EELhH0XL6U1p for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 18:25:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 068CC402A9
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 18:25:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D16F48834A; Sat,  4 Sep 2021 18:23:55 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 28 Aug 2021 15:21:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e1ddac352de6c86511a1a27efd8e79495519bcd8
X-Git-Newrev: ba56bce06552ddb4fc10cf67e9daf13b17f0ad2c
X-Patchwork-Hint: ignore
Message-Id: <20210904182355.D16F48834A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/boost: fix sparc build
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

commit: https://git.buildroot.net/buildroot/commit/?id=ba56bce06552ddb4fc10cf67e9daf13b17f0ad2c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure on sparc raised since bump to version
1.77.0 in commit d39d8f7cee9b4634e6f490020204f63fae419e8e:

./boost/predef/architecture/sparc.h:37:38: error: missing ')' in expression
   37 | #   if !defined(BOOST_ARCH_SPARC) && (defined(__sparcv9) || defined(__sparc_v9__)
      |                                      ^

Fixes:
 - http://autobuild.buildroot.org/results/c1f15e3a0cefb7e65e5288fb4564d59a3b06a0bd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/boost/0001-added-missing-brackets.patch | 29 +++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/package/boost/0001-added-missing-brackets.patch b/package/boost/0001-added-missing-brackets.patch
new file mode 100644
index 0000000000..1a2d5e67ec
--- /dev/null
+++ b/package/boost/0001-added-missing-brackets.patch
@@ -0,0 +1,29 @@
+From 1be0e4a2d8db15a405f64a6f65507b87c1be7e1a Mon Sep 17 00:00:00 2001
+From: tkoecker <tkoecker@gmx.net>
+Date: Fri, 21 May 2021 16:31:11 +0200
+Subject: [PATCH] added missing brackets (#118)
+
+[Retrieved from:
+https://github.com/boostorg/predef/commit/1be0e4a2d8db15a405f64a6f65507b87c1be7e1a]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ include/boost/predef/architecture/sparc.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/boost/predef/architecture/sparc.h b/boost/predef/architecture/sparc.h
+index d7b94f0..d01605e 100644
+--- a/boost/predef/architecture/sparc.h
++++ b//boost/predef/architecture/sparc.h
+@@ -34,10 +34,10 @@ Distributed under the Boost Software License, Version 1.0.
+ 
+ #if defined(__sparc__) || defined(__sparc)
+ #   undef BOOST_ARCH_SPARC
+-#   if !defined(BOOST_ARCH_SPARC) && (defined(__sparcv9) || defined(__sparc_v9__)
++#   if !defined(BOOST_ARCH_SPARC) && (defined(__sparcv9) || defined(__sparc_v9__))
+ #       define BOOST_ARCH_SPARC BOOST_VERSION_NUMBER(9,0,0)
+ #   endif
+-#   if !defined(BOOST_ARCH_SPARC) && (defined(__sparcv8) || defined(__sparc_v8__)
++#   if !defined(BOOST_ARCH_SPARC) && (defined(__sparcv8) || defined(__sparc_v8__))
+ #       define BOOST_ARCH_SPARC BOOST_VERSION_NUMBER(8,0,0)
+ #   endif
+ #   if !defined(BOOST_ARCH_SPARC)
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

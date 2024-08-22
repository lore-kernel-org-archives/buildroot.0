Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11898C3DA4A
	for <buildroot@archiver.kernel.org>; Thu, 22 Aug 2024 06:14:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A0EC840154;
	Thu, 22 Aug 2024 06:14:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ChIQQCJcOJGn; Thu, 22 Aug 2024 06:14:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5670F40BE7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5670F40BE7;
	Thu, 22 Aug 2024 06:14:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 15EB51BF337
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 06:14:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0270981297
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 06:14:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TDpFGu7F-4LQ for <buildroot@lists.busybox.net>;
 Thu, 22 Aug 2024 06:14:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0051781290
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0051781290
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0051781290
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 06:14:03 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 428A33536D22; Thu, 22 Aug 2024 08:14:00 +0200 (CEST)
Date: Thu, 22 Aug 2024 08:14:00 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZsbXKHaE9TKpZjJz@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1724307240; bh=vJtWMlwQA2Lg3q5wiJ6xUM4eoa83MhHWkW6IwDEyNho=;
 h=Date:From:To:Subject:From;
 b=HieWundLvngGJFd4EEqM6mo83nX0LA8EyOrymtNT+NtmeFqF07CFIqdxEbAXfWKxJ
 PTF+vd42eRPq8wjctWVQz/RJPq0cBUl7Q9icOI+IpFg7q9uJ96SyLR/6i2r2/lrumy
 FUNSc4U38PPPdaQ4hlSG4zWg4MZEr3Z5Em7YzhBfWfHwhB9Fex1Aqk6gv+ZO2Q47H+
 dxDJXwHh2SzzLvFMuOToB+tMjHnfxWzyE6fKh3pbCjWnd7MYuJLWb+XdlrqpDziCG4
 xAcMYIfTsPglul1j4ekCl+KNrpgilnhE7Da9MOQTYtdc5xumDV3b7Td7k972TgM+t/
 He/FGL4t24J0A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=HieWundL
Subject: [Buildroot] [PATCH v2] package/libsepol: fix reallocarray detection
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For some toolchains the detection of reallocarray fails with:
ld: final link failed: file truncated

It is hard to tell if it is a new feature of gcc or binutils
or even an architecture specific bug.
See here for example for an old bug where it was a HPPA specific
binutils problem:
https://sourceware.org/bugzilla/show_bug.cgi?id=19526

Fixes:
 - http://autobuild.buildroot.net/results/335/335aad5ecba2a4d21772767aa3a80d7d5631f4e4

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
v1->v2:
 - Upstream should be a pull request, suggested by Yann
---
 package/libsepol/0002-remove-o-dev-null.patch | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 package/libsepol/0002-remove-o-dev-null.patch

diff --git a/package/libsepol/0002-remove-o-dev-null.patch b/package/libsepol/0002-remove-o-dev-null.patch
new file mode 100644
index 0000000000..58641bb245
--- /dev/null
+++ b/package/libsepol/0002-remove-o-dev-null.patch
@@ -0,0 +1,23 @@
+From 7a9b8b4329285215e5608c3393394bef435b2220 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Sat, 17 Aug 2024 19:05:42 +0200
+Subject: [PATCH] remove -o /dev/null
+
+With -o /dev/null there is following error happening:
+ld: final link failed: file truncated
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: https://github.com/SELinuxProject/selinux/pull/439
+---
+diff -Nur libsepol-3.6.orig/src/Makefile libsepol-3.6/src/Makefile
+--- libsepol-3.6.orig/src/Makefile	2023-12-13 15:46:22.000000000 +0100
++++ libsepol-3.6/src/Makefile	2024-08-17 19:37:14.447327553 +0200
+@@ -31,7 +31,7 @@
+ 
+ # check for reallocarray(3) availability
+ H := \#
+-ifeq (yes,$(shell printf '${H}define _GNU_SOURCE\n${H}include <stdlib.h>\nint main(void){void*p=reallocarray(NULL, 1, sizeof(char));return 0;}' | $(CC) -x c -o /dev/null - >/dev/null 2>&1 && echo yes))
++ifeq (yes,$(shell printf '${H}define _GNU_SOURCE\n${H}include <stdlib.h>\nint main(void){void*p=reallocarray(NULL, 1, sizeof(char));return 0;}' | $(CC) -x c - >/dev/null 2>&1 && echo yes))
+ override CFLAGS += -DHAVE_REALLOCARRAY
+ endif
+ 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

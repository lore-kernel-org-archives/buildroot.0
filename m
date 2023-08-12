Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 392B1C001E0
	for <buildroot@archiver.kernel.org>; Sat, 12 Aug 2023 08:21:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED47160BBB;
	Sat, 12 Aug 2023 08:21:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED47160BBB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cDbn-rqP-lk6; Sat, 12 Aug 2023 08:21:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31F2760A6F;
	Sat, 12 Aug 2023 08:21:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31F2760A6F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8A09E1BF39E
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 08:21:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61CA64160D
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 08:21:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61CA64160D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zn_wdDoyimuI for <buildroot@lists.busybox.net>;
 Sat, 12 Aug 2023 08:21:39 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 58B3041604
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 08:21:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58B3041604
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 1A551352BD81; Sat, 12 Aug 2023 10:21:34 +0200 (CEST)
Date: Sat, 12 Aug 2023 10:21:34 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZNdBDn3B5k1Xgl4S@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-21-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1691828495; bh=83wjjPYfyxtuxYWEwJR6tCnZHegxI6EZ+psEAZPr0dU=;
 h=Date:From:To:Subject:From;
 b=AGSprjjikpzS/FAbqPEf9osR/yaw1TFQfOQeR7aDbOjSK9M87vd/u9LEreFoBvHEt
 yXMRqd8G1ugTVV8xFy+VlRiUBm/NY+tuZV8olK3bWQVQt3LKfGz6K6BF5OZJF40uFG
 1l095diJ/jmZvvTrVakPnX42fYh/aBnEAjfXSHMhffJrNjfeGtY03y2VpK+MyahjCG
 CljXhYogl6O8uJcqUIMbdZ2FQX5FMisVr8IJlCQZxbgmTlCbLWfmuRFN4Kq8MZVy5Y
 3ylXfQ7QnTF+wIkcjpVWYiOQuZb9wkGUQ/ctUUTKd53U/zZDwU3RJ0bVhCtAjXK1W3
 PW+8MGvR6ZhNA==
Subject: [Buildroot] [PATCH] package/libedit: fix compile error
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

Header file uses ssize_t so sys/types.h must be included.

Fixes:
 - http://autobuild.buildroot.net/results/439/439538b23776a58ff81c38754a19ee92c3590a1f

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
Author was informed via email about the issue.
---
 package/libedit/0002-add-sys-types_h.patch | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 package/libedit/0002-add-sys-types_h.patch

diff --git a/package/libedit/0002-add-sys-types_h.patch b/package/libedit/0002-add-sys-types_h.patch
new file mode 100644
index 0000000000..26aa906ee3
--- /dev/null
+++ b/package/libedit/0002-add-sys-types_h.patch
@@ -0,0 +1,15 @@
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: N/A only reachable via mail
+
+diff -Nur libedit-20221030-3.1.orig/src/sys.h libedit-20221030-3.1/src/sys.h
+--- libedit-20221030-3.1.orig/src/sys.h	2022-10-30 06:35:40.000000000 +0100
++++ libedit-20221030-3.1/src/sys.h	2023-08-12 09:52:28.137223311 +0200
+@@ -40,7 +40,7 @@
+ #ifndef _h_sys
+ #define	_h_sys
+ 
+-#if defined(HAVE_SYS_TYPES_H) && defined(__sun)
++#if defined(HAVE_SYS_TYPES_H)
+ #include <sys/types.h>
+ #endif
+ 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD969C25B75
	for <buildroot@archiver.kernel.org>; Wed, 15 May 2024 10:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6024840154;
	Wed, 15 May 2024 10:40:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s4UEr5BHOtOu; Wed, 15 May 2024 10:40:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 54BB2416D4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 54BB2416D4;
	Wed, 15 May 2024 10:40:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ABFF61BF40A
 for <buildroot@lists.busybox.net>; Wed, 15 May 2024 10:40:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A48D6416D4
 for <buildroot@lists.busybox.net>; Wed, 15 May 2024 10:40:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7--Ze1W5xQMN for <buildroot@lists.busybox.net>;
 Wed, 15 May 2024 10:40:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2670140154
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2670140154
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2670140154
 for <buildroot@buildroot.org>; Wed, 15 May 2024 10:40:53 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 668A735282DD; Wed, 15 May 2024 12:40:50 +0200 (CEST)
Date: Wed, 15 May 2024 12:40:50 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZkSRMq/yXayXrO3S@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-27-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1715769650; bh=tFFWhLOOtiBM3Bn73R7C5wuERkUpATSATRCro1Ifolw=;
 h=Date:From:To:Subject:From;
 b=V9XcDYKai33NyCKPCitPSEqKhoWFEruZ+8ym/a8wFhW66zMTzjYd5To0ZMpOtf7eo
 /XuVUvuXxtY1efpdJD+B5OeVedA7vASACpcOsfuRdzECSdvvjZkjLqJO6FOQMLWioF
 ex5G25iJOloiRB2BPZpPKPzXvsQ9j7UZ5mzRn5BXY7GUQBriAlxDu/M16exdPmp9Nd
 HOhyWmw9OzJNZoGz7kanTsOKvXRQKhVOJTlvXxUmcu39kzCz1CKY8D0Plsi9pDY8Bl
 H1rMCYpeD1rTnIj4/wDc3MUOxdbpHETPfjLXRmYo9FbN9E5GmY9ixXfocjj4Vd07ib
 0/ikH88Jm0ZpQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=V9XcDYKa
Subject: [Buildroot] [PATCH] package/uclibc: fix compile issue with gcc 14.x
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

Fixes:
 http://autobuild.buildroot.net/results/d9b924bdea3fd61060fa0e961c12534c1fff80de

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 .../0002-fix-kernel_stat64-definition.patch   | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/uclibc/0002-fix-kernel_stat64-definition.patch

diff --git a/package/uclibc/0002-fix-kernel_stat64-definition.patch b/package/uclibc/0002-fix-kernel_stat64-definition.patch
new file mode 100644
index 0000000000..5a87586af8
--- /dev/null
+++ b/package/uclibc/0002-fix-kernel_stat64-definition.patch
@@ -0,0 +1,35 @@
+From 186878405324e96f61d896a149f623e0c792c972 Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Tue, 14 May 2024 23:18:56 -0700
+Subject: [PATCH] fix kernel_stat64 definition
+
+The commit 74ca8d6f5d2e ("remove UCLIBC_HAS_LFS") removed conditional
+compilation dependent on __UCLIBC_HAS_LFS__, assuming it to be always
+defined, but removed the wrong branch in the definition of
+kernel_stat64.
+Fix kernel_stat64 definition to be stat64.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+Tested-by: Chris Packham <judge.packham@gmail.com>
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=186878405324e96f61d896a149f623e0c792c972
+---
+ libc/sysdeps/linux/common-generic/bits/kernel_stat.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libc/sysdeps/linux/common-generic/bits/kernel_stat.h b/libc/sysdeps/linux/common-generic/bits/kernel_stat.h
+index 7a97bb4d7..e874a4a9f 100644
+--- a/libc/sysdeps/linux/common-generic/bits/kernel_stat.h
++++ b/libc/sysdeps/linux/common-generic/bits/kernel_stat.h
+@@ -18,7 +18,7 @@
+  * However that requires more #ifndef in relevant wrappers,
+  * further uglifying them
+  */
+-#define kernel_stat64	stat
++#define kernel_stat64	stat64
+ 
+ #endif	/*  _BITS_STAT_STRUCT_H */
+ 
+-- 
+2.30.2
+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A14AAC001B0
	for <buildroot@archiver.kernel.org>; Sat, 12 Aug 2023 11:45:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22FA4608D8;
	Sat, 12 Aug 2023 11:45:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22FA4608D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9NYFPl5S3E9z; Sat, 12 Aug 2023 11:45:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6496060BB0;
	Sat, 12 Aug 2023 11:45:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6496060BB0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 41B471BF282
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 11:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E65D4012F
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 11:45:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E65D4012F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E4aTeylEvsm9 for <buildroot@lists.busybox.net>;
 Sat, 12 Aug 2023 11:45:03 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DC450401F1
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 11:45:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC450401F1
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 3DD1F3520C37; Sat, 12 Aug 2023 13:44:52 +0200 (CEST)
Date: Sat, 12 Aug 2023 13:44:51 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZNdwsocEpsgQ7U9J@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-21-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1691840693; bh=ECm5DulraRo4jJDLNShcrcL+hb+omvvSKH75jlqSvX0=;
 h=Date:From:To:Subject:From;
 b=HNmEc4iw3cIfgl3Cp/WOU+8gcpSlpdsEtoCpAl6nZtCmI/7aqvVDVFT26DscRiuoj
 tKxjk46mPcXhzt/dt/KAFmgfUDNSX3kwibPKjageFA4GwsEheO7FIjKNhXT3Vw5aEx
 NDb+N4m/XGCeMQO6VjgefEwBis81CFqaSYzqtN0I9fjQ/wtd/H5AWilOVTsgPRyczx
 NLDn/7HAO9+yzv61NCgoi5WdBMsbm7Q/Xo7TU8/BLxaKgmjIbLqyNZgUNeCWclZv9s
 mpEoXLfT4z9b4RNmOI+a0MbAV1Z6qktRElP/f75rBxuqEykru4Cfw00MpeYX8EAgV4
 NQXdrASk4dAxA==
Subject: [Buildroot] [PATCH 1/2] toolchain: introduce
 BR2_TOOLCHAIN_HAS_GCC_BUG_111001
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

e2fsprogs package fails to build for the SH4 architecture due to a gcc
13.2.0 bug that leads to:
during RTL pass: sh_treg_combine2
rw_bitmaps.c: In function read_bitmaps_range_start:
internal compiler error: Aborted

Let's add gcc bug to avoid to deal with architectures in packages
when a gcc bug arises. Let's instead deal directly with gcc
bug number.

It's been reported upstream:
https://gcc.gnu.org/bugzilla//show_bug.cgi?id=111001

No need to backport as gcc 13.20 was introduced recently in
buildroot.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 toolchain/Config.in | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index a37933bc12..da6bf5f4c8 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -257,6 +257,17 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_110934
 	bool
 	default y if BR2_m68k
 
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=111001
+# ICE: on SH4: during RTL pass: sh_treg_combine2
+# This bug exist in gcc = 13.2.0
+config BR2_TOOLCHAIN_HAS_GCC_BUG_111001
+	bool
+	default y if BR2_sh
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	depends on BR2_OPTIMIZE_1 || \
+		   BR2_OPTIMIZE_2 || \
+		   BR2_OPTIMIZE_3
+
 config BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	bool
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

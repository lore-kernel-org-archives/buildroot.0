Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66BD7C001DB
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 13:48:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E10FD81CE7;
	Mon,  7 Aug 2023 13:48:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E10FD81CE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y40EwNnyb49C; Mon,  7 Aug 2023 13:48:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D9B681D5F;
	Mon,  7 Aug 2023 13:48:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D9B681D5F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 149921BF2F6
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 13:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E07B981CE7
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 13:48:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E07B981CE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X4zt9TTB0YyL for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 13:48:08 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3CFC181ADE
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 13:48:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3CFC181ADE
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 7905C3520C58; Mon,  7 Aug 2023 15:48:05 +0200 (CEST)
Date: Mon, 7 Aug 2023 15:48:05 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZND2FWFQqlhkfDSw@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-21-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1691416085; bh=tvXrlA3InTcJjA6MhukFnAOBxt54rfk4gTNy8+h3WA8=;
 h=Date:From:To:Cc:Subject:From;
 b=bPjzWKlZht3YFLqwem3p3qU+ZuS/ysGMCUqBsUsp1pgZz/Ay1sByUnDPEkCPflzq3
 tAtHERFcg+9K0ePLshMuBCVODPsApZDosmcO6GFIbjccn2s42UtWATdQcxq2AtWjrb
 iVnhh8ZcLODO41ipzlWJw6+yNbUC6VeKlBVgIXYQ7MfwoJSSm52+PLSFkIj83+FunM
 8/9dKPw52Go3MAgmVlGnqDjtLvW4y8SKD3Uq5gPSvxOKyiyoXW+yVXgZ/WMii0tykJ
 rkhCt4amYd0MJXSHMC7W1t2TkXsVpqXTZpiHJTAccZxdi/gOTAJzW1vV4ArRVfCEW4
 r2OBQqOPT9DDA==
Subject: [Buildroot] [PATCH 1/2] toolchain: introduce
 BR2_TOOLCHAIN_HAS_GCC_BUG_110934
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

openssh package fails to build for the M68K architecture with -fzero-call-used-regs=all
passed to gcc = 12.3.0 and it's still present in gcc = 13.2.0:
http://autobuild.buildroot.net/results/d29/d29c662e41d8969e6a8aa24870e728bcc7050563/

It's been reported upstream:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=110934

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 toolchain/Config.in | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index a142d27231..9d390ab11e 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -244,6 +244,13 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_107728
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_OPTIMIZE_0
 
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=110934
+# ICE: on M68K: in change_address_1, at emit-rtl.cc:2287
+# This bug exists in gcc = 12.3.0 and gcc = 13.2.0
+config BR2_TOOLCHAIN_HAS_GCC_BUG_110934
+	bool
+	default y if BR2_m68k
+
 config BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	bool
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

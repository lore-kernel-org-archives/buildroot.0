Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 229B4C5320E
	for <buildroot@archiver.kernel.org>; Tue, 27 Aug 2024 03:55:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C3DAE40151;
	Tue, 27 Aug 2024 03:55:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HgA96lPen6vn; Tue, 27 Aug 2024 03:55:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8467D4061F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8467D4061F;
	Tue, 27 Aug 2024 03:55:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 205321BF86D
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 03:55:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B9BE403B4
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 03:55:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qo8HLWv2N0Sb for <buildroot@lists.busybox.net>;
 Tue, 27 Aug 2024 03:55:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D6D4540372
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6D4540372
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D6D4540372
 for <buildroot@buildroot.org>; Tue, 27 Aug 2024 03:55:53 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id EFF1C3520FE3; Tue, 27 Aug 2024 05:55:51 +0200 (CEST)
Date: Tue, 27 Aug 2024 05:55:51 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Zs1ORw93VJBVAm5L@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1724730951; bh=+D12GWZfrxtKAWkktmkRJXnYFij0bAAacafO6vcHLtM=;
 h=Date:From:To:Subject:From;
 b=BGGT/UJvjSmyFguGS2E5aLg+Z43KSsJVpd0X19MPP/sHEuOaW3JyLm+ciJkUA/LCl
 Cu1O469EtK20wmluPMsVTvPGqG4NS2ZlSnD40d/m4+ksrim5t3jOT8Q+dfNm1sFkaY
 lII4tYonyoFYw+GZem8G1aJPQICVGnDUVji4c+D6kBK3gwIvSe6CuYSIrNIVENqPdM
 IeqPnWDTDcqa7qMoTHQ4ZwdolwT8BJtwVsU3I5AeH8/JTc1v+f6qX5acNXSYhm0Be2
 LqMiZY8NJkHTYuVfbrNWDEuvE7FaLdCtqx1srpnHV+HTR1UHuw+EI2ehKLgGB/w68L
 Lcj+aQtumXMGw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=BGGT/UJv
Subject: [Buildroot] [PATCH] package/enscript: fix gcc 14.x compile issue
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

 http://autobuild.buildroot.org/results/eb5/eb53b42db0d4bcaf574380d5a89a096cc4ce4b14

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 ...ible-implicit-declaration-of-built-i.patch | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 package/enscript/0001-Solving-incompatible-implicit-declaration-of-built-i.patch

diff --git a/package/enscript/0001-Solving-incompatible-implicit-declaration-of-built-i.patch b/package/enscript/0001-Solving-incompatible-implicit-declaration-of-built-i.patch
new file mode 100644
index 0000000000..ae950c331a
--- /dev/null
+++ b/package/enscript/0001-Solving-incompatible-implicit-declaration-of-built-i.patch
@@ -0,0 +1,29 @@
+From 300ecf85a8fe166a39f9dd818945c7b8a970db39 Mon Sep 17 00:00:00 2001
+From: Wim Stockman <wim@thinkerwim.org>
+Date: Mon, 12 Feb 2024 22:52:50 +0100
+Subject: [PATCH] Solving incompatible implicit declaration of built-in
+ function 'strlen'
+
+Signed-off-by: Wim Stockman <wim@thinkerwim.org>
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: https://git.savannah.gnu.org/cgit/enscript.git/commit/?id=300ecf85a8fe166a39f9dd818945c7b8a970db39
+---
+ compat/getopt.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/compat/getopt.c b/compat/getopt.c
+index 752f28a..19f50e1 100644
+--- a/compat/getopt.c
++++ b/compat/getopt.c
+@@ -34,6 +34,8 @@
+ #include <config.h>
+ #endif
+ 
++#include <string.h>
++
+ #if !defined (__STDC__) || !__STDC__
+ /* This is a separate conditional since some stdc systems
+    reject `defined (const)'.  */
+-- 
+2.39.2
+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

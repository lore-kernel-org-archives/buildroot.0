Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B57A8C3DA4A
	for <buildroot@archiver.kernel.org>; Fri,  9 Aug 2024 05:01:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64D9081F15;
	Fri,  9 Aug 2024 05:01:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CeMv6-X5PX_X; Fri,  9 Aug 2024 05:01:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D7B581F29
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D7B581F29;
	Fri,  9 Aug 2024 05:01:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1C5FE1BF31E
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 05:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0991181BD6
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 05:01:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O54ZBs8qtF7U for <buildroot@lists.busybox.net>;
 Fri,  9 Aug 2024 05:01:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 68C7281BCF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68C7281BCF
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 68C7281BCF
 for <buildroot@buildroot.org>; Fri,  9 Aug 2024 05:01:26 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 0310B3520C9B; Fri,  9 Aug 2024 07:01:22 +0200 (CEST)
Date: Fri, 9 Aug 2024 07:01:22 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZrWionLijDXHPUjW@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1723179683; bh=qghkIkRhin9dWl9Pdvwb1l/62TO0cvYAHPRrgro20P8=;
 h=Date:From:To:Subject:From;
 b=j43ezRuoNFt6FqOGvr4vO78+l3bR69rlr/ZcdEIhRHoJtdebiRjVwMWGcMDNUJZxs
 2OU5liOecRVGK99qENhiJQRkm/tUKPKF2+Ivg2/fqQ1t548XqO2bEJeAL84V9yZju/
 6xIZO6dlxyaQaHyLFJwB328RWvMVQEMnsNfnvMfAMu0H3uaZ2d1db9xGyRgAZpZ8jf
 di6zZ+5skBL5qMXR9rChAJNr6bmaqGY2Zjh7tHVvDwzIJQmPOfbPEZj63LWcb1Dbx5
 QGzqCBz4A7EZcSDgPFG/MFjPt2XENvb1RT5RyJlhR2f+iP8FahLj89Q4ZPYuBYiTQz
 0kkZV1G2rLpfw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=j43ezRuo
Subject: [Buildroot] [PATCH] package/screen: fix compile issue
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

screen fails to compile with:
pty.c: In function 'OpenPTY':
pty.c:338:7: error: implicit declaration of function 'openpty'; did you mean 'OpenPTY'? [-Wimplicit-function-declaration]
  338 |   if (openpty(&f, &s, TtyName, NULL, NULL) != 0)
      |       ^~~~~~~
      |       OpenPTY

Add a patch to include pty.h. Similar change is already in Upstream
git repository.

Fixes:
 - http://autobuild.buildroot.net/results/a3f/a3fbd312c6946604e22540c78104e15f7a8d2281

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 .../0008-add-missing-pty.h-header.patch       | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/screen/0008-add-missing-pty.h-header.patch

diff --git a/package/screen/0008-add-missing-pty.h-header.patch b/package/screen/0008-add-missing-pty.h-header.patch
new file mode 100644
index 0000000000..3964316758
--- /dev/null
+++ b/package/screen/0008-add-missing-pty.h-header.patch
@@ -0,0 +1,26 @@
+From 8c32bc91a86ea51cad36405b592504acb31b7cba Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Fri, 9 Aug 2024 06:23:06 +0200
+Subject: [PATCH] add missing pty.h header
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: https://git.savannah.gnu.org/cgit/screen.git/tree/src/pty.c#n38
+---
+ pty.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/pty.c b/pty.c
+index 6791fd5..093273d 100644
+--- a/pty.c
++++ b/pty.c
+@@ -29,6 +29,7 @@
+ #include <sys/types.h>
+ #include <sys/stat.h>
+ #include <fcntl.h>
++#include <pty.h>
+ #include <signal.h>
+ 
+ #if defined(__OpenBSD__)
+-- 
+2.39.2
+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

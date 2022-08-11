Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED036C19F2A
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 21:01:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 866594047D;
	Thu, 11 Aug 2022 21:01:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 866594047D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gWoBB0MJPNuu; Thu, 11 Aug 2022 21:01:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A0687401C9;
	Thu, 11 Aug 2022 21:01:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0687401C9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 506A41BF2B9
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 21:01:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2AC0F410AE
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 21:01:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2AC0F410AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E15fKRMvbmY4 for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 21:01:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 17F95410AD
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 21:01:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17F95410AD
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0DD6487396; Thu, 11 Aug 2022 20:47:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Aug 2022 23:01:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6619e62ce5832bfe3187f38ec759efb9914e0770
X-Git-Newrev: 47354cfce67c1898813ce124decfa5b3fb76f46b
X-Patchwork-Hint: ignore
Message-Id: <20220811204715.0DD6487396@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ficl: fix musl static build
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=47354cfce67c1898813ce124decfa5b3fb76f46b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Pass LDFLAGS to avoid the following musl static build failure raised
since the addition of the package in commit
814911aecb6d49bb603c34dbfcc0d86614516b41:

/home/autobuild/autobuild/instance-5/output-1/host/lib/gcc/sh4eb-buildroot-linux-musl/11.3.0/../../../../sh4eb-buildroot-linux-musl/bin/ld: /home/autobuild/autobuild/instance-5/output-1/host/lib/gcc/sh4eb-buildroot-linux-musl/11.3.0/libgcc.a(unwind-dw2.o): in function `size_of_encoded_value':
/home/autobuild/autobuild/instance-5/output-1/build/host-gcc-final-11.3.0/build/sh4eb-buildroot-linux-musl/libgcc/../../../libgcc/unwind-pe.h:89: undefined reference to `abort'

Fixes:
 - http://autobuild.buildroot.org/results/bf041723ed813746c61892262630a3ac2bc43b14

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../ficl/0002-Makefile.linux-pass-LDFLAGS.patch    | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/ficl/0002-Makefile.linux-pass-LDFLAGS.patch b/package/ficl/0002-Makefile.linux-pass-LDFLAGS.patch
new file mode 100644
index 0000000000..2138089b0e
--- /dev/null
+++ b/package/ficl/0002-Makefile.linux-pass-LDFLAGS.patch
@@ -0,0 +1,35 @@
+From 33b16f2c4f996a98c3bbbec9af542d020ac276fa Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 9 Aug 2022 23:53:06 +0200
+Subject: [PATCH] Makefile.linux: pass LDFLAGS
+
+Pass LDFLAGS to avoid the following musl static build failure:
+
+/home/autobuild/autobuild/instance-5/output-1/host/lib/gcc/sh4eb-buildroot-linux-musl/11.3.0/../../../../sh4eb-buildroot-linux-musl/bin/ld: /home/autobuild/autobuild/instance-5/output-1/host/lib/gcc/sh4eb-buildroot-linux-musl/11.3.0/libgcc.a(unwind-dw2.o): in function `size_of_encoded_value':
+/home/autobuild/autobuild/instance-5/output-1/build/host-gcc-final-11.3.0/build/sh4eb-buildroot-linux-musl/libgcc/../../../libgcc/unwind-pe.h:89: undefined reference to `abort'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/bf041723ed813746c61892262630a3ac2bc43b14
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: upstream is dead]
+---
+ Makefile.linux | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.linux b/Makefile.linux
+index 5f1a41f..df887e6 100644
+--- a/Makefile.linux
++++ b/Makefile.linux
+@@ -14,7 +14,7 @@ MAJOR = 4
+ MINOR = 0.31
+ 
+ ficl: main.o $(HEADERS) libficl.a
+-	$(CC) main.o -o ficl -L. -lficl -lm
++	$(CC) $(LDFLAGS) main.o -o ficl -L. -lficl -lm
+ 
+ lib: libficl.so.$(MAJOR).$(MINOR)
+ 
+-- 
+2.35.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

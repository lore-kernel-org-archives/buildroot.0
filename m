Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0303FECAAD3
	for <buildroot@archiver.kernel.org>; Thu, 15 Sep 2022 07:29:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 94D6E41028;
	Thu, 15 Sep 2022 07:29:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94D6E41028
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uWod0Dcnxgcx; Thu, 15 Sep 2022 07:29:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9BE1541021;
	Thu, 15 Sep 2022 07:29:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9BE1541021
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C68B91BF344
 for <buildroot@lists.busybox.net>; Thu, 15 Sep 2022 07:29:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF63B83300
 for <buildroot@lists.busybox.net>; Thu, 15 Sep 2022 07:29:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF63B83300
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c6FVT9ALgm7E for <buildroot@lists.busybox.net>;
 Thu, 15 Sep 2022 07:29:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D1F2D83330
 for <buildroot@buildroot.org>; Thu, 15 Sep 2022 07:29:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1F2D83330
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B986D83BF4; Thu, 15 Sep 2022 07:29:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 15 Sep 2022 09:27:17 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 3babdc0765c56b8635262e65000422fcbae8145f
X-Git-Newrev: ab76ef9797196cf7a243e233e15aed09fb38927f
X-Patchwork-Hint: ignore
Message-Id: <20220915072908.B986D83BF4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/ficl: fix musl
 static build
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ab76ef9797196cf7a243e233e15aed09fb38927f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Pass LDFLAGS to avoid the following musl static build failure raised
since the addition of the package in commit
814911aecb6d49bb603c34dbfcc0d86614516b41:

/home/autobuild/autobuild/instance-5/output-1/host/lib/gcc/sh4eb-buildroot-linux-musl/11.3.0/../../../../sh4eb-buildroot-linux-musl/bin/ld: /home/autobuild/autobuild/instance-5/output-1/host/lib/gcc/sh4eb-buildroot-linux-musl/11.3.0/libgcc.a(unwind-dw2.o): in function `size_of_encoded_value':
/home/autobuild/autobuild/instance-5/output-1/build/host-gcc-final-11.3.0/build/sh4eb-buildroot-linux-musl/libgcc/../../../libgcc/unwind-pe.h:89: undefined reference to `abort'

Fixes:
 - http://autobuild.buildroot.org/results/bf041723ed813746c61892262630a3ac2bc43b14

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 47354cfce67c1898813ce124decfa5b3fb76f46b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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

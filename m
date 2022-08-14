Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 224AFC25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 10:17:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF6D340323;
	Sun, 14 Aug 2022 10:17:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF6D340323
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x8L3GhdGR0J6; Sun, 14 Aug 2022 10:17:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF2AC4024B;
	Sun, 14 Aug 2022 10:17:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF2AC4024B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 41DEB1BF96B
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 10:17:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1DB7A818BE
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 10:17:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DB7A818BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oDe_Ks4Udz28 for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 10:17:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 617BD81882
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 10:17:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 617BD81882
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 8F74C87471; Sun, 14 Aug 2022 10:02:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 12:16:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8c1868eb31951b56a9cec6268d49195899e890b3
X-Git-Newrev: f6188d80b9fa31700f8656e3997134cbd880b606
X-Patchwork-Hint: ignore
Message-Id: <20220814100236.8F74C87471@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libp11: fix build with gcc 4.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=f6188d80b9fa31700f8656e3997134cbd880b606
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with gcc 4.8 raised since bump to
version 0.4.12 in commit 86ab91483dcb4b60de8c1daa20e2f42bd95ab5fb and
https://github.com/OpenSC/libp11/commit/639a4b6463278c0119a2ec60b261da3e5330fb33:

p11_attr.c: In function 'pkcs11_zap_attrs':
p11_attr.c:167:2: error: 'for' loop initial declarations are only allowed in C99 mode
  for (unsigned i = 0; i < 32; i++) {
  ^
p11_attr.c:167:2: note: use option -std=c99 or -std=gnu99 to compile your code

Fixes:
 - http://autobuild.buildroot.org/results/4391020fb5738cc8c26dc53783a6228bbf76473a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...001-src-p11_attr.c-fix-build-with-gcc-4.8.patch | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/package/libp11/0001-src-p11_attr.c-fix-build-with-gcc-4.8.patch b/package/libp11/0001-src-p11_attr.c-fix-build-with-gcc-4.8.patch
new file mode 100644
index 0000000000..60fc16d9d0
--- /dev/null
+++ b/package/libp11/0001-src-p11_attr.c-fix-build-with-gcc-4.8.patch
@@ -0,0 +1,42 @@
+From ba44b87318ed89e489fa3ce0a5d66002afa2bd6c Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 12 Aug 2022 11:54:54 +0200
+Subject: [PATCH] src/p11_attr.c: fix build with gcc 4.8
+
+Fix the following build failure with gcc 4.8 raised since version 0.4.12
+and
+https://github.com/OpenSC/libp11/commit/639a4b6463278c0119a2ec60b261da3e5330fb33:
+
+p11_attr.c: In function 'pkcs11_zap_attrs':
+p11_attr.c:167:2: error: 'for' loop initial declarations are only allowed in C99 mode
+  for (unsigned i = 0; i < 32; i++) {
+  ^
+p11_attr.c:167:2: note: use option -std=c99 or -std=gnu99 to compile your code
+
+Fixes:
+ - http://autobuild.buildroot.org/results/4391020fb5738cc8c26dc53783a6228bbf76473a
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/OpenSC/libp11/commit/ba44b87318ed89e489fa3ce0a5d66002afa2bd6c]
+---
+ src/p11_attr.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/p11_attr.c b/src/p11_attr.c
+index d49456ff..d425241a 100644
+--- a/src/p11_attr.c
++++ b/src/p11_attr.c
+@@ -162,9 +162,11 @@ void pkcs11_addattr_obj(PKCS11_TEMPLATE *tmpl, int type, pkcs11_i2d_fn enc, void
+ 
+ void pkcs11_zap_attrs(PKCS11_TEMPLATE *tmpl)
+ {
++	unsigned int i;
++
+ 	if (!tmpl->allocated)
+ 		return;
+-	for (unsigned i = 0; i < 32; i++) {
++	for (i = 0; i < 32; i++) {
+ 		if (tmpl->allocated & (1<<i))
+ 			OPENSSL_free(tmpl->attrs[i].pValue);
+ 	}
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

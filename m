Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB6B2C7EE24
	for <buildroot@archiver.kernel.org>; Sat,  3 Jun 2023 20:49:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72B8184073;
	Sat,  3 Jun 2023 20:49:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72B8184073
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fl9UITGjLslh; Sat,  3 Jun 2023 20:49:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D54383FC8;
	Sat,  3 Jun 2023 20:49:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D54383FC8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 552241BF3DF
 for <buildroot@lists.busybox.net>; Sat,  3 Jun 2023 20:49:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2D3A241E2D
 for <buildroot@lists.busybox.net>; Sat,  3 Jun 2023 20:49:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D3A241E2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VWLilhjhtpPd for <buildroot@lists.busybox.net>;
 Sat,  3 Jun 2023 20:49:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D2ECF41B6A
 for <buildroot@buildroot.org>; Sat,  3 Jun 2023 20:49:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2ECF41B6A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B60BE869F2; Sat,  3 Jun 2023 20:49:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Jun 2023 22:44:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 579f5a9782ee8694f4939c6a4f3efe51b476b487
X-Git-Newrev: d2c1d8dfb5233acf90da6a3b26526fc9ceebe2df
X-Patchwork-Hint: ignore
Message-Id: <20230603204930.B60BE869F2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] kexec: fix sys/random.h with uclibc
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d2c1d8dfb5233acf90da6a3b26526fc9ceebe2df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes: http://autobuild.buildroot.net/results/b5a/b5a46cc164cb0fe6bf37dacb917b3664d2710a4a

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .../0001-m68k-fix-getrandom-use-with-uclibc.patch  | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/package/kexec/0001-m68k-fix-getrandom-use-with-uclibc.patch b/package/kexec/0001-m68k-fix-getrandom-use-with-uclibc.patch
new file mode 100644
index 0000000000..6661349aba
--- /dev/null
+++ b/package/kexec/0001-m68k-fix-getrandom-use-with-uclibc.patch
@@ -0,0 +1,36 @@
+From 491439a5c55b18dce96b522f3a603faaf1908ede Mon Sep 17 00:00:00 2001
+From: Laurent Vivier <laurent@vivier.eu>
+Date: Fri, 21 Apr 2023 18:22:07 +0200
+Subject: [PATCH] m68k: fix getrandom() use with uclibc
+
+With uclibc, getrandom() is only defined with _GNU_SOURCE, fix that:
+
+kexec/arch/m68k/bootinfo.c: In function 'bootinfo_add_rng_seed':
+kexec/arch/m68k/bootinfo.c:231:13: warning: implicit declaration of function 'getrandom'; did you mean 'srandom'? [-Wimplicit-function-declaration]
+  231 |         if (getrandom(bi->rng_seed.data, RNG_SEED_LEN, GRND_NONBLOCK) != RNG_SEED_LEN) {
+      |             ^~~~~~~~~
+      |             srandom
+kexec/arch/m68k/bootinfo.c:231:56: error: 'GRND_NONBLOCK' undeclared (first use in this function)
+  231 |         if (getrandom(bi->rng_seed.data, RNG_SEED_LEN, GRND_NONBLOCK) != RNG_SEED_LEN) {
+      |                                                        ^~~~~~~~~~~~~
+
+Fixes:  b9de05184816 ("m68k: pass rng seed via BI_RNG_SEED")
+Upstream: https://lore.kernel.org/kexec/20230422095904.1303434-1-laurent@vivier.eu/
+Cc: Jason@zx2c4.com
+Signed-off-by: Laurent Vivier <laurent@vivier.eu>
+---
+ kexec/arch/m68k/bootinfo.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/kexec/arch/m68k/bootinfo.c b/kexec/arch/m68k/bootinfo.c
+index 086a34bdfdeb..5afd212d9d34 100644
+--- a/kexec/arch/m68k/bootinfo.c
++++ b/kexec/arch/m68k/bootinfo.c
+@@ -1,3 +1,4 @@
++#define _GNU_SOURCE
+ 
+ #include <stdio.h>
+ #include <stdlib.h>
+-- 
+2.40.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

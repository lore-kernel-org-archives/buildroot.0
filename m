Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D63E9D40D
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 16:49:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00BF240CB3;
	Wed,  4 Feb 2026 16:49:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FoUn7MHZoK22; Wed,  4 Feb 2026 16:49:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F66240CF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770223743;
	bh=UFgljIN5aZ+kO9qgoGG3Ads3zBLK2Vev83Zq67HCMRk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PNeQNrM0QaE4cg8M2beAa63ptxhqvKBBWA1iWSwxl9MlIoHTdqYT5jNdvc/EgfSow
	 zrhmrfWtQYbjdFrYaadzcD/aPF9spUSQqbMZ3mCId5/OD6UwSGJuQnozkpONr8cd4D
	 m0Zlcrdy0mY04xjbqouSiiWDZ9So1NnBpfNoXLVTSxMA1R+14XJlxzRCq9AmmmZbas
	 NSqreL/t1aN4uwX7Qp/IQdx+s7wT4zJ3A06BJg8Y/vd1r1ZTiMyhJ9nZG+KgqeQde9
	 2TnIdnwB4HnIK3fbqWFyxU3HdzUXKw9kG9ZOJ0em3Ky2lYKqz1IvpdzqAmqeaLDgWT
	 cT043C/3fjllw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F66240CF3;
	Wed,  4 Feb 2026 16:49:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C5743173
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 16:49:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AFAD283F37
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 16:49:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BypxeFNdxN7H for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 16:49:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7E8683F25
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D7E8683F25
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 16:49:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B5C1586959; Wed,  4 Feb 2026 16:49:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 17:48:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 95519e04644ab536a8cfb6a6cff0ddfb3898a3ab
X-Git-Newrev: 944b0ef086dab217eb2d38bda132eace3006d5cf
X-Patchwork-Hint: ignore
Message-Id: <20260204164900.B5C1586959@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/squeezelite: fix build with gcc >=
 15.x
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/944b0ef086dab217eb2d38bda132eace3006d5cf
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

No autobuilder errors recorded yet.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-ir.c-fix-build-with-gcc-15.patch          | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/package/squeezelite/0001-ir.c-fix-build-with-gcc-15.patch b/package/squeezelite/0001-ir.c-fix-build-with-gcc-15.patch
new file mode 100644
index 0000000000..4fe61e25c0
--- /dev/null
+++ b/package/squeezelite/0001-ir.c-fix-build-with-gcc-15.patch
@@ -0,0 +1,44 @@
+From 787961d52130bd3c6c18b19218219650786e5352 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sat, 6 Dec 2025 12:25:08 +0100
+Subject: [PATCH] ir.c: fix build with gcc-15
+
+ir.c: In function 'ir_init':
+ir.c:273:48: error: passing argument 3 of 'pthread_create' from incompatible pointer type [-Wincompatible-pointer-types]
+  273 |                 pthread_create(&thread, &attr, ir_thread, NULL);
+      |                                                ^~~~~~~~~
+      |                                                |
+      |                                                void * (*)(void)
+In file included from squeezelite.h:300,
+                 from ir.c:36:
+/home/buildroot/br/output/per-package/squeezelite/host/lib/gcc/x86_64-buildroot-linux-gnu/15.2.0/include-fixed/pthread.h:213:36:
+ note: expected 'void * (*)(void *)' but argument is of type 'void * (*)(void)'
+  213 |                            void *(*__start_routine) (void *),
+      |                            ~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
+ir.c:169:14: note: 'ir_thread' declared here
+  169 | static void *ir_thread() {
+      |              ^~~~~~~~~
+
+Upstream: https://github.com/ralph-irving/squeezelite/commit/1e8fb181366467b6c4046119eedb821e4a5f9adb
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ ir.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ir.c b/ir.c
+index 84294b6..aeea23c 100644
+--- a/ir.c
++++ b/ir.c
+@@ -166,7 +166,7 @@ static u32_t ir_key_map(const char *c, const char *r) {
+ 	return 0;
+ }
+ 
+-static void *ir_thread() {
++static void *ir_thread(void *vargp) {
+ 	char *code;
+ 	
+ 	while (fd > 0 && LIRC(i, nextcode, &code) == 0) {
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

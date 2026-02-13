Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 849DEEF99D2
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:39:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5885E6171A;
	Fri, 13 Feb 2026 19:39:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kvpPzEKGn1HR; Fri, 13 Feb 2026 19:39:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 475AC6170B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011578;
	bh=nyce9baBy3EwRtSloXPfpEVSRlup0nROHvopAcNE8/g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mAxsQDEsz93QicwvOMzFwUeG/x130WAMU7KI7VvMg8E9KImm/Bo04oUPBdRgsjZx5
	 lbeArqk/jEuXoUY0eY745nCpY3t2xwrbxhjCzIqALNsezMiEDh0wH09DXtmFevPWvG
	 y3QI6p7whIkMzO95A+KFr0rKSrIgDncu+IrIHSGyYKT1C9NXxS+/TWzFiWXzLEeV6c
	 6Ziv/moFNJinvsQS58npM4Q0o2+rwCImSgqz4bEnTcbaJHWFSZZ1jvnE735hBwD/BY
	 qJvIAJeHxrnNzh2RzAm1M/mOWbZXbYMyDX56mEHRrXdsVs76/hs2jDm8PP4prfzQ2P
	 2hvvTw7ekjQOQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 475AC6170B;
	Fri, 13 Feb 2026 19:39:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E6E2EC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9282F412F6
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yweayeU5rlUS for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5BA84412F5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5BA84412F5
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 50DC983593; Fri, 13 Feb 2026 19:37:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:33:28 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 2701ece1ce60c5e8c6d1ba5fb01ec1ef6ba6d8cd
X-Git-Newrev: 6cb462204ce668f1a884d48aab3962bf0427f1e9
X-Patchwork-Hint: ignore
Message-Id: <20260213193705.50DC983593@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/squeezelite: fix
 build with gcc >= 15.x
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6cb462204ce668f1a884d48aab3962bf0427f1e9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

No autobuilder errors recorded yet.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 944b0ef086dab217eb2d38bda132eace3006d5cf)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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

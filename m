Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F2FD3B7D1
	for <buildroot@archiver.kernel.org>; Sat,  6 Dec 2025 11:34:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0D1C80EA8;
	Sat,  6 Dec 2025 11:34:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LfPc3b9uQQ0I; Sat,  6 Dec 2025 11:34:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79AD980E30
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765020875;
	bh=Fqj5UQaJGqCTXnEMNlL2XRDsMhyWj4jVdGymsbf9Xd8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hfqcl4d9BAy9+62MU7Y+vlMbC7gNxJJH3clHI5J0aF+G+gpq7K5O4H2yHc6NtifMk
	 ySYFEC+Ul8so9Nz0iF4TQT374iiRe2e5Kpqn2wWS4ZpXYnpZs8EvgB3Z24AmKK7Tlt
	 NxUHe0vqnX4UYikSBNMbY5rT3Sob+R99n4zbEfWmrnR4Q6f9K4acUr6k7yQcEpicc4
	 yLIHjnBddnG3c8XrbgVVOrfWVCiyOYqm2pwYo0Uv6XHGVjh0L2C27Vt2gLgVAy+lTO
	 +U30AZEkJOTVPcQZIlx1vj+vDYkMW+4tCcf/cDvlZMXanl4bUBd2V0ti/wbONYV46B
	 Af/JvVxMNVCbw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79AD980E30;
	Sat,  6 Dec 2025 11:34:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 06BD4E7
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 11:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E531440813
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 11:34:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cNWR4yvOeGPk for <buildroot@buildroot.org>;
 Sat,  6 Dec 2025 11:34:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 094F140811
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 094F140811
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 094F140811
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 11:34:32 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 86D63A4C0282;
 Sat,  6 Dec 2025 12:34:30 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46522)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vRqYX-000000006SZ-3Dum;
 Sat, 06 Dec 2025 11:34:30 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
Date: Sat,  6 Dec 2025 12:34:30 +0100
Message-ID: <20251206113430.571889-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765020870;
 bh=JsgcOBdk3hdS7ViXHkbJH2ImVWjK5GyesE3eyriPKAM=;
 h=From:To:Cc:Subject:Date:From;
 b=Wix80SUGPltu7ng6fIr87k4mjQmbqPViRtgsOMSC+NzY2uR1NCwe9BQrGOl27rpBj
 ua6Nb02RB1I1321H7EASHqzR5MU0y8cAiXSKM2h0/wo8TFu2W/k2avCm+i1hTJDjaf
 EDmZ7W8ymVDDMQtdON/DjOcKYtySreG1O2+Zq8rzqwVgyrF8B9tGB2KsnCSNNoGEz5
 QKV3iZI0LZ/RA3P93Y0+qVpCb7UyyPCo1zupwlk3zbyp1eG/jhkD+dCK6JNEkduEUm
 Vf+hjh4wPZHdlqfc+STtWHUm+JdRjc0gWrESYQgiQwaV9AAJc4Vdxsug/I/ZPcicsr
 XAKQm4pGOdCsw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=Wix80SUG
Subject: [Buildroot] [PATCH 1/1] package/squeezelite: fix build with gcc-15.x
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

No autobuilder errors recorded yet.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../0001-ir.c-fix-build-with-gcc-15.patch     | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 package/squeezelite/0001-ir.c-fix-build-with-gcc-15.patch

diff --git a/package/squeezelite/0001-ir.c-fix-build-with-gcc-15.patch b/package/squeezelite/0001-ir.c-fix-build-with-gcc-15.patch
new file mode 100644
index 0000000000..a472d37bd5
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
+Upstream: https://github.com/ralph-irving/squeezelite/pull/254
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
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

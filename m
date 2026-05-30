Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6536ECD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 09:21:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 297914081B;
	Sat, 30 May 2026 09:21:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hy2dHnqlPmjV; Sat, 30 May 2026 09:21:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F1A0407F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780132884;
	bh=2+p5NK0bMaZFpLtWSjUKHRQb8kYFaFkfylNipUNPWcI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=af2M61z6W/i/oiLN/virL0iPmqS8LmgKCX0NLLgFAgygFhpD3oyTT/DQabaorJzlC
	 mSI5WrMFeWHeU9sBzwqsIM4xYCGhO/WhEP1EaHM2AZxViQeimJdeObFtHLdDh5IQ3a
	 6s1YDQjR6+Z+14j7xP2Re2H4V0yZN68Re81rGgfnkRQSzp9BQ+iv7lx2auRL3shKPf
	 KYFVKH+muGofBmDra+kXgOwL8ppfhfaFIwT9ldVmZWLHLEfz1Ohe2f8hI2dJPQYQwr
	 BWROoI/YXe/OSuetJeBg13b30a6ds4fy+1FcKwyljphzVLqv45UWymDTLbMcKvcI2k
	 lU6G6dlNd79YA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F1A0407F5;
	Sat, 30 May 2026 09:21:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DFCC12F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:21:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F21B2615F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:21:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ksC1LM_CBNRo for <buildroot@buildroot.org>;
 Sat, 30 May 2026 09:21:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 302B16F495
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 302B16F495
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:21:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 38B5286C92; Sat, 30 May 2026 09:21:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 11:20:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e7533662a4362a39cfe4f37b1fd840fcc711eeb1
X-Git-Newrev: cc5aad27c617ddb2f57fa8abe224ff5521de0ebb
X-Patchwork-Hint: ignore
Message-Id: <20260530092106.38B5286C92@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/powerpc-utils: fix build with gcc
 >= 15.x
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2940202640714522876=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2940202640714522876==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cc5aad27c617ddb2f57fa8abe224ff5521de0ebb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Added upstream patch to fix build errors with gcc >= 15.x.

Fixes:
https://autobuild.buildroot.net/results/96a/96ab1d9ad8bb716f732cd76abd3b64376ec1d48f/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 ...ram.c-Correct-librtas-function-prototypes.patch | 64 ++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/package/powerpc-utils/0001-nvram.c-Correct-librtas-function-prototypes.patch b/package/powerpc-utils/0001-nvram.c-Correct-librtas-function-prototypes.patch
new file mode 100644
index 0000000000..4373e89c5f
--- /dev/null
+++ b/package/powerpc-utils/0001-nvram.c-Correct-librtas-function-prototypes.patch
@@ -0,0 +1,64 @@
+From 0c6acdae090cb74ca60c81194ac9ac819a19935f Mon Sep 17 00:00:00 2001
+From: Michal Suchanek <msuchanek@suse.de>
+Date: Mon, 4 Aug 2025 13:25:38 +0200
+Subject: [PATCH] nvram.c: Correct librtas function prototypes
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fix build breakage with GCC 15 (which assumes C23) such that and empty
+argument list is treated as zero arguments rather than an arbitrary
+number.
+
+src/nvram.c: In function ‘dump_rtas_event_entry’:
+src/nvram.c:932:18: error: too many arguments to function ‘parse_rtas_event’; expected 0, have 2
+  932 |     rtas_event = parse_rtas_event(data, len);
+      |                  ^~~~~~~~~~~~~~~~ ~~~~
+src/nvram.c:938:5: error: too many arguments to function ‘rtas_print_event’; expected 0, have 3
+  938 |     rtas_print_event(stdout, rtas_event, 0);
+      |     ^~~~~~~~~~~~~~~~ ~~~~~~
+src/nvram.c:940:5: error: too many arguments to function ‘cleanup_rtas_event’; expected 0, have 1
+  940 |     cleanup_rtas_event(rtas_event);
+      |     ^~~~~~~~~~~~~~~~~~ ~~~~~~~~~~
+In file included from src/vcpustat.c:34:
+
+Signed-off-by: Michal Suchanek <msuchanek@suse.de>
+[tyreld: add description to commit log]
+Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
+
+Upstream: https://github.com/ibm-power-utilities/powerpc-utils/commit/0c6acdae090cb74ca60c81194ac9ac819a19935f
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/nvram.c | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/src/nvram.c b/src/nvram.c
+index 1987c3d9..45a61ebf 100644
+--- a/src/nvram.c
++++ b/src/nvram.c
+@@ -886,6 +886,8 @@ dump_errlog(struct nvram *nvram)
+     return 0;
+ }
+ 
++struct rtas_event;
++
+ /**
+  * dump_rtas_event_entry
+  * @brief Dump event-scan data.
+@@ -901,11 +903,11 @@ dump_errlog(struct nvram *nvram)
+ int
+ dump_rtas_event_entry(char *data, int len)
+ {
+-    void *rtas_event;
++    struct rtas_event *rtas_event;
+     void *handle;
+-    void *(*parse_rtas_event)();
+-    void (*rtas_print_event)();
+-    void (*cleanup_rtas_event)();
++    struct rtas_event *(*parse_rtas_event)(char *, int);
++    int (*rtas_print_event)(FILE *, struct rtas_event *, int);
++    int (*cleanup_rtas_event)(struct rtas_event *);
+ 
+     handle = dlopen("/usr/lib/librtasevent.so", RTLD_LAZY);
+     if (handle == NULL)

--===============2940202640714522876==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2940202640714522876==--

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFAADC369D1
	for <buildroot@archiver.kernel.org>; Wed, 23 Apr 2025 12:34:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4131A82160;
	Wed, 23 Apr 2025 12:34:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6xr2JRN5xrrg; Wed, 23 Apr 2025 12:34:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6391382163
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6391382163;
	Wed, 23 Apr 2025 12:34:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 818D31A0
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 12:34:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 72C8D6006A
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 12:34:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UhVTjudKJGLo for <buildroot@buildroot.org>;
 Wed, 23 Apr 2025 12:34:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.146;
 helo=smtpweb146.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6FF526116B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FF526116B
Received: from smtpweb146.aruba.it (smtpweb146.aruba.it [62.149.158.146])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6FF526116B
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 12:34:20 +0000 (UTC)
Received: from localhost.localdomain ([212.103.203.10])
 by Aruba SMTP with ESMTPSA
 id 7ZIvus8iU2QPu7ZIwujSwf; Wed, 23 Apr 2025 14:34:18 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed, 23 Apr 2025 14:34:16 +0200
Message-Id: <20250423123416.310182-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfP4xu8VrQhrySUM9yOYIppSXK1Ncp2c0glzPkIw+LLC9i1aA3/1FF/8oVn1/Mljy+ZAwvZrko5P/+OPeUNWHAKj4eWFFcfPwyQwyxg+oxEZc3OC9U9wc
 s6byJorpaO8muBDyfSwCDiTQiWathPO+HgftcvarOcSDErxRdJDU3yxfOQ1GTqsXwxSTKeSXwtRoxgX2lu6aWUPWP+YJmlnT+Eyl5Zmc4DC7N6qPbKqvO6d/
 MBqukM8s/4fLPn/6zVmwshnMkGOqH71PPL6mzfTUp3juxZX7ezWUYU6KFInJA63y
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1745411658; bh=cX55nDVHnO9dkkOBb2ADCspHPaKfbXOQ2vnjXDpdwzQ=;
 h=From:To:Subject:Date:MIME-Version;
 b=lYhCDHSN5GsLSvLY0dORmAV9SG6W7KThfgtxICG8uv/rFiYQ/FLMuIlb/vuCI1h61
 eTxuT3UT/CnQOW474Olo8p5cNMMIyTgfxmFQQYj7MyvX6xTO3iOvx0wGSqOj6qKsOZ
 eC/dQRZs4I1QdShYxjf5DemETgwwHrziNg4TimhyMGhi/NIgF146Jb/CG4kj9T8Obu
 HnPGs+E/OI4neAUgTyD5yDDqR0DMzp3ODPdZI7y0zdWDEdSP9cwpXyQTbjpN3/xbFH
 djRlzOxn+zN8XuaEzVCCtK+FGHJCBWsZ2NBskevjgdodEqQHnV4xnrT2OoCKSnJvL3
 I5Jo4dkEUVtVg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=lYhCDHSN
Subject: [Buildroot] [PATCH] package/libfuse3: fix build failure with
 missing pthread_setname_np()
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

Add local patch pending upstream to guard for pthread_setname_np() presence

Fixes:
https://autobuild.buildroot.net/results/f3c/f3cfaa8ed63483858ffa32b719ea4be68ba6c4f3//

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...read_setname_np-exists-before-use-it.patch | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 package/libfuse3/0003-Check-if-pthread_setname_np-exists-before-use-it.patch

diff --git a/package/libfuse3/0003-Check-if-pthread_setname_np-exists-before-use-it.patch b/package/libfuse3/0003-Check-if-pthread_setname_np-exists-before-use-it.patch
new file mode 100644
index 0000000000..8266e8872d
--- /dev/null
+++ b/package/libfuse3/0003-Check-if-pthread_setname_np-exists-before-use-it.patch
@@ -0,0 +1,63 @@
+From 27582a0f4672f8a770e73d6a05002dea86169906 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Wed, 23 Apr 2025 14:28:29 +0200
+Subject: [PATCH] Check if pthread_setname_np() exists before use it
+
+Since pthread_setname_np() is the only pthread function that requires NPTL
+and it basically only set thread name, let's check if pthread_setname_np()
+does exist, otherwise let's not call pthread_setname_np() to shrink
+dependencies.
+
+Upstream: https://github.com/libfuse/libfuse/pull/1202
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ lib/fuse.c         | 2 ++
+ lib/fuse_loop_mt.c | 2 ++
+ meson.build        | 3 ++-
+ 3 files changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/lib/fuse.c b/lib/fuse.c
+index 136f0c2..49f5711 100644
+--- a/lib/fuse.c
++++ b/lib/fuse.c
+@@ -4917,7 +4917,9 @@ static void *fuse_prune_nodes(void *fuse)
+ 	struct fuse *f = fuse;
+ 	int sleep_time;
+ 
++#ifdef HAVE_PTHREAD_SETNAME_NP
+ 	pthread_setname_np(pthread_self(), "fuse_prune_nodes");
++#endif
+ 
+ 	while(1) {
+ 		sleep_time = fuse_clean_cache(f);
+diff --git a/lib/fuse_loop_mt.c b/lib/fuse_loop_mt.c
+index 95316f7..d6be998 100644
+--- a/lib/fuse_loop_mt.c
++++ b/lib/fuse_loop_mt.c
+@@ -132,7 +132,9 @@ static void *fuse_do_work(void *data)
+ 	struct fuse_worker *w = (struct fuse_worker *) data;
+ 	struct fuse_mt *mt = w->mt;
+ 
++#ifdef HAVE_PTHREAD_SETNAME_NP
+ 	pthread_setname_np(pthread_self(), "fuse_worker");
++#endif
+ 
+ 	while (!fuse_session_exited(mt->se)) {
+ 		int isforget = 0;
+diff --git a/meson.build b/meson.build
+index f28df3d..a3aa735 100644
+--- a/meson.build
++++ b/meson.build
+@@ -72,7 +72,8 @@ private_cfg.set_quoted('PACKAGE_VERSION', meson.project_version())
+ # Test for presence of some functions
+ test_funcs = [ 'fork', 'fstatat', 'openat', 'readlinkat', 'pipe2',
+                'splice', 'vmsplice', 'posix_fallocate', 'fdatasync',
+-               'utimensat', 'copy_file_range', 'fallocate', 'static_assert' ]
++               'utimensat', 'copy_file_range', 'fallocate', 'static_assert',
++               'pthread_setname_np' ]
+ foreach func : test_funcs
+     private_cfg.set('HAVE_' + func.to_upper(),
+         cc.has_function(func, prefix: include_default, args: args_default))
+-- 
+2.39.5
+
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

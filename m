Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D74C4829A
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 22:23:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93E4084FE5;
	Sun, 11 Feb 2024 22:23:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9A20Rr1YjYjw; Sun, 11 Feb 2024 22:23:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 791E584F93
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 791E584F93;
	Sun, 11 Feb 2024 22:23:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 777AB1BF44A
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 22:23:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 64CAE60FD6
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 22:23:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OaYyjBoEcTCf for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 22:23:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A5F760F0D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A5F760F0D
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 22:23:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7400B87844; Sun, 11 Feb 2024 22:23:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Feb 2024 23:23:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fe8f95a61ec9c4d2a1416d3f1dd327ad063beb4e
X-Git-Newrev: 8740387457f4dfccbd211ffaef1cae91db9f232d
X-Patchwork-Hint: ignore
Message-Id: <20240211222336.7400B87844@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/util-linux: fix build with -O0
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

commit: https://git.buildroot.net/buildroot/commit/?id=8740387457f4dfccbd211ffaef1cae91db9f232d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with -O0 raised since bump to version
2.39 in commit ad276d94a392fb13244e042851a44269e6254d61 and
https://github.com/util-linux/util-linux/commit/2fa4168c8bc9d5438bc1dfadda293c7c21b6fa59:

libuuid/src/gen_uuid.c: In function 'uuid_generate_time_generic':
libuuid/src/gen_uuid.c:536:33: error: initializer element is not constant
  THREAD_LOCAL int  cache_size = cs_min;
                                 ^~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/7c9b8508345ffaba167c08521fb865d76555be1d
 - http://autobuild.buildroot.org/results/2f80a5cdb523cc3c8c0f3693607a1be036b2ae98

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...uid-src-gen_uuid.c-fix-cs_min-declaration.patch | 80 ++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/package/util-linux/0001-libuuid-src-gen_uuid.c-fix-cs_min-declaration.patch b/package/util-linux/0001-libuuid-src-gen_uuid.c-fix-cs_min-declaration.patch
new file mode 100644
index 0000000000..bba4d54619
--- /dev/null
+++ b/package/util-linux/0001-libuuid-src-gen_uuid.c-fix-cs_min-declaration.patch
@@ -0,0 +1,80 @@
+From bcd11dece7d278bb0b76b138d08dedea80fa8262 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 7 Nov 2023 18:43:57 +0100
+Subject: [PATCH] libuuid/src/gen_uuid.c: fix cs_min declaration
+
+Define cs_min through a define and not a const int to avoid the
+following build failure with -O0 raised since version 2.39 and
+https://github.com/util-linux/util-linux/commit/2fa4168c8bc9d5438bc1dfadda293c7c21b6fa59:
+
+libuuid/src/gen_uuid.c: In function 'uuid_generate_time_generic':
+libuuid/src/gen_uuid.c:536:33: error: initializer element is not constant
+  THREAD_LOCAL int  cache_size = cs_min;
+                                 ^~~~~~
+
+For consistency, also use define for cs_max and cs_factor
+
+Fixes:
+ - http://autobuild.buildroot.org/results/2f80a5cdb523cc3c8c0f3693607a1be036b2ae98
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/util-linux/util-linux/commit/07e5c29d501c19e7af84fecb5915e0f9f94cb49f
+---
+ libuuid/src/gen_uuid.c | 19 ++++++++++---------
+ 1 file changed, 10 insertions(+), 9 deletions(-)
+
+diff --git a/libuuid/src/gen_uuid.c b/libuuid/src/gen_uuid.c
+index 619ef0131..db793c374 100644
+--- a/libuuid/src/gen_uuid.c
++++ b/libuuid/src/gen_uuid.c
+@@ -518,6 +518,10 @@ int __uuid_generate_time_cont(uuid_t out, int *num, uint32_t cont_offset)
+ 	return __uuid_generate_time_internal(out, num, cont_offset);
+ }
+ 
++#define CS_MIN		(1<<6)
++#define CS_MAX		(1<<18)
++#define CS_FACTOR	2
++
+ /*
+  * Generate time-based UUID and store it to @out
+  *
+@@ -529,11 +533,8 @@ int __uuid_generate_time_cont(uuid_t out, int *num, uint32_t cont_offset)
+ static int uuid_generate_time_generic(uuid_t out) {
+ #ifdef HAVE_TLS
+ 	/* thread local cache for uuidd based requests */
+-	const int			cs_min = (1<<6);
+-	const int			cs_max = (1<<18);
+-	const int			cs_factor = 2;
+ 	THREAD_LOCAL int		num = 0;
+-	THREAD_LOCAL int		cache_size = cs_min;
++	THREAD_LOCAL int		cache_size = CS_MIN;
+ 	THREAD_LOCAL int		last_used = 0;
+ 	THREAD_LOCAL struct uuid	uu;
+ 	THREAD_LOCAL time_t		last_time = 0;
+@@ -552,10 +553,10 @@ static int uuid_generate_time_generic(uuid_t out) {
+ 		 * Start with a small cache size to cover short running applications
+ 		 * and adjust the cache size over the runntime.
+ 		 */
+-		if ((last_used == cache_size) && (cache_size < cs_max))
+-			cache_size *= cs_factor;
+-		else if ((last_used < (cache_size / cs_factor)) && (cache_size > cs_min))
+-			cache_size /= cs_factor;
++		if ((last_used == cache_size) && (cache_size < CS_MAX))
++			cache_size *= CS_FACTOR;
++		else if ((last_used < (cache_size / CS_FACTOR)) && (cache_size > CS_MIN))
++			cache_size /= CS_FACTOR;
+ 
+ 		num = cache_size;
+ 
+@@ -568,7 +569,7 @@ static int uuid_generate_time_generic(uuid_t out) {
+ 		}
+ 		/* request to daemon failed, reset cache */
+ 		num = 0;
+-		cache_size = cs_min;
++		cache_size = CS_MIN;
+ 	}
+ 	if (num > 0) { /* serve uuid from cache */
+ 		uu.time_low++;
+-- 
+2.43.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B77C7EB64DD
	for <buildroot@archiver.kernel.org>; Sun, 16 Jul 2023 06:21:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C26881B7B;
	Sun, 16 Jul 2023 06:21:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C26881B7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9KB6eDV4JNyl; Sun, 16 Jul 2023 06:21:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89BD581B69;
	Sun, 16 Jul 2023 06:21:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89BD581B69
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2CD6E1BF322
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 06:21:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 06B4D40354
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 06:21:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06B4D40354
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cPEzRPN1Ym1L for <buildroot@lists.busybox.net>;
 Sun, 16 Jul 2023 06:21:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D99CD40489
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 06:21:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D99CD40489
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C544187033; Sun, 16 Jul 2023 06:21:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 16 Jul 2023 08:03:09 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: c6f2655481149ddd080e4123959571ee80a5c00b
X-Git-Newrev: b8b36712ef1d1ebf18f80d8e993d9f96be3ea6a9
X-Patchwork-Hint: ignore
Message-Id: <20230716062108.C544187033@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/audit: fix musl
 build
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

commit: https://git.buildroot.net/buildroot/commit/?id=b8b36712ef1d1ebf18f80d8e993d9f96be3ea6a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Fixes:
http://autobuild.buildroot.net/results/a52/a52ff08c3373ffb253b89e9197671583354d1360/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 7a27b230ab023b3dfd9ac1e7f0d0b8bbde1928c1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ttribute_malloc__-with-__attribute__-__ma.patch | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/package/audit/0001-Replace-__attribute_malloc__-with-__attribute__-__ma.patch b/package/audit/0001-Replace-__attribute_malloc__-with-__attribute__-__ma.patch
new file mode 100644
index 0000000000..1a276ca2df
--- /dev/null
+++ b/package/audit/0001-Replace-__attribute_malloc__-with-__attribute__-__ma.patch
@@ -0,0 +1,39 @@
+From 79c8d6a2755c9dfa00a5e86378e89a94eef0504d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 9 Aug 2022 23:57:03 -0700
+Subject: [PATCH] Replace __attribute_malloc__ with 
+ __attribute__((__malloc__))
+
+__attribute_malloc__ is not available on musl
+
+Fixes
+| ../../git/auparse/auparse.h:54:2: error: expected function body after function declarator
+|         __attribute_malloc__ __attr_dealloc (auparse_destroy, 1);
+|         ^
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream: https://github.com/linux-audit/audit-userspace/pull/311
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+
+ auparse/auparse.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/auparse/auparse.h b/auparse/auparse.h
+index 95cf256d..c7dbe5ff 100644
+--- a/auparse/auparse.h
++++ b/auparse/auparse.h
+@@ -51,7 +51,7 @@ typedef void (*auparse_callback_ptr)(auparse_state_t *au,
+ void auparse_destroy(auparse_state_t *au);
+ void auparse_destroy_ext(auparse_state_t *au, auparse_destroy_what_t what);
+ auparse_state_t *auparse_init(ausource_t source, const void *b)
+-	__attribute_malloc__ __attr_dealloc (auparse_destroy, 1);
++	__attribute__((__malloc__)) __attr_dealloc (auparse_destroy, 1);
+ int auparse_new_buffer(auparse_state_t *au, const char *data, size_t data_len)
+ 	__attr_access ((__read_only__, 2, 3));
+ int auparse_feed(auparse_state_t *au, const char *data, size_t data_len)
+-- 
+2.37.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

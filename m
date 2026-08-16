Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 501BFC5DF6D
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 15:06:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1ABF2406BE;
	Sun, 16 Aug 2026 15:06:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I5Hlr_RtG0io; Sun, 16 Aug 2026 15:06:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D5A9406BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786892767;
	bh=jQWpbm7SQKV4uJsWX2xDLTOEAuM23lWE0GMcxoNy+0s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MTHKd7CSAhV49KoeWBZjhCiFNmLNoBFtqal5hiiA8/6dDNhi4MdLEnZDIYOiKx5li
	 6o9xkzZA3zkXYPhlaw7TspM1vIOpHd6tHXfObjD6RxytPxVf8y//ufgZgNQwRHq43z
	 Ic0iRudMd75VdFGIAG5Hz/DjHn6Buu5tvsGrsLGuaRNvjbxUjXmGIfpibsP6ZFrxKM
	 lR8XAkBvVuKSV2zvvQE8+VzBj/X/A4FoPXTAdIgDpK4/YqgtVLawKpWcYXTpse0IXP
	 T7831nwlie+DJT3M6zDCagINrZYYoROeZE6ZpB/ny+itEPW+M87CPcmtIeket6To5w
	 YEitP6o3zUbvQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D5A9406BF;
	Sun, 16 Aug 2026 15:06:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C1108147
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 15:06:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A6F88406BF
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 15:06:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jSVYWznuQEIY for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 15:06:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9DD2406BE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C9DD2406BE
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 15:06:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B169F8DABA; Sun, 16 Aug 2026 15:05:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 16 Aug 2026 17:05:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0c349a881332d76ef6f0526a3224facc0c8a7a48
X-Git-Newrev: 9ac19958f25a58df65b991ec1d7fa80b34f19eb0
X-Patchwork-Hint: ignore
Message-Id: <20260816150514.B169F8DABA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/binutils: add build fixes for host
 gcc 16.x
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9ac19958f25a58df65b991ec1d7fa80b34f19eb0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Backport upstream patch already included in binutils 2.46 to older
supported versions to fix build errors in gprofng with host gcc 16.x.

Fixes:
2.45.1: https://autobuild.buildroot.net/results/235/235c8a176dada9f9cb5541fcdd188e8f01f4cd22/
2.44: https://autobuild.buildroot.net/results/a53/a53c06dd61083451f9092ed1544619ca4a62211d/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...g-protect-against-standard-library-macros.patch | 35 ++++++++++++++++++++++
 ...g-protect-against-standard-library-macros.patch | 35 ++++++++++++++++++++++
 2 files changed, 70 insertions(+)

diff --git a/package/binutils/2.44/0005-gprofng-protect-against-standard-library-macros.patch b/package/binutils/2.44/0005-gprofng-protect-against-standard-library-macros.patch
new file mode 100644
index 0000000000..b344d7e2f6
--- /dev/null
+++ b/package/binutils/2.44/0005-gprofng-protect-against-standard-library-macros.patch
@@ -0,0 +1,35 @@
+From 5f66aee7f4bec7a2d8378034116f5e5c3dc50f41 Mon Sep 17 00:00:00 2001
+From: Andreas Schwab <schwab@suse.de>
+Date: Sat, 22 Nov 2025 11:29:43 +0100
+Subject: [PATCH] gprofng: protect against standard library macros
+
+The CALL_UTIL macro can expand to an unparsable expression of the argument
+is a macro, like with the new const-preserving standard library macros in
+C23.
+
+	* gprofng/src/collector_module.h (CALL_UTIL): Add parens to not
+	expand its argument if it is a function-like macro.
+
+Upstream: https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=5f66aee7f4bec7a2d8378034116f5e5c3dc50f41
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ gprofng/src/collector_module.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gprofng/src/collector_module.h b/gprofng/src/collector_module.h
+index b64d69c45ab..859a6dd1f7d 100644
+--- a/gprofng/src/collector_module.h
++++ b/gprofng/src/collector_module.h
+@@ -119,7 +119,7 @@ typedef struct CollectorUtilFuncs
+ extern CollectorUtilFuncs __collector_util_funcs;
+ extern int __collector_dlsym_guard;
+ 
+-#define CALL_UTIL(x) __collector_util_funcs.x
++#define CALL_UTIL(x) (__collector_util_funcs.x)
+ 
+ /* The following constants define the meaning of the "void *arg"
+  * argument of getFrameInfo().
+-- 
+2.43.7
+
diff --git a/package/binutils/2.45.1/0004-gprofng-protect-against-standard-library-macros.patch b/package/binutils/2.45.1/0004-gprofng-protect-against-standard-library-macros.patch
new file mode 100644
index 0000000000..b344d7e2f6
--- /dev/null
+++ b/package/binutils/2.45.1/0004-gprofng-protect-against-standard-library-macros.patch
@@ -0,0 +1,35 @@
+From 5f66aee7f4bec7a2d8378034116f5e5c3dc50f41 Mon Sep 17 00:00:00 2001
+From: Andreas Schwab <schwab@suse.de>
+Date: Sat, 22 Nov 2025 11:29:43 +0100
+Subject: [PATCH] gprofng: protect against standard library macros
+
+The CALL_UTIL macro can expand to an unparsable expression of the argument
+is a macro, like with the new const-preserving standard library macros in
+C23.
+
+	* gprofng/src/collector_module.h (CALL_UTIL): Add parens to not
+	expand its argument if it is a function-like macro.
+
+Upstream: https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=5f66aee7f4bec7a2d8378034116f5e5c3dc50f41
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ gprofng/src/collector_module.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gprofng/src/collector_module.h b/gprofng/src/collector_module.h
+index b64d69c45ab..859a6dd1f7d 100644
+--- a/gprofng/src/collector_module.h
++++ b/gprofng/src/collector_module.h
+@@ -119,7 +119,7 @@ typedef struct CollectorUtilFuncs
+ extern CollectorUtilFuncs __collector_util_funcs;
+ extern int __collector_dlsym_guard;
+ 
+-#define CALL_UTIL(x) __collector_util_funcs.x
++#define CALL_UTIL(x) (__collector_util_funcs.x)
+ 
+ /* The following constants define the meaning of the "void *arg"
+  * argument of getFrameInfo().
+-- 
+2.43.7
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

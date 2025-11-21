Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47579CFC281
	for <buildroot@archiver.kernel.org>; Fri, 21 Nov 2025 21:26:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 055E742B98;
	Fri, 21 Nov 2025 21:26:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GXrenrUmdMfG; Fri, 21 Nov 2025 21:26:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BE1B42B8F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BE1B42B8F;
	Fri, 21 Nov 2025 21:26:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6BB70122
 for <buildroot@buildroot.org>; Fri, 21 Nov 2025 21:26:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5ED0F80779
 for <buildroot@buildroot.org>; Fri, 21 Nov 2025 21:26:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kLFNVEeFhM3e for <buildroot@buildroot.org>;
 Fri, 21 Nov 2025 21:26:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56F5580773
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 56F5580773
 for <buildroot@buildroot.org>; Fri, 21 Nov 2025 21:26:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 42D9C85D5A; Fri, 21 Nov 2025 21:26:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 21 Nov 2025 22:13:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7c8edc1b402efcd7bba2dabfe0b3be877adaed7a
X-Git-Newrev: 016993bd9ab334f4419cbb9b2e9c383e7554d4df
X-Patchwork-Hint: ignore
Message-Id: <20251121212650.42D9C85D5A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sane-backends: fix build with gcc
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=016993bd9ab334f4419cbb9b2e9c383e7554d4df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
https://autobuild.buildroot.net/results/296/2961e7aa23d66e7cf364c2caeafc1c226ccd48d9/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...0002-sm3600.h-Fix-build-with-standard-C23.patch | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/package/sane-backends/0002-sm3600.h-Fix-build-with-standard-C23.patch b/package/sane-backends/0002-sm3600.h-Fix-build-with-standard-C23.patch
new file mode 100644
index 0000000000..287de48285
--- /dev/null
+++ b/package/sane-backends/0002-sm3600.h-Fix-build-with-standard-C23.patch
@@ -0,0 +1,38 @@
+From 90815a9f2576c2428287a500cab6caeddb80f9a8 Mon Sep 17 00:00:00 2001
+From: Zdenek Dohnal <zdohnal@redhat.com>
+Date: Wed, 5 Feb 2025 13:19:11 +0100
+Subject: [PATCH] sm3600.h: Fix build with standard C23
+
+bool, true and false are keywords in the standard C23 - the sm3600
+backend defines them on its own, which is forbidden with the new
+standard.
+
+The patch adds ifdef guards for the affected typedef - the old code
+will be used for older standards, C23 will define TBool as bool.
+
+Upstream: https://gitlab.com/sane-project/backends/-/commit/90815a9f2576c2428287a500cab6caeddb80f9a8
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ backend/sm3600.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/backend/sm3600.h b/backend/sm3600.h
+index 2ecbeb236..5d8a8d809 100644
+--- a/backend/sm3600.h
++++ b/backend/sm3600.h
+@@ -77,7 +77,11 @@ Start: 2.4.2001
+ 
+ /* ====================================================================== */
+ 
++#if !defined(__STDC_VERSION__) || __STDC_VERSION__ < 202311L
+ typedef enum { false, true } TBool;
++#else
++typedef bool TBool;
++#endif /* GCC < 15 */
+ 
+ typedef SANE_Status TState;
+ 
+-- 
+GitLab
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

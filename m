Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99E30C83F1D
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 10:21:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F15D83F9F;
	Fri, 11 Jul 2025 10:21:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jRxaTtUDyMjT; Fri, 11 Jul 2025 10:21:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C9E383F86
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C9E383F86;
	Fri, 11 Jul 2025 10:21:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BFFA31E1
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:21:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4CD8E40CAC
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:21:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eRPNdXUu1bfx for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 10:21:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C74E240E95
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C74E240E95
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:21:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C420386377; Fri, 11 Jul 2025 10:21:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 10 Jul 2025 11:39:56 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 869270f6ba77fb522f38434d05997019394273da
X-Git-Newrev: 9b2aa912c0a4dd63c73ff33d1e4b484d5c91da15
X-Patchwork-Hint: ignore
Message-Id: <20250711102104.C420386377@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] boot/at91bootstrap3: fix
 build with host GCC 15
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
Content-Type: multipart/mixed; boundary="===============8142906882642590245=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8142906882642590245==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=9b2aa912c0a4dd63c73ff33d1e4b484d5c91da15
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Building at91bootstrap3 with GCC 15 fails with:

    include/types.h:23:23: error: ‘bool’ cannot be defined via ‘typedef’
       23 | typedef unsigned char bool;
          |                       ^~~~
    include/types.h:23:23: note: ‘bool’ is a keyword with ‘-std=c23’ onwards

This is due to GCC 15 defaulting to the C23 language dialect.

Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
(cherry picked from commit 500678593fee1cdf61220f7d32b1ecdf9607afef)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...es.h-conditionally-define-bool-false-and-.patch | 47 ++++++++++++++++++++++
 ...es.h-conditionally-define-bool-false-and-.patch | 46 +++++++++++++++++++++
 2 files changed, 93 insertions(+)

diff --git a/boot/at91bootstrap3/v3.10.3/0001-include-types.h-conditionally-define-bool-false-and-.patch b/boot/at91bootstrap3/v3.10.3/0001-include-types.h-conditionally-define-bool-false-and-.patch
new file mode 100644
index 0000000000..352c1c0a43
--- /dev/null
+++ b/boot/at91bootstrap3/v3.10.3/0001-include-types.h-conditionally-define-bool-false-and-.patch
@@ -0,0 +1,47 @@
+From 908c65678867565a934ea5a967bfe7e204d1ccaf Mon Sep 17 00:00:00 2001
+From: Edgar Bonet <bonet@grenoble.cnrs.fr>
+Date: Wed, 25 Jun 2025 11:13:43 +0200
+Subject: [PATCH] include/types.h: conditionally define bool, false and true
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+include/types.h typedefs ‘bool’ and macro-defines ‘false’ and ‘true’.
+However, since C23, these are predefine keywords. As C23 is the default
+C dialect for GCC 15, building with this compiler fails with:
+
+    include/types.h:23:23: error: ‘bool’ cannot be defined via ‘typedef’
+       23 | typedef unsigned char bool;
+          |                       ^~~~
+    include/types.h:23:23: note: ‘bool’ is a keyword with ‘-std=c23’ onwards
+
+Fix this build failure by only defining ‘bool’, ‘false’ and ‘true’ on C
+dialects older than C23.
+
+Upstream: https://github.com/linux4sam/at91bootstrap/pull/188
+[Edgar: backport to v3.10.3]
+
+Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
+---
+ include/types.h | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/include/types.h b/include/types.h
+index 1246a4df..2c1a41cf 100644
+--- a/include/types.h
++++ b/include/types.h
+@@ -42,8 +42,11 @@ typedef signed long long s64;
+ typedef unsigned long size_t;
+ typedef signed long ssize_t;
+ 
++/* bool, false and true are predefined since C23. */
++#if __STDC_VERSION__ < 202311L
+ typedef unsigned char bool;
+ #define false	0U
+ #define true	1U
++#endif
+ 
+ #endif /* TYPES_H_ */
+-- 
+2.43.0
+
diff --git a/boot/at91bootstrap3/v4.0.0/0001-include-types.h-conditionally-define-bool-false-and-.patch b/boot/at91bootstrap3/v4.0.0/0001-include-types.h-conditionally-define-bool-false-and-.patch
new file mode 100644
index 0000000000..772a808690
--- /dev/null
+++ b/boot/at91bootstrap3/v4.0.0/0001-include-types.h-conditionally-define-bool-false-and-.patch
@@ -0,0 +1,46 @@
+From 4aab60e634d588dffbd3154fd0cfce78272b750a Mon Sep 17 00:00:00 2001
+From: Edgar Bonet <bonet@grenoble.cnrs.fr>
+Date: Wed, 25 Jun 2025 11:13:43 +0200
+Subject: [PATCH] include/types.h: conditionally define bool, false and true
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+include/types.h typedefs ‘bool’ and macro-defines ‘false’ and ‘true’.
+However, since C23, these are predefine keywords. As C23 is the default
+C dialect for GCC 15, building with this compiler fails with:
+
+    include/types.h:23:23: error: ‘bool’ cannot be defined via ‘typedef’
+       23 | typedef unsigned char bool;
+          |                       ^~~~
+    include/types.h:23:23: note: ‘bool’ is a keyword with ‘-std=c23’ onwards
+
+Fix this build failure by only defining ‘bool’, ‘false’ and ‘true’ on C
+dialects older than C23.
+
+Upstream: https://github.com/linux4sam/at91bootstrap/pull/188
+
+Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
+---
+ include/types.h | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/include/types.h b/include/types.h
+index 950b1a46..0ad9ae61 100644
+--- a/include/types.h
++++ b/include/types.h
+@@ -20,8 +20,11 @@ typedef signed long long s64;
+ typedef unsigned long size_t;
+ typedef signed long ssize_t;
+ 
++/* bool, false and true are predefined since C23. */
++#if __STDC_VERSION__ < 202311L
+ typedef unsigned char bool;
+ #define false	0U
+ #define true	1U
++#endif
+ 
+ #endif /* TYPES_H_ */
+-- 
+2.43.0
+

--===============8142906882642590245==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8142906882642590245==--

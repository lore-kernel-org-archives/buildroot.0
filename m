Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 162F3C433F5
	for <buildroot@archiver.kernel.org>; Sun, 29 May 2022 21:00:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C1FF640B1D;
	Sun, 29 May 2022 21:00:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ldB2QJ-Lr2Bo; Sun, 29 May 2022 21:00:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C0A1D408DB;
	Sun, 29 May 2022 21:00:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0DE901BF3D7
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 21:00:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F16A184103
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 21:00:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BgQ1xnxMMChZ for <buildroot@lists.busybox.net>;
 Sun, 29 May 2022 21:00:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 42AA284102
 for <buildroot@buildroot.org>; Sun, 29 May 2022 21:00:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 9555386711; Sun, 29 May 2022 20:49:22 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 29 May 2022 23:00:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 601323915edcffcea6b03f71d6b03c9a826801f5
X-Git-Newrev: 5ce233da959882032af6e64e71541425247cc397
X-Patchwork-Hint: ignore
Message-Id: <20220529204922.9555386711@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pipewire: fix uclibc without
 locale support build
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

commit: https://git.buildroot.net/buildroot/commit/?id=5ce233da959882032af6e64e71541425247cc397
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Backport a patch fixing uclibc support when locale support is not
enabled.

Fixes:
http://autobuild.buildroot.net/results/658/658ace73425c93dfa34212564d19395c9018f3e6

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...ix-build-on-uclibc-without-locale-support.patch | 65 ++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/package/pipewire/0001-Fix-build-on-uclibc-without-locale-support.patch b/package/pipewire/0001-Fix-build-on-uclibc-without-locale-support.patch
new file mode 100644
index 0000000000..0f2e6844e5
--- /dev/null
+++ b/package/pipewire/0001-Fix-build-on-uclibc-without-locale-support.patch
@@ -0,0 +1,65 @@
+From 4738c934bbf2a86aa62d752a130d13c524a47696 Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Fri, 20 May 2022 20:18:07 -0600
+Subject: [PATCH] Fix build on uclibc without locale support
+
+When uclibc is build with !UCLIBC_HAS_LOCALE the macro
+__LOCALE_C_ONLY will be set, use this to disable unsupported and
+not required(due to only supporting the C locale) locale functions.
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[james.hilliard1@gmail.com: backport from upstream commit
+4738c934bbf2a86aa62d752a130d13c524a47696]
+---
+ spa/include/spa/utils/string.h | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/spa/include/spa/utils/string.h b/spa/include/spa/utils/string.h
+index 43d19616c..edf4e954f 100644
+--- a/spa/include/spa/utils/string.h
++++ b/spa/include/spa/utils/string.h
+@@ -275,14 +275,20 @@ static inline int spa_scnprintf(char *buffer, size_t size, const char *format, .
+  */
+ static inline float spa_strtof(const char *str, char **endptr)
+ {
++#ifndef __LOCALE_C_ONLY
+ 	static locale_t locale = NULL;
+ 	locale_t prev;
++#endif
+ 	float v;
++#ifndef __LOCALE_C_ONLY
+ 	if (SPA_UNLIKELY(locale == NULL))
+ 		locale = newlocale(LC_ALL_MASK, "C", NULL);
+ 	prev = uselocale(locale);
++#endif
+ 	v = strtof(str, endptr);
++#ifndef __LOCALE_C_ONLY
+ 	uselocale(prev);
++#endif
+ 	return v;
+ }
+ 
+@@ -319,14 +325,20 @@ static inline bool spa_atof(const char *str, float *val)
+  */
+ static inline double spa_strtod(const char *str, char **endptr)
+ {
++#ifndef __LOCALE_C_ONLY
+ 	static locale_t locale = NULL;
+ 	locale_t prev;
++#endif
+ 	double v;
++#ifndef __LOCALE_C_ONLY
+ 	if (SPA_UNLIKELY(locale == NULL))
+ 		locale = newlocale(LC_ALL_MASK, "C", NULL);
+ 	prev = uselocale(locale);
++#endif
+ 	v = strtod(str, endptr);
++#ifndef __LOCALE_C_ONLY
+ 	uselocale(prev);
++#endif
+ 	return v;
+ }
+ 
+-- 
+2.25.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65111E728E2
	for <buildroot@archiver.kernel.org>; Fri, 29 Sep 2023 20:01:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3DD783CE7;
	Fri, 29 Sep 2023 20:01:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3DD783CE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hmF_8PhzN4m9; Fri, 29 Sep 2023 20:01:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F20D683CE0;
	Fri, 29 Sep 2023 20:01:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F20D683CE0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 30C991BF357
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 20:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0AC2360F26
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 20:01:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0AC2360F26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ObiYFbE4IXfy for <buildroot@lists.busybox.net>;
 Fri, 29 Sep 2023 20:01:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 13D2760F17
 for <buildroot@buildroot.org>; Fri, 29 Sep 2023 20:01:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13D2760F17
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0129A835E2; Fri, 29 Sep 2023 20:01:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 29 Sep 2023 21:30:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 34f8d874eeffb8309a174d3423d8f350d68ab3eb
X-Git-Newrev: d3fd120a7906cac51dc9e423c8b0e1cdbd976730
X-Patchwork-Hint: ignore
Message-Id: <20230929200114.0129A835E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/localedef: build issue with old
 glibc (<= 2.38)
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

commit: https://git.buildroot.net/buildroot/commit/?id=d3fd120a7906cac51dc9e423c8b0e1cdbd976730
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While building host-localedef from glibc 2.38 sources, it uses the
features.h header from its sources that define _ISOC2X_SOURCE 1 as
soon as _GNU_SOURCE is defined.

_ISOC2X_SOURCE enable __GLIBC_USE_ISOC2X 1 that enable the header
redirection to use __isoc23_* functions introduced in glibc 2.38 [1].

If an older version is installed on the host, those functions
doesn't exist and break the build.

Add a local patch to keep _ISOC2X_SOURCE and __GLIBC_USE_ISOC2X
disabled.

Fixes:
host-localedef-2.38-13-g92201f16cbcfd9eafe314ef6654be2ea7ba25675/build/locale/ld-ctype.o: in function `ctype_read':
ld-ctype.c:(.text+0x6cef): undefined reference to `__isoc23_strtoul'

(glibc 2.31 installed on the host)

[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=64924422a99690d147a166b4de3103f3bf3eaf6c

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ISOC2X_SOURCE-undefined-to-build-localede.patch | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/package/localedef/0003-HACK-keep-_ISOC2X_SOURCE-undefined-to-build-localede.patch b/package/localedef/0003-HACK-keep-_ISOC2X_SOURCE-undefined-to-build-localede.patch
new file mode 100644
index 0000000000..741bd7b47f
--- /dev/null
+++ b/package/localedef/0003-HACK-keep-_ISOC2X_SOURCE-undefined-to-build-localede.patch
@@ -0,0 +1,32 @@
+From babfa64585bef6c53c1d399a1c244aea89437c9e Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Sat, 9 Sep 2023 23:58:50 +0200
+Subject: [PATCH] HACK: keep _ISOC2X_SOURCE undefined to build localedef with
+ old glibc
+
+Fixes:
+host-localedef-2.38-13-g92201f16cbcfd9eafe314ef6654be2ea7ba25675/build/locale/ld-ctype.o: in function `ctype_read':
+ld-ctype.c:(.text+0x6cef): undefined reference to `__isoc23_strtoul'
+
+Upstream: Not applicable
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ include/features.h | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/include/features.h b/include/features.h
+index 7c51b4a2e4..f385370d18 100644
+--- a/include/features.h
++++ b/include/features.h
+@@ -207,7 +207,6 @@
+ # undef  _ISOC11_SOURCE
+ # define _ISOC11_SOURCE	1
+ # undef  _ISOC2X_SOURCE
+-# define _ISOC2X_SOURCE	1
+ # undef  _POSIX_SOURCE
+ # define _POSIX_SOURCE	1
+ # undef  _POSIX_C_SOURCE
+-- 
+2.41.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

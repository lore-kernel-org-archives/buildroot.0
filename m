Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A07C54E49
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 16:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0DE38201D;
	Sun,  3 Mar 2024 16:48:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rNwgcTzlfkyt; Sun,  3 Mar 2024 16:48:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BDC182023
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1BDC182023;
	Sun,  3 Mar 2024 16:48:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BA8EF1BF575
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 16:48:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B26174072D
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 16:48:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bCpxcXYA2q6C for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 16:48:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAD8F4014B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BAD8F4014B
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 16:48:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A835A87FDB; Sun,  3 Mar 2024 16:48:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 Mar 2024 17:44:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c2d218eb7266ddf7fe157bb7b58da58429ef4f8e
X-Git-Newrev: c9de634b082e9d5a8f52f7c983a481105696d347
X-Patchwork-Hint: ignore
Message-Id: <20240303164812.A835A87FDB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dash: fix static build
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c9de634b082e9d5a8f52f7c983a481105696d347
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop -Wl,--fatal-warnings with --enable-static to avoid the following
static build failure:

configure:4778: checking for strtod
configure:4778: /home/autobuild/autobuild/instance-8/output-1/host/bin/powerpc-buildroot-linux-uclibcspe-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -mabi=spe -mfloat-gprs=single -Wa,-me500 -Os -g0  -static -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -static -Wl,--fatal-warnings conftest.c  >&5
/home/autobuild/autobuild/instance-8/output-1/host/lib/gcc/powerpc-buildroot-linux-uclibcspe/8.4.0/../../../../powerpc-buildroot-linux-uclibcspe/bin/ld: warning: conftest has a LOAD segment with RWX permissions
collect2: error: ld returned 1 exit status

[...]

In file included from arith_yylex.c:44:
system.h:74:22: error: static declaration of 'strtod' follows non-static declaration
 static inline double strtod(const char *nptr, char **endptr)
                      ^~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/a54fdc7d1b94beb47203373ae35b08d9cea8d42c
 - http://autobuild.buildroot.org/results/a4287b86186bf0a1d5370cf53123b324ae65c1da

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .../0001-configure.ac-drop-Wl-fatal-warnings.patch | 45 ++++++++++++++++++++++
 package/dash/dash.mk                               |  2 +
 2 files changed, 47 insertions(+)

diff --git a/package/dash/0001-configure.ac-drop-Wl-fatal-warnings.patch b/package/dash/0001-configure.ac-drop-Wl-fatal-warnings.patch
new file mode 100644
index 0000000000..eaa5d6cc60
--- /dev/null
+++ b/package/dash/0001-configure.ac-drop-Wl-fatal-warnings.patch
@@ -0,0 +1,45 @@
+From 7d07f683b83ef9fbdf258ce61b022b32f06f253a Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 16 Feb 2024 17:26:28 +0100
+Subject: [PATCH] configure.ac: drop -Wl,--fatal-warnings
+
+Drop -Wl,--fatal-warnings with --enable-static to avoid the following
+static build failure:
+
+configure:4778: checking for strtod
+configure:4778: /home/autobuild/autobuild/instance-8/output-1/host/bin/powerpc-buildroot-linux-uclibcspe-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -mabi=spe -mfloat-gprs=single -Wa,-me500 -Os -g0  -static -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -static -Wl,--fatal-warnings conftest.c  >&5
+/home/autobuild/autobuild/instance-8/output-1/host/lib/gcc/powerpc-buildroot-linux-uclibcspe/8.4.0/../../../../powerpc-buildroot-linux-uclibcspe/bin/ld: warning: conftest has a LOAD segment with RWX permissions
+collect2: error: ld returned 1 exit status
+
+[...]
+
+In file included from arith_yylex.c:44:
+system.h:74:22: error: static declaration of 'strtod' follows non-static declaration
+ static inline double strtod(const char *nptr, char **endptr)
+                      ^~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/a54fdc7d1b94beb47203373ae35b08d9cea8d42c
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://lore.kernel.org/dash/20240216163319.860768-1-fontaine.fabrice@gmail.com
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 5524650..6993364 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -34,7 +34,7 @@ fi
+ AC_ARG_ENABLE(static, AS_HELP_STRING(--enable-static, \
+ 				     [Build statical linked program]))
+ if test "$enable_static" = "yes"; then
+-	export LDFLAGS="-static -Wl,--fatal-warnings"
++	export LDFLAGS="-static"
+ fi
+ 
+ AC_ARG_ENABLE(fnmatch, AS_HELP_STRING(--disable-fnmatch, \
+-- 
+2.43.0
+
diff --git a/package/dash/dash.mk b/package/dash/dash.mk
index 6efc71e568..aebfd28be8 100644
--- a/package/dash/dash.mk
+++ b/package/dash/dash.mk
@@ -8,6 +8,8 @@ DASH_VERSION = 0.5.11.5
 DASH_SITE = http://gondor.apana.org.au/~herbert/dash/files
 DASH_LICENSE = BSD-3-Clause, GPL-2.0+ (mksignames.c)
 DASH_LICENSE_FILES = COPYING
+# We're patching configure.ac
+DASH_AUTORECONF = YES
 
 # dash does not build in parallel
 DASH_MAKE = $(MAKE1)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

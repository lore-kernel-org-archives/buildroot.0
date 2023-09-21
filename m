Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE7DEE7D0A8
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 19:31:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 571A183C80;
	Thu, 21 Sep 2023 19:31:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 571A183C80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nHNW_XABs8zU; Thu, 21 Sep 2023 19:31:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E1A083CB5;
	Thu, 21 Sep 2023 19:31:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E1A083CB5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A60A21BF390
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 19:31:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A1514193B
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 19:31:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A1514193B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ia5DSrI62var for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 19:31:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 644CF41931
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 19:31:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 644CF41931
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5072B874F6; Thu, 21 Sep 2023 19:31:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 21 Sep 2023 21:28:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 056958724b8c7581aff2bc022841c1ca6db1e590
X-Git-Newrev: c6e40c2e3e450bc8018638acf937868757ab28a4
X-Patchwork-Hint: ignore
Message-Id: <20230921193103.5072B874F6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pound: include limits.h
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

commit: https://git.buildroot.net/buildroot/commit/?id=c6e40c2e3e450bc8018638acf937868757ab28a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump to version 4.8 in
commit 525cb6a8fbe04a959ea6e3a21a3f6f8828d7e9dc and
https://github.com/graygnuorg/pound/commit/c951f2357d9f606a9e1f8727e74b55f1da91fa2f:

Fixes:
 - http://autobuild.buildroot.org/results/4edfffcd5d4383c57947d97139331e0bf2cb6155

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pound/0001-include-limits.h.patch | 75 +++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/package/pound/0001-include-limits.h.patch b/package/pound/0001-include-limits.h.patch
new file mode 100644
index 0000000000..8f188af07c
--- /dev/null
+++ b/package/pound/0001-include-limits.h.patch
@@ -0,0 +1,75 @@
+From a0374d946e55129b36ba1e0024e1d94675a8f044 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 17 Sep 2023 22:01:21 +0200
+Subject: [PATCH] include limits.h
+
+Include limits.h to avoid the following build failure:
+
+poundctl.c: In function 'oi_getn':
+poundctl.c:232:29: error: 'INT_MAX' undeclared (first use in this function)
+  232 |   if (errno || n < 0 || n > INT_MAX)
+      |                             ^~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/4edfffcd5d4383c57947d97139331e0bf2cb6155
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/graygnuorg/pound/pull/17
+---
+ src/config.c   | 1 +
+ src/poundctl.c | 1 +
+ src/svc.c      | 1 +
+ src/tmpl.c     | 1 +
+ 4 files changed, 4 insertions(+)
+
+diff --git a/src/config.c b/src/config.c
+index b7e3150..12f5cfa 100644
+--- a/src/config.c
++++ b/src/config.c
+@@ -21,6 +21,7 @@
+ #include "extern.h"
+ #include <openssl/x509v3.h>
+ #include <assert.h>
++#include <limits.h>
+ 
+ 
+ /*
+diff --git a/src/poundctl.c b/src/poundctl.c
+index bd1459f..7fa18c8 100644
+--- a/src/poundctl.c
++++ b/src/poundctl.c
+@@ -19,6 +19,7 @@
+ #include "pound.h"
+ #include "json.h"
+ #include <assert.h>
++#include <limits.h>
+ 
+ char *conf_name = POUND_CONF;
+ char *socket_name;
+diff --git a/src/svc.c b/src/svc.c
+index 6e810a6..457f1e0 100644
+--- a/src/svc.c
++++ b/src/svc.c
+@@ -20,6 +20,7 @@
+ #include "pound.h"
+ #include "extern.h"
+ #include "json.h"
++#include <limits.h>
+ 
+ /*
+  * basic hashing function, based on fmv
+diff --git a/src/tmpl.c b/src/tmpl.c
+index 2efa72f..0e5b65d 100644
+--- a/src/tmpl.c
++++ b/src/tmpl.c
+@@ -26,6 +26,7 @@
+ 
+ #include "pound.h"
+ #include <assert.h>
++#include <limits.h>
+ #include "json.h"
+ 
+ static void
+-- 
+2.40.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

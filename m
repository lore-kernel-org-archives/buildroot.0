Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26890C3065C
	for <buildroot@archiver.kernel.org>; Fri, 28 Jun 2024 20:24:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8F71610E1;
	Fri, 28 Jun 2024 20:24:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CRHhTivAy0kZ; Fri, 28 Jun 2024 20:24:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A7EE610ED
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A7EE610ED;
	Fri, 28 Jun 2024 20:24:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3EC301BF3BA
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 20:23:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA9F740585
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 20:23:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 74UYZWjAhHwB for <buildroot@lists.busybox.net>;
 Fri, 28 Jun 2024 20:23:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7009841ACA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7009841ACA
 for <buildroot@buildroot.org>; Fri, 28 Jun 2024 20:23:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5B3BE835DD; Fri, 28 Jun 2024 20:23:52 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 28 Jun 2024 22:21:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 20973140c14d528d91ecea12ebac6428d78d3340
X-Git-Newrev: 4928032d6c58ff64b0aa4af1874aed7c3aa43842
X-Patchwork-Hint: ignore
Message-Id: <20240628202352.5B3BE835DD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rrdtool: fix patch fuzz
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

commit: https://git.buildroot.net/buildroot/commit/?id=4928032d6c58ff64b0aa4af1874aed7c3aa43842
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 8f88a644ed "support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0" reduced the fuzz factor.

Due to this change, rrdtool fails to build with output:

    patching file src/rrd_tool.c
    Hunk #2 FAILED at 42.
    Hunk #3 succeeded at 435 (offset -8 lines).
    Hunk #4 succeeded at 518 (offset -8 lines).
    Hunk #5 succeeded at 564 (offset -8 lines).
    Hunk #6 succeeded at 879 (offset -8 lines).
    1 out of 6 hunks FAILED -- saving rejects to file src/rrd_tool.c.rej

Because this was caused by an upstream patch we do not change it but add
another upstream patch to be applied before our current patch to avoid
the problem.

Fixes:
http://autobuild.buildroot.net/results/6996dbd764b0066da49dd009f1385196342c89dc/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Reviewed-by: Yann E. MORIN <yann.morin@orange.com>
Tested-by: Yann E. MORIN <yann.morin@orange.com>
[yann.morin.1998@free.fr:
  - add comment as suggested by yann.morin@orange.com
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...001-Fix-BUILD_DATE-in-rrdtool-help-output.patch | 57 ++++++++++++++++++++++
 ...patch => 0002-Constify-argv-fix-warnings.patch} |  0
 package/rrdtool/rrdtool.mk                         |  5 +-
 3 files changed, 61 insertions(+), 1 deletion(-)

diff --git a/package/rrdtool/0001-Fix-BUILD_DATE-in-rrdtool-help-output.patch b/package/rrdtool/0001-Fix-BUILD_DATE-in-rrdtool-help-output.patch
new file mode 100644
index 0000000000..9e5af9c148
--- /dev/null
+++ b/package/rrdtool/0001-Fix-BUILD_DATE-in-rrdtool-help-output.patch
@@ -0,0 +1,57 @@
+From e59f703bbcc0af949ee365206426b6394c340c6f Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Wolfgang=20St=C3=B6ggl?= <c72578@yahoo.de>
+Date: Wed, 23 Mar 2022 17:58:45 +0100
+Subject: [PATCH] Fix BUILD_DATE in rrdtool help output
+
+- This is a followup to #1102
+- Fixes segfault when running "rrdtool --help"
+- Change DATE_FMT to the same date format as the __DATE__ macro [1]:
+  mmm dd yyyy
+
+[1] https://gcc.gnu.org/onlinedocs/cpp/Standard-Predefined-Macros.html
+
+Upstream: https://github.com/oetiker/rrdtool-1.x/commit/e59f703bbcc0af949ee365206426b6394c340c6f
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ configure.ac   | 2 +-
+ src/rrd_tool.c | 8 ++++++++
+ 2 files changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 4d2345855..5169b0d49 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -695,7 +695,7 @@ AC_MSG_RESULT(${COMP_PERL:-No Perl Modules will be built})
+ 
+ # Use reproducible build date and time
+ if test "$SOURCE_DATE_EPOCH"; then
+-	DATE_FMT="%d %b %Y %H:%M:%S"
++	DATE_FMT="%b %d %Y %H:%M:%S"
+ 	BUILD_DATE=$(LC_ALL=C date -u -d "@$SOURCE_DATE_EPOCH" "+$DATE_FMT")
+ 	AC_DEFINE_UNQUOTED([BUILD_DATE], ["$BUILD_DATE"], [Use reproducible build date])
+ fi
+diff --git a/src/rrd_tool.c b/src/rrd_tool.c
+index 930d08272..cc6119d9a 100644
+--- a/src/rrd_tool.c
++++ b/src/rrd_tool.c
+@@ -45,11 +45,19 @@ static void PrintUsage(
+     char *cmd)
+ {
+ 
++#ifdef BUILD_DATE
++    const char *help_main =
++        N_("RRDtool %s"
++           "  Copyright by Tobias Oetiker <tobi@oetiker.ch>\n"
++           "               Compiled %s\n\n"
++           "Usage: rrdtool [options] command command_options\n");
++#else
+     const char *help_main =
+         N_("RRDtool %s"
+            "  Copyright by Tobias Oetiker <tobi@oetiker.ch>\n"
+            "               Compiled %s %s\n\n"
+            "Usage: rrdtool [options] command command_options\n");
++#endif
+ 
+     const char *help_list =
+         N_
diff --git a/package/rrdtool/0001-Constify-argv-fix-warnings.patch b/package/rrdtool/0002-Constify-argv-fix-warnings.patch
similarity index 100%
rename from package/rrdtool/0001-Constify-argv-fix-warnings.patch
rename to package/rrdtool/0002-Constify-argv-fix-warnings.patch
diff --git a/package/rrdtool/rrdtool.mk b/package/rrdtool/rrdtool.mk
index 24d84c79c3..f0cffd0162 100644
--- a/package/rrdtool/rrdtool.mk
+++ b/package/rrdtool/rrdtool.mk
@@ -9,10 +9,13 @@ RRDTOOL_SITE = https://github.com/oetiker/rrdtool-1.x/releases/download/v$(RRDTO
 RRDTOOL_LICENSE = GPL-2.0+ with FLOSS license exceptions as explained in COPYRIGHT
 RRDTOOL_LICENSE_FILES = COPYRIGHT LICENSE
 RRDTOOL_DEPENDENCIES = host-pkgconf libglib2 $(TARGET_NLS_DEPENDENCIES)
-# autoreconf needed to avoid link failure due to missing -lintl,
+
+# 0001-Fix-BUILD_DATE-in-rrdtool-help-output.patch
+# autoreconf also needed to avoid link failure due to missing -lintl,
 # autopoint needed as a consequence of autoreconf
 RRDTOOL_AUTORECONF = YES
 RRDTOOL_AUTOPOINT = YES
+
 RRDTOOL_INSTALL_STAGING = YES
 RRDTOOL_CONF_OPTS = \
 	--disable-examples \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

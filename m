Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 025D1C2BD09
	for <buildroot@archiver.kernel.org>; Thu, 27 Jun 2024 22:07:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 400E041713;
	Thu, 27 Jun 2024 22:07:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d6tRGPPWdoH4; Thu, 27 Jun 2024 22:07:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0E9741716
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0E9741716;
	Thu, 27 Jun 2024 22:07:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BF1DD1BF3FF
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 22:06:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AAC89841CD
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 22:06:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g4a4l6i_StdX for <buildroot@lists.busybox.net>;
 Thu, 27 Jun 2024 22:06:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 37B7E841CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37B7E841CC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 37B7E841CC
 for <buildroot@buildroot.org>; Thu, 27 Jun 2024 22:06:56 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bb6a.dip0.t-ipconnect.de [84.161.187.106])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3D310A4C0C08
 for <buildroot@buildroot.org>; Fri, 28 Jun 2024 00:06:54 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46298)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1sMxGY-000000001cK-0C5z
 for buildroot@buildroot.org; Thu, 27 Jun 2024 22:06:53 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 28 Jun 2024 00:06:53 +0200
Message-Id: <20240627220653.3626619-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1719526014;
 bh=EYAm1l2fysOA2gxMPEsju/lVPS5AmmQR4qnXN8/BuR8=;
 h=From:To:Subject:Date:From;
 b=HgnI6USHyfCly7gQfyyruDQDzwoDQ+9UAdpn86kmD5KomieG0KyYq9kLH7jz3/qvl
 NJb+AiKhhR41ArN17RmWHc2mgRQjCXVdzJ0c8d8xK0FH0WieMoztiSli5B2hlp9Izg
 GcZWwSaD+UCywH/i+l7If2qEmY4574QCOQ2dcU0aHaeoAPeGGG3nX/PFXPvI4e+8to
 cESNjxj5PP0YgARcr5HQOwpNNV7//KjXDf7EOAJHRSItb5QaDhSF21kzfjWtkT/Vig
 N0x5ZUDuqoLBfuXE84+WXIdY+95jw/3k8m3yFxIq6hvT1+gYL14cA0g8+htwEsjUci
 Wbc4re7polttQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=HgnI6USH
Subject: [Buildroot] [PATCH 1/1] package/rrdtool: fix patch fuzz
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
 ...ix-BUILD_DATE-in-rrdtool-help-output.patch | 57 +++++++++++++++++++
 ... => 0002-Constify-argv-fix-warnings.patch} |  0
 2 files changed, 57 insertions(+)
 create mode 100644 package/rrdtool/0001-Fix-BUILD_DATE-in-rrdtool-help-output.patch
 rename package/rrdtool/{0001-Constify-argv-fix-warnings.patch => 0002-Constify-argv-fix-warnings.patch} (100%)

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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D7E6C27C76
	for <buildroot@archiver.kernel.org>; Sat, 28 Jan 2023 19:14:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AFB374097E;
	Sat, 28 Jan 2023 19:14:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AFB374097E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sf5UnflkZ1lw; Sat, 28 Jan 2023 19:14:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E372F40949;
	Sat, 28 Jan 2023 19:14:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E372F40949
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8D4361BF48B
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 19:14:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 60CB740949
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 19:14:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60CB740949
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t0rhWG4zYDpF for <buildroot@lists.busybox.net>;
 Sat, 28 Jan 2023 19:14:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0CE7A408EF
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0CE7A408EF
 for <buildroot@buildroot.org>; Sat, 28 Jan 2023 19:14:11 +0000 (UTC)
Received: from vfazio2.xes-mad.com (vfazio2.xes-mad.com [10.52.16.113])
 by mail.xes-mad.com (Postfix) with ESMTP id C3CFA20309;
 Sat, 28 Jan 2023 13:14:10 -0600 (CST)
From: Vincent Fazio <vfazio@xes-inc.com>
To: buildroot@buildroot.org
Date: Sat, 28 Jan 2023 13:14:09 -0600
Message-Id: <20230128191409.1472620-1-vfazio@xes-inc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=xes-inc.com; s=mail; 
 t=1674933250; bh=lpFwrSXjHX/WWHTC8WNlRnNmpijT+b5lgO0fULitFlg=;
 h=From:To:Cc:Subject:Date:From;
 b=s2f9YHm4btlTmDnSn/1RwAhvwWZ/tQI3IsfrQvOYr/NFHd09e263m4dpdn7JM/flx
 dastQq66ptu223SMb0/IF4LE9IJJ+WRSma/aiUSpe3jgh9iM55pi955pX5vpsPXUUW
 cd1B65c9J9OFjwsjH4eEBXrZezKk6DCqQ2iwAr7E=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com
 header.a=rsa-sha256 header.s=mail header.b=s2f9YHm4
Subject: [Buildroot] [PATCH 1/1] package/bash: fix non-multibyte builds
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
Cc: Vincent Fazio <vfazio@xes-inc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Builds using toolchains without WCHAR support would fail due to an
undeclared reference to `shell_input_line_property`.

Fix this by using a guard to check if ENABLE_MULTIBYTE is defined.

Fixes:
  - http://autobuild.buildroot.net/results/133ddcbc37512e6bcc5daab669ce316efa7ec4fc/

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
 ...compilation-for-non-multibyte-builds.patch | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 package/bash/0002-parse.y-fix-compilation-for-non-multibyte-builds.patch

diff --git a/package/bash/0002-parse.y-fix-compilation-for-non-multibyte-builds.patch b/package/bash/0002-parse.y-fix-compilation-for-non-multibyte-builds.patch
new file mode 100644
index 0000000000..d330de5cd4
--- /dev/null
+++ b/package/bash/0002-parse.y-fix-compilation-for-non-multibyte-builds.patch
@@ -0,0 +1,63 @@
+From 0217fc2816e47ee296472df71d1011f0eb2937e6 Mon Sep 17 00:00:00 2001
+From: Vincent Fazio <vfazio@gmail.com>
+Date: Fri, 27 Jan 2023 14:37:26 -0600
+Subject: [PATCH] parse.y: fix compilation for non-multibyte builds
+
+Builds configured with --disable-multibyte or when the toolchain does
+not have WCHAR support would encounter a compile error due to an
+undeclared reference to shell_input_line_property in shell_getc.
+
+Add a HANDLE_MULTIBYTE guard to conditionally compile the block that
+references shell_input_line_property in shell_getc as it's only declared
+when HANDLE_MULTIBYTE is defined.
+
+Signed-off-by: Vincent Fazio <vfazio@gmail.com>
+[Upstream status: https://savannah.gnu.org/patch/index.php?10309]
+---
+ parse.y | 2 ++
+ y.tab.c | 2 ++
+ 2 files changed, 4 insertions(+)
+
+diff --git a/parse.y b/parse.y
+index 1d12e639..8f1355c6 100644
+--- a/parse.y
++++ b/parse.y
+@@ -2625,6 +2625,7 @@ next_alias_char:
+       parser_state |= PST_ENDALIAS;
+       /* We need to do this to make sure last_shell_getc_is_singlebyte returns
+ 	 true, since we are returning a single-byte space. */
++#if defined (HANDLE_MULTIBYTE)
+       if (shell_input_line_index == shell_input_line_len && last_shell_getc_is_singlebyte == 0)
+ 	{
+ #if 0
+@@ -2638,6 +2639,7 @@ next_alias_char:
+ 	  shell_input_line_property[shell_input_line_index - 1] = 1;
+ #endif
+ 	}
++#endif /* HANDLE_MULTIBYTE */
+       return ' ';	/* END_ALIAS */
+     }
+ #endif
+diff --git a/y.tab.c b/y.tab.c
+index 50c5845b..799f730f 100644
+--- a/y.tab.c
++++ b/y.tab.c
+@@ -4936,6 +4936,7 @@ next_alias_char:
+       parser_state |= PST_ENDALIAS;
+       /* We need to do this to make sure last_shell_getc_is_singlebyte returns
+ 	 true, since we are returning a single-byte space. */
++#if defined (HANDLE_MULTIBYTE)
+       if (shell_input_line_index == shell_input_line_len && last_shell_getc_is_singlebyte == 0)
+ 	{
+ #if 0
+@@ -4949,6 +4950,7 @@ next_alias_char:
+ 	  shell_input_line_property[shell_input_line_index - 1] = 1;
+ #endif
+ 	}
++#endif /* HANDLE_MULTIBYTE */
+       return ' ';	/* END_ALIAS */
+     }
+ #endif
+-- 
+2.25.1
+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

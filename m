Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3510C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:20:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB03D6129D;
	Tue, 21 Feb 2023 01:20:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB03D6129D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EmV4GRHEXxsM; Tue, 21 Feb 2023 01:20:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBE7461B27;
	Tue, 21 Feb 2023 01:20:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBE7461B27
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DFED21BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:02:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E7276FBE5
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E7276FBE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EXhcqlfxuZQE for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4C3C56FBDA
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C3C56FBDA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 47E7E81979; Mon, 20 Feb 2023 20:52:43 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 29 Jan 2023 17:37:06 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4f97275bc78b717bec0c5d1efaaf73a0e6e36f53
X-Git-Newrev: 47a74ffa8137c22686e6196e0b1e74861d1bd81c
X-Patchwork-Hint: ignore
Message-Id: <20230220205243.47E7E81979@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/bash: fix
 non-multibyte builds
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

commit: https://git.buildroot.net/buildroot/commit/?id=47a74ffa8137c22686e6196e0b1e74861d1bd81c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Builds using toolchains without WCHAR support would fail due to an
undeclared reference to `shell_input_line_property`.

Fix this by using a guard to check if ENABLE_MULTIBYTE is defined.

Fixes:
  - http://autobuild.buildroot.net/results/133ddcbc37512e6bcc5daab669ce316efa7ec4fc/

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...-fix-compilation-for-non-multibyte-builds.patch | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

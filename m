Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE3ACEE34B
	for <buildroot@archiver.kernel.org>; Tue, 18 Nov 2025 19:03:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98FB361AF0;
	Tue, 18 Nov 2025 19:03:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MqApX1OYiWfq; Tue, 18 Nov 2025 19:03:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F07361AE4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F07361AE4;
	Tue, 18 Nov 2025 19:03:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 468D4158
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 19:03:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2D70B40E12
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 19:03:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RTn5EA2iA3Jl for <buildroot@buildroot.org>;
 Tue, 18 Nov 2025 19:03:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4778F40DDD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4778F40DDD
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4778F40DDD
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 19:03:05 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b06c.dip0.t-ipconnect.de [84.161.176.108])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8226EA4C7214
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 20:03:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55884)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vLQyk-000000001B7-0RkX
 for buildroot@buildroot.org; Tue, 18 Nov 2025 19:03:02 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 18 Nov 2025 20:03:02 +0100
Message-ID: <20251118190302.1504901-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1763492582;
 bh=FbOMkopDVwvvHMQkta4039Gh+pajoJeHLOOFF48vS44=;
 h=From:To:Subject:Date:From;
 b=O2y7XeT/1/v1D4jJthJ/d3yALko7AfI3jmqikDlorWI8mBnBNca0+qzS162D4EKy6
 +ZpEnCbc2AsGtZgl/Dff0azBg46vPe2vwtbM943DHlckRzphztIeRtpblfqNs2h8EQ
 p8n8TYluiMosDnSDqQbMk6u6gmUc9mle0tqbobNDSoc+nPD5DqfqWIb0CXDdSb21kv
 XKWdZ/DW6j1++X70nrsOqVCsBWdD1NxmomKRyek5XPhw4m4O+TXLE/f8VTsBxa63ED
 GXC9E7shFWM5yfPSELGedXUCZaubKeOz/u1xr+xw0yJt3kuCuetZFi76aDdIV5HbTm
 xQc2HRAleVOsQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=O2y7XeT/
Subject: [Buildroot] [PATCH 1/1] package/openocd: fix build with jimtcl 0.83
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot commit 283821fc31c4890f141111cbc5994e36703c91eb bumped jimtcl
to version 0.83 causing build errors with openocd.

Add two upstream commits to fix the problem.

Fixes:
https://autobuild.buildroot.net/results/f20/f20667f8fe159de6601a81a827f26d4f0382d673/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...t-workarounds-for-expr-syntax-change.patch | 131 ++++++++++++++++++
 ...3-openocd-fix-build-with-jimtcl-0.83.patch |  50 +++++++
 2 files changed, 181 insertions(+)
 create mode 100644 package/openocd/0002-openocd-revert-workarounds-for-expr-syntax-change.patch
 create mode 100644 package/openocd/0003-openocd-fix-build-with-jimtcl-0.83.patch

diff --git a/package/openocd/0002-openocd-revert-workarounds-for-expr-syntax-change.patch b/package/openocd/0002-openocd-revert-workarounds-for-expr-syntax-change.patch
new file mode 100644
index 0000000000..a80f5d57cf
--- /dev/null
+++ b/package/openocd/0002-openocd-revert-workarounds-for-expr-syntax-change.patch
@@ -0,0 +1,131 @@
+From 95603fae18f81eebdafc5b318e70f9e2cdefab9e Mon Sep 17 00:00:00 2001
+From: Antonio Borneo <borneo.antonio@gmail.com>
+Date: Sun, 18 Dec 2022 19:15:57 +0100
+Subject: [PATCH] openocd: revert workarounds for 'expr' syntax change
+
+With OpenOCD v0.12.0 released, drop the workarounds for 'expr'
+syntax change by reverting:
+- commit 320043c054dc ("openocd: fix for polling during "expr"
+  computation");
+- commit c7eaaf620488 ("openocd: prepare for jimtcl 0.81 'expr'
+  syntax change").
+
+Replace the call to target_call_timer_callbacks_now() with call
+to target_call_timer_callbacks().
+
+Change-Id: Iae5afc50e3f688e11176a52648efc9a6577a9a11
+Signed-off-by: Antonio Borneo <borneo.antonio@gmail.com>
+Reviewed-on: https://review.openocd.org/c/openocd/+/7405
+Tested-by: jenkins
+
+Upstream: https://github.com/openocd-org/openocd/commit/95603fae18f81eebdafc5b318e70f9e2cdefab9e
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/helper/command.c | 14 +----------
+ src/openocd.c        | 60 --------------------------------------------
+ 2 files changed, 1 insertion(+), 73 deletions(-)
+
+diff --git a/src/helper/command.c b/src/helper/command.c
+index 6898e2d7c6..ca66cf7dd1 100644
+--- a/src/helper/command.c
++++ b/src/helper/command.c
+@@ -936,19 +936,7 @@ static int jim_command_dispatch(Jim_Interp *interp, int argc, Jim_Obj * const *a
+ 	if (!command_can_run(cmd_ctx, c, Jim_GetString(argv[0], NULL)))
+ 		return JIM_ERR;
+ 
+-	/*
+-	 * TODO: to be removed after v0.12.0
+-	 * workaround for https://sourceforge.net/p/openocd/tickets/362/
+-	 * After syntax change of "expr" in jimtcl 0.81
+-	 * the replacement of jimtcl "expr" with openocd version in
+-	 * https://review.openocd.org/6510/
+-	 * introduces too many target polling during math expressions with
+-	 * "expr" commands.
+-	 * After v0.12.0 replace the following two lines with
+-	 * target_call_timer_callbacks();
+-	 */
+-	if (strcmp(c->name, "expr"))
+-		target_call_timer_callbacks_now();
++	target_call_timer_callbacks();
+ 
+ 	/*
+ 	 * Black magic of overridden current target:
+diff --git a/src/openocd.c b/src/openocd.c
+index bef084f980..875da5a62c 100644
+--- a/src/openocd.c
++++ b/src/openocd.c
+@@ -230,65 +230,6 @@ static int openocd_register_commands(struct command_context *cmd_ctx)
+ 	return register_commands(cmd_ctx, NULL, openocd_command_handlers);
+ }
+ 
+-/*
+- * TODO: to be removed after v0.12.0
+- * workaround for syntax change of "expr" in jimtcl 0.81
+- * replace "expr" with openocd version that prints the deprecated msg
+- */
+-struct jim_scriptobj {
+-	void *token;
+-	Jim_Obj *filename_obj;
+-	int len;
+-	int subst_flags;
+-	int in_use;
+-	int firstline;
+-	int linenr;
+-	int missing;
+-};
+-
+-static int jim_expr_command(Jim_Interp *interp, int argc, Jim_Obj * const *argv)
+-{
+-	if (argc == 2)
+-		return Jim_EvalExpression(interp, argv[1]);
+-
+-	if (argc > 2) {
+-		Jim_Obj *obj = Jim_ConcatObj(interp, argc - 1, argv + 1);
+-		Jim_IncrRefCount(obj);
+-		const char *s = Jim_String(obj);
+-		struct jim_scriptobj *script = Jim_GetIntRepPtr(interp->currentScriptObj);
+-		if (interp->currentScriptObj == interp->emptyObj ||
+-				strcmp(interp->currentScriptObj->typePtr->name, "script") ||
+-				script->subst_flags ||
+-				script->filename_obj == interp->emptyObj)
+-			LOG_WARNING("DEPRECATED! use 'expr { %s }' not 'expr %s'", s, s);
+-		else
+-			LOG_WARNING("DEPRECATED! (%s:%d) use 'expr { %s }' not 'expr %s'",
+-						Jim_String(script->filename_obj), script->linenr, s, s);
+-		int retcode = Jim_EvalExpression(interp, obj);
+-		Jim_DecrRefCount(interp, obj);
+-		return retcode;
+-	}
+-
+-	Jim_WrongNumArgs(interp, 1, argv, "expression ?...?");
+-	return JIM_ERR;
+-}
+-
+-static const struct command_registration expr_handler[] = {
+-	{
+-		.name = "expr",
+-		.jim_handler = jim_expr_command,
+-		.mode = COMMAND_ANY,
+-		.help = "",
+-		.usage = "",
+-	},
+-	COMMAND_REGISTRATION_DONE
+-};
+-
+-static int workaround_for_jimtcl_expr(struct command_context *cmd_ctx)
+-{
+-	return register_commands(cmd_ctx, NULL, expr_handler);
+-}
+-
+ struct command_context *global_cmd_ctx;
+ 
+ static struct command_context *setup_command_handler(Jim_Interp *interp)
+@@ -301,7 +242,6 @@ static struct command_context *setup_command_handler(Jim_Interp *interp)
+ 	/* register subsystem commands */
+ 	typedef int (*command_registrant_t)(struct command_context *cmd_ctx_value);
+ 	static const command_registrant_t command_registrants[] = {
+-		&workaround_for_jimtcl_expr,
+ 		&openocd_register_commands,
+ 		&server_register_commands,
+ 		&gdb_register_commands,
diff --git a/package/openocd/0003-openocd-fix-build-with-jimtcl-0.83.patch b/package/openocd/0003-openocd-fix-build-with-jimtcl-0.83.patch
new file mode 100644
index 0000000000..f7d2ffe065
--- /dev/null
+++ b/package/openocd/0003-openocd-fix-build-with-jimtcl-0.83.patch
@@ -0,0 +1,50 @@
+From 73390332d203f02aa5b9798a7550191d55650d97 Mon Sep 17 00:00:00 2001
+From: Antonio Borneo <borneo.antonio@gmail.com>
+Date: Fri, 27 Sep 2024 22:36:52 +0200
+Subject: [PATCH] openocd: fix build with jimtcl 0.83
+
+In jimtcl 0.82, the include file jim.h included in turn stdio.h
+This made redundant to include the former in openocd source files.
+Since jimtcl 0.83, jim.h drops the include of stdio.h, causing
+openocd build to fail.
+
+Include stdio.h in the files that need it.
+
+Change-Id: Ic81c9b273d7520f4d2d8c32bc3e0a6bcfffb67ed
+Signed-off-by: Antonio Borneo <borneo.antonio@gmail.com>
+Reviewed-on: https://review.openocd.org/c/openocd/+/8512
+Reviewed-by: Jonathan McDowell <noodles-openocd@earth.li>
+Tested-by: jenkins
+
+Upstream: https://github.com/openocd-org/openocd/commit/73390332d203f02aa5b9798a7550191d55650d97
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/helper/configuration.h | 1 +
+ src/helper/jim-nvp.c       | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/src/helper/configuration.h b/src/helper/configuration.h
+index 295ea591d6..d646670eb3 100644
+--- a/src/helper/configuration.h
++++ b/src/helper/configuration.h
+@@ -11,6 +11,7 @@
+ #ifndef OPENOCD_HELPER_CONFIGURATION_H
+ #define OPENOCD_HELPER_CONFIGURATION_H
+ 
++#include <stdio.h>
+ #include <helper/command.h>
+ 
+ int parse_cmdline_args(struct command_context *cmd_ctx,
+diff --git a/src/helper/jim-nvp.c b/src/helper/jim-nvp.c
+index e1ab64ae5b..cdd4d34291 100644
+--- a/src/helper/jim-nvp.c
++++ b/src/helper/jim-nvp.c
+@@ -21,6 +21,7 @@
+ #endif
+ 
+ #include "jim-nvp.h"
++#include <stdio.h>
+ #include <string.h>
+ 
+ int jim_get_nvp(Jim_Interp *interp,
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

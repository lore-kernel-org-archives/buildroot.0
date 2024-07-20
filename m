Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A5D8C3DA59
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 09:37:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9209D40B4F;
	Sat, 20 Jul 2024 09:37:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HYiFCrl52wy7; Sat, 20 Jul 2024 09:37:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 045544059F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 045544059F;
	Sat, 20 Jul 2024 09:37:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 78CAE1BF3F9
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 09:37:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6535C4059F
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 09:37:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CyNZauMhgAFP for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 09:37:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C51114057F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C51114057F
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C51114057F
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 09:37:49 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-369c609d0c7so57781f8f.3
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 02:37:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721468267; x=1722073067;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tfnm6R3bpxzVkEQbCAWTsqHshVtC6FpRsg0CO1wC3Ro=;
 b=qCJq94/i8YWvrleF/DkZyWk+fM+8eUaZhILSLA5zcqIeQCpiq4zJ4FGjfJ6yFAyH3a
 4C8ifbxR78TCIwpdrHZMWvKtW6MHs13YNfgLAkBegm6PaWWQeOQkE8Vog9WnMYoXmt9/
 YzFTLwDUZXbRIgsEuxPOBIO6Dc0RF7cSxWxVidOGVPVIoE0CIwA/PMmuhGeCu9eye1R7
 eJsHv4enH+GTI767InW5v3EDg0srNzXWVGvreMYvpDFMSC3llnZ+7fiYZAERD0JJtnb/
 4R4S4L+doDbKlnd8ngM9n+zCUWgPi84v5yLHDDn8f/jNubenYPgSLF2oSH/8xNexwVK1
 Wqlw==
X-Gm-Message-State: AOJu0Yw9dvxnwiyDvbGrhMPhR/aCh6dVdX9/KLBYxt5rLWS5KJx7dySM
 9w9O8QiyHnDYbDVknedwac8VAyNwHCANWGswx8YUeroofx/Bd1FStsK7Xg==
X-Google-Smtp-Source: AGHT+IFtko8kKJa34p9mHYGDhGW+E0iUQsWQ/FjhADm6c1v6xDFOefh1JSZVbW0J9WvHHcxh8GpQww==
X-Received: by 2002:a5d:47ad:0:b0:360:75b1:77fb with SMTP id
 ffacd0b85a97d-369bae3a44amr940809f8f.8.1721468266434; 
 Sat, 20 Jul 2024 02:37:46 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-368786949f5sm3567599f8f.57.2024.07.20.02.37.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jul 2024 02:37:46 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 20 Jul 2024 11:37:43 +0200
Message-ID: <20240720093743.259131-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721468267; x=1722073067; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tfnm6R3bpxzVkEQbCAWTsqHshVtC6FpRsg0CO1wC3Ro=;
 b=UYwd6+Lxs4VewcFa/hgHG0ikwVW5vdoVhZ2++SiOoBJQOpEX1Xh/pAvD3XeEzV92+k
 5w9s5+Jq7Autd5gJrB845UOp1D2D0UpjDRYV40XNcz+5QPSC2Baqj6K/khmaq/kHUKEm
 b43udvUrN/jOnCIwa1unmdXmc5wMy7mCkAmSIGzs/9HSlux6yLB7AMqqEz/U+vhgREeH
 uilRh59C5RqAeeexzsb9NLwT5bc8Hbo1fu2g2NUq+fW9okMi9zvsy+lzM8YL8Vw+FgwW
 X1e2fNxgJuXLSFJ4tfy+yeVCt01uof3cWfa7JIKyX7p3OtHxYDNTBz7cdGE7RxPwRMPH
 N6sg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=UYwd6+Lx
Subject: [Buildroot] [PATCH 1/1] package/libcli: fix build with gcc >= 14
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Steve James <ste@junkomatic.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with gcc >= 14:

libcli.c: In function 'cli_register_command':
libcli.c:430:27: error: 'calloc' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
  430 |   if (!(c = calloc(sizeof(struct cli_command), 1))) return NULL;
      |                           ^~~~~~
libcli.c:430:27: note: earlier argument should specify number of elements, later size of each element

Fixes:
 - http://autobuild.buildroot.org/results/a170d27689e069cf58f830bdd74f604364ee503b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...rameters-for-Wcalloc-transposed-args.patch | 96 +++++++++++++++++++
 1 file changed, 96 insertions(+)
 create mode 100644 package/libcli/0001-Swap-calloc-parameters-for-Wcalloc-transposed-args.patch

diff --git a/package/libcli/0001-Swap-calloc-parameters-for-Wcalloc-transposed-args.patch b/package/libcli/0001-Swap-calloc-parameters-for-Wcalloc-transposed-args.patch
new file mode 100644
index 0000000000..909de2b74d
--- /dev/null
+++ b/package/libcli/0001-Swap-calloc-parameters-for-Wcalloc-transposed-args.patch
@@ -0,0 +1,96 @@
+From 42e798e3f8b4a092be26bc91c9f87e5593f0d302 Mon Sep 17 00:00:00 2001
+From: Gwyn Ciesla <gwync@protonmail.com>
+Date: Wed, 31 Jan 2024 14:40:42 -0600
+Subject: [PATCH] Swap calloc parameters for -Wcalloc-transposed-args
+
+Upstream: https://github.com/dparrish/libcli/pull/93
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ libcli.c | 18 +++++++++---------
+ 1 file changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/libcli.c b/libcli.c
+index 88c23d8..32ceeae 100644
+--- a/libcli.c
++++ b/libcli.c
+@@ -427,7 +427,7 @@ struct cli_command *cli_register_command(struct cli_def *cli, struct cli_command
+   struct cli_command *c;
+ 
+   if (!command) return NULL;
+-  if (!(c = calloc(sizeof(struct cli_command), 1))) return NULL;
++  if (!(c = calloc(1, sizeof(struct cli_command)))) return NULL;
+   c->command_type = CLI_REGULAR_COMMAND;
+   c->callback = callback;
+   c->next = NULL;
+@@ -597,7 +597,7 @@ struct cli_def *cli_init() {
+   struct cli_def *cli;
+   struct cli_command *c;
+ 
+-  if (!(cli = calloc(sizeof(struct cli_def), 1))) return 0;
++  if (!(cli = calloc(1, sizeof(struct cli_def)))) return 0;
+ 
+   cli->buf_size = 1024;
+   if (!(cli->buffer = calloc(cli->buf_size, 1))) {
+@@ -1957,7 +1957,7 @@ int cli_match_filter_init(struct cli_def *cli, int argc, char **argv, struct cli
+   char *search_flags = cli_get_optarg_value(cli, "search_flags", NULL);
+ 
+   filt->filter = cli_match_filter;
+-  filt->data = state = calloc(sizeof(struct cli_match_filter_state), 1);
++  filt->data = state = calloc(1, sizeof(struct cli_match_filter_state));
+   if (!state) return CLI_ERROR;
+ 
+   if (!strcmp(cli->pipeline->current_stage->words[0], "include")) {
+@@ -2050,7 +2050,7 @@ int cli_range_filter_init(struct cli_def *cli, int argc, char **argv, struct cli
+   //    from the command line processing and continue
+ 
+   filt->filter = cli_range_filter;
+-  filt->data = state = calloc(sizeof(struct cli_range_filter_state), 1);
++  filt->data = state = calloc(1, sizeof(struct cli_range_filter_state));
+   if (state) {
+     state->from = from;
+     state->to = to;
+@@ -2087,7 +2087,7 @@ int cli_count_filter_init(struct cli_def *cli, int argc, UNUSED(char **argv), st
+   }
+ 
+   filt->filter = cli_count_filter;
+-  if (!(filt->data = calloc(sizeof(int), 1))) return CLI_ERROR;
++  if (!(filt->data = calloc(1, sizeof(int)))) return CLI_ERROR;
+ 
+   return CLI_OK;
+ }
+@@ -2144,7 +2144,7 @@ struct cli_command *cli_register_filter(struct cli_def *cli, const char *command
+   struct cli_command *c;
+ 
+   if (!command) return NULL;
+-  if (!(c = calloc(sizeof(struct cli_command), 1))) return NULL;
++  if (!(c = calloc(1, sizeof(struct cli_command)))) return NULL;
+ 
+   c->command_type = CLI_FILTER_COMMAND;
+   c->init = init;
+@@ -2256,7 +2256,7 @@ struct cli_optarg *cli_register_optarg(struct cli_command *cmd, const char *name
+       goto CLEANUP;
+     }
+   }
+-  if (!(optarg = calloc(sizeof(struct cli_optarg), 1))) goto CLEANUP;
++  if (!(optarg = calloc(1, sizeof(struct cli_optarg)))) goto CLEANUP;
+   if (!(optarg->name = strdup(name))) goto CLEANUP;
+   if (help && !(optarg->help = strdup(help))) goto CLEANUP;
+ 
+@@ -2532,7 +2532,7 @@ struct cli_command *cli_int_register_buildmode_command(struct cli_def *cli, stru
+   struct cli_command *c;
+ 
+   if (!command) return NULL;
+-  if (!(c = calloc(sizeof(struct cli_command), 1))) return NULL;
++  if (!(c = calloc(1, sizeof(struct cli_command)))) return NULL;
+ 
+   c->flags = flags;
+   c->callback = callback;
+@@ -3095,7 +3095,7 @@ int cli_int_execute_pipeline(struct cli_def *cli, struct cli_pipeline *pipeline)
+     struct cli_pipeline_stage *stage = &pipeline->stage[stage_num];
+     pipeline->current_stage = stage;
+     cli->found_optargs = stage->found_optargs;
+-    *filt = calloc(sizeof(struct cli_filter), 1);
++    *filt = calloc(1, sizeof(struct cli_filter));
+     if (*filt) {
+       if ((rc = stage->command->init(cli, stage->num_words, stage->words, *filt) != CLI_OK)) {
+         break;
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

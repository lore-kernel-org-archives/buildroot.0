Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88D95C3DA49
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 21:02:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D688D4042E;
	Sat, 20 Jul 2024 21:02:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1oHhYhbWAA2D; Sat, 20 Jul 2024 21:02:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DB93403E7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DB93403E7;
	Sat, 20 Jul 2024 21:02:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5536A1BF2CF
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:02:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4104C817AE
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:02:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6--uRxbirOyV for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 21:02:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 554F080D8C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 554F080D8C
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 21:02:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 465E386E8E; Sat, 20 Jul 2024 21:02:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 20 Jul 2024 23:01:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9e5022a12c1f79139e446b2583e06aa430fad195
X-Git-Newrev: a5466a4303d7652c217139bf0dc0b1eb9d6ba0c5
X-Patchwork-Hint: ignore
Message-Id: <20240720210208.465E386E8E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcli: fix build with gcc >= 14
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a5466a4303d7652c217139bf0dc0b1eb9d6ba0c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with gcc >= 14:

libcli.c: In function 'cli_register_command':
libcli.c:430:27: error: 'calloc' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
  430 |   if (!(c = calloc(sizeof(struct cli_command), 1))) return NULL;
      |                           ^~~~~~
libcli.c:430:27: note: earlier argument should specify number of elements, later size of each element

Fixes:
 - http://autobuild.buildroot.org/results/a170d27689e069cf58f830bdd74f604364ee503b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...oc-parameters-for-Wcalloc-transposed-args.patch | 96 ++++++++++++++++++++++
 1 file changed, 96 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

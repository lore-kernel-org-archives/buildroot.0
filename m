Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B4DD0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:55:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCE2D40AAC;
	Wed,  7 Jan 2026 17:55:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bg-bkw6M2lfo; Wed,  7 Jan 2026 17:55:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A357C40B4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808523;
	bh=10okXFgl64aIYokL0JlAVhvQegokjt4K/FJ9jD6Bn+g=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GzOwiCHnkSBNOjC8aTnq4MjJNzlyFj9hhfY5O38lZ8kAu9+oUbLwFiZCeEU2tMQYj
	 gqrxgg3+SwmMNfkkyqxfBhdP7geXi7Xy0rFfeANsAQaRJTuICfyHjwsWyNeHEotaB3
	 ZkCbTLiZcXo9breNK7ffq0ktVXO101cT8jHm0MoFsTWrnnwZqqH/9HMLE110smK6mG
	 cDm4XoUIKov+rJl6zVNxO4/t78B9vQF4HA5TiVH5+Mo2A7cZepcvCjqQiAK/zPlCSV
	 Y3vMfXaJynp2BI7+zSfLVhaG/h/8hAxi/nodCCYGvemzUtCIENScIAgx/5B5/8yWnO
	 BMlN0vuQo/nRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A357C40B4D;
	Wed,  7 Jan 2026 17:55:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BC55525B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:55:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A21BB60667
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:55:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s611Nm1Ox6Lw for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:55:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3903160661
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3903160661
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3903160661
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:55:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3ED04B97A704; Wed,  7 Jan 2026 18:55:18 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:54:52 +0100
Message-ID: <20260107175452.229637-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251203194201.2283684-1-bernd@kuhls.net>
References: <20251203194201.2283684-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808518; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=q6MtIehxFtPhI2w750k/2PEDX+jjmX7m/gcryk1Q4Fs=;
 b=M8N4WWBY0M3u28baiuFZwkUBnOdLSp8qYfSX0b4X74Ttnp5txqOFSPquYmy5w+94xiTibV
 zK33m1ahvqCPIjuFekdw+ekvctdfHT2ZY9Z7pW104CaxR12c+QWsWXf3tIUw0loODJMFf4
 fKYDhU5+pk7aXY8I9Mk3Rq1JgGiyD2Xhh0tzgAeMBjwQHHvTjpxn6byzL7flsT4EeFc5XD
 0OpBVF+mM15FpEoAAQZ5q6AgEl29jLr6hQSlxKAaSL5nS8DbiWpGZh18LkZyhZ7iBUp3dH
 y0wvu73MvoMQZmcPayUz+z80oDfqe6Wv/0IJW11uG/xDuJsPGd4yDWpgEMGOTg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=M8N4WWBY
Subject: Re: [Buildroot] [PATCH 1/1] package/irqbalance: fix build with
 newer gcc
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Fixes:
> https://autobuild.buildroot.net/results/3b6/3b609fe191e03330480f647b09dd06916da13317/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.11.x. Thanks

> ---
>  .../irqbalance/0001-fix-32-bit-formats.patch  |  70 ++++
>  ...02-add-void-to-fix-strict-prototypes.patch | 321 ++++++++++++++++++
>  2 files changed, 391 insertions(+)
>  create mode 100644 package/irqbalance/0001-fix-32-bit-formats.patch
>  create mode 100644 package/irqbalance/0002-add-void-to-fix-strict-prototypes.patch
> 
> diff --git a/package/irqbalance/0001-fix-32-bit-formats.patch b/package/irqbalance/0001-fix-32-bit-formats.patch
> new file mode 100644
> index 0000000000..eac8b083d6
> --- /dev/null
> +++ b/package/irqbalance/0001-fix-32-bit-formats.patch
> @@ -0,0 +1,70 @@
> +From 1277ea524354fa628b4189e699af8d62f8be7021 Mon Sep 17 00:00:00 2001
> +From: Rosen Penev <rosenp@gmail.com>
> +Date: Sun, 31 Mar 2024 14:18:24 -0700
> +Subject: [PATCH] fix 32-bit formats
> +
> +exposed with -Wformat when building on 32-bit systems
> +
> +Signed-off-by: Rosen Penev <rosenp@gmail.com>
> +
> +Upstream: https://github.com/Irqbalance/irqbalance/commit/1277ea524354fa628b4189e699af8d62f8be7021
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + placement.c | 2 +-
> + ui/ui.c     | 8 ++++----
> + 2 files changed, 5 insertions(+), 5 deletions(-)
> +
> +diff --git a/placement.c b/placement.c
> +index 9fde8cb..dea7c23 100644
> +--- a/placement.c
> ++++ b/placement.c
> +@@ -172,7 +172,7 @@ static void validate_irq(struct irq_info *info, void *data)
> + {
> + 	if (info->assigned_obj != data)
> + 		log(TO_CONSOLE, LOG_INFO, "object validation error: irq %d is wrong, points to %p, should be %p\n",
> +-			info->irq, info->assigned_obj, data);
> ++			info->irq, (void*)info->assigned_obj, data);
> + }
> + 
> + static void validate_object(struct topo_obj *d, void *data __attribute__((unused)))
> +diff --git a/ui/ui.c b/ui/ui.c
> +index bee6868..8354fc6 100644
> +--- a/ui/ui.c
> ++++ b/ui/ui.c
> +@@ -101,7 +101,7 @@ int get_valid_sleep_input(int column_offest)
> + 		if(input == NULL) {
> + 			curs_set(0);
> + 			attrset(COLOR_PAIR(1));
> +-			mvprintw(2, column_offest, "%lu			", new_sleep);
> ++			mvprintw(2, column_offest, "%" PRIu64 "			", new_sleep);
> + 			move(LINES, COLS);
> + 			break;
> + 		}
> +@@ -125,7 +125,7 @@ int get_valid_sleep_input(int column_offest)
> + 	}
> + 
> + 	attrset(COLOR_PAIR(1));
> +-	mvprintw(2, column_offest, "%lu				", new_sleep);
> ++	mvprintw(2, column_offest, "%" PRIu64 "				", new_sleep);
> + 
> + 	return new_sleep;
> + }
> +@@ -296,7 +296,7 @@ void handle_cpu_banning()
> + 		case '\r': {
> + 			attrset(COLOR_PAIR(3));
> + 			int banned = toggle_cpu(tmp, position + offset - 6);
> +-			mvprintw(position, 3, "CPU %d     ", position + offset - 6);
> ++			mvprintw(position, 3, "CPU %zu     ", position + offset - 6);
> + 			if(banned) {
> + 				mvprintw(position, 19, "YES");
> + 			} else {
> +@@ -770,7 +770,7 @@ void display_tree_node_irqs(irq_t *irq, void *data)
> + 	if (max_offset >= offset && max_offset - offset < LINES - 5) {
> + 		snprintf(indent + strlen(indent), 32 - strlen(indent), "%s", (char *)data);
> + 		attrset(COLOR_PAIR(3));
> +-		printw("%sIRQ %u, IRQs since last rebalance %lu\n",
> ++		printw("%sIRQ %u, IRQs since last rebalance %" PRIu64 "\n",
> + 			indent, irq->vector, irq->diff);
> + 	}
> + 	max_offset++;
> diff --git a/package/irqbalance/0002-add-void-to-fix-strict-prototypes.patch b/package/irqbalance/0002-add-void-to-fix-strict-prototypes.patch
> new file mode 100644
> index 0000000000..ea0495d895
> --- /dev/null
> +++ b/package/irqbalance/0002-add-void-to-fix-strict-prototypes.patch
> @@ -0,0 +1,321 @@
> +From b6a831d692ed7e12db7748db49b3b39516d151d2 Mon Sep 17 00:00:00 2001
> +From: Rosen Penev <rosenp@gmail.com>
> +Date: Sun, 31 Mar 2024 14:31:22 -0700
> +Subject: [PATCH] add void to fix strict-prototypes
> +
> +This becomes a hard error with C23
> +
> +Signed-off-by: Rosen Penev <rosenp@gmail.com>
> +
> +Upstream: https://github.com/Irqbalance/irqbalance/commit/b6a831d692ed7e12db7748db49b3b39516d151d2
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + irqbalance.c       |  2 +-
> + irqbalance.h       |  2 +-
> + procinterrupts.c   |  2 +-
> + ui/helpers.c       |  2 +-
> + ui/helpers.h       |  2 +-
> + ui/irqbalance-ui.c |  6 +++---
> + ui/irqbalance-ui.h |  5 ++---
> + ui/ui.c            | 26 +++++++++++++-------------
> + ui/ui.h            | 28 ++++++++++++++--------------
> + 9 files changed, 37 insertions(+), 38 deletions(-)
> +
> +diff --git a/irqbalance.c b/irqbalance.c
> +index 12302d7..373161f 100644
> +--- a/irqbalance.c
> ++++ b/irqbalance.c
> +@@ -544,7 +544,7 @@ gboolean sock_handle(gint fd, GIOCondition condition, gpointer user_data __attri
> + 	return TRUE;
> + }
> + 
> +-int init_socket()
> ++int init_socket(void)
> + {
> + 	struct sockaddr_un addr;
> + 	memset(&addr, 0, sizeof(struct sockaddr_un));
> +diff --git a/irqbalance.h b/irqbalance.h
> +index 7b47cd1..09daa3d 100644
> +--- a/irqbalance.h
> ++++ b/irqbalance.h
> +@@ -36,7 +36,7 @@ extern char *classes[];
> + extern void parse_cpu_tree(void);
> + extern void clear_work_stats(void);
> + extern void parse_proc_interrupts(void);
> +-extern GList* collect_full_irq_list();
> ++extern GList* collect_full_irq_list(void);
> + extern void parse_proc_stat(void);
> + extern void set_interrupt_count(int number, uint64_t count);
> + extern void set_msi_interrupt_numa(int number);
> +diff --git a/procinterrupts.c b/procinterrupts.c
> +index dfa95c6..e7ba653 100644
> +--- a/procinterrupts.c
> ++++ b/procinterrupts.c
> +@@ -206,7 +206,7 @@ void init_irq_class_and_type(char *savedline, struct irq_info *info, int irq)
> + 	info->name = strdup(irq_fullname);
> + }
> + 
> +-GList* collect_full_irq_list()
> ++GList* collect_full_irq_list(void)
> + {
> + 	GList *tmp_list = NULL;
> + 	FILE *file;
> +diff --git a/ui/helpers.c b/ui/helpers.c
> +index 0e9f76c..247f826 100644
> +--- a/ui/helpers.c
> ++++ b/ui/helpers.c
> +@@ -165,7 +165,7 @@ void dump_node(cpu_node_t *node, void *data __attribute__((unused)))
> + 	}
> + }
> + 
> +-void dump_tree()
> ++void dump_tree(void)
> + {
> + 	for_each_node(tree, dump_node, NULL);
> + }
> +diff --git a/ui/helpers.h b/ui/helpers.h
> +index b8d9fcc..922914b 100644
> +--- a/ui/helpers.h
> ++++ b/ui/helpers.h
> +@@ -25,7 +25,7 @@ void for_each_node(GList *list, void (*fp)(cpu_node_t *node, void *data), void *
> + 
> + void dump_irq(irq_t *irq, void *data __attribute__((unused)));
> + void dump_node(cpu_node_t *node, void *data __attribute__((unused)));
> +-void dump_tree();
> ++void dump_tree(void);
> + 
> + 
> + #endif /* HELPERS_H */
> +diff --git a/ui/irqbalance-ui.c b/ui/irqbalance-ui.c
> +index c26eff6..f5122ee 100644
> +--- a/ui/irqbalance-ui.c
> ++++ b/ui/irqbalance-ui.c
> +@@ -28,7 +28,7 @@ setup_t setup;
> + GMainLoop *main_loop;
> + static int default_bufsz = 8192;
> + 
> +-struct msghdr * create_credentials_msg()
> ++struct msghdr * create_credentials_msg(void)
> + {
> + 	struct ucred *credentials = malloc(sizeof(struct ucred));
> + 	credentials->pid = getpid();
> +@@ -51,7 +51,7 @@ struct msghdr * create_credentials_msg()
> + 	return msg;
> + }
> + 
> +-int init_connection()
> ++int init_connection(void)
> + {
> + 	struct sockaddr_un addr;
> + 	memset(&addr, 0, sizeof(struct sockaddr_un));
> +@@ -378,7 +378,7 @@ gboolean rescan_tree(gpointer data __attribute__((unused)))
> + 	free(irqbalance_data);
> + 	return TRUE;
> + }
> +-void scroll_window() {
> ++void scroll_window(void) {
> + 	switch(state) {
> + 	case STATE_TREE:
> + 		display_tree();
> +diff --git a/ui/irqbalance-ui.h b/ui/irqbalance-ui.h
> +index dc24083..178be4b 100644
> +--- a/ui/irqbalance-ui.h
> ++++ b/ui/irqbalance-ui.h
> +@@ -72,8 +72,8 @@ typedef struct setup {
> + 
> + /* Function prototypes */
> + 
> +-struct msghdr * create_credentials_msg();
> +-int init_connection();
> ++struct msghdr * create_credentials_msg(void);
> ++int init_connection(void);
> + void send_settings(char *data);
> + char * get_data(char *string);
> + void parse_setup(char *setup_data);
> +@@ -83,7 +83,6 @@ void assign_cpu_lists(cpu_node_t *node, void *data);
> + void assign_cpu_mask(cpu_node_t *node, void *data);
> + void parse_into_tree(char *data);
> + gboolean rescan_tree(gpointer data);
> +-int main();
> + 
> + 
> + #endif /* IRQBALANCE_UI_H */
> +diff --git a/ui/ui.c b/ui/ui.c
> +index 8354fc6..9fa990a 100644
> +--- a/ui/ui.c
> ++++ b/ui/ui.c
> +@@ -21,7 +21,7 @@ char *IRQ_CLASS_TO_STR[] = {
> + 			"10-Gigabit Ethernet",
> + 			"Virt Event"};
> + 
> +-void show_frame()
> ++void show_frame(void)
> + {
> + 	int i;
> + 	attrset(COLOR_PAIR(4));
> +@@ -37,7 +37,7 @@ void show_frame()
> + 	}
> + }
> + 
> +-void show_footer()
> ++void show_footer(void)
> + {
> + 	char footer[COLS];
> + 	snprintf(footer, COLS - 1,
> +@@ -172,7 +172,7 @@ void print_cpu_line(cpu_ban_t *cpu, void *data __attribute__((unused)))
> + 	max_offset++;
> + }
> + 
> +-void print_all_cpus()
> ++void print_all_cpus(void)
> + {
> + 	max_offset = 0;
> + 	if(all_cpus == NULL) {
> +@@ -193,7 +193,7 @@ void add_banned_cpu(int *banned_cpu, void *data)
> + 	snprintf(data + strlen(data), 1024 - strlen(data), "%d, ", *banned_cpu);
> + }
> + 
> +-void display_banned_cpus()
> ++void display_banned_cpus(void)
> + {
> + 	char banned_cpus[1024] = "Banned CPU numbers: \0";
> + 	if(g_list_length(setup.banned_cpus) > 0) {
> +@@ -247,7 +247,7 @@ void get_cpu(cpu_node_t *node, void *data __attribute__((unused)))
> + 	}
> + }
> + 
> +-void handle_cpu_banning()
> ++void handle_cpu_banning(void)
> + {
> + 	GList *tmp = g_list_copy_deep(all_cpus, copy_cpu_ban, NULL);
> + 	attrset(COLOR_PAIR(5));
> +@@ -504,7 +504,7 @@ void print_irq_line(irq_t *irq, void *data __attribute__((unused)))
> + 	mvprintw(line, 120, "%s", irq_name[line]);
> + }
> + 
> +-void print_all_irqs()
> ++void print_all_irqs(void)
> + {
> + 	max_offset = 0;
> + 	attrset(COLOR_PAIR(0));
> +@@ -555,13 +555,13 @@ void copy_irqs_from_nodes(cpu_node_t *node, void *data __attribute__((unused)))
> + 	}
> + }
> + 
> +-void get_all_irqs()
> ++void get_all_irqs(void)
> + {
> + 	all_irqs = g_list_copy_deep(setup.banned_irqs, copy_irq, NULL);
> + 	for_each_node(tree, copy_irqs_from_nodes, NULL);
> + }
> + 
> +-void handle_irq_banning()
> ++void handle_irq_banning(void)
> + {
> + 	GList *tmp = g_list_copy_deep(all_irqs, copy_irq, NULL);
> + 	attrset(COLOR_PAIR(5));
> +@@ -670,7 +670,7 @@ void handle_irq_banning()
> + 	}
> + }
> + 
> +-void handle_sleep_setting()
> ++void handle_sleep_setting(void)
> + {
> + 	char info[128] = "Current sleep interval between rebalancing: \0";
> + 	uint8_t sleep_input_offset = strlen(info) + 3;
> +@@ -693,7 +693,7 @@ void handle_sleep_setting()
> + 	refresh();
> + }
> + 
> +-void init()
> ++void init(void)
> + {
> + 	signal(SIGINT, close_window);
> + 	initscr();
> +@@ -732,7 +732,7 @@ void close_window(int sig __attribute__((unused)))
> + 	exit(EXIT_SUCCESS);
> + }
> + 
> +-void settings()
> ++void settings(void)
> + {
> + 	clear();
> + 	char *setup_data = get_data(SETUP);
> +@@ -751,7 +751,7 @@ void settings()
> + 	free(setup_data);
> + }
> + 
> +-void setup_irqs()
> ++void setup_irqs(void)
> + {
> + 	clear();
> + 	get_all_irqs();
> +@@ -830,7 +830,7 @@ void display_tree_node(cpu_node_t *node, void *data)
> + 	}
> + }
> + 
> +-void display_tree()
> ++void display_tree(void)
> + {
> + 	clear();
> + 	char *setup_data = get_data(SETUP);
> +diff --git a/ui/ui.h b/ui/ui.h
> +index da5b4b9..f3485d4 100644
> +--- a/ui/ui.h
> ++++ b/ui/ui.h
> +@@ -17,40 +17,40 @@ extern setup_t setup;
> + extern int offset;
> + extern int max_offset;
> + 
> +-void show_frame();
> +-void show_footer();
> ++void show_frame(void);
> ++void show_footer(void);
> + 
> + char * check_control_in_sleep_input(int max_len, int column_offest, int line_offset);
> + int get_valid_sleep_input(int column_offest);
> + 
> + void get_banned_cpu(int *cpu, void *data);
> + void print_cpu_line(cpu_ban_t *cpu, void *data);
> +-void print_all_cpus();
> ++void print_all_cpus(void);
> + void add_banned_cpu(int *banned_cpu, void *data);
> +-void display_banned_cpus();
> ++void display_banned_cpus(void);
> + int toggle_cpu(GList *cpu_list, int cpu_number);
> + void get_new_cpu_ban_values(cpu_ban_t *cpu, void *data);
> +-void get_cpu();
> +-void handle_sleep_setting();
> +-void handle_cpu_banning();
> ++void get_cpu(cpu_node_t *node, void *data);
> ++void handle_sleep_setting(void);
> ++void handle_cpu_banning(void);
> + 
> + void copy_assigned_obj(int *number, void *data);
> + void print_assigned_objects_string(irq_t *irq, int *line_offset);
> + void print_irq_line(irq_t *irq, void *data);
> +-void print_all_irqs();
> ++void print_all_irqs(void);
> + int toggle_irq(GList *irq_list, int position);
> + void get_new_irq_ban_values(irq_t *irq, void *data);
> + void copy_irqs_from_nodes(cpu_node_t *node, void *data);
> +-void get_all_irqs();
> +-void handle_irq_banning();
> ++void get_all_irqs(void);
> ++void handle_irq_banning(void);
> + 
> +-void init();
> ++void init(void);
> + void close_window(int sig);
> +-void settings();
> +-void setup_irqs();
> ++void settings(void);
> ++void setup_irqs(void);
> + void display_tree_node_irqs(irq_t *irq, void *data);
> + void display_tree_node(cpu_node_t *node, void *data);
> +-void display_tree();
> ++void display_tree(void);
> + 
> + 
> + #endif /* UI_H */
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <SRS0=9D0o=OI=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1165C433F5
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 20:42:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7677860EDF
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 20:42:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7677860EDF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C0F882862;
	Sat, 18 Sep 2021 20:42:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PKxW9uRe9bih; Sat, 18 Sep 2021 20:42:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5E5F83E55;
	Sat, 18 Sep 2021 20:42:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E14601BF27C
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 20:42:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C413040162
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 20:42:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RVj016idcUXx for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 20:42:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6164A40018
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 20:42:41 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ed4a:2560:2180:38b6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 39CFCB004EC;
 Sat, 18 Sep 2021 22:42:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631997759;
 bh=db2yqSzYqYbHP0r00lqLGV2ZDmEotZjag+vnLIaAHzE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bDv7PS2HxAmF4SSeiOdiStcx5aL6CH4ur5+M8jwt592kFJQfpY61sgzGv/zFK82Ag
 mrAAkodEbrETuFCSeVi2PTd5CniFQ2yEsGslw/IvZhb1H8SuRiwY4xIdotEZNItiTl
 wzdlYnX13Z1wP115+qzD5lehDz6VeryRvCm27Kxh02yRdNGpH7GG31q2CnPWI2/uGQ
 hyHjl5kpYmYphbLfXOUSFqZH2KT26PoX0IIi0I3Sp1Ca9l0cwB1qs1iY14SwCGDQef
 BNnyc2bXZygP4rZ+CrHoYZSxPMRlE+moclpKCtBSA02BBAc91x66xeLW5Rfbb9LAkR
 Zrk9Mx/+mnYGQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Sep 2021 22:42:32 +0200
Date: Sat, 18 Sep 2021 22:42:32 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20210918204232.GY1053080@scaer>
References: <20210912232056.1420052-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210912232056.1420052-1-giulio.benetti@benettiengineering.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/2] package/trace-cmd: bump to version 2.9.5
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Pierre Floury <pierre.floury@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Giulio, All,

On 2021-09-13 01:20 +0200, Giulio Benetti spake thusly:
> Update to version 2.9.5 and remove local patches that have been upstreamed.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Series of two patches applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...01-trace-cmd-libtracecmd-API-cleanup.patch | 1486 -----------------
>  ...make-it-build-against-musl-C-library.patch |  140 --
>  ...dd_event_pid-out-of-ifndef-NO_PTRACE.patch |   51 -
>  package/trace-cmd/trace-cmd.hash              |    2 +-
>  package/trace-cmd/trace-cmd.mk                |    2 +-
>  5 files changed, 2 insertions(+), 1679 deletions(-)
>  delete mode 100644 package/trace-cmd/0001-trace-cmd-libtracecmd-API-cleanup.patch
>  delete mode 100644 package/trace-cmd/0002-trace-cmd-make-it-build-against-musl-C-library.patch
>  delete mode 100644 package/trace-cmd/0003-trace-cmd-Move-add_event_pid-out-of-ifndef-NO_PTRACE.patch
> 
> diff --git a/package/trace-cmd/0001-trace-cmd-libtracecmd-API-cleanup.patch b/package/trace-cmd/0001-trace-cmd-libtracecmd-API-cleanup.patch
> deleted file mode 100644
> index a0dee21020..0000000000
> --- a/package/trace-cmd/0001-trace-cmd-libtracecmd-API-cleanup.patch
> +++ /dev/null
> @@ -1,1486 +0,0 @@
> -From 4b6e124d8b5a0dfd21aedf21d2c347fc5f0705a2 Mon Sep 17 00:00:00 2001
> -From: "Tzvetomir Stoyanov (VMware)" <tz.stoyanov@gmail.com>
> -Date: Thu, 12 Nov 2020 13:52:08 +0200
> -Subject: [PATCH] trace-cmd: libtracecmd API cleanup
> -
> -The tracecmd library is used by trace-cmd and KernelShark applications.
> -All APIs, that are not used by KernelShark are removed from trace-cmd.h.
> -This is the first step to cleanup the library APIs and dependencies.
> -
> -Link: https://lore.kernel.org/linux-trace-devel/20201112115208.1250789-3-tz.stoyanov@gmail.com
> -
> -Signed-off-by: Tzvetomir Stoyanov (VMware) <tz.stoyanov@gmail.com>
> -Signed-off-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
> -[Retrieved from:
> -https://git.kernel.org/pub/scm/utils/trace-cmd/trace-cmd.git/commit/?id=4b6e124d8b5a0dfd21aedf21d2c347fc5f0705a2]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - Makefile                                      |   2 +-
> - include/trace-cmd/trace-cmd.h                 | 488 +-----------------
> - include/trace-cmd/trace-filter-hash.h         |  64 ---
> - include/trace-cmd/trace-hash.h                |  55 --
> - include/trace-cmd/trace-msg.h                 |  15 -
> - .../include/private/trace-cmd-private.h       | 480 +++++++++++++++++
> - .../include/private/trace-filter-hash.h       |  64 +++
> - lib/trace-cmd/include/private/trace-hash.h    |  55 ++
> - lib/trace-cmd/include/private/trace-msg.h     |  15 +
> - lib/trace-cmd/include/trace-cmd-local.h       |   2 +
> - lib/trace-cmd/trace-ftrace.c                  |   2 +-
> - lib/trace-cmd/trace-hooks.c                   |   2 +-
> - lib/trace-cmd/trace-recorder.c                |   2 +-
> - lib/trace-cmd/trace-timesync.c                |   2 +-
> - lib/trace-cmd/trace-util.c                    |   2 +-
> - lib/traceevent/plugins/plugin_python_loader.c |   3 +-
> - python/ctracecmd.i                            |   1 +
> - tracecmd/include/trace-local.h                |   2 +-
> - 18 files changed, 637 insertions(+), 619 deletions(-)
> - delete mode 100644 include/trace-cmd/trace-filter-hash.h
> - delete mode 100644 include/trace-cmd/trace-hash.h
> - delete mode 100644 include/trace-cmd/trace-msg.h
> - create mode 100644 lib/trace-cmd/include/private/trace-cmd-private.h
> - create mode 100644 lib/trace-cmd/include/private/trace-filter-hash.h
> - create mode 100644 lib/trace-cmd/include/private/trace-hash.h
> - create mode 100644 lib/trace-cmd/include/private/trace-msg.h
> -
> -diff --git a/Makefile b/Makefile
> -index b034042..6ef6936 100644
> ---- a/Makefile
> -+++ b/Makefile
> -@@ -224,6 +224,7 @@ INCLUDES += -I$(src)/include/trace-cmd
> - INCLUDES += -I$(src)/include/tracefs
> - INCLUDES += -I$(src)/lib/traceevent/include
> - INCLUDES += -I$(src)/lib/trace-cmd/include
> -+INCLUDES += -I$(src)/lib/trace-cmd/include/private
> - INCLUDES += -I$(src)/lib/tracefs/include
> - INCLUDES += -I$(src)/tracecmd/include
> - INCLUDES += -I$(obj)/tracecmd/include
> -@@ -417,7 +418,6 @@ install_libs: libs
> - 	$(Q)$(call do_install,$(src)/include/traceevent/event-parse.h,$(includedir_SQ)/traceevent)
> - 	$(Q)$(call do_install,$(src)/include/traceevent/trace-seq.h,$(includedir_SQ)/traceevent)
> - 	$(Q)$(call do_install,$(src)/include/trace-cmd/trace-cmd.h,$(includedir_SQ)/trace-cmd)
> --	$(Q)$(call do_install,$(src)/include/trace-cmd/trace-filter-hash.h,$(includedir_SQ)/trace-cmd)
> - 	$(Q)$(call do_install,$(src)/include/tracefs/tracefs.h,$(includedir_SQ)/tracefs)
> - 	$(Q)$(call do_install_ld,$(TRACE_LD_FILE),$(LD_SO_CONF_DIR),$(libdir_SQ)/trace-cmd)
> - 	$(Q)$(call do_install_ld,$(TRACE_LD_FILE),$(LD_SO_CONF_DIR),$(libdir_SQ)/traceevent)
> -diff --git a/include/trace-cmd/trace-cmd.h b/include/trace-cmd/trace-cmd.h
> -index 3c2b474..9751ac3 100644
> ---- a/include/trace-cmd/trace-cmd.h
> -+++ b/include/trace-cmd/trace-cmd.h
> -@@ -9,497 +9,31 @@
> - #include "traceevent/event-parse.h"
> - #include "tracefs/tracefs.h"
> - 
> --#define TRACECMD_MAGIC { 23, 8, 68 }
> --
> --#define ARRAY_SIZE(_a) (sizeof(_a) / sizeof((_a)[0]))
> --#define __weak __attribute__((weak))
> --#define __noreturn __attribute__((noreturn))
> --
> --#define TRACECMD_ERR_MSK	((unsigned long)(-1) & ~((1UL << 14) - 1))
> --#define TRACECMD_ISERR(ptr)	((unsigned long)(ptr) > TRACECMD_ERR_MSK)
> --#define TRACECMD_ERROR(ret)	((void *)((unsigned long)(ret) | TRACECMD_ERR_MSK))
> --#define TRACECMD_PTR2ERR(ptr)	((unisgned long)(ptr) & ~TRACECMD_ERR_MSK)
> --
> --void tracecmd_parse_cmdlines(struct tep_handle *pevent, char *file, int size);
> --void tracecmd_parse_proc_kallsyms(struct tep_handle *pevent, char *file, unsigned int size);
> --void tracecmd_parse_ftrace_printk(struct tep_handle *pevent, char *file, unsigned int size);
> --struct tep_plugin_list *trace_load_plugins(struct tep_handle *tep);
> --
> --int *tracecmd_add_id(int *list, int id, int len);
> --
> --enum {
> --	RINGBUF_TYPE_PADDING		= 29,
> --	RINGBUF_TYPE_TIME_EXTEND	= 30,
> --	RINGBUF_TYPE_TIME_STAMP		= 31,
> --};
> --
> --void tracecmd_record_ref(struct tep_record *record);
> --void free_record(struct tep_record *record);
> --
> --void tracecmd_set_debug(bool set_debug);
> --bool tracecmd_get_debug(void);
> --
> - struct tracecmd_input;
> --struct tracecmd_output;
> --struct tracecmd_recorder;
> --struct hook_list;
> --
> --/* --- tracecmd plugins --- */
> --
> --extern int tracecmd_disable_sys_plugins;
> --extern int tracecmd_disable_plugins;
> --
> --enum tracecmd_context {
> --	TRACECMD_INPUT,
> --	TRACECMD_OUTPUT,
> --};
> --
> --enum tracecmd_plugin_flag {
> --	TRACECMD_DISABLE_SYS_PLUGINS	= 1,
> --	TRACECMD_DISABLE_PLUGINS	= 1 << 1,
> --};
> --
> --struct trace_plugin_context;
> --
> --struct trace_plugin_context *
> --tracecmd_plugin_context_create(enum tracecmd_context context, void *data);
> --
> --void tracecmd_plugin_set_flag(struct trace_plugin_context *context,
> --			      enum tracecmd_plugin_flag flag);
> --
> --#define TRACECMD_PLUGIN_LOADER tracecmd_plugin_loader
> --#define TRACECMD_PLUGIN_UNLOADER tracecmd_plugin_unloader
> --#define TRACECMD_PLUGIN_ALIAS tracecmd_plugin_alias
> --#define _MAKE_STR(x)	#x
> --#define MAKE_STR(x)	_MAKE_STR(x)
> --#define TRACECMD_PLUGIN_LOADER_NAME MAKE_STR(TRACECMD_PLUGIN_LOADER)
> --#define TRACECMD_PLUGIN_UNLOADER_NAME MAKE_STR(TRACECMD_PLUGIN_UNLOADER)
> --#define TRACECMD_PLUGIN_ALIAS_NAME MAKE_STR(TRACECMD_PLUGIN_ALIAS)
> --
> --typedef int (*tracecmd_plugin_load_func)(struct trace_plugin_context *trace);
> --typedef int (*tracecmd_plugin_unload_func)(struct trace_plugin_context *trace);
> --
> --struct tracecmd_input *
> --tracecmd_plugin_context_input(struct trace_plugin_context *trace_context);
> --struct tracecmd_output *
> --tracecmd_plugin_context_output(struct trace_plugin_context *trace_context);
> --
> --void tracecmd_set_quiet(struct tracecmd_output *handle, bool set_quiet);
> --bool tracecmd_get_quiet(struct tracecmd_output *handle);
> --
> --static inline int tracecmd_host_bigendian(void)
> --{
> --	unsigned char str[] = { 0x1, 0x2, 0x3, 0x4 };
> --	unsigned int *ptr;
> --
> --	ptr = (unsigned int *)str;
> --	return *ptr == 0x01020304;
> --}
> --
> --/* --- Opening and Reading the trace.dat file --- */
> --
> --enum {
> --	TRACECMD_OPTION_DONE,
> --	TRACECMD_OPTION_DATE,
> --	TRACECMD_OPTION_CPUSTAT,
> --	TRACECMD_OPTION_BUFFER,
> --	TRACECMD_OPTION_TRACECLOCK,
> --	TRACECMD_OPTION_UNAME,
> --	TRACECMD_OPTION_HOOK,
> --	TRACECMD_OPTION_OFFSET,
> --	TRACECMD_OPTION_CPUCOUNT,
> --	TRACECMD_OPTION_VERSION,
> --	TRACECMD_OPTION_PROCMAPS,
> --	TRACECMD_OPTION_TRACEID,
> --	TRACECMD_OPTION_TIME_SHIFT,
> --	TRACECMD_OPTION_GUEST,
> --};
> --
> --enum {
> --	TRACECMD_FL_IGNORE_DATE		= (1 << 0),
> --	TRACECMD_FL_BUFFER_INSTANCE	= (1 << 1),
> --	TRACECMD_FL_LATENCY		= (1 << 2),
> --	TRACECMD_FL_IN_USECS		= (1 << 3),
> --	TRACECMD_FL_FLYRECORD		= (1 << 4),
> --};
> --
> --struct tracecmd_ftrace {
> --	struct tracecmd_input		*handle;
> --	struct tep_event *fgraph_ret_event;
> --	int fgraph_ret_id;
> --	int long_size;
> --};
> --
> --struct tracecmd_proc_addr_map {
> --	unsigned long long	start;
> --	unsigned long long	end;
> --	char			*lib_name;
> --};
> --
> --typedef void (*tracecmd_show_data_func)(struct tracecmd_input *handle,
> --					struct tep_record *record);
> --typedef void (*tracecmd_handle_init_func)(struct tracecmd_input *handle,
> --					  struct hook_list *hook, int global);
> - 
> --struct tracecmd_input *tracecmd_alloc(const char *file);
> --struct tracecmd_input *tracecmd_alloc_fd(int fd);
> --struct tracecmd_input *tracecmd_open(const char *file);
> - struct tracecmd_input *tracecmd_open_head(const char *file);
> --struct tracecmd_input *tracecmd_open_fd(int fd);
> -+void tracecmd_close(struct tracecmd_input *handle);
> - int tracecmd_pair_peer(struct tracecmd_input *handle,
> - 		       struct tracecmd_input *peer);
> --void tracecmd_unpair_peer(struct tracecmd_input *handle);
> --void tracecmd_ref(struct tracecmd_input *handle);
> --void tracecmd_close(struct tracecmd_input *handle);
> --int tracecmd_read_headers(struct tracecmd_input *handle);
> --int tracecmd_get_parsing_failures(struct tracecmd_input *handle);
> --int tracecmd_long_size(struct tracecmd_input *handle);
> --int tracecmd_page_size(struct tracecmd_input *handle);
> --int tracecmd_cpus(struct tracecmd_input *handle);
> --int tracecmd_copy_headers(struct tracecmd_input *handle, int fd);
> --void tracecmd_set_flag(struct tracecmd_input *handle, int flag);
> --void tracecmd_clear_flag(struct tracecmd_input *handle, int flag);
> --unsigned long tracecmd_get_flags(struct tracecmd_input *handle);
> --unsigned long long tracecmd_get_traceid(struct tracecmd_input *handle);
> --int tracecmd_get_guest_cpumap(struct tracecmd_input *handle,
> --			      unsigned long long trace_id,
> --			      const char **name,
> --			      int *vcpu_count, const int **cpu_pid);
> --unsigned long long tracecmd_get_tsync_peer(struct tracecmd_input *handle);
> --int tracecmd_enable_tsync(struct tracecmd_input *handle, bool enable);
> --
> --void tracecmd_parse_trace_clock(struct tracecmd_input *handle, char *file, int size);
> --
> --int tracecmd_make_pipe(struct tracecmd_input *handle, int cpu, int fd, int cpus);
> --
> --int tracecmd_buffer_instances(struct tracecmd_input *handle);
> --const char *tracecmd_buffer_instance_name(struct tracecmd_input *handle, int indx);
> --struct tracecmd_input *tracecmd_buffer_instance_handle(struct tracecmd_input *handle, int indx);
> --int tracecmd_is_buffer_instance(struct tracecmd_input *handle);
> --
> --void tracecmd_set_ts_offset(struct tracecmd_input *handle, long long offset);
> --void tracecmd_set_ts2secs(struct tracecmd_input *handle, unsigned long long hz);
> --
> --void tracecmd_print_events(struct tracecmd_input *handle, const char *regex);
> --
> --struct hook_list *tracecmd_hooks(struct tracecmd_input *handle);
> - 
> - int tracecmd_init_data(struct tracecmd_input *handle);
> --
> --void tracecmd_print_stats(struct tracecmd_input *handle);
> --void tracecmd_print_uname(struct tracecmd_input *handle);
> --void tracecmd_print_version(struct tracecmd_input *handle);
> --
> - struct tep_record *
> --tracecmd_peek_data(struct tracecmd_input *handle, int cpu);
> --
> --static inline struct tep_record *
> --tracecmd_peek_data_ref(struct tracecmd_input *handle, int cpu)
> --{
> --	struct tep_record *rec = tracecmd_peek_data(handle, cpu);
> --	if (rec)
> --		rec->ref_count++;
> --	return rec;
> --}
> --
> -+tracecmd_read_cpu_first(struct tracecmd_input *handle, int cpu);
> - struct tep_record *
> - tracecmd_read_data(struct tracecmd_input *handle, int cpu);
> --
> --struct tep_record *
> --tracecmd_read_prev(struct tracecmd_input *handle, struct tep_record *record);
> --
> --struct tep_record *
> --tracecmd_read_next_data(struct tracecmd_input *handle, int *rec_cpu);
> --
> --struct tep_record *
> --tracecmd_peek_next_data(struct tracecmd_input *handle, int *rec_cpu);
> --
> - struct tep_record *
> - tracecmd_read_at(struct tracecmd_input *handle, unsigned long long offset,
> - 		 int *cpu);
> --struct tep_record *
> --tracecmd_translate_data(struct tracecmd_input *handle,
> --			void *ptr, int size);
> --struct tep_record *
> --tracecmd_read_cpu_first(struct tracecmd_input *handle, int cpu);
> --struct tep_record *
> --tracecmd_read_cpu_last(struct tracecmd_input *handle, int cpu);
> --int tracecmd_refresh_record(struct tracecmd_input *handle,
> --			    struct tep_record *record);
> --
> --int tracecmd_set_cpu_to_timestamp(struct tracecmd_input *handle,
> --				  int cpu, unsigned long long ts);
> --void
> --tracecmd_set_all_cpus_to_timestamp(struct tracecmd_input *handle,
> --				   unsigned long long time);
> --
> --int tracecmd_set_cursor(struct tracecmd_input *handle,
> --			int cpu, unsigned long long offset);
> --unsigned long long
> --tracecmd_get_cursor(struct tracecmd_input *handle, int cpu);
> -+void free_record(struct tep_record *record);
> - 
> --int tracecmd_ftrace_overrides(struct tracecmd_input *handle, struct tracecmd_ftrace *finfo);
> - struct tep_handle *tracecmd_get_pevent(struct tracecmd_input *handle);
> --bool tracecmd_get_use_trace_clock(struct tracecmd_input *handle);
> --tracecmd_show_data_func
> --tracecmd_get_show_data_func(struct tracecmd_input *handle);
> --void tracecmd_set_show_data_func(struct tracecmd_input *handle,
> --				 tracecmd_show_data_func func);
> --
> --int tracecmd_record_at_buffer_start(struct tracecmd_input *handle, struct tep_record *record);
> --unsigned long long tracecmd_page_ts(struct tracecmd_input *handle,
> --				    struct tep_record *record);
> --unsigned int tracecmd_record_ts_delta(struct tracecmd_input *handle,
> --				      struct tep_record *record);
> --
> --struct tracecmd_proc_addr_map *
> --tracecmd_search_task_map(struct tracecmd_input *handle,
> --			 int pid, unsigned long long addr);
> --#ifndef SWIG
> --/* hack for function graph work around */
> --extern __thread struct tracecmd_input *tracecmd_curr_thread_handle;
> --#endif
> --
> --
> --/* --- Creating and Writing the trace.dat file --- */
> --
> --struct tracecmd_event_list {
> --	struct tracecmd_event_list	*next;
> --	const char			*glob;
> --};
> --
> --struct tracecmd_option;
> --struct tracecmd_msg_handle;
> --
> --struct tracecmd_output *tracecmd_create_file_latency(const char *output_file, int cpus);
> --struct tracecmd_output *tracecmd_create_file(const char *output_file,
> --					     int cpus, char * const *cpu_data_files);
> --struct tracecmd_output *
> --tracecmd_create_file_glob(const char *output_file,
> --			  int cpus, char * const *cpu_data_files,
> --			  struct tracecmd_event_list *event_globs);
> --struct tracecmd_output *
> --tracecmd_create_init_file_glob(const char *output_file,
> --			       struct tracecmd_event_list *list);
> --struct tracecmd_output *tracecmd_create_init_fd(int fd);
> --struct tracecmd_output *
> --tracecmd_create_init_fd_glob(int fd, struct tracecmd_event_list *list);
> --struct tracecmd_output *
> --tracecmd_create_init_fd_msg(struct tracecmd_msg_handle *msg_handle,
> --			    struct tracecmd_event_list *list);
> --struct tracecmd_output *tracecmd_create_init_file(const char *output_file);
> --struct tracecmd_output *tracecmd_create_init_file_override(const char *output_file,
> --							   const char *tracing_dir,
> --							   const char *kallsyms);
> --struct tracecmd_option *tracecmd_add_option(struct tracecmd_output *handle,
> --					    unsigned short id, int size,
> --					    const void *data);
> --struct tracecmd_option *
> --tracecmd_add_option_v(struct tracecmd_output *handle,
> --		      unsigned short id, const struct iovec *vector, int count);
> --
> --struct tracecmd_option *tracecmd_add_buffer_option(struct tracecmd_output *handle,
> --						   const char *name, int cpus);
> --
> --int tracecmd_write_cpus(struct tracecmd_output *handle, int cpus);
> --int tracecmd_write_options(struct tracecmd_output *handle);
> --int tracecmd_append_options(struct tracecmd_output *handle);
> --int tracecmd_update_option(struct tracecmd_output *handle,
> --			   struct tracecmd_option *option, int size,
> --			   const void *data);
> --void tracecmd_output_close(struct tracecmd_output *handle);
> --void tracecmd_output_free(struct tracecmd_output *handle);
> --struct tracecmd_output *tracecmd_copy(struct tracecmd_input *ihandle,
> --				      const char *file);
> --
> --int tracecmd_write_cpu_data(struct tracecmd_output *handle,
> --			    int cpus, char * const *cpu_data_files);
> --int tracecmd_append_cpu_data(struct tracecmd_output *handle,
> --			     int cpus, char * const *cpu_data_files);
> --int tracecmd_append_buffer_cpu_data(struct tracecmd_output *handle,
> --				    struct tracecmd_option *option,
> --				    int cpus, char * const *cpu_data_files);
> --
> --struct tracecmd_output *tracecmd_get_output_handle_fd(int fd);
> --
> --/* --- Reading the Fly Recorder Trace --- */
> --
> --enum {
> --	TRACECMD_RECORD_NOSPLICE	= (1 << 0),	/* Use read instead of splice */
> --	TRACECMD_RECORD_SNAPSHOT	= (1 << 1),	/* Extract from snapshot */
> --	TRACECMD_RECORD_BLOCK		= (1 << 2),	/* Block on splice write */
> --	TRACECMD_RECORD_NOBRASS		= (1 << 3),	/* Splice directly without a brass pipe */
> --};
> --
> --void tracecmd_free_recorder(struct tracecmd_recorder *recorder);
> --struct tracecmd_recorder *tracecmd_create_recorder(const char *file, int cpu, unsigned flags);
> --struct tracecmd_recorder *tracecmd_create_recorder_fd(int fd, int cpu, unsigned flags);
> --struct tracecmd_recorder *tracecmd_create_recorder_virt(const char *file, int cpu, unsigned flags, int trace_fd);
> --struct tracecmd_recorder *tracecmd_create_recorder_maxkb(const char *file, int cpu, unsigned flags, int maxkb);
> --struct tracecmd_recorder *tracecmd_create_buffer_recorder_fd(int fd, int cpu, unsigned flags, const char *buffer);
> --struct tracecmd_recorder *tracecmd_create_buffer_recorder(const char *file, int cpu, unsigned flags, const char *buffer);
> --struct tracecmd_recorder *tracecmd_create_buffer_recorder_maxkb(const char *file, int cpu, unsigned flags, const char *buffer, int maxkb);
> --
> --int tracecmd_start_recording(struct tracecmd_recorder *recorder, unsigned long sleep);
> --void tracecmd_stop_recording(struct tracecmd_recorder *recorder);
> --long tracecmd_flush_recording(struct tracecmd_recorder *recorder);
> --
> --enum tracecmd_msg_flags {
> --	TRACECMD_MSG_FL_USE_TCP		= 1 << 0,
> --};
> --
> --/* for both client and server */
> --struct tracecmd_msg_handle {
> --	int			fd;
> --	short			cpu_count;
> --	short			version;	/* Current protocol version */
> --	unsigned long		flags;
> --	bool			done;
> --};
> --
> --struct tracecmd_msg_handle *
> --  tracecmd_msg_handle_alloc(int fd, unsigned long flags);
> --
> --/* Closes the socket and frees the handle */
> --void tracecmd_msg_handle_close(struct tracecmd_msg_handle *msg_handle);
> --
> --/* for clients */
> --int tracecmd_msg_send_init_data(struct tracecmd_msg_handle *msg_handle,
> --				unsigned int **client_ports);
> --int tracecmd_msg_data_send(struct tracecmd_msg_handle *msg_handle,
> --			       const char *buf, int size);
> --int tracecmd_msg_finish_sending_data(struct tracecmd_msg_handle *msg_handle);
> --int tracecmd_msg_send_close_msg(struct tracecmd_msg_handle *msg_handle);
> --int tracecmd_msg_send_close_resp_msg(struct tracecmd_msg_handle *msg_handle);
> --int tracecmd_msg_wait_close(struct tracecmd_msg_handle *msg_handle);
> --int tracecmd_msg_wait_close_resp(struct tracecmd_msg_handle *msg_handle);
> --
> --/* for server */
> --int tracecmd_msg_initial_setting(struct tracecmd_msg_handle *msg_handle);
> --int tracecmd_msg_send_port_array(struct tracecmd_msg_handle *msg_handle,
> --				 unsigned *ports);
> --int tracecmd_msg_read_data(struct tracecmd_msg_handle *msg_handle, int ofd);
> --int tracecmd_msg_collect_data(struct tracecmd_msg_handle *msg_handle, int ofd);
> --bool tracecmd_msg_done(struct tracecmd_msg_handle *msg_handle);
> --void tracecmd_msg_set_done(struct tracecmd_msg_handle *msg_handle);
> --
> --int tracecmd_msg_send_trace_req(struct tracecmd_msg_handle *msg_handle,
> --				int argc, char **argv, bool use_fifos,
> --				unsigned long long trace_id,
> --				char *tsync_protos,
> --				int tsync_protos_size);
> --int tracecmd_msg_recv_trace_req(struct tracecmd_msg_handle *msg_handle,
> --				int *argc, char ***argv, bool *use_fifos,
> --				unsigned long long *trace_id,
> --				char **tsync_protos,
> --				unsigned int *tsync_protos_size);
> --
> --int tracecmd_msg_send_trace_resp(struct tracecmd_msg_handle *msg_handle,
> --				 int nr_cpus, int page_size,
> --				 unsigned int *ports, bool use_fifos,
> --				 unsigned long long trace_id,
> --				 unsigned int tsync_proto,
> --				 unsigned int tsync_port);
> --int tracecmd_msg_recv_trace_resp(struct tracecmd_msg_handle *msg_handle,
> --				 int *nr_cpus, int *page_size,
> --				 unsigned int **ports, bool *use_fifos,
> --				 unsigned long long *trace_id,
> --				 unsigned int *tsync_proto,
> --				 unsigned int *tsync_port);
> --
> --int tracecmd_msg_send_time_sync(struct tracecmd_msg_handle *msg_handle,
> --				unsigned int sync_protocol,
> --				unsigned int sync_msg_id,
> --				unsigned int payload_size, char *payload);
> --int tracecmd_msg_recv_time_sync(struct tracecmd_msg_handle *msg_handle,
> --				unsigned int *sync_protocol,
> --				unsigned int *sync_msg_id,
> --				unsigned int *payload_size, char **payload);
> --
> --/* --- Timestamp synchronization --- */
> --
> --enum{
> --	TRACECMD_TIME_SYNC_PROTO_NONE	= 0,
> --};
> --enum{
> --	TRACECMD_TIME_SYNC_CMD_PROBE	= 1,
> --	TRACECMD_TIME_SYNC_CMD_STOP	= 2,
> --};
> --
> --#define TRACECMD_TIME_SYNC_PROTO_PTP_WEIGHT	10
> --
> --struct tracecmd_time_sync {
> --	unsigned int			sync_proto;
> --	int				loop_interval;
> --	pthread_mutex_t			lock;
> --	pthread_cond_t			cond;
> --	char				*clock_str;
> --	struct tracecmd_msg_handle	*msg_handle;
> --	void				*context;
> --};
> --
> --void tracecmd_tsync_init(void);
> --int tracecmd_tsync_proto_getall(char **proto_mask, int *words);
> --unsigned int tracecmd_tsync_proto_select(char *proto_mask, int words);
> --bool tsync_proto_is_supported(unsigned int proto_id);
> --void tracecmd_tsync_with_host(struct tracecmd_time_sync *tsync);
> --void tracecmd_tsync_with_guest(struct tracecmd_time_sync *tsync);
> --int tracecmd_tsync_get_offsets(struct tracecmd_time_sync *tsync,
> --				int *count,
> --				long long **ts, long long **offsets);
> --void tracecmd_tsync_free(struct tracecmd_time_sync *tsync);
> --
> --/* --- Plugin handling --- */
> --extern struct tep_plugin_option trace_ftrace_options[];
> --
> --char **trace_util_find_plugin_files(const char *suffix);
> --void trace_util_free_plugin_files(char **files);
> --
> --/* Used for trace-cmd list */
> --void tracecmd_ftrace_load_options(void);
> --
> --/* event hooks */
> --
> --struct hook_list {
> --	struct hook_list	*next;
> --	struct buffer_instance	*instance;
> --	const char		*hook;
> --	char			*str;
> --	char			*start_system;
> --	char			*start_event;
> --	char			*start_match;
> --	char			*end_system;
> --	char			*end_event;
> --	char			*end_match;
> --	char			*pid;
> --	int			migrate;
> --	int			global;
> --	int			stack;
> --};
> --
> --struct hook_list *tracecmd_create_event_hook(const char *arg);
> --void tracecmd_free_hooks(struct hook_list *hooks);
> --
> --void tracecmd_plog(const char *fmt, ...);
> --void tracecmd_plog_error(const char *fmt, ...);
> --int tracecmd_set_logfile(char *logfile);
> --
> --/* --- System --- */
> --unsigned long long tracecmd_generate_traceid(void);
> --int tracecmd_count_cpus(void);
> --
> --/* --- Hack! --- */
> --int tracecmd_blk_hack(struct tracecmd_input *handle);
> --
> --/* --- Stack tracer functions --- */
> --int tracecmd_stack_tracer_status(int *status);
> --
> --/* --- Debugging --- */
> --struct kbuffer *tracecmd_record_kbuf(struct tracecmd_input *handle,
> --				     struct tep_record *record);
> --void *tracecmd_record_page(struct tracecmd_input *handle,
> --			   struct tep_record *record);
> --void *tracecmd_record_offset(struct tracecmd_input *handle,
> --			     struct tep_record *record);
> -+unsigned long long tracecmd_get_traceid(struct tracecmd_input *handle);
> -+int tracecmd_get_guest_cpumap(struct tracecmd_input *handle,
> -+			      unsigned long long trace_id,
> -+			      const char **name,
> -+			      int *vcpu_count, const int **cpu_pid);
> -+int tracecmd_buffer_instances(struct tracecmd_input *handle);
> -+const char *tracecmd_buffer_instance_name(struct tracecmd_input *handle, int indx);
> -+struct tracecmd_input *tracecmd_buffer_instance_handle(struct tracecmd_input *handle, int indx);
> - 
> - #endif /* _TRACE_CMD_H */
> -diff --git a/include/trace-cmd/trace-filter-hash.h b/include/trace-cmd/trace-filter-hash.h
> -deleted file mode 100644
> -index 4111c41..0000000
> ---- a/include/trace-cmd/trace-filter-hash.h
> -+++ /dev/null
> -@@ -1,64 +0,0 @@
> --/* SPDX-License-Identifier: LGPL-2.1 */
> --/*
> -- * Copyright (C) 2009, 2010 Red Hat Inc, Steven Rostedt <srostedt@redhat.com>
> -- * Copyright (C) 2018 VMware Inc, Steven Rostedt <rostedt@goodmis.org>
> -- *
> -- */
> --#ifndef _TRACE_FILTER_HASH_H
> --#define _TRACE_FILTER_HASH_H
> --
> --#include <stdint.h>
> --
> --struct tracecmd_filter_id_item {
> --	struct tracecmd_filter_id_item	*next;
> --	int				id;
> --};
> --
> --struct tracecmd_filter_id {
> --	struct tracecmd_filter_id_item **hash;
> --	int				count;
> --};
> --
> --/**
> -- * tracecmd_quick_hash - A quick (non secured) hash alogirthm
> -- * @val: The value to perform the hash on
> -- * @bits: The size in bits you need to return
> -- *
> -- * This is a quick hashing function adapted from Donald E. Knuth's 32
> -- * bit multiplicative hash.  See The Art of Computer Programming (TAOCP).
> -- * Multiplication by the Prime number, closest to the golden ratio of
> -- * 2^32.
> -- *
> -- * @bits is used to max the result for use cases that require
> -- * a power of 2 return value that is less than 32 bits. Any value
> -- * of @bits greater than 31 (or zero), will simply return the full hash on @val.
> -- */
> --static inline uint32_t tracecmd_quick_hash(uint32_t val, unsigned int bits)
> --{
> --	val *= UINT32_C(2654435761);
> --
> --	if (!bits || bits > 31)
> --		return val;
> --
> --	return val & ((1 << bits) - 1);
> --}
> --
> --struct tracecmd_filter_id_item *
> --  tracecmd_filter_id_find(struct tracecmd_filter_id *hash, int id);
> --void tracecmd_filter_id_add(struct tracecmd_filter_id *hash, int id);
> --void tracecmd_filter_id_remove(struct tracecmd_filter_id *hash, int id);
> --void tracecmd_filter_id_clear(struct tracecmd_filter_id *hash);
> --struct tracecmd_filter_id *tracecmd_filter_id_hash_alloc(void);
> --void tracecmd_filter_id_hash_free(struct tracecmd_filter_id *hash);
> --struct tracecmd_filter_id *
> --  tracecmd_filter_id_hash_copy(struct tracecmd_filter_id *hash);
> --int *tracecmd_filter_ids(struct tracecmd_filter_id *hash);
> --int tracecmd_filter_id_compare(struct tracecmd_filter_id *hash1,
> --			       struct tracecmd_filter_id *hash2);
> --
> --static inline int tracecmd_filter_task_count(struct tracecmd_filter_id *hash)
> --{
> --	return hash->count;
> --}
> --
> --#endif /* _TRACE_FILTER_HASH_H */
> -diff --git a/include/trace-cmd/trace-hash.h b/include/trace-cmd/trace-hash.h
> -deleted file mode 100644
> -index aa92cdf..0000000
> ---- a/include/trace-cmd/trace-hash.h
> -+++ /dev/null
> -@@ -1,55 +0,0 @@
> --/* SPDX-License-Identifier: GPL-2.0 */
> --/*
> -- * Copyright (C) 2014 Red Hat Inc, Steven Rostedt <srostedt@redhat.com>
> -- *
> -- */
> --#ifndef _TRACE_HASH_H
> --#define _TRACE_HASH_H
> --
> --struct trace_hash_item {
> --	struct trace_hash_item	*next;
> --	struct trace_hash_item	*prev;
> --	unsigned long long	key;
> --};
> --
> --struct trace_hash {
> --	struct trace_hash_item	**buckets;
> --	int			nr_buckets;
> --	int			power;
> --};
> --
> --int trace_hash_init(struct trace_hash *hash, int buckets);
> --void trace_hash_free(struct trace_hash *hash);
> --int trace_hash_add(struct trace_hash *hash, struct trace_hash_item *item);
> --int trace_hash_empty(struct trace_hash *hash);
> --
> --static inline void trace_hash_del(struct trace_hash_item *item)
> --{
> --	struct trace_hash_item *prev = item->prev;
> --
> --	prev->next = item->next;
> --	if (item->next)
> --		item->next->prev = prev;
> --}
> --
> --#define trace_hash_for_each_bucket(bucket, hash)			\
> --	for (bucket = (hash)->buckets;					\
> --	     (bucket) < (hash)->buckets + (hash)->nr_buckets; (bucket)++)
> --
> --#define trace_hash_for_each_item(item, bucket)				\
> --	for ((item = *(bucket)); item; item = (item)->next)
> --
> --#define trace_hash_for_each_item_safe(item, n, bucket)		\
> --	for ((item = *(bucket)), n = item ? item->next : NULL; item; \
> --	     item = n, n = item ? (item)->next : NULL)
> --
> --#define trace_hash_while_item(item, bucket)	\
> --	while ((item = *(bucket)))
> --
> --typedef int (*trace_hash_func)(struct trace_hash_item *item, void *data);
> --
> --struct trace_hash_item *
> --trace_hash_find(struct trace_hash *hash, unsigned long long key,
> --		trace_hash_func match, void *data);
> --
> --#endif /* _TRACE_HASH_H */
> -diff --git a/include/trace-cmd/trace-msg.h b/include/trace-cmd/trace-msg.h
> -deleted file mode 100644
> -index aab8a69..0000000
> ---- a/include/trace-cmd/trace-msg.h
> -+++ /dev/null
> -@@ -1,15 +0,0 @@
> --#ifndef _TRACE_MSG_H_
> --#define _TRACE_MSG_H_
> --
> --#include <stdbool.h>
> --
> --#define UDP_MAX_PACKET	(65536 - 20)
> --#define V3_MAGIC	"766679\0"
> --#define V3_CPU		"-1V3"
> --
> --#define V1_PROTOCOL	1
> --#define V3_PROTOCOL	3
> --
> --extern unsigned int page_size;
> --
> --#endif /* _TRACE_MSG_H_ */
> -diff --git a/lib/trace-cmd/include/private/trace-cmd-private.h b/lib/trace-cmd/include/private/trace-cmd-private.h
> -new file mode 100644
> -index 0000000..458760e
> ---- /dev/null
> -+++ b/lib/trace-cmd/include/private/trace-cmd-private.h
> -@@ -0,0 +1,480 @@
> -+/* SPDX-License-Identifier: LGPL-2.1 */
> -+/*
> -+ * Copyright (C) 2008, 2009, 2010 Red Hat Inc, Steven Rostedt <srostedt@redhat.com>
> -+ *
> -+ */
> -+#ifndef _TRACE_CMD_PRIVATE_H
> -+#define _TRACE_CMD_PRIVATE_H
> -+
> -+#include "traceevent/event-parse.h"
> -+#include "trace-cmd/trace-cmd.h"
> -+
> -+#define TRACECMD_MAGIC { 23, 8, 68 }
> -+
> -+#define ARRAY_SIZE(_a) (sizeof(_a) / sizeof((_a)[0]))
> -+#define __weak __attribute__((weak))
> -+#define __noreturn __attribute__((noreturn))
> -+
> -+#define TRACECMD_ERR_MSK	((unsigned long)(-1) & ~((1UL << 14) - 1))
> -+#define TRACECMD_ISERR(ptr)	((unsigned long)(ptr) > TRACECMD_ERR_MSK)
> -+#define TRACECMD_ERROR(ret)	((void *)((unsigned long)(ret) | TRACECMD_ERR_MSK))
> -+#define TRACECMD_PTR2ERR(ptr)	((unisgned long)(ptr) & ~TRACECMD_ERR_MSK)
> -+
> -+void tracecmd_parse_cmdlines(struct tep_handle *pevent, char *file, int size);
> -+void tracecmd_parse_proc_kallsyms(struct tep_handle *pevent, char *file, unsigned int size);
> -+void tracecmd_parse_ftrace_printk(struct tep_handle *pevent, char *file, unsigned int size);
> -+struct tep_plugin_list *trace_load_plugins(struct tep_handle *tep);
> -+
> -+int *tracecmd_add_id(int *list, int id, int len);
> -+
> -+enum {
> -+	RINGBUF_TYPE_PADDING		= 29,
> -+	RINGBUF_TYPE_TIME_EXTEND	= 30,
> -+	RINGBUF_TYPE_TIME_STAMP		= 31,
> -+};
> -+
> -+void tracecmd_record_ref(struct tep_record *record);
> -+
> -+void tracecmd_set_debug(bool set_debug);
> -+bool tracecmd_get_debug(void);
> -+
> -+struct tracecmd_output;
> -+struct tracecmd_recorder;
> -+struct hook_list;
> -+
> -+/* --- tracecmd plugins --- */
> -+
> -+extern int tracecmd_disable_sys_plugins;
> -+extern int tracecmd_disable_plugins;
> -+
> -+enum tracecmd_context {
> -+	TRACECMD_INPUT,
> -+	TRACECMD_OUTPUT,
> -+};
> -+
> -+enum tracecmd_plugin_flag {
> -+	TRACECMD_DISABLE_SYS_PLUGINS	= 1,
> -+	TRACECMD_DISABLE_PLUGINS	= 1 << 1,
> -+};
> -+
> -+struct trace_plugin_context;
> -+
> -+struct trace_plugin_context *
> -+tracecmd_plugin_context_create(enum tracecmd_context context, void *data);
> -+
> -+void tracecmd_plugin_set_flag(struct trace_plugin_context *context,
> -+			      enum tracecmd_plugin_flag flag);
> -+
> -+#define TRACECMD_PLUGIN_LOADER tracecmd_plugin_loader
> -+#define TRACECMD_PLUGIN_UNLOADER tracecmd_plugin_unloader
> -+#define TRACECMD_PLUGIN_ALIAS tracecmd_plugin_alias
> -+#define _MAKE_STR(x)	#x
> -+#define MAKE_STR(x)	_MAKE_STR(x)
> -+#define TRACECMD_PLUGIN_LOADER_NAME MAKE_STR(TRACECMD_PLUGIN_LOADER)
> -+#define TRACECMD_PLUGIN_UNLOADER_NAME MAKE_STR(TRACECMD_PLUGIN_UNLOADER)
> -+#define TRACECMD_PLUGIN_ALIAS_NAME MAKE_STR(TRACECMD_PLUGIN_ALIAS)
> -+
> -+typedef int (*tracecmd_plugin_load_func)(struct trace_plugin_context *trace);
> -+typedef int (*tracecmd_plugin_unload_func)(struct trace_plugin_context *trace);
> -+
> -+struct tracecmd_input *
> -+tracecmd_plugin_context_input(struct trace_plugin_context *trace_context);
> -+struct tracecmd_output *
> -+tracecmd_plugin_context_output(struct trace_plugin_context *trace_context);
> -+
> -+void tracecmd_set_quiet(struct tracecmd_output *handle, bool set_quiet);
> -+bool tracecmd_get_quiet(struct tracecmd_output *handle);
> -+
> -+static inline int tracecmd_host_bigendian(void)
> -+{
> -+	unsigned char str[] = { 0x1, 0x2, 0x3, 0x4 };
> -+	unsigned int *ptr;
> -+
> -+	ptr = (unsigned int *)str;
> -+	return *ptr == 0x01020304;
> -+}
> -+
> -+/* --- Opening and Reading the trace.dat file --- */
> -+
> -+enum {
> -+	TRACECMD_OPTION_DONE,
> -+	TRACECMD_OPTION_DATE,
> -+	TRACECMD_OPTION_CPUSTAT,
> -+	TRACECMD_OPTION_BUFFER,
> -+	TRACECMD_OPTION_TRACECLOCK,
> -+	TRACECMD_OPTION_UNAME,
> -+	TRACECMD_OPTION_HOOK,
> -+	TRACECMD_OPTION_OFFSET,
> -+	TRACECMD_OPTION_CPUCOUNT,
> -+	TRACECMD_OPTION_VERSION,
> -+	TRACECMD_OPTION_PROCMAPS,
> -+	TRACECMD_OPTION_TRACEID,
> -+	TRACECMD_OPTION_TIME_SHIFT,
> -+	TRACECMD_OPTION_GUEST,
> -+};
> -+
> -+enum {
> -+	TRACECMD_FL_IGNORE_DATE		= (1 << 0),
> -+	TRACECMD_FL_BUFFER_INSTANCE	= (1 << 1),
> -+	TRACECMD_FL_LATENCY		= (1 << 2),
> -+	TRACECMD_FL_IN_USECS		= (1 << 3),
> -+	TRACECMD_FL_FLYRECORD		= (1 << 4),
> -+};
> -+
> -+struct tracecmd_ftrace {
> -+	struct tracecmd_input		*handle;
> -+	struct tep_event *fgraph_ret_event;
> -+	int fgraph_ret_id;
> -+	int long_size;
> -+};
> -+
> -+struct tracecmd_proc_addr_map {
> -+	unsigned long long	start;
> -+	unsigned long long	end;
> -+	char			*lib_name;
> -+};
> -+
> -+typedef void (*tracecmd_show_data_func)(struct tracecmd_input *handle,
> -+					struct tep_record *record);
> -+typedef void (*tracecmd_handle_init_func)(struct tracecmd_input *handle,
> -+					  struct hook_list *hook, int global);
> -+
> -+struct tracecmd_input *tracecmd_alloc(const char *file);
> -+struct tracecmd_input *tracecmd_alloc_fd(int fd);
> -+struct tracecmd_input *tracecmd_open(const char *file);
> -+struct tracecmd_input *tracecmd_open_fd(int fd);
> -+void tracecmd_unpair_peer(struct tracecmd_input *handle);
> -+void tracecmd_ref(struct tracecmd_input *handle);
> -+int tracecmd_read_headers(struct tracecmd_input *handle);
> -+int tracecmd_get_parsing_failures(struct tracecmd_input *handle);
> -+int tracecmd_long_size(struct tracecmd_input *handle);
> -+int tracecmd_page_size(struct tracecmd_input *handle);
> -+int tracecmd_cpus(struct tracecmd_input *handle);
> -+int tracecmd_copy_headers(struct tracecmd_input *handle, int fd);
> -+void tracecmd_set_flag(struct tracecmd_input *handle, int flag);
> -+void tracecmd_clear_flag(struct tracecmd_input *handle, int flag);
> -+unsigned long tracecmd_get_flags(struct tracecmd_input *handle);
> -+unsigned long long tracecmd_get_tsync_peer(struct tracecmd_input *handle);
> -+int tracecmd_enable_tsync(struct tracecmd_input *handle, bool enable);
> -+
> -+void tracecmd_parse_trace_clock(struct tracecmd_input *handle, char *file, int size);
> -+
> -+int tracecmd_make_pipe(struct tracecmd_input *handle, int cpu, int fd, int cpus);
> -+
> -+int tracecmd_is_buffer_instance(struct tracecmd_input *handle);
> -+
> -+void tracecmd_set_ts_offset(struct tracecmd_input *handle, long long offset);
> -+void tracecmd_set_ts2secs(struct tracecmd_input *handle, unsigned long long hz);
> -+
> -+void tracecmd_print_events(struct tracecmd_input *handle, const char *regex);
> -+
> -+struct hook_list *tracecmd_hooks(struct tracecmd_input *handle);
> -+
> -+void tracecmd_print_stats(struct tracecmd_input *handle);
> -+void tracecmd_print_uname(struct tracecmd_input *handle);
> -+void tracecmd_print_version(struct tracecmd_input *handle);
> -+
> -+struct tep_record *
> -+tracecmd_peek_data(struct tracecmd_input *handle, int cpu);
> -+
> -+static inline struct tep_record *
> -+tracecmd_peek_data_ref(struct tracecmd_input *handle, int cpu)
> -+{
> -+	struct tep_record *rec = tracecmd_peek_data(handle, cpu);
> -+	if (rec)
> -+		rec->ref_count++;
> -+	return rec;
> -+}
> -+
> -+struct tep_record *
> -+tracecmd_read_prev(struct tracecmd_input *handle, struct tep_record *record);
> -+
> -+struct tep_record *
> -+tracecmd_read_next_data(struct tracecmd_input *handle, int *rec_cpu);
> -+
> -+struct tep_record *
> -+tracecmd_peek_next_data(struct tracecmd_input *handle, int *rec_cpu);
> -+
> -+struct tep_record *
> -+tracecmd_translate_data(struct tracecmd_input *handle,
> -+			void *ptr, int size);
> -+struct tep_record *
> -+tracecmd_read_cpu_last(struct tracecmd_input *handle, int cpu);
> -+int tracecmd_refresh_record(struct tracecmd_input *handle,
> -+			    struct tep_record *record);
> -+
> -+int tracecmd_set_cpu_to_timestamp(struct tracecmd_input *handle,
> -+				  int cpu, unsigned long long ts);
> -+void
> -+tracecmd_set_all_cpus_to_timestamp(struct tracecmd_input *handle,
> -+				   unsigned long long time);
> -+
> -+int tracecmd_set_cursor(struct tracecmd_input *handle,
> -+			int cpu, unsigned long long offset);
> -+unsigned long long
> -+tracecmd_get_cursor(struct tracecmd_input *handle, int cpu);
> -+
> -+int tracecmd_ftrace_overrides(struct tracecmd_input *handle, struct tracecmd_ftrace *finfo);
> -+bool tracecmd_get_use_trace_clock(struct tracecmd_input *handle);
> -+tracecmd_show_data_func
> -+tracecmd_get_show_data_func(struct tracecmd_input *handle);
> -+void tracecmd_set_show_data_func(struct tracecmd_input *handle,
> -+				 tracecmd_show_data_func func);
> -+
> -+int tracecmd_record_at_buffer_start(struct tracecmd_input *handle, struct tep_record *record);
> -+unsigned long long tracecmd_page_ts(struct tracecmd_input *handle,
> -+				    struct tep_record *record);
> -+unsigned int tracecmd_record_ts_delta(struct tracecmd_input *handle,
> -+				      struct tep_record *record);
> -+
> -+struct tracecmd_proc_addr_map *
> -+tracecmd_search_task_map(struct tracecmd_input *handle,
> -+			 int pid, unsigned long long addr);
> -+#ifndef SWIG
> -+/* hack for function graph work around */
> -+extern __thread struct tracecmd_input *tracecmd_curr_thread_handle;
> -+#endif
> -+
> -+
> -+/* --- Creating and Writing the trace.dat file --- */
> -+
> -+struct tracecmd_event_list {
> -+	struct tracecmd_event_list	*next;
> -+	const char			*glob;
> -+};
> -+
> -+struct tracecmd_option;
> -+struct tracecmd_msg_handle;
> -+
> -+struct tracecmd_output *tracecmd_create_file_latency(const char *output_file, int cpus);
> -+struct tracecmd_output *tracecmd_create_file(const char *output_file,
> -+					     int cpus, char * const *cpu_data_files);
> -+struct tracecmd_output *
> -+tracecmd_create_file_glob(const char *output_file,
> -+			  int cpus, char * const *cpu_data_files,
> -+			  struct tracecmd_event_list *event_globs);
> -+struct tracecmd_output *
> -+tracecmd_create_init_file_glob(const char *output_file,
> -+			       struct tracecmd_event_list *list);
> -+struct tracecmd_output *tracecmd_create_init_fd(int fd);
> -+struct tracecmd_output *
> -+tracecmd_create_init_fd_glob(int fd, struct tracecmd_event_list *list);
> -+struct tracecmd_output *
> -+tracecmd_create_init_fd_msg(struct tracecmd_msg_handle *msg_handle,
> -+			    struct tracecmd_event_list *list);
> -+struct tracecmd_output *tracecmd_create_init_file(const char *output_file);
> -+struct tracecmd_output *tracecmd_create_init_file_override(const char *output_file,
> -+							   const char *tracing_dir,
> -+							   const char *kallsyms);
> -+struct tracecmd_option *tracecmd_add_option(struct tracecmd_output *handle,
> -+					    unsigned short id, int size,
> -+					    const void *data);
> -+struct tracecmd_option *
> -+tracecmd_add_option_v(struct tracecmd_output *handle,
> -+		      unsigned short id, const struct iovec *vector, int count);
> -+
> -+struct tracecmd_option *tracecmd_add_buffer_option(struct tracecmd_output *handle,
> -+						   const char *name, int cpus);
> -+
> -+int tracecmd_write_cpus(struct tracecmd_output *handle, int cpus);
> -+int tracecmd_write_options(struct tracecmd_output *handle);
> -+int tracecmd_append_options(struct tracecmd_output *handle);
> -+int tracecmd_update_option(struct tracecmd_output *handle,
> -+			   struct tracecmd_option *option, int size,
> -+			   const void *data);
> -+void tracecmd_output_close(struct tracecmd_output *handle);
> -+void tracecmd_output_free(struct tracecmd_output *handle);
> -+struct tracecmd_output *tracecmd_copy(struct tracecmd_input *ihandle,
> -+				      const char *file);
> -+
> -+int tracecmd_write_cpu_data(struct tracecmd_output *handle,
> -+			    int cpus, char * const *cpu_data_files);
> -+int tracecmd_append_cpu_data(struct tracecmd_output *handle,
> -+			     int cpus, char * const *cpu_data_files);
> -+int tracecmd_append_buffer_cpu_data(struct tracecmd_output *handle,
> -+				    struct tracecmd_option *option,
> -+				    int cpus, char * const *cpu_data_files);
> -+
> -+struct tracecmd_output *tracecmd_get_output_handle_fd(int fd);
> -+
> -+/* --- Reading the Fly Recorder Trace --- */
> -+
> -+enum {
> -+	TRACECMD_RECORD_NOSPLICE	= (1 << 0),	/* Use read instead of splice */
> -+	TRACECMD_RECORD_SNAPSHOT	= (1 << 1),	/* Extract from snapshot */
> -+	TRACECMD_RECORD_BLOCK		= (1 << 2),	/* Block on splice write */
> -+	TRACECMD_RECORD_NOBRASS		= (1 << 3),	/* Splice directly without a brass pipe */
> -+};
> -+
> -+void tracecmd_free_recorder(struct tracecmd_recorder *recorder);
> -+struct tracecmd_recorder *tracecmd_create_recorder(const char *file, int cpu, unsigned flags);
> -+struct tracecmd_recorder *tracecmd_create_recorder_fd(int fd, int cpu, unsigned flags);
> -+struct tracecmd_recorder *tracecmd_create_recorder_virt(const char *file, int cpu, unsigned flags, int trace_fd);
> -+struct tracecmd_recorder *tracecmd_create_recorder_maxkb(const char *file, int cpu, unsigned flags, int maxkb);
> -+struct tracecmd_recorder *tracecmd_create_buffer_recorder_fd(int fd, int cpu, unsigned flags, const char *buffer);
> -+struct tracecmd_recorder *tracecmd_create_buffer_recorder(const char *file, int cpu, unsigned flags, const char *buffer);
> -+struct tracecmd_recorder *tracecmd_create_buffer_recorder_maxkb(const char *file, int cpu, unsigned flags, const char *buffer, int maxkb);
> -+
> -+int tracecmd_start_recording(struct tracecmd_recorder *recorder, unsigned long sleep);
> -+void tracecmd_stop_recording(struct tracecmd_recorder *recorder);
> -+long tracecmd_flush_recording(struct tracecmd_recorder *recorder);
> -+
> -+enum tracecmd_msg_flags {
> -+	TRACECMD_MSG_FL_USE_TCP		= 1 << 0,
> -+};
> -+
> -+/* for both client and server */
> -+struct tracecmd_msg_handle {
> -+	int			fd;
> -+	short			cpu_count;
> -+	short			version;	/* Current protocol version */
> -+	unsigned long		flags;
> -+	bool			done;
> -+};
> -+
> -+struct tracecmd_msg_handle *
> -+tracecmd_msg_handle_alloc(int fd, unsigned long flags);
> -+
> -+/* Closes the socket and frees the handle */
> -+void tracecmd_msg_handle_close(struct tracecmd_msg_handle *msg_handle);
> -+
> -+/* for clients */
> -+int tracecmd_msg_send_init_data(struct tracecmd_msg_handle *msg_handle,
> -+				unsigned int **client_ports);
> -+int tracecmd_msg_data_send(struct tracecmd_msg_handle *msg_handle,
> -+			       const char *buf, int size);
> -+int tracecmd_msg_finish_sending_data(struct tracecmd_msg_handle *msg_handle);
> -+int tracecmd_msg_send_close_msg(struct tracecmd_msg_handle *msg_handle);
> -+int tracecmd_msg_send_close_resp_msg(struct tracecmd_msg_handle *msg_handle);
> -+int tracecmd_msg_wait_close(struct tracecmd_msg_handle *msg_handle);
> -+int tracecmd_msg_wait_close_resp(struct tracecmd_msg_handle *msg_handle);
> -+
> -+/* for server */
> -+int tracecmd_msg_initial_setting(struct tracecmd_msg_handle *msg_handle);
> -+int tracecmd_msg_send_port_array(struct tracecmd_msg_handle *msg_handle,
> -+				 unsigned *ports);
> -+int tracecmd_msg_read_data(struct tracecmd_msg_handle *msg_handle, int ofd);
> -+int tracecmd_msg_collect_data(struct tracecmd_msg_handle *msg_handle, int ofd);
> -+bool tracecmd_msg_done(struct tracecmd_msg_handle *msg_handle);
> -+void tracecmd_msg_set_done(struct tracecmd_msg_handle *msg_handle);
> -+
> -+int tracecmd_msg_send_trace_req(struct tracecmd_msg_handle *msg_handle,
> -+				int argc, char **argv, bool use_fifos,
> -+				unsigned long long trace_id,
> -+				char *tsync_protos,
> -+				int tsync_protos_size);
> -+int tracecmd_msg_recv_trace_req(struct tracecmd_msg_handle *msg_handle,
> -+				int *argc, char ***argv, bool *use_fifos,
> -+				unsigned long long *trace_id,
> -+				char **tsync_protos,
> -+				unsigned int *tsync_protos_size);
> -+
> -+int tracecmd_msg_send_trace_resp(struct tracecmd_msg_handle *msg_handle,
> -+				 int nr_cpus, int page_size,
> -+				 unsigned int *ports, bool use_fifos,
> -+				 unsigned long long trace_id,
> -+				 unsigned int tsync_proto,
> -+				 unsigned int tsync_port);
> -+int tracecmd_msg_recv_trace_resp(struct tracecmd_msg_handle *msg_handle,
> -+				 int *nr_cpus, int *page_size,
> -+				 unsigned int **ports, bool *use_fifos,
> -+				 unsigned long long *trace_id,
> -+				 unsigned int *tsync_proto,
> -+				 unsigned int *tsync_port);
> -+
> -+int tracecmd_msg_send_time_sync(struct tracecmd_msg_handle *msg_handle,
> -+				unsigned int sync_protocol,
> -+				unsigned int sync_msg_id,
> -+				unsigned int payload_size, char *payload);
> -+int tracecmd_msg_recv_time_sync(struct tracecmd_msg_handle *msg_handle,
> -+				unsigned int *sync_protocol,
> -+				unsigned int *sync_msg_id,
> -+				unsigned int *payload_size, char **payload);
> -+
> -+/* --- Timestamp synchronization --- */
> -+
> -+enum{
> -+	TRACECMD_TIME_SYNC_PROTO_NONE	= 0,
> -+};
> -+enum{
> -+	TRACECMD_TIME_SYNC_CMD_PROBE	= 1,
> -+	TRACECMD_TIME_SYNC_CMD_STOP	= 2,
> -+};
> -+
> -+#define TRACECMD_TIME_SYNC_PROTO_PTP_WEIGHT	10
> -+
> -+struct tracecmd_time_sync {
> -+	unsigned int			sync_proto;
> -+	int				loop_interval;
> -+	pthread_mutex_t			lock;
> -+	pthread_cond_t			cond;
> -+	char				*clock_str;
> -+	struct tracecmd_msg_handle	*msg_handle;
> -+	void				*context;
> -+};
> -+
> -+void tracecmd_tsync_init(void);
> -+int tracecmd_tsync_proto_getall(char **proto_mask, int *words);
> -+unsigned int tracecmd_tsync_proto_select(char *proto_mask, int words);
> -+bool tsync_proto_is_supported(unsigned int proto_id);
> -+void tracecmd_tsync_with_host(struct tracecmd_time_sync *tsync);
> -+void tracecmd_tsync_with_guest(struct tracecmd_time_sync *tsync);
> -+int tracecmd_tsync_get_offsets(struct tracecmd_time_sync *tsync,
> -+				int *count,
> -+				long long **ts, long long **offsets);
> -+void tracecmd_tsync_free(struct tracecmd_time_sync *tsync);
> -+
> -+/* --- Plugin handling --- */
> -+extern struct tep_plugin_option trace_ftrace_options[];
> -+
> -+char **trace_util_find_plugin_files(const char *suffix);
> -+void trace_util_free_plugin_files(char **files);
> -+
> -+/* Used for trace-cmd list */
> -+void tracecmd_ftrace_load_options(void);
> -+
> -+/* event hooks */
> -+
> -+struct hook_list {
> -+	struct hook_list	*next;
> -+	struct buffer_instance	*instance;
> -+	const char		*hook;
> -+	char			*str;
> -+	char			*start_system;
> -+	char			*start_event;
> -+	char			*start_match;
> -+	char			*end_system;
> -+	char			*end_event;
> -+	char			*end_match;
> -+	char			*pid;
> -+	int			migrate;
> -+	int			global;
> -+	int			stack;
> -+};
> -+
> -+struct hook_list *tracecmd_create_event_hook(const char *arg);
> -+void tracecmd_free_hooks(struct hook_list *hooks);
> -+
> -+void tracecmd_plog(const char *fmt, ...);
> -+void tracecmd_plog_error(const char *fmt, ...);
> -+int tracecmd_set_logfile(char *logfile);
> -+
> -+/* --- System --- */
> -+unsigned long long tracecmd_generate_traceid(void);
> -+int tracecmd_count_cpus(void);
> -+
> -+/* --- Hack! --- */
> -+int tracecmd_blk_hack(struct tracecmd_input *handle);
> -+
> -+/* --- Stack tracer functions --- */
> -+int tracecmd_stack_tracer_status(int *status);
> -+
> -+/* --- Debugging --- */
> -+struct kbuffer *tracecmd_record_kbuf(struct tracecmd_input *handle,
> -+				     struct tep_record *record);
> -+void *tracecmd_record_page(struct tracecmd_input *handle,
> -+			   struct tep_record *record);
> -+void *tracecmd_record_offset(struct tracecmd_input *handle,
> -+			     struct tep_record *record);
> -+
> -+#endif /* _TRACE_CMD_PRIVATE_H */
> -diff --git a/lib/trace-cmd/include/private/trace-filter-hash.h b/lib/trace-cmd/include/private/trace-filter-hash.h
> -new file mode 100644
> -index 0000000..4111c41
> ---- /dev/null
> -+++ b/lib/trace-cmd/include/private/trace-filter-hash.h
> -@@ -0,0 +1,64 @@
> -+/* SPDX-License-Identifier: LGPL-2.1 */
> -+/*
> -+ * Copyright (C) 2009, 2010 Red Hat Inc, Steven Rostedt <srostedt@redhat.com>
> -+ * Copyright (C) 2018 VMware Inc, Steven Rostedt <rostedt@goodmis.org>
> -+ *
> -+ */
> -+#ifndef _TRACE_FILTER_HASH_H
> -+#define _TRACE_FILTER_HASH_H
> -+
> -+#include <stdint.h>
> -+
> -+struct tracecmd_filter_id_item {
> -+	struct tracecmd_filter_id_item	*next;
> -+	int				id;
> -+};
> -+
> -+struct tracecmd_filter_id {
> -+	struct tracecmd_filter_id_item **hash;
> -+	int				count;
> -+};
> -+
> -+/**
> -+ * tracecmd_quick_hash - A quick (non secured) hash alogirthm
> -+ * @val: The value to perform the hash on
> -+ * @bits: The size in bits you need to return
> -+ *
> -+ * This is a quick hashing function adapted from Donald E. Knuth's 32
> -+ * bit multiplicative hash.  See The Art of Computer Programming (TAOCP).
> -+ * Multiplication by the Prime number, closest to the golden ratio of
> -+ * 2^32.
> -+ *
> -+ * @bits is used to max the result for use cases that require
> -+ * a power of 2 return value that is less than 32 bits. Any value
> -+ * of @bits greater than 31 (or zero), will simply return the full hash on @val.
> -+ */
> -+static inline uint32_t tracecmd_quick_hash(uint32_t val, unsigned int bits)
> -+{
> -+	val *= UINT32_C(2654435761);
> -+
> -+	if (!bits || bits > 31)
> -+		return val;
> -+
> -+	return val & ((1 << bits) - 1);
> -+}
> -+
> -+struct tracecmd_filter_id_item *
> -+  tracecmd_filter_id_find(struct tracecmd_filter_id *hash, int id);
> -+void tracecmd_filter_id_add(struct tracecmd_filter_id *hash, int id);
> -+void tracecmd_filter_id_remove(struct tracecmd_filter_id *hash, int id);
> -+void tracecmd_filter_id_clear(struct tracecmd_filter_id *hash);
> -+struct tracecmd_filter_id *tracecmd_filter_id_hash_alloc(void);
> -+void tracecmd_filter_id_hash_free(struct tracecmd_filter_id *hash);
> -+struct tracecmd_filter_id *
> -+  tracecmd_filter_id_hash_copy(struct tracecmd_filter_id *hash);
> -+int *tracecmd_filter_ids(struct tracecmd_filter_id *hash);
> -+int tracecmd_filter_id_compare(struct tracecmd_filter_id *hash1,
> -+			       struct tracecmd_filter_id *hash2);
> -+
> -+static inline int tracecmd_filter_task_count(struct tracecmd_filter_id *hash)
> -+{
> -+	return hash->count;
> -+}
> -+
> -+#endif /* _TRACE_FILTER_HASH_H */
> -diff --git a/lib/trace-cmd/include/private/trace-hash.h b/lib/trace-cmd/include/private/trace-hash.h
> -new file mode 100644
> -index 0000000..aa92cdf
> ---- /dev/null
> -+++ b/lib/trace-cmd/include/private/trace-hash.h
> -@@ -0,0 +1,55 @@
> -+/* SPDX-License-Identifier: GPL-2.0 */
> -+/*
> -+ * Copyright (C) 2014 Red Hat Inc, Steven Rostedt <srostedt@redhat.com>
> -+ *
> -+ */
> -+#ifndef _TRACE_HASH_H
> -+#define _TRACE_HASH_H
> -+
> -+struct trace_hash_item {
> -+	struct trace_hash_item	*next;
> -+	struct trace_hash_item	*prev;
> -+	unsigned long long	key;
> -+};
> -+
> -+struct trace_hash {
> -+	struct trace_hash_item	**buckets;
> -+	int			nr_buckets;
> -+	int			power;
> -+};
> -+
> -+int trace_hash_init(struct trace_hash *hash, int buckets);
> -+void trace_hash_free(struct trace_hash *hash);
> -+int trace_hash_add(struct trace_hash *hash, struct trace_hash_item *item);
> -+int trace_hash_empty(struct trace_hash *hash);
> -+
> -+static inline void trace_hash_del(struct trace_hash_item *item)
> -+{
> -+	struct trace_hash_item *prev = item->prev;
> -+
> -+	prev->next = item->next;
> -+	if (item->next)
> -+		item->next->prev = prev;
> -+}
> -+
> -+#define trace_hash_for_each_bucket(bucket, hash)			\
> -+	for (bucket = (hash)->buckets;					\
> -+	     (bucket) < (hash)->buckets + (hash)->nr_buckets; (bucket)++)
> -+
> -+#define trace_hash_for_each_item(item, bucket)				\
> -+	for ((item = *(bucket)); item; item = (item)->next)
> -+
> -+#define trace_hash_for_each_item_safe(item, n, bucket)		\
> -+	for ((item = *(bucket)), n = item ? item->next : NULL; item; \
> -+	     item = n, n = item ? (item)->next : NULL)
> -+
> -+#define trace_hash_while_item(item, bucket)	\
> -+	while ((item = *(bucket)))
> -+
> -+typedef int (*trace_hash_func)(struct trace_hash_item *item, void *data);
> -+
> -+struct trace_hash_item *
> -+trace_hash_find(struct trace_hash *hash, unsigned long long key,
> -+		trace_hash_func match, void *data);
> -+
> -+#endif /* _TRACE_HASH_H */
> -diff --git a/lib/trace-cmd/include/private/trace-msg.h b/lib/trace-cmd/include/private/trace-msg.h
> -new file mode 100644
> -index 0000000..aab8a69
> ---- /dev/null
> -+++ b/lib/trace-cmd/include/private/trace-msg.h
> -@@ -0,0 +1,15 @@
> -+#ifndef _TRACE_MSG_H_
> -+#define _TRACE_MSG_H_
> -+
> -+#include <stdbool.h>
> -+
> -+#define UDP_MAX_PACKET	(65536 - 20)
> -+#define V3_MAGIC	"766679\0"
> -+#define V3_CPU		"-1V3"
> -+
> -+#define V1_PROTOCOL	1
> -+#define V3_PROTOCOL	3
> -+
> -+extern unsigned int page_size;
> -+
> -+#endif /* _TRACE_MSG_H_ */
> -diff --git a/lib/trace-cmd/include/trace-cmd-local.h b/lib/trace-cmd/include/trace-cmd-local.h
> -index 95dce66..d0a7365 100644
> ---- a/lib/trace-cmd/include/trace-cmd-local.h
> -+++ b/lib/trace-cmd/include/trace-cmd-local.h
> -@@ -6,6 +6,8 @@
> - #ifndef _TRACE_CMD_LOCAL_H
> - #define _TRACE_CMD_LOCAL_H
> - 
> -+#include "trace-cmd-private.h"
> -+
> - /* Can be overridden */
> - void warning(const char *fmt, ...);
> - 
> -diff --git a/lib/trace-cmd/trace-ftrace.c b/lib/trace-cmd/trace-ftrace.c
> -index 20bf71f..df7335f 100644
> ---- a/lib/trace-cmd/trace-ftrace.c
> -+++ b/lib/trace-cmd/trace-ftrace.c
> -@@ -8,7 +8,7 @@
> - #include <string.h>
> - #include <sys/param.h>
> - 
> --#include "trace-cmd.h"
> -+#include "trace-cmd-private.h"
> - 
> - struct tep_plugin_option trace_ftrace_options[] = {
> - 	{
> -diff --git a/lib/trace-cmd/trace-hooks.c b/lib/trace-cmd/trace-hooks.c
> -index 8c969a6..2dadf61 100644
> ---- a/lib/trace-cmd/trace-hooks.c
> -+++ b/lib/trace-cmd/trace-hooks.c
> -@@ -8,7 +8,7 @@
> - #include <stdlib.h>
> - #include <ctype.h>
> - 
> --#include "trace-cmd.h"
> -+#include "trace-cmd-private.h"
> - #include "event-utils.h"
> - 
> - struct hook_list *tracecmd_create_event_hook(const char *arg)
> -diff --git a/lib/trace-cmd/trace-recorder.c b/lib/trace-cmd/trace-recorder.c
> -index 2a6e2b6..6b647d6 100644
> ---- a/lib/trace-cmd/trace-recorder.c
> -+++ b/lib/trace-cmd/trace-recorder.c
> -@@ -13,7 +13,7 @@
> - #include <errno.h>
> - 
> - #include "tracefs.h"
> --#include "trace-cmd.h"
> -+#include "trace-cmd-private.h"
> - #include "event-utils.h"
> - 
> - /* F_GETPIPE_SZ was introduced in 2.6.35, older systems don't have it */
> -diff --git a/lib/trace-cmd/trace-timesync.c b/lib/trace-cmd/trace-timesync.c
> -index 7a6a7eb..390e9d9 100644
> ---- a/lib/trace-cmd/trace-timesync.c
> -+++ b/lib/trace-cmd/trace-timesync.c
> -@@ -17,7 +17,7 @@
> - #include <errno.h>
> - #include <pthread.h>
> - 
> --#include "trace-cmd.h"
> -+#include "trace-cmd-private.h"
> - #include "tracefs.h"
> - #include "event-utils.h"
> - #include "trace-tsync-local.h"
> -diff --git a/lib/trace-cmd/trace-util.c b/lib/trace-cmd/trace-util.c
> -index 0ead96e..6b5d872 100644
> ---- a/lib/trace-cmd/trace-util.c
> -+++ b/lib/trace-cmd/trace-util.c
> -@@ -21,7 +21,7 @@
> - #include <sys/sysinfo.h>
> - #include <time.h>
> - 
> --#include "trace-cmd.h"
> -+#include "trace-cmd-private.h"
> - #include "event-utils.h"
> - 
> - #define LOCAL_PLUGIN_DIR ".trace-cmd/plugins"
> -diff --git a/lib/traceevent/plugins/plugin_python_loader.c b/lib/traceevent/plugins/plugin_python_loader.c
> -index 776bf12..01bdfad 100644
> ---- a/lib/traceevent/plugins/plugin_python_loader.c
> -+++ b/lib/traceevent/plugins/plugin_python_loader.c
> -@@ -1,6 +1,7 @@
> - #include <Python.h>
> - #include <stdio.h>
> --#include "trace-cmd.h"
> -+#include "event-parse.h"
> -+#include "trace-cmd-private.h"
> - 
> - #ifndef PYTHON_DIR
> - #define PYTHON_DIR "."
> -diff --git a/python/ctracecmd.i b/python/ctracecmd.i
> -index 01cd0d5..5f7181c 100644
> ---- a/python/ctracecmd.i
> -+++ b/python/ctracecmd.i
> -@@ -15,6 +15,7 @@
> - 
> - %{
> - #include "trace-cmd.h"
> -+#include "event-parse.h"
> - #include "event-utils.h"
> - #include <Python.h>
> - %}
> -diff --git a/tracecmd/include/trace-local.h b/tracecmd/include/trace-local.h
> -index 207aa68..28d1b4e 100644
> ---- a/tracecmd/include/trace-local.h
> -+++ b/tracecmd/include/trace-local.h
> -@@ -9,7 +9,7 @@
> - #include <sys/types.h>
> - #include <dirent.h>	/* for DIR */
> - 
> --#include "trace-cmd.h"
> -+#include "trace-cmd-private.h"
> - #include "event-utils.h"
> - 
> - #define TRACE_AGENT_DEFAULT_PORT	823
> --- 
> -2.29.2
> -
> diff --git a/package/trace-cmd/0002-trace-cmd-make-it-build-against-musl-C-library.patch b/package/trace-cmd/0002-trace-cmd-make-it-build-against-musl-C-library.patch
> deleted file mode 100644
> index 64021245dc..0000000000
> --- a/package/trace-cmd/0002-trace-cmd-make-it-build-against-musl-C-library.patch
> +++ /dev/null
> @@ -1,140 +0,0 @@
> -From 1a000636c1828eecdcec5360a51623ef4ffbff04 Mon Sep 17 00:00:00 2001
> -From: Beniamin Sandu <beniaminsandu@gmail.com>
> -Date: Mon, 30 Nov 2020 14:27:55 +0200
> -Subject: [PATCH] trace-cmd: make it build against musl C library
> -
> -* add some missing headers and macros
> -* set pthread affinity using pthread_setaffinity_np after creating the thread
> -instead of pthread_attr_setaffinity_np (which seems to not be implemented
> -in musl)
> -
> -Tested using https://musl.cc/x86_64-linux-musl-native.tgz
> -
> -Link: https://lore.kernel.org/linux-trace-devel/20201130122755.31000-1-beniaminsandu@gmail.com
> -
> -Reviewed-by: Tzvetomir Stoyanov (VMware) <tz.stoyanov@gmail.com>
> -Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> -[ Fixed a whitespace issue ]
> -Signed-off-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
> -[Retrieved from:
> -https://git.kernel.org/pub/scm/utils/trace-cmd/trace-cmd.git/commit/?id=1a000636c1828eecdcec5360a51623ef4ffbff04]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - .../include/private/trace-cmd-private.h          |  1 +
> - lib/trace-cmd/include/trace-cmd-local.h          |  1 +
> - lib/tracefs/include/tracefs-local.h              | 12 ++++++++++++
> - lib/tracefs/tracefs-events.c                     |  1 +
> - tracecmd/include/trace-local.h                   |  1 +
> - tracecmd/trace-tsync.c                           | 16 +++++++++++-----
> - 6 files changed, 27 insertions(+), 5 deletions(-)
> -
> -diff --git a/lib/trace-cmd/include/private/trace-cmd-private.h b/lib/trace-cmd/include/private/trace-cmd-private.h
> -index 458760e5..a0dac5da 100644
> ---- a/lib/trace-cmd/include/private/trace-cmd-private.h
> -+++ b/lib/trace-cmd/include/private/trace-cmd-private.h
> -@@ -6,6 +6,7 @@
> - #ifndef _TRACE_CMD_PRIVATE_H
> - #define _TRACE_CMD_PRIVATE_H
> - 
> -+#include <sys/types.h>
> - #include "traceevent/event-parse.h"
> - #include "trace-cmd/trace-cmd.h"
> - 
> -diff --git a/lib/trace-cmd/include/trace-cmd-local.h b/lib/trace-cmd/include/trace-cmd-local.h
> -index d0a7365a..0cd27441 100644
> ---- a/lib/trace-cmd/include/trace-cmd-local.h
> -+++ b/lib/trace-cmd/include/trace-cmd-local.h
> -@@ -6,6 +6,7 @@
> - #ifndef _TRACE_CMD_LOCAL_H
> - #define _TRACE_CMD_LOCAL_H
> - 
> -+#include <byteswap.h>
> - #include "trace-cmd-private.h"
> - 
> - /* Can be overridden */
> -diff --git a/lib/tracefs/include/tracefs-local.h b/lib/tracefs/include/tracefs-local.h
> -index 9cc371b4..bdbf89e8 100644
> ---- a/lib/tracefs/include/tracefs-local.h
> -+++ b/lib/tracefs/include/tracefs-local.h
> -@@ -13,4 +13,16 @@ void warning(const char *fmt, ...);
> - int str_read_file(const char *file, char **buffer);
> - char *trace_append_file(const char *dir, const char *name);
> - 
> -+#ifndef ACCESSPERMS
> -+#define ACCESSPERMS (S_IRWXU|S_IRWXG|S_IRWXO) /* 0777 */
> -+#endif
> -+
> -+#ifndef ALLPERMS
> -+#define ALLPERMS (S_ISUID|S_ISGID|S_ISVTX|S_IRWXU|S_IRWXG|S_IRWXO) /* 07777 */
> -+#endif
> -+
> -+#ifndef DEFFILEMODE
> -+#define DEFFILEMODE (S_IRUSR|S_IWUSR|S_IRGRP|S_IWGRP|S_IROTH|S_IWOTH) /* 0666*/
> -+#endif
> -+
> - #endif /* _TRACE_FS_LOCAL_H */
> -diff --git a/lib/tracefs/tracefs-events.c b/lib/tracefs/tracefs-events.c
> -index 80a25ee5..a4e5215f 100644
> ---- a/lib/tracefs/tracefs-events.c
> -+++ b/lib/tracefs/tracefs-events.c
> -@@ -13,6 +13,7 @@
> - #include <errno.h>
> - #include <sys/stat.h>
> - #include <fcntl.h>
> -+#include <limits.h>
> - 
> - #include "kbuffer.h"
> - #include "tracefs.h"
> -diff --git a/tracecmd/include/trace-local.h b/tracecmd/include/trace-local.h
> -index 28d1b4e0..85c7e03e 100644
> ---- a/tracecmd/include/trace-local.h
> -+++ b/tracecmd/include/trace-local.h
> -@@ -8,6 +8,7 @@
> - 
> - #include <sys/types.h>
> - #include <dirent.h>	/* for DIR */
> -+#include <limits.h>
> - 
> - #include "trace-cmd-private.h"
> - #include "event-utils.h"
> -diff --git a/tracecmd/trace-tsync.c b/tracecmd/trace-tsync.c
> -index e639788d..8b9083ae 100644
> ---- a/tracecmd/trace-tsync.c
> -+++ b/tracecmd/trace-tsync.c
> -@@ -104,13 +104,16 @@ int tracecmd_host_tsync(struct buffer_instance *instance,
> - 
> - 	pthread_attr_init(&attrib);
> - 	pthread_attr_setdetachstate(&attrib, PTHREAD_CREATE_JOINABLE);
> --	if (!get_first_cpu(&pin_mask, &mask_size))
> --		pthread_attr_setaffinity_np(&attrib, mask_size, pin_mask);
> - 
> - 	ret = pthread_create(&instance->tsync_thread, &attrib,
> - 			     tsync_host_thread, &instance->tsync);
> --	if (!ret)
> -+
> -+	if (!ret) {
> -+		if (!get_first_cpu(&pin_mask, &mask_size))
> -+			pthread_setaffinity_np(instance->tsync_thread, mask_size, pin_mask);
> - 		instance->tsync_thread_running = true;
> -+	}
> -+
> - 	if (pin_mask)
> - 		CPU_FREE(pin_mask);
> - 	pthread_attr_destroy(&attrib);
> -@@ -243,11 +246,14 @@ unsigned int tracecmd_guest_tsync(char *tsync_protos,
> - 	pthread_attr_init(&attrib);
> - 	tsync->sync_proto = proto;
> - 	pthread_attr_setdetachstate(&attrib, PTHREAD_CREATE_JOINABLE);
> --	if (!get_first_cpu(&pin_mask, &mask_size))
> --		pthread_attr_setaffinity_np(&attrib, mask_size, pin_mask);
> - 
> - 	ret = pthread_create(thr_id, &attrib, tsync_agent_thread, tsync);
> - 
> -+	if (!ret) {
> -+		if (!get_first_cpu(&pin_mask, &mask_size))
> -+			pthread_setaffinity_np(*thr_id, mask_size, pin_mask);
> -+	}
> -+
> - 	if (pin_mask)
> - 		CPU_FREE(pin_mask);
> - 	pthread_attr_destroy(&attrib);
> diff --git a/package/trace-cmd/0003-trace-cmd-Move-add_event_pid-out-of-ifndef-NO_PTRACE.patch b/package/trace-cmd/0003-trace-cmd-Move-add_event_pid-out-of-ifndef-NO_PTRACE.patch
> deleted file mode 100644
> index ca32e69ab1..0000000000
> --- a/package/trace-cmd/0003-trace-cmd-Move-add_event_pid-out-of-ifndef-NO_PTRACE.patch
> +++ /dev/null
> @@ -1,51 +0,0 @@
> -From 2f55ded528cfd8ef468bdd1f8bb82dcf1cfae04a Mon Sep 17 00:00:00 2001
> -From: "Steven Rostedt (VMware)" <rostedt@goodmis.org>
> -Date: Wed, 16 Dec 2020 18:19:43 -0500
> -Subject: [PATCH] trace-cmd: Move add_event_pid() out of #ifndef NO_PTRACE
> -
> -When NO_PTRACE is defined, add_event_pid() is also not defined, but it is
> -used outside of NO_PTRACE pre processor block. And this causes a
> -"add_event_pid" not defined build failure.
> -
> -Link: https://lore.kernel.org/linux-trace-devel/20201216232145.010165486@goodmis.org
> -
> -Fixes: 0844cff1c ("trace-cmd: Fix "trace-cmd reset" command to restore the default value of set_event_pid")
> -Signed-off-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
> -[Retrieved from:
> -https://git.kernel.org/pub/scm/utils/trace-cmd/trace-cmd.git/commit/?id=2f55ded528cfd8ef468bdd1f8bb82dcf1cfae04a]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - tracecmd/trace-record.c | 12 ++++++------
> - 1 file changed, 6 insertions(+), 6 deletions(-)
> -
> -diff --git a/tracecmd/trace-record.c b/tracecmd/trace-record.c
> -index f8baed7d..e2d1cedf 100644
> ---- a/tracecmd/trace-record.c
> -+++ b/tracecmd/trace-record.c
> -@@ -1312,8 +1312,13 @@ static int trace_wait_for_processes(struct buffer_instance *instance) {
> - 	free(pidfds);
> - 	return ret;
> - }
> --#ifndef NO_PTRACE
> - 
> -+static void add_event_pid(struct buffer_instance *instance, const char *buf)
> -+{
> -+	tracefs_instance_file_write(instance->tracefs, "set_event_pid", buf);
> -+}
> -+
> -+#ifndef NO_PTRACE
> - /**
> -  * append_pid_filter - add a new pid to an existing filter
> -  * @curr_filter: the filter to append to. If NULL, then allocate one
> -@@ -1369,11 +1374,6 @@ static void update_sched_events(struct buffer_instance *instance, int pid)
> - static int open_instance_fd(struct buffer_instance *instance,
> - 			    const char *file, int flags);
> - 
> --static void add_event_pid(struct buffer_instance *instance, const char *buf)
> --{
> --	tracefs_instance_file_write(instance->tracefs, "set_event_pid", buf);
> --}
> --
> - static void add_new_filter_child_pid(int pid, int child)
> - {
> - 	struct buffer_instance *instance;
> diff --git a/package/trace-cmd/trace-cmd.hash b/package/trace-cmd/trace-cmd.hash
> index 0afde6705e..78ff3472c3 100644
> --- a/package/trace-cmd/trace-cmd.hash
> +++ b/package/trace-cmd/trace-cmd.hash
> @@ -1,5 +1,5 @@
>  # Locally computed
> -sha256  8bab29530cd05272dccab48c9780644758e71ed990ce65c701b9095f7beae417  trace-cmd-trace-cmd-v2.9.1-br1.tar.gz
> +sha256  026cce03b4ae61f19848646acecf151dd7dd62617859edcf73ae954eb65b2653  trace-cmd-trace-cmd-v2.9.5-br1.tar.gz
>  sha256  b1d04b850c1c7471b0f0896f6c6f0fcfc9f07e2dd183a5f5826af269fe9e88fb  COPYING
>  sha256  70f297763149e72306919c924e164f83041d5e512868d4c8c1826c171b3e49f9  COPYING.LIB
>  sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSES/GPL-2.0
> diff --git a/package/trace-cmd/trace-cmd.mk b/package/trace-cmd/trace-cmd.mk
> index bc431e5dd2..f9b54ed765 100644
> --- a/package/trace-cmd/trace-cmd.mk
> +++ b/package/trace-cmd/trace-cmd.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -TRACE_CMD_VERSION = trace-cmd-v2.9.1
> +TRACE_CMD_VERSION = trace-cmd-v2.9.5
>  TRACE_CMD_SITE = https://git.kernel.org/pub/scm/utils/trace-cmd/trace-cmd.git
>  TRACE_CMD_SITE_METHOD = git
>  TRACE_CMD_LICENSE = GPL-2.0, LGPL-2.1
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@lists.buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

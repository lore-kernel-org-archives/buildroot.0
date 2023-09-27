Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5CC0E82CBF
	for <buildroot@archiver.kernel.org>; Wed, 27 Sep 2023 18:43:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C495402C5;
	Wed, 27 Sep 2023 18:43:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C495402C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KJ7uAhR2U8Zp; Wed, 27 Sep 2023 18:43:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A441A417B3;
	Wed, 27 Sep 2023 18:43:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A441A417B3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1140A1BF300
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 18:43:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EBB8D6101C
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 18:43:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBB8D6101C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cJM9xG4mjjti for <buildroot@lists.busybox.net>;
 Wed, 27 Sep 2023 18:43:27 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 544BB60E53
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 18:43:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 544BB60E53
Received: from fli4l.lan.fli4l (p4fd6c587.dip0.t-ipconnect.de [79.214.197.135])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 47BE8A4C029A
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 20:43:11 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59392)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qlZV8-0001Pu-0G
 for buildroot@buildroot.org; Wed, 27 Sep 2023 20:43:10 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 27 Sep 2023 20:43:09 +0200
Message-Id: <20230927184310.888176-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1695840191;
 bh=gS7YEwQFzZbyVq9JzTwYpk61bu3mWlVzheTvVtRAkw4=;
 h=From:To:Subject:Date:From;
 b=kcpsUG8MAYdoO8s20kfZ5pFGuGXJaQX19bLeUk+WL377k8ll7fIVZVa4wH4qj7SuK
 pnQ6Ep2y8yzbJkV8Oq5C50nbhz3+vlifLK0Lvnw6IeSq86ZVHlBRDblY7FzVLab+sj
 lrr4JQECOWEHB0C+PJWjZG2TdPZImkhvVtKyewZn0RHeRRu23xrlMGeuzItvXE0qN/
 JB3J2bJHo2WvxErqUPFb1SnX3qKWqld4XaIyIU9wdMoYZg/hXEkKtHIddumMZw3KnX
 D+nI2rclmNvS5ziDnClmopWkeUntiWgiqPV6JfViUpq59hfhMsM3jgkL/6yTQRh0hK
 Zkk+yKYDvgetw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=kcpsUG8M
Subject: [Buildroot] [PATCH 1/2] package/alsa-utils: fix build with gcc < 11
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

Fixes:
http://autobuild.buildroot.net/results/bfd/bfde1d5c3067e98d983ce1eebc1560bd13d00b8a/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...UTE_UNUSED-instead-remove-argument-n.patch | 233 +++++++++++++
 ...UTE_UNUSED-instead-remove-argument-n.patch |  34 ++
 ...RIBUTE_UNUSED-instead-remove-argumen.patch |  57 ++++
 ...E_UNUSED-instead-remove-argument-nam.patch |  67 ++++
 ...E_UNUSED-instead-remove-argument-nam.patch |  93 ++++++
 ...IBUTE_UNUSED-instead-remove-argument.patch | 109 ++++++
 ...RIBUTE_UNUSED-instead-remove-argumen.patch | 312 ++++++++++++++++++
 7 files changed, 905 insertions(+)
 create mode 100644 package/alsa-utils/0002-axfer-use-ATTRIBUTE_UNUSED-instead-remove-argument-n.patch
 create mode 100644 package/alsa-utils/0003-amidi-use-ATTRIBUTE_UNUSED-instead-remove-argument-n.patch
 create mode 100644 package/alsa-utils/0004-alsaloop-use-ATTRIBUTE_UNUSED-instead-remove-argumen.patch
 create mode 100644 package/alsa-utils/0005-bat-use-ATTRIBUTE_UNUSED-instead-remove-argument-nam.patch
 create mode 100644 package/alsa-utils/0006-seq-use-ATTRIBUTE_UNUSED-instead-remove-argument-nam.patch
 create mode 100644 package/alsa-utils/0007-alsaucm-use-ATTRIBUTE_UNUSED-instead-remove-argument.patch
 create mode 100644 package/alsa-utils/0008-topology-use-ATTRIBUTE_UNUSED-instead-remove-argumen.patch

diff --git a/package/alsa-utils/0002-axfer-use-ATTRIBUTE_UNUSED-instead-remove-argument-n.patch b/package/alsa-utils/0002-axfer-use-ATTRIBUTE_UNUSED-instead-remove-argument-n.patch
new file mode 100644
index 0000000000..92622292c0
--- /dev/null
+++ b/package/alsa-utils/0002-axfer-use-ATTRIBUTE_UNUSED-instead-remove-argument-n.patch
@@ -0,0 +1,233 @@
+From a90faa2dd644af585d6a00f0aaf297c15ea0aa7b Mon Sep 17 00:00:00 2001
+From: Jaroslav Kysela <perex@perex.cz>
+Date: Mon, 4 Sep 2023 16:33:47 +0200
+Subject: [PATCH] axfer: use ATTRIBUTE_UNUSED instead remove argument name
+
+We need to support older compilers than GCC 11.
+
+Link: https://github.com/alsa-project/alsa-utils/issues/233
+Fixes: ad5a1c0 ("axfer: fix the verbose compilation warnings for latest gcc")
+Signed-off-by: Jaroslav Kysela <perex@perex.cz>
+
+Upstream: https://github.com/alsa-project/alsa-utils/commit/a90faa2dd644af585d6a00f0aaf297c15ea0aa7b
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ axfer/container-raw.c         | 14 +++++++-------
+ axfer/mapper-single.c         |  6 +++---
+ axfer/subcmd-list.c           |  2 +-
+ axfer/subcmd-transfer.c       |  4 ++--
+ axfer/waiter-poll.c           |  4 ++--
+ axfer/waiter-select.c         |  4 ++--
+ axfer/waiter.h                |  1 +
+ axfer/xfer-libasound-irq-rw.c |  2 +-
+ axfer/xfer-libasound.c        |  4 ++--
+ axfer/xfer-options.c          |  3 ++-
+ 10 files changed, 23 insertions(+), 21 deletions(-)
+
+diff --git a/axfer/container-raw.c b/axfer/container-raw.c
+index 071f94c..1886045 100644
+--- a/axfer/container-raw.c
++++ b/axfer/container-raw.c
+@@ -13,10 +13,10 @@
+ #include <sys/stat.h>
+ #include <unistd.h>
+ 
+-static int raw_builder_pre_process(struct container_context *,
+-				   snd_pcm_format_t *,
+-				   unsigned int *,
+-				   unsigned int *,
++static int raw_builder_pre_process(struct container_context *cntr ATTRIBUTE_UNUSED,
++				   snd_pcm_format_t *format ATTRIBUTE_UNUSED,
++				   unsigned int *samples_per_frame ATTRIBUTE_UNUSED,
++				   unsigned int *frames_per_second ATTRIBUTE_UNUSED,
+ 				   uint64_t *byte_count)
+ {
+ 	*byte_count = UINT64_MAX;
+@@ -25,9 +25,9 @@ static int raw_builder_pre_process(struct container_context *,
+ }
+ 
+ static int raw_parser_pre_process(struct container_context *cntr,
+-				  snd_pcm_format_t *,
+-				  unsigned int *,
+-				  unsigned int *,
++				  snd_pcm_format_t *format ATTRIBUTE_UNUSED,
++				  unsigned int *samples_per_frame ATTRIBUTE_UNUSED,
++				  unsigned int *frames_per_second ATTRIBUTE_UNUSED,
+ 				  uint64_t *byte_count)
+ {
+ 	struct stat buf = {0};
+diff --git a/axfer/mapper-single.c b/axfer/mapper-single.c
+index 13e7fc5..f669f7f 100644
+--- a/axfer/mapper-single.c
++++ b/axfer/mapper-single.c
+@@ -62,7 +62,7 @@ static void align_from_vector(void *frame_buf, unsigned int frame_count,
+ 
+ static int single_pre_process(struct mapper_context *mapper,
+ 			      struct container_context *cntrs,
+-			      unsigned int)
++			      unsigned int cntr_count ATTRIBUTE_UNUSED)
+ {
+ 	struct single_state *state = mapper->private_data;
+ 	unsigned int bytes_per_buffer;
+@@ -110,7 +110,7 @@ static int single_muxer_process_frames(struct mapper_context *mapper,
+ 				       void *frame_buf,
+ 				       unsigned int *frame_count,
+ 				       struct container_context *cntrs,
+-				       unsigned int)
++				       unsigned int cntr_count ATTRIBUTE_UNUSED)
+ {
+ 	struct single_state *state = mapper->private_data;
+ 	void *src;
+@@ -141,7 +141,7 @@ static int single_demuxer_process_frames(struct mapper_context *mapper,
+ 					 void *frame_buf,
+ 					 unsigned int *frame_count,
+ 					 struct container_context *cntrs,
+-					 unsigned int)
++					 unsigned int cntr_count ATTRIBUTE_UNUSED)
+ {
+ 	struct single_state *state = mapper->private_data;
+ 	void *dst;
+diff --git a/axfer/subcmd-list.c b/axfer/subcmd-list.c
+index f9c8e0f..187e1d7 100644
+--- a/axfer/subcmd-list.c
++++ b/axfer/subcmd-list.c
+@@ -19,7 +19,7 @@ enum list_op {
+ };
+ 
+ static int dump_device(snd_ctl_t *handle, const char *id, const char *name,
+-		       snd_pcm_stream_t, snd_pcm_info_t *info)
++		       snd_pcm_stream_t stream ATTRIBUTE_UNUSED, snd_pcm_info_t *info)
+ {
+ 	unsigned int i, count;
+ 	int err;
+diff --git a/axfer/subcmd-transfer.c b/axfer/subcmd-transfer.c
+index b39fde8..8d63043 100644
+--- a/axfer/subcmd-transfer.c
++++ b/axfer/subcmd-transfer.c
+@@ -40,7 +40,7 @@ static void handle_unix_signal_for_finish(int sig)
+ 	ctx_ptr->interrupted = true;
+ }
+ 
+-static void handle_unix_signal_for_suspend(int)
++static void handle_unix_signal_for_suspend(int sig ATTRIBUTE_UNUSED)
+ {
+ 	sigset_t curr, prev;
+ 	struct sigaction sa = {0};
+@@ -439,7 +439,7 @@ static int context_process_frames(struct context *ctx,
+ }
+ 
+ static void context_post_process(struct context *ctx,
+-				 uint64_t)
++				 uint64_t accumulated_frame_count ATTRIBUTE_UNUSED)
+ {
+ 	uint64_t total_frame_count;
+ 	unsigned int i;
+diff --git a/axfer/waiter-poll.c b/axfer/waiter-poll.c
+index 31fab88..b81300c 100644
+--- a/axfer/waiter-poll.c
++++ b/axfer/waiter-poll.c
+@@ -13,7 +13,7 @@
+ #include <errno.h>
+ #include <poll.h>
+ 
+-static int poll_prepare(struct waiter_context *)
++static int poll_prepare(struct waiter_context *waiter ATTRIBUTE_UNUSED)
+ {
+ 	// Nothing to do because an instance of waiter has required data.
+ 	return 0;
+@@ -30,7 +30,7 @@ static int poll_wait_event(struct waiter_context *waiter, int timeout_msec)
+ 	return err;
+ }
+ 
+-static void poll_release(struct waiter_context *)
++static void poll_release(struct waiter_context *waiter ATTRIBUTE_UNUSED)
+ {
+ 	// Nothing to do because an instance of waiter has required data.
+ 	return;
+diff --git a/axfer/waiter-select.c b/axfer/waiter-select.c
+index 164c9c8..fe19776 100644
+--- a/axfer/waiter-select.c
++++ b/axfer/waiter-select.c
+@@ -34,7 +34,7 @@ struct select_state {
+ 	fd_set rfds_ex;
+ };
+ 
+-static int select_prepare(struct waiter_context *)
++static int select_prepare(struct waiter_context *waiter ATTRIBUTE_UNUSED)
+ {
+ 	return 0;
+ }
+@@ -94,7 +94,7 @@ static int select_wait_event(struct waiter_context *waiter, int timeout_msec)
+ 	return err;
+ }
+ 
+-static void select_release(struct waiter_context *)
++static void select_release(struct waiter_context *waiter ATTRIBUTE_UNUSED)
+ {
+ 	return;
+ }
+diff --git a/axfer/waiter.h b/axfer/waiter.h
+index db18e33..0f4e9b9 100644
+--- a/axfer/waiter.h
++++ b/axfer/waiter.h
+@@ -9,6 +9,7 @@
+ #ifndef __ALSA_UTILS_AXFER_WAITER__H_
+ #define __ALSA_UTILS_AXFER_WAITER__H_
+ 
++#include <alsa/global.h>
+ #include <poll.h>
+ 
+ enum waiter_type {
+diff --git a/axfer/xfer-libasound-irq-rw.c b/axfer/xfer-libasound-irq-rw.c
+index b7f0645..45fb6d5 100644
+--- a/axfer/xfer-libasound-irq-rw.c
++++ b/axfer/xfer-libasound-irq-rw.c
+@@ -313,7 +313,7 @@ error:
+ }
+ 
+ static int w_process_frames_nonblocking(struct libasound_state *state,
+-					snd_pcm_state_t,
++					snd_pcm_state_t pcm_state ATTRIBUTE_UNUSED,
+ 					unsigned int *frame_count,
+ 					struct mapper_context *mapper,
+ 					struct container_context *cntrs)
+diff --git a/axfer/xfer-libasound.c b/axfer/xfer-libasound.c
+index 9713533..36ee08d 100644
+--- a/axfer/xfer-libasound.c
++++ b/axfer/xfer-libasound.c
+@@ -60,7 +60,7 @@ static const struct option l_opts[] = {
+ };
+ 
+ static int xfer_libasound_init(struct xfer_context *xfer,
+-			       snd_pcm_stream_t)
++			       snd_pcm_stream_t stream ATTRIBUTE_UNUSED)
+ {
+ 	struct libasound_state *state = xfer->private_data;
+ 	int err;
+@@ -887,7 +887,7 @@ static void xfer_libasound_destroy(struct xfer_context *xfer)
+ 	state->log = NULL;
+ }
+ 
+-static void xfer_libasound_help(struct xfer_context *)
++static void xfer_libasound_help(struct xfer_context *xfer ATTRIBUTE_UNUSED)
+ {
+ 	printf(
+ "      [BASICS]\n"
+diff --git a/axfer/xfer-options.c b/axfer/xfer-options.c
+index 974570c..e716ded 100644
+--- a/axfer/xfer-options.c
++++ b/axfer/xfer-options.c
+@@ -447,7 +447,8 @@ static int generate_path_with_suffix(struct xfer_context *xfer,
+ 
+ static int generate_path_without_suffix(struct xfer_context *xfer,
+ 				        const char *template,
+-					unsigned int index, const char *)
++					unsigned int index,
++					const char *suffix ATTRIBUTE_UNUSED)
+ {
+ 	static const char *const single_format = "%s";
+ 	static const char *const multiple_format = "%s-%i";
+-- 
+2.39.2
+
diff --git a/package/alsa-utils/0003-amidi-use-ATTRIBUTE_UNUSED-instead-remove-argument-n.patch b/package/alsa-utils/0003-amidi-use-ATTRIBUTE_UNUSED-instead-remove-argument-n.patch
new file mode 100644
index 0000000000..12a098b6fb
--- /dev/null
+++ b/package/alsa-utils/0003-amidi-use-ATTRIBUTE_UNUSED-instead-remove-argument-n.patch
@@ -0,0 +1,34 @@
+From 2db896afd475b0b3ad07e97ba74ec9680b4f7f6d Mon Sep 17 00:00:00 2001
+From: Jaroslav Kysela <perex@perex.cz>
+Date: Mon, 4 Sep 2023 16:37:24 +0200
+Subject: [PATCH] amidi: use ATTRIBUTE_UNUSED instead remove argument name
+
+We need to support older compilers than GCC 11.
+
+Link: https://github.com/alsa-project/alsa-utils/issues/233
+Fixes: 1843540 ("amidi: fix the verbose compilation warnings for latest gcc")
+Signed-off-by: Jaroslav Kysela <perex@perex.cz>
+
+Upstream: https://github.com/alsa-project/alsa-utils/commit/2db896afd475b0b3ad07e97ba74ec9680b4f7f6d
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ amidi/amidi.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/amidi/amidi.c b/amidi/amidi.c
+index f930ca8..75fb8c0 100644
+--- a/amidi/amidi.c
++++ b/amidi/amidi.c
+@@ -446,7 +446,7 @@ static void print_byte(unsigned char byte, struct timespec *ts)
+ 	printf("%02X", byte);
+ }
+ 
+-static void sig_handler(int)
++static void sig_handler(int sig ATTRIBUTE_UNUSED)
+ {
+ 	stop = 1;
+ }
+-- 
+2.39.2
+
diff --git a/package/alsa-utils/0004-alsaloop-use-ATTRIBUTE_UNUSED-instead-remove-argumen.patch b/package/alsa-utils/0004-alsaloop-use-ATTRIBUTE_UNUSED-instead-remove-argumen.patch
new file mode 100644
index 0000000000..4720531415
--- /dev/null
+++ b/package/alsa-utils/0004-alsaloop-use-ATTRIBUTE_UNUSED-instead-remove-argumen.patch
@@ -0,0 +1,57 @@
+From 7552aef6e08b5b1fd8c1704e21cb9f6f15017bfa Mon Sep 17 00:00:00 2001
+From: Jaroslav Kysela <perex@perex.cz>
+Date: Mon, 4 Sep 2023 16:45:09 +0200
+Subject: [PATCH] alsaloop: use ATTRIBUTE_UNUSED instead remove argument name
+
+We need to support older compilers than GCC 11.
+
+Link: https://github.com/alsa-project/alsa-utils/issues/233
+Fixes: d609a58 ("alsaloop: fix the verbose compilation warnings for latest gcc")
+Signed-off-by: Jaroslav Kysela <perex@perex.cz>
+
+Upstream: https://github.com/alsa-project/alsa-utils/commit/7552aef6e08b5b1fd8c1704e21cb9f6f15017bfa
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ alsaloop/alsaloop.c | 2 +-
+ alsaloop/pcmjob.c   | 4 ++--
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/alsaloop/alsaloop.c b/alsaloop/alsaloop.c
+index b10733e..51fb646 100644
+--- a/alsaloop/alsaloop.c
++++ b/alsaloop/alsaloop.c
+@@ -821,7 +821,7 @@ static void send_to_all(int sig)
+ 	}
+ }
+ 
+-static void signal_handler(int)
++static void signal_handler(int sig ATTRIBUTE_UNUSED)
+ {
+ 	quit = 1;
+ 	send_to_all(SIGUSR2);
+diff --git a/alsaloop/pcmjob.c b/alsaloop/pcmjob.c
+index be71971..ffb439b 100644
+--- a/alsaloop/pcmjob.c
++++ b/alsaloop/pcmjob.c
+@@ -625,7 +625,7 @@ static void buf_add_src(struct loopback *loop)
+ 	}
+ }
+ #else
+-static void buf_add_src(struct loopback *)
++static void buf_add_src(struct loopback *loop ATTRIBUTE_UNUSED)
+ {
+ }
+ #endif
+@@ -1794,7 +1794,7 @@ static int ctl_event_check(snd_ctl_elem_value_t *val, snd_ctl_event_t *ev)
+ }
+ 
+ static int handle_ctl_events(struct loopback_handle *lhandle,
+-			     unsigned short)
++			     unsigned short events ATTRIBUTE_UNUSED)
+ {
+ 	struct loopback *loop = lhandle->loopback;
+ 	snd_ctl_event_t *ev;
+-- 
+2.39.2
+
diff --git a/package/alsa-utils/0005-bat-use-ATTRIBUTE_UNUSED-instead-remove-argument-nam.patch b/package/alsa-utils/0005-bat-use-ATTRIBUTE_UNUSED-instead-remove-argument-nam.patch
new file mode 100644
index 0000000000..1a42f24d3c
--- /dev/null
+++ b/package/alsa-utils/0005-bat-use-ATTRIBUTE_UNUSED-instead-remove-argument-nam.patch
@@ -0,0 +1,67 @@
+From 94eeb5a40f77e92624eb32d2e9c50b1cd9e4f837 Mon Sep 17 00:00:00 2001
+From: Jaroslav Kysela <perex@perex.cz>
+Date: Mon, 4 Sep 2023 16:49:03 +0200
+Subject: [PATCH] bat: use ATTRIBUTE_UNUSED instead remove argument name
+
+We need to support older compilers than GCC 11.
+
+Link: https://github.com/alsa-project/alsa-utils/issues/233
+Fixes: b366875 ("bat: fix the verbose compilation warnings for latest gcc")
+Signed-off-by: Jaroslav Kysela <perex@perex.cz>
+
+Upstream: https://github.com/alsa-project/alsa-utils/commit/94eeb5a40f77e92624eb32d2e9c50b1cd9e4f837
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ bat/bat.c    | 3 ++-
+ bat/common.c | 3 ++-
+ bat/common.h | 5 +++++
+ 3 files changed, 9 insertions(+), 2 deletions(-)
+
+diff --git a/bat/bat.c b/bat/bat.c
+index e88c65f..ea04ed9 100644
+--- a/bat/bat.c
++++ b/bat/bat.c
+@@ -158,7 +158,8 @@ static void get_format(struct bat *bat, char *optarg)
+ 	}
+ }
+ 
+-static inline int thread_wait_completion(struct bat *, pthread_t id, int **val)
++static inline int thread_wait_completion(struct bat *bat ATTRIBUTE_UNUSED,
++					 pthread_t id, int **val)
+ {
+ 	int err;
+ 
+diff --git a/bat/common.c b/bat/common.c
+index 9ff9405..470a7e6 100644
+--- a/bat/common.c
++++ b/bat/common.c
+@@ -47,7 +47,8 @@ static int update_fmt_to_bat(struct bat *bat, struct chunk_fmt *fmt)
+ }
+ 
+ /* calculate frames and update to bat */
+-static int update_frames_to_bat(struct bat *bat, struct wav_chunk_header *header, FILE *)
++static int update_frames_to_bat(struct bat *bat, struct wav_chunk_header *header,
++				FILE *file ATTRIBUTE_UNUSED)
+ {
+ 	/* The number of analyzed captured frames is arbitrarily set to half of
+ 	   the number of frames of the wav file or the number of frames of the
+diff --git a/bat/common.h b/bat/common.h
+index a9bae5d..bb51b0d 100644
+--- a/bat/common.h
++++ b/bat/common.h
+@@ -13,6 +13,11 @@
+  *
+  */
+ 
++#ifndef ATTRIBUTE_UNUSED
++/** do not print warning (gcc) when function parameter is not used */
++#define ATTRIBUTE_UNUSED __attribute__ ((__unused__))
++#endif
++
+ #define TEMP_RECORD_FILE_NAME		"/tmp/bat.wav.XXXXXX"
+ #define DEFAULT_DEV_NAME		"default"
+ 
+-- 
+2.39.2
+
diff --git a/package/alsa-utils/0006-seq-use-ATTRIBUTE_UNUSED-instead-remove-argument-nam.patch b/package/alsa-utils/0006-seq-use-ATTRIBUTE_UNUSED-instead-remove-argument-nam.patch
new file mode 100644
index 0000000000..9e7e7da5ce
--- /dev/null
+++ b/package/alsa-utils/0006-seq-use-ATTRIBUTE_UNUSED-instead-remove-argument-nam.patch
@@ -0,0 +1,93 @@
+From 66112d60e4ce68720022eaf26080c0f1a2caf81f Mon Sep 17 00:00:00 2001
+From: Jaroslav Kysela <perex@perex.cz>
+Date: Mon, 4 Sep 2023 16:52:46 +0200
+Subject: [PATCH] seq: use ATTRIBUTE_UNUSED instead remove argument name
+
+We need to support older compilers than GCC 11.
+
+Link: https://github.com/alsa-project/alsa-utils/issues/233
+Fixes: 181e190 ("aplaymidi: fix the verbose compilation warnings for latest gcc")
+Fixes: a03377a ("aseqnet: fix the verbose compilation warnings for latest gcc")
+Fixes: 429c32a ("aseqdump: fix the verbose compilation warnings for latest gcc")
+Fixes: 0b48dd6 ("aconnect: fix the verbose compilation warnings for latest gcc")
+Signed-off-by: Jaroslav Kysela <perex@perex.cz>
+
+Upstream: https://github.com/alsa-project/alsa-utils/commit/66112d60e4ce68720022eaf26080c0f1a2caf81f
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ seq/aconnect/aconnect.c     | 9 ++++++---
+ seq/aplaymidi/arecordmidi.c | 2 +-
+ seq/aseqdump/aseqdump.c     | 2 +-
+ seq/aseqnet/aseqnet.c       | 2 +-
+ 4 files changed, 9 insertions(+), 6 deletions(-)
+
+diff --git a/seq/aconnect/aconnect.c b/seq/aconnect/aconnect.c
+index 3a10de9..7096feb 100644
+--- a/seq/aconnect/aconnect.c
++++ b/seq/aconnect/aconnect.c
+@@ -193,7 +193,8 @@ static void do_search_port(snd_seq_t *seq, int perm, action_func_t do_action)
+ }
+ 
+ 
+-static void print_port(snd_seq_t *, snd_seq_client_info_t *cinfo,
++static void print_port(snd_seq_t *seq ATTRIBUTE_UNUSED,
++		       snd_seq_client_info_t *cinfo,
+ 		       snd_seq_port_info_t *pinfo, int count)
+ {
+ 	if (! count) {
+@@ -247,8 +248,10 @@ static void print_port_and_subs(snd_seq_t *seq, snd_seq_client_info_t *cinfo,
+ /*
+  * remove all (exported) connections
+  */
+-static void remove_connection(snd_seq_t *seq, snd_seq_client_info_t *,
+-			      snd_seq_port_info_t *pinfo, int)
++static void remove_connection(snd_seq_t *seq,
++			      snd_seq_client_info_t *info ATTRIBUTE_UNUSED,
++			      snd_seq_port_info_t *pinfo,
++			      int count ATTRIBUTE_UNUSED)
+ {
+ 	snd_seq_query_subscribe_t *query;
+ 	snd_seq_port_info_t *port;
+diff --git a/seq/aplaymidi/arecordmidi.c b/seq/aplaymidi/arecordmidi.c
+index ce71472..a4c1181 100644
+--- a/seq/aplaymidi/arecordmidi.c
++++ b/seq/aplaymidi/arecordmidi.c
+@@ -719,7 +719,7 @@ static void version(void)
+ 	fputs("arecordmidi version " SND_UTIL_VERSION_STR "\n", stderr);
+ }
+ 
+-static void sighandler(int)
++static void sighandler(int sig ATTRIBUTE_UNUSED)
+ {
+ 	stop = 1;
+ }
+diff --git a/seq/aseqdump/aseqdump.c b/seq/aseqdump/aseqdump.c
+index 8455ecb..af4ca21 100644
+--- a/seq/aseqdump/aseqdump.c
++++ b/seq/aseqdump/aseqdump.c
+@@ -676,7 +676,7 @@ static void version(void)
+ 	puts("aseqdump version " SND_UTIL_VERSION_STR);
+ }
+ 
+-static void sighandler(int)
++static void sighandler(int sig ATTRIBUTE_UNUSED)
+ {
+ 	stop = 1;
+ }
+diff --git a/seq/aseqnet/aseqnet.c b/seq/aseqnet/aseqnet.c
+index f40de7d..aa70b50 100644
+--- a/seq/aseqnet/aseqnet.c
++++ b/seq/aseqnet/aseqnet.c
+@@ -334,7 +334,7 @@ static void get_net_addr(struct addrinfo *rp, char *buf, size_t buflen)
+ /*
+  * signal handler
+  */
+-static void sigterm_exit(int)
++static void sigterm_exit(int sig ATTRIBUTE_UNUSED)
+ {
+ 	close_files();
+ 	exit(1);
+-- 
+2.39.2
+
diff --git a/package/alsa-utils/0007-alsaucm-use-ATTRIBUTE_UNUSED-instead-remove-argument.patch b/package/alsa-utils/0007-alsaucm-use-ATTRIBUTE_UNUSED-instead-remove-argument.patch
new file mode 100644
index 0000000000..66826c4515
--- /dev/null
+++ b/package/alsa-utils/0007-alsaucm-use-ATTRIBUTE_UNUSED-instead-remove-argument.patch
@@ -0,0 +1,109 @@
+From 9e5e9a6d70de63bea01f0669b01319952f2cfdea Mon Sep 17 00:00:00 2001
+From: Jaroslav Kysela <perex@perex.cz>
+Date: Mon, 4 Sep 2023 16:57:47 +0200
+Subject: [PATCH] alsaucm: use ATTRIBUTE_UNUSED instead remove argument name
+
+We need to support older compilers than GCC 11.
+
+Link: https://github.com/alsa-project/alsa-utils/issues/233
+Fixes: d7bbc26 ("alsaucm: fix the verbose compilation warnings for latest gcc")
+Signed-off-by: Jaroslav Kysela <perex@perex.cz>
+
+Upstream: https://github.com/alsa-project/alsa-utils/commit/9e5e9a6d70de63bea01f0669b01319952f2cfdea
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ alsaucm/dump.c | 22 ++++++++++++----------
+ 1 file changed, 12 insertions(+), 10 deletions(-)
+
+diff --git a/alsaucm/dump.c b/alsaucm/dump.c
+index 102ac4d..a5c57f2 100644
+--- a/alsaucm/dump.c
++++ b/alsaucm/dump.c
+@@ -93,7 +93,8 @@ static char *tesc(const char *s, char *buf, size_t buf_len)
+ 
+ #define ESC(s, esc) tesc((s), (esc), sizeof(esc))
+ 
+-static int text_verb_start(struct renderer *, const char *verb, const char *comment)
++static int text_verb_start(struct renderer *r ATTRIBUTE_UNUSED,
++			   const char *verb, const char *comment)
+ {
+ 	char buf1[128], buf2[128];
+ 	printf("Verb.%s {\n", ESC(verb, buf1));
+@@ -102,13 +103,13 @@ static int text_verb_start(struct renderer *, const char *verb, const char *comm
+ 	return 0;
+ }
+ 
+-static int text_verb_end(struct renderer *)
++static int text_verb_end(struct renderer *r ATTRIBUTE_UNUSED)
+ {
+ 	printf("}\n");
+ 	return 0;
+ }
+ 
+-static int text_2nd_level_begin(struct renderer *,
++static int text_2nd_level_begin(struct renderer *r ATTRIBUTE_UNUSED,
+ 				const char *key,
+ 				const char *val,
+ 				const char *comment)
+@@ -120,19 +121,19 @@ static int text_2nd_level_begin(struct renderer *,
+ 	return 0;
+ }
+ 
+-static int text_2nd_level_end(struct renderer *)
++static int text_2nd_level_end(struct renderer *r ATTRIBUTE_UNUSED)
+ {
+ 	printf("\t}\n");
+ 	return 0;
+ }
+ 
+-static int text_2nd_level(struct renderer *, const char *txt)
++static int text_2nd_level(struct renderer *r ATTRIBUTE_UNUSED, const char *txt)
+ {
+ 	printf("\t\t%s", txt);
+ 	return 0;
+ }
+ 
+-static int text_3rd_level(struct renderer *, const char *txt)
++static int text_3rd_level(struct renderer *r ATTRIBUTE_UNUSED, const char *txt)
+ {
+ 	printf("\t\t\t%s", txt);
+ 	return 0;
+@@ -266,7 +267,7 @@ static void json_block(struct renderer *r, int level, int last)
+ 	j->block[level] = last ? 0 : 1;
+ }
+ 
+-static int json_init(struct renderer *)
++static int json_init(struct renderer *r ATTRIBUTE_UNUSED)
+ {
+ 	printf("{\n  \"Verbs\": {");
+ 	return 0;
+@@ -325,13 +326,13 @@ static int json_2nd_level_end(struct renderer *r)
+ 	return 0;
+ }
+ 
+-static int json_2nd_level(struct renderer *, const char *txt)
++static int json_2nd_level(struct renderer *r ATTRIBUTE_UNUSED, const char *txt)
+ {
+ 	printf("          %s", txt);
+ 	return 0;
+ }
+ 
+-static int json_3rd_level(struct renderer *, const char *txt)
++static int json_3rd_level(struct renderer *r ATTRIBUTE_UNUSED, const char *txt)
+ {
+ 	printf("            %s", txt);
+ 	return 0;
+@@ -360,7 +361,8 @@ static int json_supcon_start(struct renderer *r, const char *key)
+ 	return 0;
+ }
+ 
+-static int json_supcon_value(struct renderer *r, const char *value, int)
++static int json_supcon_value(struct renderer *r, const char *value,
++			     int last ATTRIBUTE_UNUSED)
+ {
+ 	char buf[256];
+ 	JESC(value, buf);
+-- 
+2.39.2
+
diff --git a/package/alsa-utils/0008-topology-use-ATTRIBUTE_UNUSED-instead-remove-argumen.patch b/package/alsa-utils/0008-topology-use-ATTRIBUTE_UNUSED-instead-remove-argumen.patch
new file mode 100644
index 0000000000..07b10b3ab8
--- /dev/null
+++ b/package/alsa-utils/0008-topology-use-ATTRIBUTE_UNUSED-instead-remove-argumen.patch
@@ -0,0 +1,312 @@
+From dfe1c7143ab6ea01789e276b1ba361a00e545997 Mon Sep 17 00:00:00 2001
+From: Jaroslav Kysela <perex@perex.cz>
+Date: Mon, 4 Sep 2023 17:11:05 +0200
+Subject: [PATCH] topology: use ATTRIBUTE_UNUSED instead remove argument name
+
+We need to support older compilers than GCC 11.
+
+Link: https://github.com/alsa-project/alsa-utils/issues/233
+Fixes: 153d185 ("topology: fix the verbose compilation warnings for latest gcc")
+Signed-off-by: Jaroslav Kysela <perex@perex.cz>
+
+Upstream: https://github.com/alsa-project/alsa-utils/commit/dfe1c7143ab6ea01789e276b1ba361a00e545997
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ topology/nhlt/intel/dmic-nhlt.c       |  3 ++-
+ topology/nhlt/intel/dmic/dmic-debug.c |  7 ++++---
+ topology/nhlt/intel/ssp/ssp-debug.c   |  5 +++--
+ topology/nhlt/intel/ssp/ssp-process.c |  4 +++-
+ topology/nhlt/nhlt-processor.c        |  7 +++++--
+ topology/pre-process-class.c          | 10 +++++-----
+ topology/pre-process-object.c         | 21 +++++++++++----------
+ topology/pre-processor.c              | 10 ++++++----
+ 8 files changed, 39 insertions(+), 28 deletions(-)
+
+diff --git a/topology/nhlt/intel/dmic-nhlt.c b/topology/nhlt/intel/dmic-nhlt.c
+index 70a22e3..de659cf 100644
+--- a/topology/nhlt/intel/dmic-nhlt.c
++++ b/topology/nhlt/intel/dmic-nhlt.c
+@@ -10,6 +10,7 @@
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
++#include <alsa/global.h>
+ #include <alsa/input.h>
+ #include <alsa/output.h>
+ #include <alsa/conf.h>
+@@ -155,7 +156,7 @@ static int set_vendor_mic_data(struct intel_nhlt_params *nhlt, snd_config_t *cfg
+ 				   horizontal_angle_end);
+ }
+ 
+-static int set_bytes_data(struct intel_nhlt_params *, snd_config_t *cfg)
++static int set_bytes_data(struct intel_nhlt_params *nhlt ATTRIBUTE_UNUSED, snd_config_t *cfg)
+ {
+ 	snd_config_iterator_t i, next;
+ 	snd_config_t *n;
+diff --git a/topology/nhlt/intel/dmic/dmic-debug.c b/topology/nhlt/intel/dmic/dmic-debug.c
+index f99d308..a977c93 100644
+--- a/topology/nhlt/intel/dmic/dmic-debug.c
++++ b/topology/nhlt/intel/dmic/dmic-debug.c
+@@ -8,6 +8,7 @@
+ #include "aconfig.h"
+ #include <stdio.h>
+ #include <stdint.h>
++#include <alsa/global.h>
+ #include "dmic-debug.h"
+ 
+ #ifdef NHLT_DEBUG
+@@ -181,7 +182,7 @@ void dmic_print_internal(struct intel_dmic_params *dmic)
+ }
+ 
+ #else /* NHLT_DEBUG */
+-void dmic_print_bytes_as_hex(uint8_t *, size_t) {}
+-void dmic_print_integers_as_hex(uint32_t *, size_t) {}
+-void dmic_print_internal(struct intel_dmic_params *) {}
++void dmic_print_bytes_as_hex(uint8_t *src ATTRIBUTE_UNUSED, size_t size ATTRIBUTE_UNUSED) {}
++void dmic_print_integers_as_hex(uint32_t *src ATTRIBUTE_UNUSED, size_t size ATTRIBUTE_UNUSED) {}
++void dmic_print_internal(struct intel_dmic_params *dmic ATTRIBUTE_UNUSED) {}
+ #endif
+diff --git a/topology/nhlt/intel/ssp/ssp-debug.c b/topology/nhlt/intel/ssp/ssp-debug.c
+index 8c64675..2d2f6b0 100644
+--- a/topology/nhlt/intel/ssp/ssp-debug.c
++++ b/topology/nhlt/intel/ssp/ssp-debug.c
+@@ -7,6 +7,7 @@
+ #include "aconfig.h"
+ #include <stdio.h>
+ #include <stdint.h>
++#include <alsa/global.h>
+ #include "ssp-debug.h"
+ #include "../intel-nhlt.h"
+ 
+@@ -252,6 +253,6 @@ void ssp_print_internal(struct intel_ssp_params *ssp)
+ }
+ 
+ #else /* NHLT_DEBUG */
+-void ssp_print_internal(struct intel_ssp_params *) {}
+-void ssp_print_calculated(struct intel_ssp_params *) {}
++void ssp_print_internal(struct intel_ssp_params *ssp ATTRIBUTE_UNUSED) {}
++void ssp_print_calculated(struct intel_ssp_params *ssp ATTRIBUTE_UNUSED) {}
+ #endif
+diff --git a/topology/nhlt/intel/ssp/ssp-process.c b/topology/nhlt/intel/ssp/ssp-process.c
+index 9cda5c3..17b88d2 100644
+--- a/topology/nhlt/intel/ssp/ssp-process.c
++++ b/topology/nhlt/intel/ssp/ssp-process.c
+@@ -14,6 +14,7 @@
+ #include <stdlib.h>
+ #include <string.h>
+ #include <stdbool.h>
++#include <alsa/global.h>
+ #include <alsa/input.h>
+ #include <alsa/output.h>
+ #include <alsa/conf.h>
+@@ -952,7 +953,8 @@ int ssp_set_params(struct intel_nhlt_params *nhlt, const char *dir, int dai_inde
+ 	return 0;
+ }
+ 
+-int ssp_hw_set_params(struct intel_nhlt_params *nhlt, const char *format, const char *,
++int ssp_hw_set_params(struct intel_nhlt_params *nhlt, const char *format,
++		      const char *mclk ATTRIBUTE_UNUSED,
+ 		      const char *bclk, const char *bclk_invert, const char *fsync,
+ 		      const char *fsync_invert, int mclk_freq, int bclk_freq, int fsync_freq,
+ 		      int tdm_slots, int tdm_slot_width, int tx_slots, int rx_slots)
+diff --git a/topology/nhlt/nhlt-processor.c b/topology/nhlt/nhlt-processor.c
+index 567fa5c..ca539c3 100644
+--- a/topology/nhlt/nhlt-processor.c
++++ b/topology/nhlt/nhlt-processor.c
+@@ -11,6 +11,7 @@
+ #include <string.h>
+ #include <stdbool.h>
+ #include <inttypes.h>
++#include <alsa/global.h>
+ #include <alsa/input.h>
+ #include <alsa/output.h>
+ #include <alsa/conf.h>
+@@ -87,7 +88,8 @@ static void debug_print_nhlt(struct nhlt *blob, struct endpoint_descriptor **eps
+ 	fprintf(stdout, "\n");
+ }
+ #else
+-static void debug_print_nhlt(struct nhlt *, struct endpoint_descriptor **) {}
++static void debug_print_nhlt(struct nhlt *blob ATTRIBUTE_UNUSED,
++			     struct endpoint_descriptor **eps ATTRIBUTE_UNUSED) {}
+ #endif
+ 
+ static int print_as_hex_bytes(uint8_t *manifest_buffer, uint32_t manifest_size,
+@@ -313,7 +315,8 @@ static int nhlt_get_flat_buffer(struct nhlt *blob, struct endpoint_descriptor **
+ }
+ 
+ /* called at the end of topology pre-processing, create flat buffer from variable size nhlt */
+-static int nhlt_create(struct intel_nhlt_params *nhlt, snd_config_t *input, snd_config_t *,
++static int nhlt_create(struct intel_nhlt_params *nhlt, snd_config_t *input,
++		       snd_config_t *output ATTRIBUTE_UNUSED,
+ 		       uint8_t **nhlt_buffer, uint32_t *nhlt_size)
+ {
+ 	struct endpoint_descriptor *eps[MAX_ENDPOINT_COUNT];
+diff --git a/topology/pre-process-class.c b/topology/pre-process-class.c
+index d883d05..bedcebe 100644
+--- a/topology/pre-process-class.c
++++ b/topology/pre-process-class.c
+@@ -127,7 +127,7 @@ snd_config_t *tplg_class_lookup(struct tplg_pre_processor *tplg_pp, snd_config_t
+ }
+ 
+ /* find the attribute config by name in the class definition */
+-snd_config_t *tplg_class_find_attribute_by_name(struct tplg_pre_processor *,
++snd_config_t *tplg_class_find_attribute_by_name(struct tplg_pre_processor *tplg_p ATTRIBUTE_UNUSED,
+ 						snd_config_t *class, const char *name)
+ {
+ 	snd_config_t *attr = NULL;
+@@ -152,7 +152,7 @@ snd_config_t *tplg_class_find_attribute_by_name(struct tplg_pre_processor *,
+ }
+ 
+ /* get the name of the attribute that must have a unique value in the object instance */
+-const char *tplg_class_get_unique_attribute_name(struct tplg_pre_processor *,
++const char *tplg_class_get_unique_attribute_name(struct tplg_pre_processor *tplg_pp ATTRIBUTE_UNUSED,
+ 						 snd_config_t *class)
+ {
+ 	snd_config_t *unique;
+@@ -177,7 +177,7 @@ const char *tplg_class_get_unique_attribute_name(struct tplg_pre_processor *,
+ }
+ 
+ /* get attribute type from the definition */
+-snd_config_type_t tplg_class_get_attribute_type(struct tplg_pre_processor *,
++snd_config_type_t tplg_class_get_attribute_type(struct tplg_pre_processor *tplg_pp ATTRIBUTE_UNUSED,
+ 						snd_config_t *attr)
+ {
+ 	snd_config_t *type;
+@@ -208,7 +208,7 @@ snd_config_type_t tplg_class_get_attribute_type(struct tplg_pre_processor *,
+ }
+ 
+ /* get token_ref for attribute with name attr_name in the class */
+-const char *tplg_class_get_attribute_token_ref(struct tplg_pre_processor *,
++const char *tplg_class_get_attribute_token_ref(struct tplg_pre_processor *tplg_pp ATTRIBUTE_UNUSED,
+ 					       snd_config_t *class, const char *attr_name)
+ {
+ 	snd_config_t *attributes, *attr, *token_ref;
+@@ -235,7 +235,7 @@ const char *tplg_class_get_attribute_token_ref(struct tplg_pre_processor *,
+ }
+ 
+ /* convert a valid attribute string value to the corresponding tuple value */
+-long tplg_class_attribute_valid_tuple_value(struct tplg_pre_processor *,
++long tplg_class_attribute_valid_tuple_value(struct tplg_pre_processor *tplg_pp ATTRIBUTE_UNUSED,
+ 					    snd_config_t *class, snd_config_t *attr)
+ {
+ 
+diff --git a/topology/pre-process-object.c b/topology/pre-process-object.c
+index 48555e7..61cc85f 100644
+--- a/topology/pre-process-object.c
++++ b/topology/pre-process-object.c
+@@ -31,7 +31,8 @@
+ 
+ /* Parse VendorToken object, create the "SectionVendorToken" and save it */
+ int tplg_build_vendor_token_object(struct tplg_pre_processor *tplg_pp,
+-				   snd_config_t *obj_cfg, snd_config_t *)
++				   snd_config_t *obj_cfg,
++				   snd_config_t *parent ATTRIBUTE_UNUSED)
+ {
+ 	snd_config_iterator_t i, next;
+ 	snd_config_t *vtop, *n, *obj;
+@@ -196,7 +197,7 @@ int tplg_build_data_object(struct tplg_pre_processor *tplg_pp, snd_config_t *obj
+ 	return tplg_parent_update(tplg_pp, parent, "data", name);
+ }
+ 
+-static int tplg_create_config_template(struct tplg_pre_processor *,
++static int tplg_create_config_template(struct tplg_pre_processor *tplg_pp ATTRIBUTE_UNUSED,
+ 				       snd_config_t **template,
+ 				       const struct config_template_items *items)
+ {
+@@ -499,7 +500,7 @@ min_max_check:
+ }
+ 
+ /* get object's name attribute value */
+-const char *tplg_object_get_name(struct tplg_pre_processor *,
++const char *tplg_object_get_name(struct tplg_pre_processor *tplg_pp ATTRIBUTE_UNUSED,
+ 				 snd_config_t *object)
+ {
+ 	snd_config_t *cfg;
+@@ -518,7 +519,7 @@ const char *tplg_object_get_name(struct tplg_pre_processor *,
+ }
+ 
+ /* look up the instance of object in a config */
+-static snd_config_t *tplg_object_lookup_in_config(struct tplg_pre_processor *,
++static snd_config_t *tplg_object_lookup_in_config(struct tplg_pre_processor *tplg_pp ATTRIBUTE_UNUSED,
+ 						  snd_config_t *class, const char *type,
+ 						  const char *class_name, const char *id)
+ {
+@@ -977,7 +978,7 @@ template:
+ }
+ 
+ static int tplg_build_generic_object(struct tplg_pre_processor *tplg_pp, snd_config_t *obj_cfg,
+-				     snd_config_t *)
++				     snd_config_t *parent ATTRIBUTE_UNUSED)
+ {
+ 	snd_config_t *wtop;
+ 	const char *name;
+@@ -1090,7 +1091,7 @@ const struct build_function_map object_build_map[] = {
+ 	 NULL, &pcm_caps_config},
+ };
+ 
+-static const struct build_function_map *tplg_object_get_map(struct tplg_pre_processor *,
++static const struct build_function_map *tplg_object_get_map(struct tplg_pre_processor *tplg_pp ATTRIBUTE_UNUSED,
+ 							    snd_config_t *obj)
+ {
+ 	snd_config_iterator_t first;
+@@ -1145,7 +1146,7 @@ snd_config_t *tplg_object_get_section(struct tplg_pre_processor *tplg_pp, snd_co
+ }
+ 
+ /* return 1 if attribute not found in search_config, 0 on success and negative value on error */
+-static int tplg_object_copy_and_add_param(struct tplg_pre_processor *,
++static int tplg_object_copy_and_add_param(struct tplg_pre_processor *tplg_pp ATTRIBUTE_UNUSED,
+ 					  snd_config_t *obj,
+ 					  snd_config_t *attr_cfg,
+ 					  snd_config_t *search_config)
+@@ -1351,8 +1352,8 @@ static int tplg_object_pre_process_children(struct tplg_pre_processor *tplg_pp,
+ 	return 0;
+ }
+ 
+-static int tplg_construct_object_name(struct tplg_pre_processor *, snd_config_t *obj,
+-				      snd_config_t *class_cfg)
++static int tplg_construct_object_name(struct tplg_pre_processor *tplg_pp ATTRIBUTE_UNUSED,
++				      snd_config_t *obj, snd_config_t *class_cfg)
+ {
+ 	snd_config_iterator_t i, next;
+ 	snd_config_t *args, *n;
+@@ -1547,7 +1548,7 @@ static int tplg_object_set_unique_attribute(struct tplg_pre_processor *tplg_pp,
+  * Helper function to get object instance config which is 2 nodes down from class_type config.
+  * ex: Get the pointer to the config node with ID "0" from the input config Widget.pga.0 {}
+  */
+-snd_config_t *tplg_object_get_instance_config(struct tplg_pre_processor *,
++snd_config_t *tplg_object_get_instance_config(struct tplg_pre_processor *tplg_pp ATTRIBUTE_UNUSED,
+ 					snd_config_t *class_type)
+ {
+ 	snd_config_iterator_t first;
+diff --git a/topology/pre-processor.c b/topology/pre-processor.c
+index 3903dee..01f8a5d 100644
+--- a/topology/pre-processor.c
++++ b/topology/pre-processor.c
+@@ -231,8 +231,9 @@ void tplg_pp_config_debug(struct tplg_pre_processor *tplg_pp, snd_config_t *cfg)
+ 	snd_config_save(cfg, tplg_pp->dbg_output);
+ }
+ #else
+-void tplg_pp_debug(char *, ...) {}
+-void tplg_pp_config_debug(struct tplg_pre_processor *, snd_config_t *){}
++void tplg_pp_debug(char *fmt ATTRIBUTE_UNUSED, ...) {}
++void tplg_pp_config_debug(struct tplg_pre_processor *tplg_pp ATTRIBUTE_UNUSED,
++			  snd_config_t *cfg ATTRIBUTE_UNUSED) {}
+ #endif
+ 
+ static int pre_process_config(struct tplg_pre_processor *tplg_pp, snd_config_t *cfg)
+@@ -640,8 +641,9 @@ static int pre_process_includes_all(struct tplg_pre_processor *tplg_pp, snd_conf
+ }
+ 
+ /* duplicate the existing objects in src into dest and update with new attribute */
+-static int pre_process_add_objects(struct tplg_pre_processor *, int *object_count,
+-				   snd_config_t *src, snd_config_t *dest, snd_config_t *attr_cfg)
++static int pre_process_add_objects(struct tplg_pre_processor *tplg_pp ATTRIBUTE_UNUSED,
++				   int *object_count, snd_config_t *src,
++				   snd_config_t *dest, snd_config_t *attr_cfg)
+ {
+ 	snd_config_iterator_t i, next;
+ 	int ret;
+-- 
+2.39.2
+
-- 
2.39.2


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot


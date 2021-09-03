Return-Path: <SRS0=/NXK=NZ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81929C433EF
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 19:18:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D98B060462
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 19:18:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D98B060462
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A5CC6407BA;
	Fri,  3 Sep 2021 19:18:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q1ou16zzRfa7; Fri,  3 Sep 2021 19:18:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97B8E4070E;
	Fri,  3 Sep 2021 19:18:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EBB311BF2F7
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 19:18:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E8CE483E75
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 19:18:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eKxAMctS_Mvf for <buildroot@lists.busybox.net>;
 Fri,  3 Sep 2021 19:18:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2645D83684
 for <buildroot@buildroot.org>; Fri,  3 Sep 2021 19:18:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 26FC988290; Fri,  3 Sep 2021 19:17:08 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Fri, 3 Sep 2021 20:53:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: de39a17f7173c82db358054752d3d65a41f0ca09
X-Git-Newrev: 4b437f57a4d3962198f5e98acf3cae6a522d5612
X-Patchwork-Hint: ignore
Message-Id: <20210903191708.26FC988290@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gstreamer1/gstreamer1-mm: fix
 build with libglib 2.68
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4b437f57a4d3962198f5e98acf3cae6a522d5612
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump of libglib2 to version
2.68.1 in commit c72524fb1b1c6b7dd1b1f511eea0fdf5a39dd3a0:

../gstreamer/gstreamermm/register.h: In function 'GType Gst::register_mm_type(const gchar*)':
/home/buildroot/autobuild/run/instance-2/output-1/host/bin/../arm-buildroot-linux-gnueabihf/sysroot/usr/include/glib-2.0/glib/gatomic.h:117:19: error: argument 2 of '__atomic_load' must not be a pointer to a 'volatile' type
  117 |     __atomic_load (gapg_temp_atomic, &gapg_temp_newval, __ATOMIC_SEQ_CST); \
      |     ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/1c75cdcc183642fd4c15d56825848b83f2ad11a5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-Fix-build-against-glib-2-68.patch         | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/package/gstreamer1/gstreamer1-mm/0001-Fix-build-against-glib-2-68.patch b/package/gstreamer1/gstreamer1-mm/0001-Fix-build-against-glib-2-68.patch
new file mode 100644
index 0000000000..3ffdbb9cbf
--- /dev/null
+++ b/package/gstreamer1/gstreamer1-mm/0001-Fix-build-against-glib-2-68.patch
@@ -0,0 +1,44 @@
+From 0c0b5f8cef3b1f0a06f56c34340e210e0f23d1b0 Mon Sep 17 00:00:00 2001
+From: Dominique Leuenberger <dimstar@opensuse.org>
+Date: Tue, 13 Jul 2021 10:32:30 +0000
+Subject: [PATCH] Fix build against glib 2.68
+
+volatile has been misused in the past
+
+[Retrieved from:
+https://gitlab.gnome.org/GNOME/gstreamermm/-/merge_requests/4]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ gstreamer/gstreamermm/register.h                    | 2 +-
+ tests/integration/test-integration-seekonstartup.cc | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/gstreamer/gstreamermm/register.h b/gstreamer/gstreamermm/register.h
+index db66d172..a7ab3a63 100644
+--- a/gstreamer/gstreamermm/register.h
++++ b/gstreamer/gstreamermm/register.h
+@@ -110,7 +110,7 @@ register_mm_type(const gchar * type_name)
+     /* The typedef for GType may be gulong or gsize, depending on the
+      * system and whether the compiler is c++ or not. The g_once_init_*
+      * functions always take a gsize * though ... */
+-    static volatile gsize gonce_data = 0;
++    static gsize gonce_data = 0;
+     if (g_once_init_enter (&gonce_data)) {
+         GTypeInfo info;
+ 
+diff --git a/tests/integration/test-integration-seekonstartup.cc b/tests/integration/test-integration-seekonstartup.cc
+index 247ac499..cd43a125 100644
+--- a/tests/integration/test-integration-seekonstartup.cc
++++ b/tests/integration/test-integration-seekonstartup.cc
+@@ -18,7 +18,7 @@ RefPtr<Glib::MainLoop> mainloop;
+ RefPtr<Bus> bus;
+ RefPtr<Pipeline> pipeline;
+ RefPtr<Pad> sink_pad;
+-static volatile gint counter;
++static gint counter;
+ bool prerolled = false;
+ gboolean was_check = 0;
+ 
+-- 
+GitLab
+
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

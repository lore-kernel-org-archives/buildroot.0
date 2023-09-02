Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D567DEC873F
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 15:45:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79B1B80DAB;
	Thu,  7 Sep 2023 15:45:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79B1B80DAB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SaUVOzlMWP9F; Thu,  7 Sep 2023 15:45:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEB2F83F22;
	Thu,  7 Sep 2023 15:45:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEB2F83F22
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 85DEA1BF313
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:54:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 13BA241E56
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13BA241E56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pY9DVjokjvVI for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2CC8741E6B
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CC8741E6B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 28D8B86A21; Thu,  7 Sep 2023 14:51:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 2 Sep 2023 18:00:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d8e9505922cf76ff498e6cd31dd7e543f9b0dc4b
X-Git-Newrev: 3fa1ae00681ca17fb709dcf1e281b8ee0ede0d5f
X-Patchwork-Hint: ignore
Message-Id: <20230907145135.28D8B86A21@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qemu: add option to enable tracing
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

commit: https://git.buildroot.net/buildroot/commit/?id=3fa1ae00681ca17fb709dcf1e281b8ee0ede0d5f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Tracing is a development feature for debugging, profiling, and observing
QEMU execution. It does not make sense to enable it by default, so add a
config to enable the "log" tracing backend (the default one). Options to
select other backends may be added in the future.

Also pull a patch already reviewed upstream to install the trace events
file only if necessary:

    https://patchwork.kernel.org/project/qemu-devel/patch/20230408010410.281263-1-casantos@redhat.com/

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...stall-trace-events-file-only-if-necessary.patch | 30 ++++++++++++++++++++++
 package/qemu/Config.in                             |  9 +++++++
 package/qemu/qemu.mk                               |  6 +++++
 3 files changed, 45 insertions(+)

diff --git a/package/qemu/0004-tracing-install-trace-events-file-only-if-necessary.patch b/package/qemu/0004-tracing-install-trace-events-file-only-if-necessary.patch
new file mode 100644
index 0000000000..36bdaa4978
--- /dev/null
+++ b/package/qemu/0004-tracing-install-trace-events-file-only-if-necessary.patch
@@ -0,0 +1,30 @@
+From 5c43da1e4983cc3c209b325a5228b6149e0a0ccf Mon Sep 17 00:00:00 2001
+From: Carlos Santos <casantos@redhat.com>
+Date: Fri, 24 Mar 2023 21:40:22 -0300
+Subject: [PATCH] tracing: install trace events file only if necessary
+
+It is not useful when configuring with --enable-trace-backends=nop.
+
+Upstream: https://patchwork.kernel.org/project/qemu-devel/patch/20230408010410.281263-1-casantos@redhat.com/
+Signed-off-by: Carlos Santos <casantos@redhat.com>
+Signed-off-by: Carlos Santos <unixmania@gmail.com>
+---
+ trace/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/trace/meson.build b/trace/meson.build
+index 8e80be895c..30b1d942eb 100644
+--- a/trace/meson.build
++++ b/trace/meson.build
+@@ -64,7 +64,7 @@ trace_events_all = custom_target('trace-events-all',
+                                  input: trace_events_files,
+                                  command: [ 'cat', '@INPUT@' ],
+                                  capture: true,
+-                                 install: true,
++                                 install: get_option('trace_backends') != [ 'nop' ],
+                                  install_dir: qemu_datadir)
+ 
+ if 'ust' in get_option('trace_backends')
+-- 
+2.31.1
+
diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 6fb34a0dae..8d53ced300 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -106,6 +106,15 @@ config BR2_PACKAGE_QEMU_FDT
 	  Say 'y' here to have QEMU capable of constructing Device
 	  Trees, and passing them to the VMs.
 
+config BR2_PACKAGE_QEMU_TRACING
+	bool "Enable tracing"
+	help
+	  Say 'y' to enable the "log" tracing infrastructure in QEMU,
+	  used for debugging, profiling, and observing execution. For
+	  detailed documentation, see
+
+	  https://www.qemu.org/docs/master/devel/tracing.html
+
 endif # BR2_PACKAGE_QEMU_SYSTEM
 
 comment "systems emulation needs a toolchain w/ dynamic library"
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 4d2135a3c6..87ecad5b52 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -160,6 +160,12 @@ else
 QEMU_OPTS += --disable-fdt
 endif
 
+ifeq ($(BR2_PACKAGE_QEMU_TRACING),y)
+QEMU_OPTS += --enable-trace-backends=log
+else
+QEMU_OPTS += --enable-trace-backends=nop
+endif
+
 ifeq ($(BR2_PACKAGE_QEMU_TOOLS),y)
 QEMU_OPTS += --enable-tools
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

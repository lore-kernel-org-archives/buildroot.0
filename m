Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE93C46CD2
	for <buildroot@archiver.kernel.org>; Sat,  6 Jan 2024 14:12:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AE4E60BAD;
	Sat,  6 Jan 2024 14:12:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AE4E60BAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xzHk1XOpTLJX; Sat,  6 Jan 2024 14:12:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F0EF60BA9;
	Sat,  6 Jan 2024 14:11:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F0EF60BA9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2D8D91BF863
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 14:11:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 081F183280
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 14:11:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 081F183280
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5OgXb3UquNFy for <buildroot@lists.busybox.net>;
 Sat,  6 Jan 2024 14:11:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A1A6831A5
 for <buildroot@buildroot.org>; Sat,  6 Jan 2024 14:11:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A1A6831A5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 15813846D1; Sat,  6 Jan 2024 14:11:32 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 6 Jan 2024 14:43:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b1dbd3f679e6660325472e3fdca72127d74e6929
X-Git-Newrev: 24f73b85f887122df8343346a106be144e6d814a
X-Patchwork-Hint: ignore
Message-Id: <20240106141132.15813846D1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-tools: add rtla
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

commit: https://git.buildroot.net/buildroot/commit/?id=24f73b85f887122df8343346a106be144e6d814a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The RealTime Linux Analysis tool includes a set of commands that relies
on the osnoise and timerlat tracers from the ftrace kernel subsystem,
allowing to analyze the lantency sources coming from the hardware and
the kernel itself.

This tool was introduced in v5.17 but until v5.19 it relied on libprocps
that has been deprecated soon. So let's make it available for v5.19+.
Rtla relies on libtracefs and libtraceevent, although libtraceevent itself
is already a dependency for libtracefs.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
[Giulio: fix install on recent Linux versions]
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Andreas: deal with Linux Fixups, musl, SSP]
Signed-off-by: Andreas Ziegler <br015@umbiko.net>
[yann.morin.1998@free.fr: reword and extend help text]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                |  2 ++
 package/linux-tools/Config.in             | 21 +++++++++++++
 package/linux-tools/linux-tool-rtla.mk.in | 52 +++++++++++++++++++++++++++++++
 3 files changed, 75 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 86588b1adb..d7543247f2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1237,6 +1237,7 @@ F:	package/libnss/
 F:	package/libnvme/
 F:	package/libtraceevent/
 F:	package/libtracefs
+F:	package/linux-tools/linux-tool-rtla.mk.in
 F:	package/mali-driver/
 F:	package/minicom/
 F:	package/mongoose/
@@ -2136,6 +2137,7 @@ F:	package/timescaledb/
 N:	Maxime Chevallier <maxime.chevallier@bootlin.com>
 F:	package/libtraceevent/
 F:	package/libtracefs
+F:	package/linux-tools/linux-tool-rtla.mk.in
 
 N:	Michael Durrant <mdurrant@arcturusnetworks.com>
 F:	board/arcturus/
diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index 451b0eeff5..adfca4dbe3 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -102,6 +102,27 @@ config BR2_PACKAGE_LINUX_TOOLS_PERF_NEEDS_HOST_PYTHON3
 
 endif
 
+config BR2_PACKAGE_LINUX_TOOLS_RTLA
+	bool "rtla"
+	select BR2_PACKAGE_LINUX_TOOLS
+	select BR2_PACKAGE_LIBTRACEFS
+	help
+	  These tracers allow performing latency analysis, for which the
+	  rtla tool provides wrapper commands to visualize and extract
+	  latency traces and reports.
+
+	  rtla includes three tracers, which have been introduced in
+	  different kernel versions:
+	    - Linux 5.19 introduced the osnoise and timerlat tracers,
+	    - Linux 6.3 introduced the hwnoise tracer
+
+	  osnoise and timerlat are always installed, while hwnoise is
+	  installed if your kernel is recent enough.
+
+	  Note: rtla in kernels before 5.19 had additional dependencies,
+	  not available in Buildroot, so only rtla in kernels 5.19
+	  onwards is actually supported in Buildroot.
+
 config BR2_PACKAGE_LINUX_TOOLS_SELFTESTS
 	bool"selftests"
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
diff --git a/package/linux-tools/linux-tool-rtla.mk.in b/package/linux-tools/linux-tool-rtla.mk.in
new file mode 100644
index 0000000000..449371ddfe
--- /dev/null
+++ b/package/linux-tools/linux-tool-rtla.mk.in
@@ -0,0 +1,52 @@
+################################################################################
+#
+# rtla
+#
+################################################################################
+
+LINUX_TOOLS += rtla
+
+RTLA_DEPENDENCIES = host-pkgconf libtracefs
+RTLA_MAKE_OPTS = $(LINUX_MAKE_FLAGS) \
+	CC=$(TARGET_CC) \
+	EXTRA_CFLAGS="-D_GNU_SOURCE" \
+	LDFLAGS="$(TARGET_LDFLAGS)" \
+	PKG_CONFIG_PATH=$(STAGING_DIR)/usr/lib/pkgconfig
+
+ifeq ($(BR2_TOOLCHAIN_HAS_SSP),)
+define RTLA_DISABLE_STACK_PROTECTOR
+	$(SED) 's/-fstack-protector.* //' $(LINUX_DIR)/tools/tracing/rtla/Makefile
+endef
+endif
+
+define RTLA_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_FTRACE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_TIMERLAT_TRACER)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_HIST_TRIGGERS)
+endef
+
+define RTLA_BUILD_CMDS
+	$(Q)if ! grep install $(LINUX_DIR)/tools/tracing/rtla/Makefile >/dev/null 2>&1 ; then \
+		echo "Your kernel version is too old and does not implement the rtla tool." ; \
+		echo "At least kernel 5.19 must be used." ; \
+		exit 1 ; \
+	fi
+	$(RTLA_DISABLE_STACK_PROTECTOR)
+	$(TARGET_MAKE_ENV) $(MAKE) $(RTLA_MAKE_OPTS) \
+		-C $(LINUX_DIR)/tools/tracing rtla
+endef
+
+# make rtla_install build and install by default documentation using rst2man
+# but it's not available in Buildroot and we don't want manual files in target
+# folder so let's simply install the resulting rtla binary and create symlinks
+# like Linux does in its tools/tracing/rtla/Makefile
+define RTLA_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(LINUX_DIR)/tools/tracing/rtla/rtla $(TARGET_DIR)/usr/bin
+	ln -sf rtla $(TARGET_DIR)/usr/bin/osnoise
+	ln -sf rtla $(TARGET_DIR)/usr/bin/timerlat
+
+	# Check if hwnoise is provided or not
+	if grep -q hwnoise $(LINUX_DIR)/tools/tracing/rtla/Makefile; then \
+		ln -sf rtla $(TARGET_DIR)/usr/bin/hwnoise ; \
+	fi
+endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

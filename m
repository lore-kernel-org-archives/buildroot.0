Return-Path: <SRS0=nMnf=MU=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76054C4338F
	for <buildroot@archiver.kernel.org>; Wed, 28 Jul 2021 20:19:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 161F66054F
	for <buildroot@archiver.kernel.org>; Wed, 28 Jul 2021 20:19:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 161F66054F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CEF904011A;
	Wed, 28 Jul 2021 20:19:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sY0bY18dDRkh; Wed, 28 Jul 2021 20:19:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB2D740160;
	Wed, 28 Jul 2021 20:19:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CB6E11BF2AF
 for <buildroot@lists.busybox.net>; Wed, 28 Jul 2021 20:19:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C6B8F40160
 for <buildroot@lists.busybox.net>; Wed, 28 Jul 2021 20:19:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cv3Geqt5NqJt for <buildroot@lists.busybox.net>;
 Wed, 28 Jul 2021 20:18:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C42F44011A
 for <buildroot@buildroot.org>; Wed, 28 Jul 2021 20:18:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 544A78912C; Wed, 28 Jul 2021 19:44:13 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 28 Jul 2021 22:18:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 14296940be1c5f7c999530e058c5563b0a94ce22
X-Git-Newrev: d41d79656849d0a495db461272f691c8b6a916b9
X-Patchwork-Hint: ignore
Message-Id: <20210728194413.544A78912C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-tools: add support for
 bpftool
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=d41d79656849d0a495db461272f691c8b6a916b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This tool is available to be compiled since kernel 4.15.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-tools/Config.in                | 22 +++++++++++++++++
 package/linux-tools/linux-tool-bpftool.mk.in | 37 ++++++++++++++++++++++++++++
 2 files changed, 59 insertions(+)

diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index ceb58c668a..2287ef5888 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -5,6 +5,28 @@ menu "Linux Kernel Tools"
 config BR2_PACKAGE_LINUX_TOOLS
 	bool
 
+config BR2_PACKAGE_LINUX_TOOLS_BPFTOOL
+	bool "bpftool"
+	depends on !BR2_nios2 # binutils
+	depends on BR2_USE_WCHAR # binutils, elfutils
+	depends on !BR2_STATIC_LIBS # elfutils
+	depends on BR2_TOOLCHAIN_HAS_THREADS # elfutils
+	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
+	select BR2_PACKAGE_LINUX_TOOLS
+	select BR2_PACKAGE_BINUTILS
+	select BR2_PACKAGE_ELFUTILS
+	help
+	  bpftool is a tool for for inspection and simple manipulation
+	  of eBPF programs and maps.
+
+	  These tools are available only from kernel version 4.15.
+
+comment "bpftool needs a uClibc or glibc toolchain w/ wchar, dynamic library, threads"
+	depends on !BR2_nios2
+	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS \
+		|| !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
+
 config BR2_PACKAGE_LINUX_TOOLS_CPUPOWER
 	bool "cpupower"
 	select BR2_PACKAGE_LINUX_TOOLS
diff --git a/package/linux-tools/linux-tool-bpftool.mk.in b/package/linux-tools/linux-tool-bpftool.mk.in
new file mode 100644
index 0000000000..0c4d3693a3
--- /dev/null
+++ b/package/linux-tools/linux-tool-bpftool.mk.in
@@ -0,0 +1,37 @@
+################################################################################
+#
+# bpftool
+#
+################################################################################
+
+LINUX_TOOLS += bpftool
+
+BPFTOOL_DEPENDENCIES = binutils elfutils
+
+ifeq ($(BR2_PACKAGE_LIBCAP),y)
+BPFTOOL_DEPENDENCIES += libcap
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+BPFTOOL_DEPENDENCIES += zlib
+endif
+
+BPFTOOL_MAKE_OPTS = $(LINUX_MAKE_FLAGS)
+
+define BPFTOOL_BUILD_CMDS
+	$(Q)if ! grep install $(LINUX_DIR)/tools/bpf/bpftool/Makefile >/dev/null 2>&1 ; then \
+		echo "Your kernel version is too old and does not have install section in the bpf tools." ; \
+		echo "At least kernel 4.15 must be used." ; \
+		exit 1 ; \
+	fi
+
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(LINUX_DIR)/tools/bpf/bpftool \
+		$(BPFTOOL_MAKE_OPTS)
+endef
+
+define BPFTOOL_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(LINUX_DIR)/tools/bpf/bpftool \
+		$(BPFTOOL_MAKE_OPTS) \
+		DESTDIR=$(TARGET_DIR) \
+		install
+endef
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

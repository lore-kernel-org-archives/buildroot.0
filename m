Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F174EE7DEE3
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 14:28:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5A5F40B56;
	Mon,  2 Feb 2026 14:28:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2-_dQIU1QPK1; Mon,  2 Feb 2026 14:28:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 892AD40B5D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770042515;
	bh=kKICxjb5zFFbBM9+1Jh+VRIahyD2T3eLPldao8Rzqdg=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=jiEPC7ZAM7BCUej9KPvi6dPKj9LoO2DgUNfA9I3Ghl49HnY1lbfQae5lahEmIU/jp
	 Il/PJCvNarBDd064n6+wiDvq6A2XOdHZ3VD9k0btc1SlrU4BE/egriNop/OSL8gDDh
	 5m7Owy6mvT4aYqS17L444RW11b/uR3LAAZyDI3zgknu4T/uf89oHb5wxxfvnZcb3t5
	 PkyVeqy2daiOM/IPGxLIet53bQSqeQgdUl3O7bZZXd1+40sa13mPS2wjx3wQTtCYZQ
	 3C3ejQcREuQ6AlXr/PLwaqO18YfzETHsWVDbPJfHCAA/se6zy15V++9GMBgbxULKE6
	 RHolyeTpLb0jQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 892AD40B5D;
	Mon,  2 Feb 2026 14:28:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D5DD23E
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 14:28:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8122E820E1
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 14:28:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KCLY1xFvexGu for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 14:28:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=23.90.104.147;
 helo=esa2.hc555-34.eu.iphmx.com; envelope-from=jimmy.wesolowski@mobileye.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0ADF0821D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0ADF0821D3
Received: from esa2.hc555-34.eu.iphmx.com (esa2.hc555-34.eu.iphmx.com
 [23.90.104.147])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0ADF0821D3
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 14:28:31 +0000 (UTC)
X-CSE-ConnectionGUID: TL4L6ZkySA6yCatJ21Me4g==
X-CSE-MsgGUID: z+BrS/imSay7Ail9VPls3Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces03_data.me-corp.lan) ([146.255.191.134])
 by esa2.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 16:28:30 +0200
X-CSE-ConnectionGUID: 2RRY39gPS8q1ZK9X+JArQg==
X-CSE-MsgGUID: QwFVBU3DT02TsY+/idaWhw==
Received: from unknown (HELO epgd074.me-corp.lan) ([10.154.54.2])
 by ces03_data.me-corp.lan with SMTP; 02 Feb 2026 16:30:35 +0200
Received: by epgd074.me-corp.lan (sSMTP sendmail emulation);
 Mon, 02 Feb 2026 16:28:28 +0200
To: buildroot@buildroot.org
Cc: guenther.harrasser@mobileye.com,
 Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
Date: Mon,  2 Feb 2026 16:28:24 +0200
Message-ID: <20260202142825.2804939-1-jimmy.wesolowski@mobileye.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
 t=1770042512; x=1801578512;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=edZA8N8HSOGrGsJChP8JhWiYoZqcq06ysKnbDWpnf6w=;
 b=nZmx34BwZteI8ffRiPVqZedIK5RgApn0YK8QPlvuNtcyLwRxsju5qQ0i
 doIkcbKosM6kLJWG1iCRnvOihrE7pm8Ml77vTJHTY7I97szVDXquoc4G7
 5MfG6RYyZZwxGaew25Fp8clFy2ySnNfsieRmgMoEI490gb2kIcYHZ2PEs
 zIAjJhE0zCsyVAWHPQV3PcCB6x3Jlj0Wq1RyraiYGSb6A+NoIv72pwHXQ
 BdhNsniL85dEDtdaZYuiovr++IVm9cYTJq6woX5Bg0YShjPAhgBXZk+On
 fLl9k3HGTrvqe7g5S/cT5MTRMFnhv7l7N6HNQRwx48weiXVXoeFT5MW1c
 g==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mobileye.com
Subject: [Buildroot] [PATCH 1/2] support/pkg-log: add support log each
 package step
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
From: Jimmy Durand Wesolowski via buildroot <buildroot@buildroot.org>
Reply-To: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This adds the support to log the steps performed by a package in
individual log files. The logs are saved in the package build folder,
under the names .$(STEP).log.

When enabled, this defines target-specific variables on the different
.stamp_* targets:
- LOGFILE set to the name of the logging file path
- .SHELLFLAGS empty
- SHELL set to support/scripts/pkg-log, the script that performs the
  redirection of the commands standard and error outputs.

Signed-off-by: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
---
 Config.in               | 44 +++++++++++++++++++++++++++++++++++++++++
 package/pkg-generic.mk  | 37 ++++++++++++++++++++++++++++++++++
 package/pkg-kconfig.mk  | 10 ++++++++++
 support/scripts/pkg-log | 38 +++++++++++++++++++++++++++++++++++
 4 files changed, 129 insertions(+)
 create mode 100755 support/scripts/pkg-log

diff --git a/Config.in b/Config.in
index d730f2034b..1e33bb8a37 100644
--- a/Config.in
+++ b/Config.in
@@ -805,6 +805,50 @@ config BR2_PER_PACKAGE_DIRECTORIES
 	  This is labeled as an experimental feature, as not all
 	  packages behave properly with per-package directories.
 
+config BR2_PER_PACKAGE_LOGGING
+	bool "Use per-package logging (experimental)"
+	help
+	  This option will redirect both outputs of the commands executed
+	  in the different package steps (download, extract, patch,
+	  configure, build, ...). This however does not affect the
+	  operations Buildroot is performing outside of the package "CMDS"
+	  commands.
+
+	  The package logs are saved in the package "build" directory
+	  as .{step}.log.
+	  For example, host-tar build logs would be in
+	  build/host-tar/.build.log
+	  its configure logs would be in
+	  build/host-tar/.configure.log
+	  its host installation logs in
+	  build/host-tar/.host-install.log
+	  and so on.
+
+	  Important note: The content to the log file is appended, so
+	  if you rebuild packages often, the log files may become very
+	  large.
+
+	  This allows retrieving the logs for a given package that would
+	  normally be mixed if the --output-sync is not set to target.
+
+	  This is labeled as an experimental feature, as it is running a
+	  wrapper "pkg-log" instead of /bin/sh before calling the real
+	  call to the shell is done, which can have unexpected
+	  consequences on some packages.
+
+if BR2_PER_PACKAGE_LOGGING
+config BR2_PER_PACKAGE_LOGGING_FULL
+	bool "Do not output on the console"
+	help
+	  This option will disable the stdout and stderr of the commands
+	  and only storing them in log files.
+
+	  By default, logging per package preserves the output to the
+	  console and use tee to also store it in log files. This allows
+	  having the output limited to the Buildroot ">>>" messages.
+
+	  Note that this implies a quiet build, enabling "make -s".
+endif
 endmenu
 
 config BR2_TIME_BITS_64
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index dd440e4062..10e16511d2 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -420,6 +420,14 @@ define pkg-graph-depends
 		$$(GRAPHS_DIR)/$$(@).dot
 endef
 
+ifeq ($(BR2_PER_PACKAGE_LOGGING),y)
+  define logs_prev_run_delete
+	$(if $(findstring start,$(1)),rm --force $(@D)/.$(2).log)
+  endef # logs_prev_run_delete
+  GLOBAL_INSTRUMENTATION_HOOKS += logs_prev_run_delete
+endif # BR2_PER_PACKAGE_LOGGING=y
+
+
 ################################################################################
 # inner-generic-package -- generates the make targets needed to build a
 # generic package
@@ -843,6 +851,35 @@ $(2)_TARGET_SOURCE =		$$($(2)_DIR)/.stamp_downloaded
 $(2)_TARGET_ACTUAL_SOURCE =	$$($(2)_DIR)/.stamp_actual_downloaded
 $(2)_TARGET_DIRCLEAN =		$$($(2)_DIR)/.stamp_dircleaned
 
+ifeq ($(BR2_PER_PACKAGE_LOGGING),y)
+  ifeq ($(BR2_PER_PACKAGE_LOGGING_FULL),y)
+    export BR2_LOG_REDIRECT=1
+    # We do not want to redirect the Buildroot messages
+    export BR2_LOG_MESSAGE_FILTER = $(TERM_BOLD)>>>
+  else # BR2_PER_PACKAGE_LOGGING_FULL is not set
+    export BR2_LOG_REDIRECT=0
+  endif # BR2_PER_PACKAGE_LOGGING_FULL is not set
+
+  # Define the target-specific values for the per-package logging
+  # We do not want the SHELL and .SHELLFLAGS to be inherited by other Makefile
+  # to avoid changing Make behavior inside a package. The output will
+  # nevertheless be redirected by the "make" executing command.
+  $$($(2)_DIR)/.stamp_%:	private SHELL = $(TOPDIR)/support/scripts/pkg-log
+  $$($(2)_DIR)/.stamp_%:	private .SHELLFLAGS =
+
+  $$($(2)_DIR)/.stamp_target_installed:	export _BR2_LOGFILE = $$($(2)_DIR)/.target-install.log
+  $$($(2)_DIR)/.stamp_staging_installed: export _BR2_LOGFILE = $$($(2)_DIR)/.staging-install.log
+  $$($(2)_DIR)/.stamp_images_installed:	export _BR2_LOGFILE = $$($(2)_DIR)/.images-install.log
+  $$($(2)_DIR)/.stamp_host_installed:	export _BR2_LOGFILE = $$($(2)_DIR)/.host-install.log
+  $$($(2)_DIR)/.stamp_built:		export _BR2_LOGFILE = $$($(2)_DIR)/.build.log
+  $$($(2)_DIR)/.stamp_configured:	export _BR2_LOGFILE = $$($(2)_DIR)/.configure.log
+  $$($(2)_DIR)/.stamp_rsynced:		export _BR2_LOGFILE = $$($(2)_DIR)/.rsync.log
+  $$($(2)_DIR)/.stamp_patched:		export _BR2_LOGFILE = $$($(2)_DIR)/.patch.log
+  $$($(2)_DIR)/.stamp_extracted:	export _BR2_LOGFILE = $$($(2)_DIR)/.extract.log
+  $$($(2)_DIR)/.stamp_downloaded:	export _BR2_LOGFILE = $$($(2)_DIR)/.download.log
+  $$($(2)_DIR)/.stamp_actual_downloaded: export _BR2_LOGFILE = $$($(2)_DIR)/.actual-download.log
+endif # BR2_PER_PACKAGE_LOGGING=y
+
 # default extract command
 $(2)_EXTRACT_CMDS ?= \
 	$$(if $$($(2)_SOURCE),$$(INFLATE$$(suffix $$($(2)_SOURCE))) $$($(2)_DL_DIR)/$$($(2)_SOURCE) | \
diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index 8000de16c4..136fe6c490 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -183,6 +183,16 @@ $$($(2)_DIR)/.stamp_kconfig_fixup_done: PKG=$(2)
 $$($(2)_DIR)/.stamp_kconfig_fixup_done: $$($(2)_DIR)/$$($(2)_KCONFIG_STAMP_DOTCONFIG)
 	$$($(2)_FIXUP_DOT_CONFIG)
 
+ifeq ($(BR2_PER_PACKAGE_LOGGING),y)
+  # Define the target-specific values for the per-package logging
+  # As opposed to pkg-generic, we need here to pass this down to the following
+  # Make when "oldconfig" and alike are called
+  $$($(2)_DIR)/.stamp_%:	SHELL = $(TOPDIR)/support/scripts/pkg-log
+  $$($(2)_DIR)/.stamp_%:	.SHELLFLAGS =
+
+  $$($(2)_DIR)/.stamp_kconfig_fixup_done: export _BR2_LOGFILE = $$($(2)_DIR)/.kconfig-fixup.log
+endif # BR2_PER_PACKAGE_LOGGING
+
 # Before running configure, the configuration file should be present and fixed
 $$($(2)_TARGET_CONFIGURE): $$($(2)_DIR)/.stamp_kconfig_fixup_done
 
diff --git a/support/scripts/pkg-log b/support/scripts/pkg-log
new file mode 100755
index 0000000000..9ee988b6b0
--- /dev/null
+++ b/support/scripts/pkg-log
@@ -0,0 +1,38 @@
+#! /bin/bash
+
+
+set -e
+
+# If we do not have a logfile, just call the command
+if [ -z "${_BR2_LOGFILE+x}" ]
+then
+    sh -c "$*"
+else
+    mkdir --parent "$(dirname "${_BR2_LOGFILE}")"
+
+    FD1="$(readlink /proc/$$/fd/1)"
+
+    echo "$ $*" >> "${_BR2_LOGFILE}" 2>&1
+    # If we are piped use tee instead of redirecting since the output is required
+    # We also want to see the Buildroot messages in the console
+    if [[ ${BR2_LOG_REDIRECT} -ne 1 ]] || [[ "${FD1}" == *pipe:* ]] || [[ "$*" == *"${BR2_LOG_MESSAGE_FILTER}"* ]]
+    then
+	# Borrowed from https://community.unix.com/t/
+	# redirect-stdout-stderr-to-file-and-then-on-screen/373806/5
+	# and https://stackoverflow.com/a/692407
+	# Redirect the stdout/stderr to screen AND log file
+	FIFO_OUT="${TMPDIR:-/tmp}/$$-out"
+	FIFO_ERR="${TMPDIR:-/tmp}/$$-err"
+
+	mkfifo "${FIFO_OUT}" "${FIFO_ERR}"
+	trap 'rm --force "${FIFO_OUT}" "${FIFO_ERR}"' EXIT
+
+	# to merge stdout/stderr to log file AND screen
+	( exec tee --append "${_BR2_LOGFILE}" < "${FIFO_OUT}" ) &
+	( exec tee --append "${_BR2_LOGFILE}" < "${FIFO_ERR}" >&2 ) &
+
+	sh -c "$*" > "${FIFO_OUT}" 2> "${FIFO_ERR}"
+    else
+	sh -c "$*" >> "${_BR2_LOGFILE}" 2>&1
+    fi
+fi
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

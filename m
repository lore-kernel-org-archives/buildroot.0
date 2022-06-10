Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A588AC433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Jun 2022 16:55:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3092C42548;
	Fri, 10 Jun 2022 16:55:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RrTQSDMdbCSQ; Fri, 10 Jun 2022 16:55:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFB7F42540;
	Fri, 10 Jun 2022 16:55:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 141CD1BF358
 for <buildroot@lists.busybox.net>; Fri, 10 Jun 2022 16:54:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 10BF54031C
 for <buildroot@lists.busybox.net>; Fri, 10 Jun 2022 16:54:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linux.microsoft.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DVcvi-UGTV7j for <buildroot@lists.busybox.net>;
 Fri, 10 Jun 2022 16:54:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4AA6B401AD
 for <buildroot@buildroot.org>; Fri, 10 Jun 2022 16:54:57 +0000 (UTC)
Received: from pwmachine.lan (247.red-2-137-223.dynamicip.rima-tde.net
 [2.137.223.247])
 by linux.microsoft.com (Postfix) with ESMTPSA id 9FC3420BE6B3;
 Fri, 10 Jun 2022 09:54:55 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 9FC3420BE6B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1654880096;
 bh=KmrxTIvWEJ+6lwcEAu7f7XwEN9P35k//PfRqBQjfKEE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XaWhsqnYtVg4NXASY4WPMZAh+zLMwNJCoY9LFAyIuX6L7eN4Yv+EwgE70dmRMG16l
 sG123UttqvRbEeEkOelOwhZgMAdyQihI85AwthdBq6K8H/ED+uuTSg/x7F6PtgNzWG
 W8vVcC9LNmHzWBLsseE52V3rDXakZg7Y9XRMpfOU=
From: Francis Laniel <flaniel@linux.microsoft.com>
To: buildroot@buildroot.org
Date: Fri, 10 Jun 2022 17:54:41 +0100
Message-Id: <20220610165441.84812-2-flaniel@linux.microsoft.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220610165441.84812-1-flaniel@linux.microsoft.com>
References: <20220610165441.84812-1-flaniel@linux.microsoft.com>
MIME-Version: 1.0
Subject: [Buildroot] [RFC PATCH v1 1/1] package/libbpf: remove bpf.h in
 linux.mk
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
Cc: Francis Laniel <flaniel@linux.microsoft.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Removing bpf.h in host-libbpf leads to problems when building host-pahole [1].
So, we keep this file to build host-pahole and remove it before building the
kernel to avoid conflicts with kernel bpf.h.

Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>

[1] http://autobuild.buildroot.net/results/7b3f560a773791e00b8bb32f64c0d39749b809b1/build-end.log
---
 linux/linux.mk           | 23 +++++++++++++++++++++++
 package/libbpf/libbpf.mk | 21 ++++-----------------
 2 files changed, 27 insertions(+), 17 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 322ccabbd9..85a38fd3ee 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -122,6 +122,29 @@ endif
 
 ifeq ($(BR2_LINUX_KERNEL_NEEDS_HOST_PAHOLE),y)
 LINUX_DEPENDENCIES += host-pahole
+
+# To build host-pahole, we need to install host-libbpf.
+# Particularly, we need to use libbpf Makefile target install_uapi_headers to
+# install a particular header file.
+# But, this generates a conflict when building the kernel:
+# In file included from libbpf_internal.h:17:0, from strset.c:9:
+# relo_core.h:10:6: error: nested redefinition of 'enum bpf_core_relo_kind'
+# enum bpf_core_relo_kind {
+# ^~~~~~~~~~~~~~~~~~
+# relo_core.h:10:6: error: redeclaration of 'enum bpf_core_relo_kind'
+# In file included from libbpf_legacy.h:13:0,
+# 		from libbpf_internal.h:16,
+# 		from strset.c:9:
+# /home/francis/buildroot/output/host/include/linux/bpf.h:6497:6: note: originally defined here
+# enum bpf_core_relo_kind {
+# So, better to remove it now as we already built host-pahole.
+define LINUX_REMOVE_LIBBPF_HEADER
+	if [ -f $(HOST_DIR)/include/linux/bpf.h ]; then \
+		rm $(HOST_DIR)/include/linux/bpf.h; \
+	fi
+endef
+
+LINUX_PRE_BUILD_HOOKS += LINUX_REMOVE_LIBBPF_HEADER
 else
 define LINUX_FIXUP_CONFIG_PAHOLE_CHECK
 	if grep -q "^CONFIG_DEBUG_INFO_BTF=y" $(KCONFIG_DOT_CONFIG); then \
diff --git a/package/libbpf/libbpf.mk b/package/libbpf/libbpf.mk
index 987d1145f1..6fd69f2536 100644
--- a/package/libbpf/libbpf.mk
+++ b/package/libbpf/libbpf.mk
@@ -39,26 +39,13 @@ define LIBBPF_INSTALL_TARGET_CMDS
 		-C $(@D)/src install DESTDIR=$(TARGET_DIR)
 endef
 
-# We need to install_uapi_headers so we have btf.h to compile
-# host-pahole.
-# Nonetheless, this target adds bpf.h which generates a conflict when
-# building the kernel:
-# In file included from libbpf_internal.h:17:0, from strset.c:9:
-# relo_core.h:10:6: error: nested redefinition of 'enum bpf_core_relo_kind'
-# enum bpf_core_relo_kind {
-# ^~~~~~~~~~~~~~~~~~
-# relo_core.h:10:6: error: redeclaration of 'enum bpf_core_relo_kind'
-# In file included from libbpf_legacy.h:13:0,
-# 		from libbpf_internal.h:16,
-# 		from strset.c:9:
-# /home/francis/buildroot/output/host/include/linux/bpf.h:6497:6: note: originally defined here
-# enum bpf_core_relo_kind {
-# So, better to remove remove it now since we do not need it to build
-# host-pahole, the only user of host-libbpf.
+# We need to install_uapi_headers so we have btf.h to compile host-pahole.
+# Nonetheless, this target adds bpf.h which generates a conflict when building
+# the kernel.
+# So, if this file is present, it will be removed by linux.mk.
 define HOST_LIBBPF_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) \
 		-C $(@D)/src install install_uapi_headers DESTDIR=$(HOST_DIR)
-	rm $(HOST_DIR)/include/linux/bpf.h
 endef
 
 $(eval $(generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

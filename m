Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 727A6FCC9DC
	for <buildroot@archiver.kernel.org>; Tue, 10 Mar 2026 08:19:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A8D841D78;
	Tue, 10 Mar 2026 08:19:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UyU8vxJt3Tnr; Tue, 10 Mar 2026 08:19:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3443D41FCB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773130763;
	bh=A4mOHuShv67eO+6ufmYXBF8DxoAULUqtrbkCGfVXfOo=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QazVfQnUcJFjqEOt6pVjvmvH3pbbM4QZZ+tqzRAkJ4QFnyHXXlQTUnQa1628ZzGbQ
	 OU+yP1mMBVwr25fm1bitcN2vTRvAcyZDRiwcFXrbNrwqRQXgKYYBSFAHpKb6pDlAeY
	 toPTYV+3e97Acj5QY9xMywA9iMFk/jXPucjD7h1Bd3aQKxtoVO8iocc25iF1HF/2X6
	 4T1XZNY0CS6gwliVV8cfBQvembQstRDWIXtQaF50hmzS8H2A9RBlYFZfwiURK+fRGj
	 +PbRjuNw0IumR75y1p6SsNZuBBwB3jTo9TQTLvnH0e1Ga+wh59QbCHkRyhCdALUgAk
	 aMLkrueKbKg0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3443D41FCB;
	Tue, 10 Mar 2026 08:19:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 90EC635C
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 08:19:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 82A1A403D2
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 08:19:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 04FAj2rs20Qx for <buildroot@buildroot.org>;
 Tue, 10 Mar 2026 08:19:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=115.124.30.124;
 helo=out30-124.freemail.mail.aliyun.com;
 envelope-from=cp0613@linux.alibaba.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 685224037D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 685224037D
Received: from out30-124.freemail.mail.aliyun.com
 (out30-124.freemail.mail.aliyun.com [115.124.30.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 685224037D
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 08:19:12 +0000 (UTC)
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com
 fp:SMTPD_---0X-fQmPW_1773130747 cluster:ay36) by smtp.aliyun-inc.com;
 Tue, 10 Mar 2026 16:19:08 +0800
From: cp0613@linux.alibaba.com
To: buildroot@buildroot.org
Cc: ju.o@free.fr,
	Chen Pei <cp0613@linux.alibaba.com>
Date: Tue, 10 Mar 2026 16:18:49 +0800
Message-ID: <20260310081850.33001-2-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260310081850.33001-1-cp0613@linux.alibaba.com>
References: <20260310081850.33001-1-cp0613@linux.alibaba.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1773130749; h=From:To:Subject:Date:Message-ID:MIME-Version;
 bh=sfJLOeUvx1CoTIc+n/rvtLRjHK2FUjvwUmf6OPdCgvY=;
 b=xuHhNPz6TUZvxokWyCihL3Ef0mN3p/yurxZSAC8ogLfKVnElLruj4Dnl+Eu49S/auLAKmCSA92RiBCfTTk4IF4XOV66wcn2WmZ3XfkC6hKbrI6QXeuZ8o/O7Zw//+6AyNQw+g/Bq/1VzmzqYy8yX3SSHg7pUtC6f3YJRB5twHZY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linux.alibaba.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com
 header.a=rsa-sha256 header.s=default header.b=xuHhNPz6
Subject: [Buildroot] [PATCH v2 1/2] package/ndctl: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Chen Pei <cp0613@linux.alibaba.com>

A "device memory" enabling project encompassing tools and
libraries for CXL, NVDIMMs, DAX, memory tiering and other
platform memory device topics.

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---
 package/Config.in        |  1 +
 package/ndctl/Config.in  | 25 ++++++++++++++++++++
 package/ndctl/ndctl.hash |  7 ++++++
 package/ndctl/ndctl.mk   | 51 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 84 insertions(+)
 create mode 100644 package/ndctl/Config.in
 create mode 100644 package/ndctl/ndctl.hash
 create mode 100644 package/ndctl/ndctl.mk

diff --git a/package/Config.in b/package/Config.in
index fab482c52f..d56b882db5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2836,6 +2836,7 @@ menu "System tools"
 	source "package/monit/Config.in"
 	source "package/multipath-tools/Config.in"
 	source "package/ncdu/Config.in"
+	source "package/ndctl/Config.in"
 	source "package/nerdctl/Config.in"
 	source "package/netifrc/Config.in"
 	source "package/numactl/Config.in"
diff --git a/package/ndctl/Config.in b/package/ndctl/Config.in
new file mode 100644
index 0000000000..ef7cec6962
--- /dev/null
+++ b/package/ndctl/Config.in
@@ -0,0 +1,25 @@
+config BR2_PACKAGE_NDCTL
+	bool "ndctl"
+	depends on BR2_PACKAGE_HAS_UDEV
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_16
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU
+	select BR2_PACKAGE_INIPARSER
+	select BR2_PACKAGE_JSON_C
+	select BR2_PACKAGE_KEYUTILS
+	select BR2_PACKAGE_KMOD
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	help
+	  A "device memory" enabling project encompassing tools and
+	  libraries for CXL, NVDIMMs, DAX, memory tiering and other
+	  platform memory device topics.
+
+	  https://github.com/pmem/ndctl
+
+comment "ndctl needs udev /dev management, a toolchain headers >= 5.16"
+	depends on BR2_USE_MMU
+	depends on !BR2_PACKAGE_HAS_UDEV \
+		|| !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_16
diff --git a/package/ndctl/ndctl.hash b/package/ndctl/ndctl.hash
new file mode 100644
index 0000000000..f731fb7263
--- /dev/null
+++ b/package/ndctl/ndctl.hash
@@ -0,0 +1,7 @@
+# locally computed
+sha256  dd4b9b9a9dc0a15e980670b6f889e910a80ad60f2309e03bfd9cc6071d14dd30  ndctl-83.tar.gz
+sha256  1334f22048052d69647860fe9fb24997dc3b33737cb494297d68949f589fa1cf  COPYING
+sha256  5c37e41135091a39821cfb306ad8516625b0bb49510ce56ad85c347bbc46df29  LICENSES/other/CC0-1.0
+sha256  89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  LICENSES/other/MIT
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSES/preferred/GPL-2.0
+sha256  9397d01be0ec93d29384447ba18e532ab7b01af8c8b582ece9f10ad45b9568db  LICENSES/preferred/LGPL-2.1
diff --git a/package/ndctl/ndctl.mk b/package/ndctl/ndctl.mk
new file mode 100644
index 0000000000..2f631c946c
--- /dev/null
+++ b/package/ndctl/ndctl.mk
@@ -0,0 +1,51 @@
+################################################################################
+#
+# ndctl
+#
+################################################################################
+
+NDCTL_VERSION = 83
+NDCTL_SITE = $(call github,pmem,ndctl,v$(NDCTL_VERSION))
+NDCTL_LICENSE = \
+	CC0-1.0 (helper routines), \
+	GPL-2.0+ (tools), \
+	LGPL-2.1+ (libraries), \
+	MIT (helper routines)
+NDCTL_LICENSE_FILES = \
+	COPYING \
+	LICENSES/other/CC0-1.0 \
+	LICENSES/other/MIT \
+	LICENSES/preferred/GPL-2.0 \
+	LICENSES/preferred/LGPL-2.1
+
+NDCTL_DEPENDENCIES = \
+	iniparser \
+	json-c \
+	keyutils \
+	kmod \
+	udev \
+	util-linux-libs
+
+# Currently, disabling keyutils or fwctl support will cause builds to
+# fail. Therefore, always pass the -Dfwctl=enabled and -Dkeyutils=enabled.
+NDCTL_CONF_OPTS = \
+	-Ddocs=disabled \
+	-Dfwctl=enabled \
+	-Dkeyutils=enabled \
+	-Diniparserdir=$(STAGING_DIR)/usr/include/iniparser
+
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+NDCTL_CONF_OPTS += -Dsystemd=enabled
+NDCTL_DEPENDENCIES += systemd
+else
+NDCTL_CONF_OPTS += -Dsystemd=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_LIBTRACEFS)$(BR2_PACKAGE_LIBTRACEEVENT),yy)
+NDCTL_CONF_OPTS += -Dlibtracefs=enabled
+NDCTL_DEPENDENCIES += libtraceevent libtracefs
+else
+NDCTL_CONF_OPTS += -Dlibtracefs=disabled
+endif
+
+$(eval $(meson-package))
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

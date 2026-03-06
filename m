Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 066F7F513F3
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 03:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA8E660DD2;
	Fri,  6 Mar 2026 03:45:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kVwYnmlvaI6U; Fri,  6 Mar 2026 03:45:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C45F160DE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772768715;
	bh=LoMKpCQdasTnNM/qXMOU4CVibnrcPv/Qi0is1NioqyI=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GZZkmxtyC1BK0ug/ckqHyE3SU1kAHRKHC+zUHTuC13fzXwrdlk5J/CAkJdD5xg468
	 hHpkPPIo2whzsKQ+JCu4W7TNYilhO4ve3Rd+OgRasVN/67dFoiA2meYUNLgu1Aqa1d
	 fVZ/pmWeenaFp8KJmQGfH8pceWh1MuYDX2npTUkIpJsN7mB5kYv1BcfZ+oBcysHa6l
	 9OKYvXoh0TBtBCuQa89arEpzTGux63Q503ZQ0AGEEazKdGM2COcPL0UtEU8R0c51DR
	 FSZdd9XM/T978MpYyRroFZF3PDnmFH7I/2dKiLAESzqNNFmSGa71+ggw2GfenM4siD
	 lSp+T8siSqmCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C45F160DE8;
	Fri,  6 Mar 2026 03:45:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 92EE33D8
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 03:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7F37E40423
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 03:45:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HmQxrgGzdbuW for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 03:45:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=115.124.30.133;
 helo=out30-133.freemail.mail.aliyun.com;
 envelope-from=cp0613@linux.alibaba.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9B11440029
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B11440029
Received: from out30-133.freemail.mail.aliyun.com
 (out30-133.freemail.mail.aliyun.com [115.124.30.133])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9B11440029
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 03:45:02 +0000 (UTC)
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com
 fp:SMTPD_---0X-M-cQV_1772768697 cluster:ay36) by smtp.aliyun-inc.com;
 Fri, 06 Mar 2026 11:44:57 +0800
From: cp0613@linux.alibaba.com
To: buildroot@buildroot.org
Cc: ju.o@free.fr,
	Chen Pei <cp0613@linux.alibaba.com>
Date: Fri,  6 Mar 2026 11:44:15 +0800
Message-ID: <20260306034417.613-2-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306034417.613-1-cp0613@linux.alibaba.com>
References: <20260306034417.613-1-cp0613@linux.alibaba.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1772768698; h=From:To:Subject:Date:Message-ID:MIME-Version;
 bh=gQa65JYeb33O0JEiFwAGz7cz2z18orpkB+E054dbl5E=;
 b=au6U7Gyu4SwqpahjteHiSMscMVMXFRpIEBznt0V1vkxA75J7pi2gtmKJzXGopXTJNtv/e06HWupVLa6LG0OYgCwXPRx20DFsAh4gV+/tjIrKV8xSqGBWnbuA51xSil+6SgJnKtnXkp+EWiv4692DcfOCKIF+c8nwDiitS9pjD4I=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linux.alibaba.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com
 header.a=rsa-sha256 header.s=default header.b=au6U7Gyu
Subject: [Buildroot] [PATCH 1/2] package/ndctl: new package
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
 package/ndctl/Config.in  | 21 +++++++++++++++++++++
 package/ndctl/ndctl.hash |  3 +++
 package/ndctl/ndctl.mk   | 34 ++++++++++++++++++++++++++++++++++
 4 files changed, 59 insertions(+)
 create mode 100644 package/ndctl/Config.in
 create mode 100644 package/ndctl/ndctl.hash
 create mode 100644 package/ndctl/ndctl.mk

diff --git a/package/Config.in b/package/Config.in
index d1dce9c4d7..ec657d5441 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2867,6 +2867,7 @@ menu "System tools"
 	source "package/monit/Config.in"
 	source "package/multipath-tools/Config.in"
 	source "package/ncdu/Config.in"
+	source "package/ndctl/Config.in"
 	source "package/nerdctl/Config.in"
 	source "package/netifrc/Config.in"
 	source "package/numactl/Config.in"
diff --git a/package/ndctl/Config.in b/package/ndctl/Config.in
new file mode 100644
index 0000000000..841e9981b8
--- /dev/null
+++ b/package/ndctl/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_NDCTL
+	bool "ndctl"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU
+	depends on BR2_LINUX_KERNEL
+	depends on BR2_PACKAGE_HAS_UDEV
+	select BR2_PACKAGE_KMOD
+	select BR2_PACKAGE_JSON_C
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_PACKAGE_LIBTRACEEVENT
+	select BR2_PACKAGE_LIBTRACEFS
+	select BR2_PACKAGE_KEYUTILS
+	select BR2_PACKAGE_INIPARSER
+	help
+	  A "device memory" enabling project encompassing tools and
+	  libraries for CXL, NVDIMMs, DAX, memory tiering and other
+	  platform memory device topics.
+
+	  https://github.com/pmem/ndctl
diff --git a/package/ndctl/ndctl.hash b/package/ndctl/ndctl.hash
new file mode 100644
index 0000000000..a04f0cfa10
--- /dev/null
+++ b/package/ndctl/ndctl.hash
@@ -0,0 +1,3 @@
+# locally computed
+sha256  dd4b9b9a9dc0a15e980670b6f889e910a80ad60f2309e03bfd9cc6071d14dd30  ndctl-83.tar.gz
+sha256  1334f22048052d69647860fe9fb24997dc3b33737cb494297d68949f589fa1cf  COPYING
diff --git a/package/ndctl/ndctl.mk b/package/ndctl/ndctl.mk
new file mode 100644
index 0000000000..5c8ed86da7
--- /dev/null
+++ b/package/ndctl/ndctl.mk
@@ -0,0 +1,34 @@
+################################################################################
+#
+# ndctl
+#
+################################################################################
+
+NDCTL_VERSION = 83
+NDCTL_SITE = $(call github,pmem,ndctl,v$(NDCTL_VERSION))
+NDCTL_LICENSE = LGPL-2.1+, GPL-2.0+
+NDCTL_LICENSE_FILES = COPYING
+
+NDCTL_DEPENDENCIES = \
+	host-meson \
+	host-ninja \
+	util-linux-libs \
+	kmod \
+	json-c \
+	libtraceevent \
+	libtracefs \
+	keyutils \
+	iniparser
+
+NDCTL_CONF_OPTS = \
+	-Ddocs=disabled \
+	-Diniparserdir=$(TARGET_DIR)/usr/include/iniparser
+
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+NDCTL_CONF_OPTS += -Dsystemd=enabled
+NDCTL_DEPENDENCIES += systemd
+else
+NDCTL_CONF_OPTS += -Dsystemd=disabled
+endif
+
+$(eval $(meson-package))
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

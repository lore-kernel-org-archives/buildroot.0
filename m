Return-Path: <SRS0=K+5a=O6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85FEAC433F5
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 23:47:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E593603E9
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 23:47:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1E593603E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9CE9403A5;
	Sun, 10 Oct 2021 23:47:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KBR8fUr9sHL5; Sun, 10 Oct 2021 23:47:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1ECF2403A2;
	Sun, 10 Oct 2021 23:47:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EA75E1BF3E8
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 23:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D97D8403A2
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 23:47:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vZi2era1rgnl for <buildroot@lists.busybox.net>;
 Sun, 10 Oct 2021 23:47:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 246E740398
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 23:47:03 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id k26so13287446pfi.5
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 16:47:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lbl9pyP0W487wpuh5aBJPsDOyN3ib02xVUhV8dhouhk=;
 b=6IpFHbv4SaTHePYgrWsS8uHEbtZr/VMku7Wz7VqSkhLQkEp6+awUyAFWfC/dgh6yST
 rDeCT6wKkfF74XeDS6K/1Ua8XfUYkH4BHQ+H0fNZFjkOHoYO6y36RTiTpdQruoBjD6MG
 3RnHUqL+5nC1RKV2MVD6mmLsudlaeU9D75hEU3e0XfeiAjMfS5u/XYXvw7rOx7emNkMV
 wkS6AliMSQcTQdHM8FseHNn6jw9wpG3spVopmFh0NEy/mTEElc+clAVnM75NOvd2hW/n
 ZnABdrhAmJnnbH7+TVm/un60SVlyQakut7+RQZSf8K3AzmBtypaWBViTB+8lRoL7Mong
 jrAQ==
X-Gm-Message-State: AOAM530RKYGQMJMu4uR2/+SpXNUCFwnm838E+ovJT4Zx32zhgs2YTsa1
 hpQC4gxB8X8wo0dYvhX5UfDfM9l6H5r9cg==
X-Google-Smtp-Source: ABdhPJwj79Jrldq9Kybqh8Vre5BqzugP1dn09KcgcLCxtqf9hzP4/iKsAZQAHJkLv/f5JtfNMGOe6g==
X-Received: by 2002:a63:cc48:: with SMTP id q8mr15427185pgi.171.1633909622359; 
 Sun, 10 Oct 2021 16:47:02 -0700 (PDT)
Received: from localhost.localdomain (ip68-111-8-11.sb.sd.cox.net.
 [68.111.8.11])
 by smtp.gmail.com with ESMTPSA id t6sm5662547pfh.63.2021.10.10.16.47.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Oct 2021 16:47:02 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun, 10 Oct 2021 16:46:54 -0700
Message-Id: <20211010234655.585526-5-christian@paral.in>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211010234655.585526-1-christian@paral.in>
References: <20211010234655.585526-1-christian@paral.in>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH-NEXT v3 5/6] package/embiggen-disk: new package
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>, Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

embiggen-disk is a tool to automatically resize disks to fill available space.

Patch submitted upstream: https://github.com/bradfitz/embiggen-disk/pull/13

Adds support for /dev/mmcblk0pN type paths.

Signed-off-by: Christian Stewart <christian@paral.in>

---

v1 -> v2:

 - BR2_TOOLCHAN_USES_UCLIBC -> BR2_TOOLCHAIN_USES_UCLIBC
 - remove old TODO comment

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/Config.in                             |  1 +
 ...-Fix-resizing-of-dev-mmcblk0pN-paths.patch | 45 +++++++++++++++++++
 package/embiggen-disk/Config.in               | 17 +++++++
 package/embiggen-disk/embiggen-disk.hash      |  3 ++
 package/embiggen-disk/embiggen-disk.mk        | 12 +++++
 5 files changed, 78 insertions(+)
 create mode 100644 package/embiggen-disk/0001-Fix-resizing-of-dev-mmcblk0pN-paths.patch
 create mode 100644 package/embiggen-disk/Config.in
 create mode 100644 package/embiggen-disk/embiggen-disk.hash
 create mode 100644 package/embiggen-disk/embiggen-disk.mk

diff --git a/package/Config.in b/package/Config.in
index 9fed0ab4cb..7a833909aa 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2471,6 +2471,7 @@ menu "System tools"
 	source "package/earlyoom/Config.in"
 	source "package/efibootmgr/Config.in"
 	source "package/efivar/Config.in"
+	source "package/embiggen-disk/Config.in"
 	source "package/emlog/Config.in"
 	source "package/ftop/Config.in"
 	source "package/getent/Config.in"
diff --git a/package/embiggen-disk/0001-Fix-resizing-of-dev-mmcblk0pN-paths.patch b/package/embiggen-disk/0001-Fix-resizing-of-dev-mmcblk0pN-paths.patch
new file mode 100644
index 0000000000..31cfea9dde
--- /dev/null
+++ b/package/embiggen-disk/0001-Fix-resizing-of-dev-mmcblk0pN-paths.patch
@@ -0,0 +1,45 @@
+From b628e4c561cb4d3ffc92a5d7aac8f4967e44977e Mon Sep 17 00:00:00 2001
+From: Christian Stewart <christian@paral.in>
+Date: Thu, 27 May 2021 20:07:07 -0700
+Subject: [PATCH] Fix resizing of /dev/mmcblk0pN paths
+
+Signed-off-by: Christian Stewart <christian@paral.in>
+---
+ fs.go   | 4 +++-
+ part.go | 5 +++++
+ 2 files changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/fs.go b/fs.go
+index 0b83e24..8ab3690 100644
+--- a/fs.go
++++ b/fs.go
+@@ -67,7 +67,9 @@ func (e fsResizer) DepResizer() (Resizer, error) {
+ 	if dev == "/dev/root" {
+ 		return nil, errors.New("unexpected device /dev/root from statFS")
+ 	}
+-	if (strings.HasPrefix(dev, "/dev/sd") || strings.HasPrefix(dev, "/dev/nvme")) &&
++	if (strings.HasPrefix(dev, "/dev/sd") ||
++		strings.HasPrefix(dev, "/dev/mmcblk") ||
++		strings.HasPrefix(dev, "/dev/nvme")) &&
+ 		devEndsInNumber(dev) {
+ 		vlogf("fsResizer.DepResizer: returning partitionResizer(%q)", dev)
+ 		return partitionResizer(dev), nil
+diff --git a/part.go b/part.go
+index 0315a6e..f3e280f 100644
+--- a/part.go
++++ b/part.go
+@@ -51,6 +51,11 @@ func diskDev(partDev string) string {
+ 	if strings.HasPrefix(partDev, "/dev/sd") {
+ 		return strings.TrimRight(partDev, "0123456789")
+ 	}
++	if strings.HasPrefix(partDev, "/dev/mmcblk") {
++		v := strings.TrimRight(partDev, "0123456789")
++		v = strings.TrimSuffix(v, "p")
++		return v
++	}
+ 	if strings.HasPrefix(partDev, "/dev/nvme") {
+ 		chopP := regexp.MustCompile(`p\d+$`)
+ 		if !chopP.MatchString(partDev) {
+-- 
+2.31.1
+
diff --git a/package/embiggen-disk/Config.in b/package/embiggen-disk/Config.in
new file mode 100644
index 0000000000..c0e19b104e
--- /dev/null
+++ b/package/embiggen-disk/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_EMBIGGEN_DISK
+	bool "embiggen-disk"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no fexecve
+	select BR2_PACKAGE_UTIL_LINUX # sfdisk
+	select BR2_PACKAGE_UTIL_LINUX_BINARIES # sfdisk
+	help
+	  embiggen-disk is a tool to resize disk partitions at runtime.
+
+	  https://github.com/bradfitz/embiggen-disk
+
+comment "embiggen-disk needs a glibc or musl toolchain w/ threads"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS && \
+		BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_UCLIBC
diff --git a/package/embiggen-disk/embiggen-disk.hash b/package/embiggen-disk/embiggen-disk.hash
new file mode 100644
index 0000000000..1a642ea9e8
--- /dev/null
+++ b/package/embiggen-disk/embiggen-disk.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  834bf52babc370e275319e4fff2d85ea3b4dfa94eda18b864532896976333213  embiggen-disk-c554fc1c93a4004ce0b6a3f69b0dabe0481a2308.tar.gz
+sha256  063aedec1652c5a05c2d04c40e032b932453142ee8ef7fd53c04a9acc127fc95  LICENSE
diff --git a/package/embiggen-disk/embiggen-disk.mk b/package/embiggen-disk/embiggen-disk.mk
new file mode 100644
index 0000000000..5d5ac15ae8
--- /dev/null
+++ b/package/embiggen-disk/embiggen-disk.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# embiggen-disk
+#
+################################################################################
+
+EMBIGGEN_DISK_VERSION = c554fc1c93a4004ce0b6a3f69b0dabe0481a2308
+EMBIGGEN_DISK_SITE = $(call github,bradfitz,embiggen-disk,$(EMBIGGEN_DISK_VERSION))
+EMBIGGEN_DISK_LICENSE = Apache-2.0
+EMBIGGEN_DISK_LICENSE_FILES = LICENSE
+
+$(eval $(golang-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

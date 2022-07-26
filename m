Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A93C00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 15:51:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF7EE60DF6;
	Tue, 26 Jul 2022 15:51:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF7EE60DF6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4a9MVjXYK3CS; Tue, 26 Jul 2022 15:51:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E43ED610FD;
	Tue, 26 Jul 2022 15:51:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E43ED610FD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 85D421BF5A2
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 15:51:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6DC9660E3B
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 15:51:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6DC9660E3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u4aNDvkSeQoK for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 15:51:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5368860DF6
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5368860DF6
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 15:51:20 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id k12so3025402wrm.13
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 08:51:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=joeP7ucCy30PEFClIJ/BDY+4N0257ITvf0VivZ4nCy4=;
 b=buWF7QHWbhFP4SItiHTm6CMIn6PkRvgKuC57bnPzyT+ZJ2VDTxqvk2jZES/k2P3Amh
 QNeBZB2hiYSURzdtYmeffPvAngPZEzPAVnWpSImt5K1ji73cJUXWcA4sow6P82JIddr9
 I8yKyy3yDMhqOIDN70k3AmwdgQDKfTshYJuqWxWE4HyWjYlKaWmfq0pJqmnfkN8hkN3J
 xgQsmWSgYMq6uZhDAy6xmAKwnrzJhNwUWg6xvY1g+00DOIUIyLy1n6NsONvmFAqJVlj8
 6eKcU/flcJHCSqy9BZ2hoVwxPyGnwIiYDEqF6/s5CUYTg3cstCbFCypy/vR2/xiAZiMs
 0wcg==
X-Gm-Message-State: AJIora8mkHowNQGmUImHBYY7iF26yhrL8gMbrIMSsB8jmkiDHJx4iq9o
 R4VUQJx/mi+0dtwfU5jZ4Zgz5kUZL3kvnQ==
X-Google-Smtp-Source: AGRyM1vs5RR/gvrnIYGhe700Yw+AxXQTN2+RRUHeiykznjksZl1sEXbqxgpFtrH72ZAU0pnuhXXSjw==
X-Received: by 2002:adf:f412:0:b0:21d:8aa4:e796 with SMTP id
 g18-20020adff412000000b0021d8aa4e796mr11556186wro.79.1658850678360; 
 Tue, 26 Jul 2022 08:51:18 -0700 (PDT)
Received: from nitra.nantes.intranet
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 j13-20020a5d448d000000b002167efdd549sm14483811wrq.38.2022.07.26.08.51.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 08:51:18 -0700 (PDT)
From: Nicolas Tran <nicolas.tran@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 17:51:15 +0200
Message-Id: <20220726155115.2024965-1-nicolas.tran@smile.fr>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=joeP7ucCy30PEFClIJ/BDY+4N0257ITvf0VivZ4nCy4=;
 b=W2lxz1Hvsb03u4F0oxaXInLzMRaFcS99v2dUgJR7CQuR4BkFGv+CkBT7J55bb3wO25
 ImN2ISuUZ1yXeGnicdJF0YuBKL4CdKpVkzyDMo7APfN1EMT1DxquNwB0m2kXW6YTEVTK
 0vp2/zHjNKUvFE1h6+b2ALUz87TsqahYH889KsapiTwBJ1XdXmb5OVsqD2ud0dJo4Z97
 ZlW/8SrPC80+SjYzp03YC57rfhmDL7ybQHH6zR0BUadFqrfU6Pqn5Y/v225TcMtVTT6E
 jrNlAS8CxfyeVmYCiglhVUPHhijOF9K4Q8LueyGUcWIaNlSXNR4fkzUyrsLhBDAfpbif
 qPAw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=W2lxz1Hv
Subject: [Buildroot] [PATCH v3] package/dust: new package
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
Cc: Nicolas Tran <nicolas.tran@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

dust is an alternative of the command du from the Linux kernel,
written in Rust. It aims to be more intuitive and visual in order
to give the user a better view of his system's storage capacity.

Signed-off-by: Nicolas Tran <nicolas.tran@smile.fr>
---

The package has been checked with correct formatting and
without typos:
$ ./utils/check-package package/dust/*

Tests have been run using test-pkg:
$ ./utils/test-pkg -c dust.config -p dust

test-pkg config:
To run the test, the file dust.config contains the following line
BR2_PACKAGE_DUST=y

Results:
     bootlin-armv5-uclibc [1/6]: SKIPPED
      bootlin-armv7-glibc [2/6]: OK
    bootlin-armv7m-uclibc [3/6]: SKIPPED
      bootlin-x86-64-musl [4/6]: OK
       br-arm-full-static [5/6]: SKIPPED
             sourcery-arm [6/6]: OK
Signed-off-by: Nicolas Tran <nicolas.tran@smile.fr>
---
 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/dust/Config.in | 11 +++++++++++
 package/dust/dust.hash |  3 +++
 package/dust/dust.mk   | 12 ++++++++++++
 5 files changed, 28 insertions(+)
 create mode 100644 package/dust/Config.in
 create mode 100644 package/dust/dust.hash
 create mode 100644 package/dust/dust.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 1dede4b83b..fdd2582614 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2179,6 +2179,7 @@ F:	package/exiv2/
 F:	package/ofono/
 
 N:	Nicolas Tran <nicolas.tran@smile.fr>
+F:	package/dust/
 F:	package/hyperfine/
 
 N:	Niklas Cassel <niklas.cassel@wdc.com>
diff --git a/package/Config.in b/package/Config.in
index d264449b30..a283fadc41 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -210,6 +210,7 @@ menu "Filesystem and flash utilities"
 	source "package/curlftpfs/Config.in"
 	source "package/davfs2/Config.in"
 	source "package/dosfstools/Config.in"
+	source "package/dust/Config.in"
 	source "package/e2fsprogs/Config.in"
 	source "package/e2tools/Config.in"
 	source "package/ecryptfs-utils/Config.in"
diff --git a/package/dust/Config.in b/package/dust/Config.in
new file mode 100644
index 0000000000..7b6e9304bc
--- /dev/null
+++ b/package/dust/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_DUST
+	bool "dust"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_RUSTC
+	help
+	  dust is an alternative written in Rust of the command "du"
+	  from the Linux kernel. It aims to be more intuitive and visual
+	  in order to give the user a better view of his system's
+	  current storage capacity.
+
+	  https://github.com/bootandy/dust.git
diff --git a/package/dust/dust.hash b/package/dust/dust.hash
new file mode 100644
index 0000000000..82043b497d
--- /dev/null
+++ b/package/dust/dust.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  8231d045a0cca286355e89a41758b05f43238d52721bfc78e0b9bc19789bebde  dust-0.8.1.tar.gz
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/dust/dust.mk b/package/dust/dust.mk
new file mode 100644
index 0000000000..2cffc336a9
--- /dev/null
+++ b/package/dust/dust.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# dust
+#
+################################################################################
+
+DUST_VERSION = 0.8.1
+DUST_SITE = $(call github,bootandy,dust,v$(DUST_VERSION))
+DUST_LICENSE = APACHE-2.0
+DUST_LICENSE_FILES = LICENSE
+
+$(eval $(cargo-package))
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

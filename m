Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A266C00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 14:57:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75A8A419E1;
	Tue, 26 Jul 2022 14:57:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75A8A419E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rEdsnM40uJbS; Tue, 26 Jul 2022 14:57:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08BB841997;
	Tue, 26 Jul 2022 14:57:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08BB841997
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BFEA71BF276
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 14:57:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 96AE641997
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 14:57:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96AE641997
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gPWfsMYf8NDc for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 14:57:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27D2841951
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 27D2841951
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 14:57:37 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id b26so20553387wrc.2
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 07:57:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qbLkeW/zxO0xG20icHyr6HMpkvsnfiVd4hey189BsX4=;
 b=xHOPcRwGr6vo1EBCGuDyWmEnjz3z6r7X/3JLSl1ZeFnzBgAlUjfKgcPRqmVLm5cb/3
 quVnZXjSNRCw1uVyqGP1vG1p9lW2y0uGREQjJULqF4fCAACshUkOLyOX+PPsjJxcjRMe
 BNtxclNI3awmtfun2+UAGgwjiX1vpMyYMPFk7syYA5Mhbw0utyk+3hepvKcIJBf2mW9+
 mMluBGlpLrgpFzBXhMAPf6rwdS9jMz/XiyRn/m6j6dmPJxW+QXTT83uFFfYHG12m7H1w
 m2Lm3NiP6bwy+gDEAKqZslT8eOYTus1zs4BJIErt2gp0VICqTOFAmsXik8or3frzMpmx
 mStA==
X-Gm-Message-State: AJIora/ZO03PSD2esac8Q/GVwBSSKziRtbUAL4DiJcy6+MsVtZnjuZiV
 irMJJ+rbOYvFBHi87AAUElPg94zXBJpj2Q==
X-Google-Smtp-Source: AGRyM1uxSWqD86HSs9hFQ03SG26xsXmSgyLgWfMFRMxUf8rZNhyqlQv/NItp2HsjpO09upV5+o3vYA==
X-Received: by 2002:a05:6000:18a2:b0:21d:bc7c:1c83 with SMTP id
 b2-20020a05600018a200b0021dbc7c1c83mr10653833wri.420.1658847455142; 
 Tue, 26 Jul 2022 07:57:35 -0700 (PDT)
Received: from nitra.nantes.intranet
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 f18-20020a7bc8d2000000b003a327b98c0asm17631248wml.22.2022.07.26.07.57.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 07:57:34 -0700 (PDT)
From: Nicolas Tran <nicolas.tran@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 16:56:46 +0200
Message-Id: <20220726145646.1894310-1-nicolas.tran@smile.fr>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qbLkeW/zxO0xG20icHyr6HMpkvsnfiVd4hey189BsX4=;
 b=CwCjIceVXEkihd56fEnNuAN+oXLfCEr2msZw7H97UXdXuCZU+zhZ9SEE/aBVFo4DGo
 qZegPlSxPk84OMrec1G+3EyQZnnL1RvDRDiBa7Q2XXYyX1N5rs3Xxbc9uvwpdDdkilZb
 VlEs0SyJ5p1zqiXBQQEpSh6kttf+M2S3NDqSEOkUNf2ZcAIUETScfrAuaQKRnqupdoN6
 fllIJe2HW0mKD+0GXwPNTxVJpJ9ulijt+QTXDBo4vg4of3hddXtgxlYqX8qE1jCbdgZi
 eKiu5QX60IFouMfIgmeFl7xEH0jl5BMC4l5QF4vnVFI9T+nnebSnw3tUrbOulOHpzrlz
 z5HQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=CwCjIceV
Subject: [Buildroot] [PATCH 1/1] new package: package/dust
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
 package/dust/Config.in | 12 ++++++++++++
 package/dust/dust.hash |  3 +++
 package/dust/dust.mk   | 12 ++++++++++++
 5 files changed, 29 insertions(+)
 create mode 100644 package/dust/Config.in
 create mode 100644 package/dust/dust.hash
 create mode 100644 package/dust/dust.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 1dede4b83b..7a0fa47595 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2180,6 +2180,7 @@ F:	package/ofono/
 
 N:	Nicolas Tran <nicolas.tran@smile.fr>
 F:	package/hyperfine/
+F:  package/dust/
 
 N:	Niklas Cassel <niklas.cassel@wdc.com>
 F:	configs/qemu_riscv64_nommu_virt_defconfig
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
index 0000000000..c02cf1aa83
--- /dev/null
+++ b/package/dust/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_DUST
+	bool "dust"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	depends on BR2_INSTALL_LIBSTDCPP # host-rustc
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
index 0000000000..a889d64f56
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
+DUST_SITE = $(call github,bootandy,dust,v$(DUST_VERSION)-alpha.2)
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

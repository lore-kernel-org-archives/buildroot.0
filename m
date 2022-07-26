Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF9EDC00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 15:29:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61B05422F0;
	Tue, 26 Jul 2022 15:29:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61B05422F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vKoM_WDIZw0x; Tue, 26 Jul 2022 15:29:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 306EB422F5;
	Tue, 26 Jul 2022 15:29:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 306EB422F5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D1FAF1BF5A2
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 15:29:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AAADE61176
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 15:29:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAADE61176
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FAAqFL2xMNOC for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 15:29:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 489DF60FD3
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 489DF60FD3
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 15:29:24 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 v67-20020a1cac46000000b003a1888b9d36so11579568wme.0
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 08:29:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MJHqSWiZysaSHYEUY1Go7ybQBjynVJQqkK52W5PDUN4=;
 b=tvr6y+Hy1shxJ/ri6JwHm0q5/VIdFdgch0rTiPPu/NYeFAFcc3ENC4JImOi/bjDtTt
 z/bALH8KkWirnXQ7Msm2LwAvtlphB5LmR9BXbbe4G30U28OYORD/Vyf07AGHynj23gsU
 6g7ywNRLvA+/MJQtUJUWTzP54DDFbiDDTjOzIseytvaAVlAIihBQKJMVCL5TT6AcrcFI
 hcXdtK0GqkLXM9nVhNCb1kc3RpeEMFQyVBrzHPHrES/GLoRbEDj0sgRQdzx2dqkoWwCX
 +fFfYU3hat27O9Yq1q+oPDzpthDY7e8r6OWosipE3VpskVoCH4x039ALXnogZc9Ah/EP
 dFEg==
X-Gm-Message-State: AJIora9oC3EeRn7VEc/7S2PHeSH7BNHFgzbuv1fRMh9wlxlX/WiAbyvZ
 cQVq7uS7mO+/GUZ2oiK1z3xQbWmxLzhG4A==
X-Google-Smtp-Source: AGRyM1tp7kCxG4deU1GfRsDglezuC9cSFa43f25GkfomlKJY6/IPeNBrzK+9/kKBd/m45vjgryV4ag==
X-Received: by 2002:a05:600c:1f16:b0:3a3:214c:a85e with SMTP id
 bd22-20020a05600c1f1600b003a3214ca85emr12590893wmb.95.1658849362225; 
 Tue, 26 Jul 2022 08:29:22 -0700 (PDT)
Received: from nitra.nantes.intranet
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 e3-20020a5d5303000000b0021e5e5cd3a8sm1071616wrv.87.2022.07.26.08.29.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 08:29:21 -0700 (PDT)
From: Nicolas Tran <nicolas.tran@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 17:29:07 +0200
Message-Id: <20220726152907.1993521-1-nicolas.tran@smile.fr>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MJHqSWiZysaSHYEUY1Go7ybQBjynVJQqkK52W5PDUN4=;
 b=ahbx9Zoyev+xHEgbl357BuBjFIcn7h9tDG8Ep2DFAZoadxc0grn9jfFIuEYcNz/pRZ
 ji8jBlWta2qw9kDkkactZz8ol9RFsJt3KjTbBKguXzascltD9JrgR5qziy2GTaPWkZ8t
 rYoPEFTJGqE8YfeCfpwPS1MU0sPYO7Gg+nJC/LWUZ9dkPZpmKutp8tTiIfEdV73/xxmg
 3WqJtlJLZlPsQIpH/QaOTt2K9XLJNnfjSWGNTy0eLB+cumZ61GS9oHRHc3xlfsfzS4bD
 vuOuG27KPWbf1xBY6crq7i/2/g1cBDwmdj0Z3tSTz7bPyZhvPM5OWXL7A5LS6OdEpDnv
 I5Gw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=ahbx9Zoy
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

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6368C32771
	for <buildroot@archiver.kernel.org>; Wed, 28 Sep 2022 19:23:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B25540C33;
	Wed, 28 Sep 2022 19:23:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B25540C33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TCwwOyBhHvca; Wed, 28 Sep 2022 19:23:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D49340989;
	Wed, 28 Sep 2022 19:23:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D49340989
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A2FD01BF2F8
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 19:23:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 77C8E40298
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 19:23:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77C8E40298
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4VsRrFLgJI8l for <buildroot@lists.busybox.net>;
 Wed, 28 Sep 2022 19:23:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1336440286
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1336440286
 for <buildroot@buildroot.org>; Wed, 28 Sep 2022 19:23:28 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id e18so18599286edj.3
 for <buildroot@buildroot.org>; Wed, 28 Sep 2022 12:23:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=UWLXwj1mB5643AeD+xcJSsrH/YGMzCHkMpGRNSCG1wM=;
 b=SKdvLdXiBOemHnC5JU15BB3LRg+jmdLSFikeC8dESNh9+FIgcBoMmhF+unBQlPyEo9
 Jq5AChwxftGA3ltMr1s2wdqjDdPspuuFqUO4TILXVqAW7Npwn1Ka8PVt7sEIRPMLHbx+
 mG81svjCKbfRJtkhIcKFwmh3G1IqUbRUfwE55vZOh/m/ZLRHTh53SfBV4lBKx3xFJqyp
 aHypydgm9baNWOd1U/itrzl7Wx/TYq0vCdkVfCD8D/ufkL50Nwx/R7UaS26IgIfnwMPJ
 mwPC72oKC+iS6bNxeF3pFtZZ4DDKTmqrDkTvAAjRZrxicE71jJKruwSXmlZAhEUIO0UQ
 l88A==
X-Gm-Message-State: ACrzQf1SMhgQZfzV9/96JVl7C+eUTks+FqW93FlwtSdq6iZcKVQRCDq0
 GyEEYP4hDXsy+ove9b7u1goMB8SA5Vg=
X-Google-Smtp-Source: AMsMyM5Jn8waigTZcGLeKBTMGDfetmZOvsOAr+oOOUeVugYvYps9coKjlvZL7er5Nm4PWJHQ37mDug==
X-Received: by 2002:a05:6402:42c5:b0:44e:b640:16fb with SMTP id
 i5-20020a05640242c500b0044eb64016fbmr35769139edc.29.1664393006649; 
 Wed, 28 Sep 2022 12:23:26 -0700 (PDT)
Received: from fedora.. (dh207-96-59.xnet.hr. [88.207.96.59])
 by smtp.googlemail.com with ESMTPSA id
 d7-20020aa7c1c7000000b0045726e8a22bsm3918698edp.46.2022.09.28.12.23.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Sep 2022 12:23:26 -0700 (PDT)
From: Robert Marko <robimarko@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 28 Sep 2022 21:23:24 +0200
Message-Id: <20220928192324.1279960-1-robimarko@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=UWLXwj1mB5643AeD+xcJSsrH/YGMzCHkMpGRNSCG1wM=;
 b=N1ciZgMDRCvdJkPDJX60wVb4S31hJU9P0JrlsK/HxS9TupDdUc1Z4g8/Ji7Z0XSKIl
 3Pqj6MCoHhdH5AxTElbCk83RlKSUyE3J5cvcSKKqwO81N23/hGuZXAAGuTXB7cjGtZad
 TLO7VcBY4BflyzbYcJNPwp6FCyFxFd7/te6mEcoQIWeNhnSIeYwSEHQPp4B+EiyRCw2G
 g2lR8sX/RV2aN4h9U8f8xLs8ypVcIocswm30Go+PgwKJRPEzNTQx9sw+sVpJxI+4LwAN
 /dQmjzaXdr+TL0fCCo/o9B+q4eUGgTSJe6WgtgOfZoX+B3ZCbA3icplYHDkaaGIoec38
 j4Fw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=N1ciZgMD
Subject: [Buildroot] [PATCH] package/mdio-tools: new package
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
Cc: Robert Marko <robimarko@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

mdio-tools are kernel module and accompanying tools for low-level
debugging of devices attached on MDIO bus like PHY-s, switches etc.

Userspace tools provide C22 or C45 reads and writes, benchmarking
and even dedicated Marvell Link Street tools via the included
kernel module.

Signed-off-by: Robert Marko <robimarko@gmail.com>
---
 package/Config.in                  |  1 +
 package/mdio-tools/Config.in       |  9 +++++++++
 package/mdio-tools/mdio-tools.hash |  3 +++
 package/mdio-tools/mdio-tools.mk   | 16 ++++++++++++++++
 4 files changed, 29 insertions(+)
 create mode 100644 package/mdio-tools/Config.in
 create mode 100644 package/mdio-tools/mdio-tools.hash
 create mode 100644 package/mdio-tools/mdio-tools.mk

diff --git a/package/Config.in b/package/Config.in
index e3a34d6e97..ed41e8bdd4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -536,6 +536,7 @@ endmenu
 	source "package/mbpfan/Config.in"
 	source "package/mdadm/Config.in"
 	source "package/mdevd/Config.in"
+	source "package/mdio-tools/Config.in"
 	source "package/memtest86/Config.in"
 	source "package/memtester/Config.in"
 	source "package/memtool/Config.in"
diff --git a/package/mdio-tools/Config.in b/package/mdio-tools/Config.in
new file mode 100644
index 0000000000..feb1e825ac
--- /dev/null
+++ b/package/mdio-tools/Config.in
@@ -0,0 +1,9 @@
+comment "mdio-tools needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
+
+config BR2_PACKAGE_MDIO_TOOLS
+	bool "mdio-tools"
+	depends on BR2_LINUX_KERNEL
+	select BR2_PACKAGE_LIBMNL
+	help
+	  Low-level debug tools for MDIO devices
diff --git a/package/mdio-tools/mdio-tools.hash b/package/mdio-tools/mdio-tools.hash
new file mode 100644
index 0000000000..0111165f27
--- /dev/null
+++ b/package/mdio-tools/mdio-tools.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  c5e17431c62392f6c1da1ba4fb0a6f5918521509a377af74485851f93ff2a106  mdio-tools-1.2.0.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/mdio-tools/mdio-tools.mk b/package/mdio-tools/mdio-tools.mk
new file mode 100644
index 0000000000..e4ea6f8224
--- /dev/null
+++ b/package/mdio-tools/mdio-tools.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# mdio-tools
+#
+################################################################################
+
+MDIO_TOOLS_VERSION = 1.2.0
+MDIO_TOOLS_SITE = https://github.com/wkz/mdio-tools/releases/download/$(MDIO_TOOLS_VERSION)
+MDIO_TOOLS_LICENSE = GPL-2.0-only
+MDIO_TOOLS_LICENSE_FILES = COPYING
+MDIO_TOOLS_DEPENDENCIES = libmnl
+
+MDIO_TOOLS_MODULE_SUBDIRS = kernel
+
+$(eval $(kernel-module))
+$(eval $(autotools-package))
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

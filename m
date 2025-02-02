Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C7EFC0218F
	for <buildroot@archiver.kernel.org>; Sun,  2 Feb 2025 20:12:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD931606AF;
	Sun,  2 Feb 2025 20:12:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ewXwb-NuAmg; Sun,  2 Feb 2025 20:12:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1958F606A3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1958F606A3;
	Sun,  2 Feb 2025 20:12:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B033185
 for <buildroot@buildroot.org>; Sun,  2 Feb 2025 20:12:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6A8BE6069D
 for <buildroot@buildroot.org>; Sun,  2 Feb 2025 20:12:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id svxLOiklDT5M for <buildroot@buildroot.org>;
 Sun,  2 Feb 2025 20:12:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.85.215.56;
 helo=mx1.ipacct.bg; envelope-from=bbonev@ipacct.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4F1BD606A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F1BD606A3
Received: from mx1.ipacct.bg (mx1.bul.net [195.85.215.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4F1BD606A3
 for <buildroot@buildroot.org>; Sun,  2 Feb 2025 20:12:03 +0000 (UTC)
Received: from mx1.ipacct.bg (localhost [127.0.0.1])
 by mx1.ipacct.bg (Postfix) with ESMTP id E2FA560026
 for <buildroot@buildroot.org>; Sun,  2 Feb 2025 22:12:00 +0200 (EET)
Received: by mx1.ipacct.bg (Postfix, from userid 1001)
 id 8D42360251; Sun,  2 Feb 2025 22:12:00 +0200 (EET)
Received: from purple.bonev.com (purple.bonev.com [195.85.215.215])
 by mx1.ipacct.bg (Postfix) with ESMTP id 8188D60026
 for <buildroot@buildroot.org>; Sun,  2 Feb 2025 22:11:58 +0200 (EET)
Received: (qmail 17964 invoked by uid 64020); 2 Feb 2025 22:11:58 +0200
Received: from unknown (HELO localhost.localdomain) (195.85.215.8)
 by purple.bonev.com with SMTP; 2 Feb 2025 22:11:58 +0200
From: Boian Bonev <bbonev@ipacct.com>
To: buildroot@buildroot.org
Cc: Boian Bonev <bbonev@ipacct.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  2 Feb 2025 22:11:35 +0200
Message-Id: <20250202201136.4278-1-bbonev@ipacct.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ipacct.com; s=default; t=1738527120;
 bh=PtJrTNZBOFwHR/SUyoMjprXw2/UgmIeUKxmYe+8w5Xc=;
 h=From:To:Cc:Subject:Date:From;
 b=hRbvMFIlSW5f1W8OY4R7ua9WwZ89Xr4BAEwNCcnCAj0ejBDLK0RSZXFXQ+FPLh+BD
 HF42BT1lsku6sKJKow7KsDb+NXI8fPlg0Wo/s0wDvA0CnP/kdexdHvtsFoymeYzCvL
 e1O5oMm0uyT/MlU0RHuYAk/sa9X3j8xuMmDa6Aj7EqMWPhBaKWu4PLmkJzcrp1Z1i8
 93Ngw3keBoMP7vxo5CCmbmZlXUHYY2fPn19EJ+yCzSQNBdWjP8mKQYi3GHfAigePfM
 oFlD1Kf5W9o0zCBSKUrLNUb5WaPINe+Ooz9afuH+lYyzcdXRARbvSScRzypjyibOvR
 LcLWEYttjOtYg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ipacct.com; s=default; t=1738527120;
 bh=PtJrTNZBOFwHR/SUyoMjprXw2/UgmIeUKxmYe+8w5Xc=;
 h=From:To:Cc:Subject:Date:From;
 b=hRbvMFIlSW5f1W8OY4R7ua9WwZ89Xr4BAEwNCcnCAj0ejBDLK0RSZXFXQ+FPLh+BD
 HF42BT1lsku6sKJKow7KsDb+NXI8fPlg0Wo/s0wDvA0CnP/kdexdHvtsFoymeYzCvL
 e1O5oMm0uyT/MlU0RHuYAk/sa9X3j8xuMmDa6Aj7EqMWPhBaKWu4PLmkJzcrp1Z1i8
 93Ngw3keBoMP7vxo5CCmbmZlXUHYY2fPn19EJ+yCzSQNBdWjP8mKQYi3GHfAigePfM
 oFlD1Kf5W9o0zCBSKUrLNUb5WaPINe+Ooz9afuH+lYyzcdXRARbvSScRzypjyibOvR
 LcLWEYttjOtYg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ipacct.com; s=default; t=1738527119;
 bh=PtJrTNZBOFwHR/SUyoMjprXw2/UgmIeUKxmYe+8w5Xc=;
 h=From:To:Cc:Subject:Date:From;
 b=naSfKiNFrMZMVJ7iirWeeUgWpx223l2R5+p/I7juACpxvODaNjNj/eeur4naHPUY7
 /ch0lqHd8P4uYJ6eAxC0YA357WWHQsNJcSsHGEMeNzuQzZQdiVEnFSqZpoQW3Nt31t
 zXtq5AHcHwlN1rAtuMjw5ylSLKs3P0awoL66xAB+rwkTZv8aGHtBn4mkfbdnpcniSd
 QSiAxZkpE1hsnLc6CRHKhzbpdkyHNyeC1ibl3scg39Vs+RQAf4lIA1dvqtNIX9tB0F
 XYOOsO7Pgp70H/TLTo4UOq0CM0ZWzAKyTY5xG2da/BioHCMLq8pcNxsAcxYJnMWddI
 Oqxw6M9cm65pg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ipacct.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=ipacct.com header.i=@ipacct.com
 header.a=rsa-sha256 header.s=default header.b=hRbvMFIl; 
 dkim=pass (2048-bit key) header.d=ipacct.com header.i=@ipacct.com
 header.a=rsa-sha256 header.s=default header.b=hRbvMFIl; 
 dkim=pass (2048-bit key) header.d=ipacct.com header.i=@ipacct.com
 header.a=rsa-sha256 header.s=default header.b=naSfKiNF
Subject: [Buildroot] [PATCH] Add package bpfmon
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

bpfmon - BPF based visual packet rate monitor

While tcpdump shows what packets are going through the network, bpfmon will show how much in terms of bytes per second and packets per second in a nice pseudo-graphical terminal interface.

bpfmon also supports monitoring an iptables rule that is selected by command line option or selected from a menu (only under Linux).

Signed-off-by: Boian Bonev <bbonev@ipacct.com>
---
 package/Config.in          |  1 +
 package/bpfmon/Config.in   |  8 ++++++++
 package/bpfmon/bpfmon.hash |  3 +++
 package/bpfmon/bpfmon.mk   | 23 +++++++++++++++++++++++
 4 files changed, 35 insertions(+)
 create mode 100644 package/bpfmon/Config.in
 create mode 100644 package/bpfmon/bpfmon.hash
 create mode 100644 package/bpfmon/bpfmon.mk

diff --git a/package/Config.in b/package/Config.in
index aef90d54ad..60c67e5023 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2443,6 +2443,7 @@ endif
 	source "package/bmon/Config.in"
 	source "package/bmx7/Config.in"
 	source "package/boinc/Config.in"
+	source "package/bpfmon/Config.in"
 	source "package/brcm-patchram-plus/Config.in"
 	source "package/bridge-utils/Config.in"
 	source "package/bwm-ng/Config.in"
diff --git a/package/bpfmon/Config.in b/package/bpfmon/Config.in
new file mode 100644
index 0000000000..ab61aa1bc0
--- /dev/null
+++ b/package/bpfmon/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_BPFMON
+	bool "bpfmon"
+	select BR2_PACKAGE_YASCREEN
+	select BR2_PACKAGE_LIBPCAP
+	help
+	  bpfmon BPF based visual packet rate monitor
+
+	  https://github.com/bbonev/bpfmon
diff --git a/package/bpfmon/bpfmon.hash b/package/bpfmon/bpfmon.hash
new file mode 100644
index 0000000000..be5da0e42a
--- /dev/null
+++ b/package/bpfmon/bpfmon.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  f73508a40b093caea8ac20431c19b1e89627311bbd8ff49063ec987378a46a7c  bpfmon-2.53.tar.xz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/bpfmon/bpfmon.mk b/package/bpfmon/bpfmon.mk
new file mode 100644
index 0000000000..d6a4b87bc5
--- /dev/null
+++ b/package/bpfmon/bpfmon.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# bpfmon
+#
+################################################################################
+
+BPFMON_VERSION = 2.53
+BPFMON_SOURCE = bpfmon-$(BPFMON_VERSION).tar.xz
+BPFMON_SITE = https://github.com/bbonev/bpfmon/releases/download/v$(BPFMON_VERSION)
+BPFMON_LICENSE = GPL-2.0+
+BPFMON_LICENSE_FILES = LICENSE
+BPFMON_DEPENDENCIES = yascreen libpcap
+
+define BPFMON_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		$(TARGET_CONFIGURE_OPTS)
+endef
+
+define BPFMON_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)" install
+endef
+
+$(eval $(generic-package))
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E3CAC6FD19
	for <buildroot@archiver.kernel.org>; Mon, 13 Mar 2023 08:17:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F067D4018B;
	Mon, 13 Mar 2023 08:17:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F067D4018B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZQLHEEkw7zTf; Mon, 13 Mar 2023 08:17:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D382940132;
	Mon, 13 Mar 2023 08:17:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D382940132
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 021881BF3E0
 for <buildroot@lists.busybox.net>; Mon, 13 Mar 2023 08:17:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD7BD81322
 for <buildroot@lists.busybox.net>; Mon, 13 Mar 2023 08:17:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD7BD81322
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M5ZSQspOpwDj for <buildroot@lists.busybox.net>;
 Mon, 13 Mar 2023 08:17:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC6A681338
Received: from mail.3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EC6A681338
 for <buildroot@buildroot.org>; Mon, 13 Mar 2023 08:17:14 +0000 (UTC)
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.3ffe.de (Postfix) with ESMTPSA id 4978115A7;
 Mon, 13 Mar 2023 09:17:12 +0100 (CET)
To: buildroot@buildroot.org
Date: Mon, 13 Mar 2023 09:15:48 +0100
Message-Id: <20230313081549.493823-2-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230313081549.493823-1-michael@walle.cc>
References: <20230313081549.493823-1-michael@walle.cc>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=walle.cc; s=mail2022082101; t=1678695432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oksPfofBTl31lGVMA+wnlip5lKG03oVd4EnXTH7o01M=;
 b=qwaYHAdmvz1dsxO1eqhTfrbfLSoUmBJGoMfW0Fri/4YL5ffDgpmGN1zTSpxcpD3oxra7CG
 q/2dB5K8xZj3PSrufJP54S2l8s7xPmsVFbm/S2glYCr3MEs0UJ98PzgP3i7nxDpscws5cc
 tSTwvpZ5c9wVxdSVKfq3Ck+3m1mCDYvVvuab2twD7CDtAeGfZmpUTffxThUBiNotRhwmDd
 OI1yirQs0kkdqqt/qs55WLes+xt9GMRWNKoOuVKXHRkC5qxD4XSy7P5tLO7eB6m4X5YbF+
 63qs/rRkg+9hF4tJaqOYPH2u+rp0cuMikJgUrNEJ/e5EEmoN+nVvwDmjxQEGSg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=walle.cc header.i=@walle.cc
 header.a=rsa-sha256 header.s=mail2022082101 header.b=qwaYHAdm
Subject: [Buildroot] [PATCH RESEND 1/2] package/urandom-scripts: move to new
 package busybox-initscripts
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
From: Michael Walle via buildroot <buildroot@buildroot.org>
Reply-To: Michael Walle <michael@walle.cc>
Cc: Michael Walle <michael@walle.cc>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As a preparation to add new initscripts, rename the urandom-scripts
package to a more generic one and prepare the package to support more
than one initscript. This way we don't need one package per initscript.

Individual initscripts are chosen as a configuration option of the
package.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 Config.in.legacy                                | 11 +++++++++++
 package/Config.in                               |  2 +-
 package/buildroot-initscripts/Config.in         | 17 +++++++++++++++++
 .../S20seedrng                                  |  0
 .../buildroot-initscripts.mk                    | 16 ++++++++++++++++
 package/urandom-scripts/Config.in               |  7 -------
 package/urandom-scripts/urandom-scripts.mk      | 12 ------------
 7 files changed, 45 insertions(+), 20 deletions(-)
 create mode 100644 package/buildroot-initscripts/Config.in
 rename package/{urandom-scripts => buildroot-initscripts}/S20seedrng (100%)
 create mode 100644 package/buildroot-initscripts/buildroot-initscripts.mk
 delete mode 100644 package/urandom-scripts/Config.in
 delete mode 100644 package/urandom-scripts/urandom-scripts.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 7f69462f2e..d82bd0f1f8 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -144,6 +144,17 @@ endif
 
 ###############################################################################
 
+comment "Legacy options removed in 2023.05"
+
+config BR2_PACKAGE_URANDOM_SCRIPTS
+	bool "urandom-initscripts package was renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_BUILDROOT_INITSCRIPTS
+	select BR2_PACKAGE_BUILDROOT_INITSCRIPTS_URANDOM
+	help
+	  Package urandom-scripts was moved as option to
+	  package buildroot-initscripts.
+
 comment "Legacy options removed in 2023.02"
 
 config BR2_KERNEL_HEADERS_6_0
diff --git a/package/Config.in b/package/Config.in
index 7c32305129..df618c48cb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2570,7 +2570,6 @@ menu "Security"
 	source "package/selinux-python/Config.in"
 	source "package/semodule-utils/Config.in"
 	source "package/setools/Config.in"
-	source "package/urandom-scripts/Config.in"
 endmenu
 
 menu "Shell and utilities"
@@ -2626,6 +2625,7 @@ menu "System tools"
 	source "package/audit/Config.in"
 	source "package/balena-engine/Config.in"
 	source "package/bubblewrap/Config.in"
+	source "package/buildroot-initscripts/Config.in"
 	source "package/cgroupfs-mount/Config.in"
 	source "package/circus/Config.in"
 	source "package/containerd/Config.in"
diff --git a/package/buildroot-initscripts/Config.in b/package/buildroot-initscripts/Config.in
new file mode 100644
index 0000000000..8e84e975fa
--- /dev/null
+++ b/package/buildroot-initscripts/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_BUILDROOT_INITSCRIPTS
+	bool "buildroot-initscripts"
+	default y if BR2_PACKAGE_INITSCRIPTS
+	depends on !BR2_PACKAGE_SYSTEMD
+	help
+	  Support for various initscripts.
+
+if BR2_PACKAGE_BUILDROOT_INITSCRIPTS
+
+config BR2_PACKAGE_BUILDROOT_INITSCRIPTS_URANDOM
+	bool "urandom"
+	default y if BR2_PACKAGE_INITSCRIPTS
+	depends on BR2_PACKAGE_BUSYBOX
+	help
+	  Initscript to preserve the random seed between reboots.
+
+endif
diff --git a/package/urandom-scripts/S20seedrng b/package/buildroot-initscripts/S20seedrng
similarity index 100%
rename from package/urandom-scripts/S20seedrng
rename to package/buildroot-initscripts/S20seedrng
diff --git a/package/buildroot-initscripts/buildroot-initscripts.mk b/package/buildroot-initscripts/buildroot-initscripts.mk
new file mode 100644
index 0000000000..098113bcbd
--- /dev/null
+++ b/package/buildroot-initscripts/buildroot-initscripts.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# buildroot-initscripts
+#
+################################################################################
+
+BUILDROOT_INITSCRIPTS_SCRIPTS_$(BR2_PACKAGE_BUILDROOT_INITSCRIPTS_URANDOM) += S20seedrng
+
+define BUILDROOT_INITSCRIPTS_INSTALL_INIT_SYSV
+	for i in $(BUILDROOT_INITSCRIPTS_SCRIPTS_y); do \
+		$(INSTALL) -D -m 0755 $(BUILDROOT_INITSCRIPTS_PKGDIR)/$$i \
+			$(TARGET_DIR)/etc/init.d/$$i || exit 1; \
+	done
+endef
+
+$(eval $(generic-package))
diff --git a/package/urandom-scripts/Config.in b/package/urandom-scripts/Config.in
deleted file mode 100644
index 6b4a609f95..0000000000
--- a/package/urandom-scripts/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_URANDOM_SCRIPTS
-	bool "urandom-initscripts"
-	default y if BR2_PACKAGE_INITSCRIPTS
-	depends on BR2_PACKAGE_BUSYBOX
-	depends on !BR2_PACKAGE_SYSTEMD
-	help
-	  Initscript to preserve the random seed between reboots.
diff --git a/package/urandom-scripts/urandom-scripts.mk b/package/urandom-scripts/urandom-scripts.mk
deleted file mode 100644
index 32f3e09343..0000000000
--- a/package/urandom-scripts/urandom-scripts.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# urandom-scripts
-#
-################################################################################
-
-define URANDOM_SCRIPTS_INSTALL_INIT_SYSV
-	$(INSTALL) -D -m 0755 $(URANDOM_SCRIPTS_PKGDIR)/S20seedrng \
-		$(TARGET_DIR)/etc/init.d/S20seedrng
-endef
-
-$(eval $(generic-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

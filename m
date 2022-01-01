Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C50DC433F5
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 22:40:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E79EB40288;
	Sat,  1 Jan 2022 22:40:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id agm2pCWkWrMC; Sat,  1 Jan 2022 22:40:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F6F6402C4;
	Sat,  1 Jan 2022 22:40:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D877D1BF32D
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 22:40:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D4EDF60DA5
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 22:40:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zDKdMIpPMjQ1 for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 22:40:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from majs.cnackers.org (vps-1525-1.tilaa.nl [46.19.33.97])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B13260D9D
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 22:40:10 +0000 (UTC)
Received: from majs.cnackers.org (localhost [127.0.0.1]) by majs.cnackers.org
 (Postfix) with ESMTPA id 73D0D10253
From: Erik Larsson <who+buildroot@cnackers.org>
To: buildroot@buildroot.org
Date: Sat,  1 Jan 2022 23:39:00 +0100
Message-Id: <20220101223900.2970405-3-who+buildroot@cnackers.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220101223900.2970405-1-who+buildroot@cnackers.org>
References: <20220101223900.2970405-1-who+buildroot@cnackers.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/3] package/tpm2-tools: add option for enabling
 FAPI tools
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
Cc: Erik Larsson <who+buildroot@cnackers.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Erik Larsson <who+buildroot@cnackers.org>
---
 package/tpm2-tools/Config.in     | 11 +++++++++++
 package/tpm2-tools/tpm2-tools.mk |  6 ++++++
 2 files changed, 17 insertions(+)

diff --git a/package/tpm2-tools/Config.in b/package/tpm2-tools/Config.in
index 1a6698570a..cb3eb2b0a5 100644
--- a/package/tpm2-tools/Config.in
+++ b/package/tpm2-tools/Config.in
@@ -21,6 +21,17 @@ config BR2_PACKAGE_TPM2_TOOLS
 
 	  https://github.com/tpm2-software/tpm2-tools
 
+if BR2_PACKAGE_TPM2_TOOLS
+
+config BR2_PACKAGE_TPM2_TOOLS_FAPI
+	bool "tpm2-tools fapi support"
+	select BR2_PACKAGE_TPM2_TSS_FAPI
+	help
+	  This option enables Feature API (FAPI) support in tpm2-tools.
+	  The FAPI tools are prefixed with tss2_.
+
+endif
+
 comment "tpm2-tools needs a glibc or musl toolchain w/ dynamic library, wchar"
 	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR || \
 		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
diff --git a/package/tpm2-tools/tpm2-tools.mk b/package/tpm2-tools/tpm2-tools.mk
index df5fbbfff4..6894be195f 100644
--- a/package/tpm2-tools/tpm2-tools.mk
+++ b/package/tpm2-tools/tpm2-tools.mk
@@ -22,4 +22,10 @@ TPM2_TOOLS_CONF_OPTS = --disable-hardening
 # do not build man pages
 TPM2_TOOLS_CONF_ENV += ac_cv_prog_PANDOC=''
 
+ifeq ($(BR2_PACKAGE_TPM2_TOOLS_FAPI),y)
+TPM2_TOOLS_CONF_OPTS += --enable-fapi
+else
+TPM2_TOOLS_CONF_OPTS += --disable-fapi
+endif
+
 $(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

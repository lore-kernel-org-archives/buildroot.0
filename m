Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B940EC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 12:47:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A1C740AEA;
	Sat, 23 Jul 2022 12:47:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A1C740AEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wJOSWIqqh1fN; Sat, 23 Jul 2022 12:47:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 75EA540AED;
	Sat, 23 Jul 2022 12:47:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75EA540AED
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6A5A81BF36E
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 12:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E4BC60FDD
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 12:47:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E4BC60FDD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E1hCHn3cFuE5 for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 12:47:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 93B4F60FDB
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 12:47:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93B4F60FDB
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B2F6284353; Sat, 23 Jul 2022 12:33:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 14:47:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f81454db59a19a276ae458acd78610c9ac6c2586
X-Git-Newrev: b5c8dde84cc4380c365a29219eaddbeeb9e000ce
X-Patchwork-Hint: ignore
Message-Id: <20220723123331.B2F6284353@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tpm2-tools: add option for
 enabling FAPI tools
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b5c8dde84cc4380c365a29219eaddbeeb9e000ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Erik Larsson <who+buildroot@cnackers.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tpm2-tools/Config.in     | 12 ++++++++++++
 package/tpm2-tools/tpm2-tools.mk |  6 ++++++
 2 files changed, 18 insertions(+)

diff --git a/package/tpm2-tools/Config.in b/package/tpm2-tools/Config.in
index 1a6698570a..0dcf176dfd 100644
--- a/package/tpm2-tools/Config.in
+++ b/package/tpm2-tools/Config.in
@@ -21,6 +21,18 @@ config BR2_PACKAGE_TPM2_TOOLS
 
 	  https://github.com/tpm2-software/tpm2-tools
 
+if BR2_PACKAGE_TPM2_TOOLS
+
+config BR2_PACKAGE_TPM2_TOOLS_FAPI
+	bool "fapi tools"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	select BR2_PACKAGE_TPM2_TSS_FAPI
+	help
+	  This option enables Feature API (FAPI) support in
+	  tpm2-tools. The FAPI tools are prefixed with tss2_.
+
+endif
+
 comment "tpm2-tools needs a glibc or musl toolchain w/ dynamic library, wchar"
 	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR || \
 		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
diff --git a/package/tpm2-tools/tpm2-tools.mk b/package/tpm2-tools/tpm2-tools.mk
index 8675344805..01b029d942 100644
--- a/package/tpm2-tools/tpm2-tools.mk
+++ b/package/tpm2-tools/tpm2-tools.mk
@@ -20,4 +20,10 @@ TPM2_TOOLS_CONF_OPTS = --disable-hardening
 # do not build man pages
 TPM2_TOOLS_CONF_ENV += ac_cv_prog_PANDOC=''
 
+ifeq ($(BR2_PACKAGE_TPM2_TOOLS_FAPI),y)
+TPM2_TOOLS_CONF_OPTS += --enable-fapi
+else
+TPM2_TOOLS_CONF_OPTS += --disable-fapi
+endif
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

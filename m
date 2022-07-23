Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8478C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 15:04:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 52245404DF;
	Sat, 23 Jul 2022 15:04:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52245404DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LBzcyZFs5rVR; Sat, 23 Jul 2022 15:04:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 68AB94165C;
	Sat, 23 Jul 2022 15:04:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68AB94165C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 299711BF955
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 15:03:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 03EE34089C
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 15:03:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03EE34089C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y37mjPRtagp5 for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 15:03:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 035FA40889
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 15:03:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 035FA40889
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id E405684629; Sat, 23 Jul 2022 14:49:50 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 17:00:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a15769bab4cb8b40b758fc6b3a6a409d6c947217
X-Git-Newrev: d0dcc62c4ba00aaeaa836af7bc788c183fdd6828
X-Patchwork-Hint: ignore
Message-Id: <20220723144950.E405684629@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wolftpm: Add config options for
 TPM 2.0 extra capabilities
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d0dcc62c4ba00aaeaa836af7bc788c183fdd6828
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some TPM 2.0 chips offer extra capabilities. This patch adds additional
configuration options to the wolftpm package, so such capabilities can
be available to the user. For example, the STMicroelectronics ST33 and
Nuvoton NPCT750 both offer secure GPIO. Due to chip differences, wolfTPM
requires explicit configuration options to enable the extra capabilities.

Signed-off-by: Dimitar Tomov <dimi@tpm.dev>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/wolftpm/Config.in  | 12 ++++++++++++
 package/wolftpm/wolftpm.mk | 12 ++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/package/wolftpm/Config.in b/package/wolftpm/Config.in
index 0b964c3d7e..7ebb253857 100644
--- a/package/wolftpm/Config.in
+++ b/package/wolftpm/Config.in
@@ -23,6 +23,18 @@ config BR2_PACKAGE_WOLFTPM_WOLFCRYPT
 	  encryption. Disabling this option is not recommended as it
 	  could create a security breach in most environments.
 
+config BR2_PACKAGE_WOLFTPM_ST33
+	bool "ST33 extra functionality"
+	help
+	  Enable support of TPM 2.0 extra functionality offered by the
+	  STMicroelectronics ST33 chip.
+
+config BR2_PACKAGE_WOLFTPM_NUVOTON
+	bool "NPCT750 extra functionality"
+	help
+	  Enable support of TPM 2.0 extra functionality offered by the
+	  Nuvoton NPCT750 chip.
+
 comment "wolfCrypt hooks need a toolchain w/ threads, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 
diff --git a/package/wolftpm/wolftpm.mk b/package/wolftpm/wolftpm.mk
index c5ebeca18e..d3f693a62e 100644
--- a/package/wolftpm/wolftpm.mk
+++ b/package/wolftpm/wolftpm.mk
@@ -35,4 +35,16 @@ else
 WOLFTPM_CONF_OPTS += --disable-wolfcrypt
 endif
 
+ifeq ($(BR2_PACKAGE_WOLFTPM_ST33),y)
+WOLFTPM_CONF_OPTS += --enable-st33
+else
+WOLFTPM_CONF_OPTS += --disable-st33
+endif
+
+ifeq ($(BR2_PACKAGE_WOLFTPM_NPCT750),y)
+WOLFTPM_CONF_OPTS += --enable-nuvoton
+else
+WOLFTPM_CONF_OPTS += --disable-nuvoton
+endif
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

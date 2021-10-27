Return-Path: <SRS0=x9kH=PP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65E98C433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 20:32:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 286E160EB4
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 20:32:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 286E160EB4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DBFA0400FE;
	Wed, 27 Oct 2021 20:32:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cj0HDYQcumzI; Wed, 27 Oct 2021 20:32:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E58DB40445;
	Wed, 27 Oct 2021 20:32:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0492A1BF3EB
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 20:30:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6FC3840449
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 20:30:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id udkiXOHeQ7vd for <buildroot@lists.busybox.net>;
 Wed, 27 Oct 2021 20:30:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 738044044F
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 20:30:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 307CB89042; Wed, 27 Oct 2021 20:27:04 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 27 Oct 2021 22:28:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e0188da2493063e42844b741f0b3cb68905cada2
X-Git-Newrev: 18afa41de48c5558bc2025c6cfe7674ce3cbc1e1
X-Patchwork-Hint: ignore
Message-Id: <20211027202704.307CB89042@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/optee-client: remove dependency on
 BR2_STATIC_LIBS
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

commit: https://git.buildroot.net/buildroot/commit/?id=18afa41de48c5558bc2025c6cfe7674ce3cbc1e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Restore support for BR2_STATIC_LIBS in optee-client, removed by
[1] to overcome an issue introduced in OP-TEE 3.13.0 that mandates
support for shared libraries.

As OP-TEE expects to be functional on OSes without dynamic shared
library support, change [2] was merged in OP-TEE tag 3.15.0 to fix the
initial issue introducing new configuration switch CFG_TEE_SUPP_PLUGIN.
When disabled, optee-client plugin support is not embedded and
optee-client can built with static libraries support only.

Link: [1] commit 321a850bc734 ("package/optee-client: add dependency on !BR2_STATIC_LIBS")
Link: [2] https://github.com/OP-TEE/optee_client/commit/f59114370f267f0b3341870b6cf1e1c88d184b3f
Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/optee-client/Config.in       | 12 +++++++++---
 package/optee-client/optee-client.mk |  6 ++++++
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/package/optee-client/Config.in b/package/optee-client/Config.in
index 2765f49308..e774d70484 100644
--- a/package/optee-client/Config.in
+++ b/package/optee-client/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_OPTEE_CLIENT
 	bool "optee-client"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_STATIC_LIBS # dlfcn.h
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3 # MMC_IOC_MULTI_CMD
 	help
 	  Enable the OP-TEE client package that brings non-secure
@@ -25,8 +24,15 @@ config BR2_PACKAGE_OPTEE_CLIENT_TEE_FS_PATH
 	  normal world OS providing the actual storage via
 	  tee-supplicant.
 
+config BR2_PACKAGE_OPTEE_CLIENT_SUPP_PLUGINS
+	bool "Enable TEE supplicant plugins"
+	default y
+	depends on !BR2_STATIC_LIBS # dlfcn.h
+	help
+	  Enable TEE supplicant plugin support.
+
 endif
 
-comment "optee-client needs a toolchain w/ threads, dynamic library, headers >= 4.3"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
+comment "optee-client needs a toolchain w/ threads, headers >= 4.3"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3
diff --git a/package/optee-client/optee-client.mk b/package/optee-client/optee-client.mk
index 20147c89a8..9a73a8a761 100644
--- a/package/optee-client/optee-client.mk
+++ b/package/optee-client/optee-client.mk
@@ -14,6 +14,12 @@ OPTEE_CLIENT_CONF_OPTS = \
 	-DCFG_TEE_FS_PARENT_PATH=$(BR2_PACKAGE_OPTEE_CLIENT_TEE_FS_PATH) \
 	-DCFG_WERROR=OFF
 
+ifeq ($(BR2_PACKAGE_OPTEE_CLIENT_SUPP_PLUGINS),y)
+OPTEE_CLIENT_CONF_OPTS += -DCFG_TEE_SUPP_PLUGINS=ON
+else
+OPTEE_CLIENT_CONF_OPTS += -DCFG_TEE_SUPP_PLUGINS=OFF
+endif
+
 define OPTEE_CLIENT_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D $(OPTEE_CLIENT_PKGDIR)/S30optee \
 		$(TARGET_DIR)/etc/init.d/S30optee
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

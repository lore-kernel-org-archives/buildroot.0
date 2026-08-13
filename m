Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3493FC5DF64
	for <buildroot@archiver.kernel.org>; Thu, 13 Aug 2026 14:34:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDD2E409B4;
	Thu, 13 Aug 2026 14:34:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hGJwWPbfmd_4; Thu, 13 Aug 2026 14:34:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC4B8409B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786631687;
	bh=Xc0qd1KHXV37UVdlnGWsxLGwVvFzpPzEJ2KxNApxlfc=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=pe2M8eFGG6XyK9eAbCaeIgkMrN/wOKhfnwWnbqy6miwAzFKlTbl7uF3O1gP+STVdj
	 NjAH5bUbYhEgzeh5x7TUMDStDEmtGitkFWqonMS1D0HCAHNk9greQ2o0djb4JDNKu+
	 HPj13VvIlfgQlygNLIJieV4Vfdcy+zJepZs0FQ2v/aup77RU/HUVYsfEYEeZ8x5bZn
	 f3nXLj7CUKmdvQ6pLgPyluvTX1ZlaaTQIOQQRnXPEkKQap5C+LNAumE4iKG3Ne8AiQ
	 eFd/lMA5LUr5llpW0pAjEfQaRyLemUhMPiYZVC82swr0m4ARxzaOc4ZUceN1eG6498
	 2jVSxK29hKWKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC4B8409B9;
	Thu, 13 Aug 2026 14:34:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 24A61EC
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 14:34:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 16A8D8127A
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 14:34:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7zbN5kEBAGEq for <buildroot@buildroot.org>;
 Thu, 13 Aug 2026 14:34:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A788D81236
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A788D81236
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A788D81236
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 14:34:44 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M59GG-1wtQ3F1KJY-00Fhaj; Thu, 13
 Aug 2026 16:34:37 +0200
To: buildroot@buildroot.org
Date: Thu, 13 Aug 2026 16:34:05 +0200
Message-ID: <20260813143405.2868517-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813143405.2868517-1-fiona.klute@gmx.de>
References: <20260813143405.2868517-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:yoaoXXoyHQJSDyJb0cXVwYkPxd+9iaiSn94QdNILF0Zzr7S3ZB5
 O3l29/X5oov+MBwTiamiD2MLiz+V7yrHf7zIkxFJNt2Y/Hm+pG4ei5vKGGU9vzWTTSfZJWu
 fZhUfUQf3HRJEWbWsSPjZlidVbAoRADf9+uoQAGfg333a331F8OWnzwT9yBB2VpqNsZllS8
 aLsNkcP8FNiXmgzJOko1g==
UI-OutboundReport: notjunk:1;M01:P0:XKGRZgr75bQ=;P2Lx6rYxoPCumwgqyG1pW1SRwH9
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1786631677; x=1787236477; i=fiona.klute@gmx.de;
 bh=DAUdS2B183HPEegFoEN0AcRQHTf+Qd5YIVmJB1OBVDI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=nq05UJAuO/tBWdURs7EQEt6n7ooxkrGF/OLVkKguaM6PpsnTrfxVMgZsPybq3P88
 Pga/LWPBZt/hDyv4J/HAfXnhYKtIoOjG44aUkF4iWP+SNj1Mz6jXHOLcINCcpH1Ma
 TSOf9LLP06X31qpj5XDmfeKAC+70+oOs5xZq6rQjtU02iJTsJZKpMT5gSSBlYiLho
 dsORcV7uV+ZQO+WB1wgLrrwRrBafqq81EPTuuCPTV5ODf/pSDF3/uy7Mx8Cs4P3FT
 M8OuWQ+GJeZohsoyLYePUPrwP6nXhP+xC7opU39h6IAbHfYLzl29rqFv2q0Kdftku
 Ytnn8fJP6K/2NatNxg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=nq05UJAu
Subject: [Buildroot] [PATCH 3/3] package/dracut: add subpackage for
 dracut-util
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thierry Bultel <tbultel@free.fr>,
 "Fiona Klute \(Othermo GmbH\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (Othermo GmbH)" <fiona.klute@gmx.de>

dracut-util is a small executable that provides dracut-getarg{,s}
commands for scripts in the initramfs. As such it must be built and
installed for the target so it is available when building the
initramfs.

The reason to create a subpackage instead of adding a target build for
package/dracut is to avoid a conflict in case someone needs "full"
dracut on the target in the future (to build an initramfs on the
target system, outside the Buildroot build). Also using ./configure
would require a dependency on kmod, which is not needed for
dracut-util.

Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>
---
 package/Config.in                           |  1 +
 package/dracut/Config.in                    |  1 +
 package/dracut/Config.in.host               |  1 +
 package/dracut/dracut-util/Config.in        | 14 +++++++++++++
 package/dracut/dracut-util/dracut-util.hash |  1 +
 package/dracut/dracut-util/dracut-util.mk   | 23 +++++++++++++++++++++
 package/dracut/dracut.mk                    |  2 ++
 7 files changed, 43 insertions(+)
 create mode 100644 package/dracut/Config.in
 create mode 100644 package/dracut/dracut-util/Config.in
 create mode 120000 package/dracut/dracut-util/dracut-util.hash
 create mode 100644 package/dracut/dracut-util/dracut-util.mk

diff --git a/package/Config.in b/package/Config.in
index ce316334e1..34a848fa74 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2822,6 +2822,7 @@ menu "System tools"
 	source "package/docker-credential-acr-env/Config.in"
 	source "package/docker-credential-gcr/Config.in"
 	source "package/docker-engine/Config.in"
+	source "package/dracut/Config.in"
 	source "package/dtui/Config.in"
 	source "package/earlyoom/Config.in"
 	source "package/efibootmgr/Config.in"
diff --git a/package/dracut/Config.in b/package/dracut/Config.in
new file mode 100644
index 0000000000..496b72c105
--- /dev/null
+++ b/package/dracut/Config.in
@@ -0,0 +1 @@
+source package/dracut/dracut-util/Config.in
diff --git a/package/dracut/Config.in.host b/package/dracut/Config.in.host
index af68728457..51e428ea2f 100644
--- a/package/dracut/Config.in.host
+++ b/package/dracut/Config.in.host
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_HOST_DRACUT
 	bool
 	select BR2_PACKAGE_HOST_KMOD
+	select BR2_PACKAGE_DRACUT_UTIL # must be included in initramfs
 	help
 	  dracut-ng is used to create an initramfs image by
 	  copying tools and files from an installed system
diff --git a/package/dracut/dracut-util/Config.in b/package/dracut/dracut-util/Config.in
new file mode 100644
index 0000000000..1de35bed40
--- /dev/null
+++ b/package/dracut/dracut-util/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_DRACUT_UTIL
+	bool
+	help
+	  dracut-ng is used to create an initramfs image by
+	  copying tools and files from an installed system
+	  and combining it with the dracut framework.
+	  dracut-ng is a drop-in replacement for the legacy
+	  dracut project.
+
+	  This package installs only the dracut-util executable, which
+	  is needed by many of the Dracut scripts installed into the
+	  initramfs.
+
+	  https://dracut-ng.github.io/dracut/
diff --git a/package/dracut/dracut-util/dracut-util.hash b/package/dracut/dracut-util/dracut-util.hash
new file mode 120000
index 0000000000..22e15cf0aa
--- /dev/null
+++ b/package/dracut/dracut-util/dracut-util.hash
@@ -0,0 +1 @@
+../dracut.hash
\ No newline at end of file
diff --git a/package/dracut/dracut-util/dracut-util.mk b/package/dracut/dracut-util/dracut-util.mk
new file mode 100644
index 0000000000..e14e6bc5ad
--- /dev/null
+++ b/package/dracut/dracut-util/dracut-util.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# dracut-util
+#
+################################################################################
+
+# The following assignments work only because dracut.mk is included
+# before this file is.
+DRACUT_UTIL_VERSION = $(DRACUT_VERSION)
+DRACUT_UTIL_SITE = $(DRACUT_SITE)
+DRACUT_UTIL_LICENSE = $(DRACUT_LICENSE)
+DRACUT_UTIL_LICENSE_FILES = $(DRACUT_LICENSE_FILES)
+
+# share the dracut archive, build only src/util
+DRACUT_UTIL_SOURCE = dracut-$(DRACUT_VERSION).tar.gz
+DRACUT_UTIL_DL_SUBDIR = dracut
+DRACUT_UTIL_SUBDIR = src/util
+
+define DRACUT_UTIL_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/src/util/dracut-util $(TARGET_DIR)/usr/bin/dracut-util
+endef
+
+$(eval $(cmake-package))
diff --git a/package/dracut/dracut.mk b/package/dracut/dracut.mk
index 0bf755319e..6844ac0b65 100644
--- a/package/dracut/dracut.mk
+++ b/package/dracut/dracut.mk
@@ -51,3 +51,5 @@ HOST_DRACUT_POST_INSTALL_HOOKS += HOST_DRACUT_POST_INSTALL_BUSYBOX_INIT_MODULE
 endif
 
 $(eval $(host-autotools-package))
+
+include package/dracut/dracut-util/dracut-util.mk
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

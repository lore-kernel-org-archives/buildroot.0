Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 876EBCD5BA2
	for <buildroot@archiver.kernel.org>; Thu,  5 Sep 2024 09:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E14260675;
	Thu,  5 Sep 2024 09:55:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bVgVt5NWQqtD; Thu,  5 Sep 2024 09:55:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52C1560A3C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52C1560A3C;
	Thu,  5 Sep 2024 09:55:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E21D41BF20B
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 09:55:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF881404F8
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 09:55:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cZ5BUDwWlwva for <buildroot@lists.busybox.net>;
 Thu,  5 Sep 2024 09:55:15 +0000 (UTC)
X-Greylist: delayed 371 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 05 Sep 2024 09:55:14 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E3E7340267
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3E7340267
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=188.165.44.123;
 helo=mail1.insia.net; envelope-from=guillaume.chaye@zeetim.com;
 receiver=<UNKNOWN> 
Received: from mail1.insia.net (mail1.insia.net [188.165.44.123])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E3E7340267
 for <buildroot@buildroot.org>; Thu,  5 Sep 2024 09:55:14 +0000 (UTC)
Received: from smtp.insia.net (unknown [192.168.1.24])
 by mail1.insia.net (Postfix) with ESMTP id DDE5D3F82C;
 Thu,  5 Sep 2024 11:48:56 +0200 (CEST)
Received: from sb-dev-build.insia.net. (gw-servers.insia.net [192.168.1.1])
 by smtp.insia.net (Postfix) with ESMTP id CFDE55F497;
 Thu,  5 Sep 2024 11:45:26 +0200 (CEST)
From: "Guillaume GC. Chaye" <guillaume.chaye@zeetim.com>
To: buildroot@buildroot.org
Date: Thu,  5 Sep 2024 11:48:28 +0200
Message-Id: <20240905094828.1313494-2-guillaume.chaye@zeetim.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240905094828.1313494-1-guillaume.chaye@zeetim.com>
References: <20240905094828.1313494-1-guillaume.chaye@zeetim.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=zeetim.com; s=mail1; t=1725529736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LrjXR25JcEVZImpYFb3hsEwLUjMhvgYBg+ENajmRYl4=;
 b=f/hUByiZ+d7xxFAZhGmaZ8f77VxxyVbzT85QndQuC9qGqQjQHGlcOjyaovNCm4y4cSHAGO
 s7ye/kPx1k/J0sAXdjb68rCiKJQ8i24r0PI2XrISAXn8gtczyiQCsuOI8tlTmIv8VT8SJm
 es9ZoJf/xvdlYmy5BzIafIAoptyhV13Eq8uy+BUAhacnByM+Arxx4UcoSx1ZWpQ65cWTIp
 lLhA6/sMr8gcy6VCCiJ1r6XNw7qoeBVkMdeSqnohagnSRsDCsv5Iv/opcLDr3MspstUcVu
 K/vIwuxBYz5GsErOf5YvmJAu+/jWYNCp7LBhK0hTYdZzf9GAuI+L4Z0vt1R1ig==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=zeetim.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=zeetim.com header.i=@zeetim.com header.a=rsa-sha256
 header.s=mail1 header.b=f/hUByiZ
Subject: [Buildroot] [PATCH 2/2] package/systemd: add efi support option
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
Cc: Christopher McCrory <chrismcc@gmail.com>, Sen Hastings <sen@hastings.org>,
 Norbert Lange <nolange79@gmail.com>,
 "Guillaume GC. Chaye" <guillaume.chaye@zeetim.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We need to compile systemd with -Defi=true flag to mount automatically efivarfs in /sys/firmware/efi/efivars

Signed-off-by: Guillaume GC. Chaye <guillaume.chaye@zeetim.com>
---
 package/systemd/Config.in  | 3 +++
 package/systemd/systemd.mk | 7 ++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 345f08590e..d1ca6e7f85 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -161,6 +161,9 @@ config BR2_PACKAGE_SYSTEMD_BOOT_EFI_ARCH
 	default "x64"   if BR2_x86_64
 	depends on BR2_PACKAGE_SYSTEMD_BOOT
 
+config BR2_PACKAGE_SYSTEMD_EFI
+	bool "enable EFI support"
+
 config BR2_PACKAGE_SYSTEMD_JOURNAL_REMOTE
 	bool "enable journal remote tools"
 	select BR2_PACKAGE_LIBCURL
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 5dca8681bc..7b3eabbd0d 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -660,7 +660,12 @@ define SYSTEMD_INSTALL_BOOT_FILES
 endef
 
 else
-SYSTEMD_CONF_OPTS += -Defi=false -Dbootloader=disabled
+SYSTEMD_CONF_OPTS += -Dbootloader=disabled
+ifeq ($(BR2_PACKAGE_SYSTEMD_EFI),y)
+SYSTEMD_CONF_OPTS += -Defi=true
+else
+SYSTEMD_CONF_OPTS += -Defi=false
+endif
 endif # BR2_PACKAGE_SYSTEMD_BOOT == y
 
 SYSTEMD_FALLBACK_HOSTNAME = $(call qstrip,$(BR2_TARGET_GENERIC_HOSTNAME))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

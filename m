Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17DD6E7719C
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 19:29:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBD6280F23;
	Sat, 11 Jan 2025 19:29:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YzA4R6Ws60ls; Sat, 11 Jan 2025 19:29:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D295580F15
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D295580F15;
	Sat, 11 Jan 2025 19:29:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 40897942
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 19:29:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0DFF560727
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 19:29:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TwUTNOcVh2xL for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 19:29:23 +0000 (UTC)
X-Greylist: delayed 902 seconds by postgrey-1.37 at util1.osuosl.org;
 Sat, 11 Jan 2025 19:29:22 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EC9A66070C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC9A66070C
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.143.188.15;
 helo=sender4-op-o15.zoho.com; envelope-from=dev@matt-silva.com;
 receiver=<UNKNOWN> 
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EC9A66070C
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 19:29:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1736622846; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=dwKoCpb5EJcdMoBJFn6SpEYA8FpyneX9OElKr6+b0jiolIRbZSe2vlwPP3xXgO+F/Ijxbmvy0L4OoxqypRVsAEnSCPgU8B9e9l9PQDUXWAa8UUq5Qn1CpO/nz7RT4I4vrPNDvdmus0gSbbMlnds355GRqpbNV/ZluufzxcRkIX4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1736622846;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=TMG5RIJDRGYB7knCtjaKlsIXWyMB/x5EDpDHiaEKCk4=; 
 b=bsoH9T+iSqgCsZJGJN95I1EhHW5OEer54GlDK1D2R18EX3A9GKVepoBj8mjO1FZkY2QhGnWhdxI6KlMniPP4rEf8tRCq9XmLZ7SuYVmnSSyFKYml2QjmsXpS/J92PpeY4CGpNaCNH4iVWRKnODP/uvJEpXG2LhHANaObT36js8s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=matt-silva.com;
 spf=pass  smtp.mailfrom=dev@matt-silva.com;
 dmarc=pass header.from=<dev@matt-silva.com>
Received: by mx.zohomail.com with SMTPS id 1736622844141762.3957552504522;
 Sat, 11 Jan 2025 11:14:04 -0800 (PST)
From: Matt Silva <dev@matt-silva.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Matt Silva <dev@matt-silva.com>
Date: Sat, 11 Jan 2025 14:13:24 -0500
Message-ID: <20250111191324.4615-1-dev@matt-silva.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-ZohoMailClient: External
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; t=1736622845; 
 s=zoho; d=matt-silva.com; i=dev@matt-silva.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=TMG5RIJDRGYB7knCtjaKlsIXWyMB/x5EDpDHiaEKCk4=;
 b=cjIv9NwSmvPbDKEsuQJsyFHUNAzJcG/yr9hMt5vwIMolEfkJqlpa2MUMywk2e0bD
 zPFKXl1mXwqL6NPQ2kr0Xfn0CKTqiUA6S5Lzuwb6uLOF8YcasAMq8Vtc7WjF5F02UQf
 cvoZ+rEF3lmlmkoTakZMgGHQu4rur3jEghdChLgY=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=matt-silva.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=matt-silva.com header.i=dev@matt-silva.com
 header.a=rsa-sha256 header.s=zoho header.b=cjIv9NwS
Subject: [Buildroot] [PATCH 1/1] boot/grub2: Add disable shim lock config
 option
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

When using Secure Boot without SHIM, grub2 can run into issues where it
is expecting SHIM to be present, resulting in a "shim_lock protocol not
found" error. This can be fixed by passing the `--disable-shim-lock`
flag to `grub-mkimage`.

See https://www.gnu.org/software/grub/manual/grub/html_node/UEFI-secure-boot-and-shim.html

Signed-off-by: Matt Silva <dev@matt-silva.com>
---
 boot/grub2/Config.in | 6 ++++++
 boot/grub2/grub2.mk  | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/boot/grub2/Config.in b/boot/grub2/Config.in
index e1f2fc105e..44dcbae881 100644
--- a/boot/grub2/Config.in
+++ b/boot/grub2/Config.in
@@ -160,6 +160,12 @@ config BR2_TARGET_GRUB2_BUILTIN_CONFIG_EFI
 	  device and other configuration parameters, but however menu
 	  entries cannot be described in this embedded configuration.
 
+config BR2_TARGET_GRUB2_DISABLE_SHIM_LOCK
+	bool "disable shim lock"
+	depends on !BR2_TARGET_SHIM
+	help
+	  Disable shim lock verifier
+
 endif # BR2_TARGET_GRUB2_HAS_EFI_BOOT
 
 config BR2_TARGET_GRUB2_INSTALL_TOOLS
diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index 0896029322..1bb9904686 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -183,6 +183,8 @@ define GRUB2_INSTALL_IMAGES_CMDS
 			-p "$(GRUB2_PREFIX_$(tuple))" \
 			$(if $(GRUB2_BUILTIN_CONFIG_$(tuple)), \
 				-c $(GRUB2_BUILTIN_CONFIG_$(tuple))) \
+			$(if $(BR2_TARGET_GRUB2_DISABLE_SHIM_LOCK), \
+				--disable-shim-lock) \
 			$(GRUB2_BUILTIN_MODULES_$(tuple))
 		$(INSTALL) -D -m 0644 boot/grub2/grub.cfg $(GRUB2_CFG_$(tuple))
 		$(if $(findstring $(GRUB2_PLATFORM_$(tuple)), pc), \
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

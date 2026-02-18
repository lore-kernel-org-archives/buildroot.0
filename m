Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D5AE9A02C
	for <buildroot@archiver.kernel.org>; Wed, 18 Feb 2026 16:32:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C67F60902;
	Wed, 18 Feb 2026 16:32:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j-Bm9oNXUJ5e; Wed, 18 Feb 2026 16:32:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 895A3608F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771432334;
	bh=9A54JTfHYJ1FDFPtrY2CqlkFHaoBPyC4MLeue7LasIo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RhBAqjuLxVIuzgxu4xLpwimOwOCsMCrHwgbCPrhCJYETHX9dGCy0nllPk1kRNXgxr
	 dRZ5P483V3nnoPF1teNyafHWpXntl6EXSpzH0HXCl/kqIJWSMRrJY8TNMp2SiMi1L8
	 sGAdCcT+nFPuEypD7Vl5YB/YN7SWHMtJcf+69F+b9ix70jVh6S3EiOFcPCdg9WF3o3
	 IIkU4uadFJVc0owUo2BSKxTJgsFn2C1JUxQeVJgc6bJofBjcS6K8uAg6uHOJt1YlEe
	 RIf/2BAzXAPIZybCZOirqBzmOUXOHOvjZvvJOlzASXugpWsAjSGRu3ehtZVdwAYAb7
	 tpx2ROS1HmJ1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 895A3608F5;
	Wed, 18 Feb 2026 16:32:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D29235B
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 16:32:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F329340404
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 16:32:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eq987RRtqHXZ for <buildroot@buildroot.org>;
 Wed, 18 Feb 2026 16:32:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=fabien.lehoussel@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 02FB3403FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02FB3403FF
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 02FB3403FF
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 16:32:11 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4806ce0f97bso253245e9.0
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 08:32:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771432329; x=1772037129;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=yhfu+7SOv1HBwQ8AotjTeuB2yj1TsUkrRUkRFwo+8kk=;
 b=RC6K/SyTPlnu/AujgaF8BtCPKCr3wvrmZN8OBkahQ+BS1YtJpm6KXqFfczCV5Jwfpa
 vgx6sIOgZYAXmR/bHfOpLwgWhzBim9f6QN0XzFaVeJ3u8fKkPG9WJPtY4qMx7JyA9idw
 EBsSRV1Vxfmkd8uaa3CGSU5gLQz+5gAimP1gk8HhBlfAsSbgrv7OgNuSSongZl45lWMA
 rGrrfGMFGwyt46GAIlrIeyM9cgK4lPXm+VBXGmKJWNfPGobrx7YOOyJcBjunsOKPZHYi
 EIngMvmBmH3yhq2rpbfkaSEgGMDO7zusqKjPKcKbSqsdu8EwgkgOtcNOaMaMnBbQBa9O
 E1pw==
X-Gm-Message-State: AOJu0YxRskcwp/qbBHM4wrxI9uhAVVBTOfh/FmLmu9MvaUiZ44f5h/51
 ApA+1T8o6Me2t39rJ8FTAClRKfGell6BVE/iOTYuRTlzIKtRsd8L1WBuK/Tsn4aHqQm4BBLMqqr
 oUDl9
X-Gm-Gg: AZuq6aIS4CNSm6H4RgaYdzfiC11WGK4Lv7iFbeCz6WssNPn1sO/W7bvg8uZDgBr0jvj
 /OkVqoNcmx0CKWNjrFpiIytJq2w0H72QkV7gd6Gy/imP313xoI6Mhpix4iGB4PQninaLdWvPCxX
 TUYeOUcc2kLOA0SVgdHtqooc2fw7Pa4gsUjUWOMPizPgbIx8CMyfnwtFrTQp6KVq4iy7QI4pBp/
 9Egb1zgCCDstmLrfLgfriyGTMU9Tz/telFDtVBrAfFgBxmOxWzgk7KlT//DeZaaznwmnkjdPfo0
 mmW06UvVvdV1Eicf8XWE3bSllEtOBVzgn56CRsH1ksSocO2zM+xNZNMk7UFwX/6PBbHPG/nfVvk
 1xeQdQ7lc5HCY13Ji1xBS8La/rvf2FwU/mB1jM9wUSYJPJtfZVj6MFav0I3Se2CyRxBz2gkg1C6
 Dvph18ojY1GC4zokTxdV75rTBOOVtou/0idLbV9z01
X-Received: by 2002:a05:600c:1d1b:b0:47b:e2a9:2bd7 with SMTP id
 5b1f17b1804b1-48398ad716dmr39871785e9.19.1771432329240; 
 Wed, 18 Feb 2026 08:32:09 -0800 (PST)
Received: from FRSMI25-GRAVITY.. ([2a01:e0a:943:83d0:6dc6:c524:f7df:4d64])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483983e8e3dsm20677605e9.20.2026.02.18.08.32.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Feb 2026 08:32:08 -0800 (PST)
To: buildroot@buildroot.org
Cc: Fabien Lehoussel <fabien.lehoussel@smile.fr>
Date: Wed, 18 Feb 2026 17:32:03 +0100
Message-ID: <20260218163205.1639035-2-fabien.lehoussel@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260218163205.1639035-1-fabien.lehoussel@smile.fr>
References: <20260218163205.1639035-1-fabien.lehoussel@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1771432329; x=1772037129; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yhfu+7SOv1HBwQ8AotjTeuB2yj1TsUkrRUkRFwo+8kk=;
 b=VbvxbaH+/nm5kkpDAkqg0lBgRv9zqbTes979linwxKvWqp8VP7G7f/kzOYOZzmp3//
 EDDl4vYuLiAnsC8dm0HJ7kObqw9L6xWUyc3OKM2OzeyH/1ZWTtYMOBVVHZ4AvtBDnEIa
 3sH70XFHLBj4whLoynDQP5nr179WzCMP1/DIM=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=VbvxbaH+
Subject: [Buildroot] [PATCH 1/2] linux/linux.mk: add generation of
 compile_commands.json
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
From: Fabien Lehoussel via buildroot <buildroot@buildroot.org>
Reply-To: Fabien Lehoussel <fabien.lehoussel@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Enable automatic generation of compile_commands.json during the kernel
build process to facilitate security analysis and CVE filtering.

The compile_commands.json file is generated after the kernel build
using the native kernel target (available since Linux 5.3). It
contains the complete list of compiled source files with their
compilation commands and flags.

This file is copied to the binaries directory and can be used to:
- Extract the exact list of compiled kernel files
- Cross-reference with CVE databases (NVD, CNA) to filter relevant
  vulnerabilities
In the future, this information could be leveraged to:
- Map affected files to their corresponding Kconfig CONFIG_ options
- Determine which CVEs are actually applicable based on the current
  build configuration
- Provide more accurate vulnerability impact analysis

The generated file is saved as linux_compile_commands.json in the
binaries directory for use by CVE analysis tools.

Signed-off-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>
---
 linux/Config.in | 20 ++++++++++++++++++++
 linux/linux.mk  | 12 ++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index 4ed9104695..c6929a4a7c 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -519,6 +519,26 @@ config BR2_LINUX_KERNEL_INSTALL_TARGET
 	  /boot if DTBs have been generated by the kernel build
 	  process.
 
+
+config BR2_LINUX_KERNEL_COMPILE_COMMANDS
+	bool "Generate compile_commands.json file"
+	help
+	  Generate compile_commands.json during the Linux kernel build.
+	  This file contains the exact list of all compiled kernel files
+	  with the current build options/configuration in JSON format
+
+	  The generated file is copied to the binaries directory as
+	  linux_compile_commands.json and can be used for:
+	  - Static analysis and code indexing tools
+	  - Cross-referencing with CVE databases (NVD, CNA) to determine
+	    which vulnerabilities are actually applicable to the current
+	    kernel build configuration
+
+	  Note: This option requires Linux kernel 5.4 or newer.
+
+	  If unsure, say N.
+
+
 config BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL
 	bool "Needs host OpenSSL"
 	help
diff --git a/linux/linux.mk b/linux/linux.mk
index c61089bfe0..649921a87b 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -550,6 +550,18 @@ define LINUX_BUILD_CMDS
 	$(LINUX_APPEND_DTB)
 endef
 
+define LINUX_GENERATE_COMPILE_COMMANDS
+	@$(call MESSAGE,"Generating compile_commands.json")
+	$(Q)$(LINUX_MAKE_ENV) $(BR2_MAKE) $(LINUX_MAKE_FLAGS) \
+		-C $(@D) \
+		compile_commands.json
+	cp $(@D)/compile_commands.json $(BINARIES_DIR)/linux_compile_commands.json
+endef
+
+ifeq ($(BR2_LINUX_KERNEL_GENERATE_COMPILE_COMMANDS),y)
+LINUX_POST_BUILD_HOOKS += LINUX_GENERATE_COMPILE_COMMANDS
+endif
+
 ifeq ($(BR2_LINUX_KERNEL_APPENDED_DTB),y)
 # When a DTB was appended, install the potential several images with
 # appended DTBs.
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

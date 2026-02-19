Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8333CE9A04C
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 13:48:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36F2B82344;
	Thu, 19 Feb 2026 13:48:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2RYAT_tbWoBb; Thu, 19 Feb 2026 13:48:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 676B682347
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771508923;
	bh=/Tp2jR+sRPiOzgKZiox8fRPieD4D5DOTeKintcbq+Yc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SP4Wj+R2SLkk6pcizyxqZiKMmKilHu8/tSVhH+PsnWwWAkAEQKZHNEe8Pl/0awZ+F
	 CXGQPxDviPpdn9RuTstvnnS1R5tM5Xx3pRATyObJw7ty02ePkAuJ0vwXmyFtEXNlOP
	 SfPigi6rba/mrOxRl5kDtjamfOjnHEeFX9aV4BXQyyaNfKcd7NZ439g6KvCpdoE1P0
	 UPndMuVb6+jfSlzs9PZUhlHcXxqOTPdyks46w0G2wyi8K5BlJgAmxcSl0UyWwUIHwS
	 EhFx2M7zWegCvg3gsd93UMiiKNBn9JjofhiEAfM/b5dErn0pE7GxY6r5n722BxIpoV
	 NAf7nlHDhHZmA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 676B682347;
	Thu, 19 Feb 2026 13:48:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B7261CE
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 13:48:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D5114098E
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 13:48:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sJYW2j3V8wtC for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 13:48:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=fabien.lehoussel@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3C3154097A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C3154097A
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3C3154097A
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 13:48:40 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-48372efa020so7696555e9.2
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 05:48:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771508918; x=1772113718;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=R+lyYzbjth9Ii3j5AJ3O4IZ7ZYioXPS8uCPVfFZDixY=;
 b=VNnh2iiNTkEwtq/muZOfKp7OHbupK3oCEFxns0tNza4AveBDhLB0BgGpGYAa0rL94a
 fe7zfBTA0fCraXlJghz3/zmuF8reBEI/FQbW3cFAecVbXUbv58qjISnoLLC/SevIMgaM
 rI2cNR3iglxlwWypg2ApW6eAOuOPVRcS1PqqGhv/BWuoPngu9tDGYVj65tnMiRw+57He
 oAItopg3r2yIQejwQ5lZms0lppXm2TTNqYNtBal+WIw4Yu7LwkWF0KH9FBl3I+sUcOtZ
 k2locVah9mophc2hfIUluQD68PapEAV3vZnUcroiyZQWQFhlpp0BSsaipIVzr7ubNv4b
 KZqQ==
X-Gm-Message-State: AOJu0Yx3bJ3dbFLEAO8UVWOclx5eRV9JGmWQa1Fx8KYHXjdDNckgml7E
 fYmY8O3l/jl+8Ywwjee25UM1miQ+Pe/1qAwIsV0KtOYbFAG10q5jZlSWS9ttH4fB4iWpT9HyvEY
 0lu71
X-Gm-Gg: AZuq6aLAEno1kh9Xk3qFXUMND/5Qd3JGVCHbRq/U9ktBCpHYE7OxBFim+SDaj/ZQ4oA
 gWftQBTQHrWLHGv+KMSZHEUCPOu2ONwjv6rySGzwI/vMA8//NgvyDQ8tAU07maQuqkP3NRM4Nib
 oBv7WJZZpccIjunZVYzdm2eWHlHdTD92eABsiAbJwGQpC+r2mxFzLpfnNe0CUc7fTfui9YDrDDM
 cDrXZ/Af/IQ0TMW6oe/gmEcYoTJQchD5aVzjTVrc8moQlPvIFEN4V9IULECNbtFcEKlTLNucY8O
 jxmC2DFEZ0AimIlNHE8F1A3Oyyz4fCae+v7HOaCnZc0XDBchflTqthSxRgoMZgY3rc8xN0ocheS
 wW3ItZy3mInuwQBfO9TkLIo/xKQ9dj5Myt3mG2tAWbqDEXlWb/6BdD8IHDJ4x7YGE71ewOGyTgi
 BaPsTObaVti+scO/6X/bXj2qJcmBtuvjuA73F3191bv0nPbZGNQUb8Evx0eHGa1YMeh/QrPvCZN
 Oz/fNnH/kIssquvR9JsRvj9ci3idFqaZxdycZVGpA==
X-Received: by 2002:a05:600c:a09:b0:480:4d38:7abc with SMTP id
 5b1f17b1804b1-48379bbc49emr281725735e9.11.1771508917905; 
 Thu, 19 Feb 2026 05:48:37 -0800 (PST)
Received: from FRSMI25-GRAVITY.idf.intranet
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4839f97831bsm16604295e9.12.2026.02.19.05.48.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 05:48:37 -0800 (PST)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 Fabien Lehoussel <fabien.lehoussel@smile.fr>
Date: Thu, 19 Feb 2026 14:48:29 +0100
Message-ID: <20260219134834.151782-2-fabien.lehoussel@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219134834.151782-1-fabien.lehoussel@smile.fr>
References: <20260219134834.151782-1-fabien.lehoussel@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1771508918; x=1772113718; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R+lyYzbjth9Ii3j5AJ3O4IZ7ZYioXPS8uCPVfFZDixY=;
 b=ZGfFH/qRKuj+Man+nrhvJG12MOaW2d7u+2YGGLcZXF7Lg5GCX2+IrdgzhTvMhmQLni
 wHvWYTpM6YexZvW7kUmWTVOJa5mKOE2ohXU6RG5bfX0tDho4XZc/30xfY5MjaHCB16AH
 7ABCgVkl850BIO1caPAP6xqnMLGVTy2IpogrE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=ZGfFH/qR
Subject: [Buildroot] [PATCH v2 1/2] linux/linux.mk: add generation of
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
using the native kernel target (available since Linux 5.4). It
contains the complete list of compiled source files with their
compilation commands and flags.

The generated file is saved as linux_compile_commands.json in the
binaries directory and can be used to:
- Extract the exact list of compiled kernel files
- Cross-reference with CVE databases (NVD, CNA) to filter relevant
  vulnerabilities

In the future, this information could be leveraged to:
- Map affected files to their corresponding Kconfig CONFIG_ options
- Determine which CVEs are actually applicable based on the current
  build configuration
- Provide more accurate vulnerability impact analysis

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

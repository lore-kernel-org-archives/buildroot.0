Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E0E7F4BB9A
	for <buildroot@archiver.kernel.org>; Wed, 25 Feb 2026 10:57:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 348F660DE6;
	Wed, 25 Feb 2026 10:57:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9N0ffi8lOjqK; Wed, 25 Feb 2026 10:57:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4515960FD1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772017036;
	bh=P+EjR0RmZDHMlPsDTZNNQ0OyZO0J6TPO+cGnKu44D9Q=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Rym+uGPlYtb5Y2gP2Tw20eMeKsNyIYifI/137l6WMkHLACQKjqJaOguNuMHtidF0o
	 Su8lEpaOxRQmhHKpJUwIu1kw9XmzbJhrmzLzJ4nUvf6+gCvpCCux+DVjheRtSuDS7P
	 3OLRgvNy6jmnPL459CzDYRjNkWWNQclg1yj9rnHn6SzjgSnmJkV/809Vx3AwEgjhS+
	 jMUXNJDvyD3f/zdulHdmo/QUsXGWRfhwdMegyTBlw0dyrrbDGGXMEWGIURrOeL3BNf
	 7codtv9Jdvw6joSLUtrCcxm6x1AJQAGIdD0K9UvpsxxsoVvtPKJDuQFFa4A91oVqMa
	 dYlBL6e91Fljg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4515960FD1;
	Wed, 25 Feb 2026 10:57:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2563E1B8
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 10:57:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1702C80E4D
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 10:57:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nbd24D4Iabks for <buildroot@buildroot.org>;
 Wed, 25 Feb 2026 10:57:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=fabien.lehoussel@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1F853822DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F853822DA
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1F853822DA
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 10:57:12 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-43989bd056bso672541f8f.1
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 02:57:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772017031; x=1772621831;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MDNQ806iXC1z5eCA46YG2AVLi/X796vlrGVIN2aSz8o=;
 b=vR7XdIV/BlX3jk0cjVMQC4ZlC/KaZo2KsSvQnpUOYshxEaQ6OyWYWJvsLkDQJYFdhN
 vEtV5GJ1g2qep2/pPnybdDrTliPnOQ3w/FODYXK6ENVpRAb3JvZSWIOlHyqS7knoRMAw
 gUHzesKfBp5Abvk3Y4VnmQO+0ABTJ5tH4/vB34iDXJeZLQjFhNWjwgYsE8t1Wq/iloGi
 P5oR5RFBQYCHRaczTtey8GKfbIGEfNF/OUfFf1hEor/mcwTGD5eJirqj13uAZVl6XcPH
 L0BnywAoWr9TRAqMDVDs55jTHYi278eaXOaaF2CWYoyPVPw+ZGXuKt9ezNAjst8eDfog
 c9Lg==
X-Gm-Message-State: AOJu0YwL0HhlSYqVkIq/pUec92Fn/7DWY3HXmKhvMvckKoJRIciJqaWj
 l8Xk9VDwIsl7CQ/qp9X14MDRz4Lg5J2xP0P2DzKr9Qzw1Q9q3eLSqTRN9NCMpCxAhfV7P/FRnZv
 72ZV7
X-Gm-Gg: ATEYQzyqOcWNuB51b2Vbon3LPZCUueUFPsx8TsFwNvXjv17auXwUK/IHKGo5KqZVrjF
 /RcSunvJ4I1ECsu5QsDpGZ499znqYh/ARTErPVQQC+LFTmveLJf0eblIyFVzBJJN/FvmJ8MeryC
 iX2ifHCp9ukVCLS9qfChNC2NyaPTx/RiXEj51CA3GmMQ1vYWHIGMBKf0jUZc94lZt5/VyuTwIvZ
 p69Uu0CqnhMYzI8/rQEXsoQKPTpHmBy1aVjb2FKXiB5lPTP4hTzJFYfPEJ9FZgE91lpNBc1MoK3
 CgUuJhtnOCF1+5uQfKnqhwgOYjDg1y/WRuIdW6XCdBnbQ1ruheIODWZjMldd/LrAcehMXYimwyB
 EfTohD4FK71ehV0Ck7nGHQD2/5q0dJc1kiGK38lHGxmHTh55UABMtEztdT3XChoOPSUAqWd67nr
 iR0uEN4efre//QnVlZMuLkpPdVBV8orhfMU71w5epq
X-Received: by 2002:a05:6000:2c0f:b0:436:339a:9a9f with SMTP id
 ffacd0b85a97d-4398d83c25amr6353536f8f.10.1772017030384; 
 Wed, 25 Feb 2026 02:57:10 -0800 (PST)
Received: from FRSMI25-GRAVITY.. ([2a01:e0a:943:83d0:eec9:6496:dd61:39c1])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43990c388acsm3112693f8f.28.2026.02.25.02.57.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Feb 2026 02:57:09 -0800 (PST)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 Fabien Lehoussel <fabien.lehoussel@smile.fr>
Date: Wed, 25 Feb 2026 11:55:59 +0100
Message-ID: <20260225105707.139320-2-fabien.lehoussel@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260225105707.139320-1-fabien.lehoussel@smile.fr>
References: <20260225105707.139320-1-fabien.lehoussel@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1772017031; x=1772621831; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MDNQ806iXC1z5eCA46YG2AVLi/X796vlrGVIN2aSz8o=;
 b=p+zP1jSR1E86vHKAqf9PaW91ZEN3K/hEKZG3/HRJllYW5Md+JCC4NgmJBYoJ9kDkB1
 I3TnwsoKONc81TNT43IiCR8d3PCGP0nCttUMOO8rKxHn66vbvc+G4uy2Ubg5ysbeeceg
 xhc1WA/Rp38ml7whTowafODh4n9HK5DQRws6g=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=p+zP1jSR
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
index 73a8059523..48faf1a7d8 100644
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

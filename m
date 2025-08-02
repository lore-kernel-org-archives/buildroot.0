Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 228E3C87FD2
	for <buildroot@archiver.kernel.org>; Sat,  2 Aug 2025 08:32:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C441A84205;
	Sat,  2 Aug 2025 08:32:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Elf1B5Xb2aNp; Sat,  2 Aug 2025 08:32:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6554841E0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6554841E0;
	Sat,  2 Aug 2025 08:32:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B99A2909
 for <buildroot@buildroot.org>; Sat,  2 Aug 2025 08:32:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F15640BE1
 for <buildroot@buildroot.org>; Sat,  2 Aug 2025 08:32:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ALnq2T4CG934 for <buildroot@buildroot.org>;
 Sat,  2 Aug 2025 08:32:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B403B40B49
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B403B40B49
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B403B40B49
 for <buildroot@buildroot.org>; Sat,  2 Aug 2025 08:32:14 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-61568fbed16so2552927a12.3
 for <buildroot@buildroot.org>; Sat, 02 Aug 2025 01:32:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754123532; x=1754728332;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OC4yvql39ES8z+o4boY8VNFHoH8tGgjbziL20lT6Zsg=;
 b=tJyRLJEzbgd2cFt3r3791CA33Q1jgK/+Lj9aHQzZm4ZWs6QsY/WeNNlcpt/r2LobPg
 DFbhMGks6Ovx3J/tom/EJUIsc8DgdH/mdgcRgw6WkgDP4ieIE1HXWiwh/d/r9LZB9SVR
 ChQhdTPa+lPNQiPS0d+B3AwTvXJe/sxh7RdSLGUIMgJdVW0wKLqOZYeWvmu/lc8jPGVV
 q9jLI327WoYhdKQJWKNCpATacIOJJpFp56Zh7FQD41IxbMv9I+4kOoNSgPQjr+53x0bs
 AyFbhzOCGbiTgBRER+1UBRbLhOf5onnkOstrWDGNZwBf3cmoujHPHGauG4es9cnw+0oV
 eBkg==
X-Gm-Message-State: AOJu0Yz3Jqc1aviUFMQuG1mswkK2UiLzZ/tp7HKZKmOF2AipOD2LI72G
 4XTCxdcY1UxvxR14frkQiZUrmNllQWgIX+uwqTOT3CYKrt+CVQlp3SffvfLe
X-Gm-Gg: ASbGncsQzUQ4mFh1yzydFkpzsL1rg5EKsWGJEuQY4+q4DaiC8nB3W8TPKb7Huni2/SS
 I17RgbfGJP9WqkBCT5zsK15qUtat2fwh43iRywLYUssopbYoxT3POzcs997oEOKCHIV3Jm11ydD
 E2WSRwen1GXjSIlaOHp6d9FlzzDuhS2ZehG1ck8nb0QWJAA/v0d06zFmJraXVWAB6XJmC3bihO8
 CENYwpW6Jo4JlrOVUyBk3ghlpzdlwgCB36fA1mVdrwJEDpnAF18neJEwGQR2hJyfuPYY8GYNq1F
 MGTcK0Pap2W6+FFu8SxkXchLQHYo9WGOq7OOSYKtN/9vgwa865rPwOhXH0DsRlOMyVcpc6ax3f+
 AhBlX1z1cjHTwGHyiIfs4CKBBa6yRZzxdrr4j
X-Google-Smtp-Source: AGHT+IGw6TrPqcgLG9IlVtQVDhsjyUZq5S8DnbHoP8S1Qqvhnb3DGgNygGlJgS7BpIcsCh4MLMY3DQ==
X-Received: by 2002:a05:6402:51cd:b0:615:b6b9:d859 with SMTP id
 4fb4d7f45d1cf-615e6eb5e29mr2186720a12.3.1754123532120; 
 Sat, 02 Aug 2025 01:32:12 -0700 (PDT)
Received: from devhost1.play.pl ([2a02:a319:a1e0:eb00:92eb:221f:6fb6:f3ab])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8f245c1sm3946462a12.22.2025.08.02.01.32.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 01:32:11 -0700 (PDT)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: buildroot@buildroot.org
Cc: Alexander Shirokov <shirokovalexs@gmail.com>
Date: Sat,  2 Aug 2025 10:31:39 +0200
Message-ID: <20250802083139.17758-1-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754123532; x=1754728332; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OC4yvql39ES8z+o4boY8VNFHoH8tGgjbziL20lT6Zsg=;
 b=NOFV1QeKQ35JGtaEbwFM68Y25ePcsO6qm8BxtL8L64VaiGmvzuyAYCuLj6z/wa5d3k
 16ygnsgOowkOeXl45591zNDftANDtNZRJhSNmW0QvE2Bt99CEGWlqKWTs+Wi0IHjJ3gF
 JXgkgYQyySFXwCNuuiKiPagAqjY1Jk+SnRAQaKv/idKO2/B8ekgY5hSNFUhVEJ3AyhX+
 vaDs5kglhcqdIgx+a+Fbci5t3EzKhkFT/oOXPrSK3l1ejemhsSAsdWQgDHjNcV7pNkVd
 IoorXpCh8MaGUoU3PxS+LN7c/FrHmir0ls9qOjEBDB2Ty6JhbsqPpsFU4PE8CJEPbgKM
 KwRA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=NOFV1QeK
Subject: [Buildroot] [v1,1/1] package/aichat:new package
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

AIChat helps seamlessly integrate different LLM models, providing access
via the CLI and network. It can serve as a gateway to heterogeneous and
distributed LLMs.

Handy features like roles, macros, and sessions help simplify repetitive
tasks and reuse of existing solutions. Features like playgrounds and
arenas help to explore and compare models.

https://github.com/sigoden/AIChat

Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>
---
 DEVELOPERS                 |  3 +++
 package/Config.in          |  1 +
 package/aichat/Config.in   | 15 +++++++++++++++
 package/aichat/aichat.hash |  3 +++
 package/aichat/aichat.mk   | 12 ++++++++++++
 5 files changed, 34 insertions(+)
 create mode 100644 package/aichat/Config.in
 create mode 100644 package/aichat/aichat.hash
 create mode 100644 package/aichat/aichat.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 12a41597af..e3540d519d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -132,6 +132,9 @@ F:	package/openpgm/
 N:	Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
 F:	package/libest/
 
+N:	Alexander Shirokov <shirokovalexs@gmail.com>
+F:	package/aichat/
+
 N:	Alexander Sverdlin <alexander.sverdlin@gmail.com>
 F:	package/mini-snmpd/
 
diff --git a/package/Config.in b/package/Config.in
index 137f74ed82..3bbb94d23e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -165,6 +165,7 @@ menu "Debugging, profiling and benchmark"
 endmenu
 
 menu "Development tools"
+	source "package/aichat/Config.in"
 	source "package/avocado/Config.in"
 	source "package/bats-core/Config.in"
 	source "package/binutils/Config.in"
diff --git a/package/aichat/Config.in b/package/aichat/Config.in
new file mode 100644
index 0000000000..e6e1df6d5d
--- /dev/null
+++ b/package/aichat/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_AICHAT
+	bool "aichat"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_RUSTC
+	help
+	  AIChat helps seamlessly integrate different LLM models,
+	  providing access via the CLI and network. It can serve
+	  as a gateway to heterogeneous and distributed LLMs.
+
+	  Handy features like roles, macros, and sessions help
+	  simplify repetitive tasks and reuse of existing solutions.
+	  Features like playgrounds and arenas help to explore and
+	  compare models.
+
+	  https://github.com/sigoden/aichat
diff --git a/package/aichat/aichat.hash b/package/aichat/aichat.hash
new file mode 100644
index 0000000000..31e037e7d9
--- /dev/null
+++ b/package/aichat/aichat.hash
@@ -0,0 +1,3 @@
+# Locally generated
+sha256  214af28357dd2b7543120fd23b81614c986ea62d69fade6d80259cb7a42eafdd  aichat-0.30.0-cargo4.tar.gz
+sha256  5af431a6a9869052e2be4e71ccd731c7efe45dca47eaca84d4d1fb38f134cb79  LICENSE-MIT
diff --git a/package/aichat/aichat.mk b/package/aichat/aichat.mk
new file mode 100644
index 0000000000..77bb661f21
--- /dev/null
+++ b/package/aichat/aichat.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# aichat
+#
+################################################################################
+
+AICHAT_VERSION = 0.30.0
+AICHAT_SITE = $(call github,sigoden,aichat,v$(AICHAT_VERSION))
+AICHAT_LICENSE = MIT
+AICHAT_LICENSE_FILES = LICENSE-MIT
+
+$(eval $(cargo-package))
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

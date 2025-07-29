Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB420C83F26
	for <buildroot@archiver.kernel.org>; Tue, 29 Jul 2025 11:50:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5ACF741535;
	Tue, 29 Jul 2025 11:50:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ImaklA4o7izM; Tue, 29 Jul 2025 11:50:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5967741541
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5967741541;
	Tue, 29 Jul 2025 11:50:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5415315C
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 11:50:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 45BEB40BE2
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 11:50:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sq1uW-u6gS_n for <buildroot@buildroot.org>;
 Tue, 29 Jul 2025 11:50:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4B56540BCD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B56540BCD
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4B56540BCD
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 11:50:06 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-60c9d8a169bso8781478a12.1
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 04:50:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753789804; x=1754394604;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HTUrvLE+mti6lemQtHcEF/rvADlqHQHRsoCZJvVfX50=;
 b=gMLQvtiAk320/7Q8Ldc/i5NyEEXzU9T9LBPdmz4rB7+GoV5NERQs4qwko67vH+1ip5
 UW9Z1MDJL5qKA8gEArVgCAYtnbmBR0aFOhayD6m+VrJZwkPN4xTEk23Uo6SPXLUuyYsN
 qiVwPeMLSbESAt70TeAmNA1wWp1Abw3FjE6aho24My4+K/s6bHx+CNAZcvkqBifzEvVV
 0lgftdRsb6e9zW12u4ZKVU45Qw5UuVe2Y+XltaSTcOKsAboKxIb6YwcHzdsrGB6Uv4Dz
 mu1NizML0J/xNGEHNcRg4+vv86och4OaO2ANCiKN+4a02WLkQvUbrEk5lLoiNXpKoc9X
 hgEw==
X-Gm-Message-State: AOJu0YxJQU8CVK5jcz5jeSkxmDTEu+exqDYMIbj2w+ku3CRZ5YFkLFWV
 2SNDNsYQMXk4YNN31j03RBG4XQZB2mwfVy9gMw4v3UTDFwTdW1oscMPIbFDS
X-Gm-Gg: ASbGncvFrx+rZkRK1ZF3euNEcNAvniklCqS7j92lMHmi3S7qudyeVsSCLTJaw6kmKKj
 xt/MLphcJDKF7J9VQDLa8K2EkL1KC8kIFCzqifWQpvVGRzpIVXiNJkmiI4hxOdWoRfAmbAPrBAK
 p0TZBKdaoR0lrzmdUmtwGujN0cVzudPaaqOz2tXj5HW3++ncSMRc708Wy2qylC+Vi13SZKmUk+Q
 ol6zpOTr/qW7HgjV+NKJ/ehY8XZrZMzUQjVyB7c+JK0dSS9+O4RMixpFgaGur1PxAl8atoJqpHs
 8kpgxmhnuZ3BS3H7JLcjvhIS99/DEICOnhEq+AeOL+x6o4NeSQiEG6aCiUOk6kM5v4HcaiP/1j2
 Wo/B78MnuyWRfbwpCbNnNAlgmDVYEo6Qmz2Vf
X-Google-Smtp-Source: AGHT+IG4mz08AhH7tUBOwptzELql+I6KhMjYArDUQ7EfJyA3C1WfB4TQJmsUy/s6kjWCEW9Em3AR9Q==
X-Received: by 2002:a17:906:794c:b0:ae3:60fb:1b3b with SMTP id
 a640c23a62f3a-af61e92250bmr1725924566b.58.1753789803685; 
 Tue, 29 Jul 2025 04:50:03 -0700 (PDT)
Received: from devhost1.play.pl ([2a02:a319:a1e0:eb00:92eb:221f:6fb6:f3ab])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af6358a1aa1sm565979366b.36.2025.07.29.04.50.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jul 2025 04:50:03 -0700 (PDT)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: buildroot@buildroot.org
Cc: thomas.petazzoni@bootlin.com, Alexander Shirokov <shirokovalexs@gmail.com>
Date: Tue, 29 Jul 2025 13:49:50 +0200
Message-ID: <20250729114951.230203-1-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250728131926.848832-1-shirokovalexs@gmail.com>
References: <20250728131926.848832-1-shirokovalexs@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753789804; x=1754394604; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HTUrvLE+mti6lemQtHcEF/rvADlqHQHRsoCZJvVfX50=;
 b=Pe5gJQY+nwpR0P5UCLAp9OigPYG8Q9rftpU5NQGA6Aw7dfRuyIdGSxkE98jd+NXswR
 UX2VGo+zGvE5csWxdrCOBb6e9HXaGaQd7nZ3u+3KWsKkr37UVHXJ1k4hqfhVCEMSk+08
 DJZKbQkfY6KjdbZbXUpJOOSLruTUM2ll8Sip0uRCQ+jSSom3TyWACmdhcaI4iV6ZVUUe
 8YaQUVkwiE+WJv8xJdKmKXaA85LaSy+bTw2dgWOuBHq4cQqt6+j2TV6O8F5xBj6d9ber
 2qI1YeojJuwyK+cVYp/zcC9SlaCpgL0HJYHZE+kZ0II2uihVmuoM2e0LSZMh92qSEIYl
 grOA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Pe5gJQY+
Subject: [Buildroot] [v2, 1/2] package/zellij: new package
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

An advanced terminal multiplexer with batteries included. Supports
layouts, floating and stacked panes, plugins, and customization.
Provides rich functionality out of the box.

Zellij is aimed at developers, operations-oriented users, and anyone who
loves the terminal.

https://github.com/zellij-org/zellij

Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>
---
Changes v1->v2:
- Fixed format of Config.in file. Added comments.
- Fixed ZELLIJ_VERSION.'v' symbol is removed from the variable.
- Updated DEVELOPERS list.
---

Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>
---
 package/Config.in          |  1 +
 package/zellij/Config.in   | 17 +++++++++++++++++
 package/zellij/zellij.hash |  3 +++
 package/zellij/zellij.mk   | 12 ++++++++++++
 4 files changed, 33 insertions(+)
 create mode 100644 package/zellij/Config.in
 create mode 100644 package/zellij/zellij.hash
 create mode 100644 package/zellij/zellij.mk

diff --git a/package/Config.in b/package/Config.in
index 137f74ed82..3699f1d1d7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2832,6 +2832,7 @@ comment "Utilities"
 	source "package/xmlstarlet/Config.in"
 	source "package/xxhash/Config.in"
 	source "package/ytree/Config.in"
+	source "package/zellij/Config.in"
 	source "package/zoxide/Config.in"
 endmenu
 
diff --git a/package/zellij/Config.in b/package/zellij/Config.in
new file mode 100644
index 0000000000..64b158cfe3
--- /dev/null
+++ b/package/zellij/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_ZELLIJ
+	bool "zellij"
+	# Zellij uses the cranelift crate which has architecure
+	# dependencies. Specify them explicitly. See details here:
+	# https://docs.rs/cranelift-codegen/0.122.0/cranelift_codegen/
+	depends on BR2_x86_64 || BR2_x86_i686 || BR2_aarch64
+	depends on BR2_PACKAGE_HOST_RUSTC
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	help
+	  An advanced terminal multiplexer with batteries included.
+	  Supports layouts, floating and stacked panes, plugins, and
+	  customization. Provides rich functionality out of the box.
+
+	  Zellij is aimed at developers, operations-oriented users,
+	  and anyone who loves the terminal.
+
+	  https://github.com/zellij-org/zellij
diff --git a/package/zellij/zellij.hash b/package/zellij/zellij.hash
new file mode 100644
index 0000000000..6f6d48662d
--- /dev/null
+++ b/package/zellij/zellij.hash
@@ -0,0 +1,3 @@
+# Locally generated
+sha256  a416da8cb78575f39c64bab5ec767af7cf76ae34ebb8a31c28db55fd990bc34a  zellij-0.42.2-cargo4.tar.gz
+sha256  9aa6c363b18a48eeecbffe13ff390c76ede2c90eb37ba17dfbbaffc42892d87d  LICENSE.md
diff --git a/package/zellij/zellij.mk b/package/zellij/zellij.mk
new file mode 100644
index 0000000000..5dbc4c30b4
--- /dev/null
+++ b/package/zellij/zellij.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# zellij
+#
+################################################################################
+
+ZELLIJ_VERSION = 0.42.2
+ZELLIJ_SITE = $(call github,zellij-org,zellij,v$(ZELLIJ_VERSION))
+ZELLIJ_LICENSE = MIT
+ZELLIJ_LICENSE_FILES = LICENSE
+
+$(eval $(cargo-package))
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

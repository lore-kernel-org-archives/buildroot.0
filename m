Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3972AE8305C
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 07:51:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2010821F4;
	Tue,  3 Feb 2026 07:51:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DjSkz_P29rqx; Tue,  3 Feb 2026 07:51:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECD1282214
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770105116;
	bh=vJKG/HohXUsJF+sKjgrybVPEuMKDPnXeAGnBnZnshAY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CcLuCa6846UoFpRWqzZyZPhonYsijGV+xZutRhL8AbxzNWuzXLYwlCzJj0RjAKnZT
	 c7rBpnaH20twobaxHViP7ZC9heiKO8mxi3LtY/BP4gKxd57oMa34I5DaKsryc8M2CF
	 cCKQKMx68Cg2oXjGIJuxhGGhXUokVpFWpIFQb8nc3/xHxO0ztZHV+miQlKSB9dCytS
	 MDNgjB79hd/TuOgpLqdoN4Fq1/gGvflb9X+6TdQKKYK+pvwX1xJOyNlWiUmKVMNZvQ
	 01+xgsfZ6/Qn7YVjjkyDlB6mdqz9ujuXDXln5XQy4gR3HftuIkNWSQyZxEyDe/CbLf
	 TqbeoKNrpXb8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECD1282214;
	Tue,  3 Feb 2026 07:51:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9DD95F4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 07:51:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 86C40403F1
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 07:51:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H-tvmUUUiSHe for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 07:51:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 79E3040248
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79E3040248
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 79E3040248
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 07:51:53 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2a0c09bb78cso4265935ad.0
 for <buildroot@buildroot.org>; Mon, 02 Feb 2026 23:51:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770105112; x=1770709912;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ww74w2bnggV7RMGRSlrI+0SpMfiLklqih7gm5tg7H/0=;
 b=RaDrYdM7/K6roFXnaTQBt0jdEn44gYOYLfnB8fHzKKcKqNrC97XYaSGV/9Ask3gFVo
 saCKRGcut1TqpBumW+7pPpez4CNJII5FSB5xbWiqb3cbfnpMfPmjqUEAr5gDJOQslb69
 KR3F07czCw2oOwxuy/AysFowcpRMYD9Bskcw2Dx69BSzbsqja3bNgIIT1lti+J50Gdf0
 bnuog5BaF+J9l2mcRJexvsoHJl0JnD1C1IDb0XHUtElXCOwdwY5RYf3l5tAMVKU4MYni
 uxWs0vOBPl47u7w6lLHRPuwgcnH5UuTqkr8GlT/nsgZdVEnQDAoDp/EIbQ0sSMXvHAQF
 n1tQ==
X-Gm-Message-State: AOJu0YzfHHHi74SO7ul1hvAhY7wsg9O3GF1zTJcfgFRhKjWaVgvWp/7V
 TF77rBp3nQf+vbG6PKPj2ezBbqiEaEJzMPkHZo8UKrAYTAyv9d9fLVZ/KrPqnVkZ
X-Gm-Gg: AZuq6aLkvbkRvYFoKAxKpKlnmLrWKwR99TQ0L+8P3AH5fMqXPD5zXD5Jpu/rRvVwy6v
 o3EV7OE2Nzsig6zPtk+GKQAia0eIZPXn9gTWSfbq+2xH/4zWNtYwZXFvSFWQtl0hLJyCIjXFfMZ
 oqvTzvJkQ7vLCmsAeW3qWq+VMSXx9ORa1qZU68ZqFc8GdKPwOTk/FCiAxQBgM5oP4+DReh4Hfyo
 c26F1n9u1JiRI+PtOiMfa9Tu8B+kFSivgePqh/J3Y4cHGjtRcJXU9xNRdbkP/iDjXBssMxmyPIP
 IZ7Jn9dWESIcNMEKQvKpz0X0y3HxIKbAaCkuc9Wg2CCmaSx3MfTi+avtw3R5dVZ2jaN8HkHel3g
 KAy+4KFlaEmBk8cCD7EIbwEUvWiDu4pH07asN795ZfbLa4v5tccdpNNnoX2gF/YX6xXfrLmNUPb
 1daBujfqNGEK90zsyShK4wMg==
X-Received: by 2002:a17:903:244a:b0:2a0:9934:a3f3 with SMTP id
 d9443c01a7336-2a9246aceedmr16158445ad.24.1770105112238; 
 Mon, 02 Feb 2026 23:51:52 -0800 (PST)
Received: from fedora ([2409:40e5:11ea:6bd8:35c:c9a7:a347:916b])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a8dc225543sm141244415ad.73.2026.02.02.23.51.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Feb 2026 23:51:51 -0800 (PST)
From: Rick <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue,  3 Feb 2026 13:20:25 +0530
Message-ID: <20260203075025.25936-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770105112; x=1770709912; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ww74w2bnggV7RMGRSlrI+0SpMfiLklqih7gm5tg7H/0=;
 b=HV37YuorMUMvXvLhMi9QeUtb+zJ+Fm6Ue5F/oB29jZaPic2Ofembcq50UboLIrz1hH
 LHHC8rutdck5k4j0xsTEhjTx4r8gCFiVZUaPBg5496gOM6T7oIB/+ER/u64RA7XlrJos
 2UzKaq7VUrDUyeZFUpiEmjSgQ35Wn6WrTDvkHDqnlItrqjbDCbFqw6uQMpaiS2DAfYxa
 1WlxkSuRe6h9sY7NBc8Hp/zxqktml27cLspyQDBC0Vz/K0rXmppWxm5EQjMZdu6Ae5L7
 1VJajk1BPyry34Sm6a5hABbKsrf6Z21uwjBgDIqyPcwGjxCcs4r/2giwk/CBzSt3WYwV
 G3dA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=HV37Yuor
Subject: [Buildroot] [PATCH] package/obstack-standalone: new package
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

A standalone library implementing the GNU libc obstack interface,
for use with musl libc or other C libraries that do not provide it.

https://github.com/void-linux/musl-obstack
Signed-off-by: Rick <chakrabortyshubham66@gmail.com>
---
 DEVELOPERS                                         |  3 +++
 package/Config.in                                  |  1 +
 package/obstack-standalone/Config.in               |  8 ++++++++
 package/obstack-standalone/obstack-standalone.hash |  2 ++
 package/obstack-standalone/obstack-standalone.mk   | 14 ++++++++++++++
 5 files changed, 28 insertions(+)
 create mode 100644 package/obstack-standalone/Config.in
 create mode 100644 package/obstack-standalone/obstack-standalone.hash
 create mode 100644 package/obstack-standalone/obstack-standalone.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 8290ccc281..1b15366f76 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3553,3 +3553,6 @@ F:	package/shapelib/
 F:	package/simple-mail/
 F:	package/tinc/
 F:	support/testing/tests/package/test_quazip.py
+
+N:	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+F:	package/obstack-standalone/
diff --git a/package/Config.in b/package/Config.in
index 41fc5af330..903e137a4d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2252,6 +2252,7 @@ endif
 	source "package/musl-compat-headers/Config.in"
 	source "package/musl-fts/Config.in"
 	source "package/neon-2-sse/Config.in"
+	source "package/obstack-standalone/Config.in"
 	source "package/openblas/Config.in"
 	source "package/orc/Config.in"
 	source "package/p11-kit/Config.in"
diff --git a/package/obstack-standalone/Config.in b/package/obstack-standalone/Config.in
new file mode 100644
index 0000000000..c7c78b2165
--- /dev/null
+++ b/package/obstack-standalone/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_OBSTACK_STANDALONE
+	bool "obstack-standalone"
+	help
+	  A standalone library implementing GNU libc's obstack
+	  interface, for use with musl libc or other C libraries
+	  that do not provide it.
+
+	  https://github.com/void-linux/musl-obstack
diff --git a/package/obstack-standalone/obstack-standalone.hash b/package/obstack-standalone/obstack-standalone.hash
new file mode 100644
index 0000000000..c43e3c077f
--- /dev/null
+++ b/package/obstack-standalone/obstack-standalone.hash
@@ -0,0 +1,2 @@
+# Checksums from https://github.com/void-linux/musl-obstack/releases/tag/v1.2.3
+sha256  9ffb3479b15df0170eba4480e51723c3961dbe0b461ec289744622db03a69395  obstack-standalone-1.2.3.tar.gz
diff --git a/package/obstack-standalone/obstack-standalone.mk b/package/obstack-standalone/obstack-standalone.mk
new file mode 100644
index 0000000000..c0d3e584ba
--- /dev/null
+++ b/package/obstack-standalone/obstack-standalone.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# obstack-standalone
+#
+################################################################################
+
+OBSTACK_STANDALONE_VERSION = 1.2.3
+OBSTACK_STANDALONE_SITE = $(call github,void-linux,musl-obstack,v$(OBSTACK_STANDALONE_VERSION))
+OBSTACK_STANDALONE_LICENSE = GPL-2.0+
+OBSTACK_STANDALONE_LICENSE_FILES = COPYING
+OBSTACK_STANDALONE_INSTALL_STAGING = YES
+OBSTACK_STANDALONE_AUTORECONF = YES
+
+$(eval $(autotools-package))
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

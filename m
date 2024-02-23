Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB228C54798
	for <buildroot@archiver.kernel.org>; Fri, 23 Feb 2024 20:30:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7ADD6400AB;
	Fri, 23 Feb 2024 20:30:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zMl0dZYOEeEq; Fri, 23 Feb 2024 20:30:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 348C640190
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 348C640190;
	Fri, 23 Feb 2024 20:30:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 69A381BF2FE
 for <buildroot@lists.busybox.net>; Fri, 23 Feb 2024 20:30:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5710B81E40
 for <buildroot@lists.busybox.net>; Fri, 23 Feb 2024 20:30:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eIZTg-BL-gtr for <buildroot@lists.busybox.net>;
 Fri, 23 Feb 2024 20:30:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=kazemi.ms@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 18F1A81E03
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18F1A81E03
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 18F1A81E03
 for <buildroot@buildroot.org>; Fri, 23 Feb 2024 20:30:41 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a3f48422fb6so187670566b.3
 for <buildroot@buildroot.org>; Fri, 23 Feb 2024 12:30:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708720239; x=1709325039;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pG/kxRnq34ysMXCntoC+jXPqwCpvI3t34ku4PjJJ3zI=;
 b=oP8LtA2b3dBJAG1Y+XcX+0I3jQV/Bvrg0j6FpUk4TxKjEe60/dmezy8RMOI/tLqlNM
 1L1pDdGTQD3fJPyfendt/Q1VN6LH8nu8yeM/3LUSw0vshguRuj60gzhVM0pBzFK8Q1GO
 OSYtuVJYjsXCXHfT1WCEz0gAu4CwD+v7KKFPJ3OX5vUGcy7OvaptSNo/tMWUAzUN6XKl
 i1HbFl/VQRDrehJLt8H8wU16wtKEQKts2NKSUk7Kd+qGPTd7/C9lr9ps8AYEd3tzlsmK
 ok55YTE2x5Dlre1ifO38oPUl8h3vsjuY1kHF6TZRRsSLfxeCPSewGycJQGomhyk3jGKp
 cUiA==
X-Gm-Message-State: AOJu0YyMAiifKEAYrV6oyFtxvpOHHRWY8aSJEqkh7YKJSKJIPPNOdq8u
 VW/dJF5uJ2XB7h4aL0PoW7uzM3TT5rRL/mFrJybHEhQUy1O0CR2RFFT6VKU77Vo=
X-Google-Smtp-Source: AGHT+IEOlN0oWAUG3cc4mXFXYIWVGVg5vtrGWboEf7CC/vM8lnidk3gTVKSqOTYqnk+1TXMJzDT5Ew==
X-Received: by 2002:a17:906:1310:b0:a3d:a63f:2db0 with SMTP id
 w16-20020a170906131000b00a3da63f2db0mr636516ejb.28.1708720239019; 
 Fri, 23 Feb 2024 12:30:39 -0800 (PST)
Received: from saeedkazemi-ThinkPad.abbrnd.local
 (2001-1c00-0b13-1d00-a619-a7bd-3788-362f.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:b13:1d00:a619:a7bd:3788:362f])
 by smtp.gmail.com with ESMTPSA id
 tb21-20020a1709078b9500b00a3e51df2280sm6227341ejc.223.2024.02.23.12.30.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Feb 2024 12:30:38 -0800 (PST)
From: Saeed Kazemi <kazemi.ms@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 23 Feb 2024 21:30:31 +0100
Message-Id: <20240223203031.825112-1-kazemi.ms@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708720239; x=1709325039; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pG/kxRnq34ysMXCntoC+jXPqwCpvI3t34ku4PjJJ3zI=;
 b=ZLx9tHXpjdzCmIZw0iGjVbflh2TpYCV0EFXsEyH6t4bDaClcUVT8yE1jArgfgWLx5L
 gV/oxReXl8TNotkkNl4IWGzoIFCWTyibY5KesEbEKUCBLINLbt8ylYzHmXfRn2rK2QWx
 DpS34HoxBT6bw2ISyMKvEwn80AeL+rYzdOSjmM+mnROL9DAPD9ZPo8Uc0A/mAUUrMqLp
 rpzuULWOM/BYS2m4cOKzDoUlMTK8ZvUcGA+Xti3aL0gi/Y+v9BiPixBHYU7t/fFrs6IR
 kAUpPIOfjHa8OJMH5h/MLCWn30OB2/co3FzLgnwA9EJ0UorMijCf0t6eT4qjH4ljH+IG
 4P/g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ZLx9tHXp
Subject: [Buildroot] [PATCH 1/1] package/fd: new package
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
Cc: Saeed Kazemi <kazemi.ms@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

A simple, fast and user-friendly alternative to 'find'

https://github.com/sharkdp/fd.git

Signed-off-by: Saeed Kazemi <kazemi.ms@gmail.com>
---
 DEVELOPERS           |  1 +
 package/Config.in    |  1 +
 package/fd/Config.in | 12 ++++++++++++
 package/fd/fd.hash   |  4 ++++
 package/fd/fd.mk     | 12 ++++++++++++
 5 files changed, 30 insertions(+)
 create mode 100644 package/fd/Config.in
 create mode 100644 package/fd/fd.hash
 create mode 100644 package/fd/fd.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 0f065bfafb..bf022512a5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2731,6 +2731,7 @@ F:	package/biosdevname/
 
 N:	Saeed Kazemi <kazemi.ms@gmail.com>
 F:	package/eza/
+F:	package/fd/
 F:	package/procs/
 
 N:	Sam Lancia <sam@gpsm.co.uk>
diff --git a/package/Config.in b/package/Config.in
index bf0fe078b9..090fa80a29 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -182,6 +182,7 @@ menu "Development tools"
 	source "package/diffutils/Config.in"
 	source "package/dos2unix/Config.in"
 	source "package/findutils/Config.in"
+	source "package/fd/Config.in"
 	source "package/flex/Config.in"
 	source "package/gawk/Config.in"
 	source "package/gettext/Config.in"
diff --git a/package/fd/Config.in b/package/fd/Config.in
new file mode 100644
index 0000000000..10f295cb20
--- /dev/null
+++ b/package/fd/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_FD
+	bool "fd"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_RUSTC
+	help
+	  fd is a program to find entries in your filesystem. It is a
+	  simple, fast and user-friendly alternative to find. While it
+	  does not aim to support all of find's powerful functionality,
+	  it provides sensible (opinionated) defaults for a majority of
+	  use cases.
+
+	  https://github.com/sharkdp/fd.git
diff --git a/package/fd/fd.hash b/package/fd/fd.hash
new file mode 100644
index 0000000000..7950055efa
--- /dev/null
+++ b/package/fd/fd.hash
@@ -0,0 +1,4 @@
+# Locally computed
+sha256  49d57704f1a75b20a770d50538818ec003f42a5c19a39a682639b5e72e72ee7d  fd-9.0.0.tar.gz
+sha256  73c83c60d817e7df1943cb3f0af81e4939a8352c9a96c2fd00451b1116fa635c  LICENSE-APACHE
+sha256  322cfc7aa0c774d0eca3b2610f1d414de3ddbd7d8dd4b9dea941a13a6eb07455  LICENSE-MIT
diff --git a/package/fd/fd.mk b/package/fd/fd.mk
new file mode 100644
index 0000000000..316da418ea
--- /dev/null
+++ b/package/fd/fd.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# fd
+#
+################################################################################
+
+FD_VERSION = 9.0.0
+FD_SITE = $(call github,sharkdp,fd,v$(FD_VERSION))
+FD_LICENSE = Apache-2.0 or MIT
+FD_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
+
+$(eval $(cargo-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

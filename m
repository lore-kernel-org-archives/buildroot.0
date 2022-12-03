Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB5BCC4332F
	for <buildroot@archiver.kernel.org>; Sat,  3 Dec 2022 22:19:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6751160B46;
	Sat,  3 Dec 2022 22:19:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6751160B46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RZHzffkGjRCW; Sat,  3 Dec 2022 22:19:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C88160AC1;
	Sat,  3 Dec 2022 22:19:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C88160AC1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2C8FC1BF48B
 for <buildroot@lists.busybox.net>; Sat,  3 Dec 2022 22:19:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0024D60AC1
 for <buildroot@lists.busybox.net>; Sat,  3 Dec 2022 22:19:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0024D60AC1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cHnSYjwOopFV for <buildroot@lists.busybox.net>;
 Sat,  3 Dec 2022 22:19:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF5A6606ED
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AF5A6606ED
 for <buildroot@buildroot.org>; Sat,  3 Dec 2022 22:19:31 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 ja4-20020a05600c556400b003cf6e77f89cso6647163wmb.0
 for <buildroot@buildroot.org>; Sat, 03 Dec 2022 14:19:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3NhCHEQ4nCZ+vEnThBRKN86FPlCC1PddxKNZ+/A3UzQ=;
 b=XiAwL44UjsQ06xFUQ3biZcjGLNKfYHZlTIEHhbarX+W0porhy7IuemEeI7n6P2Zrrg
 Xpc9axci6HDyAD62QUTws9MJfrerfypBMCTt0x8B1s2jGdm8EWqwBu8WTgtbS/qjXndY
 LrsEOmmdviHy6y8NFwtKzqB5xdfgI1TgioJFTF+O7sRHnx8H6gYUbgCw9usnJClZHM3l
 yKkmFVBjMBotdb3dpMY56D4jb66X9SraFjbCg6G9aloIm0woBl6Xd7cCj2KOxqr8ndjG
 CD5dcfGv48TcBe/LbGh4ESey24cjlU+35NZjuiRnikMou8r8hs0iy87bTF3oi1v6iK9Q
 ix+g==
X-Gm-Message-State: ANoB5pnSQQBo4A2EzuW8XHCA/SpFIQtxA4YPijrLaHeU69OYw8ooxPPH
 mWx2V7pQulGBoUFXVMI2sa5inNvP6oU=
X-Google-Smtp-Source: AA0mqf7zRh1nStk38uiy8HMFZ7e3yq7i2K2EXPfkA/sMKT7OxFUOzI1a0IUzmBJA8xHbSZAKZUfZ9A==
X-Received: by 2002:a05:600c:34d3:b0:3cf:a7a8:b712 with SMTP id
 d19-20020a05600c34d300b003cfa7a8b712mr41811111wmq.124.1670105969290; 
 Sat, 03 Dec 2022 14:19:29 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 h20-20020a05600c351400b003b47ff307e1sm14148209wmq.31.2022.12.03.14.19.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Dec 2022 14:19:28 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Dec 2022 23:19:26 +0100
Message-Id: <20221203221926.1188703-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3NhCHEQ4nCZ+vEnThBRKN86FPlCC1PddxKNZ+/A3UzQ=;
 b=nG1Es5rJX6UDE0O8Z6XpkhdSNB8QHdKezrEYNkoGPb/BWeVN5q5D2bh2Q1bn4XUTTu
 KhwLgtpJsbQ132p5i8zvekzcTMq3XTnGhbfOu7GNxkNXsbboPT9vvjnN8SHTiHNPAhu2
 Iz40A+DO9lYcweCHIbUqFFK3zEGrWTFCTKwCXDl5IY1nxvNbYkG7uM0sGiXrN6WJMiyT
 NaPcvNl2074S42wjE6yj9A3jM3gAClECKubBmslJccZwdP9LSWm5KLg8reF73mPSlGlX
 5B/eTErusBwJ4ue62paYVadgm2K5pdf3kC1No9Tg2DXIB0DTaeTeuPNYZPgYaO9QY/bV
 VMxg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=nG1Es5rJ
Subject: [Buildroot] [PATCH 1/1] package/gdb: zlib is mandatory, not optional
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

zlib is a mandatory dependency of gdb and by default, gdb will use its
internal one. Moreover, --with-zlib has been replaced by
--with-system-zlib since version 7.10 and
https://github.com/bminor/binutils-gdb/commit/fa1f5da0b6ff3622f9bf60e348e149b76920abba

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=15131

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gdb/Config.in |  1 +
 package/gdb/gdb.mk    | 12 ++++--------
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/package/gdb/Config.in b/package/gdb/Config.in
index 273b3072ae..80b1185b5e 100644
--- a/package/gdb/Config.in
+++ b/package/gdb/Config.in
@@ -17,6 +17,7 @@ config BR2_PACKAGE_GDB
 	depends on BR2_PACKAGE_GDB_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_ZLIB
 	# When the external toolchain gdbserver is copied to the
 	# target, we don't allow building a separate gdbserver. The
 	# one from the external toolchain should be used.
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 45ce126bab..4b9c5c6b70 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -32,7 +32,8 @@ GDB_PRE_CONFIGURE_HOOKS += GDB_CONFIGURE_SYMLINK
 # also need ncurses.
 # As for libiberty, gdb may use a system-installed one if present, so
 # we must ensure ours is installed first.
-HOST_GDB_DEPENDENCIES = host-expat host-libiberty host-ncurses
+GDB_DEPENDENCIES = zlib
+HOST_GDB_DEPENDENCIES = host-expat host-libiberty host-ncurses host-zlib
 
 # Disable building documentation
 GDB_MAKE_OPTS += MAKEINFO=true
@@ -130,6 +131,7 @@ GDB_CONF_OPTS = \
 	--disable-sim \
 	$(GDB_DISABLE_BINUTILS_CONF_OPTS) \
 	--without-included-gettext \
+	--with-system-zlib \
 	--disable-werror \
 	--enable-static \
 	--without-mpfr
@@ -212,13 +214,6 @@ else
 GDB_CONF_OPTS += --without-lzma
 endif
 
-ifeq ($(BR2_PACKAGE_ZLIB),y)
-GDB_CONF_OPTS += --with-zlib
-GDB_DEPENDENCIES += zlib
-else
-GDB_CONF_OPTS += --without-zlib
-endif
-
 ifeq ($(BR2_PACKAGE_GDB_PYTHON),)
 # This removes some unneeded Python scripts and XML target description
 # files that are not useful for a normal usage of the debugger.
@@ -256,6 +251,7 @@ HOST_GDB_CONF_OPTS = \
 	--enable-threads \
 	--disable-werror \
 	--without-included-gettext \
+	--with-system-zlib \
 	--with-curses \
 	--without-mpfr \
 	$(GDB_DISABLE_BINUTILS_CONF_OPTS)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

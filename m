Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA13C433FE
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 19:20:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0AE960BD5;
	Wed,  9 Feb 2022 19:20:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RcOnn9_F9p7r; Wed,  9 Feb 2022 19:20:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C37E760AEA;
	Wed,  9 Feb 2022 19:20:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D31DD1BF422
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 19:20:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF49D408A9
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 19:20:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BFm6MHtCXO8t for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 19:20:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B5AFB4067C
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 19:20:31 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id v12so5826397wrv.2
 for <buildroot@buildroot.org>; Wed, 09 Feb 2022 11:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5xVvlBkn+UBCMxDbjsf2pccFiMOWB0xJ4thDW7f6dTM=;
 b=IzxCk6kJK4OHcOV8rfXfsiNexwR082LZhfMNewpkEedibMCufVSabYEgS5SyPW4Qc5
 gZoVXL1Cn6ru2ceQA+EK5p2Xdj3y4/eD+CuuSk2juLlNtNZ9CtdVZy+LTLahWOj/iXtw
 QVplsgC/c5VwHGYzoQaCWkJcgCGaoTRL1/xHrGo8wnauzqk0U+/llwIigIq4/3bEd2Vv
 63mac2UshEID8Cocx6JyEQitMno9xpl/VEoIYPvkFZHQmrl1+w1E1jNptPOObaqRKhvn
 2NDPMImcvMfDyS9ATiO4GHlApzq7g0On1EuwnMzWKI61sDXRwXwhsu4d8MTC1YN+h3In
 6ZwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5xVvlBkn+UBCMxDbjsf2pccFiMOWB0xJ4thDW7f6dTM=;
 b=bMwnt/GlpuefxbNoCOfmvi0LVSijwfOhBLiPYJlf5uD/8UefFLpr78X60XipgDRx8x
 vQMZ9cCVomkoFVhH/8TFEwuqG51DkMpewc1wG9xB1ZPXYtMH/sRNH/T96YX9XiueHiE1
 Fh1RbAXI6aLpHy+1Tys70zbHJcTxlNO2sV8V0geLwJ7Jlyx1FH0q0kIeHtgwHIMr33u1
 Ei3cCmJfdOVUbAw2RFWcXv8JrTEFi3d36vdGst6xmKkwPbJS1ZornZELVOowJS9Ry7Z4
 G2ojl5UolWGs8a9w6K/QcwodKZunJJJIViwrpN6guNm/zlhQkQcxJo9JqvcX8TqHFswK
 +nYA==
X-Gm-Message-State: AOAM5302ZftP4vlVoScS/FkwSqOXrnIO4mJWB5tRg4OONrkC/VVcjTvc
 aIurLQeyyh6SoKNnPiWw6tsB62o27oA=
X-Google-Smtp-Source: ABdhPJz8wBDUmNSl2jWEMHQguQ4fXAxbdRf5O6mjsshaXLdqUEZzo4DBNgZ5o46qe9CnCCI/ZlfF8A==
X-Received: by 2002:a5d:4dc7:: with SMTP id f7mr3332926wru.629.1644434429850; 
 Wed, 09 Feb 2022 11:20:29 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id b10sm15688027wrd.8.2022.02.09.11.20.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 11:20:29 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  9 Feb 2022 20:20:48 +0100
Message-Id: <20220209192048.319559-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/mongrel2: fix build with gcc 4.8
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
Cc: Lionel Orry <lionel.orry@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump to version 1.13.0 in
commit b0a7bffad9e041d9920171802621b67903f9389e:

arm-none-linux-gnueabi-gcc: error: unrecognized command line option '-Wimplicit-fallthrough=0'

Fixes:
 - http://autobuild.buildroot.org/results/de324b733e09057c87352220069fe65f6e535eb8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0003-fix-build-with-gcc-4.8.patch         | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 package/mongrel2/0003-fix-build-with-gcc-4.8.patch

diff --git a/package/mongrel2/0003-fix-build-with-gcc-4.8.patch b/package/mongrel2/0003-fix-build-with-gcc-4.8.patch
new file mode 100644
index 0000000000..eebfce0487
--- /dev/null
+++ b/package/mongrel2/0003-fix-build-with-gcc-4.8.patch
@@ -0,0 +1,60 @@
+From cc2dd3995dc9a9e6f0e705e11e791f3f3c7d7326 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 18 Jan 2022 22:41:36 +0100
+Subject: [PATCH] fix build with gcc 4.8
+
+Drop "-Wno-unused-const-variable -Wimplicit-fallthrough=0" as
+"-Wno-implicit-fallthrough -Wno-unused-const-variable" is already set in
+CFLAGS. This will avoid the following build failure with gcc 4.8 raised
+since version 1.13.0 and
+https://github.com/mongrel2/mongrel2/commit/725209578599bd7784753d86aee34f6441ff78a5:
+
+arm-none-linux-gnueabi-gcc: error: unrecognized command line option '-Wimplicit-fallthrough=0'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/de324b733e09057c87352220069fe65f6e535eb8
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/mongrel2/mongrel2/pull/354]
+---
+ Makefile            | 1 -
+ tools/m2sh/Makefile | 4 ++--
+ 2 files changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index f6627ed..fb8d028 100644
+--- a/Makefile
++++ b/Makefile
+@@ -22,7 +22,6 @@ all: bin/mongrel2 tests m2sh procer
+ 
+ ${OBJECTS_NOEXT}: CFLAGS += ${NOEXTCFLAGS}
+ ${OBJECTS}: | builddirs
+-$(RAGEL_OBJECTS): CFLAGS += -Wno-unused-const-variable -Wimplicit-fallthrough=0
+ 
+ .PHONY: builddirs
+ builddirs:
+diff --git a/tools/m2sh/Makefile b/tools/m2sh/Makefile
+index 83e7ae4..86364af 100644
+--- a/tools/m2sh/Makefile
++++ b/tools/m2sh/Makefile
+@@ -10,7 +10,7 @@ LIB_SRC=$(filter-out src/m2sh.c,${SOURCES})
+ LIB_OBJ=$(filter-out src/m2sh.o,${OBJECTS})
+ RAGEL_OBJECTS=src/lexer.o src/cli.o
+ 
+-$(RAGEL_OBJECTS): CFLAGS += -Wno-unused-const-variable -Wimplicit-fallthrough=0 -Wno-unused-parameter
++$(RAGEL_OBJECTS): CFLAGS += -Wno-unused-parameter
+ 
+ all: ../lemon/lemon tests build/m2sh
+ 
+@@ -20,7 +20,7 @@ dev: all
+ install: build/m2sh
+ 	install build/m2sh ${DESTDIR}${PREFIX}/bin
+ 
+-src/parser.o: CFLAGS += -Wno-unused-const-variable -Wno-unused-parameter
++src/parser.o: CFLAGS += -Wno-unused-parameter
+ 
+ build/libm2sh.a: ${LIB_OBJ}
+ 	mkdir -p build
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

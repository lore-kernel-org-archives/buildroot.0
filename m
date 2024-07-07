Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 443E4C38150
	for <buildroot@archiver.kernel.org>; Sun,  7 Jul 2024 09:06:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF1F260753;
	Sun,  7 Jul 2024 09:06:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gbmOGk7BJUUZ; Sun,  7 Jul 2024 09:06:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 012B260783
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 012B260783;
	Sun,  7 Jul 2024 09:06:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E09D31BF3A4
 for <buildroot@lists.busybox.net>; Sun,  7 Jul 2024 09:06:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD404404F4
 for <buildroot@lists.busybox.net>; Sun,  7 Jul 2024 09:06:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2xRBAi7-QVe3 for <buildroot@lists.busybox.net>;
 Sun,  7 Jul 2024 09:06:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 83F17404D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83F17404D7
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 83F17404D7
 for <buildroot@buildroot.org>; Sun,  7 Jul 2024 09:06:35 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a7523f0870cso341525766b.3
 for <buildroot@buildroot.org>; Sun, 07 Jul 2024 02:06:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720343193; x=1720947993;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i+kG5xbZzgfTIhIVABaJeSVMXqkDUApk68JT+gk+muM=;
 b=NtIEOsdnv6ghrVFdZqRCX6ouILagC5zBfHi68yPF7cj55FO5jLOsUMSYTCtTVIt5P1
 JA+bn7misJudLWjeO/SwW5OP642I/NbNM+Nw3PevOi3w7F52kTNV6jp5eqOmwbZ/umof
 aJcXxWx4yaxaf1IhNERPLgXIhff3pzkspwgzAVEbsTvnwehJMKj0uVdmsnaovvgiO1LJ
 pCqXFUH/GCC5CnQ/uoO5WIZLUzpkXHUCQU9Q2L3zhurEe+i2fZFXAIg617AU1IHjhXAq
 X8DFZcg62R7i6WuCR1Wt/o/3IT1juB8vavANbinNwrcZaAxxwdbZ9os2LYNPhc8c5Tvu
 lxaw==
X-Gm-Message-State: AOJu0YxjLh3UckVnWsYXSFRYO2TzUFhqwCkzw/DM7t4dp/UntR8EOc2J
 T7kSXQT8poXuxoyveWAtGIusnr37EbONtXId2C2ONyH+ma5TFPwQOki8Xj+2znih1GYTNQg910g
 x3+k=
X-Google-Smtp-Source: AGHT+IFDD/Io5KRV4VvUYLQrwJrYb9Qggi5+b+lYtMIQyOJMKOqqNZtkQSfd6Wfp/j4/mUCJ7gwQeQ==
X-Received: by 2002:a17:906:abd4:b0:a71:ddb8:9394 with SMTP id
 a640c23a62f3a-a77ba4826a2mr508251866b.40.1720343193101; 
 Sun, 07 Jul 2024 02:06:33 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-30-97-245.retail.telecomitalia.it. [79.30.97.245])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a77e368e45fsm122442166b.14.2024.07.07.02.06.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jul 2024 02:06:32 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun,  7 Jul 2024 11:06:29 +0200
Message-ID: <20240707090629.3855178-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1720343193; x=1720947993;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=i+kG5xbZzgfTIhIVABaJeSVMXqkDUApk68JT+gk+muM=;
 b=hbqvEPVN7p0kg4UUcxTQ+a1gqOnbixlYfeIiifVWrCou5jAnpCjTt6sTOasFxucU40
 PrLKrjxIOoO7T/+yu88CCxw7K7ev4AWdeSvKB5xL9nM5APxYOxJLWznFUnEg2VJm6Nhx
 AVxNwfOD6oV2jgEC6EAIOedun1amfZB9UTaIQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=hbqvEPVN
Subject: [Buildroot] [PATCH 1/1] package/haserl: update the patches to be
 applied with fuzz 0
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, haserl fails to build with output:

    Applying 0001-add-haserl_lualib.inc.patch using patch:
    patching file src/haserl_lualib.inc
    patching file src/Makefile.in
    Hunk #1 succeeded at 86 (offset 54 lines).
    Hunk #2 FAILED at 514.
    1 out of 2 hunks FAILED -- saving rejects to file src/Makefile.in.rej

This commit refreshes the package patch on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/haserl/0001-add-haserl_lualib.inc.patch | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/haserl/0001-add-haserl_lualib.inc.patch b/package/haserl/0001-add-haserl_lualib.inc.patch
index f9e2a95e4236..31a11e9512ff 100644
--- a/package/haserl/0001-add-haserl_lualib.inc.patch
+++ b/package/haserl/0001-add-haserl_lualib.inc.patch
@@ -7,6 +7,8 @@ Re-add .inc file from 0.9.33 so we don't need host-lua.
 
 Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
 Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  src/Makefile.in       |    3 -
  src/haserl_lualib.inc |   97 ++++++++++++++++++++++++++++++++++++++++++++++++++
@@ -130,7 +132,7 @@ Index: haserl-0.9.29/src/Makefile.in
 ===================================================================
 --- haserl-0.9.29.orig/src/Makefile.in
 +++ haserl-0.9.29/src/Makefile.in
-@@ -32,7 +32,6 @@
+@@ -86,7 +86,6 @@
  NORMAL_UNINSTALL = :
  PRE_UNINSTALL = :
  POST_UNINSTALL = :
@@ -138,9 +140,9 @@ Index: haserl-0.9.29/src/Makefile.in
  @INCLUDE_LUASHELL_TRUE@@USE_LUA_TRUE@am__append_1 = h_lua.c h_lua.h
  @INCLUDE_LUACSHELL_TRUE@@USE_LUA_TRUE@am__append_2 = h_luac.c h_luac.h
  bin_PROGRAMS = haserl$(EXEEXT)
-@@ -515,7 +514,7 @@
- @USE_LUA_TRUE@	$(CC_FOR_BUILD) $(CFLAGS) $(LDFLAGS) $(lua2c_LDFLAGS) \
- @USE_LUA_TRUE@		-o $@ $^ $(LIBS)
+@@ -812,7 +811,7 @@
+ @USE_LUA_TRUE@	$(CC_FOR_BUILD) $(CFLAGS) $(LUA_CFLAGS) $(LDFLAGS) $(lua2c_LDFLAGS) \
+ @USE_LUA_TRUE@		-o $@ $^ $(LIBS) $(LUA_LIBS)
  
 -@USE_LUA_TRUE@haserl_lualib.inc : haserl_lualib.lua lua2c
 +@USE_LUA_TRUE@haserl_lualib.inc :
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D89EDC30653
	for <buildroot@archiver.kernel.org>; Sun,  7 Jul 2024 11:58:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F9C68130A;
	Sun,  7 Jul 2024 11:58:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UI3lvGdZB0LQ; Sun,  7 Jul 2024 11:57:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A9978143D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A9978143D;
	Sun,  7 Jul 2024 11:57:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2DC0E1BF831
 for <buildroot@lists.busybox.net>; Sun,  7 Jul 2024 11:57:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1873D60768
 for <buildroot@lists.busybox.net>; Sun,  7 Jul 2024 11:57:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0ZXML7jzXOEN for <buildroot@lists.busybox.net>;
 Sun,  7 Jul 2024 11:57:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 09B3F60719
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09B3F60719
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 09B3F60719
 for <buildroot@buildroot.org>; Sun,  7 Jul 2024 11:57:55 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a77dc08db60so186404866b.1
 for <buildroot@buildroot.org>; Sun, 07 Jul 2024 04:57:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720353473; x=1720958273;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UhUB5idIeHu9QfeAT6BV5hY1ubIg2Y94PSn1w/a1laM=;
 b=NYQeSA5SELd8lEs24sKgnuuL4N9atExJ4yijT3pKfGpkPQs1Pvui7EzJCjYvimdCgm
 EpVPZl5wte7N2kqJlPmM+TZiOWK+UWd4sTINeCkuL7wksDWypZ99frxGZvgJJs6fa/xx
 rJWrU/ZiAXdlIy3dq/0PyKsBs9cVk71CA1ErsJJxtfCUjYHCDLl/gb3/4yloBaJqFjT0
 YXa2gXW95GoUvq3J+Q4/Qy8+P6L4tLWojUVeM4v5DBIMwrlf/YON2F0os9TLsk4E1B7C
 wwU+TCAgXH0yW0u7NYEcd60TTbtYeKN42asP0NnPWkwRf/ukSN5kJajHpOwLXhl3yQae
 AeUQ==
X-Gm-Message-State: AOJu0YxYtQhohtJPrpG2hSvVUJ7mVP9M4yOMSw4b5WI1nrot5B4Rohed
 ggQiW0uTrm7w6xjIV30qMV32S+VXLHB9KkFet+m/A6AR5gXd039GPEEAssOJYIbGpI9fDf9w4KP
 T5Wc=
X-Google-Smtp-Source: AGHT+IHdW0lnj1tUAyocJO+Jvrl8/U8OXqbhk8b3QDoQRJLhUHUNs28z6oPomhlVLgY3RLNspLmtAQ==
X-Received: by 2002:a17:906:c407:b0:a77:e48d:bc2 with SMTP id
 a640c23a62f3a-a77e48d0ccamr245878366b.3.1720353473432; 
 Sun, 07 Jul 2024 04:57:53 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-30-97-245.retail.telecomitalia.it. [79.30.97.245])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a77ea919751sm90812866b.86.2024.07.07.04.57.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jul 2024 04:57:53 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun,  7 Jul 2024 13:57:49 +0200
Message-ID: <20240707115749.3992393-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1720353473; x=1720958273;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UhUB5idIeHu9QfeAT6BV5hY1ubIg2Y94PSn1w/a1laM=;
 b=PBlGrHiuArI4e4p0dx78DxIzV2oxV8Lgq92Ozzbi+sCtrn/A5M8HtD6Tldp3PjPx+4
 BYsT1czZAH2x3q4lbLJGAOIIFERB0TIJOzRKzn1itO/u3gnj1fyY7p0sfpg2zJjGX33Y
 NbhEgH2VJCwePe6T7GXyAXvfDAC0LTDn4pgmI=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=PBlGrHiu
Subject: [Buildroot] [PATCH 1/1] package/snort: update the patches to be
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
Cc: linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Sergio Prado <sergio.prado@e-labworks.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, snort fails to build with output:

    Applying 0005-fix-sparc.patch using patch:
    patching file configure.in
    Hunk #1 FAILED at 942.
    Hunk #2 succeeded at 915 (offset -42 lines).
    1 out of 2 hunks FAILED -- saving rejects to file configure.in.rej

This commit refreshes the package patch on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/snort/0005-fix-sparc.patch | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/snort/0005-fix-sparc.patch b/package/snort/0005-fix-sparc.patch
index 14792d2c59df..56a294976c6b 100644
--- a/package/snort/0005-fix-sparc.patch
+++ b/package/snort/0005-fix-sparc.patch
@@ -4,20 +4,22 @@ like "let's see if this v9 instruction exists when I force the compiler
 to think I'm using v9", which is non-sensical.
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 
 diff -Naurp ./snort-2.9.11.1-orig/configure.in snort-2.9.11.1/configure.in
 --- ./snort-2.9.11.1-orig/configure.in	2018-05-10 12:20:19.253510678 +0200
 +++ snort-2.9.11.1/configure.in	2018-05-10 12:40:18.547584998 +0200
-@@ -942,8 +942,6 @@ fi
+@@ -900,8 +900,6 @@
  
  # check for sparc %time register
  if eval "echo $host_cpu|grep -i sparc >/dev/null"; then
 -    OLD_CFLAGS="$CFLAGS"
 -    CFLAGS="$CFLAGS -mcpu=v9 "
      AC_MSG_CHECKING([for sparc %time register])
-     AC_RUN_IFELSE(
+     AC_COMPILE_IFELSE(
      [AC_LANG_PROGRAM(
-@@ -957,8 +955,6 @@ if eval "echo $host_cpu|grep -i sparc >/
+@@ -915,8 +913,6 @@
      AC_MSG_RESULT($sparcv9)
      if test "x$sparcv9" = "xyes"; then
          AC_DEFINE([SPARCV9],[1],[For sparc v9 with %time register])
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

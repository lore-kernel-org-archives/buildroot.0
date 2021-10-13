Return-Path: <SRS0=94yL=PB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6E3DC433F5
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 20:51:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 346FF61151
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 20:51:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 346FF61151
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 057A9832D4;
	Wed, 13 Oct 2021 20:51:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q_7QQM0_e25m; Wed, 13 Oct 2021 20:51:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73114832EA;
	Wed, 13 Oct 2021 20:51:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6BDD81BF35E
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 20:51:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 688B2832EA
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 20:51:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Duhpek4abIe3 for <buildroot@lists.busybox.net>;
 Wed, 13 Oct 2021 20:51:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 65D66832D4
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 20:51:01 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id k7so12371074wrd.13
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 13:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wS7gGOQi34deuxSNXLq9kx45pIH7hWFvHA850GtuCpk=;
 b=SbGQ/3feLKwe9zYP2t5rVged/giLbujB+NI1OznI6qkGoSlJL4dLcippHQpr+3TDCF
 6MljLPUyVb08GnzAlNoBmcaByK2KZxPY4pBP2P+E1xIcs4x1JXOiQlUr9606QTmUFF9w
 oz4UpKNvV3td7EvAtK8gnTnGfKpd/m32wI1mXX4UbQP5ppyZLkOe1LHnjJuv18A+cYbb
 V2gfycQ7bJVADsDrGBsVKzD56TaVTV6SzRmCnkjgDtOMCb/jOalRCCXMFkaP+V8f6Fzv
 xHXtf2FseEJMnx02X/J4LB4OqXM/beiGxuhIhUOi6v0tu/tALumrAY+wbKNK1/8g01xc
 qNVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wS7gGOQi34deuxSNXLq9kx45pIH7hWFvHA850GtuCpk=;
 b=KxvWyQOLjSIFcbil+qe3cyjgrfZZqHfCDVPnkfuQbB2zS/P7zS6jBrHfuwC45guXwF
 WdmOXkOSu1oeAWz1yAqvFRC1JHqkOBa5Psn9qofqnKrAQ+FhgbHQ0byeFPa14IQJmSrw
 7V4/xa6cBi7/z3JhY0noNMLPV0eTmWNhrbkq/1YuQTOZjQrSNVvabDS+SaBv/y6KY8Fk
 RkrkAjv16imS6yKq92Ay0Z6RanlzASSMmmeZ7tgFxEkfZCKlS06og7zXalZfNpvKc3Pr
 r5QTgZolmbqXK+qPvt0m9gPWK2El90kkmCgANvOUUcoRcMCurP0jreptdZzztbJog2uk
 k7FA==
X-Gm-Message-State: AOAM533MhSIm1WJqVV8RYWlNEdxbU+qqyJ92DdvjkLyJ6WVgjUNuOON+
 xwBbDb798rzvro3f2x0dYrw50ppa/74=
X-Google-Smtp-Source: ABdhPJyiK0GaGEvs4eev2AzGe0JBFvkxNvFFL+wm2FvKMW6+0WiEYrB/JOZ8VAbuLgYuo7bzlGMYsg==
X-Received: by 2002:a05:600c:4ece:: with SMTP id
 g14mr1562709wmq.95.1634158259244; 
 Wed, 13 Oct 2021 13:50:59 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id c15sm579434wrs.19.2021.10.13.13.50.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 13:50:58 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 13 Oct 2021 22:49:56 +0200
Message-Id: <20211013204956.1929342-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/brltty: bump to version 6.4
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
Cc: Mario Lang <mlang@blind.guru>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Drop second patch (already in version)
- Update hash of README (changes not related to license)

https://brltty.app/doc/ChangeLog.txt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...gmprivs_linux.c-fix-build-with-gcc-5.patch | 55 -------------------
 package/brltty/brltty.hash                    |  4 +-
 package/brltty/brltty.mk                      |  2 +-
 3 files changed, 3 insertions(+), 58 deletions(-)
 delete mode 100644 package/brltty/0002-Programs-pgmprivs_linux.c-fix-build-with-gcc-5.patch

diff --git a/package/brltty/0002-Programs-pgmprivs_linux.c-fix-build-with-gcc-5.patch b/package/brltty/0002-Programs-pgmprivs_linux.c-fix-build-with-gcc-5.patch
deleted file mode 100644
index 92b5aea21e..0000000000
--- a/package/brltty/0002-Programs-pgmprivs_linux.c-fix-build-with-gcc-5.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 92b3fca2d55757680398b55869214fc2d19e9b71 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 21 Feb 2021 20:47:06 +0100
-Subject: [PATCH] Programs/pgmprivs_linux.c: fix build with gcc < 5
-
-Build with gcc < 5 is broken since version 6.2 and
-https://github.com/brltty/brltty/commit/8ce262f2c15f10a40d9cbae0b3c88b466970a055:
-
-./pgmprivs_linux.c: In function 'getPrivilegeParameterNames':
-./pgmprivs_linux.c:2220:3: error: array initialized from non-constant array expression
-   static const char *const names[] = NULL_TERMINATED_STRING_ARRAY(
-   ^
-
-Build was partially fixed since
-https://github.com/brltty/brltty/commit/8ae78dd560d00c5074158f90be5ac8dac80183db
-but it forgot to update pgmprivs_linux.c
-
-Fixes:
- - http://autobuild.buildroot.org/results/58afeb50a0ecdb8b527d7c9946bcae290b79b055
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[yann.morin.1998@free.fr: use an actual backport after upstream merge]
-Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
----
- Programs/pgmprivs_linux.c | 12 +++++++-----
- 1 file changed, 7 insertions(+), 5 deletions(-)
-
-diff --git a/Programs/pgmprivs_linux.c b/Programs/pgmprivs_linux.c
-index 56e464a82..7dfabaf9b 100644
---- a/Programs/pgmprivs_linux.c
-+++ b/Programs/pgmprivs_linux.c
-@@ -2215,13 +2215,15 @@ typedef enum {
-   PARM_USER,
- } Parameters;
- 
-+
-+static const char *const *const pgmprivs_names =
-+  NULL_TERMINATED_STRING_ARRAY(
-+    "path", "scfmode", "shell", "user"
-+  );
-+
- const char *const *
- getPrivilegeParameterNames (void) {
--  static const char *const names[] = NULL_TERMINATED_STRING_ARRAY(
--    "path", "scfmode", "shell", "user"
--  );
--
--  return names;
-+  return pgmprivs_names;
- }
- 
- const char *
--- 
-2.25.1
-
diff --git a/package/brltty/brltty.hash b/package/brltty/brltty.hash
index 504b0d802a..cec074d8ce 100644
--- a/package/brltty/brltty.hash
+++ b/package/brltty/brltty.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  b256df8f86b4d6a597cfe982cc5a7c831915de37cfece683ddb02b2329256a8a  brltty-6.3.tar.xz
+sha256  bc7573b0d0ab865c36607945b64c209312405571788f3b409397726f6143eaa6  brltty-6.4.tar.xz
 sha256  d80c9d084ebfb50ea1ed91bfbc2410d6ce542097a32c43b00781b83adcb8c77f  LICENSE-LGPL
-sha256  da78e60359a86eeefb6d6e02bc47d386ece10ae45309d998981157c3746724ab  README
+sha256  429be921e6bf783303a1f94cbb7f29dc4f0839e47efe38150b808f886028f4df  README
diff --git a/package/brltty/brltty.mk b/package/brltty/brltty.mk
index 602750c9b8..9e21018c0a 100644
--- a/package/brltty/brltty.mk
+++ b/package/brltty/brltty.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BRLTTY_VERSION = 6.3
+BRLTTY_VERSION = 6.4
 BRLTTY_SOURCE = brltty-$(BRLTTY_VERSION).tar.xz
 BRLTTY_SITE = http://brltty.com/archive
 BRLTTY_INSTALL_STAGING_OPTS = INSTALL_ROOT=$(STAGING_DIR) install
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12AEEC433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 19:58:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C33476101C
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 19:58:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C33476101C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9188D40265;
	Sun, 19 Sep 2021 19:58:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q2a_vdrW35yy; Sun, 19 Sep 2021 19:58:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5AAC4024B;
	Sun, 19 Sep 2021 19:58:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4FD9C1BF4E4
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 19:58:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4758A40282
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 19:58:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TvkdTOKzjCb1 for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 19:58:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 00986400DA
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 19:58:32 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 a194-20020a1c98cb000000b0030b41ac389fso5848658wme.2
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 12:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2di/DM9xIbwH/u54npSfv3te8pJD8h7ZAtJCXErOtUs=;
 b=DW/CN1gGQ6Tca5VMZT4R5KkVzS0LCiAo5xseYNiT3sX701qidIc8OwEgrfaX4LFg2+
 13FwVTgtr1sBkHZV7k6YNixFtYmnM9y26DFlQPWKVTodyJBiF/qL6ynMKVlFXht8VzNL
 e2uBUfStCqGUhH1Fkp7hj/iBv5Rqe6azVJUdTlCib+QgRug6JqeEFtDXTiG7Z4At5tpr
 +OS467KQX19mpaVdqoXPIL2X6R2vIiPef+AUYiJFMnzIDcRXwxcADmjVA0b1ht14voGk
 KoSbntuktPm511Wh8EeDU3bRhjQA/LdM0C+fqxiiGjB2OAIRXsKcoxuajo2LdQtV6cRJ
 UVww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2di/DM9xIbwH/u54npSfv3te8pJD8h7ZAtJCXErOtUs=;
 b=J/P7jqZ2S6vEYwRyaYwovP6Ev/T+4dQwoHUg6nlad/GQ93/kfLCd1SOZTiC8KlY6eJ
 HOOTvgZ2UhWeRznEDdO1FJGEjtrHIWx7PriUGtU8dkZjfrz7SNYCBqMSn15sfwIDruN7
 Etrf/A3ga8X8j+7HnMBijwJOsyXufKfrI+KwECTfhY+A7B7R65Dq1Oi2QHAs12ZSZAFA
 TahBxgQifMFFSZ2ENh0rtk0RIuLyOA3QythzZme/bVWFJjurMt6JYHt6f8pen3vaRC/P
 f+8FE2DmfxJ+gijXR75gVb4m/JUnXX8SKcU1e+iEPmKIMTXWA9aEqcwJmt54NJgxRLY2
 xeFg==
X-Gm-Message-State: AOAM532hjA9vJrVc4owHbSLjF8vkFdaah5B+bibt8XhfxbPf7vnLQJ1q
 N0BQSg25UYLdBPfgKHJ+7RB1MtwrVKA=
X-Google-Smtp-Source: ABdhPJwfA12bM3KaVadkP9JUoUb8vh5XDdoG5eS9u90jsfoq7rCR380NdEw1Uh8In2v1itaY7jsfDg==
X-Received: by 2002:a05:600c:3585:: with SMTP id
 p5mr26757997wmq.110.1632081510975; 
 Sun, 19 Sep 2021 12:58:30 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id j134sm11226976wmj.27.2021.09.19.12.58.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Sep 2021 12:58:30 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Sep 2021 21:58:13 +0200
Message-Id: <20210919195813.4047535-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/sispmctl: bump to version 4.9
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Phil Eichinger <phil.eichinger@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Drop patch (already in version)

https://sourceforge.net/p/sispmctl/git/ci/release-4.9/tree/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...rc-schedule.c-fix-build-with-gcc-4.8.patch | 56 -------------------
 package/sispmctl/sispmctl.hash                |  2 +-
 package/sispmctl/sispmctl.mk                  |  2 +-
 3 files changed, 2 insertions(+), 58 deletions(-)
 delete mode 100644 package/sispmctl/0001-src-schedule.c-fix-build-with-gcc-4.8.patch

diff --git a/package/sispmctl/0001-src-schedule.c-fix-build-with-gcc-4.8.patch b/package/sispmctl/0001-src-schedule.c-fix-build-with-gcc-4.8.patch
deleted file mode 100644
index 69dc31e353..0000000000
--- a/package/sispmctl/0001-src-schedule.c-fix-build-with-gcc-4.8.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 3ccbb67c71aa13b9a37a58363d37a18b8fdbf300 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 29 Oct 2020 13:36:00 +0100
-Subject: [PATCH] src/schedule.c: fix build with gcc 4.8
-
-Fix the following build failure with gcc 4.8:
-
-schedule.c:19:2: error: 'for' loop initial declarations are only allowed in C99 mode
-  for (int i = 0; i < 4; ++i) {
-  ^
-schedule.c:19:2: note: use option -std=c99 or -std=gnu99 to compile your code
-schedule.c: In function 'pms2_read_block':
-schedule.c:39:2: error: 'for' loop initial declarations are only allowed in C99 mode
-  for (int i = 0; i < 4; ++i) {
-  ^
-
-Fixes:
- - http://autobuild.buildroot.org/results/079f1454121d38a83c49529c0f6cc8ed61fd5abb
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://sourceforge.net/p/sispmctl/git/merge-requests/1]
----
- src/schedule.c | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/src/schedule.c b/src/schedule.c
-index 4dd908d..1725421 100644
---- a/src/schedule.c
-+++ b/src/schedule.c
-@@ -15,8 +15,9 @@
- static unsigned char
- *pms2_write_block(uint8_t action, uint32_t time, unsigned char *ptr)
- {
-+	int i;
- 	*ptr++ = action;	
--	for (int i = 0; i < 4; ++i) {
-+	for (i = 0; i < 4; ++i) {
- 		*ptr++ = (uint8_t)time;
- 		time >>= 8;
- 	}
-@@ -34,9 +35,10 @@ static unsigned char
- static const unsigned char
- *pms2_read_block(uint8_t *action, uint32_t *time, const unsigned char *ptr)
- {
-+	int i;
- 	*action = *ptr++;
- 	*time = 0;
--	for (int i = 0; i < 4; ++i) {
-+	for (i = 0; i < 4; ++i) {
- 		*time >>= 8;
- 		*time += (uint32_t)*ptr++ << 24;
- 	}
--- 
-2.28.0
-
diff --git a/package/sispmctl/sispmctl.hash b/package/sispmctl/sispmctl.hash
index 95129cec03..e22efcfbed 100644
--- a/package/sispmctl/sispmctl.hash
+++ b/package/sispmctl/sispmctl.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  0f8391f7e95cbf1fb96a68686a1dcf1e16747b050ae1b8ff90653c99976068db  sispmctl-4.8.tar.gz
+sha256  6a9ec7125e8c01bb45d4a3b56f07fb41fc437020c8dcd8c0f29ebb98dc55a647  sispmctl-4.9.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/sispmctl/sispmctl.mk b/package/sispmctl/sispmctl.mk
index 3e4252a8d8..b6e156c66a 100644
--- a/package/sispmctl/sispmctl.mk
+++ b/package/sispmctl/sispmctl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SISPMCTL_VERSION = 4.8
+SISPMCTL_VERSION = 4.9
 SISPMCTL_SITE = http://downloads.sourceforge.net/project/sispmctl/sispmctl/sispmctl-$(SISPMCTL_VERSION)
 SISPMCTL_LICENSE = GPL-2.0+
 SISPMCTL_LICENSE_FILES = COPYING
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

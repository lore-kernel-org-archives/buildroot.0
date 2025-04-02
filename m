Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A7AC28B20
	for <buildroot@archiver.kernel.org>; Wed,  2 Apr 2025 07:42:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6868D81438;
	Wed,  2 Apr 2025 07:42:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0AGCmN_MyPR8; Wed,  2 Apr 2025 07:42:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9270783372
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9270783372;
	Wed,  2 Apr 2025 07:42:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0381E11F
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 07:41:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D506E61107
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 07:41:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qbIKvfBDNEn0 for <buildroot@buildroot.org>;
 Wed,  2 Apr 2025 07:41:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AB415611DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB415611DC
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AB415611DC
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 07:41:58 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5ec9d24acfbso1114849a12.0
 for <buildroot@buildroot.org>; Wed, 02 Apr 2025 00:41:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743579716; x=1744184516;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5eBbbDa+Wwt5zBD0f0CfWafbGA/I8JYmezwkRXXJ5I8=;
 b=dYWROtXV9JJsSEETECgSvaDXRqBB3cNaAGc/zJMF35TPUgMifTlkpVFVnFCW7nJi9A
 iyetbP0p3JuCGpCYNKz095F+Gd0kxsJcvHbGzBfamTOQ0Y0QTxUpHwzfeAJbH9EOZWmf
 nPl7qVEmERdJ/a5oNm/1HKgXD3vlpJcW6MgP8uMoRBUpwas745sv4zWWjfBaFn3cPEM7
 RMzjO6V05H+w+I9cG5AY9uAu7o+Z5pOUD+bhqPWheCjKdtatBhKUFjBRgaaa4jBhUVyj
 2SQT0xV+5+thpc74QPMu7ErqJbE+LbEsuI09CRuqVxyLb9k2GmGMrt9aboGUUhD+lbfc
 Guew==
X-Gm-Message-State: AOJu0YyQyNKTdMFwdssEYY+zLjYILsPAwSRqwOXd7Ek2h7mV41AeTfH+
 lgoKgv60sqhrQgyQVl+eLcPYEOIEO+8U+O41shf8c2HPUHIbEGmMNWCLwMrm5hUhSs1G5jgl7ZE
 i
X-Gm-Gg: ASbGnctZv9H38snD40tMRA4fLb7Ss0R2KHuYfWUphA5NlkeXK394aGBa2I/ljHtH5qF
 auv9ouvEgYuicjqP1UAwR3YPauI1mr47mqNqxNw/4OyuKprVqrCvNQYFIDPG9J/aJmzVoLSHIrj
 nbDga6XRMvaY0wYCUY0Qlbl+HMY1Par6r0Jy6wfJv5HrtA6HGDWr3d/Rfq+4mCIPVQgxBHgRZXT
 c9TqTug/Xgceto68lNU08b7ZlZqwWmZ0AELwoUctcUKomAw5RRsuKAF2nXWYRBOUuTtmexC709T
 mUkcv9ZdkENRdT8xaBRnAmxujXY0S6JTV+lHSmmTmqULjkmQ7opHpyne3duF4wy1Kemsy65Rm3m
 pFk715A==
X-Google-Smtp-Source: AGHT+IEbAzFUwGJypPwzzLAeE3PT2blB6jl2XMDDpLdkaKla1EsAVeX6+TpZlux594evjN7CZxfdNA==
X-Received: by 2002:a17:907:60c8:b0:ac3:25ea:822 with SMTP id
 a640c23a62f3a-ac7a50d0b17mr77630566b.4.1743579716389; 
 Wed, 02 Apr 2025 00:41:56 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:bed3:e8da:1a91:4a7c])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac71961fd8csm890201066b.100.2025.04.02.00.41.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 00:41:56 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed,  2 Apr 2025 09:41:53 +0200
Message-ID: <20250402074153.4038837-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1743579716; x=1744184516;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5eBbbDa+Wwt5zBD0f0CfWafbGA/I8JYmezwkRXXJ5I8=;
 b=q7dhRcts2YFYMBk+FuYlyrcIisLa7HIPC4s6sSFLB3lGTf+3hElxg7fWp2hZyX7JSp
 4NeIejGzQ1uehWqcv3bhcftp1KBasB/TUr7Wfbhs6Gp3ak+R8qF5lOzga9nG8w2WgZ1Z
 Mp9motLGFglEe48sD5Dgo1EIGE/tw2cRvOLc4=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=q7dhRcts
Subject: [Buildroot] [PATCH 1/1] package/mmc-utils: bump to 2aef4cd9a84d
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Among the various changes, it's worth noting the extension of the
register read functionality, allowing also to get its value as an
argument [1].
Moreover, commit [2] fixes the conditional invocation of sparse
properly handling the corresponding 'C' option. Hence, the related
change in the Buildroot compilation command (i.e. C=0).

[1] https://web.git.kernel.org/pub/scm/utils/mmc/mmc-utils.git/commit/?id=21e0fa6420736830a90e13b4a807ec3475df5e65
[2] https://web.git.kernel.org/pub/scm/utils/mmc/mmc-utils.git/commit/?id=a89cba2a0f8c6a19aa6b804877241170f5b6bdd2
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/mmc-utils/mmc-utils.hash | 2 +-
 package/mmc-utils/mmc-utils.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mmc-utils/mmc-utils.hash b/package/mmc-utils/mmc-utils.hash
index 3da95d8070d6..17dedad2b7bb 100644
--- a/package/mmc-utils/mmc-utils.hash
+++ b/package/mmc-utils/mmc-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  1ae5706ce56bfedda94a01e87c5151ac750fb849987aeb74ff89d70f43556131  mmc-utils-523d8f3cfb219d800f45860892e742e3a355f1bb-git4.tar.gz
+sha256  e9630d911bcf59e235a349d862700fa7ccea7545eb314da48431dcb4da125023  mmc-utils-2aef4cd9a84ddc76349fc0d7e10d675e7fa596fa-git4.tar.gz
 sha256  49cd65f67b516078ff7e0dbe639972dad21ed3858246e3969fc8a8fc2a4dca66  README
diff --git a/package/mmc-utils/mmc-utils.mk b/package/mmc-utils/mmc-utils.mk
index 28ac62678b38..0036a775eeec 100644
--- a/package/mmc-utils/mmc-utils.mk
+++ b/package/mmc-utils/mmc-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MMC_UTILS_VERSION = 523d8f3cfb219d800f45860892e742e3a355f1bb
+MMC_UTILS_VERSION = 2aef4cd9a84ddc76349fc0d7e10d675e7fa596fa
 MMC_UTILS_SITE = https://git.kernel.org/pub/scm/utils/mmc/mmc-utils.git
 MMC_UTILS_SITE_METHOD = git
 MMC_UTILS_LICENSE = GPL-2.0
@@ -25,7 +25,7 @@ endif
 # let's do this here otherwise it won't be automatically set and build
 # will fail
 define MMC_UTILS_BUILD_CMDS
-	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) C= \
+	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) C=0 \
 		CFLAGS="$(MMC_UTILS_CFLAGS)" \
 		AM_CFLAGS='-DVERSION=\"$(shell echo $(MMC_UTILS_VERSION) | head -c 6)\"'
 endef
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

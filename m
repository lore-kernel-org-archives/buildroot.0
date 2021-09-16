Return-Path: <SRS0=h7+E=OG=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85994C433FE
	for <buildroot@archiver.kernel.org>; Thu, 16 Sep 2021 16:49:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB830615A2
	for <buildroot@archiver.kernel.org>; Thu, 16 Sep 2021 16:49:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EB830615A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A3EE400CF;
	Thu, 16 Sep 2021 16:49:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B8rxJQ7L0xPF; Thu, 16 Sep 2021 16:49:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28355402E1;
	Thu, 16 Sep 2021 16:49:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D39671BF3E5
 for <buildroot@lists.busybox.net>; Thu, 16 Sep 2021 16:49:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C443D83B56
 for <buildroot@lists.busybox.net>; Thu, 16 Sep 2021 16:49:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tB8I_m2lU6DK for <buildroot@lists.busybox.net>;
 Thu, 16 Sep 2021 16:49:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 827FC83B45
 for <buildroot@buildroot.org>; Thu, 16 Sep 2021 16:49:35 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id w29so10531710wra.8
 for <buildroot@buildroot.org>; Thu, 16 Sep 2021 09:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AuJavVo5zHfmC8GcW5VXAUvmu4b/gGABG3J/Ny2WcwI=;
 b=n1p6ZUocp4FM2QhVOIg7rlq9i0D6o1Dt3aOGPXUMMOWm69c3keBDfwtCsDz7srGsXf
 ERU8Z000zuR9UqbnJjATfLpRKXfvmjKjj17BF8vO7L+bcjdWTfence+Lg+GhC9oHzPQ9
 3dLLW2UZrz9lxn2caDjUs/pdYRs2jc3tLz/kNa7j6r2/yII66NnHYsSJq+k2eCvXTIkF
 xCQaDbut8lTmDEuMzmbPZSUZsxOTJue1c9g26CJL9VnrRGt+UlPfE23XL+pV8d/DBOYH
 /BGYsxIsaQ6SFue9rRzxH0VhunQhGOQPTcu9UfIEJ9t3M9ZgUWsstHQtckxMI+0kp7pz
 xvOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AuJavVo5zHfmC8GcW5VXAUvmu4b/gGABG3J/Ny2WcwI=;
 b=CFwc8DdBI4Qm76Hhrayms7WiVJODqgORmBcnsIkEl9+tc5DFLe360fPgxWAWjHaYFr
 lCxzCnHgGKoa87j/cIq6mrYVFEkGBv/odFlv6nUIjE18sJCP4lg8lAMijaEX19y6X+ED
 sieRioteZbH0zA3y6DzVSqHeaSaKVEk8n9BwnTn3Qd+QfSAADnc6aBv7qxUbPXXTiagk
 r9zTkqc/tq7MNH80TretO8sowxCvLmF4gxenndWsRP456LIo/myZuiV7bHzHRfCBwLBW
 iTNULPtIsJEXH1x1Wrez9ZQrfmJDj9E0wH4hKd1/kZcUWNKKsNYMSqHSTdyBk0KQfaMt
 aNlQ==
X-Gm-Message-State: AOAM532QLbtaI16mJwmcWKZmD75CadJMfH+u9Oa+Zg6FgRr26haIOy+I
 lQqcrLW0fKp7knDRNtvBEFiwcY/RG/Y=
X-Google-Smtp-Source: ABdhPJxW5mnXACLZcNobk0Rg3qgPNH5XSQwni7+roENEfa+vaeiw0faZenGYUCHQQ1yfbSQ3JXOlpw==
X-Received: by 2002:adf:fc8f:: with SMTP id g15mr7137337wrr.227.1631810973499; 
 Thu, 16 Sep 2021 09:49:33 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id 23sm503938wme.27.2021.09.16.09.49.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 09:49:33 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 16 Sep 2021 18:49:25 +0200
Message-Id: <20210916164925.1940844-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gerbera: bump to version 1.9.1
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

https://github.com/gerbera/gerbera/blob/v1.9.1/ChangeLog.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gerbera/gerbera.hash | 2 +-
 package/gerbera/gerbera.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gerbera/gerbera.hash b/package/gerbera/gerbera.hash
index ed856bbf62..345d86693c 100644
--- a/package/gerbera/gerbera.hash
+++ b/package/gerbera/gerbera.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  b1e5591515f05a46de052ef4d95a2bb3387e96f565a5ce7abb6a77dbe581f09a  gerbera-1.8.2.tar.gz
+sha256  5d323c6cb4150e3454b8c6e0012f41648441799ba44cb59436b124b54d3fc82b  gerbera-1.9.1.tar.gz
 sha256  cae4138373be41fd2be75faf41ce7efbcf49fb17d0e05ad1c51cc01ac335b9b6  LICENSE.md
diff --git a/package/gerbera/gerbera.mk b/package/gerbera/gerbera.mk
index d6251912ac..49b702e59c 100644
--- a/package/gerbera/gerbera.mk
+++ b/package/gerbera/gerbera.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GERBERA_VERSION = 1.8.2
+GERBERA_VERSION = 1.9.1
 GERBERA_SITE = $(call github,gerbera,gerbera,v$(GERBERA_VERSION))
 GERBERA_LICENSE = GPL-2.0
 GERBERA_LICENSE_FILES = LICENSE.md
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

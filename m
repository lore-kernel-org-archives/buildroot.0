Return-Path: <SRS0=AA6u=N6=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF4D5C433EF
	for <buildroot@archiver.kernel.org>; Wed,  8 Sep 2021 20:11:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94BC06115C
	for <buildroot@archiver.kernel.org>; Wed,  8 Sep 2021 20:11:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 94BC06115C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 39490404E8;
	Wed,  8 Sep 2021 20:11:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hhspZDuyA6lm; Wed,  8 Sep 2021 20:11:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5C9EA40284;
	Wed,  8 Sep 2021 20:11:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 352D61BF870
 for <buildroot@lists.busybox.net>; Wed,  8 Sep 2021 20:11:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23E3940284
 for <buildroot@lists.busybox.net>; Wed,  8 Sep 2021 20:11:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OO2yzxLazl_9 for <buildroot@lists.busybox.net>;
 Wed,  8 Sep 2021 20:11:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BD84740265
 for <buildroot@buildroot.org>; Wed,  8 Sep 2021 20:11:13 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id d6so4989092wrc.11
 for <buildroot@buildroot.org>; Wed, 08 Sep 2021 13:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0agNTl4SasIZWRslp2FHDIotsPxVRgcZM9SkmXEJxfs=;
 b=Cs3rQCA/ycFtMrA829Ep7/KgVQvbOkAdcU3OJoqCNnZ8uhXrKu+7mgIO1TZurszaWN
 0wCGvLznSMO4bm2gibJvg/C3ZCy2ALbYB9l6N00W0JrDcxTKOCPQIJ32kyip58/jrKDH
 rx5K+yaYHsS0hWxzvpjqg83uC8YJpdPx7m2IUysKThfF7jh1cPncSBVYgzpjTvUm/IYS
 4DhReMHoiKdGLzsh1wFY0SR2NdILv+uvGkJX/csT0Sm6jme3/vN/X5NjJuMvlcBTGYrE
 f97iXQ8qInSSIJrh8hXoSuSZHz/EXXnRhV16+0wlEMdpvV1R/1BZpOafg2kA/9wnFrBl
 4rDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0agNTl4SasIZWRslp2FHDIotsPxVRgcZM9SkmXEJxfs=;
 b=Rpdes92zZ3Oynw/y0LDVYjRmtUtCKLDSd+K8hkzzUlglg4TnGbJZGoKCqqhwX0E31L
 5LIRYR4t2UFHBpVngVn+r84S83HrDwSOE39exo0y8Gsa3lgHHIOqrrbXELwrLOYzVydj
 J4kZWGIQx4ddwoHzBS0bSDIccb+Ig92c679ALb8lIcSUqjxWatm90UPQs25RK/k6nM45
 lYPTz0BQsaXsoNmc2xd9CWCnqkFDQ2VNiLvAko2/NZedQzRfgurXO2OUfgs3JNEZBEaQ
 kIicdsoZcC3PFukbpckDJL0pUPRjvD0Ilj7LMgHvYn+tUe0ltWz8a1Ccuk7ogpzEJ0iO
 L6SA==
X-Gm-Message-State: AOAM532bYixW7XjB5vNp5GhCsKn41wufMkSRd1FrwxX7gtJ1+nVzDqDS
 A6oFyD8menpZRcU51w/5PNyYL95Addg=
X-Google-Smtp-Source: ABdhPJy1kZ5kG/lDoKqkWByLtMytkQs3G+aJuqAj87rMJtktbVLYUuEGUh+d5GDwxlT1YAUn5S/DNA==
X-Received: by 2002:adf:c550:: with SMTP id s16mr91099wrf.25.1631131871823;
 Wed, 08 Sep 2021 13:11:11 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id o12sm2999404wmr.2.2021.09.08.13.10.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 13:10:55 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  8 Sep 2021 22:10:37 +0200
Message-Id: <20210908201037.729001-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libupnp: bump to version 1.14.10
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

https://github.com/pupnp/pupnp/blob/release-1.14.10/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libupnp/libupnp.hash | 2 +-
 package/libupnp/libupnp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libupnp/libupnp.hash b/package/libupnp/libupnp.hash
index f7fdb6d521..1c8a302682 100644
--- a/package/libupnp/libupnp.hash
+++ b/package/libupnp/libupnp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  7b66ac4a86bc0e218e2771ac274b2945bc4154bf9054e57b14afb67c26ac7c24  libupnp-1.14.7.tar.bz2
+sha256  dc417f5ef0a9182d76b6cf38bdf863e2fb1ee3c353c56fa82e354edef7ba50f2  libupnp-1.14.10.tar.bz2
 sha256  c8b99423cad48bb44e2cf52a496361404290865eac259a82da6d1e4331ececb3  COPYING
diff --git a/package/libupnp/libupnp.mk b/package/libupnp/libupnp.mk
index 7457d2644a..ef2b724efa 100644
--- a/package/libupnp/libupnp.mk
+++ b/package/libupnp/libupnp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUPNP_VERSION = 1.14.7
+LIBUPNP_VERSION = 1.14.10
 LIBUPNP_SOURCE = libupnp-$(LIBUPNP_VERSION).tar.bz2
 LIBUPNP_SITE = \
 	http://downloads.sourceforge.net/project/pupnp/release-$(LIBUPNP_VERSION)
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

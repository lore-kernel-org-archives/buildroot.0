Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BACCC433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Jun 2022 20:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A046583EB4;
	Sun, 26 Jun 2022 20:52:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A046583EB4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MSa6AN3PeDRj; Sun, 26 Jun 2022 20:52:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF66B83DF2;
	Sun, 26 Jun 2022 20:52:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF66B83DF2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 48C2B1BF3C5
 for <buildroot@lists.busybox.net>; Sun, 26 Jun 2022 20:52:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F44A4036F
 for <buildroot@lists.busybox.net>; Sun, 26 Jun 2022 20:52:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F44A4036F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PIX0qUi0XoNn for <buildroot@lists.busybox.net>;
 Sun, 26 Jun 2022 20:52:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 131154011F
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 131154011F
 for <buildroot@buildroot.org>; Sun, 26 Jun 2022 20:52:46 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id i25so4848167wrc.13
 for <buildroot@buildroot.org>; Sun, 26 Jun 2022 13:52:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mlToDMmsw5OXsDaUoV5uGhUUH///GiYaKEDXiMlfCc0=;
 b=xBL4pawM10GBWZh7gQm9ZnZWV4+OwE3mJE3EiXJP5QVT31Lso/ypIlabxKQPKRvdZm
 NLTDGZHOYm92JUY1sWJgv+/bdAIwAsiUPC9itWvibtHOHv9yqZHntAgw5E2mqfpLYZo2
 gb68cbKCVs9wiK4Z28ewnIu+oQZ7+VWxhE9RtEYagZsxQh20lGPRADXmEFykhN+4y1Tf
 hxVZRBrL3MnspCCQ9XFcQ7ByfvX/xepr3mxRZpj/5N74wNNopdSb2I/WacD1ieJlnWao
 JxRe9yoMYYWBw68aYmRtZ7ZPw+ncZv5W726BOL2620jQ0As59so/K+2cD+hhI9lKkDV4
 oKyg==
X-Gm-Message-State: AJIora/4ZJQ4mYJdA6fTsmKsX/YerU0k5w83FAadWCJ40OmuuejVfMTX
 9lEMMog2SHho5BA5VXn8oqIrVUQyU/I=
X-Google-Smtp-Source: AGRyM1uGL5k1FyO4/lV8f6YbAcopfmGVtPzDuOJciGm7qfLoqPtpLgjOIYEoSYJFP+BXDPehr1vLcg==
X-Received: by 2002:a5d:658a:0:b0:21b:adf4:6d19 with SMTP id
 q10-20020a5d658a000000b0021badf46d19mr9230674wru.649.1656276765031; 
 Sun, 26 Jun 2022 13:52:45 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 s5-20020a5d5105000000b0021b88ec99cesm8454068wrt.94.2022.06.26.13.52.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jun 2022 13:52:44 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Jun 2022 22:49:57 +0200
Message-Id: <20220626204957.1599312-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mlToDMmsw5OXsDaUoV5uGhUUH///GiYaKEDXiMlfCc0=;
 b=GHJw5cj63KWhXDqTVE4Oz9Xiyi62OUiYL+PjtKb2+q3ZQcIxdnh/k7hY9zdsWwLHDq
 Gerq1nP1g3JsV4q7g0qWe35oqWqe+luOfl1b8Mgzp4V6jWl5/dHyFLW3wRg+C7nzoMDw
 pdypTBPWqUjWHeolsrnfK8hJEAELTuteK4xWtcgP4kwE3WBiSzloF2iIEKIT8sNoFn2c
 htL11Lg5TnRUSDNhTXOfkfUDby4INS40k/Apaq3bpREm5voFfjHgrZleoS9c8BLQU+WP
 9wAQWIadFa6VMfndNq/YCs+4BT+trhwx75uFgfOVtyE8apmZk641AU8yBuTwilvB+uR4
 ouNQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=GHJw5cj6
Subject: [Buildroot] [PATCH 1/1] package/mbpfan: bump to version 2.3.0
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

https://github.com/linux-on-mac/mbpfan/releases/tag/v2.3.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mbpfan/mbpfan.hash | 2 +-
 package/mbpfan/mbpfan.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mbpfan/mbpfan.hash b/package/mbpfan/mbpfan.hash
index eafd313b4e..9195692d52 100644
--- a/package/mbpfan/mbpfan.hash
+++ b/package/mbpfan/mbpfan.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  52a3a79d99f775fe90917a0958e527ea14ff5b83d010164bd91f7cc3ce046b6a  mbpfan-2.2.1.tar.gz
+sha256  f690e9302da4cf97e582606614d91e1ee4ac495a4939aec7c0b3468c8988eb67  mbpfan-2.3.0.tar.gz
 sha256  589ed823e9a84c56feb95ac58e7cf384626b9cbf4fda2a907bc36e103de1bad2  COPYING
diff --git a/package/mbpfan/mbpfan.mk b/package/mbpfan/mbpfan.mk
index 2455b0a4ca..52d823cbdc 100644
--- a/package/mbpfan/mbpfan.mk
+++ b/package/mbpfan/mbpfan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MBPFAN_VERSION = 2.2.1
+MBPFAN_VERSION = 2.3.0
 MBPFAN_SITE = $(call github,linux-on-mac,mbpfan,v$(MBPFAN_VERSION))
 MBPFAN_LICENSE = GPL-3.0+
 MBPFAN_LICENSE_FILES = COPYING
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

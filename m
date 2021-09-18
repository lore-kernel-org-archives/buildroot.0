Return-Path: <SRS0=9D0o=OI=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A75B7C433EF
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 21:38:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 665EE61076
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 21:38:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 665EE61076
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 25723401B4;
	Sat, 18 Sep 2021 21:38:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bdf9rUz0G_VT; Sat, 18 Sep 2021 21:38:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E9B140135;
	Sat, 18 Sep 2021 21:38:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 179CD1BF298
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 21:38:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EBAD260586
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 21:38:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BxebJohoXDbB for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 21:38:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 403D960087
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 21:38:19 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 c8-20020a7bc008000000b002e6e462e95fso12679453wmb.2
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 14:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TOqCwXs526ndQQn4r3iHREXlQHV/lVfeouDpRxH/tw4=;
 b=b69e+NisARBdsH2HW1i0CMiQ3v4e9I1hxEVzbYImLLHbBXBPqQRxngvcmteHpnXDyY
 jPUiwYKxnu9rqn3QNne+a6uL4fkUDptp89bE035EVJvLGYo63PBrCJVJ/cofVu2kU4te
 N9+NkUG8+I54Wf6OUe7IlIChs0M9dECYlBUanuNd0+kFG6+IMg414NmXsVx2/xxT1Rgr
 yz+uGL6sxnbIvA8ctYtN5tFXUiEbgQDdY+78SMJcDiAdaYhDJeA2GsmQXhL/St1L7BSh
 4NHWx1cMF9uov1/XUAIwHvghRm8s4D9LfxaXrle8ymdFp0jwHXi4BMulnc7v41x/h25k
 U7PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TOqCwXs526ndQQn4r3iHREXlQHV/lVfeouDpRxH/tw4=;
 b=uDQqptjvnAmoergj1MrEX/3NuAGxC783H2VqdLsAbHWKiFQWA5DMOvIgT3UAsgzs58
 7UYQTYHINUNEeuGlH8zb/zdVoOAxprRLMwj3nfSKFUZmT10DA7M9Tm5nxMkWWwjq3XUF
 +PHE8yaI7hXJqCveQKOyixX7CEu2P+NDNqqG5HSOJuEs07amM+7rD01v+3ecwtvKQ3sF
 9EGQgMx1qGixFnQiEVMwxht/OifXD0RoyPzBKinqPQ9YJFiq6pf/Vbp7OWDBAtKX/8Al
 eWCzYh9Tm5UiZJ9bK55LCqJ59BbBUPvpawsBkjANDUdin2yQF0L2lDjkrtR1w9T+Nr8F
 0RxA==
X-Gm-Message-State: AOAM533CtWUKwhwmujqMYCrWpeCqSZdbEe+WBobtannzP0tmQ6pDkyG7
 +TpFXF9IY9y7nEaPAtMwbhPZ+7AcaGw=
X-Google-Smtp-Source: ABdhPJxMfOSsuoG5cO0sfUdIVyUSb4eGXSuMMxzM402O8TW8Q0bjOOCjIAT7ZOKutQzorrwgo5pIwQ==
X-Received: by 2002:a1c:1fd3:: with SMTP id f202mr21897587wmf.44.1632001097158; 
 Sat, 18 Sep 2021 14:38:17 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id k4sm10600289wrv.24.2021.09.18.14.38.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 14:38:16 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 18 Sep 2021 23:37:36 +0200
Message-Id: <20210918213736.1233777-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/cdrkit: drop host variant
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

host variant is not used by any packages since commit
7f303516f69a143c2ecc317948ec1934a195235c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cdrkit/cdrkit.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/cdrkit/cdrkit.mk b/package/cdrkit/cdrkit.mk
index 67814f1418..21c11db227 100644
--- a/package/cdrkit/cdrkit.mk
+++ b/package/cdrkit/cdrkit.mk
@@ -8,7 +8,6 @@ CDRKIT_VERSION = 1.1.11
 CDRKIT_SOURCE = cdrkit_$(CDRKIT_VERSION).orig.tar.gz
 CDRKIT_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/c/cdrkit
 CDRKIT_DEPENDENCIES = libcap bzip2 zlib
-HOST_CDRKIT_DEPENDENCIES = host-libcap host-bzip2 host-zlib
 CDRKIT_LICENSE = GPL-2.0
 CDRKIT_LICENSE_FILES = COPYING
 
@@ -28,4 +27,3 @@ CDRKIT_CONF_OPTS += -DUSE_MAGIC=OFF
 endif
 
 $(eval $(cmake-package))
-$(eval $(host-cmake-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18341C4332F
	for <buildroot@archiver.kernel.org>; Sun,  6 Nov 2022 10:53:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA79260B42;
	Sun,  6 Nov 2022 10:53:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA79260B42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QtWPgC7WNDgz; Sun,  6 Nov 2022 10:53:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0C1960B35;
	Sun,  6 Nov 2022 10:53:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0C1960B35
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 73E311BF5AA
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 10:53:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F8BA60B35
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 10:53:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F8BA60B35
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6jvPKVG4ruGM for <buildroot@lists.busybox.net>;
 Sun,  6 Nov 2022 10:53:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FDC56060A
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4FDC56060A
 for <buildroot@buildroot.org>; Sun,  6 Nov 2022 10:53:20 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 a11-20020a05600c2d4b00b003cf6f5fd9f1so5603419wmg.2
 for <buildroot@buildroot.org>; Sun, 06 Nov 2022 02:53:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iyQSAa1bIrtNfSn0cthiVCSNz2wfa+WjP7ubH6egr6k=;
 b=o/0ClnlbxR9p0JuMuMNLrakDU8VmGLcZANFgfV+xNYwGn4LubTUFa/hGGq5WE41KKG
 iqA36adBoK0WTQvq8ZOKM5TsYknnuCUbZK/zceP3L1LBixUNRZtpL9ufIhc9U/+568Gn
 CveKexTYonGbPTaHdxzlEoVWti8Vk0YzBj6h95bLmHgr75E3WGhP9uZz2LfoPzzcdANY
 3EDPTqNRHfdi5snjypoyS5zm6E2OKa/bYwLblViYUEUKt/OBTtGEMuN/j2U/Nmk0+pjL
 4rBJN3bHZmc8Gmo6qVwJcY8iIbiAC6PExSW7dobpPa1qisCPVLmwA1YNs9Jr1yLO3vQ5
 aNPg==
X-Gm-Message-State: ACrzQf3LESTe0o+1dtruMHN8n7lQxYVflIzjywoFyEq+ZsRg/mDrPNSk
 iSacZ++WfvNfXMtoYAz5kZTLv1nyHa8=
X-Google-Smtp-Source: AMsMyM7b0PvouPXYxWI/9n+IdFUjx0etxlTsa0J9A3xqNuVC5lmT4NonSoEBS+SNp9cN99MjQ6g9VA==
X-Received: by 2002:a1c:3503:0:b0:3c6:fb2a:b115 with SMTP id
 c3-20020a1c3503000000b003c6fb2ab115mr29836722wma.10.1667731998069; 
 Sun, 06 Nov 2022 02:53:18 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 bj19-20020a0560001e1300b002302dc43d77sm4411983wrb.115.2022.11.06.02.53.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Nov 2022 02:53:17 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  6 Nov 2022 11:53:09 +0100
Message-Id: <20221106105309.350587-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iyQSAa1bIrtNfSn0cthiVCSNz2wfa+WjP7ubH6egr6k=;
 b=DlMkvEapGD58Ona+Zb3oSM75LWqaNAfMS+o6dild7GYeavoPo9duCauW14lzF4ZSju
 LKQCXVv33bmcSVF1mZnhul0pqn5OkYEpMyQkwCRtAdhGuFNHxPb4FD4olGszsjG9nJS8
 FblT4mQInVKTLTBO8SlELggx3z8RPuhbi5a5zPnpSqijvhoxnMDtHCzlCQ2QFoyQDTeQ
 RH+gJq+lT2HStfAewxvct7/NFFyVvTPbuNq8V5ZHeX96ewdYVp8x4d2J4ZZfyupbCbHJ
 iys/21UZN/OXFYQU7B0OPjI7Pfr2vM8/1Rk3g45HSiK1Cb8VorUbA+fRorCiBsh0wQNN
 5H8g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=DlMkvEap
Subject: [Buildroot] [PATCH 1/1] package/crun: fix musl and uclibc-ng builds
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

Fix the following musl and uclibc-ng build failures raised since the
addition of the package in commit
530d6f661e506a4774b7236cb93d65f669adbc92:

configure: error: *** argp functions not found - install libargp or argp_standalone

Fixes:
 - http://autobuild.buildroot.org/results/55b283fa46a797253193fb752638ba88597a416b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/crun/Config.in | 1 +
 package/crun/crun.mk   | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/crun/Config.in b/package/crun/Config.in
index 5aca10dcdb..5def7001c1 100644
--- a/package/crun/Config.in
+++ b/package/crun/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_CRUN
 	bool "crun"
+	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
 	select BR2_PACKAGE_YAJL # libocispec
 	help
 	  crun is a fast and low-memory OCI Container Runtime in C.
diff --git a/package/crun/crun.mk b/package/crun/crun.mk
index 4a0c150594..65f166e657 100644
--- a/package/crun/crun.mk
+++ b/package/crun/crun.mk
@@ -15,6 +15,10 @@ CRUN_CPE_ID_VENDOR = crun_project
 CRUN_AUTORECONF = YES
 CRUN_CONF_OPTS = --disable-embedded-yajl
 
+ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
+CRUN_DEPENDENCIES += argp-standalone
+endif
+
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
 CRUN_DEPENDENCIES += libcap
 CRUN_CONF_OPTS += --enable-caps
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

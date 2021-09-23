Return-Path: <SRS0=dUZC=ON=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 747BEC433F5
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 22:16:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02C1C61241
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 22:16:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 02C1C61241
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BDA9740249;
	Thu, 23 Sep 2021 22:16:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n-BSixtAgjfq; Thu, 23 Sep 2021 22:16:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E09F440135;
	Thu, 23 Sep 2021 22:16:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5FEAB1BF3D6
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 22:16:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C21D41596
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 22:16:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bznCrNsJ5hj5 for <buildroot@lists.busybox.net>;
 Thu, 23 Sep 2021 22:16:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4D8694158F
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 22:16:28 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id d6so21305550wrc.11
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 15:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WakOjMivy6hWuxP8XE4v1VhnEWwz0fd2her/OLYx1CA=;
 b=BNhGbonk9InWTq7baR5e22RyhgJaPkshnUb6UpSJ/wMuZ/P6UO7AHBKwc6szsLkkoS
 QKCYk4kqltfDlAOUaZXKbc9WWHjecm6wEI0OCRgT7QP0J6J8oqkWZgoglaFTXOEmb2CN
 JONgKlMrKyI1BJMKQg42n4aBT31ecL2OydRk6AriNrhvE2HxsEWikRs2rRoB+CFAzCGx
 UFDhAjU0dbiS+BTbx3nwhweH3uh/0zonwbxMVe1y+v34B2QskQVjQuKl27wf9m4njZmW
 uFjPtSu3Z148fabfXb4cXl4io96+twd6F8pgCVSOLk99hQCUWdK6wp4iwSXODfHtW9ki
 4HLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WakOjMivy6hWuxP8XE4v1VhnEWwz0fd2her/OLYx1CA=;
 b=OAvCYx35afsY2sRR5/cNx2YVrtDQ68UR75OmC3c03tKFxFNLcUyz6NQGnIOq/P+Nau
 +MGSceo7dEemkh35HLwFRscBvj9Js5A3WnNyccC7r1F8i8z9ZOxgC6Tg6WN3jK3xMFX8
 dhArg8rbB9Ss9lmEg4v7dj13C9STpx1P8IoBIKPdF9gHsUQTcmKLx/v4a3XE3Qp2dOS5
 0BB2URn8j9OxJdkdX/cLVXMUbOsturTTCzghKeAhswZrlHfnmpzE6mSfI/RhKysIsXlq
 q7DFn6IN2uvTgIC9dVs3KOR92oMixLj8m+osyI10cLLCu+oFiQeUJWRCQg1AhNvEm6oS
 0yKQ==
X-Gm-Message-State: AOAM531a2uBCeyzrRv2kAJq3AEEx+zS03M8XPxVHiM/UWM6A3nzSA8hv
 McOjHd2t3AbEqrspKZ4qbeS8Sfw2gGk=
X-Google-Smtp-Source: ABdhPJyZFuGmtwCw6Ud0blDaRup8Lho9AxZ3qozWBYEi/BVNtekE1cm9Vh0FqBQn9ZEAAYUKdt3QaA==
X-Received: by 2002:a5d:4b4f:: with SMTP id w15mr7871464wrs.175.1632435386247; 
 Thu, 23 Sep 2021 15:16:26 -0700 (PDT)
Received: from kali.home (pop.92-184-100-222.mobile.abo.orange.fr.
 [92.184.100.222])
 by smtp.gmail.com with ESMTPSA id d70sm6385916wmd.3.2021.09.23.15.16.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 15:16:25 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Sep 2021 00:15:55 +0200
Message-Id: <20210923221555.1409302-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/nmap: add zlib optional dependency
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

zlib is an optional dependency since bump to version 7.60 in commit
c4faf1d4d11764da769abdd252dd3925d83378cb and
https://github.com/nmap/nmap/commit/0c142333bb356b6ff15fff5c95522c4cfc410a9c.
If it is not disabled, nmap will build its own zlib version which can
result in the following build failure:

/home/giuliobenetti/autobuild/run/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i686-buildroot-linux-uclibc/9.3.0/../../../../i686-buildroot-linux-uclibc/bin/ld: attempted static link of dynamic object `libz.so.1.2.11'

Fixes:
 - http://autobuild.buildroot.org/results/da9469e24390c94fe74f133152dc320c21872159
 - http://autobuild.buildroot.org/results/53034d8dd506bc033dc92343f9a37cd4ac8b2142

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/nmap/nmap.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
index 13414a56ee..34cf61ff0b 100644
--- a/package/nmap/nmap.mk
+++ b/package/nmap/nmap.mk
@@ -44,6 +44,13 @@ else
 NMAP_CONF_OPTS += --without-openssl
 endif
 
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+NMAP_CONF_OPTS += --with-libz="$(STAGING_DIR)/usr"
+NMAP_DEPENDENCIES += zlib
+else
+NMAP_CONF_OPTS += --without-libz
+endif
+
 NMAP_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR)
 
 ifeq ($(BR2_PACKAGE_NMAP_NCAT),y)
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

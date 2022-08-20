Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04808C25B08
	for <buildroot@archiver.kernel.org>; Sat, 20 Aug 2022 11:34:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DD4C60E4C;
	Sat, 20 Aug 2022 11:34:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DD4C60E4C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r2BcqzseZJzR; Sat, 20 Aug 2022 11:34:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6307460E38;
	Sat, 20 Aug 2022 11:34:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6307460E38
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 84D561BF2B0
 for <buildroot@lists.busybox.net>; Sat, 20 Aug 2022 11:34:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5FB32408CB
 for <buildroot@lists.busybox.net>; Sat, 20 Aug 2022 11:34:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5FB32408CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YoNTwChwXs68 for <buildroot@lists.busybox.net>;
 Sat, 20 Aug 2022 11:34:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 540C14015A
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 540C14015A
 for <buildroot@buildroot.org>; Sat, 20 Aug 2022 11:34:00 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id bs25so7873174wrb.2
 for <buildroot@buildroot.org>; Sat, 20 Aug 2022 04:34:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=jFPnrvU/3pMoYMTm13M51QBASfV3EO+d+nsuS7Uvi0I=;
 b=xTjD3m3f1rQHqteOiyORrm+vq9ZhjJ2iWKaa9MXBCcTqbDi4ADM0TQuaPkYTJmD36C
 4wwklG7fQibDqKijwkO+FvIAeVIbUvnq/45R8zneQMj373UG1a/ykLzTmekIUoPsGOk0
 41QqsocTqkLh6TpjgfkkPDgLEL043L13rMjCcnsr3tj5DsffPJBaYYqf2yb42n0+aOMN
 bpyQ3phq9h54ydA5bbaMhwZI76TcFYizlnwD162B89Fz8sTdDoDTgMo73pXvdh+rZdDh
 oBhEffr2n8kE4yByAZZ4BgWDLwR0z9mUKmVnM2uUMPoCqnfeN1UErPInEptGRRfiS29P
 j8zg==
X-Gm-Message-State: ACgBeo0IOTwfcUYorNV9mcK+zgaSsporNyXgCbaS/bnb3RRplauFnfd9
 l6stp8B724zj9G4n7yJJ29H4beSEoi8=
X-Google-Smtp-Source: AA6agR4uju1dYg54Qh4ZY26deZzazdCsTFFmM3vEucs2utyVgPK8OVZqNH4V9ImEgLN/H0rjId5I9Q==
X-Received: by 2002:adf:d20b:0:b0:225:4ec9:8cac with SMTP id
 j11-20020adfd20b000000b002254ec98cacmr117309wrh.92.1660995238091; 
 Sat, 20 Aug 2022 04:33:58 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 u10-20020a05600c19ca00b003a60f0f34b7sm8998520wmq.40.2022.08.20.04.33.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Aug 2022 04:33:57 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 20 Aug 2022 13:33:52 +0200
Message-Id: <20220820113352.4976-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=jFPnrvU/3pMoYMTm13M51QBASfV3EO+d+nsuS7Uvi0I=;
 b=pL0JZE67xrZay8Kw2R7z38ZCJ63Ml7ezoRVGQOjD+XAG8ImIeMZN2afWPufbFvzgaO
 7Fgk5UZPjDKSJjerBP02ARmgG847Vtf3L6McdIYfSdz9qixu5juBj1AxTDcXb2nZGSOE
 KlFbgTQlRGkleKEKxdUG8lPH6SySh5zJtQlSZcEv4ThfKkulxiDClix3NjPuskaGBDAb
 n8YW3MSVb+d/+ReSNwpXnStEWsGhuMlzciB/u2Xi2Mo8HDz2p6JgFsG+Oh16EsKqbmd0
 J1MkMrIrQEU9fshK46s7FhtasByJ6jHV89nCXpMZ6YwvVkdGzISKmvPRilqgGYgmWSBt
 Awgw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=pL0JZE67
Subject: [Buildroot] [PATCH 1/1] utils/genrandconfig: add jquery-ui-themes
 handling
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

Add a custom case to make sure that a random configuration with an empty
theme for jquery-ui-themes doesn't fail. It reverts to
BR2_PACKAGE_JQUERY_UI_THEMES_BLACK_TIE in that case.

Fixes:
 - http://autobuild.buildroot.org/results/b38f605795b1c60d8253313ce9478c4b1991d390

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 utils/genrandconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 85db7ed1e9..9d2ed3f244 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -547,6 +547,11 @@ def fixup_config(sysinfo, configfile):
         if 'BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT=y\n' in configlines:
             return False
 
+    if 'BR2_PACKAGE_JQUERY_UI_THEMES=y\n' in configlines and \
+       'BR2_PACKAGE_JQUERY_UI_THEMES_THEME=""\n' in configlines:
+        configlines.append('BR2_PACKAGE_JQUERY_UI_THEMES_BLACK_TIE=y\n')
+        configlines.remove('BR2_PACKAGE_JQUERY_UI_THEMES_THEME=""\n')
+
     if 'BR2_TARGET_OPENSBI=y\n' in configlines and \
        'BR2_TARGET_OPENSBI_CUSTOM_GIT=y\n' in configlines and \
        'BR2_TARGET_OPENSBI_CUSTOM_REPO_URL=""\n' in configlines:
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

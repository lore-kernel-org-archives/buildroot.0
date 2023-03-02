Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7C9DC6FA8E
	for <buildroot@archiver.kernel.org>; Thu,  2 Mar 2023 22:12:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB75D40359;
	Thu,  2 Mar 2023 22:12:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB75D40359
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cZRqH3Bcpsz0; Thu,  2 Mar 2023 22:12:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0CCA24016C;
	Thu,  2 Mar 2023 22:12:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0CCA24016C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4139E1BF48D
 for <buildroot@lists.busybox.net>; Thu,  2 Mar 2023 22:12:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A64160D63
 for <buildroot@lists.busybox.net>; Thu,  2 Mar 2023 22:12:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A64160D63
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rMPmiDIzcX30 for <buildroot@lists.busybox.net>;
 Thu,  2 Mar 2023 22:12:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7192060BF3
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7192060BF3
 for <buildroot@buildroot.org>; Thu,  2 Mar 2023 22:12:23 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id j2so532569wrh.9
 for <buildroot@buildroot.org>; Thu, 02 Mar 2023 14:12:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677795141;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A9naZ5bK1JIej26+Hquw1LEEpOb5U1sYaTf5O7i595U=;
 b=vEPKty9Q7YIt5u43FGlwIMKtBIYJotTcKYM6UQMufz3ZvbokPQIWi6QJ2g8PB0pKET
 TYZEotZefALgW+KHqQf5hmTgFwXUT6lQ8E4Nb/CuA5qJxgyyl5Jiw+edwX0Cl8cSDFPS
 YQhnpR3YHP1jsLaOIEh7PZKHG1FpWh4quTHXyXLjUjLAiD2iOFfpc2VgqukzbM+i1vci
 I25lYRiGOQ0sFEufeO7G185S3I5f9BqhSI09rj0oCmvh9DVzYM40ik7+1U7rBGp4osUu
 YFrmDhOj9jcVdxGk/avpO3a53QVNX3tJMwA4FcoDmtnKLL1Qs1d3Eh/60lJn8HZLMN/R
 Fd0g==
X-Gm-Message-State: AO0yUKXlf37rl8GcILiSkPHvnoYAvyUIqqWXHqwPSV3NVIPoIg6MvX/s
 EnTxvUsg3J1/2sIq+Y35su7vT952BSE=
X-Google-Smtp-Source: AK7set92t6z9UtWxRqJDJD+wt8mcm3cN+xbIxS9CUcnDs1W3iWd9uhUKzgEE8wFRMSU8KAk0KcMC6g==
X-Received: by 2002:a5d:5009:0:b0:2cb:de45:77ff with SMTP id
 e9-20020a5d5009000000b002cbde4577ffmr8157838wrt.28.1677795140966; 
 Thu, 02 Mar 2023 14:12:20 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 s10-20020adfea8a000000b002c7e1a39adcsm471267wrm.23.2023.03.02.14.12.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 14:12:19 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  2 Mar 2023 23:12:17 +0100
Message-Id: <20230302221217.585882-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677795141;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=A9naZ5bK1JIej26+Hquw1LEEpOb5U1sYaTf5O7i595U=;
 b=kC3WyIf8p1E+cSO/y7PpBNwkr99AFh3UepXqDWDKQi6Bvp/8mfROhMYIu//BrphTpj
 vikPCpVz/DwLnvUx4bZkfjk6FLpLT9CLhUz779pSgBBY7IZK8TWvhIbfeUe2+hkevVXt
 s4mkcKCrdFJG9nLpfdi/B5NK+/K6PA0vx8gGS91CjTg5d1SDq7azirPb838Rfi71/TXT
 RJentHAZUL0qAiUfzJOuyFh0XU5IZV5pCLhl07UZj9viddwC56dYwiQ1bT9GJEoT+LeA
 a6PrJVABDS1MHpNFPjU30NaqoKVtJyFdeUkmEQsWxRNkVdkH3SHCDuog4m33ZoF7pVWH
 txWA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=kC3WyIf8
Subject: [Buildroot] [PATCH 1/1] package/gr-osmosdr: drop
 BR2_PACKAGE_GR_OSMOSDR_PYTHON
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop BR2_PACKAGE_GR_OSMOSDR_PYTHON as disabling python will raise the
following build failure if BR2_PACKAGE_GNURADIO_PYTHON is set since bump
of gnuradio to version 3.10.4.0 in commit
e37c110bead8b7b35cd97915673fa785ccb39f2d and
https://github.com/gnuradio/gnuradio/commit/51d3ad973292763a6fc0cf8e971faa3cf89029e9:

CMake Error at lib/CMakeLists.txt:51 (add_library):
  Target "gnuradio-osmosdr" links to target "Python::Module" but the target
  was not found.  Perhaps a find_package() call is missing for an IMPORTED
  target, or an ALIAS target is missing?

No entry in Config.in.legacy is needed as python support in gr-osmosdr
will now automatically be enabled if BR2_PACKAGE_GNURADIO_PYTHON is set

Fixes:
 - http://autobuild.buildroot.org/results/49e9f7bf8bfc7008688c1a3bc3744b7d3be3ce18

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gr-osmosdr/Config.in     | 7 -------
 package/gr-osmosdr/gr-osmosdr.mk | 2 +-
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/package/gr-osmosdr/Config.in b/package/gr-osmosdr/Config.in
index 04fa10be80..d83de75282 100644
--- a/package/gr-osmosdr/Config.in
+++ b/package/gr-osmosdr/Config.in
@@ -11,13 +11,6 @@ config BR2_PACKAGE_GR_OSMOSDR
 
 if BR2_PACKAGE_GR_OSMOSDR
 
-config BR2_PACKAGE_GR_OSMOSDR_PYTHON
-	bool "python support"
-	depends on BR2_PACKAGE_GNURADIO_PYTHON
-	depends on BR2_PACKAGE_PYTHON3
-	help
-	  Enable Python support
-
 config BR2_PACKAGE_GR_OSMOSDR_IQFILE
 	bool "IQ File Source support"
 	help
diff --git a/package/gr-osmosdr/gr-osmosdr.mk b/package/gr-osmosdr/gr-osmosdr.mk
index 89907c1baa..6011a67539 100644
--- a/package/gr-osmosdr/gr-osmosdr.mk
+++ b/package/gr-osmosdr/gr-osmosdr.mk
@@ -22,7 +22,7 @@ GR_OSMOSDR_CONF_OPTS = \
 # compile time.
 GR_OSMOSDR_INSTALL_STAGING = YES
 
-ifeq ($(BR2_PACKAGE_GR_OSMOSDR_PYTHON),y)
+ifeq ($(BR2_PACKAGE_GNURADIO_PYTHON),y)
 GR_OSMOSDR_CONF_OPTS += -DENABLE_PYTHON=ON
 GR_OSMOSDR_DEPENDENCIES += python3
 else
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

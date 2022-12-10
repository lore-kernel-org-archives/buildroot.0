Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B38AFC4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 10:07:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4787D40250;
	Sat, 10 Dec 2022 10:07:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4787D40250
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xnjX2PLvCsI2; Sat, 10 Dec 2022 10:07:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 80EA14018F;
	Sat, 10 Dec 2022 10:07:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80EA14018F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2793E1BF3AA
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 10:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E6C181A8E
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 10:07:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E6C181A8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q4JIO1mX2Cxm for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 10:07:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90A4E81A15
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 90A4E81A15
 for <buildroot@busybox.net>; Sat, 10 Dec 2022 10:07:09 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 ay14-20020a05600c1e0e00b003cf6ab34b61so1519856wmb.2
 for <buildroot@busybox.net>; Sat, 10 Dec 2022 02:07:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E4Gz9KtqNzvRxIvrHAiJHh5R/nozyhwFFQXhH0Z1fWU=;
 b=wIzsTeR/CIQBud1FKE32F4fgYoxRkwp6HQMgld2QzIM2QEhT9pgQDMYk82APqOzSb5
 +W2EHYJYWjmnuPYl5As+K8TzEn3XFKdEsKUheKNAY37yq61WP6uKFsDRGHhT4veQkdp7
 44iC/8lHtCNfkvF7oAH/z7QETMIqRXkv7KAZqxl94LbYFONFtEjkCL3jWJmNGQmiGwJO
 CUqjMz5AWHgy1sIfP/g3g3qY0EHf1+jIgIScuIV1rKHYUllooOqdf4AJ6Ud0UTK92P0M
 XEzI4xFfe4FzGUr0KakmyZf5+wCMPKKw4+n6bhUKgs3fwmZC5jOBhJUCOM0kdFvjkMc+
 FoJg==
X-Gm-Message-State: ANoB5pmsIiTrk+3CzfotwTJTA33WxjU8rDccqTvCDXNg6IRQ69nCVHTJ
 HX62rtvnF8asZSe3ajqm0O4DsWh9TYk=
X-Google-Smtp-Source: AA0mqf5Yh5nHStVxdkIYv4FF/q/Fxha0EWX4t/A+qvJDmSJ+f3jiuhlE3/GfaQT7PH7OEkrLR31QHg==
X-Received: by 2002:a05:600c:253:b0:3d2:17a5:17fe with SMTP id
 19-20020a05600c025300b003d217a517femr1209012wmj.18.1670666827656; 
 Sat, 10 Dec 2022 02:07:07 -0800 (PST)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a05600c4e8d00b003c70191f267sm2456141wmq.39.2022.12.10.02.07.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 02:07:07 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 10 Dec 2022 11:07:01 +0100
Message-Id: <20221210100701.3067908-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=E4Gz9KtqNzvRxIvrHAiJHh5R/nozyhwFFQXhH0Z1fWU=;
 b=IG0PIUoON2YTlkpz8bFWiJ8xXSGPU1TcroLPH6oJMcLnKy6Mr3Z7gcaoJlUTDwCiWL
 4ksHbGkqNnWxTaFlNTkgkwAUYNhu7GnUEZzUoVBi6H8mHyJ79GVZa0PQ63MLR7ycCLe0
 nML0DSnzuegnDetL8MmyZJGyguCDbG/GOtbjiYOSSoJqtzCtNwXCS5Oko/9nvf7gHZ+2
 58kYD/F4m18IK0GIVjnB+ZWWHTgkR7PpwqXLbEaLNuUfmjfJF4j6PHgYMSHCsjbsTOZy
 j7xh65tYF/FOKfFy/asPew2TKmavbRaC4kYGGIn5Fijjm1Bp58Naza0YLQ0feerqFNK8
 9JAA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=IG0PIUoO
Subject: [Buildroot] [PATCH] package/swig: bump to version 4.1.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/swig/Config.in.host | 2 +-
 package/swig/swig.hash      | 2 +-
 package/swig/swig.mk        | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/swig/Config.in.host b/package/swig/Config.in.host
index fd2049d30..4c0deebc5 100644
--- a/package/swig/Config.in.host
+++ b/package/swig/Config.in.host
@@ -5,4 +5,4 @@ config BR2_PACKAGE_HOST_SWIG
 	  written in C and C++ with a variety of high-level
 	  programming languages.
 
-	  http://www.swig.org/
+	  https://www.swig.org/
diff --git a/package/swig/swig.hash b/package/swig/swig.hash
index 64fe4f979..21590c422 100644
--- a/package/swig/swig.hash
+++ b/package/swig/swig.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  d53be9730d8d58a16bf0cbd1f8ac0c0c3e1090573168bfa151b01eb47fa906fc  swig-4.0.2.tar.gz
+sha256  2af08aced8fcd65cdb5cc62426768914bedc735b1c250325203716f78e39ac9b  swig-4.1.1.tar.gz
 sha256  f53abaeed775018d519a1b9615f0ca17894772bd9ca21c2a156bf340ac41c13e  LICENSE
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE-GPL
 sha256  7f50d942373a871211c5efee03f3db2f9efd1cff1002b0ef8e3748baa611a5c2  LICENSE-UNIVERSITIES
diff --git a/package/swig/swig.mk b/package/swig/swig.mk
index 437cf448b..d432cab53 100644
--- a/package/swig/swig.mk
+++ b/package/swig/swig.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SWIG_VERSION_MAJOR = 4.0
-SWIG_VERSION = $(SWIG_VERSION_MAJOR).2
+SWIG_VERSION_MAJOR = 4.1
+SWIG_VERSION = $(SWIG_VERSION_MAJOR).1
 SWIG_SITE = http://downloads.sourceforge.net/project/swig/swig/swig-$(SWIG_VERSION)
 HOST_SWIG_DEPENDENCIES = host-bison host-pcre
 HOST_SWIG_CONF_OPTS = \
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07817C636D6
	for <buildroot@archiver.kernel.org>; Thu, 23 Feb 2023 14:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85C9B40874;
	Thu, 23 Feb 2023 14:18:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85C9B40874
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 15MVRsUcwM6p; Thu, 23 Feb 2023 14:18:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7150240895;
	Thu, 23 Feb 2023 14:18:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7150240895
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 64B2B1BF4E3
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 14:18:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3DCBF60E0A
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 14:18:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DCBF60E0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8jZNzQdgaRbS for <buildroot@lists.busybox.net>;
 Thu, 23 Feb 2023 14:17:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8217605BE
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B8217605BE
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 14:17:58 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 o38-20020a05600c512600b003e8320d1c11so2788318wms.1
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 06:17:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Qwo3A/1kOKBMbALLLasOIGwiLNbzOJl8ZpSglyWx3vg=;
 b=bGPd5ay8H5bBylJTERT+g2EnN8H16AoAlbzoBB3gBkBx++qYZO8DBo3Xnfbl6XhFZN
 8NCLj3B20fmArAdpiEyO2QpBhhLm+8sC3lrqPBJcLs3YkL3E5mR/UeK+FU1YQ7iP6uUU
 lMMD/8sbDa7gqNURvtMG6uvn6yhzCQtVNKCkFcW8mqiogX0fmRziF08goz0rKaxyLSGO
 Hn84GEOnoUqXsjeQPM7GJTLS5fIbSLASMOq2eypCSqT+667A5rnbwZ+kfbZFmSz5yk+X
 wnupr2rhQF50Jabma2bGPlQdAKlABkXHYVyDJb/dNjF8KABKW4y8QfQWaWzAic1E2kQ+
 f+wA==
X-Gm-Message-State: AO0yUKW4RQ0ByI6YWq3jlACn27AU5K1YtEXcEgwecXfBgnEvw0j0J0t5
 XQsRXwcybquxzFlZ1mdXwpNefdYNIFI=
X-Google-Smtp-Source: AK7set/k+YEIjhl6MQYRDgHqa+wgWw7mg9Szsuai6mHxKnMu85e9FtnpQ+yZY4iHeELjSX1QUxUZAw==
X-Received: by 2002:a05:600c:3318:b0:3ea:dc39:e8b1 with SMTP id
 q24-20020a05600c331800b003eadc39e8b1mr311403wmp.12.1677161876484; 
 Thu, 23 Feb 2023 06:17:56 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 l3-20020a1ced03000000b003dd1bd66e0dsm8942467wmh.3.2023.02.23.06.17.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 06:17:56 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 23 Feb 2023 15:17:45 +0100
Message-Id: <20230223141745.303457-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Qwo3A/1kOKBMbALLLasOIGwiLNbzOJl8ZpSglyWx3vg=;
 b=W9G6eCmPMZuFoMdMS9Uihs939czMR8aAdY7/QzrauzLyIm3FlUnPIyk4NQXGi6ek66
 /soMfz1/UGEZY0y128KXgesC501QElpFswmC8wFujfu/PmaUgwP30fVfWZTanLl6CPKd
 Af52yqJYep7MnDD1yWYzpGUIumSe+R2gwVqv74X7bIbHCimJ4me9w820BztaGDEOmCq+
 ALA5ljrL0G7vMpDOY8vr4Hq+IERZr5bxPAszHxaj6LHvIoC/7wMtjfXEyezui3UN8g18
 tdbMwVtPWABGez0HVvZeacw3FtgC1npwLR+oeh/3WrKBDiK6YzFOzyGahK7PRmswZvH1
 FBwg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=W9G6eCmP
Subject: [Buildroot] [PATCH 1/1] package/gerbera: fix build with fmt >= 9.0.0
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

Fix the following build failure with fmt >= 9.0.0 raised since commit
5c83dc5451fb59ffa5cd40d30c4c532dd25e8333:

/tmp/instance-5/output-1/build/gerbera-1.10.0/src/database/sql_database.cc:1688:26:   required from here
/tmp/instance-5/output-1/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/fmt/format.h:3973:36: error: passing 'const fmt::v9::formatter<fmt::v9::join_view<__gnu_cxx::__normal_iterator<const ColumnUpdate*, std::vector<ColumnUpdate> >, __gnu_cxx::__normal_iterator<const ColumnUpdate*, std::vector<ColumnUpdate> >, char>, char, void>::formatter_type' {aka 'const fmt::v9::formatter<ColumnUpdate>'} as 'this' argument discards qualifiers [-fpermissive]
 3973 |       out = value_formatter_.format(map(*it), ctx);
      |             ~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/56c46fa7e922360d2c4b4093f8a030cc83726799

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../gerbera/0001-Fix-build-with-fmt-9-0.patch | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/gerbera/0001-Fix-build-with-fmt-9-0.patch

diff --git a/package/gerbera/0001-Fix-build-with-fmt-9-0.patch b/package/gerbera/0001-Fix-build-with-fmt-9-0.patch
new file mode 100644
index 0000000000..63ae8382a3
--- /dev/null
+++ b/package/gerbera/0001-Fix-build-with-fmt-9-0.patch
@@ -0,0 +1,36 @@
+From d7b8fafbc94405c20753fed569abd8878cccde89 Mon Sep 17 00:00:00 2001
+From: Felix Yan <felixonmars@archlinux.org>
+Date: Fri, 19 Aug 2022 15:22:10 +0300
+Subject: [PATCH] Fix build with fmt 9.0
+
+Fixes #2681
+
+[Retrieved from:
+https://github.com/gerbera/gerbera/commit/d7b8fafbc94405c20753fed569abd8878cccde89]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/database/sql_format.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/database/sql_format.h b/src/database/sql_format.h
+index 32dc00efa..e4e1909a8 100644
+--- a/src/database/sql_format.h
++++ b/src/database/sql_format.h
+@@ -42,7 +42,7 @@ struct SQLIdentifier {
+ template <>
+ struct fmt::formatter<SQLIdentifier> : formatter<std::string_view> {
+     template <typename FormatContext>
+-    auto format(const SQLIdentifier& tn, FormatContext& ctx) -> decltype(ctx.out())
++    auto format(const SQLIdentifier& tn, FormatContext& ctx) const -> decltype(ctx.out())
+     {
+         return format_to(ctx.out(), "{}{}{}", tn.quote_begin, tn.name, tn.quote_end);
+     }
+@@ -61,7 +61,7 @@ struct ColumnUpdate {
+ template <>
+ struct fmt::formatter<ColumnUpdate> : formatter<std::string_view> {
+     template <typename FormatContext>
+-    auto format(const ColumnUpdate& a, FormatContext& ctx) -> decltype(ctx.out())
++    auto format(const ColumnUpdate& a, FormatContext& ctx) const -> decltype(ctx.out())
+     {
+         return format_to(ctx.out(), "{} = {}", a.column, a.value);
+     }
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

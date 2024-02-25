Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7850AC54E49
	for <buildroot@archiver.kernel.org>; Sun, 25 Feb 2024 13:38:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0600D605AA;
	Sun, 25 Feb 2024 13:38:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WJEMS2A2B8n2; Sun, 25 Feb 2024 13:38:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18B6E60612
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18B6E60612;
	Sun, 25 Feb 2024 13:38:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 08B2B1BF350
 for <buildroot@lists.busybox.net>; Sun, 25 Feb 2024 13:38:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 036DC81ED9
 for <buildroot@lists.busybox.net>; Sun, 25 Feb 2024 13:38:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sIfDeLv8T2Mr for <buildroot@lists.busybox.net>;
 Sun, 25 Feb 2024 13:38:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E2B2A81CE7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2B2A81CE7
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E2B2A81CE7
 for <buildroot@buildroot.org>; Sun, 25 Feb 2024 13:38:23 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-412a4e58fd6so120095e9.3
 for <buildroot@buildroot.org>; Sun, 25 Feb 2024 05:38:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708868301; x=1709473101;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BWP/p+B6CVTC/pVV4gilPjxkqdTBWSHm128nt7Jmm8Y=;
 b=e65vomCgD0xAuhFtLRYMoJTAZJv59Xd7S88AmENb10Vlg6xyuL/A7oodKq1tb9VBB6
 we9UrBV5OAfIvVyCrrZV7wGdJ51EYF0BRZx43ZDk6HGSYs+FrAy7klwBlYO8FKuiOQxY
 xNj2OZK8cjjl3mKnXm4uVdQ2rUGrGKvIviHZaZ31jayqREB/YQ1WvRT3URPT9V6lLgFa
 W/JDOr2zFNnTynn8YpGTEKvaGWfjJXdJ2vWAHQ1bxXnnSmQX0BVLW1/8onJx7M6r/YsY
 B7DY7c01iXSn/P05ME732hdX0COy2acHAx7r3U+ANzGt1B1ifsJY75ClYtMneq/APXgf
 45hg==
X-Gm-Message-State: AOJu0Yw0D+o6OxFmk9SU2ukVrPj7f+AL+OXzh+p7/YD++n7EX1sTetPo
 O7CY2gEFvRw0c30pUi37FeLoFRGA3n7gmmnHEEJ1F/sZbI/mfwN7vXaYwbT0
X-Google-Smtp-Source: AGHT+IGtNtY9fSf9WXsSzIJRe6z2ldYYPIFu9BnraW8RbXExytbCgRfHxVH04ar/5WKZgCiPHhTB3Q==
X-Received: by 2002:a05:600c:3548:b0:412:a338:f55a with SMTP id
 i8-20020a05600c354800b00412a338f55amr884041wmq.21.1708868301253; 
 Sun, 25 Feb 2024 05:38:21 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 y16-20020a05600c365000b0041296bac040sm7684986wmq.26.2024.02.25.05.38.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Feb 2024 05:38:20 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 25 Feb 2024 14:38:18 +0100
Message-ID: <20240225133818.1364667-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708868301; x=1709473101; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BWP/p+B6CVTC/pVV4gilPjxkqdTBWSHm128nt7Jmm8Y=;
 b=FxrGOR1sQ8EOdaFsC3kcPIap6Rm0NmeHNX7wKEaIQtiMSdvSA+jenFpR2I9nE7qhDe
 JgSA8rh00TfI8NnfVQIEbuHnMiWYXOBY0xiH4ugs0ZyWMmyRbg1BbI2qSFcAZTVm699j
 sw8hpjT2CXwNI1s0MGB1DJl9Vy0twT5/E5X4IpY3vs3OAqVd+LUvSDn4xLAfnOg1EgtV
 Vzj/0bIeMU5VOlgo0BUNQCp/tfj7kt6P+42NyaDrHPoIBQEoPzXJgKUNP01hGf0lMuAR
 B8uludlYxXmr2XE96YiI6fc7shsslvqjq71+tkwdmHrgh+0X/yscPkOzrMFvJFq39wBY
 hXDw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=FxrGOR1s
Subject: [Buildroot] [PATCH 1/1] package/libpthsem: fix build with autoconf
 >= 2.72
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
Cc: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Move fi statement where it belongs to fix the following build failure
raised since bump of autoconf to version 2.72 in commit
524f3536029dace3ce9aa154d3ca4685582e1955:

checking for stack setup via makecontext... ./configure: line 15863: syntax error near unexpected token `;;'

Fixes: 524f3536029dace3ce9aa154d3ca4685582e1955
 - http://autobuild.buildroot.org/results/013e0d3f72582ce3675f65786c014518682d703b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...lude.m4-fix-build-with-autoconf-2.72.patch | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/libpthsem/0002-acinclude.m4-fix-build-with-autoconf-2.72.patch

diff --git a/package/libpthsem/0002-acinclude.m4-fix-build-with-autoconf-2.72.patch b/package/libpthsem/0002-acinclude.m4-fix-build-with-autoconf-2.72.patch
new file mode 100644
index 0000000000..0c66482c3a
--- /dev/null
+++ b/package/libpthsem/0002-acinclude.m4-fix-build-with-autoconf-2.72.patch
@@ -0,0 +1,36 @@
+From 3ec1a1c22142c547bc7f44622291bf0abdc322f1 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 25 Feb 2024 14:33:02 +0100
+Subject: [PATCH] acinclude.m4: fix build with autoconf >= 2.72
+
+Move fi statement where it belongs to fix the following build failure
+with autoconf >= 2.72:
+
+checking for stack setup via makecontext... ./configure: line 15863: syntax error near unexpected token `;;'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/013e0d3f72582ce3675f65786c014518682d703b
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/linknx/pthsem/pull/1
+---
+ acinclude.m4 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/acinclude.m4 b/acinclude.m4
+index 03b42de..d74889f 100644
+--- a/acinclude.m4
++++ b/acinclude.m4
+@@ -1426,8 +1426,8 @@ ac_cv_stacksetup_$1='guessed:(skaddr),(sksize)'
+ ])
+ dnl #   restore original compile environment
+ CFLAGS="$OCFLAGS"
+-])dnl
+ fi
++])dnl
+ dnl #   extract result ingredients of single cached result value
+ type=`echo $ac_cv_stacksetup_$1 | sed -e 's;:.*$;;'`
+ addr=`echo $ac_cv_stacksetup_$1 | sed -e 's;^.*:;;' -e 's;,.*$;;'`
+-- 
+2.43.0
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

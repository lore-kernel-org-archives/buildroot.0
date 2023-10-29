Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 930CBC4332F
	for <buildroot@archiver.kernel.org>; Sun, 29 Oct 2023 21:43:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 090F34F0D8;
	Sun, 29 Oct 2023 21:43:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 090F34F0D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FDG7raSCThFZ; Sun, 29 Oct 2023 21:43:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3621A4F0CF;
	Sun, 29 Oct 2023 21:43:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3621A4F0CF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E744B1BF3DA
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 21:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B8ACB4F0CF
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 21:43:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8ACB4F0CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8BIxjZmB2QgC for <buildroot@lists.busybox.net>;
 Sun, 29 Oct 2023 21:43:14 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 68CDE4F0B8
 for <buildroot@buildroot.org>; Sun, 29 Oct 2023 21:43:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68CDE4F0B8
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40842752c6eso30300995e9.1
 for <buildroot@buildroot.org>; Sun, 29 Oct 2023 14:43:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698615792; x=1699220592;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=STNpnF95exs6DLYwgr5zGnnegneM0i+Fzzc5eSmq0hw=;
 b=SmXFIiIyDdx8dgVONFdaLW9YCtLSLtQ5qFc65/Zic62HRJxgGorCflhAZ8uQDT5CUu
 HbLFk4e+/vmyKAIRvaSAaqeNP+Ll04uDmnA9V+f9X0aNymH3421nXYf5EOk6y2byZXH3
 KlOTZ8nywxdDk6b8/9jXm6sCjx8keMMrlOVBefEVIsnq4xViynlLjnrj9+XBq7oxaVHA
 WhKtxLDEQAl1QSYQmTFuZU+6oB+xuqVnuEIWlf5UzldhqeAM8zDITRrboLBYiyVgfvaZ
 IY6upru4vLPkmF3j/0LquIWa2a2WjG1TA9dJ1uVXewwwurZPmVqSAGUfkMMQCl3qhsPn
 C01Q==
X-Gm-Message-State: AOJu0Yx0P9zpIwxmDnQIV6DtcRdWnlhWkwXaDlLAZRE/pyD0zRVG/obd
 J9rnkuSKGChWKTV0Z6ZkFOY64PuXkv4=
X-Google-Smtp-Source: AGHT+IG6VzprA9qwu3q63qWf2UfP8n1qZ3cPzXkNOdJHlFFX9JMBmcJXnD0BdBPLBmEgsPPdZiZQVA==
X-Received: by 2002:a05:600c:1d07:b0:407:8317:ad81 with SMTP id
 l7-20020a05600c1d0700b004078317ad81mr7365603wms.1.1698615791839; 
 Sun, 29 Oct 2023 14:43:11 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 t9-20020a05600c198900b00403b63e87f2sm7584506wmq.32.2023.10.29.14.43.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Oct 2023 14:43:11 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 29 Oct 2023 22:43:09 +0100
Message-ID: <20231029214309.8929-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698615792; x=1699220592; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=STNpnF95exs6DLYwgr5zGnnegneM0i+Fzzc5eSmq0hw=;
 b=hndIm1n3oAk9alX5mvGjuuhA2Ma1fpTE+0EgAoa3/h0dXBafy4aw+QH03hBGKLYbLm
 AOtWiJwHurZTV52QoZNE1MWmXafVgzNRZUIKgLUJ+iueORjj93qXEeEb25mKlhBVHA1c
 FNyHGTqTAldIuBZGGvrWTL5eYUYzbbB5bdZAdtTTjj6/lojp5PEK9jl53+zqTywU1lmI
 1BieCiB2bxZZK77F+ZmUD57tZgAvjk80f1PMRdVeZ1inpQx3NDySV6AR+jFQuRc87bTP
 PZwfEsdLR+VvKfphYOVJb95IYE1IDrwlwVlVVmj9b4/w7ifXOsrtk9LYOL2arlN3Sg12
 vCGw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hndIm1n3
Subject: [Buildroot] [PATCH 1/1] package/yaml-cpp: bump to version 0.8.0
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

https://github.com/jbeder/yaml-cpp/releases/tag/0.8.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/yaml-cpp/yaml-cpp.hash | 2 +-
 package/yaml-cpp/yaml-cpp.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/yaml-cpp/yaml-cpp.hash b/package/yaml-cpp/yaml-cpp.hash
index 9ad9041439..92bf65d2f7 100644
--- a/package/yaml-cpp/yaml-cpp.hash
+++ b/package/yaml-cpp/yaml-cpp.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  43e6a9fcb146ad871515f0d0873947e5d497a1c9c60c58cb102a97b47208b7c3  yaml-cpp-0.7.0.tar.gz
+sha256  fbe74bbdcee21d656715688706da3c8becfd946d92cd44705cc6098bb23b3a16  yaml-cpp-0.8.0.tar.gz
 sha256  aa6fcc27be034e41e21dd832f9175bfe694a48491d9e14ff0fa278e19ad14f1b  LICENSE
diff --git a/package/yaml-cpp/yaml-cpp.mk b/package/yaml-cpp/yaml-cpp.mk
index 367df27ff1..1f87956589 100644
--- a/package/yaml-cpp/yaml-cpp.mk
+++ b/package/yaml-cpp/yaml-cpp.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-YAML_CPP_VERSION = 0.7.0
-YAML_CPP_SITE = $(call github,jbeder,yaml-cpp,yaml-cpp-$(YAML_CPP_VERSION))
+YAML_CPP_VERSION = 0.8.0
+YAML_CPP_SITE = $(call github,jbeder,yaml-cpp,$(YAML_CPP_VERSION))
 YAML_CPP_INSTALL_STAGING = YES
 YAML_CPP_LICENSE = MIT
 YAML_CPP_LICENSE_FILES = LICENSE
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

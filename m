Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77F1DC47077
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 13:57:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0ABD5404B5;
	Tue,  2 Jan 2024 13:57:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0ABD5404B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OnIw9AIqT2yA; Tue,  2 Jan 2024 13:57:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 130634051C;
	Tue,  2 Jan 2024 13:57:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 130634051C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4BC581BF314
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 13:57:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 217F040131
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 13:57:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 217F040131
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aquKJeZ76VjG for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 13:57:49 +0000 (UTC)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0B9334012C
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 13:57:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B9334012C
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40d88f9e602so13334245e9.3
 for <buildroot@buildroot.org>; Tue, 02 Jan 2024 05:57:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704203866; x=1704808666;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8Ys3doA1NtjTwbj6pcF0HEdAzr0+DryeKpr4KrUKtgg=;
 b=fivfB6p2azF+346i6kZlyJEXvdocYJmIX+rPRJSnemJX5luZeqOPthw8yF5h1gYH92
 qnYxvGRb4ggCtc+0ZFudTrpaVczvWHoOQOb3G6EIpqaBaGz8LfEEqFlQt1vzjCW7TKHx
 m9bpLXwrTk3c5Py5rg/FHNZTVUfxP7FahpbIGDsf9YMpZx5AuBEHSfDeNjeb+jNTkoF4
 sJ7lKdyqk1ZVxacIWsryigeWif4PNhBlDVW1AaMcwrqs0eW2K8tHa0I8lKqrdl6c0NP8
 wdSbjioJNbXr4LgXzbUBp+gAh/IsdRx/6HE36b7shBJSQioOLrhPthN2l+SvJBSzaFtG
 NKeg==
X-Gm-Message-State: AOJu0YyCD9OpnQey060k4aZXFPS0yhCmMbIXjgVJXbaGoND+z7iK41Uz
 D3acAXPdwj1/LBzODcEYRNUoYWvkLcg=
X-Google-Smtp-Source: AGHT+IEzkIND01PddFkJJVKClm0OhCUI+UIM7zwwaeGIta6xDjxmz6utHtN1aHI+O9PBImJbuIrFcw==
X-Received: by 2002:a7b:c4cc:0:b0:40d:88f2:fe6d with SMTP id
 g12-20020a7bc4cc000000b0040d88f2fe6dmr1444325wmk.98.1704203865842; 
 Tue, 02 Jan 2024 05:57:45 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 l4-20020a05600c1d0400b0040d3276ba19sm44622167wms.25.2024.01.02.05.57.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jan 2024 05:57:45 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  2 Jan 2024 14:57:41 +0100
Message-ID: <20240102135741.1296172-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704203866; x=1704808666; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8Ys3doA1NtjTwbj6pcF0HEdAzr0+DryeKpr4KrUKtgg=;
 b=kZ73hkowWetFMRcvkxT3bgLrGbmZtQeXA3WO4aUu2tUc3RD5Lah55iCUOvdw/vjh0D
 PeAqPBxRsfvDce+G/z7FMs8ZogpF20y7od3YcWwWUwzYvUHWmuAuzS6epZqxat1pnyUP
 Qyl/yUbrc3xEinh7sIxYrGHVpiWVvWe1Hzn4JHvBsvD4N0/r7+Fj9q30jKUDzT75hQ7D
 LGqfECnqeQJstpJMdyCJm9zA6UY5BS6t6zkPD2fCag5EcixjpKXljYMdMjlZBizdxMFE
 lMKXZSyelJ3PFR4xxs9HxGxdiDmvSkyE5PSBT6spPhtW6JZ0MN4vV9qVVAYqeiqUnNvW
 qPYA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kZ73hkow
Subject: [Buildroot] [PATCH 1/1] package/glm: bump to version 0.9.9.8
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

License is in a separate file since
https://github.com/g-truc/glm/commit/347f422b9fda328a4eecfdc0e5bf5b19bc5c37e4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/glm/glm.hash | 4 ++--
 package/glm/glm.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/glm/glm.hash b/package/glm/glm.hash
index b0c1d92c74..c4e2101604 100644
--- a/package/glm/glm.hash
+++ b/package/glm/glm.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  5e33b6131cea6a904339734b015110d4342b7dc02d995164fdb86332d28a5aa4  glm-0.9.9.5.tar.gz
-sha256  337130631a714eeae017556cad101d5324c2961214120b6214741d3d43667086  manual.md
+sha256  7d508ab72cb5d43227a3711420f06ff99b0a0cb63ee2f93631b162bfe1fe9592  glm-0.9.9.8.tar.gz
+sha256  62d2d642c7d054d4fb4c9b42faad617d6c88fcd91e317f8035aa9f277cc159c3  copying.txt
diff --git a/package/glm/glm.mk b/package/glm/glm.mk
index 3ef106a943..ef549931f6 100644
--- a/package/glm/glm.mk
+++ b/package/glm/glm.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-GLM_VERSION = 0.9.9.5
+GLM_VERSION = 0.9.9.8
 GLM_SITE = $(call github,g-truc,glm,$(GLM_VERSION))
 GLM_LICENSE = MIT
-GLM_LICENSE_FILES = manual.md
+GLM_LICENSE_FILES = copying.txt
 
 # GLM is a header-only library, it only makes sense
 # to have it installed into the staging directory.
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB183C38A02
	for <buildroot@archiver.kernel.org>; Sat, 29 Oct 2022 17:19:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69EBA40894;
	Sat, 29 Oct 2022 17:19:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69EBA40894
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t4YYyD-9uOfd; Sat, 29 Oct 2022 17:19:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C8E940883;
	Sat, 29 Oct 2022 17:19:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C8E940883
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CA7411BF255
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 17:19:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B256060671
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 17:19:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B256060671
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yq4vaz-BsPS3 for <buildroot@lists.busybox.net>;
 Sat, 29 Oct 2022 17:19:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 891DF605AE
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 891DF605AE
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 17:19:52 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id l14so10433298wrw.2
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 10:19:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Wve5/NF+AShKVS6VR+GiRpebOBhLwE/akqzKbTwKAjU=;
 b=Ix457zHvLHPqZpFDhmZIq4FHDimkyykblfm1yAhRPFOkOBy9dO5Yrfne4g4iHNCtn2
 PHtpobSb7X2EAgyaFyhLtaO9mylSRmP+Ki2uv0cuXd3v6txgjd/jJtQoPeZpJr+fNgIl
 raqc/JrLpMxy3lJveohVqJOnxKiS+aW4fO3AChhXr4WrQV1dIGbIx/7+B4n+k8FWr0Oo
 iJdxsplCOT4qWWQfhbBIwNPpfeLx6BZk3+cKj1Whlw4g3jaO/HnrSBpUI4TL65lZnyxz
 72kJQFwZuEGO50hLWuZO/Wa/HNS49ho4ugyXd6HsxyA/MihoR9w6w8rgNc4foklL5nk8
 hzyw==
X-Gm-Message-State: ACrzQf35mSx9gAqxI6YB7cqyVi94ClkB8oJiJ5ALjiXaYLyQJ/yVEuzS
 J9UPMWgnSeV/RZmXOnPvciRU5Sl2OQ0=
X-Google-Smtp-Source: AMsMyM4bZ6WgJ01nvPQBPq+VFWuT0xCxs/rxCjT+T0JuOkM7GC+aGvOIjkz0Wn9j2mIfJ1mrenBOXA==
X-Received: by 2002:a05:6000:170d:b0:236:6aa1:8a56 with SMTP id
 n13-20020a056000170d00b002366aa18a56mr2809810wrc.302.1667063990160; 
 Sat, 29 Oct 2022 10:19:50 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 r22-20020a05600c425600b003b4ac05a8a4sm2341469wmm.27.2022.10.29.10.19.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Oct 2022 10:19:49 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 29 Oct 2022 19:19:48 +0200
Message-Id: <20221029171948.232254-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Wve5/NF+AShKVS6VR+GiRpebOBhLwE/akqzKbTwKAjU=;
 b=JqzCSKgsOIC/ezADroDOLRDgffjt75sD+3PTD/xrPIveXxG5Ple5INH7J9PA9MWqu0
 sqZjhFpRb/hh7q6w4wrwjoWfECEBlS4dNO+6S//Z2H3Fn6sSdwCtzpaC7W5n8SSLSjJo
 cW+L8uTiZg3ytwG3KaKBe8TeiHBxpib+zgNV0+XrO5uYXEFejDOiJKLej3lE9yQMd2Oc
 JLPhvc4eagZtTxGAa4PUKEMK4mxUCZ3Vr+KXU7OsMvbYWmbbAStbZxQKSBpV7pON4QU4
 YerjqWRRktxE+KlJP2ArLaReoxtMdWd1Dhj7+8NyVp8brDJpCH90EnAB7nWzz6s3V+hh
 Wgrw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=JqzCSKgs
Subject: [Buildroot] [PATCH 1/1] package/pps-tools: bump to version 1.0.3
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

https://github.com/ago/pps-tools is redirecting to
https://github.com/redlab-i/pps-tools

https://github.com/redlab-i/pps-tools/compare/e2b25049df9a4da28168b7378016f1650d0dfa6b...v1.0.3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pps-tools/Config.in      | 2 +-
 package/pps-tools/pps-tools.hash | 2 +-
 package/pps-tools/pps-tools.mk   | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/pps-tools/Config.in b/package/pps-tools/Config.in
index 0c4bb112a9..16caef3e0e 100644
--- a/package/pps-tools/Config.in
+++ b/package/pps-tools/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_PPS_TOOLS
 	  Pulse per second tools. Provides timepps.h and other PPS
 	  utilities.
 
-	  https://github.com/ago/pps-tools/
+	  https://github.com/redlab-i/pps-tools/
diff --git a/package/pps-tools/pps-tools.hash b/package/pps-tools/pps-tools.hash
index ee3e4e3d79..b8cc2f64d5 100644
--- a/package/pps-tools/pps-tools.hash
+++ b/package/pps-tools/pps-tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1168f1474235017af413afdb07288303ad7a7b12a0282f3bf9ed0e22fe0d7d2e  pps-tools-e2b25049df9a4da28168b7378016f1650d0dfa6b.tar.gz
+sha256  89163e29f1a4a0a702bbe25b900fd37d2eb86442329cefee58847e57e1964d7a  pps-tools-1.0.3.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/pps-tools/pps-tools.mk b/package/pps-tools/pps-tools.mk
index 2d82cf7dad..0aa22acf4e 100644
--- a/package/pps-tools/pps-tools.mk
+++ b/package/pps-tools/pps-tools.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PPS_TOOLS_VERSION = e2b25049df9a4da28168b7378016f1650d0dfa6b
-PPS_TOOLS_SITE = $(call github,ago,pps-tools,$(PPS_TOOLS_VERSION))
+PPS_TOOLS_VERSION = 1.0.3
+PPS_TOOLS_SITE = $(call github,redlab-i,pps-tools,v$(PPS_TOOLS_VERSION))
 PPS_TOOLS_INSTALL_STAGING = YES
 PPS_TOOLS_LICENSE = GPL-2.0+
 PPS_TOOLS_LICENSE_FILES = COPYING
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

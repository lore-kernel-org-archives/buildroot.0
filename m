Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D059C64EC4
	for <buildroot@archiver.kernel.org>; Tue, 28 Feb 2023 22:16:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A41CF605A9;
	Tue, 28 Feb 2023 22:16:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A41CF605A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lKyFABEooJtn; Tue, 28 Feb 2023 22:16:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 709BC60B0F;
	Tue, 28 Feb 2023 22:16:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 709BC60B0F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C10521BF580
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 22:16:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9326260AE7
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 22:16:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9326260AE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d6o7ssHjYvsr for <buildroot@lists.busybox.net>;
 Tue, 28 Feb 2023 22:16:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00183605A9
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 00183605A9
 for <buildroot@buildroot.org>; Tue, 28 Feb 2023 22:16:28 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id p26so7407504wmc.4
 for <buildroot@buildroot.org>; Tue, 28 Feb 2023 14:16:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677622587;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aq869mqmV7feXi3Gxz2K8g4yNIUrAPoGjZoFVEePTf0=;
 b=SnSWAOlJ72w3Am7lLAVaXA6zHdiDOWbjSbBcr6toKelICcY3oOLDAzK5l93Z/mu3eo
 poufM7YQ2XarjQ1TEAu0tPosAozKNdhW4qPO5Cjg56EsOyYKS0DLMnSFcaIU5YqqSQwK
 SvquutzP6UCUIh2k6Lw3mGTyJf+q/XzPo60OBKxUQGeLVtak1wN6I9pkJcjiQ4J/QgWH
 TKvC6bxclxmeYOl3pkGuTiOp3LmE7U+qMWIpHzHIJylhK/eFBz5KA4cdgDa5bp2lf0wf
 +fMi2wtNlZjvQdM+THFZAkTIOaj6nkAfMrgiMT25G/X6sMV0BxpJW+9tA0djLPHLIxgw
 pmRQ==
X-Gm-Message-State: AO0yUKXT1QzQQSKybvkCgCiIG5evWznl+TNVEF2ePGZjxYchj5J0g3oC
 z9yghJhPIaFdqvntyuGXfeMyglYflk4=
X-Google-Smtp-Source: AK7set8x4eaV7YMjXuCnEsbHP1/cssAybQq6Y/3y0wXY/5FWMyAdS052LFKlJ4Qky2QsO15kGB3WnQ==
X-Received: by 2002:a05:600c:331b:b0:3eb:29fe:7b9e with SMTP id
 q27-20020a05600c331b00b003eb29fe7b9emr3277489wmp.17.1677622586815; 
 Tue, 28 Feb 2023 14:16:26 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 y22-20020a1c4b16000000b003db01178b62sm16796163wma.40.2023.02.28.14.16.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 14:16:26 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Feb 2023 23:16:24 +0100
Message-Id: <20230228221624.59583-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677622587;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aq869mqmV7feXi3Gxz2K8g4yNIUrAPoGjZoFVEePTf0=;
 b=KqqCOGObNBRr4EMGbPMcoMp8v5A3cMUVYahG42ZaYZW8KcgIQEqk+qNjLlNQbLFQUp
 5Vm1tlqFYGyuQEKRkEZMB8QUQYLpwWKkIjfIwJiW+smkusuGGXzTjObSOGiCYmKu4FHI
 WhXTvZxtVt+4WRsfr7D6BGO5rlQOFk8tjl1sW5sx24lKeg6m1ABg2y9V86sGg388yGDx
 RSN8SEkwK4o2o0mX/BkSHkRbHPtYDR7IyLh77K8Py9B9OlnpImzi8A763FhbZo090UO1
 E58pLdBk71cXyyd3zNDtBXKqVPjQ8fXy3OFPCdTiU4WzXcietTs7BbQwib4ETLhkLpJo
 hm6Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=KqqCOGOb
Subject: [Buildroot] [PATCH 1/1] package/pugixml: drop header-only option
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
Cc: Theo Debrouwere <t.debrouwere@televic.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Header-only option raises the following build failure with gerbera since
commit cc3a4a7b1de7b158354c650d234339e8a969a730:

/home/thomas/autobuild/instance-2/output-1/host/lib/gcc/nios2-buildroot-linux-gnu/10.4.0/../../../../nios2-buildroot-linux-gnu/bin/ld: CMakeFiles/gerbera.dir/src/main.cc.o: in function `ConfigGenerator::~ConfigGenerator()':
/home/thomas/autobuild/instance-2/output-1/build/gerbera-1.10.0/src/config/config_generator.h:33: undefined reference to `pugi::xml_document::~xml_document()'

This build failure can't be fixed by adding a
!BR2_PACKAGE_PUGIXML_HEADER_ONLY dependency as it will create the
following recursive dependency:

package/gerbera/Config.in:1:error: recursive dependency detected!
package/gerbera/Config.in:1:    symbol BR2_PACKAGE_GERBERA depends on BR2_PACKAGE_PUGIXML_HEADER_ONLY
package/pugixml/Config.in:42:   symbol BR2_PACKAGE_PUGIXML_HEADER_ONLY depends on BR2_PACKAGE_PUGIXML
package/pugixml/Config.in:1:    symbol BR2_PACKAGE_PUGIXML is selected by BR2_PACKAGE_GERBERA

Moreover, commit 48b2e50eb8df36e3e3ab18692bd9e0dde3b38702 stated that
"Compact and header-only modes are not strictly needed for our use case,
but we did the work anyway and may be useful for someone else."

So dropping header-only seems to be the right approach

Fixes:
 - http://autobuild.buildroot.org/results/800537a1ef5f48d24c20aad7a9c96c56dfdc77f5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 Config.in.legacy           | 6 ++++++
 package/pugixml/Config.in  | 9 ---------
 package/pugixml/pugixml.mk | 4 ----
 3 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 381e1e3a8c..a31543d5fa 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2023.02"
 
+config BR2_PACKAGE_PUGIXML_HEADER_ONLY
+	bool "pugixml header-only removed"
+	select BR2_LEGACY
+	help
+	  The header-only version raises a build failure with gerbera.
+
 config BR2_PACKAGE_UCCP420WLAN
 	bool "uccp420wlan removed"
 	select BR2_LEGACY
diff --git a/package/pugixml/Config.in b/package/pugixml/Config.in
index 6b7d2e3259..d5a3cb3ebb 100644
--- a/package/pugixml/Config.in
+++ b/package/pugixml/Config.in
@@ -39,15 +39,6 @@ config BR2_PACKAGE_PUGIXML_COMPACT
 
 	  http://pugixml.org/docs/manual.html#dom.memory.compact
 
-config BR2_PACKAGE_PUGIXML_HEADER_ONLY
-	bool "Enable header-only version"
-	help
-	  All source code for pugixml will be included in every
-	  translation unit that includes pugixml.hpp. This is how most
-	  of Boost and STL libraries work.
-
-	  http://pugixml.org/docs/manual.html#install.building.header
-
 endif
 
 comment "pugixml needs a toolchain w/ C++"
diff --git a/package/pugixml/pugixml.mk b/package/pugixml/pugixml.mk
index c8d59f0864..415227a40a 100644
--- a/package/pugixml/pugixml.mk
+++ b/package/pugixml/pugixml.mk
@@ -31,10 +31,6 @@ endif
 PUGIXML_BUILD_DEFINES += PUGIXML_HAS_LONG_LONG
 HOST_PUGIXML_BUILD_DEFINES += PUGIXML_HAS_LONG_LONG
 
-ifeq ($(BR2_PACKAGE_PUGIXML_HEADER_ONLY),y)
-PUGIXML_BUILD_DEFINES += PUGIXML_HEADER_ONLY
-endif
-
 PUGIXML_CONF_OPTS += -DPUGIXML_BUILD_DEFINES="$(subst $(space),;,$(PUGIXML_BUILD_DEFINES))"
 
 HOST_PUGIXML_CONF_OPTS += \
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACFC5C00140
	for <buildroot@archiver.kernel.org>; Fri, 12 Aug 2022 10:17:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EC6C831AC;
	Fri, 12 Aug 2022 10:17:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2EC6C831AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tegwj3LgtzgD; Fri, 12 Aug 2022 10:17:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36B0582FD5;
	Fri, 12 Aug 2022 10:17:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36B0582FD5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CADA91BF28E
 for <buildroot@lists.busybox.net>; Fri, 12 Aug 2022 10:17:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B1DF1418D7
 for <buildroot@lists.busybox.net>; Fri, 12 Aug 2022 10:17:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1DF1418D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bJYisaL7GCxQ for <buildroot@lists.busybox.net>;
 Fri, 12 Aug 2022 10:17:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 234D2418D2
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 234D2418D2
 for <buildroot@buildroot.org>; Fri, 12 Aug 2022 10:17:27 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id z17so699340wrq.4
 for <buildroot@buildroot.org>; Fri, 12 Aug 2022 03:17:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=ZyqxMCYSPlkjzWGeIGhu3Zwd7IyNEQsNriiD/lMLbvg=;
 b=nyzcCGUZiPNkaDrkw/GWUi1fKWPBaMu/C4yezCKdLdW8kib46hyGNwUkDk4pBYMSJm
 NzdNUyRa7dPYV1MCTMoqKp9Rsa492IyFE4aFJKv3sdz2v4gSsXZS6+d5fn74hrn9C9GC
 32tGhW/o5UFu/VHQcBcfucyGgPwMhwNKfeBukzsjdrbmtytiZtn894FAtL/Ay4pak663
 NkqTns6w/voxLd9zTfU9rfOtzTp4U0GW6zW4C1wGeYj1fO/bw3d2GwCch3Mcd76ZnH0x
 3cTcL4c45HJxA5KcUROs/544vVHJqZ13gLWKYHm6dnKtMBx0ZgrAKSTsKdAkdbRyU0Y4
 NJxQ==
X-Gm-Message-State: ACgBeo1jCzRHTfe9fgG0Ucajtn5Lb1iC7mvGG0KYwgCs4WGWcmVjcHb5
 UlD556LRSyrr+ZOVBytsrcg9pLaOU5E=
X-Google-Smtp-Source: AA6agR6IWU3kiGLi5Z7irDPCRTDI/TYnmyQ1AXHhuilh4OQWwBQwZCgTDO+jziAjwmAI3MZ5uY7I6g==
X-Received: by 2002:a5d:6811:0:b0:223:8131:e580 with SMTP id
 w17-20020a5d6811000000b002238131e580mr1753154wru.77.1660299444999; 
 Fri, 12 Aug 2022 03:17:24 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b0064fd3ce37118e62f.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:64fd:3ce3:7118:e62f])
 by smtp.gmail.com with ESMTPSA id
 d14-20020a5d4f8e000000b0021efc75914esm1499585wru.79.2022.08.12.03.17.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 03:17:24 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 12 Aug 2022 12:17:18 +0200
Message-Id: <20220812101718.47491-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=ZyqxMCYSPlkjzWGeIGhu3Zwd7IyNEQsNriiD/lMLbvg=;
 b=PHBECvbrYWdiybjI8+kyIFCiwkX+mRDEt6BVbekGrqnfQNyNCrSn7Qsvhlh3GkoYd0
 IpH/lU2krI07W32K2ctx7MZWTp7CEY01sLm5qDU8WcIlARvZfdxeilBKNSPCFOjiSoAm
 GCXLJHai3pWwEtfab5sRo2bhPRDvheFQnt8S/8nFqICVcwyol1SdaBXj5l/XremiHRnO
 ZKq2IqtUmlUMIOSibrwnLOky4B+iHzJsVVrOzKEm9lxDr6pcEqM3R0j/N7nvp66SnMOI
 AJaIdgjut6o+KamZ1QdWswJeyr9RGkuOkoM1wXtRS+ugrdH0uOOPmylg7fd4GRIeDdp3
 2l6w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=PHBECvbr
Subject: [Buildroot] [PATCH v2, 1/1] package/poppler: fix introspection build
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
Cc: Olivier Schonken <olivier.schonken@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since commit
9d1d4818c39d97ad7a1cdf6e075b9acae6dfff71:

[ 98%] Generating Poppler-0.18.typelib
Could not find GIR file 'GObject-2.0.gir'; check XDG_DATA_DIRS or use --includedir
error parsing file /home/giuliobenetti/autobuild/run/instance-1/output-1/build/poppler-21.12.0/glib/Poppler-0.18.gir: Failed to parse included gir GObject-2.0
If the above error message is about missing .so libraries, then setting up GIR_EXTRA_LIBS_PATH in the .mk file should help.
Typically like this: PKG_MAKE_ENV += GIR_EXTRA_LIBS_PATH="$(@D)/.libs"

Fixes:
 - http://autobuild.buildroot.org/results/d2f50aa56410c2fff8a0538c57038104906e747e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Rebase on top of master
 - Use upstream commit

 ...txt-allow-the-user-to-configure-INTR.patch | 43 +++++++++++++++++++
 package/poppler/poppler.mk                    |  3 +-
 2 files changed, 45 insertions(+), 1 deletion(-)
 create mode 100644 package/poppler/0002-glib-CMakeLists.txt-allow-the-user-to-configure-INTR.patch

diff --git a/package/poppler/0002-glib-CMakeLists.txt-allow-the-user-to-configure-INTR.patch b/package/poppler/0002-glib-CMakeLists.txt-allow-the-user-to-configure-INTR.patch
new file mode 100644
index 0000000000..079cf7234d
--- /dev/null
+++ b/package/poppler/0002-glib-CMakeLists.txt-allow-the-user-to-configure-INTR.patch
@@ -0,0 +1,43 @@
+From e9d5731ba254f35e2d94b628c51e48c50a945271 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 24 Jan 2022 09:28:20 +0100
+Subject: [PATCH] glib/CMakeLists.txt: allow the user to configure
+ INTROSPECTION_COMPILER_ARGS
+
+Allow the user to add its own parameters such as
+--includedir=$(STAGING_DIR)/usr/share/gir-1.0 to
+INTROSPECTION_COMPILER_ARGS to avoid the following build failure when
+cross-compiling with buildroot:
+
+[ 98%] Generating Poppler-0.18.typelib
+Could not find GIR file 'GObject-2.0.gir'; check XDG_DATA_DIRS or use --includedir
+error parsing file /home/giuliobenetti/autobuild/run/instance-1/output-1/build/poppler-21.12.0/glib/Poppler-0.18.gir: Failed to parse included gir GObject-2.0
+If the above error message is about missing .so libraries, then setting up GIR_EXTRA_LIBS_PATH in the .mk file should help.
+Typically like this: PKG_MAKE_ENV += GIR_EXTRA_LIBS_PATH="$(@D)/.libs"
+
+Fixes:
+ - http://autobuild.buildroot.org/results/d2f50aa56410c2fff8a0538c57038104906e747e
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://gitlab.freedesktop.org/poppler/poppler/-/commit/e9d5731ba254f35e2d94b628c51e48c50a945271]
+---
+ glib/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/glib/CMakeLists.txt b/glib/CMakeLists.txt
+index 7510e69ee..f5130e3c9 100644
+--- a/glib/CMakeLists.txt
++++ b/glib/CMakeLists.txt
+@@ -119,7 +119,7 @@ if (HAVE_INTROSPECTION AND BUILD_SHARED_LIBS)
+   # General gir: Reset object-list for introspection & load tool args
+   set(INTROSPECTION_GIRS)
+   set(INTROSPECTION_SCANNER_ARGS "--add-include-path=${CMAKE_CURRENT_SOURCE_DIR}" "--warn-all")
+-  set(INTROSPECTION_COMPILER_ARGS "--includedir=${CMAKE_CURRENT_SOURCE_DIR}")
++  set(INTROSPECTION_COMPILER_ARGS ${INTROSPECTION_COMPILER_ARGS} "--includedir=${CMAKE_CURRENT_SOURCE_DIR}")
+ 
+   # Poppler: Assign package to gir & export keys
+   set(Poppler_0_18_gir "poppler-glib")
+-- 
+GitLab
+
diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index b54262e7c4..db6da25d39 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -47,7 +47,8 @@ POPPLER_DEPENDENCIES += gobject-introspection
 POPPLER_CONF_OPTS += \
 	-DENABLE_GOBJECT_INTROSPECTION=ON \
 	-DINTROSPECTION_SCANNER=$(STAGING_DIR)/usr/bin/g-ir-scanner \
-	-DINTROSPECTION_COMPILER=$(STAGING_DIR)/usr/bin/g-ir-compiler
+	-DINTROSPECTION_COMPILER=$(STAGING_DIR)/usr/bin/g-ir-compiler \
+	-DINTROSPECTION_COMPILER_ARGS="--includedir=$(STAGING_DIR)/usr/share/gir-1.0"
 else
 POPPLER_CONF_OPTS += -DENABLE_GOBJECT_INTROSPECTION=OFF
 endif
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

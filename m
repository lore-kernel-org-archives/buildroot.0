Return-Path: <SRS0=TKET=PH=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDEC9C433F5
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 05:27:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 288206008E
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 05:27:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 288206008E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A492D405CF;
	Tue, 19 Oct 2021 05:27:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ANWSgeF3ujgV; Tue, 19 Oct 2021 05:27:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2B56404EE;
	Tue, 19 Oct 2021 05:27:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 010DC1BF83E
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 05:27:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E483883BEA
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 05:26:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FddMhEWBS-wV for <buildroot@lists.busybox.net>;
 Tue, 19 Oct 2021 05:26:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1061683BE9
 for <buildroot@buildroot.org>; Tue, 19 Oct 2021 05:26:56 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id g25so45284638wrb.2
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 22:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LFCmpdozcjRgq+IGFKkK19dXioaYwB5HIWKpUpL7TyQ=;
 b=F+A9NEKU5koOpewhaqEc1buiRVk68XzAV5p8gEbKuO3t7wDrgDFgyH5VVY9pnRYbTA
 R27RnYXx/rMoyJCNYreuhMVNQ09dWrxhYbypWkh+wVZqR2JTpj4f9x/snUay5qn8ZcBm
 O9nKYWvYVqgKJwD+/SpXIlUuJVfxczzzE2Kl4X+z2+P3S1EwV/7ynxLQ2xbqbZ1Y2p7q
 mXjHnAkHoDMdkXEywNXh08Yk6+hGU0JHPgi1Oh3FGq+iwxQGCKng+5LQ7b7mITKtuFCS
 vu3lLHzbRjtO8OKWCDH3ZAp7ugGADQuwQJTRZ0ulEnnFKiFHgtKVccytDsQ87FTofYSU
 74Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LFCmpdozcjRgq+IGFKkK19dXioaYwB5HIWKpUpL7TyQ=;
 b=1beFgE18VC2nKP+aIICUVevPoCps1gR+Aggspb87gy4tlwsvdHPYx9cM1b9inwZsk7
 2VPlhBANh2k1bhWjRiaqlcXkP4hg9U5g2WlUJIY11Q059DeK2+jrwM4Piu0NrVAl5+Oj
 5K9XbK5WM8VqDHgkyrdFjBlxKp01dvWLpAgVaIe+oYKzLg0Be7kzUubc/wM8fHN/THXf
 XRFm1V7VXNC1jF8dPNnptxxuZjWyyG19F2A9xuAhbPeu/XCxwa/u5/GLUqlOibd0o+ab
 9vfhhCkBbUurjhlU/eRroVEqvmt1tlGpnsY9NcjPgA94mDjXLyiU89ncIiJo0Xp8Ul7V
 rCOQ==
X-Gm-Message-State: AOAM531BlJKQ4o2q7oNzxZAhq41z4ncNf+l7tcz+WtPnj5iuBvhqfItI
 V3qM2r3OhiuuBP2p3lgH/0YSN8pY8e4=
X-Google-Smtp-Source: ABdhPJxVFueJA+rtCEELuIId2LvcEAL+L/v27y2gB0OyGXrysN61PqCbvHUflTay/FRty7DFEXIefw==
X-Received: by 2002:adf:9c02:: with SMTP id f2mr42531357wrc.201.1634621214921; 
 Mon, 18 Oct 2021 22:26:54 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id r9sm13790700wrn.95.2021.10.18.22.26.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 22:26:54 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 19 Oct 2021 07:25:31 +0200
Message-Id: <20211019052531.1604264-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gobject-introspection: needs host
 gcc >= 7
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
Cc: Grzegorz Blach <grzegorz@blach.pl>, Anisse Astier <anisse@astier.eu>,
 Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 33c69c02fb4c1176584d1e2dd336b74ed39f5d65 forgot to propagate
host gcc >= 7 dependency to reverse dependencies of host-qemu resulting
in the following build failure:

ERROR: You need at least GCC v7.5 or Clang v6.0 (or XCode Clang v10.0)

Fixes:
 - http://autobuild.buildroot.org/results/14cd0250d55c5ca5dc1d297aee1b927fda889531

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gobject-introspection/Config.in | 6 ++++--
 package/python-bluezero/Config.in       | 6 ++++--
 package/python-gobject/Config.in        | 6 ++++--
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/package/gobject-introspection/Config.in b/package/gobject-introspection/Config.in
index bacf44363c..c631c84755 100644
--- a/package/gobject-introspection/Config.in
+++ b/package/gobject-introspection/Config.in
@@ -13,6 +13,7 @@ config BR2_PACKAGE_GOBJECT_INTROSPECTION
 	# compile errors with locale.c. As such, require 4.9 until this
 	# can be verified.
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	depends on BR2_HOST_GCC_AT_LEAST_7 # host-qemu
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	# gobject-introspection does not require python3 to run on the
 	# target; however, because the tools run in a qemu wrapper, a
@@ -41,8 +42,9 @@ comment "gobject-introspection needs python3"
 	depends on !BR2_PACKAGE_PYTHON3
 	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
 
-comment "gobject-introspection needs a glibc toolchain, gcc >= 4.9"
+comment "gobject-introspection needs a glibc toolchain, gcc >= 4.9, host gcc >= 7"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_HOST_GCC_AT_LEAST_7
diff --git a/package/python-bluezero/Config.in b/package/python-bluezero/Config.in
index c391bfa858..3d40b1e275 100644
--- a/package/python-bluezero/Config.in
+++ b/package/python-bluezero/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PYTHON_BLUEZERO
 	bool "python-bluezero"
 	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS # python-gobject -> gobject-introspection
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # python-gobject -> gobject-introspection
+	depends on BR2_HOST_GCC_AT_LEAST_7 # python-gobject -> gobject-introspection -> host-qemu
 	depends on BR2_TOOLCHAIN_USES_GLIBC # python-gobject -> gobject-introspection
 	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_DBUS # runtime
@@ -12,8 +13,9 @@ config BR2_PACKAGE_PYTHON_BLUEZERO
 
 	  https://github.com/ukBaz/python-bluezero
 
-comment "python-bluezero needs a glibc toolchain, gcc >= 4.9"
+comment "python-bluezero needs a glibc toolchain, gcc >= 4.9, host gcc >= 7"
 	depends on BR2_PACKAGE_PYTHON3
 	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_HOST_GCC_AT_LEAST_7
diff --git a/package/python-gobject/Config.in b/package/python-gobject/Config.in
index 1c9303b0ba..910f990026 100644
--- a/package/python-gobject/Config.in
+++ b/package/python-gobject/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_PYTHON_GOBJECT
 	depends on BR2_USE_MMU # libglib2, gobject-introspection
 	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS # gobject-introspection
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # gobject-introspection
+	depends on BR2_HOST_GCC_AT_LEAST_7 # gobject-introspection -> host-qemu
 	depends on BR2_TOOLCHAIN_USES_GLIBC # gobject-introspection
 	depends on BR2_PACKAGE_PYTHON3 # gobject-introspection
 	select BR2_PACKAGE_GOBJECT_INTROSPECTION
@@ -12,8 +13,9 @@ config BR2_PACKAGE_PYTHON_GOBJECT
 
 	  https://wiki.gnome.org/action/show/Projects/PyGObject
 
-comment "python-gobject needs a glibc toolchain, gcc >= 4.9"
+comment "python-gobject needs a glibc toolchain, gcc >= 4.9, host gcc >= 7"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_HOST_GCC_AT_LEAST_7
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

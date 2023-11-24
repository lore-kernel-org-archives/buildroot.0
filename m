Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4710C61D97
	for <buildroot@archiver.kernel.org>; Fri, 24 Nov 2023 16:16:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 281CB421EA;
	Fri, 24 Nov 2023 16:16:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 281CB421EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0poG6BwO22vf; Fri, 24 Nov 2023 16:16:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C57A421DB;
	Fri, 24 Nov 2023 16:16:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C57A421DB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EDFC51BF29A
 for <buildroot@lists.busybox.net>; Fri, 24 Nov 2023 16:16:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C7E6F421B5
 for <buildroot@lists.busybox.net>; Fri, 24 Nov 2023 16:16:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7E6F421B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K5g080fJ_oLZ for <buildroot@lists.busybox.net>;
 Fri, 24 Nov 2023 16:16:07 +0000 (UTC)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 88A8841797
 for <buildroot@buildroot.org>; Fri, 24 Nov 2023 16:16:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88A8841797
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40838915cecso14531165e9.2
 for <buildroot@buildroot.org>; Fri, 24 Nov 2023 08:16:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700842565; x=1701447365;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=91Y6+YHEjrbLhdXzadkvKSYnPWjlnojt5XuJUHEVZcE=;
 b=vgPQVam8SyTlDWfP61SgQLeNnGQWPv67iha1/NBh1Pr168EbJHw9CWnfRRuLJQY5a2
 f9LQi7RtytBFfQtYDgVUrmjjaWf2Yiv+H6PBvQnM7CFhFj70EzEmL84/uz9NcW+1MAVc
 6geqoZ0L6ZAJxcr8LQpi6gI2gP9x1Z2ayf6CtBL+CH396RrMyUeVpkqZA5eDzQ1Lx9EP
 aLFluNTi+M7+e/4Jgs0lMdt4VwjnAihhQPSuEp9TH3KgUNu8b6xDCzIMIhi2bqhVLWEU
 HLuXibYreyuiKTVchXmTkrPVFLcjnzQNaoHMPHfIU/UgzUAhZxSqE7MLYXOzRmnljF89
 +0ZQ==
X-Gm-Message-State: AOJu0YxDxEBUXVktx23B0yTSQ5zsg2jnyr0wUxRVnS16VEOBUCrex92M
 SqSnz4GlluhSQm/qwHdQ0wNiZfBZdzfZX7eluJ1VL9Pk
X-Google-Smtp-Source: AGHT+IF5SrmgE42GHLOmimgIzd3ju/TIdtXygEr8uEQunVHFSu5cPBcoWP2xNukz+eQwUawHNlMrAg==
X-Received: by 2002:a05:600c:3b16:b0:3fe:ba7:f200 with SMTP id
 m22-20020a05600c3b1600b003fe0ba7f200mr2825423wms.20.1700842565361; 
 Fri, 24 Nov 2023 08:16:05 -0800 (PST)
Received: from P-NAN-KHNOUM.nantes.intranet
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 fm20-20020a05600c0c1400b0040b297fce5fsm6147325wmb.10.2023.11.24.08.16.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 08:16:04 -0800 (PST)
From: Antoine Coutant <antoine.coutant@smile.fr>
To: buildroot@buildroot.org
Date: Fri, 24 Nov 2023 17:15:17 +0100
Message-Id: <20231124161523.215078-2-antoine.coutant@smile.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231124161523.215078-1-antoine.coutant@smile.fr>
References: <20231124161523.215078-1-antoine.coutant@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1700842565; x=1701447365;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=91Y6+YHEjrbLhdXzadkvKSYnPWjlnojt5XuJUHEVZcE=;
 b=lRWDV8+Kqn1QgPy0xQZNsYN0ujhQaeNr9V1MMqYP/Gv1/jP/uhiapVtKij3aZw9SO+
 Z2pdN9TB2CZsPau67MPY6Wimd81vQrqRz18CofIrHXiqclDAv0SBQvz1j3I/7FEUHBlp
 ovA1SCs9tUUFIWkRIJSv87zQ+q4HKXPuWCrj5RYOGfeLOM4oFkz146Nx6D+DvAvqdFOU
 UswXoYJxB7hkAMQ7WlRW0bY/xqGN300PXXF2DK+SPNXhWhf104bBdU4WnJVUqdTS9mwQ
 19maBY5+rhQgL4AkLXlLJs2IqvvBkhatux03fvH4nvMEi0b511QcM+D57Urlv5mMLAJE
 o0Vg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=lRWDV8+K
Subject: [Buildroot] [[DO NOT MERGE] v3 1/7] package/meson: bump version to
 1.3.0
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
Cc: Antoine Coutant <antoine.coutant@smile.fr>, romain.naour@smile.fr,
 bernd@kuhls.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The meson upgrade from 1.1.1 to 1.2.0 have been reverted
because host-qemu (version v8.0.3) was searching
libraries in the build machine instead of buildroot host
directory. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/acfdf21f0b752e844a33c70a0fd2f82f4534a5a0

Upgrading qemu to version v8.1.0 solves the problem.
The commit that fix the problem is:
https://gitlab.com/qemu-project/qemu/-/commit/Fc9a809e0d28417fa1e7f7efc19f845bda4c1be9

It would be safer not to merge this patch without
being sure that the problem was from qemu and not meson.

The patch that adds the pkg_config_static property has
been rebased.

Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
---

The commit introducing the correction was found using
git bisect.

Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
---
 ...dencies-base.py-add-pkg_config_stati.patch | 29 ++++++++++---------
 package/meson/meson.hash                      |  4 +--
 package/meson/meson.mk                        |  2 +-
 3 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/package/meson/0002-mesonbuild-dependencies-base.py-add-pkg_config_stati.patch b/package/meson/0002-mesonbuild-dependencies-base.py-add-pkg_config_stati.patch
index 8e15d3210c..49a0ef93dc 100644
--- a/package/meson/0002-mesonbuild-dependencies-base.py-add-pkg_config_stati.patch
+++ b/package/meson/0002-mesonbuild-dependencies-base.py-add-pkg_config_stati.patch
@@ -1,4 +1,4 @@
-From 3d6a2db2270346236dd6247e0648ea0c949ba468 Mon Sep 17 00:00:00 2001
+From 59934e2116e025ecfe23baf6febc4a0eb85f60cd Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Date: Sat, 15 Feb 2020 15:13:59 +0100
 Subject: [PATCH] mesonbuild/dependencies/base.py: add pkg_config_static
@@ -20,24 +20,25 @@ Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Signed-off-by: Romain Naour <romain.naour@gmail.com>
 [Rebased on 0.57.1]
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+[rebased on 1.3.0]
+Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
 ---
- mesonbuild/dependencies/pkgconfig.py | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
+ mesonbuild/dependencies/pkgconfig.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/mesonbuild/dependencies/pkgconfig.py b/mesonbuild/dependencies/pkgconfig.py
-index 1e8d9132e..d902ba215 100644
+index e86206b88..94888657d 100644
 --- a/mesonbuild/dependencies/pkgconfig.py
 +++ b/mesonbuild/dependencies/pkgconfig.py
-@@ -338,7 +338,8 @@ class PkgConfigDependency(ExternalDependency):
-         env = None
-         libcmd = ['--libs']
- 
--        if self.static:
-+        if self.static or \
-+            (self.env.properties[self.for_machine].get('pkg_config_static', None) == 'true'):
-             libcmd.append('--static')
- 
-         libcmd.append(self.name)
+@@ -169,7 +169,7 @@ class PkgConfigCLI(PkgConfigInterface):
+             env['PKG_CONFIG_ALLOW_SYSTEM_LIBS'] = '1'
+         args: T.List[str] = []
+         args += self._define_variable_args(define_variable)
+-        if static:
++        if static or (self.env.properties[self.for_machine].get('pkg_config_static', None) == 'true'):
+             args.append('--static')
+         args += ['--libs', name]
+         ret, out, err = self._call_pkgbin(args, env=env)
 -- 
 2.25.1
 
diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index cb36b674fa..8678ba5985 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/1.1.1/meson-1.1.1.tar.gz.asc
-sha256  d04b541f97ca439fb82fab7d0d480988be4bd4e62563a5ca35fadb5400727b1c  meson-1.1.1.tar.gz
+# https://github.com/mesonbuild/meson/releases/download/1.3.0/meson-1.3.0.tar.gz.asc
+sha256  4ba253ef60e454e23234696119cbafa082a0aead0bd3bbf6991295054795f5dc  meson-1.3.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index 503aca8c25..eec4c908f6 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 1.1.1
+MESON_VERSION = 1.3.0
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

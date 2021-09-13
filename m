Return-Path: <SRS0=n+Pr=OD=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9735C433F5
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 20:34:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A8CF610F9
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 20:34:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7A8CF610F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B05040291;
	Mon, 13 Sep 2021 20:34:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kx4hTAS1564R; Mon, 13 Sep 2021 20:34:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8952640270;
	Mon, 13 Sep 2021 20:34:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6BF611BF322
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 20:34:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A7A640270
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 20:34:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zpw8wWA1uR-j for <buildroot@lists.busybox.net>;
 Mon, 13 Sep 2021 20:34:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3DDD34026D
 for <buildroot@buildroot.org>; Mon, 13 Sep 2021 20:34:18 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 196-20020a1c04cd000000b002fa489ffe1fso289986wme.4
 for <buildroot@buildroot.org>; Mon, 13 Sep 2021 13:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NQiqr5Mt9QIEwSqU/HHgIbs/cqtUrP2X7JmXjNKFqVA=;
 b=AEb8aZqzvIw9xGk1ahJmnm87F//P9yKDoS9djN1GH84IZvDnI7Vfw/hQzZmFDw9rXq
 jkbNFjfziA0RNw0IKl5KDaCyvKaw+lx3ABI0ry2v38XNsOEXXJLzm7u+mdGEc5L63MnG
 Xb2M89hH7B0hddPlnk8vqus+hWz0h5nvEGw+sML7zwdynaIjZqIUo/iHoqqfrSq0Z3SO
 e9nzNpX9e2qUjkopEbrkVJ1BWTXlZr7Ntg0XCI6hcQdYRCe4L6quM3NPCeAIx4EEe0GV
 NTaWATcibJz9mG96KAuz7ukXxFCXqnwHiiHjhuseyetMnGTTXTMsGzZZiR5Tpr/b+uPl
 3vug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NQiqr5Mt9QIEwSqU/HHgIbs/cqtUrP2X7JmXjNKFqVA=;
 b=tzm3VaBG4OiHt0ctlAfI5fOQUzbzFCQj8o3O2wKXYhX2TUzUiX+P3UBKO6mFva7Zqk
 5doqovJhc+95IXRmUWvmvFYwwABN7qhTlvLLK+ArQij3TnFkiA1W81cyRYo9/2VVICo8
 nQ+NEJN1pk81LC/fOm4dr5P2IBI6rodehzNNalwNGkfH4WldQgGo+dWtrDW52X72RCOG
 5vRp1DjHeihVwjIydNzGFK413VogdNjqUgeeCfByyQqiQY5RRptIaDxlsjz8UkbmskYG
 9c9HW1tikfNB6szqeCPXvT2FpM2MWFV+8D9FdR7eDaOieORtV0DohCoxchbjg2aFJfl7
 X5Gw==
X-Gm-Message-State: AOAM532atdBpghuwcDOdevcA1lcf4Kdbb6mkAc+nS6sU/+S1X9+GaGT9
 n1MKC03HoDVWLQjzh143CinEVm/NU4k=
X-Google-Smtp-Source: ABdhPJwXrk1HhkqgcyjidHtATwOl6UNXTrhTiJbVzWS03CsWSKIqvR7ACmbUKoQnWJIsJypI/AbRRA==
X-Received: by 2002:a05:600c:3641:: with SMTP id
 y1mr12990481wmq.181.1631565256124; 
 Mon, 13 Sep 2021 13:34:16 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id v9sm7482155wml.46.2021.09.13.13.34.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 13:34:15 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 13 Sep 2021 22:34:06 +0200
Message-Id: <20210913203406.3877994-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/polkit: drop dbus build dependency
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Marek Belisko <marek.belisko@open-nandra.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Drop dbus build dependency to avoid the following build failure since
commit 1db13226394ff7e6f5e7ca643e275f35d6c633bb if systemd-polkit is
enabled:

package/dbus/dbus.mk:124: *** Recursive variable 'DBUS_FINAL_RECURSIVE_DEPENDENCIES' references itself (eventually).  Stop.

Fixes:
 - http://autobuild.buildroot.org/results/0e038fae0f5fc2db3e85be05db4612e4f2395e35

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...t-computation-of-dbus-data-directory.patch | 35 ++++++++++++++++
 ...Don-t-require-dbus-development-files.patch | 42 +++++++++++++++++++
 package/polkit/Config.in                      |  2 +-
 package/polkit/polkit.mk                      |  2 +-
 4 files changed, 79 insertions(+), 2 deletions(-)
 create mode 100644 package/polkit/0003-build-Remove-redundant-computation-of-dbus-data-directory.patch
 create mode 100644 package/polkit/0004-build-Don-t-require-dbus-development-files.patch

diff --git a/package/polkit/0003-build-Remove-redundant-computation-of-dbus-data-directory.patch b/package/polkit/0003-build-Remove-redundant-computation-of-dbus-data-directory.patch
new file mode 100644
index 0000000000..7fce2e10a5
--- /dev/null
+++ b/package/polkit/0003-build-Remove-redundant-computation-of-dbus-data-directory.patch
@@ -0,0 +1,35 @@
+From 9fa097f4dde92a0c1675400228b4cb965ed3e123 Mon Sep 17 00:00:00 2001
+From: Simon McVittie <smcv@debian.org>
+Date: Thu, 3 Jun 2021 18:55:29 +0100
+Subject: [PATCH] build: Remove redundant computation of dbus data directory
+
+We were asking pkg-config "if I define ${datadir} to pk_prefix/pk_datadir,
+what would ${datadir} be?" but the answer is obviously always going to be
+pk_prefix/pk_datadir.
+
+Signed-off-by: Simon McVittie <smcv@debian.org>
+
+[Retrieved (and slightly updated for duktape fork) from:
+https://gitlab.freedesktop.org/polkit/polkit/-/commit/9fa097f4dde92a0c1675400228b4cb965ed3e123]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ meson.build | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 6a6799e..03a7683 100644
+--- a/meson.build
++++ b/meson.build
+@@ -136,8 +136,7 @@ assert(cc.has_function('XML_ParserCreate', dependencies: expat_dep), 'Can\'t fin
+ endif
+ 
+ dbus_dep = dependency('dbus-1')
+-dbus_confdir = dbus_dep.get_pkgconfig_variable('datadir', define_variable: ['datadir', pk_prefix / pk_datadir])   #changed from sysconfdir with respect to commit#8eada3836465838
+-dbus_policydir = dbus_confdir / 'dbus-1/system.d'
++dbus_policydir = pk_prefix / pk_datadir / 'dbus-1/system.d'
+ dbus_system_bus_services_dir = dbus_dep.get_pkgconfig_variable('system_bus_services_dir', define_variable: ['datadir', pk_prefix / pk_datadir])
+ 
+ # check OS
+-- 
+GitLab
+
diff --git a/package/polkit/0004-build-Don-t-require-dbus-development-files.patch b/package/polkit/0004-build-Don-t-require-dbus-development-files.patch
new file mode 100644
index 0000000000..1b7adbf67f
--- /dev/null
+++ b/package/polkit/0004-build-Don-t-require-dbus-development-files.patch
@@ -0,0 +1,42 @@
+From 4bb2157adae620c8b07caf5a24b177d1f90f2fbb Mon Sep 17 00:00:00 2001
+From: Simon McVittie <smcv@debian.org>
+Date: Thu, 3 Jun 2021 18:57:00 +0100
+Subject: [PATCH] build: Don't require dbus development files
+
+We don't actually need libdbus, only the dbus-daemon's installation
+directory for system services, which in practice is always going to be
+/usr/share/dbus-1/system-services.
+
+Signed-off-by: Simon McVittie <smcv@debian.org>
+
+[Retrieved (and slightly updated for duktape fork) from:
+https://gitlab.freedesktop.org/polkit/polkit/-/commit/4bb2157adae620c8b07caf5a24b177d1f90f2fbb]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ meson.build | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 03a7683..539ec7a 100644
+--- a/meson.build
++++ b/meson.build
+@@ -135,9 +135,14 @@ assert(cc.has_function('XML_ParserCreate', dependencies: expat_dep), 'Can\'t fin
+   js_dep = dependency('mozjs-78')
+ endif
+ 
+-dbus_dep = dependency('dbus-1')
++dbus_dep = dependency('dbus-1', required: false)
+ dbus_policydir = pk_prefix / pk_datadir / 'dbus-1/system.d'
+-dbus_system_bus_services_dir = dbus_dep.get_pkgconfig_variable('system_bus_services_dir', define_variable: ['datadir', pk_prefix / pk_datadir])
++if dbus_dep.found()
++  dbus_system_bus_services_dir = dbus_dep.get_pkgconfig_variable('system_bus_services_dir', define_variable: ['datadir', pk_prefix / pk_datadir])
++else
++  # libdbus development files not installed, assume a standard layout
++  dbus_system_bus_services_dir = pk_prefix / pk_datadir / 'dbus-1' / 'system-services'
++endif
+ 
+ # check OS
+ host_system = host_machine.system()
+-- 
+GitLab
+
diff --git a/package/polkit/Config.in b/package/polkit/Config.in
index a968ee52d7..622cbbb90b 100644
--- a/package/polkit/Config.in
+++ b/package/polkit/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_POLKIT
 	depends on BR2_USE_MMU # libglib2, dbus
 	depends on BR2_USE_WCHAR # libglib2
 	depends on !BR2_STATIC_LIBS # duktape
-	select BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_DBUS # runtime
 	select BR2_PACKAGE_DUKTAPE
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_LIBGLIB2
diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
index 7d75d66ffb..ed6f1a5a8f 100644
--- a/package/polkit/polkit.mk
+++ b/package/polkit/polkit.mk
@@ -12,7 +12,7 @@ POLKIT_CPE_ID_VENDOR = polkit_project
 POLKIT_INSTALL_STAGING = YES
 
 POLKIT_DEPENDENCIES = \
-	dbus duktape libglib2 host-intltool expat $(TARGET_NLS_DEPENDENCIES)
+	duktape libglib2 host-intltool expat $(TARGET_NLS_DEPENDENCIES)
 
 POLKIT_LDFLAGS = $(TARGET_NLS_LIBS)
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

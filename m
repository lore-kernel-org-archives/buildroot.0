Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C41E7E732F3
	for <buildroot@archiver.kernel.org>; Thu, 28 Sep 2023 16:51:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 445CF41B8B;
	Thu, 28 Sep 2023 16:51:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 445CF41B8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zF_oB-00FuFS; Thu, 28 Sep 2023 16:51:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C81041B8F;
	Thu, 28 Sep 2023 16:51:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C81041B8F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DC6541BF28E
 for <buildroot@lists.busybox.net>; Thu, 28 Sep 2023 16:51:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B630C41D96
 for <buildroot@lists.busybox.net>; Thu, 28 Sep 2023 16:51:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B630C41D96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z7td_yFeqDCe for <buildroot@lists.busybox.net>;
 Thu, 28 Sep 2023 16:51:32 +0000 (UTC)
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B44EF428E7
 for <buildroot@buildroot.org>; Thu, 28 Sep 2023 16:51:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B44EF428E7
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3214cdb4b27so12230936f8f.1
 for <buildroot@buildroot.org>; Thu, 28 Sep 2023 09:51:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695919889; x=1696524689;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D+MRozciEGtWaVcseZCnc6AoOyKaIunLA33XNjRk5Bk=;
 b=l1gDlthU2RCXKJm1anAQyRbuUn8VhpCzQQdziOD6j3OqQ+AZljH5+UQlCY8MrHL6O0
 aWwG+sBwTGrBBaqkPSFKmzog63/rync40YCNymCjrdYoLb3r49lrtenT7CQK9m3Vf0BI
 K+xrGapWOqsIQeLBIotpVwC4sJH6vVNY2bJbTiuG/wVCNH2tu7f2zlOIVHZDtAlwwVxa
 Jj8IrvUkK7XHDhfQmG14IvSRWiG+3MccnzGRFS2jl8ugwiX5Z0KvYcok6ky3oRFvARxa
 uaMxEh1YlW1h+n4Jzwwv6STFBc2JmQhzes/Wqy9SESxGt7Clj7Q3Ql3mGsQRcIcOVMkf
 4Q8g==
X-Gm-Message-State: AOJu0YwE8mpX9BgXCU1syuXR1qhD6xDWDzcz5SoHKnpD5ic/18XkEQIc
 dicfqgI4UykKyHgEtro1uTVksDZNQjM=
X-Google-Smtp-Source: AGHT+IG4rsMPxy4iHGJyXP9AvJ/fXt8zKoA+IChrH4DiCs5//tY269MG9ka0hS6yCTo2cVIVMJb3PQ==
X-Received: by 2002:a5d:6749:0:b0:317:c9ad:e96c with SMTP id
 l9-20020a5d6749000000b00317c9ade96cmr1522315wrw.15.1695919889009; 
 Thu, 28 Sep 2023 09:51:29 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 s13-20020a5d424d000000b0031f729d883asm19738497wrr.42.2023.09.28.09.51.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Sep 2023 09:51:28 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 28 Sep 2023 18:51:26 +0200
Message-Id: <20230928165126.336164-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695919889; x=1696524689; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=D+MRozciEGtWaVcseZCnc6AoOyKaIunLA33XNjRk5Bk=;
 b=WHrhxWu/DXoe0+bDPhxYKu+djV5HhW89Ql4dXWvf/+MCK1NWwl26V7bRqFMoLChxlX
 jCf+mQJe7r0EYiKgAx+5GxGdpuRN4VbCZ5lsdqhHHgErA57UYP+ZrTRr8sh3/wh1+97e
 GlwJCXykGb3+pf83mFDfaDqLepqay5oLHVgJfZUfoI5sQSnrJJ6Lht8X5mTsvL7uY0TE
 ZPe7Xj6GjXrtKZxnz+guxmJlxs9kyz2gGGUAMpA+ukX2sRVgzTsEQ5pzJsElJ94xQJYP
 Q/IMi5LitC5h2IfGBUVruU20g1nasHRVJJqPXV4WO0FcLCRm5NuatqPQuvETnKr7InSa
 1eJw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=WHrhxWu/
Subject: [Buildroot] [PATCH v2,
 1/1] package/suricata: security bump to version 6.0.14
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

- Fix CVE-2023-35852: In Suricata before 6.0.13 (when there is an
  adversary who controls an external source of rules), a dataset
  filename, that comes from a rule, may trigger absolute or relative
  directory traversal, and lead to write access to a local filesystem.
  This is addressed in 6.0.13 by requiring allow-absolute-filenames and
  allow-write (in the datasets rules configuration section) if an
  installation requires traversal/writing in this situation.
- Fix CVE-2023-35853: In Suricata before 6.0.13, an adversary who
  controls an external source of Lua rules may be able to execute Lua
  code. This is addressed in 6.0.13 by disabling Lua unless allow-rules
  is true in the security lua configuration section.
- Drop first patch (not needed since
  https://github.com/OISF/suricata/commit/c8a3aa608eaae1acbaf33dba8a7c1a3cbfeb4285)

https://github.com/OISF/suricata/blob/suricata-6.0.14/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Peter Korsgaard):
 - Do not wrongly delete second patch

 .checkpackageignore                           |  3 +-
 ...ow-the-user-to-override-RUST_TARGET.patch} |  0
 ...ure-proper-shabang-on-python-scripts.patch | 47 -------------------
 package/suricata/suricata.hash                |  2 +-
 package/suricata/suricata.mk                  |  5 +-
 5 files changed, 4 insertions(+), 53 deletions(-)
 rename package/suricata/{0002-configure.ac-allow-the-user-to-override-RUST_TARGET.patch => 0001-configure.ac-allow-the-user-to-override-RUST_TARGET.patch} (100%)
 delete mode 100644 package/suricata/0001-python-ensure-proper-shabang-on-python-scripts.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index ecb8609ee9..0c7fae9409 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1355,8 +1355,7 @@ package/statserial/0001-ncurses-link.patch Upstream
 package/stunnel/S50stunnel Indent Shellcheck Variables
 package/sudo/0001-configure.ac-fix-openssl-static-build.patch Upstream
 package/supervisor/S99supervisord Variables
-package/suricata/0001-python-ensure-proper-shabang-on-python-scripts.patch Upstream
-package/suricata/0002-configure.ac-allow-the-user-to-override-RUST_TARGET.patch Upstream
+package/suricata/0001-configure.ac-allow-the-user-to-override-RUST_TARGET.patch Upstream
 package/suricata/S99suricata Shellcheck
 package/swupdate/swupdate.sh Shellcheck
 package/sylpheed/0001-harden-link-checker-before-accepting-click.patch Upstream
diff --git a/package/suricata/0002-configure.ac-allow-the-user-to-override-RUST_TARGET.patch b/package/suricata/0001-configure.ac-allow-the-user-to-override-RUST_TARGET.patch
similarity index 100%
rename from package/suricata/0002-configure.ac-allow-the-user-to-override-RUST_TARGET.patch
rename to package/suricata/0001-configure.ac-allow-the-user-to-override-RUST_TARGET.patch
diff --git a/package/suricata/0001-python-ensure-proper-shabang-on-python-scripts.patch b/package/suricata/0001-python-ensure-proper-shabang-on-python-scripts.patch
deleted file mode 100644
index 424b30d317..0000000000
--- a/package/suricata/0001-python-ensure-proper-shabang-on-python-scripts.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 44fe2328b715db25134ee095526d2fa47e6cd834 Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Wed, 1 Jan 2020 15:25:57 +0100
-Subject: [PATCH] python: ensure proper shabang on python scripts
-
-When instlling python scripts, distutils would use the python used to
-run setup.py as shabang for the scripts it installs.
-
-However, when cross-compiling, this is most often not correct.
-
-Instead, using '/usr/bin/env python' is guaranteed to find the proper
-python in the PATH, so we need to instruct setyup.py to use that as the
-executable.
-
-[yann.morin.1998@free.fr:
-  - author did not provide their SoB, but it's simple enough to
-    not require it for once
-  - provide proper commit log
-]
-Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
-[Fabrice: update for 6.0.0]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- python/Makefile.am | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/python/Makefile.am b/python/Makefile.am
-index 59d195f29..a41604f72 100644
---- a/python/Makefile.am
-+++ b/python/Makefile.am
-@@ -6,11 +6,11 @@ EXTRA_DIST =	setup.py \
- if HAVE_PYTHON_DISTUTILS
- all-local:
- 	cd $(srcdir) && \
--		$(HAVE_PYTHON) setup.py build --build-base "$(abs_builddir)"
-+		$(HAVE_PYTHON) setup.py build -e "/usr/bin/env python" --build-base "$(abs_builddir)"
- 
- install-exec-local:
- 	cd $(srcdir) && \
--		$(HAVE_PYTHON) setup.py build --build-base "$(abs_builddir)" \
-+		$(HAVE_PYTHON) setup.py build -e "/usr/bin/env python" --build-base "$(abs_builddir)" \
- 		install --prefix $(DESTDIR)$(prefix)
- 
- uninstall-local:
--- 
-2.20.1
-
diff --git a/package/suricata/suricata.hash b/package/suricata/suricata.hash
index 38ab5e9cd3..49341984a2 100644
--- a/package/suricata/suricata.hash
+++ b/package/suricata/suricata.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  00173634fa76aee636e38a90b1c02616c903e42173107d47b4114960b5fbe839  suricata-6.0.6.tar.gz
+sha256  cfa93de900d0fd8ba67c79fddec58fb7afb8f6c45b0773040035a15407b796ce  suricata-6.0.14.tar.gz
 
 # Hash for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/suricata/suricata.mk b/package/suricata/suricata.mk
index 72b72cc94d..2aa5a0c5ed 100644
--- a/package/suricata/suricata.mk
+++ b/package/suricata/suricata.mk
@@ -4,13 +4,12 @@
 #
 ################################################################################
 
-SURICATA_VERSION = 6.0.6
+SURICATA_VERSION = 6.0.14
 SURICATA_SITE = https://www.openinfosecfoundation.org/download
 SURICATA_LICENSE = GPL-2.0
 SURICATA_LICENSE_FILES = COPYING LICENSE
 SURICATA_CPE_ID_VENDOR = oisf
-# 0001-python-ensure-proper-shabang-on-python-scripts.patch
-# 0002-configure.ac-allow-the-user-to-override-RUST_TARGET.patch
+# 0001-configure.ac-allow-the-user-to-override-RUST_TARGET.patch
 SURICATA_AUTORECONF = YES
 
 SURICATA_DEPENDENCIES = \
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

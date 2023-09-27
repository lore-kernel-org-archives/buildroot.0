Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7896E82CCD
	for <buildroot@archiver.kernel.org>; Wed, 27 Sep 2023 20:07:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D9B341A3B;
	Wed, 27 Sep 2023 20:07:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D9B341A3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4vK9mWAh8R19; Wed, 27 Sep 2023 20:07:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8BF4C41A42;
	Wed, 27 Sep 2023 20:07:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8BF4C41A42
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7862A1BF267
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 20:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 51DB3419E1
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 20:07:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51DB3419E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AL52hLuv292l for <buildroot@lists.busybox.net>;
 Wed, 27 Sep 2023 20:07:18 +0000 (UTC)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0573D40518
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 20:07:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0573D40518
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40572aeb6d0so85138985e9.1
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 13:07:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695845236; x=1696450036;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4gb6PWfBRodBrC/NiJ7szvF12+L5ciYA9+34HD0HJsU=;
 b=AG/wAao7dWtVXRadSH8KaKIyfTmTt1Pow2YnrorD09F2qkmgPKr0zL6eCCQpv8JRP/
 Tzy/IkqFa7QYwAsxKu+4IvwLgxWOtUwT80/LTMlDj/Ds4o21F0fHNKx+RTUaCpOymahQ
 Soz83b31EbZlWi5GOp7QVCM9yMwoZsGBDHAORvxkJquHtA7g3mOJKeWZatPLJSHBqWbz
 UM9k/yKOOrevhHv3gY/sHOBafUGmmvv/TaR1SX1NS8e7s0q5qpT5yNhaEkzxXBeqx8vD
 +sDkXppDYFmTtHMFHKi5FR7MYLe+d5FXVsIt51HZQragLm91ehYkDqkaPULq7COx1yoO
 IElA==
X-Gm-Message-State: AOJu0Yw3L6IcstmgK4+PJ+FLUCxRR5qU7uGSJTzYA+kmegC2BCRuOgh9
 vNO0/3svq7DVn+0lUpDApYgXzXkOCt8=
X-Google-Smtp-Source: AGHT+IG6KM6+ZRRi03rmdYRRgMXWJafTdvrfRzPhHV2yhq05eyVoW8yYG9g4/QV3t4ElgW65s2VznQ==
X-Received: by 2002:a05:600c:2207:b0:401:eb0:a974 with SMTP id
 z7-20020a05600c220700b004010eb0a974mr3133134wml.3.1695845235422; 
 Wed, 27 Sep 2023 13:07:15 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 c24-20020a05600c0ad800b0040596352951sm6922473wmr.5.2023.09.27.13.07.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Sep 2023 13:07:15 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Sep 2023 22:07:08 +0200
Message-Id: <20230927200708.491826-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230927200708.491826-1-fontaine.fabrice@gmail.com>
References: <20230927200708.491826-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695845236; x=1696450036; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4gb6PWfBRodBrC/NiJ7szvF12+L5ciYA9+34HD0HJsU=;
 b=C7N4KgzuXlg1ngGYWgL0X0+iteRFSWHYoAxQzLRxf6Jf4EscV3xPfENxnm7vdlhVVM
 p8bi+dtTqrDLyApiPpJ2mG7z8D3KkQQYBVndJEjqjCvB5VqxUYKMRzllgbOXR3GbrkTz
 bS3qoG0pm+sm4tRVHSkIFUJjQV58ZD9ups4wbWh8dHx4oWRhaibLnhKs/YhJ2qJmgQgI
 e5/1Q0QawNWryBs1Vwi47x6O6ZLfslmOxd29eCj3D7aVOESd2uUkr4zQIjpRUnX5ExWx
 xdbF0TFE66zRsbpEXtLXqeSjdl8uxO/GgyoJOsgREKuNLzHQChxPXf8kMPHb7ixzz/fR
 a9BA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=C7N4Kgzu
Subject: [Buildroot] [PATCH 2/2] package/suricata: security bump to version
 6.0.14
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
 .checkpackageignore                           |  3 +-
 ...ure-proper-shabang-on-python-scripts.patch | 47 -------------------
 ...low-the-user-to-override-RUST_TARGET.patch | 35 --------------
 package/suricata/suricata.hash                |  2 +-
 package/suricata/suricata.mk                  |  5 +-
 5 files changed, 4 insertions(+), 88 deletions(-)
 delete mode 100644 package/suricata/0001-python-ensure-proper-shabang-on-python-scripts.patch
 delete mode 100644 package/suricata/0002-configure.ac-allow-the-user-to-override-RUST_TARGET.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index b41ab6918e..61de4d79a1 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1360,8 +1360,7 @@ package/statserial/0001-ncurses-link.patch Upstream
 package/stunnel/S50stunnel Indent Shellcheck Variables
 package/sudo/0001-configure.ac-fix-openssl-static-build.patch Upstream
 package/supervisor/S99supervisord Variables
-package/suricata/0001-python-ensure-proper-shabang-on-python-scripts.patch Upstream
-package/suricata/0002-configure.ac-allow-the-user-to-override-RUST_TARGET.patch Upstream
+package/suricata/0001-configure.ac-allow-the-user-to-override-RUST_TARGET.patch Upstream
 package/suricata/S99suricata Shellcheck
 package/swupdate/swupdate.sh Shellcheck
 package/sylpheed/0001-harden-link-checker-before-accepting-click.patch Upstream
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
diff --git a/package/suricata/0002-configure.ac-allow-the-user-to-override-RUST_TARGET.patch b/package/suricata/0002-configure.ac-allow-the-user-to-override-RUST_TARGET.patch
deleted file mode 100644
index ec876a6852..0000000000
--- a/package/suricata/0002-configure.ac-allow-the-user-to-override-RUST_TARGET.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 7ab4d5eb55e1d3900390b76e5f46e80e22d4e80e Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 10 Oct 2020 21:34:21 +0200
-Subject: [PATCH] configure.ac: allow the user to override RUST_TARGET
-
-When cross-compiling, RUST_TARGET is not always equal to host_triplet
-(e.g. buildroot) so allow the user to override this default value
-through RUST_TARGET environment variable
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- configure.ac | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 32c230209..7d7c9373f 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -2489,7 +2489,12 @@ fi
-     have_rust_vendor="no"
- 
-     if test "x$cross_compiling" = "xyes"; then
--      RUST_SURICATA_LIB_XC_DIR="${host_alias}/"
-+      if test "x$RUST_TARGET" != "x"; then
-+        RUST_SURICATA_LIB_XC_DIR="$RUST_TARGET/"
-+        AC_SUBST([RUST_TARGET],["--target $RUST_TARGET"])
-+      else
-+        RUST_SURICATA_LIB_XC_DIR="${host_alias}/"
-+      fi
-     else
-       if test "x$CARGO_BUILD_TARGET" = "x"; then
-         RUST_SURICATA_LIB_XC_DIR=
--- 
-2.28.0
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

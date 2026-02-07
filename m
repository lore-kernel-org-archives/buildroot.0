Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40377EE0AD5
	for <buildroot@archiver.kernel.org>; Sat,  7 Feb 2026 11:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E9A341160;
	Sat,  7 Feb 2026 11:16:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 35P-3YvdL2BW; Sat,  7 Feb 2026 11:16:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD8AC4115D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770462966;
	bh=8HS9Lbf7j3ZeSFosNSlqGw2eZj2WOOlCHq2FmKDrtWc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KXZHPA3ecfMKNHgL0P1uvSSIIK3Estom17cpmmYEgZot+bv9HKVutHJPO5kQLpKkV
	 e2v8QECmdjsl/FxN6XpEV+r3TzgE/37nKUYcHvAKTmQac4X7aft+b8eHUqgkCxtWkE
	 nLUQvMc79dhkRK+7KgyM6ZPOIOamUBHLvu9PlB3ifZDyuAKsbj6l/WugXVIRYXr94I
	 xjGLuCzek9QOvYswBf26Li/BpCsk/jHXd2KCA9KKQu/g3DVfVyaqlfuIHiQPOOKtNq
	 reQG2jtkiKDOiWkmlk14o5h2hzF1ik+lCp0KU8huQtevgQextwYNpp56OmhmEMlTQi
	 iWBfmyhNuxFQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD8AC4115D;
	Sat,  7 Feb 2026 11:16:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E14C5173
 for <buildroot@buildroot.org>; Sat,  7 Feb 2026 11:16:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF11883BA2
 for <buildroot@buildroot.org>; Sat,  7 Feb 2026 11:16:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uLo9yODTVh6e for <buildroot@buildroot.org>;
 Sat,  7 Feb 2026 11:16:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B886783759
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B886783759
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B886783759
 for <buildroot@buildroot.org>; Sat,  7 Feb 2026 11:16:01 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b14a.dip0.t-ipconnect.de [84.161.177.74])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9C8CCA4C02BB;
 Sat,  7 Feb 2026 12:15:58 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39374)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vogI9-0000000071l-3Nmt;
 Sat, 07 Feb 2026 11:15:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  7 Feb 2026 12:15:58 +0100
Message-ID: <20260207111558.3353590-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1770462958;
 bh=5kQt7c9t+nKZM53Tjs+5JxEB2NtJdW7nE/3+H1jp0JM=;
 h=From:To:Cc:Subject:Date:From;
 b=i9jWxpvLlNUdRPShfZ+IuY/5j82kHq2J4JZHfWWxJZdsrQxbC0sB8U7s4b1jDQY2v
 Eerz6OyvhBrz59o1B1XPZ28u/DrnbdauH6BBGg9lNGkeigYBW9Rj1lSNhfVQISeasP
 cTFwM1HSvsAq+QimHk62/CHJBU66v8UE/6tR7AEq1Yn0IzrEqB44Q4fDe6ZEk/SKEZ
 FjDDe6pU+m4H4RMG2uM+0ul1tiOKGmeRu65XBKBaj8Zv0eVLnWe1KIzbEKgoVfCskE
 IkkbzQKBmEfSq5VdPXXiIsxFbprO698yX2diXMqHzcK9Pm4DcdhNu1RAQQWNovwrYb
 kiuyrCuTZRKlA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=i9jWxpvL
Subject: [Buildroot] [PATCH 1/1] Revert "package/swig: add host-swig wrapper
 script"
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This reverts commit 20d5e36fe86322fa93b285bbe2c658f163368423.

Fixes:
https://autobuild.buildroot.net/results/e65/e656684298b0462f8044667e7384c64d6508f22f/

Also fixes kodi build error:

CMake Error at /usr/share/cmake-3.31/Modules/
FindPackageHandleStandardArgs.cmake:233 (message):
  Could NOT find SWIG (missing: SWIG_DIR) (found version
  "/home/bernd/buildroot/br6/output/per-package/kodi/host/bin/swig3.0: 8:
  exec:
  /home/bernd/buildroot/br6/output/per-package/kodi/host/bin/
swig3.0.br_real:
  not found

  ")
Call Stack (most recent call first):
  /usr/share/cmake-3.31/Modules/FindPackageHandleStandardArgs.cmake:603 
(_FPHSA_FAILURE_MESSAGE)
  cmake/modules/buildtools/FindSWIG.cmake:28 
(find_package_handle_standard_args)
  xbmc/interfaces/swig/CMakeLists.txt:34 (find_package)

using this defconfig:

BR2_x86_64=y
BR2_x86_corei7=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_BLEEDING_EDGE=y
BR2_PER_PACKAGE_DIRECTORIES=y
BR2_INIT_SYSTEMD=y
BR2_SYSTEM_DEFAULT_PATH="/bin:/sbin:/usr/bin:/usr/sbin"
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_KODI=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_PYTHON3=y
BR2_PACKAGE_PYTHON3_PY_ONLY=y

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/swig/swig-wrapper.in |  8 --------
 package/swig/swig.mk         | 15 ---------------
 2 files changed, 23 deletions(-)
 delete mode 100644 package/swig/swig-wrapper.in

diff --git a/package/swig/swig-wrapper.in b/package/swig/swig-wrapper.in
deleted file mode 100644
index 61c885fc90..0000000000
--- a/package/swig/swig-wrapper.in
+++ /dev/null
@@ -1,8 +0,0 @@
-#!/bin/sh
-# wrapper to make swig relocatable
-
-if [ -z "${SWIG_LIB}" ]; then
-    export SWIG_LIB="${0%/*}/../share/swig/@SWIG_VERSION@"
-fi
-
-exec "${0}.br_real" "$@"
diff --git a/package/swig/swig.mk b/package/swig/swig.mk
index 7612e7b8a0..9d696e6f60 100644
--- a/package/swig/swig.mk
+++ b/package/swig/swig.mk
@@ -15,21 +15,6 @@ HOST_SWIG_CONF_OPTS = \
 SWIG_LICENSE = GPL-3.0+, BSD-2-Clause, BSD-3-Clause
 SWIG_LICENSE_FILES = LICENSE LICENSE-GPL LICENSE-UNIVERSITIES
 
-# Swig has a compiled in absolute path to its data files, so it does
-# not work when copied somewhere else for the SDK. Issue was reported
-# upstream but rejected in https://github.com/swig/swig/issues/253 so
-# instead add a wrapper to work around this
-
-define HOST_SWIG_INSTALL_WRAPPER
-	mv -f $(HOST_DIR)/bin/swig $(HOST_DIR)/bin/swig.br_real
-	$(INSTALL) -m 0755 -D package/swig/swig-wrapper.in \
-		$(HOST_DIR)/bin/swig
-	$(SED) 's,@SWIG_VERSION@,$(SWIG_VERSION),g' \
-		$(HOST_DIR)/bin/swig
-endef
-
-HOST_SWIG_POST_INSTALL_HOOKS += HOST_SWIG_INSTALL_WRAPPER
-
 # CMake looks first at swig3.0, then swig2.0 and then swig. However,
 # when doing the search, it will look into the PATH for swig2.0 first,
 # and then for swig.
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

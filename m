Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D23C6D3B98A
	for <buildroot@archiver.kernel.org>; Tue,  9 Dec 2025 19:02:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 862F04048F;
	Tue,  9 Dec 2025 19:02:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ytsNUxqD4Tbe; Tue,  9 Dec 2025 19:02:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70C03404DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765306938;
	bh=MxbhLnUAn1Ig4jFBBf5RW0CzfaFf/sYWatrnHRFQSnU=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=emxU+SBpIAKBQcV3prVLjaVVs3xgObwKnBvYZbVh6GGGVg0LnnbnwQj2CyT73Yd47
	 4VHK1n4vYIZfkrN1w9diD4pRKH2zg10U9Lt8xtcaTxNk6vTYyAcoWbc16YfYXx9K1R
	 VJf2H2kPaZQ7gx4CQ+xKa81oes/Boqb6F5f11JuA+XOfgU/+AqAMl3Y6fK/4UzKOI+
	 lCyvM6JqekBkXBCRaNQKxCaL069WgBU5uSgm38nf4llDIOTnyWWWYBxJKtxhD2tOxT
	 gp0iRwJYnWopF8JtmBFuzwzb0bj3SNjYA4hCNK8Sdxjx3PofHDVnlDNvTVezsK8olo
	 ew6zosvAHHC4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70C03404DB;
	Tue,  9 Dec 2025 19:02:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A4625E7
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:02:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 81996842CB
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:02:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FvKnoDRE1o9j for <buildroot@buildroot.org>;
 Tue,  9 Dec 2025 19:02:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 06B4C842B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06B4C842B4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 06B4C842B4
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:02:15 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b151.dip0.t-ipconnect.de [84.161.177.81])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 65CB5A4C0156;
 Tue,  9 Dec 2025 20:02:12 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35538)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vT2yS-0000000084O-0Ojf;
 Tue, 09 Dec 2025 19:02:11 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Tue,  9 Dec 2025 20:02:10 +0100
Message-ID: <20251209190211.186523-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765306932;
 bh=O3yIJM8ac47/Rfpj8ECEU7q3wuPzhnKc6Xfg4u118/Y=;
 h=From:To:Cc:Subject:Date:From;
 b=JkOF9Sz4GtP35l6dvraiW9gKqpYyFWBNjtedgHsKVJVZkKELFwsXV3Uuzr+IiEKcM
 JygNlZtgJE3ePHD0xFu2Od0kWgUPthLqVUbChJzvFxJj3gut/NBqe9UhVx72DJBtJW
 L+c/yvcTsyeJXL0WATBzo6BZjnPQzOR/DlnOs8CogMYPZfYwHp9nbNlAfguqJJ68fM
 Tuhes5G9I7tGaptF+stVMRF/psgZNDc8NjD6GqqwVbNKq6PElN+Etpt0XVgILyRxzD
 hsfZGbePyK0aUs32iqM4SFsqQUij+FpAjxTrePsfRDdhxnNELbh1rGIiUzIC5Bein6
 ZKUxkJq1khF3Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=JkOF9Sz4
Subject: [Buildroot] [PATCH/next 1/1] package/meson: bump version to 1.10.0
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

Release notes: https://mesonbuild.com/Release-notes-for-1-10-0.html

Rebased and updated patch 0001 to fix build error:

    NameError: name 'env' is not defined

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...xt-static-libs-when-default-library-static.patch | 13 ++++++-------
 package/meson/meson.hash                            |  4 ++--
 package/meson/meson.mk                              |  2 +-
 3 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/package/meson/0001-Prefer-ext-static-libs-when-default-library-static.patch b/package/meson/0001-Prefer-ext-static-libs-when-default-library-static.patch
index c7f8557ec1..92d5e517a4 100644
--- a/package/meson/0001-Prefer-ext-static-libs-when-default-library-static.patch
+++ b/package/meson/0001-Prefer-ext-static-libs-when-default-library-static.patch
@@ -24,8 +24,7 @@ http://autobuild.buildroot.net/results/c17/c17bbb12d9deadd64a441b36e324cfbbe8aba
 Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
 [Updated for 0.57.1 - get_builtin_option() vs. get_option(OptionKey())]
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
-[Bernd: rebased for 1.6.0 & 1.7.0
- for 1.82.0 - get_option -> optstore.get_value_for]
+[Bernd: rebased for 1.10.0]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  mesonbuild/compilers/mixins/clike.py | 3 +++
@@ -43,16 +42,16 @@ index 09ad837b1..b7f6b9f22 100644
  from .. import compilers
  from ..compilers import CompileCheckMode
  from .visualstudio import VisualStudioLikeCompiler
-@@ -1053,6 +1054,9 @@ class CLikeCompiler(Compiler):
+@@ -1045,6 +1046,9 @@ class CLikeCompiler(Compiler):
              # TI C28x compilers can use both extensions for static or dynamic libs.
              stlibext = ['a', 'lib']
              shlibext = ['dll', 'so']
-+        elif env.coredata.optstore.get_value_for(OptionKey('default_library')) == 'static':
++        elif self.environment.coredata.optstore.get_value_for(OptionKey('default_library')) == 'static':
 +            # Linux/BSDs
 +            shlibext = ['a']
-         else:
-             # Linux/BSDs
-             shlibext = ['so']
+         elif self.info.is_os2():
+             stlibext = ['_s.lib', '_s.a', 'lib', 'a']
+             shlibext = ['_dll.lib', '_dll.a', 'lib', 'a', 'dll']
 -- 
 2.25.1
 
diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index 581cfe62a7..d07ea4d1dd 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/1.9.1/meson-1.9.1.tar.gz.asc
-sha256  4e076606f2afff7881d195574bddcd8d89286f35a17b4977a216f535dc0c74ac  meson-1.9.1.tar.gz
+# https://github.com/mesonbuild/meson/releases/download/1.10.0/meson-1.10.0.tar.gz.asc
+sha256  8071860c1f46a75ea34801490fd1c445c9d75147a65508cd3a10366a7006cc1c  meson-1.10.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index 29082dcbb5..ca42edf63b 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 1.9.1
+MESON_VERSION = 1.10.0
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

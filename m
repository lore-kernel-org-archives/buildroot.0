Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B6CCC0218A
	for <buildroot@archiver.kernel.org>; Thu, 30 Jan 2025 18:22:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BFB4406D8;
	Thu, 30 Jan 2025 18:22:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P-uRQu-dyQif; Thu, 30 Jan 2025 18:22:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5151408ED
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5151408ED;
	Thu, 30 Jan 2025 18:22:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C577128
 for <buildroot@buildroot.org>; Thu, 30 Jan 2025 18:22:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F2E8241259
 for <buildroot@buildroot.org>; Thu, 30 Jan 2025 18:22:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WO-MnGZyP3bS for <buildroot@buildroot.org>;
 Thu, 30 Jan 2025 18:22:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6D8E440342
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D8E440342
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6D8E440342
 for <buildroot@buildroot.org>; Thu, 30 Jan 2025 18:22:52 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6ca57.dip0.t-ipconnect.de [79.214.202.87])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 16B9AA4C042B;
 Thu, 30 Jan 2025 19:22:51 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36276)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tdZBi-000000001Pi-1F5F;
 Thu, 30 Jan 2025 18:22:50 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Thu, 30 Jan 2025 19:22:50 +0100
Message-Id: <20250130182250.189182-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1738261371;
 bh=FCRVrBbrSAMF1maPBkQx+8iYm7Bb6d5AS6wvJuwSYRM=;
 h=From:To:Cc:Subject:Date:From;
 b=PDmk5otvpFohf8kRG2A8iL8Gledp9YTDv12aODagTW3AkobV5qZfSX6ZmjsQNeoSd
 V2MYkOfLY9Ii3KLXRsNmWVEAasKnJVw0dL5WmCnvyRqsISRp4Vu9rQy4Cx+0LEC4/I
 CRr5ciH7RLe+gb+Z2KiphD9osmMhreClusba532LntNbZGOlsFHIQqDtYAvKCmTZRu
 f29B6g7Qh1gHdHVpzfxK8nE91BDcrr9413X+qreFpIGqOADk2/PWOse98OXqRaLSHd
 DC+93NWWRvklaMINT5McT3jQSeAdu5TNCHepQ10fER54NaTeZmOLyyF9UP9k74sTFu
 9vrwdOrNceBqQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202412041019 header.b=PDmk5otv
Subject: [Buildroot] [PATCH] package/meson: bump version to 1.7.0
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

Rebased patch 0001.

Release notes:
https://mesonbuild.com/Release-notes-for-1-7-0.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...Prefer-ext-static-libs-when-default-library-static.patch | 6 +++---
 package/meson/meson.hash                                    | 4 ++--
 package/meson/meson.mk                                      | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/meson/0001-Prefer-ext-static-libs-when-default-library-static.patch b/package/meson/0001-Prefer-ext-static-libs-when-default-library-static.patch
index 55f7512e2e..e56db1be07 100644
--- a/package/meson/0001-Prefer-ext-static-libs-when-default-library-static.patch
+++ b/package/meson/0001-Prefer-ext-static-libs-when-default-library-static.patch
@@ -24,7 +24,7 @@ http://autobuild.buildroot.net/results/c17/c17bbb12d9deadd64a441b36e324cfbbe8aba
 Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
 [Updated for 0.57.1 - get_builtin_option() vs. get_option(OptionKey())]
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
-[Bernd: rebased for 1.6.0]
+[Bernd: rebased for 1.6.0 & 1.7.0]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  mesonbuild/compilers/mixins/clike.py | 3 +++
@@ -42,8 +42,8 @@ index 09ad837b1..b7f6b9f22 100644
  from .. import compilers
  from ..compilers import CompileCheckMode
  from .visualstudio import VisualStudioLikeCompiler
-@@ -1038,6 +1038,9 @@ class CLikeCompiler(Compiler):
-             # TI C6000 compiler can use both extensions for static or dynamic libs.
+@@ -1053,6 +1053,9 @@ class CLikeCompiler(Compiler):
+             # TI C28x compilers can use both extensions for static or dynamic libs.
              stlibext = ['a', 'lib']
              shlibext = ['dll', 'so']
 +        elif env.coredata.get_option(OptionKey('default_library')) == 'static':
diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index e02d878d79..881c35d250 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/1.6.0/meson-1.6.0.tar.gz.asc
-sha256  999b65f21c03541cf11365489c1fad22e2418bb0c3d50ca61139f2eec09d5496  meson-1.6.0.tar.gz
+# https://github.com/mesonbuild/meson/releases/download/1.7.0/meson-1.7.0.tar.gz.asc
+sha256  08efbe84803eed07f863b05092d653a9d348f7038761d900412fddf56deb0284  meson-1.7.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index f36091e584..292f81b690 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 1.6.0
+MESON_VERSION = 1.7.0
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

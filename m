Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AC8EC71135
	for <buildroot@archiver.kernel.org>; Sun, 15 Jun 2025 16:20:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFD5060F54;
	Sun, 15 Jun 2025 16:20:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pFv5liImF3en; Sun, 15 Jun 2025 16:20:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF45260E9E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF45260E9E;
	Sun, 15 Jun 2025 16:20:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D81A151
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 16:20:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E914A80D96
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 16:20:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tfCFvgVZUk8f for <buildroot@buildroot.org>;
 Sun, 15 Jun 2025 16:20:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 07B9480D98
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07B9480D98
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 07B9480D98
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 16:19:59 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a08ea.dip0.t-ipconnect.de [91.58.8.234])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BC3DEA4C0465;
 Sun, 15 Jun 2025 18:19:57 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47636)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uQq5M-000000006x2-3rQW;
 Sun, 15 Jun 2025 16:19:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 15 Jun 2025 18:19:57 +0200
Message-Id: <20250615161957.2499823-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1750004397;
 bh=XcuqAAFfpUPBPiellqtXcLlHyln2NOzle3GSKu/ilMc=;
 h=From:To:Cc:Subject:Date:From;
 b=ohv0MogWzxCJVYf8uT3q2MboByNzMfTNxIOo43rE6NFh5zEWK8l73BGObOInUPkfl
 iOTq7q0RQCh+sdZzN2QhINIFG3uS/0YuhFp86RwKK73ggOX5/TIOGRar6Awi9Cd41j
 TGv9oWgIK1M+icxuRGWlR2/buzSupQo2/a6GO54HyjCy5iLsP2zeBvnqBmnw+DX18E
 +1QhDMiNsz+l/x4yoXDMvQh1gSz6rUBZixmDbarrLCIC8DkqF1OkH30xaWfsMaWp3H
 LviSSiAW4ZvcLmMvlIx/eAPGrkYt/6CjhiMDzedLyMenxac8yZxkqDn5N+jqmLZY7I
 WPaMZfrpDfdiw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=ohv0MogW
Subject: [Buildroot] [PATCH 1/1] package/meson: bump version to 1.8.2
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

Release notes:
https://mesonbuild.com/Release-notes-for-1-8-0.html

Updated patch 0001 due to upstream commit
https://github.com/mesonbuild/meson/commit/4fa52925459dac650bf053715987ee7beb3b23c1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...-Prefer-ext-static-libs-when-default-library-static.patch | 5 +++--
 package/meson/meson.hash                                     | 4 ++--
 package/meson/meson.mk                                       | 2 +-
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/meson/0001-Prefer-ext-static-libs-when-default-library-static.patch b/package/meson/0001-Prefer-ext-static-libs-when-default-library-static.patch
index e56db1be07..bfe3d8e7f9 100644
--- a/package/meson/0001-Prefer-ext-static-libs-when-default-library-static.patch
+++ b/package/meson/0001-Prefer-ext-static-libs-when-default-library-static.patch
@@ -24,7 +24,8 @@ http://autobuild.buildroot.net/results/c17/c17bbb12d9deadd64a441b36e324cfbbe8aba
 Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
 [Updated for 0.57.1 - get_builtin_option() vs. get_option(OptionKey())]
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
-[Bernd: rebased for 1.6.0 & 1.7.0]
+[Bernd: rebased for 1.6.0 & 1.7.0
+ for 1.82.0 - get_option -> optstore.get_value_for]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  mesonbuild/compilers/mixins/clike.py | 3 +++
@@ -46,7 +47,7 @@ index 09ad837b1..b7f6b9f22 100644
              # TI C28x compilers can use both extensions for static or dynamic libs.
              stlibext = ['a', 'lib']
              shlibext = ['dll', 'so']
-+        elif env.coredata.get_option(OptionKey('default_library')) == 'static':
++        elif env.coredata.optstore.get_value_for(OptionKey('default_library')) == 'static':
 +            # Linux/BSDs
 +            shlibext = ['a']
          else:
diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index 881c35d250..40340fb932 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/1.7.0/meson-1.7.0.tar.gz.asc
-sha256  08efbe84803eed07f863b05092d653a9d348f7038761d900412fddf56deb0284  meson-1.7.0.tar.gz
+# https://github.com/mesonbuild/meson/releases/download/1.8.2/meson-1.8.2.tar.gz.asc
+sha256  c105816d8158c76b72adcb9ff60297719096da7d07f6b1f000fd8c013cd387af  meson-1.8.2.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index 292f81b690..e23c851d2e 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 1.7.0
+MESON_VERSION = 1.8.2
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

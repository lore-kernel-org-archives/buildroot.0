Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 128B1C3DA4A
	for <buildroot@archiver.kernel.org>; Sat,  3 Aug 2024 10:50:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94616406E2;
	Sat,  3 Aug 2024 10:50:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sgl4DFVRv1xh; Sat,  3 Aug 2024 10:50:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC3814057B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC3814057B;
	Sat,  3 Aug 2024 10:50:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B18EC1BF37A
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 10:50:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F21F40198
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 10:50:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ARL5a_pxRPMk for <buildroot@lists.busybox.net>;
 Sat,  3 Aug 2024 10:50:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 39CAB40118
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39CAB40118
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 39CAB40118
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 10:50:29 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cfa9.dip0.t-ipconnect.de [79.214.207.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9A8EEA4C0302;
 Sat,  3 Aug 2024 12:48:05 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50512)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1saCIv-000000003a7-16hY;
 Sat, 03 Aug 2024 10:48:05 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Aug 2024 12:48:05 +0200
Message-Id: <20240803104805.2574321-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1722682085;
 bh=zpe07/9t+gCN/aGbO6Nz2RnaJqy4SbKocb5YrFizV3o=;
 h=From:To:Cc:Subject:Date:From;
 b=doZmQ4o+hG1IJyUbU4yGpfCYKRZnhYNcHkXIL/6ZwFwLVFPSKtdRBswEA6htnGPge
 Mzk6/qPfPRdtYegSc/ofM5j/sCVd6YxHd8cf8ktBND0nJ6BI577urcn4ZRc06dDJUU
 Ys12SOT+IG+kS+yMrTmEt6pWUKcuvls0EvvKghoHKN80ERTNyNVjpaX2Vf2jy1IfRW
 gwyCU3chWhfeWn3DCWcCVXKl9xgSSrpIiFsSSRcVu/QxMsEoQqVgRHakDjO/m6cLOP
 cRAiGm7BUQWSxIh1H3LfqZbJhzwvYfCres72KN7zeIEntyvZ3EsxnkBj+yq8P8xCO4
 AhuRRI7hFcx6w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=doZmQ4o+
Subject: [Buildroot] [PATCH 1/1] package/flatbuffers: bump version to 24.3.25
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

Updated project URL, rebased patch.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../0001-include-flatbuffers-base.h-fix-build-on-musl.patch | 6 +++---
 package/flatbuffers/Config.in                               | 2 +-
 package/flatbuffers/flatbuffers.hash                        | 2 +-
 package/flatbuffers/flatbuffers.mk                          | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/flatbuffers/0001-include-flatbuffers-base.h-fix-build-on-musl.patch b/package/flatbuffers/0001-include-flatbuffers-base.h-fix-build-on-musl.patch
index 82feca3e39..872db03045 100644
--- a/package/flatbuffers/0001-include-flatbuffers-base.h-fix-build-on-musl.patch
+++ b/package/flatbuffers/0001-include-flatbuffers-base.h-fix-build-on-musl.patch
@@ -30,8 +30,8 @@ Fixes:
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 [Upstream status: Rejected:
  https://github.com/google/flatbuffers/pull/6773]
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-(rebased and added fix for uClibc-build)
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+(rebased and added fix for uClibc-build, rebased again for 24.3.25)
 ---
  include/flatbuffers/base.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -40,7 +40,7 @@ diff --git a/include/flatbuffers/base.h b/include/flatbuffers/base.h
 index de7898dc..101c7598 100644
 --- a/include/flatbuffers/base.h
 +++ b/include/flatbuffers/base.h
-@@ -264,7 +264,8 @@ namespace flatbuffers {
+@@ -270,7 +270,8 @@ namespace flatbuffers {
    // strtoull_l}.
    #if (defined(_MSC_VER) && _MSC_VER >= 1800) || \
        (defined(__ANDROID_API__) && __ANDROID_API__>= 21) || \
diff --git a/package/flatbuffers/Config.in b/package/flatbuffers/Config.in
index 992738282f..878bbd0d6d 100644
--- a/package/flatbuffers/Config.in
+++ b/package/flatbuffers/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_FLATBUFFERS
 	  Python. It was originally created at Google for game
 	  development and other performance-critical applications.
 
-	  http://google.github.io/flatbuffers/
+	  https://flatbuffers.dev
 
 comment "flatbuffers needs a toolchain w/ C++, gcc >= 4.7"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
diff --git a/package/flatbuffers/flatbuffers.hash b/package/flatbuffers/flatbuffers.hash
index 3c3a90d6f3..ac2c9fc63a 100644
--- a/package/flatbuffers/flatbuffers.hash
+++ b/package/flatbuffers/flatbuffers.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  1cce06b17cddd896b6d73cc047e36a254fb8df4d7ea18a46acf16c4c0cd3f3f3  flatbuffers-23.5.26.tar.gz
+sha256  4157c5cacdb59737c5d627e47ac26b140e9ee28b1102f812b36068aab728c1ed  flatbuffers-24.3.25.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/flatbuffers/flatbuffers.mk b/package/flatbuffers/flatbuffers.mk
index 3998a25cdf..33481eabf8 100644
--- a/package/flatbuffers/flatbuffers.mk
+++ b/package/flatbuffers/flatbuffers.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLATBUFFERS_VERSION = 23.5.26
+FLATBUFFERS_VERSION = 24.3.25
 FLATBUFFERS_SITE = $(call github,google,flatbuffers,v$(FLATBUFFERS_VERSION))
 FLATBUFFERS_LICENSE = Apache-2.0
 FLATBUFFERS_LICENSE_FILES = LICENSE
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

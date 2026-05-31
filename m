Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F33CD6E57
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 21:44:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39D7584B02;
	Sun, 31 May 2026 21:44:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tz61Fx-JvOCs; Sun, 31 May 2026 21:44:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3EE1D84AE1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780263848;
	bh=AOlX7N3jWbzsPlaisxVatudo9WRXep4hxzmT16oklRc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Unv049tJQprtlxVkRR0EEuC0SHUePGTIYr5Xv+rtruvyF7+bMRtnn9ZI2kT+4v2Mm
	 NQP2ksPixKo++Wuo0rzVoXv5zPvL9oDNY2PowluxmgimY3cB7Wmx0FeFVqnAJvzVkh
	 oa08qviXZ1w1IO2K/R3PbA34nFDVn+N3b6kO14Ds9HzOxCWShGdp33kOrufu+s3gZX
	 D0g1W8Ln14OgZnPvPUQVyUBr7lYHTss/FI/VuH4m9A8/U3tSdLYQSwLo/Yfa3cNRXp
	 tGT4uFpmOtKpkKKoiuXsJ15MNsk17vdlJ3bVzRA/R4/n91xfrhYR+vzDgUzq53giZq
	 K65rR4AUkz0+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EE1D84AE1;
	Sun, 31 May 2026 21:44:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E4F5F4
 for <buildroot@buildroot.org>; Sun, 31 May 2026 21:44:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7FE6A84AE1
 for <buildroot@buildroot.org>; Sun, 31 May 2026 21:44:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0cTTaxHymS_I for <buildroot@buildroot.org>;
 Sun, 31 May 2026 21:44:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B64F084ABA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B64F084ABA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B64F084ABA
 for <buildroot@buildroot.org>; Sun, 31 May 2026 21:44:03 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0bc7.dip0.t-ipconnect.de [91.58.11.199])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6735BA4C33F0;
 Sun, 31 May 2026 23:44:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51976)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wTnwv-0000000083Z-1pHZ;
 Sun, 31 May 2026 21:44:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Olivier Schonken <olivier.schonken@gmail.com>
Date: Sun, 31 May 2026 23:44:00 +0200
Message-ID: <20260531214400.1996805-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1780263841;
 bh=iUCEjzScNMxIhecbG38nJdzk9NQ22ETh37GRTJjUOm4=;
 h=From:To:Cc:Subject:Date:From;
 b=QWX+cW5Y6IWoyqd7SHAXJ6nH8sD1zSEzvr/2tuTmUVMByb7sv8Su5ehXhh2lAL9ga
 2Oago/nuHF+kdrRxseUZyJWn45vP2o1UcmIJKRJPwteEeQtEGMIJQU6lRZnAeNiwrd
 4+l/kevSLoXdts7Bg18OqPAYkzVoFGAKR1C8YMo0PuECtPXm7IBeG9relFvpnUpe2r
 fur6hHHtxqejwG7fJCLn8q1WxXWvHlO7w0K1B2PLm2lWjbEmXWd/P1UypGQpHm0/3A
 ZIT+HO9Qca9l1LkRYa5kH5ak4dCVAsAkIYUUKtZKdp2EPeSJ1Mbd1et7RVlTxljVLn
 v8vDh/9DvjgGw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=QWX+cW5Y
Subject: [Buildroot] [PATCH 1/1] package/poppler: needs zlib
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

Buildroot commit cdd1c5ca55620a4bdd1574d41fc5538d50f7359a bumped the
package from version 22.12.0 to 25.10.0 but forgot to change zlib into
a mandatory dependency. This is necessary due to upstream commit
https://gitlab.freedesktop.org/poppler/poppler/-/commit/7d87c7d2c6ca4f814f87329534a17dbf30203313
since version 23.07.0.

Fixes:
https://autobuild.buildroot.net/results/85f/85fb6c2945101b8d4ee86dbc32700293e7b35a86/

CMake Error at /usr/share/cmake/Modules/FindPackageHandleStandardArgs.cmake:290 (message):
  Could NOT find ZLIB (missing: ZLIB_LIBRARY ZLIB_INCLUDE_DIR)
Call Stack (most recent call first):
  /usr/share/cmake/Modules/FindPackageHandleStandardArgs.cmake:654 (_FPHSA_FAILURE_MESSAGE)
  /usr/share/cmake/Modules/FindZLIB.cmake:242 (find_package_handle_standard_args)
  CMakeLists.txt:309 (find_package)

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/c5f713c318de45dfb6d096e8b3998bde0ff76615

with the exception of bootlin-xtensa-uclibc which fails to build poppler
due to an error unrelated to this patch.

 package/poppler/Config.in  | 1 +
 package/poppler/poppler.mk | 9 +--------
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/package/poppler/Config.in b/package/poppler/Config.in
index 21c4d86cf6..208126a327 100644
--- a/package/poppler/Config.in
+++ b/package/poppler/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_POPPLER
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
 	select BR2_PACKAGE_FONTCONFIG
+	select BR2_PACKAGE_ZLIB
 	help
 	  Poppler is a PDF rendering library based on the xpdf-3.0
 	  code base.
diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index 08214d38b4..535c2b7b10 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -7,7 +7,7 @@
 POPPLER_VERSION = 25.10.0
 POPPLER_SOURCE = poppler-$(POPPLER_VERSION).tar.xz
 POPPLER_SITE = https://poppler.freedesktop.org
-POPPLER_DEPENDENCIES = fontconfig host-pkgconf
+POPPLER_DEPENDENCIES = fontconfig host-pkgconf zlib
 POPPLER_LICENSE = GPL-2.0+
 POPPLER_LICENSE_FILES = COPYING
 POPPLER_CPE_ID_VENDOR = freedesktop
@@ -95,13 +95,6 @@ else
 POPPLER_CONF_OPTS += -DENABLE_UTILS=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_ZLIB),y)
-POPPLER_DEPENDENCIES += zlib
-POPPLER_CONF_OPTS += -DENABLE_ZLIB_UNCOMPRESS=ON
-else
-POPPLER_CONF_OPTS += -DENABLE_ZLIB_UNCOMPRESS=OFF
-endif
-
 ifeq ($(BR2_PACKAGE_CAIRO),y)
 POPPLER_DEPENDENCIES += cairo
 POPPLER_CONF_OPTS += -DWITH_Cairo=ON
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

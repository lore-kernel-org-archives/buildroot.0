Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85AF8C36008
	for <buildroot@archiver.kernel.org>; Wed, 26 Mar 2025 08:05:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0521A6F5CD;
	Wed, 26 Mar 2025 08:05:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TrBfDRB6WRny; Wed, 26 Mar 2025 08:05:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B8186F5E6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B8186F5E6;
	Wed, 26 Mar 2025 08:05:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1468CE4
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 08:05:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 062868101C
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 08:05:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yyDrSi3wpv7H for <buildroot@buildroot.org>;
 Wed, 26 Mar 2025 08:05:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E39FA810A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E39FA810A0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E39FA810A0
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 08:05:17 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-ac2a9a74d9cso1291712366b.1
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 01:05:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742976315; x=1743581115;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q8YHpEKEWPP+9/kyl0sfAJvWTLRwyHimf0iGggK9L1o=;
 b=XyjWmR2qKZ260IT09Aes6p7Ez77B9YXbLAYMIkhMkU+nffu3Y5RlkQTBMheypa6wRg
 YWPRLPvJynfw3J4TciwtkdAPHhbwUSNVf0CGGIhWE1jzx18A/jP+aSW5QtImXOL2SU1T
 PNc/lQEddkiHHo5CqQRPbs2Poz4Yeb9dIwwhwE09iVofuRn6Ki2RA5+6+nXg4wAJ9jcF
 iXCw556hgIMnnhr4JLp9wMWLTy+0djo5yec1q+8D32PLWWfoJmtEJcHDZC4oaqoTMGl1
 10iPhHLpY0cF3qs2tBEv0nD/NI4miRq0YZBA8oFC/BEAnsjfQZQrTOsC5XRjLVsGLGcm
 29fw==
X-Gm-Message-State: AOJu0YwWK6Ouq399dr9IqK6AHpKNxM1BXJRoRVqDK3u52TeumnZb9afY
 j43tvk6trQCyBaDahr2J4Z5bnAq/zItCI7BYN/1DMH874LZBjCcYiHOHnA==
X-Gm-Gg: ASbGncsubOFiuzO7EX6+cw54tauAOk8S4nEfOXSA0z2DGmWNb4U5q6j0dEwEYkI+Gc8
 nOuB9+gV0B0lytfmxTWWYWlwi8UsOwL6aoyhB6fhHP1ftDZk6Kk7VLEe0cNYrTLtQKkmClWz6yI
 Yu5a1OQnpaeNf8FdPO+tzHwmcpFH5CC6v37kHnocqnnEBJEMpQERi1HJHo/4UUK1ZGExaZnUsDH
 dqo/UvIx5/3ZWdds7FHLXp5TZK3iWBN3ZrIQ3crawSvzQF1anCj3YSJqiLWue934toFRbBZyq9r
 uJVDHFHrY0IsqtYwfcIX+VLgC3ioLcRpSPNLsnmNXI/LyiK8Ue+6Q6LHNplonk/jraVCADStKaX
 3u0lcfB90ZqWrBRHvinDq0hsqsw==
X-Google-Smtp-Source: AGHT+IGDvRPqDUtYtRS0/YYkrmJ4Gy6FOuGVIkyPkMQ9i+kjqh+CC2FxU5UkFaMuv5nWXKPBOCEoRQ==
X-Received: by 2002:a17:907:bb4b:b0:ac1:dd6f:f26c with SMTP id
 a640c23a62f3a-ac3f251fae2mr2027893766b.46.1742976314890; 
 Wed, 26 Mar 2025 01:05:14 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3efd47d66sm986332966b.166.2025.03.26.01.05.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Mar 2025 01:05:14 -0700 (PDT)
From: yegorslists@googlemail.com
To: buildroot@buildroot.org
Date: Wed, 26 Mar 2025 09:05:06 +0100
Message-Id: <20250326080506.3467586-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1742976315; x=1743581115; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=q8YHpEKEWPP+9/kyl0sfAJvWTLRwyHimf0iGggK9L1o=;
 b=m7A4L1bynR5s/3WnupDm5OcI/yXtVzBnoV1Psh+vXmtc0Ah/qnjOrbljiXlbid27a5
 oTglJM1xEipQUo5m9NPPnAXp4HH1HUpZJv4KSLa8wLjHqtCweiLCFonnFjBEsMyU+0U8
 Tu9OFLcnqM8mtuRlwCFK8ygVxL3yTvJcqJHGhKLuArNe4ClzlASQfJlchA5P81RD3Foa
 acja32aBQusa9cVxjhKJK0EjuqM/S42Rv5gyLgAm3Q5H21vQKBPUK12BBxwN4WhTtxvj
 jm//nPSgWCGuSOtmyMwdWk826tPwvL9Xi6PQp7/oItaeWjH2GbybtJaXFNHkwB7VAhti
 E4vw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=m7A4L1by
Subject: [Buildroot] [PATCH] package/ncftp: bump to version 3.2.9
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

From: Yegor Yefremov <yegorslists@googlemail.com>

Remove upstreamed patches.

Autoreconf is broken. Hence, use the configure script directly.

Fixes:
https://autobuild.buildroot.org/results/60c3dbe02af354ff9820258ffd00eec088114d69/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 .../ncftp/0001-ncftp-3.2.7-fix-gcc14.patch    | 19 -----
 .../ncftp/0002-ncftp-3.2.7-fix-clang.patch    | 72 -------------------
 package/ncftp/ncftp.hash                      |  2 +-
 package/ncftp/ncftp.mk                        | 13 +---
 4 files changed, 3 insertions(+), 103 deletions(-)
 delete mode 100644 package/ncftp/0001-ncftp-3.2.7-fix-gcc14.patch
 delete mode 100644 package/ncftp/0002-ncftp-3.2.7-fix-clang.patch

diff --git a/package/ncftp/0001-ncftp-3.2.7-fix-gcc14.patch b/package/ncftp/0001-ncftp-3.2.7-fix-gcc14.patch
deleted file mode 100644
index e2cda631d4..0000000000
--- a/package/ncftp/0001-ncftp-3.2.7-fix-gcc14.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-fix select arg detection
-
-Reference:
- https://bugs.gentoo.org/921487
-
-Upstream: N/A, unresponsive contact email address.
-
-Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---- a/autoconf_local/aclocal.m4
-+++ b/autoconf_local/aclocal.m4
-@@ -4196,7 +4196,7 @@
- #include <sys/select.h>
- #endif
- #include <sys/socket.h>	/* MG: always incl */
--extern select ($ac_cv_func_select_arg1,$ac_cv_func_select_arg234,$ac_cv_func_select_arg234,$ac_cv_func_select_arg234,$ac_cv_func_select_arg5);],,dnl
-+extern int select ($ac_cv_func_select_arg1,$ac_cv_func_select_arg234,$ac_cv_func_select_arg234,$ac_cv_func_select_arg234,$ac_cv_func_select_arg5);],,dnl
-         [ac_not_found=no ; break 3],ac_not_found=yes)
-       done
-      done
diff --git a/package/ncftp/0002-ncftp-3.2.7-fix-clang.patch b/package/ncftp/0002-ncftp-3.2.7-fix-clang.patch
deleted file mode 100644
index bed103609c..0000000000
--- a/package/ncftp/0002-ncftp-3.2.7-fix-clang.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-Fix compilation with clang-16
-
-aclocal.m4 contains code that no longer compiles: missing headers and missing
-return types.
-
-Reference:
- https://gitweb.gentoo.org/repo/gentoo.git/tree/net-ftp/ncftp/files/ncftp-3.2.7-fix-clang.patch
-
-Upstream: N/A, unresponsive contact email address.
-
-Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---- a/autoconf_local/aclocal.m4
-+++ b/autoconf_local/aclocal.m4
-@@ -3057,6 +3057,7 @@
- #include <sys/uio.h>
- #include <sys/socket.h>
- #include <sys/un.h>
-+#include <string.h>
- ],[
- struct sockaddr_un uaddr;
- 
-@@ -3285,6 +3286,7 @@
- #ifdef HAVE_RESOLV_H
- #	include <resolv.h>
- #endif
-+#include <string.h>
- ],[
- 	/* function-body */
- 	int len;
-@@ -3363,6 +3365,7 @@
- #include <stdio.h>
- #include <stdlib.h>
- 		 
-+			int
- 			main(int argc, char **argv)
- 			{
- 				/* Note:  don't actually call readline,
-@@ -5145,6 +5148,7 @@
- #ifdef HAVE_STDLIB_H
- #	include <stdlib.h>
- #endif
-+#include <string.h>
- 
- #ifdef HAVE_NCURSES_H
- #	define NCURSES_OPAQUE 0
-@@ -5176,6 +5180,7 @@
- #endif
- 
-  
-+int
- main(int argc, char **argv)
- {
- 	/* Note:  don't actually call curses, since it may block;
-@@ -6510,7 +6515,6 @@
- #endif
- #endif			/* MG */
- 
--int
- int  main(void)
- {
- 	char *data, *data2, *data3;
-@@ -6607,8 +6611,9 @@
- 	AC_CACHE_CHECK(whether setvbuf arguments are reversed,
- 	  ac_cv_func_setvbuf_reversed,
- 	[AC_TRY_RUN([#include <stdio.h>
-+	$include <stdlib.h>
- 	/* If setvbuf has the reversed format, exit 0. */
--	main () {
-+	int main (void) {
- 	  /* This call has the arguments reversed.
- 	     A reversed system may check and see that the address of main
- 	     is not _IOLBF, _IONBF, or _IOFBF, and return nonzero.  */
diff --git a/package/ncftp/ncftp.hash b/package/ncftp/ncftp.hash
index 3e390b1015..a9414d62f5 100644
--- a/package/ncftp/ncftp.hash
+++ b/package/ncftp/ncftp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  d41c5c4d6614a8eae2ed4e4d7ada6b6d3afcc9fb65a4ed9b8711344bef24f7e8  ncftp-3.2.7-src.tar.xz
+sha256  f1108e77782376f8aec691f68297a3364a9a7c2d9bb12e326f550ff9770f47a7  ncftp-3.2.9-src.tar.gz
 sha256  4fe2f063d25d79c49712a272ebb68e050c703eed9c66c80108427edfe3285580  doc/LICENSE.txt
diff --git a/package/ncftp/ncftp.mk b/package/ncftp/ncftp.mk
index 57c3a5d08b..fa46bc3339 100644
--- a/package/ncftp/ncftp.mk
+++ b/package/ncftp/ncftp.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-NCFTP_VERSION = 3.2.7
-NCFTP_SOURCE = ncftp-$(NCFTP_VERSION)-src.tar.xz
+NCFTP_VERSION = 3.2.9
+NCFTP_SOURCE = ncftp-$(NCFTP_VERSION)-src.tar.gz
 NCFTP_SITE = https://www.ncftp.com/public_ftp/ncftp
 NCFTP_TARGET_BINS = ncftp
 NCFTP_LICENSE = ClArtistic
@@ -14,15 +14,6 @@ NCFTP_LICENSE_FILES = doc/LICENSE.txt
 NCFTP_DEPENDENCIES = host-autoconf
 NCFTP_CONF_OPTS = --disable-ccdv
 
-# The bundled configure script is generated by autoconf 2.13 and doesn't
-# detect cross-compilation correctly. Therefore, we have to regenerate it.
-# We need to pass -I because of the non-standard m4 directory name, and
-# none of the other autotools are used, so the below is the easiest.
-define NCFTP_RUN_AUTOCONF
-	(cd $(@D); $(AUTOCONF) -I$(@D)/autoconf_local/)
-endef
-NCFTP_PRE_CONFIGURE_HOOKS += NCFTP_RUN_AUTOCONF
-
 ifeq ($(BR2_PACKAGE_NCFTP_GET),y)
 NCFTP_TARGET_BINS += ncftpget
 endif
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

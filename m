Return-Path: <SRS0=tQX8=NU=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 064D7C432BE
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 19:29:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6A5E60551
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 19:29:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A6A5E60551
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 670A180B93;
	Sun, 29 Aug 2021 19:29:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I8eux_4OPxpv; Sun, 29 Aug 2021 19:29:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D917680B98;
	Sun, 29 Aug 2021 19:29:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 227A71BF36A
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 19:29:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1239240327
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 19:29:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9QYyQOnEztu6 for <buildroot@lists.busybox.net>;
 Sun, 29 Aug 2021 19:29:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F0E3540326
 for <buildroot@buildroot.org>; Sun, 29 Aug 2021 19:28:59 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id b6so19219706wrh.10
 for <buildroot@buildroot.org>; Sun, 29 Aug 2021 12:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XsfwUbPpvjZF/Ehr3229+5BdPGVughB8kV8RmDUfwEI=;
 b=QkiE29KWx3MKYZKJnHMxf7zAct3DxTqofQG6hn7+8Ve/KxP9ich0f8QCBS6Sx0XkPg
 bkTTyTcOqd4l/DKXvrph1gWq1A5Qoj9OceCmcB7aEu8VC/1yMIroVlMPSetJVg+pxMQR
 s1k78NBxZdw+vOIXVUq36ZruioDpPClxlG0HBAKvYTB2cRy0IF3d1gkyJHZNAKwnHwIY
 xrDxqImvqn/oS9eCV+NbfOswFTnzbmLK75XEfFbQr1LfTIcOLNc/RNadqAxkETPARblR
 knlS/aKYiHBQWNHZ5c3JhVPGOfsISW0jbAOEQGdkj5ZLHanXcu2t/RhlFS1UrM6iFS0v
 JQ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XsfwUbPpvjZF/Ehr3229+5BdPGVughB8kV8RmDUfwEI=;
 b=D4au0h88kO1f35qaQMACmZ/XVlkHSJVoIEAx5BD2MXqCzN6LlwE9VzmHo9OkG4W6FB
 45bFPyfQ+P2NANXmIUTNH8mQib0qpZJAcQbwimUDS7rZGXIRj2FsdIsSXBnwn8vF7h8k
 KSz6agl6vasBKUjkJ/dS5WmIEkWf+fSF4nD2jmsov5z70qfMSWm0YhrKVlIW771CmgdC
 vhf9B1vMOeMqlgopappjHR2uZp9b8SpfLcVsRe4AMN7yVH5RE7hxCOjMLqIE/5RMcjyR
 dGuuHCtThrhEv9s+jE/mcz1I/QEOUjh+/V6oS86toEi1W8InBMPjpPawMWSRz0s5Yl+1
 GbJQ==
X-Gm-Message-State: AOAM532qMFFJatlK+JeJMZe1+6t4+hHccRBelLsrONIryMVt/ky+hyl1
 vldIU9wsUBx7hsHIn+TxNxadtSjshrvRFg==
X-Google-Smtp-Source: ABdhPJyi3f8oiQSdgjmul4tOWYnTJDIEsBV1NwT5b9/ND+DaR4YFDNLZqDfhLrz1d3KmmYsY2f3awg==
X-Received: by 2002:a5d:6cb0:: with SMTP id a16mr21349954wra.245.1630265337913; 
 Sun, 29 Aug 2021 12:28:57 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id e9sm10209822wrd.69.2021.08.29.12.28.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Aug 2021 12:28:57 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 29 Aug 2021 21:28:53 +0200
Message-Id: <20210829192853.2061392-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/linux-pam: find libxcrypt through
 pkg-config
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Find libxcryt through pkg-config to avoid the following build failure:

/home/buildroot/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/riscv64-buildroot-linux-musl/10.2.0/../../../../riscv64-buildroot-linux-musl/bin/ld: .libs/passverify.o: in function `.L30':
passverify.c:(.text+0x368): undefined reference to `crypt_checksalt'

Fixes:
 - http://autobuild.buildroot.org/results/20b14e222b35c2d1269960075832b784ba81aa1a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...o-search-libcrypt-through-pkg-config.patch | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 package/linux-pam/0004-configure.ac-also-search-libcrypt-through-pkg-config.patch

diff --git a/package/linux-pam/0004-configure.ac-also-search-libcrypt-through-pkg-config.patch b/package/linux-pam/0004-configure.ac-also-search-libcrypt-through-pkg-config.patch
new file mode 100644
index 0000000000..e582a82284
--- /dev/null
+++ b/package/linux-pam/0004-configure.ac-also-search-libcrypt-through-pkg-config.patch
@@ -0,0 +1,56 @@
+From 9e1d70995e2b44520a798c94807b5900a9b3280b Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 29 Aug 2021 21:15:57 +0200
+Subject: [PATCH] configure.ac: also search libcrypt through pkg-config
+
+libxcrypt provides a libcrypt.pc file so use it if available as this
+will allow to retrieve the library path (e.g.
+-L/home/buildroot/output/host//riscv64-buildroot-linux-musl/sysroot/usr/lib)
+which is useful when cross-compiling and will avoid the following build
+failure on buildroot:
+
+/home/buildroot/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/riscv64-buildroot-linux-musl/10.2.0/../../../../riscv64-buildroot-linux-musl/bin/ld: .libs/passverify.o: in function `.L30':
+passverify.c:(.text+0x368): undefined reference to `crypt_checksalt'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/20b14e222b35c2d1269960075832b784ba81aa1a
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/linux-pam/linux-pam/pull/388]
+---
+ configure.ac | 12 +++++++++---
+ 1 file changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index d464884c..56261e9b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -363,8 +363,13 @@ AC_CHECK_HEADERS(crypt.h)
+ 
+ BACKUP_LIBS=$LIBS
+ LIBCRYPT=""
+-AC_SEARCH_LIBS([crypt_gensalt_rn],[crypt])
+-case "$ac_cv_search_crypt_gensalt_rn" in
++PKG_CHECK_MODULES([CRYPT], [libcrypt], [
++  CFLAGS="$CFLAGS $CRYPT_CFLAGS"
++  CPPFLAGS="$CPPFLAGS $CRYPT_CFLAGS"
++  LIBCRYPT="$CRYPT_LIBS"
++], [
++  AC_SEARCH_LIBS([crypt_gensalt_rn],[crypt])
++  case "$ac_cv_search_crypt_gensalt_rn" in
+ 	-l*) LIBCRYPT="$ac_cv_search_crypt_gensalt_rn" ;;
+ 	no) AC_SEARCH_LIBS([crypt_r],[crypt])
+ 		case "$ac_cv_search_crypt_r" in
+@@ -374,7 +379,8 @@ case "$ac_cv_search_crypt_gensalt_rn" in
+ 			-l*) LIBCRYPT="$ac_cv_search_crypt" ;;
+ 		esac ;;
+ 	esac ;;
+-esac
++  esac
++])
+ AC_CHECK_FUNCS([crypt_r])
+ LIBS=$BACKUP_LIBS
+ AC_SUBST(LIBCRYPT)
+-- 
+2.32.0
+
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

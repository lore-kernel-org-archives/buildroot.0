Return-Path: <SRS0=17BZ=NV=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17D3EC4320E
	for <buildroot@archiver.kernel.org>; Mon, 30 Aug 2021 16:06:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA8BD60ED8
	for <buildroot@archiver.kernel.org>; Mon, 30 Aug 2021 16:06:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BA8BD60ED8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86951605E2;
	Mon, 30 Aug 2021 16:06:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iJeZVqbv2cS8; Mon, 30 Aug 2021 16:06:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F35C606D0;
	Mon, 30 Aug 2021 16:06:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 97D1A1BF3C0
 for <buildroot@lists.busybox.net>; Mon, 30 Aug 2021 16:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8806E80E7F
 for <buildroot@lists.busybox.net>; Mon, 30 Aug 2021 16:06:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nwf_-iH2O29L for <buildroot@lists.busybox.net>;
 Mon, 30 Aug 2021 16:06:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3098980E7E
 for <buildroot@buildroot.org>; Mon, 30 Aug 2021 16:06:09 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id u9so23153569wrg.8
 for <buildroot@buildroot.org>; Mon, 30 Aug 2021 09:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vMcK3/OsxSXa05ly0UdWKTZ7a3bq19Zkc+wMXOpwOhw=;
 b=oHU8jinogIcgeExT4mTTAHSwH0W26rNALOg/R9zPmqmJHcY1BY7dqkxspouIxqHOuW
 ARdffhKnOUQfqc9ucfVuL7brUv4dEiLno44SU8Lqlo+NeuXAwiJrNegrPMNGElg/XOsy
 9eyl/a5KCDTmPTNW4xQ/eSU4FsRZ4nhAGQQE49LhL9Bp8mVq6/FHO2KMmV9lHtn5a4k5
 CM0FMqNT4Sb/tqMoymsn4WVKgTP/Q/u9hE6Zk2bjg1TeVdU1mhnAE0tW+NTFC4bGdHJp
 4YZsdVm1u00wtheXOMoVbX9xEn0zWdZp+smipl59KzBmshlzStXb6NcEVX2cNiRdIeoj
 yHsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vMcK3/OsxSXa05ly0UdWKTZ7a3bq19Zkc+wMXOpwOhw=;
 b=uW852cTjAZfyVk96K1bCkTW/cSUBvz6pyc+QZP8WdpBA7kuTeKLJGtPQQb/KDVPsnc
 4whI4vDVOm/qzVHzr5Gbm7GH30bKCwJwoonNuS4baG/024eVI6RB4+4lbBMrCu0YX6Q+
 v3fVgfKByfvzvZJBvbmRQS++O9ugAds5Hc8vQ4IO+LKeczN8z7Sfi8RgwnPFz7O9YP1d
 la5pSsK3vcCI+rGvLbfgJ0CCfWR7MOepeTO25ewDeFTIzSE0eHEkzrx0eYz37VX879F2
 LCuUFvFAAs7672wr7f7MSHhAa5iq4QoIQ8HlY3rF0hLKWh/9er98aH9tX+9AVNc/DGp9
 +usw==
X-Gm-Message-State: AOAM531Zx8solODRdrqT9YVV7Jx11JS3M3KcCW3g3iqS0Xu8n2BKZdJc
 WdYSBTqe6VnY0CO2/ybK80dKSI4usv35KA==
X-Google-Smtp-Source: ABdhPJxmHhFN1QmYMMEZH7QGJPPfePc8W8fyprjJxKYIXFkc8Muz9dhkMGb0KbmrrhkruQkMyUzmUQ==
X-Received: by 2002:adf:c3c9:: with SMTP id d9mr25255432wrg.339.1630339567211; 
 Mon, 30 Aug 2021 09:06:07 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id r15sm8862408wmh.27.2021.08.30.09.06.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Aug 2021 09:06:06 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 30 Aug 2021 18:05:58 +0200
Message-Id: <20210830160558.3606436-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,
 1/1] package/linux-pam: find libxcrypt through pkg-config
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
Changes v1 -> v2:
 - Update patch (merged upstream)

 ...o-search-libcrypt-through-pkg-config.patch | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 package/linux-pam/0004-configure.ac-also-search-libcrypt-through-pkg-config.patch

diff --git a/package/linux-pam/0004-configure.ac-also-search-libcrypt-through-pkg-config.patch b/package/linux-pam/0004-configure.ac-also-search-libcrypt-through-pkg-config.patch
new file mode 100644
index 0000000000..09b86902bb
--- /dev/null
+++ b/package/linux-pam/0004-configure.ac-also-search-libcrypt-through-pkg-config.patch
@@ -0,0 +1,55 @@
+From 49e3ffcbe267691dfbf24c91417aa296e7412146 Mon Sep 17 00:00:00 2001
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
+[Retrieved from:
+https://github.com/linux-pam/linux-pam/commit/49e3ffcbe267691dfbf24c91417aa296e7412146]
+---
+ configure.ac | 13 ++++++++++---
+ 1 file changed, 10 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index d464884c..c06bc7dd 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -363,8 +363,14 @@ AC_CHECK_HEADERS(crypt.h)
+ 
+ BACKUP_LIBS=$LIBS
+ LIBCRYPT=""
+-AC_SEARCH_LIBS([crypt_gensalt_rn],[crypt])
+-case "$ac_cv_search_crypt_gensalt_rn" in
++PKG_CHECK_MODULES([CRYPT], [libcrypt], [
++  CFLAGS="$CFLAGS $CRYPT_CFLAGS"
++  CPPFLAGS="$CPPFLAGS $CRYPT_CFLAGS"
++  LIBS="$LIBS $CRYPT_LIBS"
++  LIBCRYPT="$CRYPT_LIBS"
++], [
++  AC_SEARCH_LIBS([crypt_gensalt_rn],[crypt])
++  case "$ac_cv_search_crypt_gensalt_rn" in
+ 	-l*) LIBCRYPT="$ac_cv_search_crypt_gensalt_rn" ;;
+ 	no) AC_SEARCH_LIBS([crypt_r],[crypt])
+ 		case "$ac_cv_search_crypt_r" in
+@@ -374,7 +380,8 @@ case "$ac_cv_search_crypt_gensalt_rn" in
+ 			-l*) LIBCRYPT="$ac_cv_search_crypt" ;;
+ 		esac ;;
+ 	esac ;;
+-esac
++  esac
++])
+ AC_CHECK_FUNCS([crypt_r])
+ LIBS=$BACKUP_LIBS
+ AC_SUBST(LIBCRYPT)
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

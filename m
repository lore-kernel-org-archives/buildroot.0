Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC102C433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 20:21:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FFF46103D
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 20:21:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3FFF46103D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3C0384145;
	Wed,  6 Oct 2021 20:21:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HxmXFF4oGV7K; Wed,  6 Oct 2021 20:21:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46B6984143;
	Wed,  6 Oct 2021 20:21:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 784C61BF34F
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 20:21:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 666C440796
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 20:21:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lkr3OGKR_wjE for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 20:21:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 71A9840111
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 20:21:39 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id o20so12319600wro.3
 for <buildroot@buildroot.org>; Wed, 06 Oct 2021 13:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Wr+DX2b5PJ1T+j19KSS6RwTkRIfoqBrmPBY/Sy8ywSE=;
 b=kHSd98rI4IpK/ZV2KBuojgGciiFeHtG+BKkx2FSX6KwocG1SJ+Wa7D4tQwhB4sQHVi
 GUfWE69RRGevD0UvOth9dxjR80fdEcrWZuwrJqPqaOl7MDtz6YNjIlDlti7AU+mTQe8r
 0R3Vq8+pPUvfiojRyAttPZgn3pxQF0Ps0i9N1UkShyEeF4xhbAkuwINgt5Rfqr/D3vSZ
 ds5vKioo9Bn+/Gdpfr/BfjMdDR2SgRaO2cDVWPLNss4f0wcCTxZZ2zYGWVo0mxmGKs3z
 1e4xEII586GNimv3opJCGg4Y7yv7l2pbYvFmD9eip8hTu6Ovi4Qd/o6bmSc7xV3KVumb
 REww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Wr+DX2b5PJ1T+j19KSS6RwTkRIfoqBrmPBY/Sy8ywSE=;
 b=y6k8tY+wLroaP2ZE6Y6fPET4cBQ1tqX3PjP72kyshgT2MZKovhdgn4cuK834PVGaQU
 S7jtB5dpL1Y64SqNQlONGQmbjcOhET1K1Pu+4w11kCCnV+9U7VznNdzqREvZU5cGcyIs
 R3L2XIq/Vp3/CkcMFxiakA7XcPV+Mes2A9EFIEAzY+ttdpLw15knlmQiQtsvBi/b4wMh
 qDdgFUOMQs9zqCVFp3tP+7z+qJGtuu8xhQXYS5EmwML2sCxev9slz5IT79jlBi1CTqFW
 1xsjYmSKbHaP7s/UQfmav7kqolRjut97H92KhGyZqIpTi1LbiZuT1htjz1+V4F2vZ4i7
 Vu0g==
X-Gm-Message-State: AOAM532gVPLgs/jXMr8mJJgYyB6ZyUwq4GctPD+Px/ZxvTzBtDQ3qB09
 pimTliEY5VZbNwTgb5hl58+Rot7cTkA=
X-Google-Smtp-Source: ABdhPJwp8rnzANZ0yClPbzLl+Bfc1wcyM8dbTjSMZdkIWKw5wb5ee/1g2LM/kYoyfqlgak3IIPyPYg==
X-Received: by 2002:a05:600c:4ed3:: with SMTP id
 g19mr280750wmq.195.1633551697163; 
 Wed, 06 Oct 2021 13:21:37 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-421-88.w2-10.abo.wanadoo.fr.
 [2.10.246.88])
 by smtp.gmail.com with ESMTPSA id x17sm21954598wrc.51.2021.10.06.13.21.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 13:21:36 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 Oct 2021 22:20:45 +0200
Message-Id: <20211006202045.3113262-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/tpm2-tss: fix build with autoconf
 >= 2.70
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

Fix the following build failure raised since bump of autoconf to version
2.71 in commit ecd54b65c1f998a7ccd91f7c523e4ff38c4781da:

./configure: line 14636: syntax error near unexpected token `newline'
./configure: line 14636: `    '''
package/pkg-generic.mk:273: recipe for target '/home/buildroot/autobuild/instance-3/output-1/build/tpm2-tss-3.0.3/.stamp_configured' failed

It should be noted that this patch is included in version 3.1:
https://patchwork.ozlabs.org/project/buildroot/patch/RnUd7kxUKLWeLZSMoM1dFtpAD4Qfe3R-67gu27eAGtE6yrgC1oHzq1GwiOoE9Gmk6uZZ-c6k6LUVxdMqKhUro4_bM4zZKPhsbN5e9BV8SV4=@protonmail.com

Fixes:
 - http://autobuild.buildroot.org/results/5d4ca70ebf30463aa7e8a96a90effa6282f57e21

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...fix-compatibility-with-autoconf-2-70.patch | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 package/tpm2-tss/0002-configure-ac-fix-compatibility-with-autoconf-2-70.patch

diff --git a/package/tpm2-tss/0002-configure-ac-fix-compatibility-with-autoconf-2-70.patch b/package/tpm2-tss/0002-configure-ac-fix-compatibility-with-autoconf-2-70.patch
new file mode 100644
index 0000000000..f21aa179f8
--- /dev/null
+++ b/package/tpm2-tss/0002-configure-ac-fix-compatibility-with-autoconf-2-70.patch
@@ -0,0 +1,48 @@
+From 03cca78d24d716eec792f86f5b0bc69886fad981 Mon Sep 17 00:00:00 2001
+From: Patrick McCarty <patrick.mccarty@intel.com>
+Date: Fri, 18 Dec 2020 01:54:05 +0000
+Subject: [PATCH] configure.ac: fix compatibility with autoconf 2.70
+
+With autoconf 2.70, not quoting the second argument to one of the AS_IF
+macro expansions leads to generation of invalid shell code affecting the
+first nested ERROR_IF_NO_PROG expansion.
+
+The invalid shell code leads to an error resembling:
+
+  ./configure: line 18826: syntax error near unexpected token `newline'
+  ./configure: line 18826: `    '''
+
+Fix the issue by quoting the second argument to the affected AS_IF,
+similar to the quoting found elsewhere in configure.ac.
+
+Signed-off-by: Patrick McCarty <patrick.mccarty@intel.com>
+
+[Retrieved from:
+https://github.com/tpm2-software/tpm2-tss/commit/03cca78d24d716eec792f86f5b0bc69886fad981]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index ff59dd7ce..3049032bc 100755
+--- a/configure.ac
++++ b/configure.ac
+@@ -285,7 +285,7 @@ AC_ARG_ENABLE([integration],
+         [build and execute integration tests])],,
+     [enable_integration=no])
+ AS_IF([test "x$enable_integration" = "xyes"],
+-     AS_IF([test "$HOSTOS" = "Linux"],
++     [AS_IF([test "$HOSTOS" = "Linux"],
+            [ERROR_IF_NO_PROG([ss])],
+            [ERROR_IF_NO_PROG([sockstat])])
+        ERROR_IF_NO_PROG([echo])
+@@ -335,7 +335,7 @@ AS_IF([test "x$enable_integration" = "xyes"],
+              [AC_MSG_ERROR([No simulator executable found in PATH for testing TCTI.])])
+        AC_SUBST([INTEGRATION_TCTI], [$integration_tcti])
+        AC_SUBST([INTEGRATION_ARGS], [$integration_args])
+-       AC_SUBST([ENABLE_INTEGRATION], [$enable_integration]))
++       AC_SUBST([ENABLE_INTEGRATION], [$enable_integration])])
+ AM_CONDITIONAL([ENABLE_INTEGRATION],[test "x$enable_integration" = "xyes"])
+ #
+ # sanitizer compiler flags
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

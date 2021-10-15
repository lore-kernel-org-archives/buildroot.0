Return-Path: <SRS0=lKTV=PD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99D8AC433F5
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 06:23:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B56561181
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 06:23:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0B56561181
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D17184026F;
	Fri, 15 Oct 2021 06:23:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xcua3wECqqhb; Fri, 15 Oct 2021 06:23:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 298624020A;
	Fri, 15 Oct 2021 06:23:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 293981BF3F6
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 06:23:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1472F40153
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 06:23:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zQgTNzbbfgJb for <buildroot@lists.busybox.net>;
 Fri, 15 Oct 2021 06:23:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A433940012
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 06:23:36 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id v17so24489655wrv.9
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 23:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TxRstiEFu/lYmTcn4BuNU0eVQg4ottAi78NcHbt53DM=;
 b=cTtqypfQxQPAU2GUE4BQ7RdPfTupRSwFQ89spVMhFHfmCSn6ILjFQkI7KbL/AKJmLT
 kOiSLy44UhdN8G7xhq6Wo2+CkEi8SZmvpvcgS1EOXR87gsKtAPAGW3Jy0TQCUGk59VY1
 HdF/5UNLU82ZgD8G9bWXcqvo9lGb+rygxqzN7w/p+44+1AiCuFB7h8XMJLaBxFi6qkRn
 AUby/wGr7f4vSGBlV7GXZsxI9hubEdf0FSFGdUlh3XgELlBis2sXs8zNzPYWyXNxNugI
 1z1WXFzckshhoQbjehrVCtw5n82dJvcwgEGvRiRsbpnWl7bfQfM+zvHDiZUfYmyZCR+v
 ZSoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TxRstiEFu/lYmTcn4BuNU0eVQg4ottAi78NcHbt53DM=;
 b=8Kq6TJVbbCUg/loQPd5yOUjMWLGjahLnoV90Fr/8tNOyZ1dL3u4QPDiiibLPA+gMn0
 lPPFxJiAciUihTVeXWZXw7vdEoEfFCuFWcingdjMq2I91xVSerFpx9aZFifcyPINqjs/
 4RpNco3n3EJHaGpVi717FN+XuorLHdO519fk2OD4lY01jyOcBqQcYte2ZF7kK/MpOKuI
 A4y700c+UcHFoIqxs1h7Q4OvZSOpT9ywzp2R07nAtMzefU3J10qoWD+1fTTQDWyHXgE4
 cuEh8d8oFmcSyUCNx1pb+P6iCFPwYJDkBqSsjYTdPQe5PLF8DN6OGar9Qhx2nu3dtKlz
 2XuQ==
X-Gm-Message-State: AOAM533dBbi0M1TeoIK04ca2EJCSj4Mjdmw+9Jgml/MgCX5pY/fwso8w
 KV/9r3ggpYjgNnOHkolnkDCzfmODEf4=
X-Google-Smtp-Source: ABdhPJyXh17dQnwnUSarV1fvcE33cnZxNuhn8wvsHoQ4cnwk4Svq0xu8P8h7dAUqRyI9f8iej499hQ==
X-Received: by 2002:adf:a454:: with SMTP id e20mr12184881wra.310.1634279014472; 
 Thu, 14 Oct 2021 23:23:34 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id r205sm3937106wma.3.2021.10.14.23.23.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 23:23:34 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 15 Oct 2021 08:22:08 +0200
Message-Id: <20211015062208.201342-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/shairport-sync: fix build with
 automake 1.16.5
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
Cc: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with convolution raised since bump of
automake to version 1.16.5 in commit
446d9f510255dda094d2ea89ad4f24a334b0ecc7 and
https://git.savannah.gnu.org/cgit/automake.git/commit/?id=f4a3a70f69e1dbccb6578f39ef47835098a04624:

configure.ac:305: error: AM_INIT_AUTOMAKE expanded multiple times
/home/giuliobenetti/autobuild/run/instance-1/output-1/host/share/aclocal-1.16/init.m4:29: AM_INIT_AUTOMAKE is expanded from...
configure.ac:6: the top level
/home/giuliobenetti/autobuild/run/instance-1/output-1/host/share/aclocal-1.16/init.m4:29: AM_INIT_AUTOMAKE is expanded from...
configure.ac:305: the top level

Fixes:
 - http://autobuild.buildroot.org/results/464148bdccb705d8992dc860262bfdeb01b7e2a1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...re.ac-fix-build-with-automake-1.16.5.patch | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 package/shairport-sync/0002-configure.ac-fix-build-with-automake-1.16.5.patch

diff --git a/package/shairport-sync/0002-configure.ac-fix-build-with-automake-1.16.5.patch b/package/shairport-sync/0002-configure.ac-fix-build-with-automake-1.16.5.patch
new file mode 100644
index 0000000000..2ee8f59fee
--- /dev/null
+++ b/package/shairport-sync/0002-configure.ac-fix-build-with-automake-1.16.5.patch
@@ -0,0 +1,48 @@
+From ad22edb303a470b6f9eda9fd9d3f588bb2eff8cb Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 15 Oct 2021 08:02:23 +0200
+Subject: [PATCH] configure.ac: fix build with automake 1.16.5
+
+Fix the following build failure with convolution raised since automake
+1.16.5 and
+https://git.savannah.gnu.org/cgit/automake.git/commit/?id=f4a3a70f69e1dbccb6578f39ef47835098a04624:
+
+configure.ac:305: error: AM_INIT_AUTOMAKE expanded multiple times
+/home/giuliobenetti/autobuild/run/instance-1/output-1/host/share/aclocal-1.16/init.m4:29: AM_INIT_AUTOMAKE is expanded from...
+configure.ac:6: the top level
+/home/giuliobenetti/autobuild/run/instance-1/output-1/host/share/aclocal-1.16/init.m4:29: AM_INIT_AUTOMAKE is expanded from...
+configure.ac:305: the top level
+
+Fixes:
+ - http://autobuild.buildroot.org/results/464148bdccb705d8992dc860262bfdeb01b7e2a1
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/mikebrady/shairport-sync/pull/1314]
+---
+ configure.ac | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index f77087c5..aa533a2d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -3,7 +3,7 @@
+ 
+ AC_PREREQ([2.50])
+ AC_INIT([shairport-sync], [3.3.8], [4265913+mikebrady@users.noreply.github.com])
+-AM_INIT_AUTOMAKE
++AM_INIT_AUTOMAKE([subdir-objects])
+ AC_CONFIG_SRCDIR([shairport.c])
+ AC_CONFIG_HEADERS([config.h])
+ AC_PROG_RANLIB
+@@ -302,7 +302,6 @@ AM_CONDITIONAL([USE_PA], [test "x$with_pa" = "xyes"])
+ # Look for Convolution flag
+ AC_ARG_WITH(convolution, [AS_HELP_STRING([--with-convolution],[choose audio DSP convolution support])])
+ if test "x$with_convolution" = "xyes" ; then
+-  AM_INIT_AUTOMAKE([subdir-objects])
+   AC_DEFINE([CONFIG_CONVOLUTION], 1, [Include audio DSP convolution support.])
+   AC_CHECK_LIB([sndfile], [sf_open], , AC_MSG_ERROR(Convolution support requires the sndfile library -- libsndfile1-dev suggested!))
+ fi
+-- 
+2.33.0
+
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

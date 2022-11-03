Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F8CC4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 16:35:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0069C404B9;
	Thu,  3 Nov 2022 16:35:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0069C404B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KLoEOaRPdhMd; Thu,  3 Nov 2022 16:35:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E412740297;
	Thu,  3 Nov 2022 16:35:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E412740297
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 13A551BF3ED
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 16:35:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2EF340297
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 16:35:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2EF340297
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YHfMCerBUjEH for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 16:35:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6EF9C40116
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6EF9C40116
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 16:35:16 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id g12so3567944wrs.10
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 09:35:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bntl6tAw5Chh3fdVGWeAYxOcH8oyCm56jva3md0dEDI=;
 b=BOvBkepeOro8uAMP0txzGZ0/vl8kBKbitRaS9cH/e2R7jdUBs1Bp2VfxSKoPU+EH2z
 wD4mqa19Zq4IpzJ5tJYJujxz2RQ6QCEXJdu76RRNtaYeEg2Flo3xC0XzlDs02NbQqqUJ
 K7BWbF6iOwIwhbEuemg+1Pf+kVdTGgkJZHeXKq2dg1uYuJudkqztxvyV1FF5ZvziFXt+
 eCZqI6/E4oX9Ds3WF1GVOTaRG7p6KceecFpb3KAt9IESsIdaJt+qcpVxSpTyI+L2/rq5
 DwOXc7Vmo7Y4hY5zyA9MgwiHxIElLN+AjCTDRiDRjTMYYtWB7NHsNNVt1BlxOWXq1UWR
 U4LA==
X-Gm-Message-State: ACrzQf35oBfKmuXhZOPWXaYw4+tGKaJ4a6e116M523KznOaTg9mZ7LVZ
 Q14eyGrFtMgzA5JTxu1ASRqiOUc5CoU=
X-Google-Smtp-Source: AMsMyM5auLV3DZ8Ppa8DfDCFycBTaCa3Amc+KuC9qioE+qZKp9bKOdnhd+8sUtL0+FkJBkd9QzdM2w==
X-Received: by 2002:a5d:51cb:0:b0:236:6a62:4bc8 with SMTP id
 n11-20020a5d51cb000000b002366a624bc8mr19465998wrv.583.1667493314167; 
 Thu, 03 Nov 2022 09:35:14 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 bg15-20020a05600c3c8f00b003cf894dbc4fsm444952wmb.25.2022.11.03.09.35.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 09:35:13 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 17:34:56 +0100
Message-Id: <20221103163456.1132806-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221103163456.1132806-1-fontaine.fabrice@gmail.com>
References: <20221103163456.1132806-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bntl6tAw5Chh3fdVGWeAYxOcH8oyCm56jva3md0dEDI=;
 b=qdrSfMsatxZ5Ftwjrf8Ho/50Td7yp1mhRqzs/dfiEdwytNzCHko2uTGHkRmFBJgcon
 0bp+3A/v0lOhLJRTamfOuHidPPOQZTHaSjBU12ho+dOB5ko4MQS8GJE/h0PCGCCMqK6G
 QQqL2ATylrDJR6gnnHr5krOQ5Pum8/tt3F9+R21D3FjWkaQ3H5Ae3qIsVRwX7+tiBNck
 ZwkND0SWpId1AHIYXn3ma3QwxYq3n3mXwNgUZPI6iI4kmp1E5qKts6bc0IC83oGLixtf
 Ib+KLehPa1BuuCHxUmBaI9OZDVF5szbhMQo+NMttrnXYjHC4q0Mzw0vW5TCsPMrPCDCW
 r4sw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=qdrSfMsa
Subject: [Buildroot] [PATCH 2/2] package/ipmitool: fix static build with
 readline
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
Cc: Floris Bos <bos@je-eigen-domein.nl>, Heiko Thiery <heiko.thiery@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following static build failure with readline raised since bump
to version 1.8.19 in commit 8317065ecb4979fe43c466f7e5a7f6dc281bd10d and
https://github.com/ipmitool/ipmitool/commit/63dd71c39c9bf522ad3a785dd001737a285458eb:

configure:15125: /tmp/instance-0/output-1/host/bin/armeb-buildroot-linux-musleabi-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O0 -g0  -static -Wall -Wextra -std=gnu11 -pedantic -Wformat -Wformat-nonliteral -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -static conftest.c -lreadline   -lcrypto >&5
/tmp/instance-0/output-1/host/lib/gcc/armeb-buildroot-linux-musleabi/11.3.0/../../../../armeb-buildroot-linux-musleabi/bin/ld: /tmp/instance-0/output-1/host/armeb-buildroot-linux-musleabi/sysroot/usr/lib/libreadline.a(display.o): in function `_rl_move_cursor_relative':
display.c:(.text+0x80fc): undefined reference to `tputs'

Fixes:
 - http://autobuild.buildroot.org/results/dabc6a4f49d464c129ac6bc3710011678142fcbe

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...nfigure.ac-fix-readline-static-build.patch | 49 +++++++++++++++++++
 package/ipmitool/ipmitool.mk                  |  2 +-
 2 files changed, 50 insertions(+), 1 deletion(-)
 create mode 100644 package/ipmitool/0001-configure.ac-fix-readline-static-build.patch

diff --git a/package/ipmitool/0001-configure.ac-fix-readline-static-build.patch b/package/ipmitool/0001-configure.ac-fix-readline-static-build.patch
new file mode 100644
index 0000000000..e3d4349502
--- /dev/null
+++ b/package/ipmitool/0001-configure.ac-fix-readline-static-build.patch
@@ -0,0 +1,49 @@
+From 9836e2211ba8b3035a1d390bbf6a0eebe4c2439d Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 3 Nov 2022 17:19:09 +0100
+Subject: [PATCH] configure.ac: fix readline static build
+
+Use pkg-config to retrieve readline dependencies such as ncurses to
+avoid the following static build when readline is built with ncurses
+support (which is raised since version 1.8.19 and
+https://github.com/ipmitool/ipmitool/commit/63dd71c39c9bf522ad3a785dd001737a285458eb):
+
+** Unable to build Solaris 9 x86 IPMI interface support!
+checking for library containing readline... no
+configure: error: ** Unable to find readline required by ipmishell.
+
+[...]
+
+configure:15125: /tmp/instance-0/output-1/host/bin/armeb-buildroot-linux-musleabi-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O0 -g0  -static -Wall -Wextra -std=gnu11 -pedantic -Wformat -Wformat-nonliteral -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -static conftest.c -lreadline   -lcrypto >&5
+/tmp/instance-0/output-1/host/lib/gcc/armeb-buildroot-linux-musleabi/11.3.0/../../../../armeb-buildroot-linux-musleabi/bin/ld: /tmp/instance-0/output-1/host/armeb-buildroot-linux-musleabi/sysroot/usr/lib/libreadline.a(display.o): in function `_rl_move_cursor_relative':
+display.c:(.text+0x80fc): undefined reference to `tputs'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/dabc6a4f49d464c129ac6bc3710011678142fcbe
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/ipmitool/ipmitool/pull/374]
+---
+ configure.ac | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index d6ba62b..4ee1be8 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -624,7 +624,11 @@ AC_ARG_ENABLE([ipmishell],
+ 
+ dnl check for readline library to enable ipmi shell
+ if test "x$xenable_ipmishell" = "xyes"; then
+-	AC_SEARCH_LIBS([readline], [readline edit], [have_readline=yes])
++	PKG_PROG_PKG_CONFIG
++	PKG_CHECK_MODULES([READLINE], [readline],
++		[LIBS="$LIBS $READLINE_LIBS" have_readline=yes],
++		[AC_SEARCH_LIBS([readline], [readline edit], [have_readline=yes])]
++	)
+ 	if test "x$have_readline" != "xyes"; then
+ 		AC_MSG_ERROR([** Unable to find readline required by ipmishell.])
+ 		xenable_ipmishell=no
+-- 
+2.35.1
+
diff --git a/package/ipmitool/ipmitool.mk b/package/ipmitool/ipmitool.mk
index 0b8befffcd..ebd8f9b337 100644
--- a/package/ipmitool/ipmitool.mk
+++ b/package/ipmitool/ipmitool.mk
@@ -34,7 +34,7 @@ IPMITOOL_CONF_OPTS += --disable-intf-usb
 endif
 
 ifeq ($(BR2_PACKAGE_IPMITOOL_IPMISHELL),y)
-IPMITOOL_DEPENDENCIES += readline
+IPMITOOL_DEPENDENCIES += host-pkgconf readline
 IPMITOOL_CONF_OPTS += --enable-ipmishell
 else
 IPMITOOL_CONF_OPTS += --disable-ipmishell
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

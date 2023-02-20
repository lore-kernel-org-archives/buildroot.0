Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DC41C05027
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 11:24:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 919CA60FD6;
	Mon, 20 Feb 2023 11:24:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 919CA60FD6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rkcNo7JIkoXM; Mon, 20 Feb 2023 11:24:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF42A60FC2;
	Mon, 20 Feb 2023 11:24:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF42A60FC2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 889811BF3BC
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 11:24:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 620CA81E94
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 11:24:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 620CA81E94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NLiznBm1yvpv for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 11:24:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57C8781E6E
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 57C8781E6E
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 11:24:15 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id p8so912824wrt.12
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 03:24:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VRJPclZis7dbRXI6h70RqepHQGGC2IziHls1q28pu04=;
 b=RKS7ecYK3NcDlWj8vaj+fi7UJk4gWfc+ybMYsv+mIdLRRyQwxqFTLrZu1UxhMqL49y
 +Q5+996BhpXyM9eee7wjbwcRCeT4tjojpOfX0EinH1KbJq+/rZbenzpnn0PT2Kd1Y9+r
 6sIEVrtfEISpzfdxpU3oMQ5hI0/tNUIoRKoA0F9TJeGbcKM1JCitZ/bk0fw7yJlbJTCQ
 Em2SEblMT+/IvKRlZXGiqRO5TApPTUI+f5lpUl8c/iwCYACfQsGKrItIfqfDfFnwpHtx
 P5SnXva5DGw3Ep9i6sTkPZPMUyLHSrkYnbNnwj/NGDFBcsSkFoUKK+Nwru6ACx2AKQsM
 XJoA==
X-Gm-Message-State: AO0yUKXiX3r+Le8hpyOmGnuV+u0wfRZcttuvYgSULIKQGj6i++o9rzgW
 Fuc30eHind5+M8up/st9K3L5OteETi4=
X-Google-Smtp-Source: AK7set/Td6azCwHZCeLdE4S79gNq8y997EXYF6VXNM1OG9bkeAhhz/T7jAFhE2wtn4Xt0S5goBxyOg==
X-Received: by 2002:a5d:440e:0:b0:2c5:4d68:5511 with SMTP id
 z14-20020a5d440e000000b002c54d685511mr1409509wrq.48.1676892253038; 
 Mon, 20 Feb 2023 03:24:13 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 f18-20020adffcd2000000b002c59e001631sm892983wrs.77.2023.02.20.03.24.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 03:24:12 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 20 Feb 2023 12:24:10 +0100
Message-Id: <20230220112410.953669-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VRJPclZis7dbRXI6h70RqepHQGGC2IziHls1q28pu04=;
 b=jIwruay3imyBjiYEA19a/VjVqU/4BYIkDxkyujP6hzGeMBBspoNW2uGB7beKldKcaV
 d0B5WjEcVcfWOgTgZJNR0J2qRn1SHMK8rSu7DCRq/6Jwi0roS4JVbMi/pjjfgh1UvBFI
 9G8kFi+JzjYlFs6yF1AlKJmTiy2d7fslV7xHolEUi8sMpzCvxqv4RRe7SLDcqLFL5H1O
 vztL2rM/u3ZOddJWZ2raHv7xMSv3EopUcwo9VrgaCBr/VDrdM2WhCe7pCP7PpdtnccYe
 5InVEZcPKrLYLq/nGEyD4JDAS7wVx6psHVoUQwy+ZipkAMHfwdCUQNoS8CHgPYQJmoWB
 fkag==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=jIwruay3
Subject: [Buildroot] [PATCH 1/1] package/glslsandbox-player: fix build with
 rockchip-mali
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
Cc: Julien Olivain <ju.o@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with rockchip-mali raised since commit
97c74a73e5dee17530647f89b2c7d8692781eb14:

checking for glesv2... no
configure: error: Package requirements (glesv2 >= 1) were not met:

Package dependency requirement 'glesv2 >= 1' could not be satisfied.
Package 'glesv2' has version '', required version is '>= 1'

Consider adjusting the PKG_CONFIG_PATH environment variable if you
installed software in a non-standard prefix.

Alternatively, you may set the environment variables glesv2_CFLAGS
and glesv2_LIBS to avoid the need to call pkg-config.
See the pkg-config man page for more details.

Fixes:
 - http://autobuild.buildroot.org/results/ac765b0ff5f914df4087ae4691fe711dc912f03b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...gure.ac-fix-build-with-rockchip-mali.patch | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 package/glslsandbox-player/0001-configure.ac-fix-build-with-rockchip-mali.patch

diff --git a/package/glslsandbox-player/0001-configure.ac-fix-build-with-rockchip-mali.patch b/package/glslsandbox-player/0001-configure.ac-fix-build-with-rockchip-mali.patch
new file mode 100644
index 0000000000..97bfe00401
--- /dev/null
+++ b/package/glslsandbox-player/0001-configure.ac-fix-build-with-rockchip-mali.patch
@@ -0,0 +1,46 @@
+From b811d408fe52fd5ee5a908eb16a2ff2b4217c235 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 20 Feb 2023 11:53:39 +0100
+Subject: [PATCH 1/1] configure.ac: fix build with rockchip-mali
+
+Don't check glesv2 version in glesv2.pc file to avoid the following
+build failure with rockchip-mali:
+
+checking for glesv2... no
+configure: error: Package requirements (glesv2 >= 1) were not met:
+
+Package dependency requirement 'glesv2 >= 1' could not be satisfied.
+Package 'glesv2' has version '', required version is '>= 1'
+
+Consider adjusting the PKG_CONFIG_PATH environment variable if you
+installed software in a non-standard prefix.
+
+Alternatively, you may set the environment variables glesv2_CFLAGS
+and glesv2_LIBS to avoid the need to call pkg-config.
+See the pkg-config man page for more details.
+
+Fixes:
+ - http://autobuild.buildroot.org/results/ac765b0ff5f914df4087ae4691fe711dc912f03b
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/jolivain/glslsandbox-player/pull/5]
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 1f45b1f..5cb2d4c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -84,7 +84,7 @@ AS_IF([test "x$enable_strict_gles" = "xyes"], [
+ ])
+ 
+ PKG_CHECK_MODULES([egl], [egl >= 1])
+-PKG_CHECK_MODULES([glesv2], [glesv2 >= 1])
++PKG_CHECK_MODULES([glesv2], [glesv2])
+ 
+ AC_CHECK_HEADERS([EGL/eglext.h], [], [],
+ [[#include <EGL/egl.h>
+-- 
+2.39.0
+
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

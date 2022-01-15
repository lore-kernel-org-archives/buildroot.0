Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 222FAC433EF
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 21:11:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B4418400A6;
	Sat, 15 Jan 2022 21:11:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7HYnd1RXKiGs; Sat, 15 Jan 2022 21:11:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9BFDF4012D;
	Sat, 15 Jan 2022 21:11:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8BD2F1BF393
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 21:11:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7050081CAD
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 21:11:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g2F907XJh9Yr for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 21:11:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 85B2B81C58
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 21:11:20 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id n137so10654117iod.4
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 13:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dfC4dM4YhGTUEbZxppw6+diu9il3JpuBMq5ZeXYWDps=;
 b=NVaiuSn2x9rq3ADb8OVQX/3SLRMp9iOAvPz6+LvkDQ4GsVlWyDM0o71DXucis4iik3
 kZcD7WoHwIqjKa1/RNPy9fR3H/u7ZtARHtOcLs/+01kCIjRcJmTUkx+uQ/vxQjZ+Ed1Y
 Bqce/KPODRy0idIfHhz1LlPNu+MtOBw+b9suR7Y8eG6RcoW1WG1uBtYQfnJMCP/sspfd
 0B6nKHZG4wHJrEqFaEl9pIj+E1OA4JSb2pT4bKWskdo56S9DrZISYmIrULf1U9U64w3S
 m4EQg0C9S42hX2C0m7/+MK4fUxOZBcrseaQcD8Gd0VASbUzqAWEyhWOqE4u4F+HhsRCj
 O3xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dfC4dM4YhGTUEbZxppw6+diu9il3JpuBMq5ZeXYWDps=;
 b=rtNomg92mnIuLYQOXtToWmy4lq0/sgWXeWSeoonPw30N4itYkNmpXBpP+HohNBGRg5
 RG6smwuNXVyaj4L7NlEiD5D7kWt4DEk/tyuIbdnU0C/ZbwON4oSKDDQOWPKB1mR6LkGa
 1FtIoW90Ox0+1ML5eKasIHW9DPkdVXlIPRjxRfEJ2R+ifyrvcA4DTLpkeXZUUj/+hM4K
 ufoH4s0E4sW0SawxXBqRFuRmeV1Uw2KWSPs8MMe2quUBRGbG+Tqk9n85hppXfGpkdduq
 XTTG95FV9jY6e/2+Sp6ee/KIG1AycCdBLL2TDq7B5kWEIHDYF2v5nPvyYBHRcDpmCIOg
 dZGg==
X-Gm-Message-State: AOAM5321xwJSyEQeso/Hm/4paPSlMLtAr9oepVRL0BQ/eQGTGEZhzLmQ
 HVUHF3myHZGx9dAcJFq+vVXop9lBxhY=
X-Google-Smtp-Source: ABdhPJzj8tla+L/5ptSYNoveEIZ/55cjo3RO1e7SlhCh9sKdHKTu6uI4CteToXGrhdWXDQ1VtLBo/g==
X-Received: by 2002:a5e:8608:: with SMTP id z8mr6595423ioj.58.1642281079288;
 Sat, 15 Jan 2022 13:11:19 -0800 (PST)
Received: from james-x399.localdomain (97-118-239-242.hlrn.qwest.net.
 [97.118.239.242])
 by smtp.gmail.com with ESMTPSA id i23sm6134452ila.85.2022.01.15.13.11.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Jan 2022 13:11:18 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 15 Jan 2022 14:11:12 -0700
Message-Id: <20220115211112.3224696-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/1] package/qt5/qt5base: disable broken
 qmake sysrootify
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently the qmake gcc sysrootify path logic causes issues with
per-package directories, disable automatic gcc sysroot for qt5base
install and override all qt.conf paths manually to point to their
correct locations.

Redirect HostData to STAGING_DIR as mkspecs need to be available there
instead of the HOST_DIR for cross compilation to work.

This fixes some build errors with per-package directories such as:
/home/buildroot/buildroot/output/per-package/qt5base/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-buildroot-linux-gnu/10.3.0/../../../../aarch64-buildroot-linux-gnu/bin/ld:
cannot find /lib64/libc.so.6
/home/buildroot/buildroot/output/per-package/qt5base/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-buildroot-linux-gnu/10.3.0/../../../../aarch64-buildroot-linux-gnu/bin/ld:
cannot find /usr/lib64/libc_nonshared.a
/home/buildroot/buildroot/output/per-package/qt5base/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-buildroot-linux-gnu/10.3.0/../../../../aarch64-buildroot-linux-gnu/bin/ld:
cannot find /lib/ld-linux-aarch64.so.1
collect2: error: ld returned 1 exit status
make[4]: *** [Makefile:122: ../../lib/libQt5Svg.so.5.15.2] Error 1
make[3]: *** [Makefile:48: sub-svg-make_first-ordered] Error 2
make[2]: *** [Makefile:49: sub-src-make_first] Error 2
make[1]: *** [package/pkg-generic.mk:295:
/home/buildroot/buildroot/output/build/qt5svg-5.15.2/.stamp_built]
Error 2

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - add some missing overrides to qt.conf.in
---
 package/qt5/qt5base/qt.conf.in | 21 ++++++++++++++++++---
 package/qt5/qt5base/qt5base.mk |  2 ++
 2 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/package/qt5/qt5base/qt.conf.in b/package/qt5/qt5base/qt.conf.in
index 2215cbd4e1..c92f52ced0 100644
--- a/package/qt5/qt5base/qt.conf.in
+++ b/package/qt5/qt5base/qt.conf.in
@@ -2,6 +2,21 @@
 Prefix=/usr
 HostPrefix=@@HOST_DIR@@
 Sysroot=@@STAGING_DIR@@
-Headers=/usr/include/qt5
-Plugins=/usr/lib/qt/plugins
-Examples=/usr/lib/qt/examples
+SysrootifyPrefix=false
+Binaries=@@STAGING_DIR@@/usr/bin
+Libraries=@@STAGING_DIR@@/usr/lib
+Headers=@@STAGING_DIR@@/usr/include/qt5
+Plugins=@@STAGING_DIR@@/usr/lib/qt/plugins
+Examples=@@STAGING_DIR@@/usr/lib/qt/examples
+Tests=@@STAGING_DIR@@/usr/lib/qt/tests
+Data=@@STAGING_DIR@@
+Translations=@@STAGING_DIR@@/translations
+Documentation=@@STAGING_DIR@@/doc
+ArchData=@@STAGING_DIR@@/usr
+LibraryExecutables=@@STAGING_DIR@@/usr/libexec
+Imports=@@STAGING_DIR@@/usr/imports
+Qml2Imports=@@STAGING_DIR@@/usr/qml
+Settings=@@STAGING_DIR@@/etc
+HostBinaries=@@HOST_DIR@@/bin
+HostLibraries=@@HOST_DIR@@/lib
+HostData=@@STAGING_DIR@@
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index bcdf036f00..6c05e710d8 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -311,8 +311,10 @@ define QT5BASE_CONFIGURE_CMDS
 		-v \
 		-prefix /usr \
 		-hostprefix $(HOST_DIR) \
+		-hostdatadir $(STAGING_DIR) \
 		-headerdir /usr/include/qt5 \
 		-sysroot $(STAGING_DIR) \
+		-no-gcc-sysroot \
 		-plugindir /usr/lib/qt/plugins \
 		-examplesdir /usr/lib/qt/examples \
 		-no-rpath \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

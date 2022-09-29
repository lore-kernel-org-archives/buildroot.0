Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E8E6C433FE
	for <buildroot@archiver.kernel.org>; Thu, 29 Sep 2022 18:14:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B89F56118D;
	Thu, 29 Sep 2022 18:14:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B89F56118D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lo6fJwg7c6iZ; Thu, 29 Sep 2022 18:14:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE30E60BEE;
	Thu, 29 Sep 2022 18:14:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE30E60BEE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1A6071BF3F3
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 18:14:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E9F0183F28
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 18:14:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9F0183F28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w1KadkaIexIM for <buildroot@lists.busybox.net>;
 Thu, 29 Sep 2022 18:14:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB3B483F1A
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
 [208.88.110.44])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AB3B483F1A
 for <buildroot@buildroot.org>; Thu, 29 Sep 2022 18:14:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.savoirfairelinux.com (Postfix) with ESMTP id DD6519C0BD3;
 Thu, 29 Sep 2022 14:14:08 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id d920ujUAbqFl; Thu, 29 Sep 2022 14:14:08 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.savoirfairelinux.com (Postfix) with ESMTP id 42B999C0BD4;
 Thu, 29 Sep 2022 14:14:08 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 42B999C0BD4
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id g-jfc1XLYOjl; Thu, 29 Sep 2022 14:14:08 -0400 (EDT)
Received: from j1-slave-ryzen-3900-indu.mtl.sfl (unknown [192.168.51.254])
 by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 24D599C0BD3;
 Thu, 29 Sep 2022 14:14:08 -0400 (EDT)
From: Thomas Ballasi <thomas.ballasi@savoirfairelinux.com>
To: buildroot@buildroot.org
Date: Thu, 29 Sep 2022 14:13:50 -0400
Message-Id: <20220929181350.1026033-1-thomas.ballasi@savoirfairelinux.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220922214512.2098221-1-thomas.ballasi@savoirfairelinux.com>
References: <20220922214512.2098221-1-thomas.ballasi@savoirfairelinux.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
 t=1664475248; bh=Z5R5V5QtNK6sviOlfLZkbcEDRPadonWfXrOdDQtXdkU=;
 h=From:To:Date:Message-Id:MIME-Version;
 b=MPoTWfxZF0+JB4Sql7jh4pEYH7f3ZqByhCd9Mjc+w1z7SMKEmXJf/lYd7GT8EJvNQ
 InfAB2bNtlKOeOOnQvMW3ySRL+2dUVsUZqM3mV2jnHTY4X6+ou7SYKIHPbLyTLM++G
 OH8LA3fNEj8hkntfXrPqmZsNBGU07vm+k57JVdlTuZmlFNacx4Y7aWOhUK0r+TSmv4
 FnJ8FyxvA1bHaV4ghstSsdNoG3hDWR1/Vs2TDUuue6XWLt6irFwYlKtkJ8HVlpYP13
 LmzIsa0crXNeWmb/Q4YfTxWZwfrKfRVVWgHd3iBPUcPRCkw+UBTr1Z2HBTFyDkyUN/
 VczJ40yJapBrQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=savoirfairelinux.com
 header.i=@savoirfairelinux.com header.a=rsa-sha256
 header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=MPoTWfxZ
Subject: [Buildroot] [PATCH v2] package/qt5/qt5webkit: fix generated
 artifacts
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
Cc: Peter Seiderer <ps.report@gmx.net>,
 Thomas Ballasi <thomas.ballasi@savoirfairelinux.com>,
 Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Generated artifacts of the installation process were wrongly located,
causing packages using qt5webkit (qt-webkit-kiosk and python-pyqt5) to
fail at build time.

Firstly, *.h files are wrongly located a directory below where supposed
(inside qt5/ directory). This is caused by using DATADIR which assumed
include files were to be located in sysroot/usr/include/. Disabling this
variable by removing it from build options leads to a correct behavior.

Secondly, in order to locate *.pri artifacts correctly, we set the conf
option CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT on, which in turn
sets the variable KDE_INSTALL_USE_QT_SYS_PATHS on, for the following
reasons:

1. *.pri files are wrongly located in the host's and target's sysroot
   directores while buildroot implements its own mkspecs directory.
   By setting KDE_INSTALL_USE_QT_SYS_PATHS on, mkspecs modules are now
   being installed in host's data dir (ECM_MKSPECS_INSTALL_DIR is set
   accordingly @ line 102 in Source/cmake/ECMGeneratePriFile.cmake).
   This also required to prevent using the CMake package's default
   DATADIR variable, as done previously, as it enforced to install
   artifacts under the sysroot directory.

2. *.pri files' content have hardcoded include and library paths. This
   has been corrected by setting on KDE_INSTALL_USE_QT_SYS_PATHS as
   their content is written according to this value (see line 514 and
   739 in file Source/WebKit/PlatformQt.cmake).

Regression happened when qt5webkit started using cmake-package at commit
df0b0fe6919c0d0f3750f439a3cfa765232bd569.

Fixes:
https://bugs.buildroot.org/show_bug.cgi?id=14606

Signed-off-by: Thomas Ballasi <thomas.ballasi@savoirfairelinux.com>
---
 package/qt5/qt5webkit/qt5webkit.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
index 6912359674..8310ef20c8 100644
--- a/package/qt5/qt5webkit/qt5webkit.mk
+++ b/package/qt5/qt5webkit/qt5webkit.mk
@@ -51,10 +51,18 @@ QT5WEBKIT_CONF_OPTS += -DENABLE_SAMPLING_PROFILER=OFF
 endif
 
 QT5WEBKIT_CONF_OPTS += \
+	-DCMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT=ON \
 	-DENABLE_TOOLS=OFF \
 	-DPORT=Qt \
 	-DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python3 \
 	-DSHARED_CORE=ON \
 	-DUSE_LIBHYPHEN=OFF
 
+QT5WEBKIT_INSTALL_STAGING_OPTS = install/fast
+
+define QT5WEBKIT_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --install $(QT5WEBKIT_BUILDDIR) \
+		--prefix $(TARGET_DIR)/usr
+endef
+
 $(eval $(cmake-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

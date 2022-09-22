Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AAB9ECAAD8
	for <buildroot@archiver.kernel.org>; Thu, 22 Sep 2022 21:45:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84539415DB;
	Thu, 22 Sep 2022 21:45:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84539415DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iT0Yzdx-gjBg; Thu, 22 Sep 2022 21:45:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C70D415AB;
	Thu, 22 Sep 2022 21:45:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C70D415AB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 88AB81BF2A9
 for <buildroot@lists.busybox.net>; Thu, 22 Sep 2022 21:45:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6122F40250
 for <buildroot@lists.busybox.net>; Thu, 22 Sep 2022 21:45:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6122F40250
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OWu3vQS200pf for <buildroot@lists.busybox.net>;
 Thu, 22 Sep 2022 21:45:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B69840183
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
 [208.88.110.44])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1B69840183
 for <buildroot@buildroot.org>; Thu, 22 Sep 2022 21:45:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.savoirfairelinux.com (Postfix) with ESMTP id A3D939C0BC0;
 Thu, 22 Sep 2022 17:45:24 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id LweMM1kX--H4; Thu, 22 Sep 2022 17:45:24 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.savoirfairelinux.com (Postfix) with ESMTP id EC2DA9C0BC2;
 Thu, 22 Sep 2022 17:45:23 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com EC2DA9C0BC2
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id xtcPi32DdOzu; Thu, 22 Sep 2022 17:45:23 -0400 (EDT)
Received: from j1-slave-ryzen-3900-indu.mtl.sfl (unknown [192.168.51.81])
 by mail.savoirfairelinux.com (Postfix) with ESMTPSA id C7DF69C0BC0;
 Thu, 22 Sep 2022 17:45:23 -0400 (EDT)
From: Thomas Ballasi <thomas.ballasi@savoirfairelinux.com>
To: buildroot@buildroot.org
Date: Thu, 22 Sep 2022 17:45:12 -0400
Message-Id: <20220922214512.2098221-1-thomas.ballasi@savoirfairelinux.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
 t=1663883124; bh=Oyyda8ahldHcN9ayi8XEZxDrxW4Rp/8pXhGbDinScOk=;
 h=From:To:Date:Message-Id:MIME-Version;
 b=wazbcj44PpeZwnH21mHI8D9TXf7NqC5a2Eik5BeiigDn/7YDHfvPlmfcW/i6Pwl1O
 7P2NkPY+7e3OiefWocorBSCly/zeSrhM/3bRazJLPZjgv+yYFC+kNybZnj/Cmlvvzr
 V4fDgNzxQA68gXseZzOO9N0cgt93qGR74T2iRMLoZSg8G6AxZR3togiFy8KdsRzmaV
 tHDM+Cv8mVdpDHLMtSMNn6VK2sC79EB0oNLptuQxJnS+QtqrBPIZwFSaImP8dHOKla
 SnhuhclhM/t9KHiJ34ZDEwrlgHTxIcrtxKeU1S98kGJw0lcsO4EdzILDMa87c78Tq5
 LxjV1CMv6tMHA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=savoirfairelinux.com
 header.i=@savoirfairelinux.com header.a=rsa-sha256
 header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=wazbcj44
Subject: [Buildroot] [PATCH] package/qt5/qt5webkit: fix generated artifacts
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
fail at build time. The changes aims at fixing this issue.

There were three main issues occuring during the build:

1. *.pri files were wrongly located in the host's and target's sysroot
   directores while buildroot implements its own mkspecs directory.
   By setting KDE_INSTALL_USE_QT_SYS_PATHS on, mkspecs modules are now
   being installed in host's data dir (ECM_MKSPECS_INSTALL_DIR is set
   accordingly @ line 102 in Source/cmake/ECMGeneratePriFile.cmake).
   This also required to prevent using the CMake package's default
   DATADIR variable as it enforces to install under the sysroot
   directory.

2. *.pri files' content had hardcoded include and library paths which
   has been corrected by setting on KDE_INSTALL_USE_QT_SYS_PATHS as
   their content is written according to this value (see line 514 and
   739 in file Source/WebKit/PlatformQt.cmake).

3. *.h files were located a directory below where supposed (inside qt5/
   directory). This was caused by using DATADIR which assumed include
   files were to be located in sysroot/usr/include/.
   Disabling this variable by removing it from build options leads to a
   correct behavior.

Regression happened when qt5webkit started using cmake-package at commit
df0b0fe6919c0d0f3750f439a3cfa765232bd569.

More info @ https://bugs.buildroot.org/show_bug.cgi?id=14606

Signed-off-by: Thomas Ballasi <thomas.ballasi@savoirfairelinux.com>
---
 ...-set-KDE_INSTALL_USE_QT_SYS_PATHS-on.patch | 42 +++++++++++++++++++
 package/qt5/qt5webkit/qt5webkit.mk            |  7 ++++
 2 files changed, 49 insertions(+)
 create mode 100644 package/qt5/qt5webkit/0007-cmake-set-KDE_INSTALL_USE_QT_SYS_PATHS-on.patch

diff --git a/package/qt5/qt5webkit/0007-cmake-set-KDE_INSTALL_USE_QT_SYS_PATHS-on.patch b/package/qt5/qt5webkit/0007-cmake-set-KDE_INSTALL_USE_QT_SYS_PATHS-on.patch
new file mode 100644
index 0000000000..b65eb305b4
--- /dev/null
+++ b/package/qt5/qt5webkit/0007-cmake-set-KDE_INSTALL_USE_QT_SYS_PATHS-on.patch
@@ -0,0 +1,42 @@
+From f4950219005b487c18d41ce4e6bc11c4b0e3a20d Mon Sep 17 00:00:00 2001
+From: Thomas Ballasi <thomas.ballasi@savoirfairelinux.com>
+Date: Wed, 21 Sep 2022 14:46:40 -0400
+Subject: [PATCH] cmake: set KDE_INSTALL_USE_QT_SYS_PATHS on
+
+This variable is used to save .pri files to directories relative to the
+host (output/host/mkspecs/modules/) rather than relative to the target
+itself, which is unwanted behavior.
+
+The changes also enables .pri files not to hardcode include and library
+paths and to use $$QT_MODULE_INCLUDE_BASE and $$QT_MODULE_LIB_BASE.
+
+Signed-off-by: Thomas Ballasi <thomas.ballasi@savoirfairelinux.com>
+---
+ Source/cmake/OptionsQt.cmake | 8 +-------
+ 1 file changed, 1 insertion(+), 7 deletions(-)
+
+diff --git a/Source/cmake/OptionsQt.cmake b/Source/cmake/OptionsQt.cmake
+index 1ee60b777106..607c69bd38fe 100644
+--- a/Source/cmake/OptionsQt.cmake
++++ b/Source/cmake/OptionsQt.cmake
+@@ -998,16 +998,10 @@ feature_summary(WHAT ALL FATAL_ON_MISSING_REQUIRED_PACKAGES)
+ include(ECMQueryQmake)
+ 
+ query_qmake(qt_install_prefix_dir QT_INSTALL_PREFIX)
+-if (CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
+-    set(CMAKE_INSTALL_PREFIX "${qt_install_prefix_dir}" CACHE PATH "Install path prefix, prepended onto install directories." FORCE)
+-endif ()
++set(CMAKE_INSTALL_PREFIX "${qt_install_prefix_dir}")
+ 
+ include(KDEInstallDirs)
+ 
+-if (NOT qt_install_prefix_dir STREQUAL "${CMAKE_INSTALL_PREFIX}")
+-    set(KDE_INSTALL_USE_QT_SYS_PATHS OFF)
+-endif ()
+-
+ # We split all installed files into 2 components: Code and Data. This is different from
+ # traditional approach with Runtime and Devel, but we need it to fix concurrent installation of
+ # debug and release builds in qmake-based build
+-- 
+2.25.1
+
diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
index 6912359674..607c022568 100644
--- a/package/qt5/qt5webkit/qt5webkit.mk
+++ b/package/qt5/qt5webkit/qt5webkit.mk
@@ -57,4 +57,11 @@ QT5WEBKIT_CONF_OPTS += \
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

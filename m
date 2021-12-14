Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECB17C433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Dec 2021 07:51:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6461B60A91;
	Tue, 14 Dec 2021 07:51:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LDAIUy0ccC1t; Tue, 14 Dec 2021 07:51:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9547860A46;
	Tue, 14 Dec 2021 07:51:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4D7391BF2C1
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 07:51:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 362C081349
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 07:51:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zUDF048WKx6W for <buildroot@lists.busybox.net>;
 Tue, 14 Dec 2021 07:51:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5.ex10.biz (smtp5.ex10.biz [178.170.74.94])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 23C4080BDC
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 07:51:50 +0000 (UTC)
Received: from [185.183.66.253] (port=2128 helo=UC681.Mediane.local)
 by smtp5.ex10.biz with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <florent.aumaitre@medianesysteme.com>)
 id 1mx2bB-0006eV-1t; Tue, 14 Dec 2021 08:51:45 +0100
X-SASI-Hits: BODY_SIZE_3000_3999 0.000000, BODY_SIZE_5000_LESS 0.000000,
 BODY_SIZE_7000_LESS 0.000000, HTML_00_01 0.050000, HTML_00_10 0.050000,
 LEGITIMATE_SIGNS 0.000000, MULTIPLE_RCPTS 0.100000,
 MULTIPLE_REAL_RCPTS 0.000000, NO_CTA_URI_FOUND 0.000000,
 NO_FUR_HEADER 0.000000, NO_URI_HTTPS 0.000000, OUTBOUND 0.000000,
 OUTBOUND_SOPHOS 0.000000, SENDER_NO_AUTH 0.000000, __ANY_URI 0.000000,
 __BODY_NO_MAILTO 0.000000, __CC_NAME 0.000000,
 __CC_NAME_DIFF_FROM_ACC 0.000000, __CC_REAL_NAMES 0.000000,
 __COURIER_PHRASE 0.000000, __DQ_NEG_HEUR 0.000000, __DQ_NEG_IP 0.000000,
 __FRAUD_MONEY_CURRENCY 0.000000, __FRAUD_MONEY_CURRENCY_DOLLAR 0.000000,
 __FROM_DOMAIN_IN_ANY_CC1 0.000000, __FROM_DOMAIN_IN_RCPT 0.000000,
 __FUR_RDNS_SOPHOS 0.000000, __HAS_CC_HDR 0.000000, __HAS_FROM 0.000000,
 __HAS_MSGID 0.000000, __HAS_X_MAILER 0.000000, __LINES_OF_YELLING 0.000000,
 __MIME_TEXT_ONLY 0.000000, __MIME_TEXT_P 0.000000, __MIME_TEXT_P1 0.000000,
 __MULTIPLE_RCPTS_CC_X2 0.000000, __NO_HTML_TAG_RAW 0.000000,
 __OUTBOUND_SOPHOS_FUR 0.000000, __OUTBOUND_SOPHOS_FUR_IP 0.000000,
 __OUTBOUND_SOPHOS_FUR_RDNS 0.000000, __SANE_MSGID 0.000000,
 __SUBJ_STARTS_S_BRACKETS 0.000000, __TO_MALFORMED_2 0.000000,
 __TO_NO_NAME 0.000000, __URI_MAILTO 0.000000, __URI_NO_WWW 0.000000,
 __URI_NS 0.000000
X-SASI-Probability: 8%
X-SASI-RCODE: 200
X-SASI-Version: Antispam-Engine: 4.1.4, AntispamData: 2021.12.14.71816
From: Florent AUMAITRE <florent.aumaitre@medianesysteme.com>
To: buildroot@buildroot.org
Date: Tue, 14 Dec 2021 08:51:33 +0100
Message-Id: <20211214075133.4482-1-florent.aumaitre@medianesysteme.com>
X-Mailer: git-send-email 2.17.1
Subject: [Buildroot] [PATCH 1/1] package/qt5: fix parallel build qmake
 package (qt5) doesn't build when using parallel build.
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
Cc: Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>,
 Naumann Andreas <ANaumann@ultratronik.de>,
 Florent AUMAITRE <florent.aumaitre@medianesysteme.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Florent AUMAITRE <florent.aumaitre@medianesysteme.com>
---
 package/pkg-qmake.mk           | 22 +++++++++++++++++++++-
 package/qt5/qt5.mk             |  4 +++-
 package/qt5/qt5base/qt5base.mk | 13 +++++++++++++
 3 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/package/pkg-qmake.mk b/package/pkg-qmake.mk
index deb033c1d6..55b3594f32 100644
--- a/package/pkg-qmake.mk
+++ b/package/pkg-qmake.mk
@@ -20,6 +20,23 @@
 #
 ################################################################################
 
+# When per-package is enabled, and qmake project is configured to generate 
+# pkg-config compatible package, absolute path are generated for "prefix" field 
+# of .pc files. In order to keep per-package isolation with sysroot'in, it is 
+# needed to remove those absolute path. Same apply for mkspecs files.
+ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
+define PKG_QMAKE_FIXUP_ABSOLUTE_PATH
+	$(Q)find $(STAGING_DIR)/ -name "*.pc" \
+	| xargs --no-run-if-empty \
+	$(SED) "s:$(STAGING_DIR)::g"
+
+	$(Q)find $(HOST_DIR)/ -name "*.pri" \
+		| xargs --no-run-if-empty \
+		$(SED) "s:$(STAGING_DIR):\$$\$$\[QT_SYSROOT\]:g"
+endef
+endif
+
+
 #
 # Hook to sync Qt headers
 #
@@ -89,6 +106,8 @@ define $(2)_INSTALL_STAGING_CMDS
 endef
 endif
 
+$(2)_POST_INSTALL_STAGING_HOOKS += PKG_QMAKE_FIXUP_ABSOLUTE_PATH
+
 #
 # Target installation step. Only define it if not already defined by
 # the package .mk file.
@@ -103,9 +122,10 @@ endif
 # We subsequently rsync only the files from the temporary staging dir and that
 # way exclude files for the build host from target.
 #
+# Qt Package (declarative at least) does not install in parallel due to improper make rules
 ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
-	$$(TARGET_MAKE_ENV) $$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_BUILDDIR) INSTALL_ROOT=$$($(2)_BUILDDIR)tmp-target-install $$($(2)_INSTALL_TARGET_OPTS)
+	$$(TARGET_MAKE_ENV) $$($(2)_MAKE_ENV) $$(MAKE1) -C $$($(2)_BUILDDIR) INSTALL_ROOT=$$($(2)_BUILDDIR)tmp-target-install $$($(2)_INSTALL_TARGET_OPTS)
 	rsync -arv $$($(2)_BUILDDIR)tmp-target-install$$(STAGING_DIR)/ $$(TARGET_DIR)/
 endef
 endif
diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index 3ffb7b0063..eced7e2564 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -27,4 +27,6 @@ endef
 endif
 
 # Variable for other Qt applications to use
-QT5_QMAKE = $(HOST_DIR)/bin/qmake -spec devices/linux-buildroot-g++
+QT5_QMAKE = $(HOST_DIR)/bin/qmake -spec devices/linux-buildroot-g++ \
+	PKG_CONFIG_SYSROOT_DIR=$(STAGING_DIR) \
+	PKG_CONFIG_LIBDIR=$(STAGING_DIR)/usr/lib/pkgconfig:$(STAGING_DIR)/usr/share/pkgconfig
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index ba2971dc08..3750d4547e 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -334,4 +334,17 @@ endef
 
 QT5BASE_POST_INSTALL_STAGING_HOOKS += QT5_INSTALL_QT_CONF
 
+# CMake config files generated by Qt5 might break per-package isolation because
+# of absolute path generated.
+ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
+define QT5BASE_CMAKECONFIG_FIXUP
+	$(Q)find $(STAGING_DIR)/ -name "*.cmake" \
+		| xargs --no-run-if-empty \
+		$(SED) "s:$(STAGING_DIR)::g"
+endef
+endif
+
+QT5BASE_POST_INSTALL_STAGING_HOOKS += QT5BASE_CMAKECONFIG_FIXUP
+
+
 $(eval $(qmake-package))
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

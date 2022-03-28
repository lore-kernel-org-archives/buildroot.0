Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88ED9C433F5
	for <buildroot@archiver.kernel.org>; Mon, 28 Mar 2022 11:21:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C01D83E4A;
	Mon, 28 Mar 2022 11:21:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L2H2guu5D3Gz; Mon, 28 Mar 2022 11:21:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5446383E23;
	Mon, 28 Mar 2022 11:21:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 86EE61BF39C
 for <buildroot@lists.busybox.net>; Mon, 28 Mar 2022 11:21:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8415140286
 for <buildroot@lists.busybox.net>; Mon, 28 Mar 2022 11:21:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iqf4yatPzRuM for <buildroot@lists.busybox.net>;
 Mon, 28 Mar 2022 11:21:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9307840259
 for <buildroot@buildroot.org>; Mon, 28 Mar 2022 11:21:34 +0000 (UTC)
Received: from relay10.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::230])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id DF2A9CC2AB
 for <buildroot@buildroot.org>; Mon, 28 Mar 2022 11:14:34 +0000 (UTC)
Received: (Authenticated sender: foss@0leil.net)
 by mail.gandi.net (Postfix) with ESMTPSA id C7172240003;
 Mon, 28 Mar 2022 11:14:25 +0000 (UTC)
From: Quentin Schulz <foss+buildroot@0leil.net>
To: buildroot@buildroot.org
Date: Mon, 28 Mar 2022 13:14:12 +0200
Message-Id: <20220328111413.1618964-1-foss+buildroot@0leil.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/qt5base: fix race with libxkbcommon
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
Cc: Joshua Henderson <joshua.henderson@microchip.com>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>,
 Quentin Schulz <foss+buildroot@0leil.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

qt5wayland package currently has a bug if the xkbcommon Qt config is not
enabled which highlighted a race issues between qt5base, libxkbcommon
and qt5wayland.

qt5wayland has a dependency on libxkbcommon package if it's enabled.
qt5base only has a dependency on libxkbcommon if xcb support is to be
enabled.

If libxkbcommon package is built before qt5base, qt5base will detect it
during its configure step and enable the Qt config accordingly. This
will make it available to qt5wayland afterwards, even if xcb support is
not enabled in Buildroot Kconfig.

However, if qt5base is built before libxkbcommon is, qt5base will not
advertise support of xbcommon feature to qt5wayland (which will fail its
build because of a bug in the source code).

Since the package build order should not impact the outcome of the
build, let's explicit the dependency if and only if libxkbcommon package
is to be compiled at some point in time so that at least this feature is
not susceptible to races.

Cc: Quentin Schulz <foss+buildroot@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 package/qt5/qt5base/qt5base.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 4418f0d3ba..891635ad35 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -168,6 +168,11 @@ QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_LINUXFB),--enable-linuxfb,-
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_DIRECTFB),-directfb,-no-directfb)
 QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_DIRECTFB),directfb)
 
+ifeq ($(BR2_PACKAGE_LIBXKBCOMMON),y)
+QT5BASE_CONFIGURE_OPTS += -xkbcommon
+QT5BASE_DEPENDENCIES   += libxkbcommon
+endif
+
 ifeq ($(BR2_PACKAGE_QT5BASE_XCB),y)
 QT5BASE_CONFIGURE_OPTS += -xcb
 QT5BASE_CONFIGURE_OPTS += -xkbcommon
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

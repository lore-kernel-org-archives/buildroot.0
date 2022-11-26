Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A56C4332F
	for <buildroot@archiver.kernel.org>; Sat, 26 Nov 2022 18:31:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9717B60E38;
	Sat, 26 Nov 2022 18:31:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9717B60E38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XRMIWoePVL7T; Sat, 26 Nov 2022 18:31:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D88F660E41;
	Sat, 26 Nov 2022 18:31:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D88F660E41
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6265F1BF372
 for <buildroot@lists.busybox.net>; Sat, 26 Nov 2022 18:30:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D9E760E38
 for <buildroot@lists.busybox.net>; Sat, 26 Nov 2022 18:30:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D9E760E38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y9EcM6XFf1RQ for <buildroot@lists.busybox.net>;
 Sat, 26 Nov 2022 18:30:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D1C560E3D
 for <buildroot@buildroot.org>; Sat, 26 Nov 2022 18:30:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D1C560E3D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5D39984706; Sat, 26 Nov 2022 18:30:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 26 Nov 2022 19:25:44 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 4f0351fcca663a0b89e5df0ae488e0a2d795f38f
X-Git-Newrev: e9c76311514977aace7e48b176531443ac129f8e
X-Patchwork-Hint: ignore
Message-Id: <20221126183007.5D39984706@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/iwd: add dbus
 compile time dependency
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e9c76311514977aace7e48b176531443ac129f8e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

In 5b3b2d80f4cf586d360ff696c3dacbd4cb48fdc4 we dropped dbus as a build
dependency, however we still need it when building with systemd so
that the service directory is available via pkg-config.

In addition we can drop --with-dbus-datadir by unconditionally
requiring dbus as the datadir will then be fetched from pkg-config.

Fixes:
checking D-Bus bus services directory... configure: error: D-Bus bus services directory is required

  http://autobuild.buildroot.net/results/4a48676460e6ce588897598f0022ec840b4b4b8d/

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 47659b4f342382c764076c0c0dfbee446b090661)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iwd/iwd.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index 5bea3f12b4..c8b666bdd7 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -16,9 +16,8 @@ IWD_SELINUX_MODULES = networkmanager
 IWD_CONF_OPTS = \
 	--disable-manual-pages \
 	--enable-external-ell \
-	--enable-dbus-policy \
-	--with-dbus-datadir=/usr/share
-IWD_DEPENDENCIES = ell
+	--enable-dbus-policy
+IWD_DEPENDENCIES = dbus ell
 
 ifeq ($(BR2_PACKAGE_READLINE),y)
 # iwd client depends on readline (GPL-3.0+)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

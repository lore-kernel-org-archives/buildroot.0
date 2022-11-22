Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C267C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:32:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5B39475AA;
	Mon, 20 Feb 2023 21:32:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5B39475AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NRuFP35gQ1oJ; Mon, 20 Feb 2023 21:32:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0F9347D46;
	Mon, 20 Feb 2023 21:32:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0F9347D46
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 24C331BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E5BB5610DB
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5BB5610DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lgx-UeQ61OCP for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B8DB610D3
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B8DB610D3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 86444828C8; Mon, 20 Feb 2023 20:51:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Nov 2022 22:34:22 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 79591b76674a8c0ed150021a27771a73a70d159b
X-Git-Newrev: 47659b4f342382c764076c0c0dfbee446b090661
X-Patchwork-Hint: ignore
Message-Id: <20230220205152.86444828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/iwd: add dbus compile
 time dependency
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=47659b4f342382c764076c0c0dfbee446b090661
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
---
 package/iwd/iwd.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index 002988cf33..5ffbde334e 100644
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

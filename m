Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A17C25B78
	for <buildroot@archiver.kernel.org>; Mon, 27 May 2024 14:44:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C84E6063D;
	Mon, 27 May 2024 14:44:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pShOBboCSve6; Mon, 27 May 2024 14:44:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88942608B7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88942608B7;
	Mon, 27 May 2024 14:44:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7FD7C1D1DF6
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 14:44:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 79F3080F24
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 14:44:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XAWeRy1AAbsn for <buildroot@lists.busybox.net>;
 Mon, 27 May 2024 14:44:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8EF2D80F03
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8EF2D80F03
 for <buildroot@buildroot.org>; Mon, 27 May 2024 14:44:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6C7FC876CE; Mon, 27 May 2024 14:44:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 27 May 2024 16:41:21 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 41ef581ac5681396ac19372ecdf4c53d58bc28be
X-Git-Newrev: 7246f1951665e9c15f38f0b0fa21a2b1473cca33
X-Patchwork-Hint: ignore
Message-Id: <20240527144424.6C7FC876CE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/openocd: fix
 build with libgpiod2
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

commit: https://git.buildroot.net/buildroot/commit/?id=7246f1951665e9c15f38f0b0fa21a2b1473cca33
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

openocd is not compatible with libgpiod2 resulting in the following
build failure since the addition of libgpiod2 in commit
57391fad2e619395340b81957ddceab1b1df2e20:

src/jtag/drivers/linuxgpiod.c: In function 'helper_get_line':
src/jtag/drivers/linuxgpiod.c:283:19: error: 'GPIOD_LINE_REQUEST_DIRECTION_INPUT' undeclared (first use in this function); did you mean 'GPIOD_LINE_DIRECTION_INPUT'?
  283 |         int dir = GPIOD_LINE_REQUEST_DIRECTION_INPUT, flags = 0, val = 0, retval;
      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                   GPIOD_LINE_DIRECTION_INPUT

Fixes: 57391fad2e619395340b81957ddceab1b1df2e20
 - http://autobuild.buildroot.org/results/7195e8b76350f26ab3b963702d88b254512e6928

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit be3252fe01f39f8ac21d611861bd0c5dda58b09f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openocd/openocd.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
index 78c6e10c58..b24d1eacf0 100644
--- a/package/openocd/openocd.mk
+++ b/package/openocd/openocd.mk
@@ -56,8 +56,14 @@ OPENOCD_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_LIBUSB),libusb) \
 	$(if $(BR2_PACKAGE_LIBUSB_COMPAT),libusb-compat) \
 	$(if $(BR2_PACKAGE_LIBHID),libhid) \
-	$(if $(BR2_PACKAGE_HIDAPI),hidapi) \
-	$(if $(BR2_PACKAGE_LIBGPIOD),libgpiod)
+	$(if $(BR2_PACKAGE_HIDAPI),hidapi)
+
+ifeq ($(BR2_PACKAGE_LIBGPIOD),y)
+OPENOCD_DEPENDENCIES += libgpiod
+OPENOCD_CONF_OPTS += --enable-linuxgpiod
+else
+OPENOCD_CONF_OPTS += --disable-linuxgpiod
+endif
 
 # Adapters
 OPENOCD_CONF_OPTS += \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

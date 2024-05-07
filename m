Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE356C25B74
	for <buildroot@archiver.kernel.org>; Tue,  7 May 2024 07:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B71341587;
	Tue,  7 May 2024 07:02:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fg5Qruon3J4U; Tue,  7 May 2024 07:02:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 742FC41560
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 742FC41560;
	Tue,  7 May 2024 07:02:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 104981BF95F
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 07:02:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF7D460AD2
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 07:02:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ECUa6rpWCMNZ for <buildroot@lists.busybox.net>;
 Tue,  7 May 2024 07:02:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9B6B605E5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E9B6B605E5
 for <buildroot@buildroot.org>; Tue,  7 May 2024 07:02:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D63CF86989; Tue,  7 May 2024 07:02:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 7 May 2024 09:01:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a3ee47ef22f4035d715461e98ff8a2c4f76735ea
X-Git-Newrev: be3252fe01f39f8ac21d611861bd0c5dda58b09f
X-Patchwork-Hint: ignore
Message-Id: <20240507070215.D63CF86989@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openocd: fix build with libgpiod2
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

commit: https://git.buildroot.net/buildroot/commit/?id=be3252fe01f39f8ac21d611861bd0c5dda58b09f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

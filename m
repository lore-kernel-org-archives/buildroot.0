Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30EF6C433EF
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 09:19:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCBCA61096;
	Sat, 28 May 2022 09:19:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id onfHPTeFsVRB; Sat, 28 May 2022 09:19:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E309961093;
	Sat, 28 May 2022 09:19:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 32C6A1BF5DA
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 09:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 13A78419AD
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 09:17:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Uj507rn5GoaB for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 09:17:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 482F0419AF
 for <buildroot@buildroot.org>; Sat, 28 May 2022 09:17:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0D47F84245; Sat, 28 May 2022 09:05:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 28 May 2022 11:05:21 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 6ac62f5920271c24d96e37cae55d6272bd3df958
X-Git-Newrev: 216cbeb9933862d4b46430a3cbb06f1cb98b917f
X-Patchwork-Hint: ignore
Message-Id: <20220528090538.0D47F84245@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/openocd: Fix
 segfault when using ST-Link driver
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
Content-Type: multipart/mixed; boundary="===============8727493761531350463=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8727493761531350463==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=216cbeb9933862d4b46430a3cbb06f1cb98b917f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Recent changes in libusb have exposed a bug in OpenOCD which now crash when trying
to use the ST-Link driver.

Upstream has a fix as commit cff0e417da58adef1ceef9a63a99412c2cc87ff3. This add the commit
as a stand alone patch. The crash also happen on Linux, which was not mentionned in that
commit message.

Should be removed when OpenOCD is updated to a release newer than 0.11

Signed-off-by: Yannick Brosseau <yannick.brosseau@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 4239958963fd7da78fa8683646ad4b781a54c7fd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...SIGSEGV-with-libusb-v1.0.24-33-g32a2206-1.patch | 89 ++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/package/openocd/0003-stlink-fix-SIGSEGV-with-libusb-v1.0.24-33-g32a2206-1.patch b/package/openocd/0003-stlink-fix-SIGSEGV-with-libusb-v1.0.24-33-g32a2206-1.patch
new file mode 100644
index 0000000000..776816892b
--- /dev/null
+++ b/package/openocd/0003-stlink-fix-SIGSEGV-with-libusb-v1.0.24-33-g32a2206-1.patch
@@ -0,0 +1,89 @@
+From cff0e417da58adef1ceef9a63a99412c2cc87ff3 Mon Sep 17 00:00:00 2001
+From: Antonio Borneo <borneo.antonio@gmail.com>
+Date: Wed, 23 Jun 2021 16:52:16 +0200
+Subject: [PATCH] stlink: fix SIGSEGV with libusb v1.0.24-33-g32a2206 (11618)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The stlink driver incorrectly uses a NULL pointer for libusb's
+struct libusb_context.
+The correct value to be used is local in libusb_helper.c.
+
+Move in the helper file, in a wrapper function, the only call that
+requires the above value, and let stlink driver to use this
+wrapper.
+
+This issue has not triggered any visible problem until a code
+refactoring [1] in libusb has made OpenOCD crashing on Windows and
+on MacOS.
+
+Change-Id: Id1818c8af7cf0d4d17dfa1d22aad079da01ef740
+Signed-off-by: Antonio Borneo <borneo.antonio@gmail.com>
+Fixes: https://sourceforge.net/p/openocd/tickets/308/
+Fixes: https://github.com/libusb/libusb/issues/928/
+Fixes: 42d8fa899c6a ("stlink_usb: Submit multiple USB URBs at once to improve performance")
+Link: [1] https://github.com/libusb/libusb/commit/32a22069428c
+Reported-by: Andrzej Sierżęga <asier70@gmail.com>
+Co-developed-by: Andrzej Sierżęga <asier70@gmail.com>
+Co-developed-by: Xiaofan Chen <xiaofanc@gmail.com>
+Reviewed-on: http://openocd.zylin.com/6331
+Tested-by: jenkins
+Reviewed-by: Marc Schink <dev@zapb.de>
+Reviewed-by: Xiaofan <xiaofanc@gmail.com>
+Reviewed-by: Andrzej Sierżęga <asier70@gmail.com>
+Reviewed-by: Oleksij Rempel <linux@rempel-privat.de>
+Reviewed-by: Andreas Fritiofson <andreas.fritiofson@gmail.com>
+Signed-off-by: Yannick Brosseau <yannick.brosseau@gmail.com>
+---
+ src/jtag/drivers/libusb_helper.c | 5 +++++
+ src/jtag/drivers/libusb_helper.h | 1 +
+ src/jtag/drivers/stlink_usb.c    | 7 +------
+ 3 files changed, 7 insertions(+), 6 deletions(-)
+
+diff --git a/src/jtag/drivers/libusb_helper.c b/src/jtag/drivers/libusb_helper.c
+index f0122d534..18fe4bad4 100644
+--- a/src/jtag/drivers/libusb_helper.c
++++ b/src/jtag/drivers/libusb_helper.c
+@@ -363,3 +363,8 @@ int jtag_libusb_get_pid(struct libusb_device *dev, uint16_t *pid)
+ 
+ 	return ERROR_FAIL;
+ }
++
++int jtag_libusb_handle_events_completed(int *completed)
++{
++	return libusb_handle_events_completed(jtag_libusb_context, completed);
++}
+diff --git a/src/jtag/drivers/libusb_helper.h b/src/jtag/drivers/libusb_helper.h
+index fa7d06e28..3e77865d6 100644
+--- a/src/jtag/drivers/libusb_helper.h
++++ b/src/jtag/drivers/libusb_helper.h
+@@ -60,5 +60,6 @@ int jtag_libusb_choose_interface(struct libusb_device_handle *devh,
+ 		unsigned int *usb_write_ep,
+ 		int bclass, int subclass, int protocol, int trans_type);
+ int jtag_libusb_get_pid(struct libusb_device *dev, uint16_t *pid);
++int jtag_libusb_handle_events_completed(int *completed);
+ 
+ #endif /* OPENOCD_JTAG_DRIVERS_LIBUSB_HELPER_H */
+diff --git a/src/jtag/drivers/stlink_usb.c b/src/jtag/drivers/stlink_usb.c
+index c68bbb3ca..7b1932b9f 100644
+--- a/src/jtag/drivers/stlink_usb.c
++++ b/src/jtag/drivers/stlink_usb.c
+@@ -497,13 +497,8 @@ static void sync_transfer_wait_for_completion(struct libusb_transfer *transfer)
+ {
+ 	int r, *completed = transfer->user_data;
+ 
+-	/* Assuming a single libusb context exists.  There no existing interface into this
+-	 * module to pass a libusb context.
+-	 */
+-	struct libusb_context *ctx = NULL;
+-
+ 	while (!*completed) {
+-		r = libusb_handle_events_completed(ctx, completed);
++		r = jtag_libusb_handle_events_completed(completed);
+ 		if (r < 0) {
+ 			if (r == LIBUSB_ERROR_INTERRUPTED)
+ 				continue;
+-- 
+2.35.1
+

--===============8727493761531350463==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8727493761531350463==--

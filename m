Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D05E8C433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 19:41:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9622B80FF8;
	Wed, 27 Apr 2022 19:41:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NkPeZqs-lcdb; Wed, 27 Apr 2022 19:41:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8531813FC;
	Wed, 27 Apr 2022 19:41:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9D81D1BF2EA
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 19:41:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8BB7540AB4
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 19:41:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id izoav1COBEQ6 for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 19:41:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BFFFC4010D
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 19:41:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 1579184607; Wed, 27 Apr 2022 19:30:53 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 27 Apr 2022 21:03:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3943a8111b9775eac601d365600af3432877d844
X-Git-Newrev: d608368e1a98dd7f41d51214669149115a8f73aa
X-Patchwork-Hint: ignore
Message-Id: <20220427193053.1579184607@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openobex: fix static with libusb
 and libatomic
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

commit: https://git.buildroot.net/buildroot/commit/?id=d608368e1a98dd7f41d51214669149115a8f73aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Force LibUSB_VERSION_1.0 to ON to fix the following static build failure
with libusb and libatomic:

-- Looking for libusb_get_device_list in /nvmedata/autobuild/instance-4/output-1/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libusb-1.0.a
-- Looking for libusb_get_device_list in /nvmedata/autobuild/instance-4/output-1/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libusb-1.0.a - not found

[...]

/nvmedata/autobuild/instance-4/output-1/build/openobex-1.7.2/lib/transport/usbobex.h:30:10: fatal error: usb.h: No such file or directory
   30 | #include <usb.h>
      |          ^~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/52b0edc4278f65fb4a9671b65c655cc4544a3103

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/openobex/openobex.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/openobex/openobex.mk b/package/openobex/openobex.mk
index bc4a47e3d7..7109bffa8d 100644
--- a/package/openobex/openobex.mk
+++ b/package/openobex/openobex.mk
@@ -20,6 +20,7 @@ OPENOBEX_DEPENDENCIES += bluez5_utils
 endif
 
 ifeq ($(BR2_PACKAGE_LIBUSB),y)
+OPENOBEX_CONF_OPTS += -DLibUSB_VERSION_1.0=ON
 OPENOBEX_DEPENDENCIES += libusb
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

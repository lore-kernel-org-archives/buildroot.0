Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B757C433F5
	for <buildroot@archiver.kernel.org>; Fri, 27 May 2022 09:41:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5CB2041332;
	Fri, 27 May 2022 09:41:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w_fJZAcSgRVy; Fri, 27 May 2022 09:41:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 820A941223;
	Fri, 27 May 2022 09:41:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AFF921BF3B0
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 09:38:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7163084AAA
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 09:38:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kYRd1JZ8S5jC for <buildroot@lists.busybox.net>;
 Fri, 27 May 2022 09:38:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB23884A4E
 for <buildroot@buildroot.org>; Fri, 27 May 2022 09:38:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id DB6578662C; Fri, 27 May 2022 09:27:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 27 May 2022 11:30:51 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 3ef9c6ee6fe9afd4802192e84e4b1ae54272221b
X-Git-Newrev: 41604888e129690474d39176ca8e87ec3e6168bb
X-Patchwork-Hint: ignore
Message-Id: <20220527092724.DB6578662C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/openobex: fix
 static with libusb and libatomic
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

commit: https://git.buildroot.net/buildroot/commit/?id=41604888e129690474d39176ca8e87ec3e6168bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
(cherry picked from commit d608368e1a98dd7f41d51214669149115a8f73aa)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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

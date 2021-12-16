Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED2BC433EF
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 19:52:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFCCC6104E;
	Thu, 16 Dec 2021 19:52:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4Fq4-ct8af46; Thu, 16 Dec 2021 19:52:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15F1761056;
	Thu, 16 Dec 2021 19:52:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0C8E81BF3A9
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 19:51:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A41C783F2C
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 19:51:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VkS8wne0ZIM4 for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 19:51:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E2CDC83F2E
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 19:51:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 59D46822BA; Thu, 16 Dec 2021 19:45:55 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 16 Dec 2021 20:23:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f0dbd03a0c93ae286d8b70b5455d699c58acf77e
X-Git-Newrev: 966f8187c6db49bf24071c72e2da6dbcba761a80
X-Patchwork-Hint: ignore
Message-Id: <20211216194555.59D46822BA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pcsc-lite: fix build without
 lib{udev, usb}
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

commit: https://git.buildroot.net/buildroot/commit/?id=966f8187c6db49bf24071c72e2da6dbcba761a80
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump to version 1.9.5 in
commit c7233ec2c32c9fbef2738f8de7d59da85cd44b99 and
https://github.com/LudovicRousseau/PCSC/commit/6f8f170db3c88c59a5ddb5ae5319b921a901a6aa:

/home/giuliobenetti/autobuild/run/instance-2/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/11.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: pcscd-pcscdaemon.o: in function `signal_thread':
pcscdaemon.c:(.text+0x444): undefined reference to `HPReCheckSerialReaders'

Fixes:
 - http://autobuild.buildroot.org/results/6cf323229f32967aa554418410dc94b7094d09af

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ..._generic.c-fix-build-without-lib-udev-usb.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/pcsc-lite/0001-src-hotplug_generic.c-fix-build-without-lib-udev-usb.patch b/package/pcsc-lite/0001-src-hotplug_generic.c-fix-build-without-lib-udev-usb.patch
new file mode 100644
index 0000000000..7e93bf5fce
--- /dev/null
+++ b/package/pcsc-lite/0001-src-hotplug_generic.c-fix-build-without-lib-udev-usb.patch
@@ -0,0 +1,35 @@
+From 2153e165c48e541bb5a8b23f81e87db87a9394fd Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 14 Dec 2021 08:20:59 +0100
+Subject: [PATCH] src/hotplug_generic.c: fix build without lib{udev,usb}
+
+Fix the following build failure without lib{udev,usb} raised since
+version 1.9.5 and
+https://github.com/LudovicRousseau/PCSC/commit/6f8f170db3c88c59a5ddb5ae5319b921a901a6aa:
+
+/home/giuliobenetti/autobuild/run/instance-2/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/11.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: pcscd-pcscdaemon.o: in function `signal_thread':
+pcscdaemon.c:(.text+0x444): undefined reference to `HPReCheckSerialReaders'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/6cf323229f32967aa554418410dc94b7094d09af
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/LudovicRousseau/PCSC/commit/2153e165c48e541bb5a8b23f81e87db87a9394fd]
+---
+ src/hotplug_generic.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/hotplug_generic.c b/src/hotplug_generic.c
+index a0f34646..e4f19935 100644
+--- a/src/hotplug_generic.c
++++ b/src/hotplug_generic.c
+@@ -48,7 +48,7 @@ THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ #define FALSE 0
+ #endif
+ 
+-#if !defined(__APPLE__) && !defined(HAVE_LIBUSB) && !defined(__linux__) && !defined(HAVE_LIBUDEV)
++#if !defined(__APPLE__) && !defined(HAVE_LIBUSB) && !defined(HAVE_LIBUDEV)
+ 
+ LONG HPSearchHotPluggables(void)
+ {
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

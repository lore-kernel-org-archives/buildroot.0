Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1770C433EF
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 19:33:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A482060EEF;
	Mon,  7 Mar 2022 19:33:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0a2vYzrUaHGc; Mon,  7 Mar 2022 19:33:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D62EA60EAD;
	Mon,  7 Mar 2022 19:33:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8EBAD1BF36D
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 19:33:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 89F9C833D3
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 19:33:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id agaW3_kY2ws2 for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 19:33:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CCE6A832EB
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 19:33:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3B9FA82815; Mon,  7 Mar 2022 19:24:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 7 Mar 2022 20:30:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f41d47f15b63a4bbe026834478e63acba85d33fe
X-Git-Newrev: c4eebf191c781a3ea6b5eb1811cc17ae92ea2fb2
X-Patchwork-Hint: ignore
Message-Id: <20220307192455.3B9FA82815@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wpa_supplicant: fix
 libwpa_client.so build
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

commit: https://git.buildroot.net/buildroot/commit/?id=c4eebf191c781a3ea6b5eb1811cc17ae92ea2fb2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Build target libwpa_client.so is not built regardless of whether the
option CONFIG_BUILD_WPA_CLIENT_SO is set or not. Add patch that
fixes wpa_supplicant build regression.

Fixes:
http://autobuild.buildroot.net/results/001981339f3b895ecd9208a747a0e47d07c9583a/
http://autobuild.buildroot.net/results/318f9ecd4060d34cc8385891b56d0a0e6275f2c9/

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Tested-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-enable-options-for-libwpa_client.so-and-.patch | 68 ++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/package/wpa_supplicant/0001-build-re-enable-options-for-libwpa_client.so-and-.patch b/package/wpa_supplicant/0001-build-re-enable-options-for-libwpa_client.so-and-.patch
new file mode 100644
index 0000000000..156d0e7e2c
--- /dev/null
+++ b/package/wpa_supplicant/0001-build-re-enable-options-for-libwpa_client.so-and-.patch
@@ -0,0 +1,68 @@
+From e6a6a4e3df52cc60425fcd037d3ec68a38f948ce Mon Sep 17 00:00:00 2001
+From: Sergey Matyukevich <geomatsi@gmail.com>
+Date: Sun, 20 Feb 2022 10:12:28 +0300
+Subject: [PATCH] build: re-enable options for libwpa_client.so and wpa_passphrase
+
+Commit a41a29192e5d ("build: Pull common fragments into a build.rules
+file") introduced regression into wpa_supplicant build process. Build
+target libwpa_client.so is not built regardless of whether the option
+CONFIG_BUILD_WPA_CLIENT_SO is set or not. This happens because config
+option is used before it is imported from the configuration file.
+Moving its usage after including build.rules does not help: variable
+ALL is processed by build.rules and further changes are not applied.
+Similarly, option CONFIG_NO_WPA_PASSPHRASE also does not work as
+expected: wpa_passphrase is always built regardless of whether the
+option is set or not.
+
+This commit re-enables options adding both build targets to _all
+dependencies.
+
+Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
+---
+ wpa_supplicant/Makefile | 19 ++++++++++++-------
+ 1 file changed, 12 insertions(+), 7 deletions(-)
+
+diff --git a/wpa_supplicant/Makefile b/wpa_supplicant/Makefile
+index cb66defac..e384cc6b8 100644
+--- a/wpa_supplicant/Makefile
++++ b/wpa_supplicant/Makefile
+@@ -1,24 +1,29 @@
+ BINALL=wpa_supplicant wpa_cli
+ 
+-ifndef CONFIG_NO_WPA_PASSPHRASE
+-BINALL += wpa_passphrase
+-endif
+-
+ ALL = $(BINALL)
+ ALL += systemd/wpa_supplicant.service
+ ALL += systemd/wpa_supplicant@.service
+ ALL += systemd/wpa_supplicant-nl80211@.service
+ ALL += systemd/wpa_supplicant-wired@.service
+ ALL += dbus/fi.w1.wpa_supplicant1.service
+-ifdef CONFIG_BUILD_WPA_CLIENT_SO
+-ALL += libwpa_client.so
+-endif
+ 
+ EXTRA_TARGETS=dynamic_eap_methods
+ 
+ CONFIG_FILE=.config
+ include ../src/build.rules
+ 
++ifdef CONFIG_BUILD_WPA_CLIENT_SO
++# add the dependency this way to allow CONFIG_BUILD_WPA_CLIENT_SO
++# being set in the config which is read by build.rules
++_all: libwpa_client.so
++endif
++
++ifndef CONFIG_NO_WPA_PASSPHRASE
++# add the dependency this way to allow CONFIGNO_WPA_PASSPHRASE
++# being set in the config which is read by build.rules
++_all: wpa_passphrase
++endif
++
+ ifdef LIBS
+ # If LIBS is set with some global build system defaults, clone those for
+ # LIBS_c and LIBS_p to cover wpa_passphrase and wpa_cli as well.
+-- 
+2.35.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

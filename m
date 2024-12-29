Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E12E7718B
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 22:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DC28402A6;
	Sun, 29 Dec 2024 22:35:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vVKjxhwC8_AI; Sun, 29 Dec 2024 22:35:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08866402E5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08866402E5;
	Sun, 29 Dec 2024 22:35:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 43FE1F11
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 22:35:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2472D608CA
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 22:35:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k6hml2tENOSf for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 22:35:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40DA96084D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40DA96084D
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 22:35:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 39CAA87784; Sun, 29 Dec 2024 22:35:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 29 Dec 2024 23:17:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 99b473c94868163ac40311dc488a6d8491568429
X-Git-Newrev: 421a92a8973d23b017293ea8b776d34fb54a6b5e
X-Patchwork-Hint: ignore
Message-Id: <20241229223549.39CAA87784@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bluez5_utils: install datafiles
 with correct permissions
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=421a92a8973d23b017293ea8b776d34fb54a6b5e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The datafiles include the dbus policy, without which bluetoothd fails
to start (unless it is provided by other means):

# /usr/libexec/bluetooth/bluetoothd -n
bluetoothd[1011]: Bluetooth daemon 5.78
D-Bus setup failed: Connection ":1.7" is not allowed to own the service "org.bluez" due to security policies in the configuration file
bluetoothd[1011]: src/main.c:main() Unable to get on D-Bus

The installation issue 1a8676aa6e4b0e372a1a744eac6e53c90c03bf0e was
meant to fix is the result of upstream incorrectly installing
/etc/bluetooth with 0555 (strictly read-only) permissions.

Fixes: 1a8676aa6e4b0e372a1a744eac6e53c90c03bf0e

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...002-Leave-config-files-writable-for-owner.patch | 35 ++++++++++++++++++++++
 package/bluez5_utils/bluez5_utils.mk               |  4 ++-
 2 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/package/bluez5_utils/0002-Leave-config-files-writable-for-owner.patch b/package/bluez5_utils/0002-Leave-config-files-writable-for-owner.patch
new file mode 100644
index 0000000000..09ebe5edf1
--- /dev/null
+++ b/package/bluez5_utils/0002-Leave-config-files-writable-for-owner.patch
@@ -0,0 +1,35 @@
+From b1fd409960001a77cda2a09ecc00147ebd9c3667 Mon Sep 17 00:00:00 2001
+From: Fiona Klute <fiona.klute@gmx.de>
+Date: Mon, 9 Dec 2024 16:40:43 +0100
+Subject: [PATCH BlueZ] build: Leave config files writable for owner
+
+This is needed for builds running as non-root users, so the build
+process and any distribution tools can create/move/delete files in the
+config directory without adjusting permissions separately. Limiting
+writes from the running service needs to be done in the systemd unit
+(already the case) or init script.
+
+See also: https://lore.kernel.org/linux-bluetooth/4d1206df-598b-4a68-8655-74981b62ecca@gmx.de/T/
+Reviewed-by: Bastien Nocera <hadess@hadess.net>
+Upstream: https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=b1fd409960001a77cda2a09ecc00147ebd9c3667
+Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
+---
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 297d0774c..29018a91c 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -32,7 +32,7 @@ confdir = $(sysconfdir)/bluetooth
+ statedir = $(localstatedir)/lib/bluetooth
+ 
+ bluetoothd-fix-permissions:
+-	install -dm555 $(DESTDIR)$(confdir)
++	install -dm755 $(DESTDIR)$(confdir)
+ 	install -dm700 $(DESTDIR)$(statedir)
+ 
+ if DATAFILES
+-- 
+2.45.2
+
diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index 7725fb94bf..e3b47e1e80 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -13,6 +13,9 @@ BLUEZ5_UTILS_LICENSE = GPL-2.0+, LGPL-2.1+
 BLUEZ5_UTILS_LICENSE_FILES = COPYING COPYING.LIB
 BLUEZ5_UTILS_CPE_ID_VENDOR = bluez
 BLUEZ5_UTILS_CPE_ID_PRODUCT = bluez
+# required because 0002-Leave-config-files-writable-for-owner.patch
+# modifies Makefile.am
+BLUEZ5_UTILS_AUTORECONF = YES
 
 BLUEZ5_UTILS_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_BLUEZ5_UTILS_HEADERS),bluez5_utils-headers) \
@@ -22,7 +25,6 @@ BLUEZ5_UTILS_DEPENDENCIES = \
 BLUEZ5_UTILS_CONF_OPTS = \
 	--enable-library \
 	--disable-cups \
-	--disable-datafiles \
 	--disable-manpages \
 	--disable-asan \
 	--disable-lsan \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

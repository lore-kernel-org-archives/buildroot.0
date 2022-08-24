Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F89ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 09:07:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A974F6FB4D;
	Sun, 11 Sep 2022 09:07:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A974F6FB4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nnxm6Prifhbg; Sun, 11 Sep 2022 09:07:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D065061075;
	Sun, 11 Sep 2022 09:07:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D065061075
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4B6021BF368
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:49:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D614E6FB33
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D614E6FB33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2xeAPlx7fzN5 for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 08:48:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E98C160F64
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 08:48:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E98C160F64
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D99398361F; Sun, 11 Sep 2022 08:48:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 24 Aug 2022 12:04:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4c2f0b918c65b1de934800bcc82e571ca4f96b86
X-Git-Newrev: bf85b8e267b5fbbf817408d93435504ab458c01e
X-Patchwork-Hint: ignore
Message-Id: <20220911084826.D99398361F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libinput: remove python tools
 scripts
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

commit: https://git.buildroot.net/buildroot/commit/?id=bf85b8e267b5fbbf817408d93435504ab458c01e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some libinput tools are actually python scripts and requires at least
tree python modules: libevdev, pyudev and pyyaml:

libinput]$ file *
libinput-analyze:                   ELF 32-bit LSB pie executable, ARM, EABI5 version 1 (SYSV), dynamically linked, interpreter /lib/ld-uClibc.so.0, stripped
libinput-analyze-per-slot-delta:    Python script, UTF-8 Unicode text executable
libinput-analyze-recording:         Python script, UTF-8 Unicode text executable
libinput-analyze-touch-down-state:  Python script, UTF-8 Unicode text executable
libinput-debug-events:              ELF 32-bit LSB pie executable, ARM, EABI5 version 1 (SYSV), dynamically linked, interpreter /lib/ld-uClibc.so.0, stripped
libinput-debug-tablet:              ELF 32-bit LSB pie executable, ARM, EABI5 version 1 (SYSV), dynamically linked, interpreter /lib/ld-uClibc.so.0, stripped
libinput-list-devices:              ELF 32-bit LSB pie executable, ARM, EABI5 version 1 (SYSV), dynamically linked, interpreter /lib/ld-uClibc.so.0, stripped
libinput-measure:                   ELF 32-bit LSB pie executable, ARM, EABI5 version 1 (SYSV), dynamically linked, interpreter /lib/ld-uClibc.so.0, stripped
libinput-measure-fuzz:              Python script, UTF-8 Unicode text executable
libinput-measure-touchpad-pressure: Python script, UTF-8 Unicode text executable
libinput-measure-touchpad-size:     Python script, UTF-8 Unicode text executable
libinput-measure-touchpad-tap:      Python script, UTF-8 Unicode text executable
libinput-measure-touch-size:        Python script, UTF-8 Unicode text executable
libinput-quirks:                    ELF 32-bit LSB pie executable, ARM, EABI5 version 1 (SYSV), dynamically linked, interpreter /lib/ld-uClibc.so.0, stripped
libinput-record:                    ELF 32-bit LSB pie executable, ARM, EABI5 version 1 (SYSV), dynamically linked, interpreter /lib/ld-uClibc.so.0, stripped
libinput-replay:                    Python script, UTF-8 Unicode text executable

Since for now we do not have a python-libevdev package, this commit
unconditionally removes Python scripts.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libinput/libinput.mk | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index a66b0afde5..1529411355 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -30,4 +30,21 @@ else
 LIBINPUT_CONF_OPTS += -Ddebug-gui=false
 endif
 
+LIBINPUT_PYTHON_TOOLS = libinput-analyze-per-slot-delta \
+	libinput-analyze-recording \
+	libinput-analyze-touch-down-state \
+	libinput-measure-fuzz \
+	libinput-measure-touchpad-pressure \
+	libinput-measure-touchpad-size \
+	libinput-measure-touchpad-tap \
+	libinput-measure-touch-size \
+	libinput-replay
+
+define LIBINPUT_REMOVE_UNNEEDED_FILES
+	$(foreach f,$(LIBINPUT_PYTHON_TOOLS), \
+		rm -f $(TARGET_DIR)/usr/libexec/libinput/$(f)
+	)
+endef
+LIBINPUT_POST_INSTALL_TARGET_HOOKS += LIBINPUT_REMOVE_UNNEEDED_FILES
+
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

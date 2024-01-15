Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 655CFC47258
	for <buildroot@archiver.kernel.org>; Mon, 15 Jan 2024 10:21:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8D6E41758;
	Mon, 15 Jan 2024 10:21:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8D6E41758
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oxx-48D-TJLy; Mon, 15 Jan 2024 10:21:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11AF141748;
	Mon, 15 Jan 2024 10:21:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11AF141748
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 80A6C1BF41C
 for <buildroot@lists.busybox.net>; Mon, 15 Jan 2024 10:21:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 597AE60E38
 for <buildroot@lists.busybox.net>; Mon, 15 Jan 2024 10:21:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 597AE60E38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JlKcGCkehJw3 for <buildroot@lists.busybox.net>;
 Mon, 15 Jan 2024 10:21:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 999E260E1B
 for <buildroot@buildroot.org>; Mon, 15 Jan 2024 10:21:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 999E260E1B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 85583861B6; Mon, 15 Jan 2024 10:21:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 15 Jan 2024 11:21:09 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: fef893cb60dc2f2dc6d064743bc378ad8e4f5d32
X-Git-Newrev: 8526e60a1f09854b96016b03a2439fcb61200ee4
X-Patchwork-Hint: ignore
Message-Id: <20240115102130.85583861B6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] Update for 2023.11.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=8526e60a1f09854b96016b03a2439fcb61200ee4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 39 +++++++++++++++++++++++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 42 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index f927b7df65..3c02b64064 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,42 @@
+2023.11.1, released January 15th, 2024
+
+	Important / security related fixes.
+
+	Infrastructure:
+
+	- Download: Revert a permission fixup step in the tarball
+	  creation logic, which lead to a hash mismatch issue in two
+	  cargo-vendored packages, ripgrep and sentry-cli.
+
+	- Build: Pass GIT_DIR=. in the environment (through
+	  HOST_MAKE_ENV/TARGET_MAKE_ENV) to the build steps to
+	  workaround packages trying to detect if they are building in
+	  a git checkout and getting confused when building in a sub
+	  directory of a Buildroot git checkout.
+
+	Defconfigs: Rock5b: Add download hashes for U-Boot and Linux
+
+	Updated/fixed packages: apcupsd, arm-trusted-firmware, botan,
+	cjson, criu, cryptodev-linux, cups, dahdi-linux, dahdi-tools,
+	dbus, docker, dropbear, duktape, edk2, erlang, exim, faad2,
+	freeswitch, gcc, gdal, gdb, giflib, glibc, gnuplot, gnutls,
+	go, google-breakpad, gst-omx, gstd, gst1-devtools, gst1-libav,
+	gst1-plugins-bad, gst1-plugins-base, gst1-plugins-good,
+	gst1-plugins-ugly, gst1-python, gst1-rtsp-server, gst1-vaapi,
+	gstreamer1, gstreamer1-editing-services, ipcalc, jq,
+	json-for-modern-cpp, ksmbd-tools, libaio, libarchive,
+	libcamera, libcamera-apps, libcap-ng, libcgroup, libcurl,
+	libde265, libebml, libgtk3, libheif, libiec61850, libndns,
+	libostree, libraw, libsigsegv, libssh, libssh2, libuev,
+	libwebsockets, libzenoh-pico, liquid-dsp, lvm2, madplay,
+	mesa3d, micropython, minizip, mp4v2, nushell,
+	onevpl-intel-gpu, opensc, openssh, optee-client, orc, php,
+	pipewire, postgis, postgresql, proftpd, putty, python-brotli,
+	python-pysensors, python-sip, python-werkzeug, shim, squid,
+	strongswan, sway, tinyssh, tor, transmission, tree, udev,
+	uftp, valijson, wireshark, wlroots, wolfssl,
+	xserver_xorg-server, xwayland,
+
 2023.11, released December 4th, 2023
 
 	Various fixes.
diff --git a/Makefile b/Makefile
index e422e97214..7d1fa0641f 100644
--- a/Makefile
+++ b/Makefile
@@ -90,9 +90,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2023.11
+export BR2_VERSION := 2023.11.1
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1701677000
+BR2_VERSION_EPOCH = 1705314000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 61eb743659..64c479b693 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2023.11'
+RELEASE='2023.11.1'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

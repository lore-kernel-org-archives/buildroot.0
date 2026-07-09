Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D0CC44507
	for <buildroot@archiver.kernel.org>; Thu,  9 Jul 2026 11:15:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B5C040675;
	Thu,  9 Jul 2026 11:15:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y4EKftr-zPj6; Thu,  9 Jul 2026 11:15:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 887B8406D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783595725;
	bh=S2ICR15sdLNBYyCq8gTxNUVg9oL3+vSsACNvzcWqZrc=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z/EGIo9+iK8AvAy2iYpwdvLActOGLcyR8q3a15aRId5y/LsNZU0f5UYMe0o4Fal9y
	 4k8RBqaeUZlA/dQnGlavglSxu/YEzVLEh1LUHRjKBQp4pqAQhbBhCUHVDwXLdWw+79
	 8Lpo/9zN8kTBeLevwiHS+ICxPyJFMPK3l+H1LnzwXj0M45uo0NpFhkRtmoc9kzOnJI
	 B5vm0hOAkV3y1D1YPpHdbqRq5L6Nspi3r/mMyt012oOeZW98wmsJCBgz+ICNhGNltf
	 j5i40nUc6C73bLv7TTGeJl2c0ikAPAFUn9ARs/PnbhNMsqFHipZiuQ3o0M5Ca5tMXm
	 rtQTfnKwW420w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 887B8406D8;
	Thu,  9 Jul 2026 11:15:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 99432315
 for <buildroot@buildroot.org>; Thu,  9 Jul 2026 11:15:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7FB53406D8
 for <buildroot@buildroot.org>; Thu,  9 Jul 2026 11:15:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fRDQ3cRTQpYd for <buildroot@buildroot.org>;
 Thu,  9 Jul 2026 11:15:23 +0000 (UTC)
X-Greylist: delayed 372 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 09 Jul 2026 11:15:23 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3EFB340675
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EFB340675
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:151:30a2::163; helo=serv15.avernis.de;
 envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
Received: from serv15.avernis.de (serv15.avernis.de
 [IPv6:2a01:4f8:151:30a2::163])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3EFB340675
 for <buildroot@buildroot.org>; Thu,  9 Jul 2026 11:15:23 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 18FAEBDE6D77;
 Thu, 09 Jul 2026 13:09:13 +0200 (CEST)
From: Andreas Ziegler <br025@umbiko.net>
To: buildroot@buildroot.org
Cc: Marcus Hoffmann <buildroot@bubu1.eu>,
	Andreas Ziegler <br025@umbiko.net>
Date: Thu,  9 Jul 2026 13:08:14 +0200
Message-ID: <20260709110822.305873-11-br025@umbiko.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260709110822.305873-1-br025@umbiko.net>
References: <20260709110822.305873-1-br025@umbiko.net>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1783595354; bh=qGlO0uRpSiimR3p3PIaoqyK0dsWMO8qsa3WvB6NdX4I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=HStOdGUSgpIganC3uUNNLKgaWb6CaUfLJ2ds7JyMU6ba1NiEpwENdu8ccTFoRdyzS
 ithCU6u/TbeUX7g02rDR7zkKAz9dRotC7suVNBLqDZo4uxUgbXiJgGMC24RBCq9DES
 mgWV9jM/yDFfZnVE/lE4kpP4x58azyj7Sl0VIkGg=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=HStOdGUS
Subject: [Buildroot] [PATCH v2 10/11] support/testing: add runtime test for
 mpd
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Andreas Ziegler <br025@umbiko.net>
---
 support/testing/tests/package/test_mpd.py     | 57 ++++++++++++++
 .../tests/package/test_mpd/busybox.fragment   |  4 +
 .../tests/package/test_mpd/post-build.sh      |  6 ++
 .../test_mpd/rootfs-overlay/etc/mpd.conf      | 14 ++++
 .../test_mpd/rootfs-overlay/root/test_mpd.sh  | 74 +++++++++++++++++++
 5 files changed, 155 insertions(+)
 create mode 100644 support/testing/tests/package/test_mpd.py
 create mode 100644 support/testing/tests/package/test_mpd/busybox.fragment
 create mode 100755 support/testing/tests/package/test_mpd/post-build.sh
 create mode 100644 support/testing/tests/package/test_mpd/rootfs-overlay/etc/mpd.conf
 create mode 100755 support/testing/tests/package/test_mpd/rootfs-overlay/root/test_mpd.sh

diff --git a/support/testing/tests/package/test_mpd.py b/support/testing/tests/package/test_mpd.py
new file mode 100644
index 0000000000..8564bb85e8
--- /dev/null
+++ b/support/testing/tests/package/test_mpd.py
@@ -0,0 +1,57 @@
+#!/bin/python
+
+import os
+import infra.basetest
+
+class TestMpd(infra.basetest.BRTest):
+
+    rootfs_overlay = \
+        infra.filepath("tests/package/test_mpd/rootfs-overlay")
+    busybox_fragment = \
+        infra.filepath("tests/package/test_mpd/busybox.fragment")
+    post_build_script = \
+        infra.filepath("tests/package/test_mpd/post-build.sh")
+
+    # use a custom configuration
+    config = \
+        """
+        BR2_x86_64=y
+        BR2_x86_x86_64_v2=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_GLIBC_BLEEDING_EDGE=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+        BR2_ROOTFS_OVERLAY="{}"
+        BR2_ROOTFS_POST_BUILD_SCRIPT="{}"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_LATEST_VERSION=y
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
+        BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="{}"
+        BR2_PACKAGE_MPD=y
+        BR2_PACKAGE_MPD_FLAC=y
+        BR2_PACKAGE_MPD_LIBSNDFILE=y
+        # BR2_PACKAGE_MPD_MAD is not set
+        # BR2_PACKAGE_MPD_ALSA is not set
+        BR2_PACKAGE_MPD_ID3TAG=y
+        BR2_TARGET_ROOTFS_INITRAMFS=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """.format(rootfs_overlay, post_build_script, busybox_fragment)
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        kern = os.path.join(self.builddir, "images", "bzImage")
+        self.emulator.boot(arch="x86_64",
+            kernel=kern,
+            kernel_cmdline=["console=ttyS0"],
+            options=[
+                "-M", "q35",
+                "-cpu", "max",
+                "-smp", "2",
+                "-initrd", cpio_file,
+                ])
+
+        self.emulator.login()
+
+        self.assertRunOk("/root/test_mpd.sh", timeout=90)
diff --git a/support/testing/tests/package/test_mpd/busybox.fragment b/support/testing/tests/package/test_mpd/busybox.fragment
new file mode 100644
index 0000000000..0c92d86c49
--- /dev/null
+++ b/support/testing/tests/package/test_mpd/busybox.fragment
@@ -0,0 +1,4 @@
+#
+# Networking Utilities
+#
+CONFIG_NC=y
diff --git a/support/testing/tests/package/test_mpd/post-build.sh b/support/testing/tests/package/test_mpd/post-build.sh
new file mode 100755
index 0000000000..21ba33df01
--- /dev/null
+++ b/support/testing/tests/package/test_mpd/post-build.sh
@@ -0,0 +1,6 @@
+#!/bin/sh
+
+src="${0%/*}"
+dst="$TARGET_DIR"
+### unpack test data into target
+cat "$src"/_test_data? | tar vxz -C "$dst"
diff --git a/support/testing/tests/package/test_mpd/rootfs-overlay/etc/mpd.conf b/support/testing/tests/package/test_mpd/rootfs-overlay/etc/mpd.conf
new file mode 100644
index 0000000000..210ac0467f
--- /dev/null
+++ b/support/testing/tests/package/test_mpd/rootfs-overlay/etc/mpd.conf
@@ -0,0 +1,14 @@
+music_directory "/var/lib/mpd/music"
+log_file "/var/log/mpd.log"
+pid_file "/var/run/mpd.pid"
+
+database {
+	plugin "simple"
+	path "/var/lib/mpd/mpd.db"
+	cache_directory "/var/lib/mpd/cache"
+}
+
+audio_output {
+	type "null"
+	name "sink hole"
+}
diff --git a/support/testing/tests/package/test_mpd/rootfs-overlay/root/test_mpd.sh b/support/testing/tests/package/test_mpd/rootfs-overlay/root/test_mpd.sh
new file mode 100755
index 0000000000..9b9fa53b6d
--- /dev/null
+++ b/support/testing/tests/package/test_mpd/rootfs-overlay/root/test_mpd.sh
@@ -0,0 +1,74 @@
+#!/bin/sh
+
+mpd_command() {
+	mpd_result=""
+	mpd_state=""
+	printf "Execute %s" "$1"
+	while IFS= read -r line; do
+		case $line in
+			OK) 						mpd_result=$line ;;
+			state:*)					mpd_state=${line##*: } ;;
+			ACK\ \[[0-9]*@[0-9]*\]*)	mpd_error=${line##*\} } ;;
+		esac
+	done <<- EOF
+	$( ( echo "$1"; echo "close" ) | nc localhost 6600 )
+EOF
+
+	if [ "$mpd_result" != "OK" ]; then
+		printf "\nmpd protocol error: %s\n" "$mpd_error"
+		return 1
+	else
+		printf " [OK]\n"
+	fi
+
+	export mpd_state
+}
+
+dump_playlist() {
+( echo "playlistinfo"; echo "close" ) | \
+	nc localhost 6600 | \
+	awk ' \
+		BEGIN{FS=": "} \
+		{ \
+			if($1=="file") f=$2; \
+			if($1=="Title") t=$2; \
+			if($1=="Artist") a=$2; \
+			if($1=="Pos") print $2, a, "-", t, "(" f ")" \
+		}'
+}
+
+test_mpd() {
+	mpd_command "status" || return 1
+
+	# create playlist
+	mpd_command "findadd \"(artist == 'ffmpeg')\"" || return 2
+
+	# check playlist size
+	queue=$(dump_playlist)
+	[ "$(echo "$queue" | wc -l)" -eq 2 ] || return 3
+
+	# check if albumart is available
+	audio_file=$(echo "$queue" | head -1 | sed 's/.*(\(.*\))/\1/')
+	mpd_command "albumart \"$audio_file\" 0" || return 4
+
+	# play some music
+	mpd_command "play 0" || return 5
+
+	# wait for playback to end
+	playing=1
+	duration=0
+	while [ "$playing" -eq 1 ] && [ "$duration" -lt 60 ]; do
+		sleep 1
+		duration=$((duration+1))
+		mpd_command "status" > /dev/null
+		[ "$mpd_state" = "stop" ] && playing=0
+	done
+
+	# playback should have run for exactly 60 seconds
+	[ $duration -eq 59 ] && [ "$playing" -eq 0 ] || return 6
+
+	# clear songs from playlist
+	mpd_command "clear" || return 7
+}
+
+[ "$0" = "-sh" ] || test_mpd
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

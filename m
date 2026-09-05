Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15831C624DB
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 04:03:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79F0660C1C;
	Sat,  5 Sep 2026 04:03:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FHZy61USO7HG; Sat,  5 Sep 2026 04:03:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1294D60C01
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788581018;
	b=CfdZnxhcinR8EQ+eSSFB3UI6+8LJCEM5JDN3D7Hm1mpeVoeAptScYC29daR0sU9TGXv3
	 v6e3Sa/IPC+ZvKMhY3H0w6wZogUt8Q2p7qJaZOqMSgFKljhT+qCTgNktRlYbmU+p2CGSP
	 /iPpPecXCXy1rwdRxeDUt88lGML0RGSbdEDNdB3JzjHeI3Msy1Qpajo36bgqtZ4RtJkxH
	 Z/peStEi0p7/9g6t//U8ovargU1/iIY1Eer4q/sZeEBT1hQcf4MsJ+pwAByIFhIEA5Dqg
	 nZvhvyIw9NaxB2Hg7sWnwQaRjnfbVjPpgUuWs6zkyqqV2aP8Ma3f3SExNyKgZONUB7A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788581018;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Virus-Scanned:X-Virus-Status:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=7inwF5VCGuLMBRZjZgmGCi6Gt7mOUiET4fJqvzzvn1I=;
	b=tDYuO7/awvzOfX/WYlbbOZvUkub/m+EiKy+SS4Cxcc8szWB0DNStNSEEJVLpnNn3fl+t
	 IK56/zw+d26WYAQMpPK8gYdt93tyLxvgOmNSn2yLiT83z7st5TGKgq2QYTGSXD2ijUOSv
	 ACZL3LOXc9KtqTS3gndPHP8PZEEPDHvigztKS3lTew3SuVq+hkdc/6sacBoBV3hvqh3m0
	 XSfUNjuQs1fBOM377IWwSAsNUd+gp18vdzTQslS6qjuQyI/N3epCF3lbOXRJByX1runC6
	 5odoHKZEfgWzjxXXSdeiBuIxB4gYCSI8lGoRS60YUSKZ2vyYrJPa5xsm9n8NZyMNHzA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788581018;
	bh=7inwF5VCGuLMBRZjZgmGCi6Gt7mOUiET4fJqvzzvn1I=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gOIehcsxS+NDJntom/uttiKwPT45pRCSLAJw/5H+rPjVgt/qtP2DgdjJ9CcO/PM6t
	 rxtAmB6fr1u6FArK7pzoPB5X6oBYTYNFR3/TJP8SVvtHResJYiGKsZQ+h/MUWTT05x
	 Pt2JhRNfYQSrF5JqpMMOtbWdBUP6cx52YWXLIPyfUrDPQpRFPEsVKRt50W++ZVi2Eh
	 HQ7U11fSWg1fQn1QAD5A2ih2RSquZicHbNEQH8ixNl51ov+flScoNoL0PjkfJRW7O1
	 BEwFl5Gm2xUeof7D4mWKslYXQV16q1jUifJQoXHvtf/pR7OOeSbl1FrnC+GqqAsK6y
	 djV1kXPt/wblg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1294D60C01;
	Sat,  5 Sep 2026 04:03:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9816B1134
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 04:03:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7DD7D81099
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 04:03:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eTuihj4MmMha for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 04:03:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org BCFBF80FE8
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a01:4f8:151:30a2::163"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788581013;
 b=I0ZzHRMzjpgJ9awFwEvbrycksFB694gUHO+C2Xqd6skcDxTuNofvWf1L5JAczYRRMm+6
 GcUlOxGOfh2Aq0BkPTpw4IXbMy2XXfcy2+r5mLbpqxXdleJHbx0kNY7vJBgvYrGQpELJe
 eHfOlRq8yas72WCN7HA/OcVV21iy1Vnk8n1gvPUgH5WJ/CqBU0XU33pDAXo7lED4dpN35
 DUT5U/XBnv8XcXhUloZsZXXKCPpQ7/5W6evydkzmtHX8bk7D43OeG4hJsl8aLxS21H+kG
 GqmnU482XH0OXKoSBwKLbgR9cLyahfS99nZvaBQJBDG43dhRX+GIG+fE+Tepcj+RnAw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788581013;
 h=Received-SPF:DKIM-Signature:Received:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Virus-Scanned:X-Virus-Status;
 bh=HiJWXu9cpkElR7lGcyPSznnucxMmQqRnZ77jDwp/Tuw=;
 b=CJ3S71FubG1Zt6trXTxp+e+7PAE3ogCT3Bt667EEYdwwEz2AowwOEkN8OG0+7NxsiBF5
 Bya4Bmcm6ZfPGTMRJnGL/AHwECFCLAKtqg2JYtHGCPm4herELMdzxAsoW8sqV8F2MOVsS
 ypxunhpYyK5VPbchs7/H27PJGr2YEg18fxli9SpxuBhor6jhjfpe2S2HS7wq/0AvAwH8I
 YQC6DAzODkNqdYR0iOnngZA+eTvVE/jdM4RLmv2wwxeTkni1fwz5V2HFXg284bPXiujT5
 V2zJscj4QVIYfI0jJWWqnk7IST+nIXuobOX7jLDRGran0IJkHQXyStMYKvu7orwBqKQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=none header.from=umbiko.net; 
 dkim=pass header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=hDIOXYal; 
 arc=none smtp.remote-ip="2a01:4f8:151:30a2::163"
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:151:30a2::163; helo=serv15.avernis.de;
 envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=umbiko.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=umbiko.net header.i=@umbiko.net
 header.a=rsa-sha256 header.s=mail header.b=hDIOXYal
Received: from serv15.avernis.de (serv15.avernis.de
 [IPv6:2a01:4f8:151:30a2::163])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BCFBF80FE8
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 04:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=umbiko.net; s=mail;
 t=1788581009; bh=BDbShlZDrH7juAbKMbutRHXLTTi+Eo1t1BKL86Kz9ew=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=hDIOXYaloxEYBIBx1OrCrWd/mXhwQ2ciXfFiUbY1+q4rfeF42NIxPPXh7GvrsnaG1
 rbI4nOYDE1S63PG3AEcie6Jxjck9w/EpO+/DCEU6+SVsXycVuUqq1y4YUfOL/iyWRr
 89hJaJYQJQj1RYCY6cwZsQoayT3Rvjx1Yhslgs+E=
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 3BD50BDE22A5;
 Sat, 05 Sep 2026 06:03:29 +0200 (CEST)
From: Andreas Ziegler <br025@umbiko.net>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>, Andreas Ziegler <br025@umbiko.net>
Date: Sat,  5 Sep 2026 06:02:53 +0200
Message-ID: <20260905040256.2221199-3-br025@umbiko.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260905040256.2221199-1-br025@umbiko.net>
References: <20260905040256.2221199-1-br025@umbiko.net>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
Subject: [Buildroot] [PATCH v4 2/2] support/testing: add runtime test for mpd
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

The test determines if mpd was started by the init system by querying
mpd status via the built-in protocol and evaluating the result.

Signed-off-by: Andreas Ziegler <br025@umbiko.net>
---
Changes v2 -> v3:
	simplify test to be used without test data
	remove mpd.conf rootfs overlay

 DEVELOPERS                                    |  2 +
 support/testing/tests/package/test_mpd.py     | 49 +++++++++++++++++++
 .../tests/package/test_mpd/busybox.fragment   |  4 ++
 .../test_mpd/rootfs-overlay/root/test_mpd.sh  | 35 +++++++++++++
 4 files changed, 90 insertions(+)
 create mode 100644 support/testing/tests/package/test_mpd.py
 create mode 100644 support/testing/tests/package/test_mpd/busybox.fragment
 create mode 100755 support/testing/tests/package/test_mpd/rootfs-overlay/root/test_mpd.sh

diff --git a/DEVELOPERS b/DEVELOPERS
index 53104cc60b..409e8fcaaa 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -205,6 +205,8 @@ F:	package/qt6/qt6opcua/
 
 N:	Andreas Ziegler <br025@umbiko.net>
 F:	package/mpd/
+F:	support/testing/tests/package/test_mpd
+F:	support/testing/tests/package/test_mpd.py
 
 N:	Andrey Smirnov <andrew.smirnov@gmail.com>
 F:	package/python-decorator/
diff --git a/support/testing/tests/package/test_mpd.py b/support/testing/tests/package/test_mpd.py
new file mode 100644
index 0000000000..4ce297c2b8
--- /dev/null
+++ b/support/testing/tests/package/test_mpd.py
@@ -0,0 +1,49 @@
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
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_LATEST_VERSION=y
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
+        BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="{}"
+        BR2_PACKAGE_MPD=y
+        BR2_TARGET_ROOTFS_INITRAMFS=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """.format(rootfs_overlay, busybox_fragment)
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        kern = os.path.join(self.builddir, "images", "bzImage")
+        self.emulator.boot(arch="x86_64",
+            kernel=kern,
+            kernel_cmdline=["console=ttyS0"],
+            options=[
+                "-M", "q35",
+                "-cpu", "Westmere",
+                "-smp", "2",
+                "-initrd", cpio_file,
+                ])
+
+        self.emulator.login()
+
+        self.assertRunOk("/root/test_mpd.sh", timeout=30)
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
diff --git a/support/testing/tests/package/test_mpd/rootfs-overlay/root/test_mpd.sh b/support/testing/tests/package/test_mpd/rootfs-overlay/root/test_mpd.sh
new file mode 100755
index 0000000000..4cc6895602
--- /dev/null
+++ b/support/testing/tests/package/test_mpd/rootfs-overlay/root/test_mpd.sh
@@ -0,0 +1,35 @@
+#!/bin/sh
+
+mpd_command() {
+	mpd_result=""
+	mpd_state=""
+	printf "Execute %s" "$1"
+	while IFS= read -r line; do
+		case $line in
+			OK) 						mpd_result=$line ;;
+			OK\ MPD*)					mpd_protocol=${line##* } ;;
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
+	export mpd_protocol
+	export mpd_state
+}
+
+test_mpd() {
+	mpd_command "status" || return 1
+	printf "MPD protocol version: %s\n" "$mpd_protocol"
+}
+
+# run main function if invoked from a subshell
+[ "$0" = "-sh" ] || test_mpd
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

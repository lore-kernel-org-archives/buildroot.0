Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB547C624D3
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 14:12:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 655038096A;
	Sat,  5 Sep 2026 14:12:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z5Jf57kfOwFp; Sat,  5 Sep 2026 14:12:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9C59F8087B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788617567;
	b=NZYaS7SpOVTcuGC2A5bisrLVKfd5NN7lSXMdCWOiDvdFmQvsmdKy3B5KC3dAAycBjrsp
	 6nH/klYQPTB458Zqq/K0ohHksJjyC0jgZ6EWLNN+Nbct19tlvrztn/LtdqkfAkq4LePm/
	 LKc6GsTE0qL3IRa8PLtBzSV1owzr6BIaNST0B07fGyvyM2G1FS0FpGKnTh8ZeEKDAgmhe
	 mUyxQrpmGOpwSYgt5ZZEzUe///saHcvYK1SQj5VG0NH9v4a/K/LPC+OF6OHjohrSsHTGY
	 dSfkexXLQGx5MqqfYzP3oOo/TW/EuHGKDbsyozRM5C618YUawbdM8kycWOCMLJv7AXA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788617567;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=rtfeBtCjpprjeYRE4Fqq0FiXauuNdtKOgeXGR3AKArE=;
	b=aPxFoOUhjdSq3Pce+QZ+g39joX6FZHpCZoRLw5TFQmj5DOYzgQDF5+qiWy6SWI/WlDBa
	 4V+qtArnqp/iUn/gXZSpfnSfT25USM2yXQIODGM3QeCSRmli9Lsf+GaS5GL100eEDkGVe
	 6OjNSWY9wQhYd0ZjvQa+L08GmN7qUPwkemVN50RWK3Afk6cvA00YCQgtvsyVNf91sSVgp
	 4dO+w4FElcoO0eoKmGabFmhgnn4I3oQKwtRX94EZkHpa3vR5ckM+C7LyeNtwdLnK1mlgy
	 +OyR/MmzCyF2jmxmd1wqEyNz1dBNvAGu5vc/jfkkXtR3CCUMrnu3xqzwgraSmcwxU/g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788617567;
	bh=rtfeBtCjpprjeYRE4Fqq0FiXauuNdtKOgeXGR3AKArE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QXjlRxKYdTN0BwoOATMKkHmXtCSRjyVH571nH7kzReYT5930OXpUoelIdVnSjPgXm
	 93wtQiOWQitWHS8jC7UXb4KzQUxXgL6ch3dh6G58WNyKhugUenzx4+53uBlm/+/cw0
	 ZfweeFotXpNUMVYl+xRK2h+2HcDQowuwPttyMKE572OpgXQSoLkg+lX+G6fcLo6g7D
	 c6t7lASlcahdkT/KVIXWudmrsIMO+HnWMlXUc69CvWlo8njTfbw9IB9wO+aI0d6loc
	 MrphM0hrzs9NVnkEfztpmbD+CpRsH4ollwt4aNTFF3w9aVNg0j+ujYQF4HKVuAsFiy
	 +TQHlpzNFozMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C59F8087B;
	Sat,  5 Sep 2026 14:12:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F4A549D
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 14:12:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2114F6060C
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 14:12:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Prv5Gb7qg4Vj for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 14:12:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7317560606
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788617565;
 b=Q7hIU9G8LsgNaZ5hrN84bQ1hF/S92PDGVXkSPK+owz0RHujKMft4NijH8myuVJukauCe
 pit/bTDiP6oXOR1PqbGWL0iiq5dqRf64cloLexQhuJKBGbCqiOoqsNxqdUcP1e/GeCZH/
 U5UWweNDoF4cx5IIkkNDiqhJlgYGG6K8oroqUYjpvLI27eYzHv8O/SawzfqoGF5P9kDZc
 dwT8qTACNCkaN6heHt0JL59HMhFyD66UrN9qZwLCUs45aeBKyH22EQ6+iGrWJ5SazlEYL
 8vy2O+a5a2YQhD5ty1crS9Ha7ngfY3DMDsz9biFSK00gP1nR1w0ZB0zXeDOfAUV48+g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788617565;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=B/YfTsvWRIHzueaD1/7N5oNAjyKPhh/e6oQNIJ6isqM=;
 b=CnJ5e/76bAMTwzI0+O6Qj/qfaf+1wdQT5y39nmssUTO0KiBHhZLcsI0fkJBKpYL0SmBe
 CLVJpUcKDbvGXZfzByQu4woqmS/bjwRawKqARA+y1cAyLU4/PpS9swI0FULP3WPgayyM/
 An6RfO5J4J0jXRIvBhIcvjQLkSrIPRimzOjoU1X+vOGj7l+XYPSRG/eFnLrWJA/ZDOYgU
 v1IFKbKo0TkpB/5z9ciuTuZIZ5j0zsNg5UNBayYobzutN2EAtuRDK9L8LOhyfp6CE0Ydq
 GBvO+LBg1U+rSxrgeOLAfEizp+BA/mUCUddttl8zfpIMg94R7Af56GWLn18F/6UoyaQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7317560606
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 14:12:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 680DB934CF; Sat,  5 Sep 2026 14:11:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Sep 2026 16:06:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 967380b3166d67e749335ce31a1af071390c3a75
X-Git-Newrev: 0e631348db15df28d5b576c17097a3ea8a38387c
X-Patchwork-Hint: ignore
Message-Id: <20260905141144.680DB934CF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add nano test
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0e631348db15df28d5b576c17097a3ea8a38387c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Add a basic runtime test for nano. The test attempts to write a file
using the editor.

Signed-off-by: Franciszek Stachura <fbstachura@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                 |  1 +
 support/testing/tests/package/test_nano.py | 41 ++++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 48b1a4fb1e..1fd93b1de5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1170,6 +1170,7 @@ F:	package/ser2net/
 
 N:	Franciszek Stachura <fbstachura@gmail.com>
 F:	support/testing/tests/package/test_memcached.py
+F:	support/testing/tests/package/test_nano.py
 
 N:	Francois Dugast <francois.dugast.foss@gmail.com>
 F:	board/sipeed/licheepi_nano/
diff --git a/support/testing/tests/package/test_nano.py b/support/testing/tests/package/test_nano.py
new file mode 100644
index 0000000000..c1cc56d031
--- /dev/null
+++ b/support/testing/tests/package/test_nano.py
@@ -0,0 +1,41 @@
+import os
+
+import infra.basetest
+
+
+class TestNano(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + """
+    BR2_TARGET_ROOTFS_CPIO=y
+    BR2_PACKAGE_NANO=y
+    """
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        cmd = "nano -V | grep 'GNU nano'"
+        self.assertRunOk(cmd)
+
+        self.emulator.qemu.sendline("nano")
+
+        # send file contents
+        self.emulator.qemu.send("test")
+        # ^X for exit
+        self.emulator.qemu.send(chr(0x18))
+        # y for 'Save modified buffer?'
+        self.emulator.qemu.send("y")
+        # target filename
+        self.emulator.qemu.send("file")
+        # ^M for enter
+        self.emulator.qemu.send(chr(0xd))
+
+        self.emulator.qemu.sendline("clear; reset")
+
+        # wait for prompt
+        self.emulator.qemu.expect("# ")
+
+        cmd = "cat file | grep '^test$'"
+        self.assertRunOk(cmd)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

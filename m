Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CCE4C982C1
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 21:27:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D52E7404EE;
	Wed, 16 Sep 2026 21:27:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rmbTCB2QsPvB; Wed, 16 Sep 2026 21:27:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 08A09403F6
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789594076;
	b=lMVXRKfQj0NuaQTyozaBFZeeF9OCR6CWxMA95i+Lug/gsVoGUCkzbisVvr6TdNJoOIgj
	 dwtPHUlQXg198bV2mSRP6FJxn2IP7kfPX3s+Zfv0GqvYO860gyKCcTIcvPfwqa7vDFZAc
	 iKT7Jx/zH2POonaK2/pYiJlU0Tt9NboQfujqPdPhW9ItM9RO3ByMUXDlIR5mF1OWlYxKd
	 E7AxRNKYaQp2BD7/19uv549bI0TWVAkADrYqlp/C3ARX4eJkssBFHQU5I2PouhPF790+M
	 CIH19nBCgqM0msT8SO/8hcGl18JMqpRpHUiCDO5oURSqG+tgZJ5oibzvd4AIyOnP9ug==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789594076;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=VjSV3yXAxbDwszI3Ly6cK3YkB4bHm5w0bh4VGbGwcx4=;
	b=pbNj8eRObEUMPgyYT3Pcj2kzILb9FF9oV9MnZ5j8LzBqJhJgXHE2Ur9lGjO52Nl6jD42
	 RBfZ3lrwCJi9UnIXcTLV8HhsI2uaCS4KoMGYkdejL9DOS4jNxNbcyRi09Shbc6tBORlaz
	 qx06/tLAqW0WQM0WvFF3mAVvLg7XVoXB3ukQXus85sjmsO58YKVEmRe2MQWcZ0KJHtBUS
	 4e365DSMEpPrKgIUxPF+URb8wqsfUaACKct1fXoxubfE0X/l8wX1s98yO4vQiI3mftyKB
	 1FwtQfZR1lSsUM3gW2FiVqWQpvgy7ATJ+zQV06YFKpNClpLuYMkRMBZFyXRlz3JHk3Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789594076;
	bh=VjSV3yXAxbDwszI3Ly6cK3YkB4bHm5w0bh4VGbGwcx4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=i2MBt3JWvzvGI5bps2KIWVFO1S767FGo4ENtkf4VQU3AjDwJU234I5vxG6T/CMkWM
	 srUmpySv3mxY4qq2wsPe8Lg91QIFHpWdzHKWSaFfZMw0FnBGE+YhiT9aypsx5JQ/fq
	 4lnAREDsPYrQ5PKH4j9an/JJOVEGulnQ2HVsp6Ow6Y/+SRedTgOKkLJTAIttAd01l6
	 AYG6YkfXHz2+VMwMgoSUDUx1VWmXW2h+OdZUCwZu0+YcJXQKaZ0xYgyTfqzUBiatJh
	 eo+sEGzCsXmXuoCdUOcFOIr4CgvV/uvkFNmO4eS4XwV32ZMVrPVv2ywtZh447EHjzK
	 rLJSXhrWwEnfg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08A09403F6;
	Wed, 16 Sep 2026 21:27:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B61C2E3
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:27:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E4B75403F6
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:27:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JOu7Wgkf-Xd2 for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 21:27:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 48A3A403F4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789594074;
 b=YrtbHOODUM9EFWPSVBTeKAg/aXaZlhnIDdmPKTnbNZDxO/eXsaciH5EGNKfyIN8U3CHr
 xt3enHENhHh2IsQTpyG5gtebQyYNtMxp5kNceTnzXk4bdch8mdz6fp8qEdU9dnPBj8Bjm
 brfnYoLtKs4SBXhhEKcC31IalCMocvclkoGsoz5BMAVwDhQwe4hCq8pQwzCcA3kQUE9GQ
 ItIKW6yQordQFKC7H91Q3Ht7B39rxbT0yeCWEZol4B4a53ga9iDBeMnHl2LzX5jDs7ixV
 hB9GBivZ47FpUzhHr0p0KmRaDlflK5HtvGFNjZ4HeNVyDxMCHzoKdPngJg4eb93qgog==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789594074;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=qTpY7VH4al4qav8eA4D+XSq+TZwA1VNKx6qPz9MBCDU=;
 b=eWp7SNOY126bI+d2QZ94HzAG9N2N4aWC1unyIx5XT5N9zvAaT/4HEhxEYKRNMD/Suh8W
 ZZS1T87S1tWVyof1P+SgQgIJL7zFTdrJ9IzSKnt02DV1eokzw2dzaGJFpgK9VRp5VEe4y
 8RybJ6SCbyi2DFEv+jpFRcrkrCVup3xjpc+IVFjD/JFR778xeuum9vObef6PzcKGsWHKA
 YUGpZD6+UTExmYg5pp0JSICkiWuaowMdhh5kJRFj5ic5QRBXXEUXR8BjLMCSzILY3X3JG
 uzudF0sinBorxtZVTLfBiPp0Q1rZ07PSVCV8hLA07GGzWj6QXbLdVdnhAkoIINb2mjA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 48A3A403F4
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:27:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B94C396B27; Wed, 16 Sep 2026 21:26:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 23:27:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ab8471868eaeb7c55b74eb00756c8d5942319daa
X-Git-Newrev: 9f3797e342095235636304364d79d3f5c957087a
X-Patchwork-Hint: ignore
Message-Id: <20260916212647.B94C396B27@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_erlang: new runtime
 test
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9f3797e342095235636304364d79d3f5c957087a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                   |  1 +
 support/testing/tests/package/test_erlang.py | 48 ++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ed59f11309..0a6d4e455e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1907,6 +1907,7 @@ F:	support/testing/tests/package/test_dosfstools.py
 F:	support/testing/tests/package/test_dosfstools/
 F:	support/testing/tests/package/test_dpdk.py
 F:	support/testing/tests/package/test_ed.py
+F:	support/testing/tests/package/test_erlang.py
 F:	support/testing/tests/package/test_ethtool.py
 F:	support/testing/tests/package/test_ethtool/
 F:	support/testing/tests/package/test_exfatprogs.py
diff --git a/support/testing/tests/package/test_erlang.py b/support/testing/tests/package/test_erlang.py
new file mode 100644
index 0000000000..a765cec843
--- /dev/null
+++ b/support/testing/tests/package/test_erlang.py
@@ -0,0 +1,48 @@
+import os
+
+import infra.basetest
+
+
+class TestErlang(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_ERLANG=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv7",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        # We check the program can execute.
+        self.assertRunOk("erl -version")
+
+        # We check can print a message from the command line.
+        msg = "Hello Buildroot!"
+        erl_expr = f"io:format(\"{msg}~n\"), halt()."
+        cmd = f"erl -noshell -eval '{erl_expr}'"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], msg)
+
+        # We check we can exit with a specific code.
+        exit_code = 123
+        erl_expr = f"halt({exit_code})."
+        cmd = f"erl -noshell -eval '{erl_expr}'"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, exit_code)
+        self.assertEqual(len(out), 0)
+
+        # We check we can do basic arithmetic.
+        val1 = 1234
+        val2 = 5678
+        erl_expr = f"X = {val1} * {val2}, io:format(\"~p~n\", [X]), halt()."
+        cmd = f"erl -noshell -eval '{erl_expr}'"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        expected_result = val1 * val2
+        self.assertEqual(int(out[0]), expected_result)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

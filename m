Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 192E0C9830E
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:57:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E290680897;
	Thu, 24 Sep 2026 18:57:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XAn0lvrvskiC; Thu, 24 Sep 2026 18:57:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org DB517809C0
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276241;
	b=UZrLrnMHJ4XRdCMp68jJvuT5KfdDb7WLN4N2DWZqOrv8PcEOUz+R2zyVkb8VpgaAQ9uj
	 ECf2YEJqSmMrs03Xdeko+2pnRqAL6YQd7tuAMA4ERCo1jUY3kpQfYtgQryxE6bbz+1sv0
	 /8+gUdfBDfsopaKnbMiaKYP6XzyS3PyMuavejSkzFVOB7bEDaC9+8V/xfHwRSF8DLLnvQ
	 2ZkrcUmeo0rUtxnvrH/ycFBkO3oXP+Pi6DOCc992XKpkLNzHkuB9WR0mcgSYnAgCIAdke
	 sswpqpz60MdQxEBO2/ukJNwpqxVMSJJNtyw1c+KmwWFJ8g/hG9ZFpodQXFn7xxSF/WQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276241;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=CK6hA2tU8kq5w06BTTD5jpvZ2nsi9D+Nev8vezO37Z8=;
	b=jTTxDsKAyX+9znZO6oYUijj4n6omV+fN+XlYetRj0zxH9x5bqLQCaEbKmro+8PM8UkxH
	 g1sIYG+NTmy9MeQGfTSUiHOOJn9MxembQZvgEj4jJwwt36FfOirL4P9tIlI9UmUGa7ZKe
	 T/jZlvjunGri+pu6tmc+meI1dCwQJYwlrwFOrTixAZcct4DDCcoy5XP3W1M0JUO1s5gg6
	 ZaS92HqUUt1dxVfOcacJqfR3UYrsrJpyD/lHecuS4EJOpsY/rp79easFPSgNe1Ac9BvNp
	 vtwhyf5GoyhcY826xWrhnBQcdApC7wiGIDCBp4v7Rioo2ppzZytjCFUJjdbiMbt1AIA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276240;
	bh=CK6hA2tU8kq5w06BTTD5jpvZ2nsi9D+Nev8vezO37Z8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IvD7muO8vnJYh2fhsFm3tLk1I4iXsoRAcRfcIQ9FZiumTks30Z0Iyeesl+FMsPjiz
	 c36N6ISGVxbAqlsO8fo29o599LUoBcR+9YN0IDLxsnfDtCjCc0Ec4kh4OYU5PyzpUH
	 yrh8RfcOaON2Ioxkh1U6KDQ7cfj0OYTFlMbSa/Cw5NrXU+NKUBOosgqd2kkBsFbPh+
	 nQa5ztbMEWXcv/iDLv1pyc2zk3PyJVOxE8fN0dBmM5O1oT7RbRJi5A+qXAz7YCdn2A
	 TUcrgBVzYz2oWHqmmkBcAmJ8MxN0N74RsdQvM+RVr58UwcaI8GF2+GCKJe/C+vmHf7
	 WQo5mImjJiXnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB517809C0;
	Thu, 24 Sep 2026 18:57:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7098C392
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 555DF40AE4
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gbMhJnqAraz5 for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org CC8DD40AD0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276203;
 b=IaNnzyJ69GqBpND6b3HWRDzCx6YTZzHWQJBJ+0Ve87SOcA95QuGg+Ou0fhT1/BD/hvQT
 gcc6wIH+OElUGmgl6TL/TB7Xv7Gk6l6cMoywjRM9QPhP5Qh9pK2d6qgGgM91Hpad4OYvh
 hXPczL8dk0DMUz+sqZryMlxAU8TClf4eoIqsG0E3B8sjXuYsTZ87KbXYd6jHadGaeGUne
 cOP/GTD/z4FIs6z7OxaVUk/ebNl4qpKOzGAtsb5C1yceO7oXx9bAZj7T6R71gwX4lRmbM
 8XsiP8u+3yK5p8vpMMEmUCt8Y4olP/08UTSj6EZeJCinGcJIhJd/3/zlrseT8MHHCow==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276203;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=5F5Z6KIyNYJ3n4oRySAfZpY+4irVbHYesTQGB6jt/Tg=;
 b=pYuws3fk8P2Gi239AsaWcOz7e7pb0HCpqDd9j53cp9AoJFN20E5+agSU3AK6auHm4O0p
 2oibGRlV3p8GVtqDvp2BQHLurSS3yeSs2ORcfNfu9DRRF/ItzHnb5dMj+OMwjkLMSa3Yn
 BM1UtN7rCwJrShVGxIlmhGfcUonCaIDXPgJ9RHQaqcZgV+pNXHOfqmfH1Rh7ZxjyVOFUM
 LpEeePF1U826nSSK6+B53+iG+HxWt6mjE4n/HFwYDySn+3FJxKwwliVUWf5Z0XKdXyDn/
 mQnBmwClQxQ5PRunSHbpFg2BBDiU7JuBFJRa/GNBQmNY0WIZliRqSoJhS82Qhui12vg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC8DD40AD0
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7016C98383; Thu, 24 Sep 2026 18:55:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:16:02 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 196d433943e33d1535126a43c68bd81fd005f4dd
X-Git-Newrev: 9147fc80287e1adb0769ad235e00c418868521b4
X-Patchwork-Hint: ignore
Message-Id: <20260924185533.7016C98383@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] support/testing:
 test_erlang: new runtime test
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6505367923315469894=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6505367923315469894==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9147fc80287e1adb0769ad235e00c418868521b4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9f3797e342095235636304364d79d3f5c957087a)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 DEVELOPERS                                   |  1 +
 support/testing/tests/package/test_erlang.py | 48 ++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a408fd7bb6..9961893d2c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1834,6 +1834,7 @@ F:	support/testing/tests/package/test_dosfstools.py
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

--===============6505367923315469894==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6505367923315469894==--

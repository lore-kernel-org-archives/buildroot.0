Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA08C98321
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 19:00:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1225F412CD;
	Thu, 24 Sep 2026 19:00:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hkXTBpcm-MwS; Thu, 24 Sep 2026 19:00:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 483D0412C1
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276417;
	b=tNIOx7tWIXx+olrLFjPtBZYlsV6mlxUp252Y1kTPcnMVoUrVAzMDlFrd07LblNbjiaY6
	 z0xToBrWEnqjrxL1tcrJw+VsAtwyBVsk1BXnAmU0LfbwJeysAEFRw8PyMRlu6zksqfGtO
	 Mcxg8gbaOgH3wqkZCOt/YUjvayRr9Llc20DaSY51GQLAjsqxiMUw806eti/bXt8YhBCQv
	 OSdCtduIThSlLVycxbEweOwnwYMKOIKnxlw/yJPByC45Wsu5+xTQ/yhOfOgcfpMCEN0BA
	 EvPJ/9aVH1axMrqlGTjtDH9v2IkKH9CkXsvCltCFKFAV07iopDOW5j73AIHQjUhdUKg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276417;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=+zVT99mILdTQuR5+PqQtqyI7RbEhpH7qCfS15kiNmDM=;
	b=TVCxG75xV38GHP7rWaoO+4Na8/0D6YBrjW4GLHVCSdY6uJukrq+uxPsV4YB06H7+FftZ
	 gISoP5PCitFGd6QOdJzURiIK/gM+ZLVQTCYJWK/WgI7Tb8fNFmuo8oYSrRFBemkNqk6Mk
	 HydUbie3bWAx8FMROul9HMol9UGOdoMY7U//3rF5Q+0nM0U0RFOKtW5Xf8qeWOi3nk1fP
	 wsCxnGFsf8YuySwqZTOWPzZtefG4Zffk6ydU3yqmES9Eq80GPtKAg29JwyaIXKPP4bXub
	 NGUkHjMwggLAqJ4CcrF4EOhIgx4PDCtVDY7US6XzmtQSDfsyb/8dkhkW8nt12903v6g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276417;
	bh=+zVT99mILdTQuR5+PqQtqyI7RbEhpH7qCfS15kiNmDM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dEXqZV2zxlkgkJbHMvlONnWMKAD6jFS3vXNuaN7ZrKHHXqhrnJ0IYh8Xx5UdL1W7x
	 e4gmXm3adUpXDsDqahKRKHJh1nWoI3n21bFPCnPZv+KyOk++SN7/VVMB1YRUc5CWBg
	 pIM5BnrdooPuzkatIH2W4iqfOLIgU4iYaghfmLVuibgxPqn8KZcu41dpMNcFiYHbrr
	 Nn5qXEE7JNdOQ6AYD3B6RybZsWIoFfwpFqaCp8CIHRe/vSyXvVCm7vFliET+0vY+4K
	 9iVrpZOGlfJ+BwDXhDpzWzhVQQRbzXulCpwTpFP/qSLTQFiin1wukkXdxLucLyAXaS
	 YgDUcle+TYk/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 483D0412C1;
	Thu, 24 Sep 2026 19:00:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A37A332
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9FBC81248
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TJVV9PUUPaug for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 795798122B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276212;
 b=WRC1IPqMK+42DCArHnxfBGh2Djl/utpxUt2qsLbASEfkcNVNzZWd1ccJ4csmpa6QXkeY
 y8YKGwzE27JOQcu3VaGbG8iKlt/qUEDp0j3iKqPMPm2dbbyuncw2JEwu9DEG9jhVK+ZPx
 RFAk8k06x57NR3Z0Xh1W3zZ8ldO9wHpwZ8bgEb0V3HM1pYsy6DMPPhrdt9VPfdriAhjzN
 9+oxFAbL4hj6emDyJr9TOTTbETpLr8qNNNChWF9WHCjHyGep5YyIeUV9mpO8Qyrk5zSIy
 hdJLsLApWHvUFSRjN+Rbe8I6TD9o/1TrGmnRbecAD+Z+WQ3pxcHBNBq8OYXF+tT3Bgg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276212;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=TXmAIPdTmuNqQZ99eq4Pbtwz+31CmTEzhmraMvodTkk=;
 b=BfndcOhD7XDe/nEhueHqlBjyKY0q345juEZKKIs0Cx6cQTFrAUfGvm2iwiAht1sWf53w
 lWzzpVLnJ4yYM4u4VN92OB+MlbDvZCu14rfCEqIwp+S0MVkxAH1qNEgKTWFg0QvvY8k4b
 6QBP6LCQWT6KRbmhytCGMmG+7q75tf+AtoHEQEP9u1zTPZtxyZAUgmeIwlRn8Q+LmI+9y
 n2fwO0Sgo4mZl3A8mQd6PcyY3sZxR7C4P5v4cvnC7YLAr8vfs11AOMm5NSWa9PsRqOCkU
 10P8KjwTj62MVMxtwKhtiIr+7YEGtqOA5fMoqPDZDGAHTdUkVt4KyQgeD5/iLF13vwA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 795798122B
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1D44A9835A; Thu, 24 Sep 2026 18:55:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:16:04 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: e128c5657cb210bfe4773ca26a31b2a780940f35
X-Git-Newrev: 31260954c4403b34d0aa5a09d17edebc3174952a
X-Patchwork-Hint: ignore
Message-Id: <20260924185542.1D44A9835A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] support/testing:
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
Content-Type: multipart/mixed; boundary="===============5980020277010843574=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5980020277010843574==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/31260954c4403b34d0aa5a09d17edebc3174952a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9f3797e342095235636304364d79d3f5c957087a)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 DEVELOPERS                                   |  1 +
 support/testing/tests/package/test_erlang.py | 48 ++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3eb067dcb7..fc50cd4f8f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1906,6 +1906,7 @@ F:	support/testing/tests/package/test_dosfstools.py
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

--===============5980020277010843574==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5980020277010843574==--
